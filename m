Return-Path: <linux-media+bounces-1886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 909C7808CA7
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 16:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C22CA1C20B02
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 15:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BE0495DD;
	Thu,  7 Dec 2023 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pMULg9Ee"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0134652B;
	Thu,  7 Dec 2023 15:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C4DC433C9;
	Thu,  7 Dec 2023 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701964268;
	bh=lBOOj7rqrx2w/8tcNodZrBPU2IsB4Kwf5qyl3esIKfc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pMULg9EezM19uQemjGykB2QqjkS1ctKoiNhGGR2cbfcOWBWWIZedbINDk2Tki2i9x
	 +d76AJZEfUCl2pxiicCExtm4UYYKzCUEPCmSse9xKlqBDtQKHZzKlglQSi31bwmYLv
	 EggkQm8IbSrhT0HrwVH22c0f0spQJ6ddMQtNrX/HZfImYVqU1w5ylvh+iBZaSPHVbp
	 gTimLWCT6ac51cWfNhh9QUt+rmHWbRlkEiEHQw7tvu9mFRFUp6MENxhHhccrTHQT4R
	 tivxfbHpLi6t0MuUNXVG/SXDbjriDM/E+0abs25gAJ9idiGhZP3h2iQNX6zYhXIcLk
	 l6mHGu4PniHug==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:57 +0100
Subject: [PATCH v5 34/44] drm/rockchip: inno_hdmi: Remove useless
 mode_valid
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-34-6538e19d634d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311; i=mripard@kernel.org;
 h=from:subject:message-id; bh=lBOOj7rqrx2w/8tcNodZrBPU2IsB4Kwf5qyl3esIKfc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL9s2S18I/2MTyeLsc+SlxqzTj7lKNQ6ku3ly+Xdwl
 T92fzy1o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMRzmNk2Ct6xbp/kWrNtRkx
 TIoFVZPudly89GKX9v6ynGMl1pk6jAx/pZU5D960cmp5e2Xj8+PXhNN335+UqrRf7t+2SU1T/z1
 5zw0A
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
2.43.0


