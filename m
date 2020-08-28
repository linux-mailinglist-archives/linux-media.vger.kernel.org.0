Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C404925534D
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 05:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgH1D2I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 23:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbgH1D2H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 23:28:07 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9E1C061264
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 20:28:07 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id 196so3549050qkn.6
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 20:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=ORQQrai+waNrrhwhsAme/r1PAJEP7BzReK5WVukrvc4=;
        b=MKucOnW4E2cMTEWSth1rsh5E44okHVLgOeygOdrXfMUk2pi46PEF0+AN56uDVk/xh/
         y1EAnkUilPyj5044al8/ccs5/5iDCD7acEQLGxXtH36hJhjVKkHugR/Zx1f6rXmYGnoc
         vYZVRiuQGFB7FxeKnQACelrP/UMNEFYaBET/vHBmL1KxDEIg3sY4xP74/S96L1bZ5Yv2
         E8UXtwSKhku72DYppMMKBVoouzvG0m3lESSYvSI46iroKaU2vIMnk/ReX3JPI/eu6V/g
         WlQ1u3iqXghbepQxIAbAbq2/S1C28UqWX3tDEdfxTa5DcWh2b0x4V5Bat149uEPIe2gJ
         jy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=ORQQrai+waNrrhwhsAme/r1PAJEP7BzReK5WVukrvc4=;
        b=TqFdv4wA5L9Wu+69Pqe92D6RKwZl5Poz8nBgZgdj03uhM7bFQQg0PWKTgt/R9+aIPA
         0D5aOxFmy/kqT85EqMCkT1N5RElQagq1FSD+U16ZA3+guG76AENA+GgUzLhZBOSwpsXd
         79EDV7BYISjQQ6vix6+EZwGslJHYWlvvlg4TDVINJ5L9tASWm4+XUHgh+HvtmkxwyENt
         IobiHbxeEvVpnN3rJ/m7NB+ylGN5pRLxu98442p2XygR5NIXH7p6lJ7f780sOFRBnZu6
         paLAoKPQlxGB+yx0FvnG+fsq/+35EM+cyGzBxzvKKu/TukHRaBRc/z9APY4t+rZ3UOTq
         skwA==
X-Gm-Message-State: AOAM530Gc15MYbN8wG5eQi71pN+FTG6KS5vA4LIOzfYOoTuHhvXjycIj
        BH9RpYf6le3btfSusH1/c4hyh1t2GKg=
X-Google-Smtp-Source: ABdhPJzxycN9WDHCwsMz4KUISb6Vr2Sv9xAC9aAerSx4C4mchcNu3UPZFiX8KYTRKhQkfdgMlfOjbqG/z4Q=
X-Received: from christoph.c.googlers.com ([fda3:e722:ac3:10:14:4d90:c0a8:1fe1])
 (user=agoode job=sendgmr) by 2002:ad4:4bc5:: with SMTP id l5mr21386132qvw.95.1598585286457;
 Thu, 27 Aug 2020 20:28:06 -0700 (PDT)
Date:   Thu, 27 Aug 2020 23:27:52 -0400
Message-Id: <20200828032752.3229698-1-agoode@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH v2] media: uvcvideo: Convey full colorspace information to V4L2
From:   Adam Goode <agoode@google.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Adam Goode <agoode@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Color Matching Descriptor has been present in USB cameras since
the original version of UVC, but it has never been fully exposed
in Linux.

This change informs V4L2 of all of the UVC colorspace parameters:
color primaries, transfer characteristics, and YCbCr encoding.
videodev2.h doesn't have values for all the possible UVC color settings,
so it is mapped as closely as possible.

Additionally, this patch overrides the default setting for quantization
for UVC MJPEG. By default, V4L2 assumes that MJPEG is full range encoded,
which is not correct for UVC.

JPEG itself does not specify YCbCr encoding information, this is
left to some other metadata. For typical JPEG images (those that conform to
JFIF, see https://www.w3.org/Graphics/JPEG/jfif3.pdf), the colorspace is
specified as YCbCr CCIR 601 with full range. The use of this variant
on the 601 standard in JFIF is the reason that V4L2 defaults to full range
for JPEG.

A JPEG image isn't a JFIF unless it contains an APP0 tag with 'JFIF', and
the UVC standard is clear that APP0 is optional for its MJPEG payload.
It does not mention JFIF at all. Moreover, it provides color metadata
in the Color Matching Descriptor, all using limited range as of UVC 1.5.

Note that web browsers such as Chrome and Firefox already ignore V4L2's
quantization for USB devices and use the correct limited range, but
other programs such as qv4l2 will incorrectly interpret the encoding of
MJPEG from USB cameras without this change.

Since there are many YUV and non-YUV formats supported by UVC cameras (but
not mentioned in the official specifications), and the quantization is
also not specified for these formats, I am not changing that behavior: all
formats besides MJPEG will stay at V4L2_QUANTIZATION_DEFAULT as before.

Signed-off-by: Adam Goode <agoode@google.com>
---

Changes in v2:
 - Apply quantization override only for MJPEG.
 - Provide more comments and background information about JPEG vs JFIF.
 - Explain the substitutions for xfer func and ycbcr encoding.

 drivers/media/usb/uvc/uvc_driver.c | 87 ++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c   |  6 +++
 drivers/media/usb/uvc/uvcvideo.h   |  6 ++-
 3 files changed, 94 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 431d86e1c94b..4e530a4bf976 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -248,10 +248,10 @@ static struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
 	return NULL;
 }
 
-static u32 uvc_colorspace(const u8 primaries)
+static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
 {
-	static const u8 colorprimaries[] = {
-		0,
+	static const enum v4l2_colorspace colorprimaries[] = {
+		V4L2_COLORSPACE_DEFAULT,  /* Unspecified */
 		V4L2_COLORSPACE_SRGB,
 		V4L2_COLORSPACE_470_SYSTEM_M,
 		V4L2_COLORSPACE_470_SYSTEM_BG,
@@ -262,7 +262,61 @@ static u32 uvc_colorspace(const u8 primaries)
 	if (primaries < ARRAY_SIZE(colorprimaries))
 		return colorprimaries[primaries];
 
-	return 0;
+	return V4L2_COLORSPACE_DEFAULT;  /* Reserved */
+}
+
+static enum v4l2_xfer_func uvc_xfer_func(const u8 transfer_characteristics)
+{
+	/* V4L2 currently does not currently have definitions for all
+	 * possible values of UVC transfer characteristics. If
+	 * v4l2_xfer_func is extended with new values, the mapping
+	 * below should be updated.
+	 *
+	 * Substitutions are taken from the mapping given for
+	 * V4L2_XFER_FUNC_DEFAULT documented in videodev2.h.
+	 */
+	static const enum v4l2_xfer_func xfer_funcs[] = {
+		V4L2_XFER_FUNC_DEFAULT,    /* Unspecified */
+		V4L2_XFER_FUNC_709,
+		V4L2_XFER_FUNC_709,        /* Substitution for BT.470-2 M */
+		V4L2_XFER_FUNC_709,        /* Substitution for BT.470-2 B, G */
+		V4L2_XFER_FUNC_709,        /* Substitution for SMPTE 170M */
+		V4L2_XFER_FUNC_SMPTE240M,
+		V4L2_XFER_FUNC_NONE,
+		V4L2_XFER_FUNC_SRGB,
+	};
+
+	if (transfer_characteristics < ARRAY_SIZE(xfer_funcs))
+		return xfer_funcs[transfer_characteristics];
+
+	return V4L2_XFER_FUNC_DEFAULT;  /* Reserved */
+}
+
+static enum v4l2_ycbcr_encoding uvc_ycbcr_enc(const u8 matrix_coefficients)
+{
+	/* V4L2 currently does not currently have definitions for all
+	 * possible values of UVC matrix coefficients. If
+	 * v4l2_ycbcr_encoding is extended with new values, the
+	 * mapping below should be updated.
+	 *
+	 * Substitutions are taken from the mapping given for
+	 * V4L2_YCBCR_ENC_DEFAULT documented in videodev2.h.
+	 *
+	 * FCC is assumed to be close enough to 601.
+	 */
+	static const enum v4l2_ycbcr_encoding ycbcr_encs[] = {
+		V4L2_YCBCR_ENC_DEFAULT,  /* Unspecified */
+		V4L2_YCBCR_ENC_709,
+		V4L2_YCBCR_ENC_601,      /* Substitution for FCC */
+		V4L2_YCBCR_ENC_601,      /* Substitution for BT.470-2 B, G */
+		V4L2_YCBCR_ENC_601,
+		V4L2_YCBCR_ENC_SMPTE240M,
+	};
+
+	if (matrix_coefficients < ARRAY_SIZE(ycbcr_encs))
+		return ycbcr_encs[matrix_coefficients];
+
+	return V4L2_YCBCR_ENC_DEFAULT;  /* Reserved */
 }
 
 /* Simplify a fraction using a simple continued fraction decomposition. The
@@ -533,6 +587,29 @@ static int uvc_parse_format(struct uvc_device *dev,
 
 		strscpy(format->name, "MJPEG", sizeof(format->name));
 		format->fcc = V4L2_PIX_FMT_MJPEG;
+		/*
+		 * JPEG does not define a color encoding and relies on
+		 * external metadata for this purpose. The most common
+		 * metadata for this in JPEG is the JFIF
+		 * specification, which defines a full-range variant
+		 * of CCIR 601. Because of this, the default
+		 * quantization for JPEG images in V4L2 is full range.
+		 *
+		 * But while most JPEG files are JFIF (identified by
+		 * the presence of an APP0 tag starting with 'JFIF'),
+		 * MJPEG frames from UVC are typically not. The MJPEG
+		 * UVC standard declares APP0 tags as optional and
+		 * makes no mention of JFIF.
+		 *
+		 * For UVC MJPEG, the color encoding metadata comes
+		 * from the Color Matching descriptor, which uses the
+		 * standard limited range YCbCr encodings and not the
+		 * variant JFIF full range encoding.
+		 *
+		 * The default for JPEG in V4L2 is full range, so we need
+		 * to override the default here.
+		 */
+		format->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 		format->flags = UVC_FMT_FLAG_COMPRESSED;
 		format->bpp = 0;
 		ftype = UVC_VS_FRAME_MJPEG;
@@ -704,6 +781,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 		}
 
 		format->colorspace = uvc_colorspace(buffer[3]);
+		format->xfer_func = uvc_xfer_func(buffer[4]);
+		format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
 
 		buflen -= buffer[0];
 		buffer += buffer[0];
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 0335e69b70ab..8795f53a6306 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -253,6 +253,9 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
 	fmt->fmt.pix.sizeimage = probe->dwMaxVideoFrameSize;
 	fmt->fmt.pix.colorspace = format->colorspace;
+	fmt->fmt.pix.xfer_func = format->xfer_func;
+	fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
+	fmt->fmt.pix.quantization = format->quantization;
 
 	if (uvc_format != NULL)
 		*uvc_format = format;
@@ -289,6 +292,9 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
 	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
 	fmt->fmt.pix.sizeimage = stream->ctrl.dwMaxVideoFrameSize;
 	fmt->fmt.pix.colorspace = format->colorspace;
+	fmt->fmt.pix.xfer_func = format->xfer_func;
+	fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
+	fmt->fmt.pix.quantization = format->quantization;
 
 done:
 	mutex_unlock(&stream->mutex);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6ab972c643e3..e49cc671b0d3 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -272,6 +272,7 @@ struct uvc_format_desc {
 	char *name;
 	u8 guid[16];
 	u32 fcc;
+	enum v4l2_quantization quantization;
 };
 
 /* The term 'entity' refers to both UVC units and UVC terminals.
@@ -370,7 +371,10 @@ struct uvc_format {
 	u8 type;
 	u8 index;
 	u8 bpp;
-	u8 colorspace;
+	enum v4l2_colorspace colorspace;
+	enum v4l2_xfer_func xfer_func;
+	enum v4l2_ycbcr_encoding ycbcr_enc;
+	enum v4l2_quantization quantization;
 	u32 fcc;
 	u32 flags;
 
-- 
2.26.2

