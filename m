Return-Path: <linux-media+bounces-1889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E168A808CAD
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 16:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BFBB1F21414
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 15:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378C349F6A;
	Thu,  7 Dec 2023 15:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FISsZouA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D653D0D4;
	Thu,  7 Dec 2023 15:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F27C43391;
	Thu,  7 Dec 2023 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701964276;
	bh=8QhaK94cu6NS8qoDm6VYUiajOTkUlwPERKnlLKf8BBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FISsZouABBLFe/tUDWbm0ZxVn9dffh5HX04ImgM90vN6ltfjHfsaWW8RKJkH74LCi
	 XxBv1mFWSEcFqBPQdjXX+eZe7KJz04EEQ1uSaewk03VhFdoZsa/MHSY/mBUzLpacGY
	 wpF6y9yotjj+YQ7duJf41i8D+AVrlxIkDUMgNnbNc3sxqjyCGsS9BAs7VeM6fnnKDd
	 iva7KRZydMpSbqSL/ZTcgZPDBzBiTP4xDTjV1sPh9XoC1HgolQKEJde8nVQSZ6lfMh
	 JmuQHCMYahzG81G7w5FD/jbH1LUNg1aDGCZKiuR4DFjgV9O2c7DlFB0kNLLJHkVzbz
	 UBwflsFgfb8Rg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:50:00 +0100
Subject: [PATCH v5 37/44] drm/rockchip: inno_hdmi: Switch to infoframe type
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-37-6538e19d634d@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2619; i=mripard@kernel.org;
 h=from:subject:message-id; bh=8QhaK94cu6NS8qoDm6VYUiajOTkUlwPERKnlLKf8BBg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL9sef/1mOEFU9sQ3i68RnxyzhKd4z3imuvamr/G/u
 wE/nGXzO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjAR01sM/4vZz25iff6maMFS
 J5OD0/JCTLinnBcwKdFZb8Ky4WLS9HCG/zFdKipc7yczH7yztnT3r7A4kVUcYRtbPt9Onnbv+5y
 tgowA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The inno_hdmi driver relies on its own internal infoframe type matching
the hardware.

This works fine, but in order to make further reworks easier, let's
switch to the HDMI spec definition of those types.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index b68cd3a6a0d1..77b530f377c0 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -156,33 +156,34 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
-static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi, u32 frame_index)
+static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
+				    enum hdmi_infoframe_type type)
 {
 	struct drm_connector *connector = &hdmi->connector;
 
-	if (frame_index != INFOFRAME_AVI) {
+	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", frame_index);
+			"Unsupported infoframe type: %u\n", type);
 		return;
 	}
 
-	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, frame_index);
+	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
 }
 
 static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
-				  union hdmi_infoframe *frame, u32 frame_index)
+				  union hdmi_infoframe *frame, enum hdmi_infoframe_type type)
 {
 	struct drm_connector *connector = &hdmi->connector;
 	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
 	ssize_t rc, i;
 
-	if (frame_index != INFOFRAME_AVI) {
+	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", frame_index);
+			"Unsupported infoframe type: %u\n", type);
 		return 0;
 	}
 
-	inno_hdmi_disable_frame(hdmi, frame_index);
+	inno_hdmi_disable_frame(hdmi, type);
 
 	rc = hdmi_infoframe_pack(frame, packed_frame,
 				 sizeof(packed_frame));
@@ -206,13 +207,13 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 						      &hdmi->connector,
 						      mode);
 	if (rc) {
-		inno_hdmi_disable_frame(hdmi, INFOFRAME_AVI);
+		inno_hdmi_disable_frame(hdmi, HDMI_INFOFRAME_TYPE_AVI);
 		return rc;
 	}
 
 	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
-	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_AVI);
+	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_AVI);
 }
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)

-- 
2.43.0


