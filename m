Return-Path: <linux-media+bounces-1239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2943E7FB764
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58D131C21388
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5A64F5E3;
	Tue, 28 Nov 2023 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhNhqYW0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2194D4E638;
	Tue, 28 Nov 2023 10:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDF2C433C9;
	Tue, 28 Nov 2023 10:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701167128;
	bh=O2ArSsFw7SF4g7FuBBWi6vHwa0go+wIZPFZlnlzeBPY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rhNhqYW08F4FzAD4keWd51QVik61u3OklgUf//4B4UrBmsOiixFAFHqRKoBRz9nu6
	 7X2H9Lu0qWMw6kG8fFKCyxCiI2X3ncJLIEvcWVfoTvtqX3xcFFsRqmKjB8mwFmqo/G
	 JZSydJ4rjSZ/CiJf6IXKaB1IFh6IAUIbnN9/kz8ZopE7N5AP+UAaFaT763aEYF2chL
	 7xoy22TabrdRwj5cp3lxqhz0D6eFkxC3l2MbiAsWBDnhQrDMAO0ss5xA71nOPHfuzg
	 wl242lbtXwaAiJY/mMUXKBN+OCVuU9iUveA+D11kGNjuSNFRKakCX6w8NUDQshq6B+
	 SMvczfQvNtL6Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:34 +0100
Subject: [PATCH v4 23/45] drm/rockchip: inno_hdmi: Remove useless
 mode_fixup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-23-c7602158306e@kernel.org>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
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
 h=from:subject:message-id; bh=O2ArSsFw7SF4g7FuBBWi6vHwa0go+wIZPFZlnlzeBPY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y+JL1Rp87p3vUtntqruhCf9P9+lfLpytUDi25I5e
 5yEg5686ShlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBE+KYw/GbVjnt+L+WCKdMB
 RdeQKZWFl24etvqq907RIe5S3/2sF80M/4NkzBfpH3ooqKP2NmluplG1rb7U6pKs13tfKk1rTog
 v5QcA
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
2.41.0


