Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE96638E588
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232779AbhEXLhP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:37:15 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3646 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232719AbhEXLhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:37:12 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FpZn43JPrzNyhx;
        Mon, 24 May 2021 19:32:08 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 19:35:43 +0800
Received: from huawei.com (10.175.113.32) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 24 May
 2021 19:35:43 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] [media] media: Replaced simple_strtol() with kstrtoint()
Date:   Mon, 24 May 2021 20:08:36 +0800
Message-ID: <20210524120836.1580468-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It looks like that memcpy() is a superfluous operation in
parse_token()/parse_mtoken(). Simple these two functions and
use kstrtoint() instead of simple_strtol() to avoid data
overflow.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-ctrl.c | 25 ++----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
index 9f71d8c2a3c6..8ae3ad80cccb 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
@@ -355,11 +355,8 @@ static int parse_token(const char *ptr,unsigned int len,
 		       int *valptr,
 		       const char * const *names, unsigned int namecnt)
 {
-	char buf[33];
 	unsigned int slen;
 	unsigned int idx;
-	int negfl;
-	char *p2;
 	*valptr = 0;
 	if (!names) namecnt = 0;
 	for (idx = 0; idx < namecnt; idx++) {
@@ -370,18 +367,7 @@ static int parse_token(const char *ptr,unsigned int len,
 		*valptr = idx;
 		return 0;
 	}
-	negfl = 0;
-	if ((*ptr == '-') || (*ptr == '+')) {
-		negfl = (*ptr == '-');
-		ptr++; len--;
-	}
-	if (len >= sizeof(buf)) return -EINVAL;
-	memcpy(buf,ptr,len);
-	buf[len] = 0;
-	*valptr = simple_strtol(buf,&p2,0);
-	if (negfl) *valptr = -(*valptr);
-	if (*p2) return -EINVAL;
-	return 1;
+	return kstrtoint(ptr, 0, valptr) ? -EINVAL : 1;
 }
 
 
@@ -389,10 +375,8 @@ static int parse_mtoken(const char *ptr,unsigned int len,
 			int *valptr,
 			const char **names,int valid_bits)
 {
-	char buf[33];
 	unsigned int slen;
 	unsigned int idx;
-	char *p2;
 	int msk;
 	*valptr = 0;
 	for (idx = 0, msk = 1; valid_bits; idx++, msk <<= 1) {
@@ -405,12 +389,7 @@ static int parse_mtoken(const char *ptr,unsigned int len,
 		*valptr = msk;
 		return 0;
 	}
-	if (len >= sizeof(buf)) return -EINVAL;
-	memcpy(buf,ptr,len);
-	buf[len] = 0;
-	*valptr = simple_strtol(buf,&p2,0);
-	if (*p2) return -EINVAL;
-	return 0;
+	return kstrtoint(ptr, 0, valptr);
 }
 
 
-- 
2.18.0.huawei.25

