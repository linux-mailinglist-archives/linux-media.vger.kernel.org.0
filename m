Return-Path: <linux-media+bounces-1887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B61808CAA
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 16:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06190B20CE0
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 15:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30971495E1;
	Thu,  7 Dec 2023 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSS3aJgd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639B33D0D4;
	Thu,  7 Dec 2023 15:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5804C433B6;
	Thu,  7 Dec 2023 15:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701964271;
	bh=hSiOZT7I1AlS1gpPTNWhjWxcUL69aElzs2JoN5aOHC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aSS3aJgdltZXzxT+fgn0psGO3PXlcKP/sDU7QsEBphGeThZd7WvfnjeuTYXUAoJl6
	 W3UInt9yE1HPeppX1mfWCshHz2DVM61Gl7R+kPh2+gESTs0+i5OR0Nhe5oxzuTyYMa
	 OUPI7GkjEVfdWxOD8YuAM1tbrxLtG3F/RBPxVWZczIf92BMWcGPdF51qllDOsUjNLv
	 C2r9rVUjd9zb6GvSa9dfzKWC2YFsNxdJ8ZtJ2q7IjTxOoFkd1/C3VwKUtrIOdoIIKT
	 wxPhvags5RIDBvoa3DGsT1iRjBseHfpbT4+aOjiK+NlCqoL2258g1cO92UsTF4fAXN
	 G6IZOm4KG2qtg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:58 +0100
Subject: [PATCH v5 35/44] drm/rockchip: inno_hdmi: Drop HDMI Vendor
 Infoframe support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-35-6538e19d634d@kernel.org>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, Johan Jonker <jbx6244@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2822; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hSiOZT7I1AlS1gpPTNWhjWxcUL69aElzs2JoN5aOHC0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL9sesy4/MpEnIFEg+5vVAa2dT37LrHj08kWPgM5XZ
 pu9058c7ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEDKoZGSYy3poZbX4jjumJ
 dO+prZv3X77j7L9hBYO67J3nTRsmn2xl+Kfs/p+/aVZP3kLJXU+cPntzpjit+X/qTHuh8XVtATm
 eEkYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The HDMI vendor infoframe is only meant to be sent with 4k60 modes and
higher, but the controller doesn't support them. Let's drop them from
the kernel.

Suggested-by: Johan Jonker <jbx6244@gmail.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 59b2b676b7b8..9c64f94ede6f 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -157,11 +157,15 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 }
 
 static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi, int setup_rc,
-				  union hdmi_infoframe *frame, u32 frame_index,
-				  u32 mask, u32 disable, u32 enable)
+				  union hdmi_infoframe *frame, u32 frame_index)
 {
-	if (mask)
-		hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, disable);
+	struct drm_connector *connector = &hdmi->connector;
+
+	if (frame_index != INFOFRAME_AVI) {
+		drm_err(connector->dev,
+			"Unsupported infoframe type: %u\n", frame_index);
+		return 0;
+	}
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, frame_index);
 
@@ -177,28 +181,11 @@ static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi, int setup_rc,
 		for (i = 0; i < rc; i++)
 			hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
 				    packed_frame[i]);
-
-		if (mask)
-			hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, enable);
 	}
 
 	return setup_rc;
 }
 
-static int inno_hdmi_config_video_vsi(struct inno_hdmi *hdmi,
-				      struct drm_display_mode *mode)
-{
-	union hdmi_infoframe frame;
-	int rc;
-
-	rc = drm_hdmi_vendor_infoframe_from_display_mode(&frame.vendor.hdmi,
-							 &hdmi->connector,
-							 mode);
-
-	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_VSI,
-		m_PACKET_VSI_EN, v_PACKET_VSI_EN(0), v_PACKET_VSI_EN(1));
-}
-
 static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 				      struct drm_display_mode *mode)
 {
@@ -210,7 +197,7 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 						      mode);
 	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
-	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_AVI, 0, 0, 0);
+	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_AVI);
 }
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
@@ -306,10 +293,8 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 
 	inno_hdmi_config_video_csc(hdmi);
 
-	if (display->is_hdmi) {
+	if (display->is_hdmi)
 		inno_hdmi_config_video_avi(hdmi, mode);
-		inno_hdmi_config_video_vsi(hdmi, mode);
-	}
 
 	/*
 	 * When IP controller have configured to an accurate video

-- 
2.43.0


