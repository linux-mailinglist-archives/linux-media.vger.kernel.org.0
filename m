Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD1E60520
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 13:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfGELKc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 07:10:32 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:43759 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726523AbfGELKc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jul 2019 07:10:32 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id DA17A4E0;
        Fri,  5 Jul 2019 07:10:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 05 Jul 2019 07:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=nQYBJ1B/AJJszdFHiR5ywE1fsoxNnBJOPcHJaul0NXY=; b=jLaAM+dR
        Mzhm2nm4UYObr/c9M0ZVkTJhQva76oPMmtiUMSPQ/AOggwHspRQRmJBlDNH0hZbm
        PorpkHmUP4/ylxeWSUCcNzkzPfcY9E46Z0jvhohPu6KLO8kLjUBU/DKIfz+wO/cL
        Ui53sy0VCub373fPMUq8m1zfVIFcLP53yXjFJae/P7IL5zLfTJPkhbubXZAPFCpk
        ONCH4x+2GvaMzVo71ayJNLc9x7YRApdYG6i7yJUnuaC4jSaAIeAAvzhArlMv0Vgz
        3mZ6P9Tsovq80EDKhcP4AkSEUedvpf/erc4zu8nuNB5TI6IoG74cSN0MXDEAu6Ik
        gS3Gvjzr4sSH+Q==
X-ME-Sender: <xms:JTAfXboAnAmxTv8HFxtBhUacud83YJ7w5i-f3DK40ELlNrYHPjYeog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeeggdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepgfgughgrrhcu
    vfhhihgvrhcuoehinhhfohesvggughgrrhhthhhivghrrdhnvghtqeenucfkphepfedurd
    dvtdelrdelhedrvdegvdenucfrrghrrghmpehmrghilhhfrhhomhepihhnfhhosegvughg
    rghrthhhihgvrhdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:JTAfXTmzxI1C547PEyiClO5ifo67xKjikmBw_Rapapx0hVMaaiLCjA>
    <xmx:JTAfXajGwrPmSdy8VH_wSKEYwypQ6YOti0-iYZDZqwsK8lxyBbdr-w>
    <xmx:JTAfXTfgDKRUydDShCoQFyp1vdz8Rmij1cSumZhd7bq3wB48e8wwvw>
    <xmx:JjAfXSqaoTB3iEJVRZqlk_QFt1LP9rCWknyhdGrdnQC_o4uiYPEa-g>
Received: from localhost.localdomain (unknown [31.209.95.242])
        by mail.messagingengine.com (Postfix) with ESMTPA id 28E6D380085;
        Fri,  5 Jul 2019 07:10:29 -0400 (EDT)
From:   Edgar Thier <info@edgarthier.net>
To:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi
Cc:     Edgar Thier <info@edgarthier.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH 2/2] uvc: Add 12-bit raw bayer linear packed formats
Date:   Fri,  5 Jul 2019 13:10:26 +0200
Message-Id: <20190705111026.29758-1-info@edgarthier.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705110723.29685-1-info@edgarthier.net>
References: <20190705110723.29685-1-info@edgarthier.net>
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

