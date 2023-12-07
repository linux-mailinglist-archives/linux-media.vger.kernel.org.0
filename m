Return-Path: <linux-media+bounces-1894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EFC808CB8
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 16:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B331D2816B9
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 15:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DC049F9F;
	Thu,  7 Dec 2023 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HR0Qz2SZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AA446455;
	Thu,  7 Dec 2023 15:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A14BC433AB;
	Thu,  7 Dec 2023 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701964290;
	bh=pVOwlxGRG4Yx77sVCEVDWc/W+8/UbYOVd7SBFXh+HU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HR0Qz2SZALMK22ZmWNxsgFQ4gG7E5jrzyzscGzHC910+1LakOCMMg4V9f+t+mZF/r
	 +4TjHxb+bXyO+nSa7Q060sIgoudPhIQlI3VmgZccHz/N5FFEf4cpUysi4dNi3XSFBh
	 mAqBJpQ1tXt9adZJHlWKk+X7Z04xF1coLwz+BhMtb3GusWUNsEzmhpUGU5MiQ1t9fw
	 rIKS+WpuRKnoOP3eCK+gu9co9qkKQs+XMMgWSD1/ONJZB+OodSwbZGZJZFnpc9Ik5B
	 lOrKL0tYNB81MjiRLBh1duXDbaqwBnYzrA45h4U9/iM7zAi/5q/Ek/fNL2I/B3CBsp
	 gZaiI6vWSx2fw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:50:05 +0100
Subject: [PATCH v5 42/44] drm/sun4i: hdmi: Switch to container_of_const
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-42-6538e19d634d@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <sui.jingfeng@linux.dev>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396; i=mripard@kernel.org;
 h=from:subject:message-id; bh=pVOwlxGRG4Yx77sVCEVDWc/W+8/UbYOVd7SBFXh+HU4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL9udLS3VmzdvuRS84fOEDBUVl2NnNfrXmu2O2ffnq
 Ij/mnVhHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiI/AVGht2JzZGltRzebRPO
 B5ZG82mzSNxnkhFXlX/NLa47Yf/rB4wMk57+OfxKe/GpI0+mGhXzSFifU+49p3xu15sdLz8Jsxq
 f5QEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

container_of_const() allows to preserve the pointer constness and is
thus more flexible than inline functions.

Let's switch all our instances of container_of() to container_of_const().

Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index bae69d696765..c276d984da6b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -30,19 +30,11 @@
 #include "sun4i_drv.h"
 #include "sun4i_hdmi.h"
 
-static inline struct sun4i_hdmi *
-drm_encoder_to_sun4i_hdmi(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct sun4i_hdmi,
-			    encoder);
-}
+#define drm_encoder_to_sun4i_hdmi(e)		\
+	container_of_const(e, struct sun4i_hdmi, encoder)
 
-static inline struct sun4i_hdmi *
-drm_connector_to_sun4i_hdmi(struct drm_connector *connector)
-{
-	return container_of(connector, struct sun4i_hdmi,
-			    connector);
-}
+#define drm_connector_to_sun4i_hdmi(c)		\
+	container_of_const(c, struct sun4i_hdmi, connector)
 
 static int sun4i_hdmi_setup_avi_infoframes(struct sun4i_hdmi *hdmi,
 					   struct drm_display_mode *mode)

-- 
2.43.0


