Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11B82132CB2
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 18:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgAGRLJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 12:11:09 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:59860 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728466AbgAGRLJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 12:11:09 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iosNn-0000yc-9V; Tue, 07 Jan 2020 17:11:07 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: drxj: remove redundant assignments to variable rc
Date:   Tue,  7 Jan 2020 17:11:07 +0000
Message-Id: <20200107171107.120294-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rc is being initialized with a value that is never
read and it is being updated later with a new value.  The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index ac7be872f460..5de016412c42 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -2182,7 +2182,7 @@ int drxj_dap_atomic_read_reg32(struct i2c_device_addr *dev_addr,
 				     u32 *data, u32 flags)
 {
 	u8 buf[sizeof(*data)] = { 0 };
-	int rc = -EIO;
+	int rc;
 	u32 word = 0;
 
 	if (!data)
@@ -4229,7 +4229,7 @@ int drxj_dap_scu_atomic_write_reg16(struct i2c_device_addr *dev_addr,
 					  u16 data, u32 flags)
 {
 	u8 buf[2];
-	int rc = -EIO;
+	int rc;
 
 	buf[0] = (u8) (data & 0xff);
 	buf[1] = (u8) ((data >> 8) & 0xff);
-- 
2.24.0

