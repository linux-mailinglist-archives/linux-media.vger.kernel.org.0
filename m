Return-Path: <linux-media+bounces-1874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37661808C85
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 16:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A157B1F2110D
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 15:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC3A481BC;
	Thu,  7 Dec 2023 15:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wz0uoplm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1EA46B82;
	Thu,  7 Dec 2023 15:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E025C43397;
	Thu,  7 Dec 2023 15:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701964234;
	bh=phzceb8B70mg3i7At8pe2/ZP5A/7gxdjK+zKoU+Xok8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wz0uoplm0ouPBUuYOQ9eku7KQkOLFTDQDIA/jZ1EhlhVYnLOBE0gCd6VAmEJj0jAf
	 32ee70xMrIS3CcBnneZlCws+ZRjZt+Maia7xxmOc9SBcjypv59j8JjzunT2Dd0lMTD
	 GOU63t3vZGAgL8aJd8LYdJ3/z5L9qIKAelWbUjcvbuq5b1v5i7wpTir8YlLP2HQGnu
	 jcp9uIOvA/JtB3+/kMQRpn9Sg0Re/e054ItrB2TUnmqtYPZgpnhHXwETFMalUa0gth
	 gsPtacypWUkuSYMg/UNr3dqWrAQtN54BAxApNVsQpDpWKg68X94bPeEs6rY+9uJHlg
	 f1Au9kyViC6ZA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:45 +0100
Subject: [PATCH v5 22/44] drm/rockchip: inno_hdmi: Remove useless
 mode_fixup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-22-6538e19d634d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301; i=mripard@kernel.org;
 h=from:subject:message-id; bh=phzceb8B70mg3i7At8pe2/ZP5A/7gxdjK+zKoU+Xok8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL9vYRKNNtlyR2N85ee8iWwfRf7wWpQ9KGlJTgg48l
 l95p6Kuo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMJXsbwmzVwk2rbfrNYrXkW
 l76tmjdBjquhq0VCrkaKU+777Vvhggz/E7epWriYBb980y926m5kxe73e3lWTO+ztam/bvncWjK
 IFQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The mode_fixup implementation doesn't do anything, so we can simply
remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 6e5b922a121e..cc48cbf85f31 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -517,13 +517,6 @@ static void inno_hdmi_encoder_disable(struct drm_encoder *encoder)
 	inno_hdmi_set_pwr_mode(hdmi, LOWER_PWR);
 }
 
-static bool inno_hdmi_encoder_mode_fixup(struct drm_encoder *encoder,
-					 const struct drm_display_mode *mode,
-					 struct drm_display_mode *adj_mode)
-{
-	return true;
-}
-
 static int
 inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_crtc_state *crtc_state,
@@ -540,7 +533,6 @@ inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 static struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
 	.enable     = inno_hdmi_encoder_enable,
 	.disable    = inno_hdmi_encoder_disable,
-	.mode_fixup = inno_hdmi_encoder_mode_fixup,
 	.mode_set   = inno_hdmi_encoder_mode_set,
 	.atomic_check = inno_hdmi_encoder_atomic_check,
 };

-- 
2.43.0


