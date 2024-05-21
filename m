Return-Path: <linux-media+bounces-11679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 707228CABCE
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 12:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26FD2284B4A
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 10:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F2A71754;
	Tue, 21 May 2024 10:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQ+QhRXj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C4778C6D;
	Tue, 21 May 2024 10:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286458; cv=none; b=R02r+U9TJbxc3XdzR+Slb8lRRHadYjYHMqEp7KTRDzNRRB3rW0iO5tqWEZj6vFNHKmA1/d/Z8vzxjFTtC++Jkvcv+imdsxoX5maIvHmMqw/1QNNSnEDP/y/18PtfrliatantZDOjo0yx/lEvARwkcVy2U7JV6magoGEcyR9FPh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286458; c=relaxed/simple;
	bh=MbjlKvUpIH4Kpzei6mLsDD4DvZW2edzJFxhrN620Y6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+AVr3P9Mm7QQMNlmZ9lxKLD4xQca5+VuunnpjHPllwEjQtPLzT3EaqV5hTQ/e4VJgw9ScfGyTZ201VSxpAT5Qw5XkJsrJtXowKbQaJ7KYAMgRyDlqW6DyqB8Qv51wndps/sb3YYWUgGSRDiPfvUGOv/E7R8srC0DEcXRYH19FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQ+QhRXj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DF4C32782;
	Tue, 21 May 2024 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716286457;
	bh=MbjlKvUpIH4Kpzei6mLsDD4DvZW2edzJFxhrN620Y6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bQ+QhRXjETRBMEW1Jixis+IvCqstdfj17kby0ee2viFGOlHb07Ez7aOSAHCK6VPxm
	 duML0z7lRgNDskcQPc4XS2gzqmJnh71w/tdnyNYvLSAYiCTmH92OmWVCLa+IT6SUHB
	 Jqj4zdDRVBt734vqSPCbaVyWPRD5sH9aBG/v9TCh8cOioMjKnOx439ZOkPrYcNEcKZ
	 Ufnn1/F2Mni3ZghifFPrD2CbqzMJiquZhZv7Ero7XYKMwUELY4WNVsYVlEFYRKwfsx
	 Ge3McauaxhU/G6MrcumRuHePIvQGKBPP6Q+Vxhyl8hkH1KJGUmhKaqRTNF6m15nGCZ
	 TtyaVgGVs1FTw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 21 May 2024 12:13:42 +0200
Subject: [PATCH v14 09/28] drm/display: hdmi: Add HDMI compute clock helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-kms-hdmi-connector-state-v14-9-51950db4fedb@kernel.org>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352; i=mripard@kernel.org;
 h=from:subject:message-id; bh=MbjlKvUpIH4Kpzei6mLsDD4DvZW2edzJFxhrN620Y6I=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGk+xVce/5rGJZLqaKihpxgosKHLUeT2XAfVpfOsXY9+z
 HwQH1TaMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZiWM7YcDrDRVbq9pojwSX+
 M4XkX07qnyZbtDq+s3/75/tGUgzfLJxFRYSyzmR9vN3ZWbUuvLqNsWH/VPOfGl5/Oz8zp9jHz55
 a21C9d4/Hrlm2xbYyZfc9BXcd29J7613z5GPfglzmMjlNUQQA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

A lot of HDMI drivers have some variation of the formula to calculate
the TMDS character rate from a mode, but few of them actually take all
parameters into account.

Let's create a helper to provide that rate taking all parameters into
account.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c | 57 +++++++++++++++++++++++++++++++
 include/drm/display/drm_hdmi_helper.h     |  4 +++
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index faf5e9efa7d3..679eb3e81393 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -193,5 +193,62 @@ void drm_hdmi_avi_infoframe_content_type(struct hdmi_avi_infoframe *frame,
 	}
 
 	frame->itc = conn_state->content_type != DRM_MODE_CONTENT_TYPE_NO_DATA;
 }
 EXPORT_SYMBOL(drm_hdmi_avi_infoframe_content_type);
+
+/**
+ * drm_hdmi_compute_mode_clock() - Computes the TMDS Character Rate
+ * @mode: Display mode to compute the clock for
+ * @bpc: Bits per character
+ * @fmt: Output Pixel Format used
+ *
+ * Returns the TMDS Character Rate for a given mode, bpc count and output format.
+ *
+ * RETURNS:
+ * The TMDS Character Rate, in Hertz, or 0 on error.
+ */
+unsigned long long
+drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
+			    unsigned int bpc, enum hdmi_colorspace fmt)
+{
+	unsigned long long clock = mode->clock * 1000ULL;
+	unsigned int vic = drm_match_cea_mode(mode);
+
+	/*
+	 * CTA-861-G Spec, section 5.4 - Color Coding and Quantization
+	 * mandates that VIC 1 always uses 8 bpc.
+	 */
+	if (vic == 1 && bpc != 8)
+		return 0;
+
+	if (fmt == HDMI_COLORSPACE_YUV422) {
+		/*
+		 * HDMI 1.4b Spec, section 6.2.3 - Pixel Encoding Requirements
+		 * specifies that YUV422 is 36-bit only.
+		 */
+		if (bpc != 12)
+			return 0;
+
+		/*
+		 * HDMI 1.0 Spec, section 6.5 - Pixel Encoding
+		 * specifies that YUV422 requires two 12-bits components per
+		 * pixel clock, which is equivalent in our calculation to three
+		 * 8-bits components
+		 */
+		bpc = 8;
+	}
+
+	/*
+	 * HDMI 2.0 Spec, Section 7.1 - YCbCr 4:2:0 Pixel Encoding
+	 * specifies that YUV420 encoding is carried at a TMDS Character Rate
+	 * equal to half the pixel clock rate.
+	 */
+	if (fmt == HDMI_COLORSPACE_YUV420)
+		clock = clock / 2;
+
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		clock = clock * 2;
+
+	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
+}
+EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
diff --git a/include/drm/display/drm_hdmi_helper.h b/include/drm/display/drm_hdmi_helper.h
index 76d234826e22..57e3b18c15ec 100644
--- a/include/drm/display/drm_hdmi_helper.h
+++ b/include/drm/display/drm_hdmi_helper.h
@@ -22,6 +22,10 @@ drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
 				    const struct drm_connector_state *conn_state);
 
 void drm_hdmi_avi_infoframe_content_type(struct hdmi_avi_infoframe *frame,
 					 const struct drm_connector_state *conn_state);
 
+unsigned long long
+drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
+			    unsigned int bpc, enum hdmi_colorspace fmt);
+
 #endif

-- 
2.45.0


