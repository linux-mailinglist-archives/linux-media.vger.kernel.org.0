Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7AEF1AE2E4
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 18:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbgDQQ7C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 12:59:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:46064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726778AbgDQQ7B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 12:59:01 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7B772220A;
        Fri, 17 Apr 2020 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587142740;
        bh=ZYO4nKK7iqZr++MuB0R6jSlpq9yRnvkmGE2SuIkaivQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FH2SVtyr+bPl5GUmZP5La33Z+6SoFQIDzLs4AxS4A0f3auTcBp7QU8HCVDfWBdVY5
         o9DNoRx1jossgfaCFsMrRfNpnzyVXf7pcptwbx6mINgCR724OTcr3yyDGrcCUrJO9U
         /rkpoGDy1ul6c/6b3o3R0NEmKsh3cKSEg0j5UGAY=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPUKP-007wLC-1M; Fri, 17 Apr 2020 18:58:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Antti Palosaari <crope@iki.fi>
Subject: [PATCH 02/15] media: dvb-usb-v2: use DVB_USB_DEVICE() macro
Date:   Fri, 17 Apr 2020 18:58:43 +0200
Message-Id: <09390ab55dada375447ed51a2138d7025c4930f4.1587142382.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587142382.git.mchehab+huawei@kernel.org>
References: <cover.1587142382.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using USB_DEVICE() macro directly, use the
DVB_USB_DEVICE() one, as other dvb-usb-v2 devices.

The usage of the new macro makes cleaner and easier to
parse the supported device names in a way that it would
be easily parseable to generate cardlists.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/usb/dvb-usb-v2/ec168.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/ec168.c b/drivers/media/usb/dvb-usb-v2/ec168.c
index e30305876840..7ed0ab9e429b 100644
--- a/drivers/media/usb/dvb-usb-v2/ec168.c
+++ b/drivers/media/usb/dvb-usb-v2/ec168.c
@@ -332,22 +332,17 @@ static const struct dvb_usb_device_properties ec168_props = {
 	},
 };
 
-static const struct dvb_usb_driver_info ec168_driver_info = {
-	.name = "E3C EC168 reference design",
-	.props = &ec168_props,
-};
-
 static const struct usb_device_id ec168_id[] = {
-	{ USB_DEVICE(USB_VID_E3C, USB_PID_E3C_EC168),
-		.driver_info = (kernel_ulong_t) &ec168_driver_info },
-	{ USB_DEVICE(USB_VID_E3C, USB_PID_E3C_EC168_2),
-		.driver_info = (kernel_ulong_t) &ec168_driver_info },
-	{ USB_DEVICE(USB_VID_E3C, USB_PID_E3C_EC168_3),
-		.driver_info = (kernel_ulong_t) &ec168_driver_info },
-	{ USB_DEVICE(USB_VID_E3C, USB_PID_E3C_EC168_4),
-		.driver_info = (kernel_ulong_t) &ec168_driver_info },
-	{ USB_DEVICE(USB_VID_E3C, USB_PID_E3C_EC168_5),
-		.driver_info = (kernel_ulong_t) &ec168_driver_info },
+	{ DVB_USB_DEVICE(USB_VID_E3C, USB_PID_E3C_EC168,
+		     &ec168_props, "E3C EC168 reference design", NULL)},
+	{ DVB_USB_DEVICE(USB_VID_E3C, USB_PID_E3C_EC168_2,
+		     &ec168_props, "E3C EC168 reference design", NULL)},
+	{ DVB_USB_DEVICE(USB_VID_E3C, USB_PID_E3C_EC168_3,
+		     &ec168_props, "E3C EC168 reference design", NULL)},
+	{ DVB_USB_DEVICE(USB_VID_E3C, USB_PID_E3C_EC168_4,
+		     &ec168_props, "E3C EC168 reference design", NULL)},
+	{ DVB_USB_DEVICE(USB_VID_E3C, USB_PID_E3C_EC168_5,
+		     &ec168_props, "E3C EC168 reference design", NULL)},
 	{}
 };
 MODULE_DEVICE_TABLE(usb, ec168_id);
-- 
2.25.2

