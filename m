Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FC02E130C
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 03:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728504AbgLWC1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 21:27:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:57120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730802AbgLWC0c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 21:26:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9949022AAF;
        Wed, 23 Dec 2020 02:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608690352;
        bh=3JzEDSdlPUHADGcCfZQrhJmuQmbiDrqk88eT18lBLfI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DtALJMkZhenXrVptehtAooPI/bltp5NZBp7kdnM+2CVgX20w3aG263xvnS2mZPsVl
         dfhNAxw/OiQnM+559A+eFIJ+6yGEDhj5pZHSqU5e3GKSqGfYAfJlSPeKK776PeHWVk
         7Bb6qFdBogGbLKRCwV5jdWtIA/bfoDq7NEUWLMYXj6p8qxefiDIo5KY+T26Pfm3MlS
         HzJyGmUojTCrRn78P+KKuc7PB+tjmtxa9pn99Xp5koTLIjTXD3/g4HuqYu/pmH5w7V
         7i1P8qi61qtIegI357BxAO8oJ0KUTXpQZzjsJOzngmUnHsiQAm8jJa9W1CEwyCteEA
         YWLJeqyEGx/9Q==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        syzbot <syzkaller@googlegroups.com>,
        Willem de Bruijn <willemb@google.com>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 28/38] media: gp8psk: initialize stats at power control logic
Date:   Tue, 22 Dec 2020 21:25:06 -0500
Message-Id: <20201223022516.2794471-28-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223022516.2794471-1-sashal@kernel.org>
References: <20201223022516.2794471-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

[ Upstream commit d0ac1a26ed5943127cb0156148735f5f52a07075 ]

As reported on:
	https://lore.kernel.org/linux-media/20190627222020.45909-1-willemdebruijn.kernel@gmail.com/

if gp8psk_usb_in_op() returns an error, the status var is not
initialized. Yet, this var is used later on, in order to
identify:
	- if the device was already started;
	- if firmware has loaded;
	- if the LNBf was powered on.

Using status = 0 seems to ensure that everything will be
properly powered up.

So, instead of the proposed solution, let's just set
status = 0.

Reported-by: syzbot <syzkaller@googlegroups.com>
Reported-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/dvb-usb/gp8psk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/gp8psk.c b/drivers/media/usb/dvb-usb/gp8psk.c
index 5d0384dd45b5e..7225ae1905eb9 100644
--- a/drivers/media/usb/dvb-usb/gp8psk.c
+++ b/drivers/media/usb/dvb-usb/gp8psk.c
@@ -163,7 +163,7 @@ static int gp8psk_load_bcm4500fw(struct dvb_usb_device *d)
 
 static int gp8psk_power_ctrl(struct dvb_usb_device *d, int onoff)
 {
-	u8 status, buf;
+	u8 status = 0, buf;
 	int gp_product_id = le16_to_cpu(d->udev->descriptor.idProduct);
 
 	if (onoff) {
-- 
2.27.0

