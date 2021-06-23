Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39B23B1625
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 10:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhFWIsf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 04:48:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:56354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229833AbhFWIse (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 04:48:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BB30610C7;
        Wed, 23 Jun 2021 08:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624437977;
        bh=8jQkB37uqAWt6krV1hPvPNgUzkw9Mnx+hbQaVHHdTR0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZIp6rWO1wD0wYjQQAfNePphA2Hhmt0s0a5P2dttG2ktVcZjjIe2OOtlmGjYU4+/6L
         E5lhYFQ7BRVnM9eUtw5uqse3OzkYU7+sjzr8TIdZ0Y4G6qlLB/jmE1V6KW1Yur1YR/
         Kky1sXOexGQ6ZDi79CQ3jW+c62dj7MTEJzu3eFB4/SGBSm+mlACDREASL6pOCYrkmJ
         kc8P4P3EUwnhNNO8NtLeqpkoNhcU9j8fE6TiirgYrJ3XBe2O3JJnxQCR7AtrCuJurt
         RZV6kuOVwPoyDTFswUsGRxDaIM+Z/3D0P1H09eOPUEQ9TFr6MA1wrMoU1BT1Ibs+jn
         z9T/2j61obCYg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lvyWV-0001s0-Rn; Wed, 23 Jun 2021 10:46:15 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Antti Palosaari <crope@iki.fi>,
        Eero Lehtinen <debiangamer2@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/2] Revert "media: rtl28xxu: fix zero-length control request"
Date:   Wed, 23 Jun 2021 10:45:20 +0200
Message-Id: <20210623084521.7105-2-johan@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623084521.7105-1-johan@kernel.org>
References: <20210623084521.7105-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit 25d5ce3a606a1eb23a9265d615a92a876ff9cb5f.

The patch in question causes a regression and was superseded by a second
version. Unfortunately, the first revision ended up being applied
instead of the correct one.

Link: https://lore.kernel.org/r/YL3MCGY5wTsW2kEF@hovoldconsulting.com
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 83705730e37e..0cbdb95f8d35 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -612,9 +612,8 @@ static int rtl28xxu_read_config(struct dvb_usb_device *d)
 static int rtl28xxu_identify_state(struct dvb_usb_device *d, const char **name)
 {
 	struct rtl28xxu_dev *dev = d_to_priv(d);
-	u8 buf[1];
 	int ret;
-	struct rtl28xxu_req req_demod_i2c = {0x0020, CMD_I2C_DA_RD, 1, buf};
+	struct rtl28xxu_req req_demod_i2c = {0x0020, CMD_I2C_DA_RD, 0, NULL};
 
 	dev_dbg(&d->intf->dev, "\n");
 
-- 
2.31.1

