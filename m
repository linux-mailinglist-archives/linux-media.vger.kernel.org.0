Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1FB924EAB5
	for <lists+linux-media@lfdr.de>; Sun, 23 Aug 2020 03:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgHWBVx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Aug 2020 21:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgHWBVu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Aug 2020 21:21:50 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79ABC061573
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2020 18:21:49 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id i4so3872984qvv.4
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2020 18:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=nTnrJooKy7TUDrlViEZNdZhzQD33+RJwNXs86fj+Oi4=;
        b=LtyJe9zEe4aFdUrbpx5gvtZW8VwWIu1Ey4z+DCRWrNUii4MzPA5CCY7HmdG0sr6yI8
         0sMJwWMmHhCq+y+J1ajXKcTksprW56KaKwNBlmtwWMS7U1YmYvsH/dbsRAsYsMuG1fVv
         azm4l8HLdki9X1no5auZrPqKMF9jbRBoqkMBMjy3R2j2hDf0faHoLZVkEiQkTbLGnEeK
         oIGgOYWLrOEzEC0Ey687VMMjpzAtwOw3hfkbiSRYq+jZsiY8Z2BHcR2GPq2SQRtOhTv+
         7HImWDJJvsWxPdsNDt2uRH2ZmvxR83aSLueKWoXvopdPP/pJSv7ZJXOj5PoDUf//5+nf
         8rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=nTnrJooKy7TUDrlViEZNdZhzQD33+RJwNXs86fj+Oi4=;
        b=obHP6NL8dLStcMKCagQHMhLoilIiYVul2foCqLwd4z5njVWpEosi5z5F/8FpnLzcnq
         hPJ+G+e2qMyrQw87zwofqxxik3I+7dwnnzcX/Dhe89mbPoWLrLgRd3wZSQsa0SYNpxDu
         RD19iNR9wWKaoD9mybfX7WKC2QDQbsaOYZHEnONvcgnm+fHBPqdTPj1KHpT8ytncG2Ei
         ZuJj0slPWr/t6mQIgHVbx9w39XSK43QBxSajF/fxkKCC2x9Cj6hbi72JjJ5bSBOpfRSb
         KoJInj59v9wYS24GJmyuP4dxt79vOxzEhmY8jA1FkMUeoGKjwwtsKcZn9G9dXnv6YDgz
         ZQ3w==
X-Gm-Message-State: AOAM533IFJl1m7JiQe2BOweDF3RHbXowL3LsuOcI3Vx0tNgNA7129ITe
        XN58wqBWH59jVZkT3ClR/tEda6UCnZY=
X-Google-Smtp-Source: ABdhPJw19gDclZo+lqh5NH2S7WusHuyMYZ+1cUd/Ld/pXxR2cDsRCRdlZ5vTILP/qP1XJE+r5zowf234EjI=
X-Received: from christoph.c.googlers.com ([fda3:e722:ac3:10:14:4d90:c0a8:1fe1])
 (user=agoode job=sendgmr) by 2002:ad4:54c6:: with SMTP id j6mr8470868qvx.126.1598145708718;
 Sat, 22 Aug 2020 18:21:48 -0700 (PDT)
Date:   Sat, 22 Aug 2020 21:21:34 -0400
In-Reply-To: <20200823012134.3813457-1-agoode@google.com>
Message-Id: <20200823012134.3813457-2-agoode@google.com>
Mime-Version: 1.0
References: <20200823012134.3813457-1-agoode@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH 2/2] media: uvcvideo: Convey full ycbcr colorspace information
 to v4l2
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
the original version of UVC, but it has never been fully used
in Linux.

This change informs V4L2 of all of the critical colorspace parameters:
colorspace (called "color primaries" in UVC), transfer function
(called "transfer characteristics" in UVC), ycbcr encoding (called
"matrix coefficients" in UVC), and quantization, which is always
LIMITED for UVC, see section 2.26 in USB_Video_FAQ_1.5.pdf.

The quantization is the most important improvement for this patch,
because V4L2 will otherwise interpret MJPEG as FULL range. Web browsers
such as Chrome and Firefox already ignore V4L2's quantization for USB
devices and use the correct LIMITED value, but other programs such
as qv4l2 will incorrectly interpret the output of MJPEG from USB
cameras without this change.

Signed-off-by: Adam Goode <agoode@google.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 52 +++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_v4l2.c   |  6 ++++
 drivers/media/usb/uvc/uvcvideo.h   |  5 ++-
 3 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 431d86e1c94b..c0c81b089b7d 100644
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
@@ -262,7 +262,43 @@ static u32 uvc_colorspace(const u8 primaries)
 	if (primaries < ARRAY_SIZE(colorprimaries))
 		return colorprimaries[primaries];
 
-	return 0;
+	return V4L2_COLORSPACE_DEFAULT;  /* Reserved */
+}
+
+static enum v4l2_xfer_func uvc_xfer_func(const u8 transfer_characteristics)
+{
+	static const enum v4l2_xfer_func xfer_funcs[] = {
+		V4L2_XFER_FUNC_DEFAULT,  /* Unspecified */
+		V4L2_XFER_FUNC_709,
+		V4L2_XFER_FUNC_709,      /* BT.470-2 M */
+		V4L2_XFER_FUNC_709,      /* BT.470-2 B, G */
+		V4L2_XFER_FUNC_709,      /* SMPTE 170M */
+		V4L2_XFER_FUNC_SMPTE240M,
+		V4L2_XFER_FUNC_NONE,     /* Linear (V = Lc) */
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
+	static const enum v4l2_ycbcr_encoding ycbcr_encs[] = {
+		V4L2_YCBCR_ENC_DEFAULT,  /* Unspecified */
+		V4L2_YCBCR_ENC_709,
+		V4L2_YCBCR_ENC_601,      /* FCC */
+		V4L2_YCBCR_ENC_601,      /* BT.470-2 B, G */
+		V4L2_YCBCR_ENC_601,      /* SMPTE 170M */
+		V4L2_YCBCR_ENC_SMPTE240M,
+	};
+
+	if (matrix_coefficients < ARRAY_SIZE(ycbcr_encs))
+		return ycbcr_encs[matrix_coefficients];
+
+	return V4L2_YCBCR_ENC_DEFAULT;  /* Reserved */
 }
 
 /* Simplify a fraction using a simple continued fraction decomposition. The
@@ -704,6 +740,14 @@ static int uvc_parse_format(struct uvc_device *dev,
 		}
 
 		format->colorspace = uvc_colorspace(buffer[3]);
+		format->xfer_func = uvc_xfer_func(buffer[4]);
+		format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
+		/* All USB YCbCr encodings use LIMITED range as of UVC 1.5.
+		 * This is true even for MJPEG, which V4L2 otherwise assumes to
+		 * be FULL.
+		 * See section 2.26 in USB_Video_FAQ_1.5.pdf.
+		 */
+		format->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 
 		buflen -= buffer[0];
 		buffer += buffer[0];
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 7f14096cb44d..79daf46b3dcd 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -279,6 +279,9 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	fmt->fmt.pix.sizeimage = probe->dwMaxVideoFrameSize;
 	fmt->fmt.pix.pixelformat = format->fcc;
 	fmt->fmt.pix.colorspace = format->colorspace;
+	fmt->fmt.pix.xfer_func = format->xfer_func;
+	fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
+	fmt->fmt.pix.quantization = format->quantization;
 
 	if (uvc_format != NULL)
 		*uvc_format = format;
@@ -315,6 +318,9 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
 	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
 	fmt->fmt.pix.sizeimage = stream->ctrl.dwMaxVideoFrameSize;
 	fmt->fmt.pix.colorspace = format->colorspace;
+	fmt->fmt.pix.xfer_func = format->xfer_func;
+	fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
+	fmt->fmt.pix.quantization = format->quantization;
 
 done:
 	mutex_unlock(&stream->mutex);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6ab972c643e3..6508192173dd 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -370,7 +370,10 @@ struct uvc_format {
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
2.28.0.297.g1956fa8f8d-goog

