Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E684B61A85
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 08:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbfGHGEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 02:04:41 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:57135 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727218AbfGHGEl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jul 2019 02:04:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id EA42721D;
        Mon,  8 Jul 2019 02:04:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 08 Jul 2019 02:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=nQYBJ1B/AJJszdFHiR5ywE1fsoxNnBJOPcHJaul0NXY=; b=PFMm7VoZ
        PS32wAQjFtQTY+O6v61Mms7Oa6H7ctQtEVC01NFlNHc/6rl4NiZygabgSaluV/BL
        znLWRO2lKdih3Iwm2wWv57UI8SanRw3kmun9J4t/2FA1WgtXrXqloJllovhFVihO
        K23vnYik8BtQTP3BxbLxI6oIRQzs68OM7ux6IyWy5DN+Rkzm8JwEY4Tq8VDtdn9M
        gzfSjGn1E1hGwuGUcaAWtPuaIBfW1UWeDiFQLnvsa9du2dhVO7B35axf6VnmZq2H
        aiFAjXWTcdnyDx/ZgfEUIpOebvfD0lmeH8dm4okNtaJuox7CHlrQVk69vrL7+7Me
        VIiicoL99Xd5yA==
X-ME-Sender: <xms:9twiXaXPMcWHH1Es_WiYzaVgypHFLh9pd08ZHiJKj77xJLk8LgwE5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeelgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefgughgrghr
    ucfvhhhivghruceoihhnfhhosegvughgrghrthhhihgvrhdrnhgvtheqnecukfhppeefud
    drvddtledrleehrddvgedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehinhhfohesvggu
    ghgrrhhthhhivghrrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:9twiXd9nzIZLAR0VqW0283znHygh3WaPKqgwDh5yn97RdFTyvYdNgw>
    <xmx:9twiXYu73lRzkEGlJp3l-gobfuu7gGxMld4NEKdLerZVOeGdOFKwiw>
    <xmx:9twiXXX55MqvQygcDrGG5H2Mr-v42jbjzvhdZcVMPArBCE1qASnZDA>
    <xmx:99wiXecb6axXtSkSOUeSmq48KAYpda7xqPV3qzSD37-wJPSrjWp7Pw>
Received: from localhost.localdomain (unknown [31.209.95.242])
        by mail.messagingengine.com (Postfix) with ESMTPA id 39A81380074;
        Mon,  8 Jul 2019 02:04:38 -0400 (EDT)
From:   Edgar Thier <info@edgarthier.net>
To:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi
Cc:     Edgar Thier <info@edgarthier.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH v2 2/2] uvc: Add 12-bit raw bayer linear packed formats
Date:   Mon,  8 Jul 2019 08:04:31 +0200
Message-Id: <20190708060431.5249-1-info@edgarthier.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190708060225.5172-1-info@edgarthier.net>
References: <20190708060225.5172-1-info@edgarthier.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These formats are compressed 12-bit raw bayer formats with four different
pixel orders. The pixel follow one another without any padding,
thus are packed in a 'linear' fashion.

Signed-off-by: Edgar Thier <info@edgarthier.net>
---
 drivers/media/usb/uvc/uvc_driver.c | 21 ++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h   | 12 ++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 10cfe8e51626..d12298d18406 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -179,6 +179,26 @@ static struct uvc_format_desc uvc_fmts[] = {
 		.guid		= UVC_GUID_FORMAT_RW10,
 		.fcc		= V4L2_PIX_FMT_SRGGB10P,
 	},
+	{
+		.name		= "Bayer 12-bit linear packed (SBGGR12LP)",
+		.guid		= UVC_GUID_FORMAT_BGCP,
+		.fcc		= V4L2_PIX_FMT_SBGGR12LP,
+	},
+	{
+		.name		= "Bayer 12-bit linear packed (SGBRG12LP)",
+		.guid		= UVC_GUID_FORMAT_GBCP,
+		.fcc		= V4L2_PIX_FMT_SGBRG12LP,
+	},
+	{
+		.name		= "Bayer 12-bit linear packed (SRGGB12LP)",
+		.guid		= UVC_GUID_FORMAT_RGCP,
+		.fcc		= V4L2_PIX_FMT_SRGGB12LP,
+	},
+	{
+		.name		= "Bayer 12-bit linear packed (SGRBG12LP)",
+		.guid		= UVC_GUID_FORMAT_GRCP,
+		.fcc		= V4L2_PIX_FMT_SGRBG12LP,
+	},
 	{
 		.name		= "Bayer 16-bit (SBGGR16)",
 		.guid		= UVC_GUID_FORMAT_BG16,
@@ -2924,4 +2944,3 @@ MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
 MODULE_VERSION(DRIVER_VERSION);
-
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index c7c1baa90dea..f5be00fb9a73 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -108,6 +108,18 @@
 #define UVC_GUID_FORMAT_RGGB \
 	{ 'R',  'G',  'G',  'B', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_BGCP \
+	{ 'B',  'G',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_GBCP \
+	{ 'G',  'B',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_RGCP \
+	{ 'R',  'G',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_GRCP \
+	{ 'G',  'R',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
 #define UVC_GUID_FORMAT_BG16 \
 	{ 'B',  'G',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-- 
2.20.1

