Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0D539D62E
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 09:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhFGHky convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 7 Jun 2021 03:40:54 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3079 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhFGHky (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 03:40:54 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fz4r42KKCzWsvZ;
        Mon,  7 Jun 2021 15:34:12 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 15:39:01 +0800
Received: from huawei.com (10.174.179.133) by dggpeml500016.china.huawei.com
 (7.185.36.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 7 Jun 2021
 15:39:01 +0800
From:   Yang Yanchao <yangyanchao6@huawei.com>
To:     <dan.carpenter@oracle.com>
CC:     <linux-distros@vs.openwall.org>, <linux-media@vger.kernel.org>,
        <linux1394-devel@lists.sourceforge.net>, <mchehab@kernel.org>,
        <security@kernel.org>
Subject: [PATCH] media firewire firedtv-avc fix a buffer overflow in avc_ca_pmt() 
Date:   Mon, 7 Jun 2021 15:39:00 +0800
Message-ID: <20210607073900.1298-1-yangyanchao6@huawei.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain
X-Originating-IP: [10.174.179.133]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For CVE-2021-3542:

1、read_pos will be added four times in the patch, 
so use "read_pos + 4 < length" and write_pos as well

2. The last four bits of c->operand are used for CRC, 
so "sizeof (C - > operand) - 4" is used

3. "read_pos+=2" is added after the end of read_pos, so add value (read_pos >= length)

4. In order to avoid memcpy crossing the boundary, es_ info_ length > length - read_ pos

5. When the date_length is a specific input of a construction,it will cause memcpy
 to exceed the boundary, "(MSG - > MSG [3] & 0x7F) + date_ length) > (sizeof(msg->msg) - 4)"

Signed-off-by: yangyanchao <yangyanchao6@huawei.com>
---
 drivers/media/firewire/firedtv-avc.c | 14 +++++++++++---
 drivers/media/firewire/firedtv-ci.c  |  2 ++
 2 files changed, 13 insertions(+), 3 deletions(-)
diff --git a/drivers/media/firewire/firedtv-avc.c b/drivers/media/firewire/firedtv-avc.c
index 3ef5df164..8c31cf90c 100644
--- a/drivers/media/firewire/firedtv-avc.c
+++ b/drivers/media/firewire/firedtv-avc.c
@@ -1169,7 +1169,11 @@ int avc_ca_pmt(struct firedtv *fdtv, char *msg, int length)
 		read_pos += program_info_length;
 		write_pos += program_info_length;
 	}
-	while (read_pos < length) {
+	while (read_pos + 4 < length) {
+		if (write_pos + 4 >= sizeof(c->operand) - 4) {
+			ret = -EINVAL;
+			goto out;
+		}
 		c->operand[write_pos++] = msg[read_pos++];
 		c->operand[write_pos++] = msg[read_pos++];
 		c->operand[write_pos++] = msg[read_pos++];
@@ -1181,13 +1185,17 @@ int avc_ca_pmt(struct firedtv *fdtv, char *msg, int length)
 		c->operand[write_pos++] = es_info_length >> 8;
 		c->operand[write_pos++] = es_info_length & 0xff;
 		if (es_info_length > 0) {
+			if (read_pos >= length) {
+				ret = -EINVAL;
+				goto out;
+			}
 			pmt_cmd_id = msg[read_pos++];
 			if (pmt_cmd_id != 1 && pmt_cmd_id != 4)
 				dev_err(fdtv->device, "invalid pmt_cmd_id %d at stream level\n",
 					pmt_cmd_id);
 
-			if (es_info_length > sizeof(c->operand) - 4 -
-					     write_pos) {
+			if (es_info_length > sizeof(c->operand) - 4 - write_pos ||
+			    es_info_length > length - read_pos) {
 				ret = -EINVAL;
 				goto out;
 			}
diff --git a/drivers/media/firewire/firedtv-ci.c b/drivers/media/firewire/firedtv-ci.c
index 8dc5a7495..0e7ffa156 100644
--- a/drivers/media/firewire/firedtv-ci.c
+++ b/drivers/media/firewire/firedtv-ci.c
@@ -135,6 +135,8 @@ static int fdtv_ca_pmt(struct firedtv *fdtv, void *arg)
 		data_length = 0;
 		for (i = 0; i < (msg->msg[3] & 0x7f); i++)
 			data_length = (data_length << 8) + msg->msg[data_pos++];
+		if (((msg->msg[3] & 0x7f) + date_length) > (sizeof(msg->msg) - 4))
+			return -EINVAL;
 	} else {
 		data_length = msg->msg[3];
 	}
-- 
2.23.0
