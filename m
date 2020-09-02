Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C55525B50A
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 22:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgIBUGZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 16:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgIBUGV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 16:06:21 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3B3C061245
        for <linux-media@vger.kernel.org>; Wed,  2 Sep 2020 13:06:21 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id v16so153447qka.18
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 13:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=C2MUlVnA+LVqAkJnXitROtSiNFHvVgE4LBLUnXa2XhM=;
        b=cand0aT17ALCvtQnhRN2pjZ0CG+1g3q4aWCQqD1n2SaTe9NgSjIuQvViJxrkMLbjpk
         Tcto/vLlomxBI5Ra9DdIxhoUt4VK4j1/qY1pPsg1Gwn1S/gz9s0P/V+TszI9lFzZWsJo
         q1NFM/xl6R3oDaAuXyHgEs0hYnj2AvfVhV+CgvyFAU9VRlPGDrYd5UTK0HXHrxkOUB/q
         KnQpCw4XFkXT9KI8jUNmTkERDkIt9k2+Hhwii53589LcLrhryhz10fAmhM884uv9Wnfj
         2nekPsVFSiBR6BPjgQ2sJYoV1j+9Lf2MxuR9vHup5T8syut4bhrbmJUOfuCie+TY3J/n
         wE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=C2MUlVnA+LVqAkJnXitROtSiNFHvVgE4LBLUnXa2XhM=;
        b=ZMpUzWbkBjpJSOb1n5/IxZFmp76faITGCurYI+XhXJz4LO3siXwamXRS58OrU3b88S
         EDLgxcq5bBqHZjsTAVMoeKu5ljomQranSgjMr+MVy7SwszRod+DlKBwwYmA7sqFCoZpw
         SEBuf2Rc6CPTaqttDMhe7Hho0jHSwQzYqHJRoU42DhQz/Yag28SQ8dJBOUvXl6tj1vPV
         nMby4ub5v8TaaqI4wIofroUg8jfTGra2V2+PxWf6usstfuXhBty+CUh3u8xO4E2kJaK4
         WFN5AvzjwOPeLuSAjInPxWQFP89U3RUH2Xm5mMMNKuf2A6v/++6MmGe5RCuEFYwnAI+c
         tCJA==
X-Gm-Message-State: AOAM530OZmgOR6cUuoCTw3rH2w7Igb0pEVyYAEdq5U/I31qh+x7ezLXm
        yv+tpIoasQUTxkuFUK81HLqXC93LPig=
X-Google-Smtp-Source: ABdhPJw8Q3Tv04qhTOmsDMGAnsb0dpy6HmzAOgvmw+fBmSV4SbIMCLj7epgmHDj4Zt0scYDQ25R1MkEnGpw=
X-Received: from christoph.c.googlers.com ([fda3:e722:ac3:10:14:4d90:c0a8:1fe1])
 (user=agoode job=sendgmr) by 2002:a0c:b2d4:: with SMTP id d20mr154696qvf.1.1599077179933;
 Wed, 02 Sep 2020 13:06:19 -0700 (PDT)
Date:   Wed,  2 Sep 2020 16:06:17 -0400
In-Reply-To: <20200828032752.3229698-1-agoode@google.com>
Message-Id: <20200902200617.1720599-1-agoode@google.com>
Mime-Version: 1.0
References: <20200828032752.3229698-1-agoode@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH v3] media: uvcvideo: Convey full colorspace information to V4L2
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

Signed-off-by: Adam Goode <agoode@google.com>
---

Changes in v3:
 - Remove quantization changes completely.

 drivers/media/usb/uvc/uvc_driver.c | 64 ++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c   |  4 ++
 drivers/media/usb/uvc/uvcvideo.h   |  4 +-
 3 files changed, 67 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 431d86e1c94b..8682c7ad6949 100644
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
@@ -704,6 +758,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 		}
 
 		format->colorspace = uvc_colorspace(buffer[3]);
+		format->xfer_func = uvc_xfer_func(buffer[4]);
+		format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
 
 		buflen -= buffer[0];
 		buffer += buffer[0];
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 0335e69b70ab..dee65e89d6c2 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -253,6 +253,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
 	fmt->fmt.pix.sizeimage = probe->dwMaxVideoFrameSize;
 	fmt->fmt.pix.colorspace = format->colorspace;
+	fmt->fmt.pix.xfer_func = format->xfer_func;
+	fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
 
 	if (uvc_format != NULL)
 		*uvc_format = format;
@@ -289,6 +291,8 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
 	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
 	fmt->fmt.pix.sizeimage = stream->ctrl.dwMaxVideoFrameSize;
 	fmt->fmt.pix.colorspace = format->colorspace;
+	fmt->fmt.pix.xfer_func = format->xfer_func;
+	fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
 
 done:
 	mutex_unlock(&stream->mutex);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6ab972c643e3..eb5f3ffc0222 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -370,7 +370,9 @@ struct uvc_format {
 	u8 type;
 	u8 index;
 	u8 bpp;
-	u8 colorspace;
+	enum v4l2_colorspace colorspace;
+	enum v4l2_xfer_func xfer_func;
+	enum v4l2_ycbcr_encoding ycbcr_enc;
 	u32 fcc;
 	u32 flags;
 
-- 
2.26.2

