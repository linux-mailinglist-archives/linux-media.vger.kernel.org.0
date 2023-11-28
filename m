Return-Path: <linux-media+bounces-1251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DD87FB78B
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 660CA1C21407
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D3F4F898;
	Tue, 28 Nov 2023 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYtHXnV/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D871C4E638;
	Tue, 28 Nov 2023 10:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514E3C433C8;
	Tue, 28 Nov 2023 10:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701167162;
	bh=Tsq7e3D9EFCrDXU+KVxek7WzLF5tJh+8D3LvlOttulE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hYtHXnV/DP1zk4Ft8ibxsmPCl9+wP/6lWT9f5IkblkB1bXMl/KTRWnIyvTZu4bWT+
	 boCLud9xbeQt/hRBDzuo+A2ezEp3dOlaKa5JWF9rhdWb3w61v/48JdWjUh/LBH/63Y
	 Sb5iyid3y9b3343BodoQgQLDHC2hGIsbtAu2g9knlz63IYyoNacy0weqe9XORaFiXK
	 AtjAM+XW+Jxs377sS4SaVVeAK6kWZ3ZF88hdvXeKNuCT3w9xWv/xgs6OpZXS3rYAQC
	 joH9LbNcvITGmRkPY1CxaVw3ZeL6scF1uRaipxiaKCrj/xz54Bg7gANjIT30AGi2p0
	 s6KV6IJnNXWsA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:46 +0100
Subject: [PATCH v4 35/45] drm/rockchip: inno_hdmi: Remove useless
 mode_valid
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-35-c7602158306e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Tsq7e3D9EFCrDXU+KVxek7WzLF5tJh+8D3LvlOttulE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y8VXpzw6Li59FTz+PWpT1NbVKee2CZziOew8pnEX
 85slw/ld5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAixq6MDPNO2bOnzar/cNth
 1eeFTvE/u+s3Ck0IXNY09THj7NKXXjkM/zT3mf8Mdjund22fzH+frpLUz3uYHNfpekT/mt85Sem
 PAiMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The inno_hdmi mode_valid implementation always return MODE_OK which is
what the core assumes when we don't have an implementation.

Let's get rid of it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index e4fe02b79a98..59b2b676b7b8 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -400,13 +400,6 @@ static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static enum drm_mode_status
-inno_hdmi_connector_mode_valid(struct drm_connector *connector,
-			       struct drm_display_mode *mode)
-{
-	return MODE_OK;
-}
-
 static int
 inno_hdmi_probe_single_connector_modes(struct drm_connector *connector,
 				       uint32_t maxX, uint32_t maxY)
@@ -431,7 +424,6 @@ static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
 
 static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
 	.get_modes = inno_hdmi_connector_get_modes,
-	.mode_valid = inno_hdmi_connector_mode_valid,
 };
 
 static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)

-- 
2.41.0


