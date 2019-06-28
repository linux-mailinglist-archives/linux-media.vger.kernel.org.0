Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D95D259642
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 10:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfF1IlB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 04:41:01 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44711 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726056AbfF1IlA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 04:41:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 9849121FC2;
        Fri, 28 Jun 2019 04:40:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 28 Jun 2019 04:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=Boahgt2sTSqyBNx4hYPr8rRvOBRVbXkS2TgFfKFtCeg=; b=y8eohFz+
        GenzW82kLv5sCLUzHqLlaar5wkSgzBw7Rf1CqKvj1Y6SZy5c26hr0MX6urG2BigF
        E4OyBp1C3KztSuXTdawZFMfpaxv+9SY477CALH4G5UaSTBpQqdTU3/T6ZxijW/xa
        HEIWIsLWO0GeibQnqAQjp4PcJv9I535HVN9rV1BWizbwpwiJ7Q9sLW3IWEK3b9Kr
        0PGHngIMHxtLjmTPEWOHP21B07bVzWVj8JhBlJ6OAnlwfAumv9OX1OyCcSqIOZrD
        3iUancoZ31zkC0lD1/4ke1TPXMZWJhuBLjU9tqeKhlJBHHyLemEw3N6nKiDw/TNX
        KbvcA5o/TjuruQ==
X-ME-Sender: <xms:m9IVXTo4235KF5jXJx47zx1JIIN4WBLM15vgZcxn4vUwTKssMaaaNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrvddtgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepgfgughgrrhcu
    vfhhihgvrhcuoehinhhfohesvggughgrrhhthhhivghrrdhnvghtqeenucfkphepfedurd
    dvtdelrdelhedrvdegvdenucfrrghrrghmpehmrghilhhfrhhomhepihhnfhhosegvughg
    rghrthhhihgvrhdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:m9IVXeKTuZysH3F9Od2cjxgbBeWGF7XUETDq1tP-SqU05-fK8PW1oA>
    <xmx:m9IVXR7toN-gIZ-CVr6E-3AUPnWEpdheMbUs5SH52Lr0ZD8HW52kwA>
    <xmx:m9IVXSQf1_rbILPTdDs2dJbQG2J_8suaayXRuIAhpBVOX8PbBHEmfQ>
    <xmx:m9IVXbIVR1WX73FaVh_IcjDbzhZZ-zbKafS38V4zHdW2Zk8udrfF-w>
Received: from localhost.localdomain (unknown [31.209.95.242])
        by mail.messagingengine.com (Postfix) with ESMTPA id 86D2780061;
        Fri, 28 Jun 2019 04:40:58 -0400 (EDT)
From:   Edgar Thier <info@edgarthier.net>
To:     laurent.pinchart@ideasonboard.com
Cc:     Edgar Thier <info@edgarthier.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH 2/2] uvc: Add Genicam 12-bit bayer packed formats
Date:   Fri, 28 Jun 2019 10:40:49 +0200
Message-Id: <20190628084049.21418-1-info@edgarthier.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628083740.21315-1-info@edgarthier.net>
References: <20190628083740.21315-1-info@edgarthier.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These formats are compressed 12-bit raw bayer formats with four different
pixel orders. They are similar to 10-bit bayer formats 'IPU3'.
The naming and pixel structure follow
the Genicam Pixel Format Naming Convention (PFNC).

The added GUIDs are used by USB-3.0 cameras produced by `The Imaging Source`.

Signed-off-by: Edgar Thier <info@edgarthier.net>
---
 drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   | 12 ++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 10cfe8e51626..e7959fd8946a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -179,6 +179,26 @@ static struct uvc_format_desc uvc_fmts[] = {
 		.guid		= UVC_GUID_FORMAT_RW10,
 		.fcc		= V4L2_PIX_FMT_SRGGB10P,
 	},
+	{
+		.name		= "Bayer 12-bit PFNC packed (BayerBG12P)",
+		.guid		= UVC_GUID_FORMAT_TIS_BAYERBG12P,
+		.fcc		= V4L2_PIX_FMT_PFNC_BAYERBG12P,
+	},
+	{
+		.name		= "Bayer 12-bit PFNC packed (BayerGB12P)",
+		.guid		= UVC_GUID_FORMAT_TIS_BAYERGB12P,
+		.fcc		= V4L2_PIX_FMT_PFNC_BAYERGB12P,
+	},
+	{
+		.name		= "Bayer 12-bit PFNC packed (BayerRG12P)",
+		.guid		= UVC_GUID_FORMAT_TIS_BAYERRG12P,
+		.fcc		= V4L2_PIX_FMT_PFNC_BAYERRG12P,
+	},
+	{
+		.name		= "Bayer 12-bit PFNC packed (BayerGR12P)",
+		.guid		= UVC_GUID_FORMAT_TIS_BAYERGR12P,
+		.fcc		= V4L2_PIX_FMT_PFNC_BAYERGR12P,
+	},
 	{
 		.name		= "Bayer 16-bit (SBGGR16)",
 		.guid		= UVC_GUID_FORMAT_BG16,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index c7c1baa90dea..67115c375f8b 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -108,6 +108,18 @@
 #define UVC_GUID_FORMAT_RGGB \
 	{ 'R',  'G',  'G',  'B', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_TIS_BAYERBG12P \
+	{ 'B',  'G',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_TIS_BAYERGB12P \
+	{ 'G',  'B',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_TIS_BAYERRG12P \
+	{ 'R',  'G',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_TIS_BAYERGR12P \
+	{ 'G',  'R',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
 #define UVC_GUID_FORMAT_BG16 \
 	{ 'B',  'G',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-- 
2.20.1

