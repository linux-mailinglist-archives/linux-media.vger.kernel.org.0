Return-Path: <linux-media+bounces-1890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC67808CAF
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 16:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE0C61C20B34
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 15:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B329946BA8;
	Thu,  7 Dec 2023 15:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHyNH22f"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15563D0D4;
	Thu,  7 Dec 2023 15:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF4FC433BD;
	Thu,  7 Dec 2023 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701964279;
	bh=1We2UZx5ZDbQPKfDfMqOP+mc5xLMdSsl/KcWM2D6+wE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SHyNH22fXWqD6K2WzHGm1reK1De82pQc69qwhJMSx7w4vrWXRCxnZ//ya/DmJPGAU
	 PcuGwVUYVOVt7VEDmNQDQipQKdSJP684ypbtURJqCDkUMx/TVp8fav4YrPR/aYeKUo
	 VlIqK9qnKKHXRkHFLxZy6vJEuFXpS5vIm3jqjMHAuyvp0up6n2Siqu9upgOo+N0fN0
	 Fwqyuv/ZQC/bMHEZl6f0A404XA/5MennZHMYJR2IlytxuvOW1M5gUkntVT2YOpiYbj
	 4ffjBsfZ/Mwz4+HUxmuqKhGbYV13Y4Dj5k1ZlW39eeaNAngloVZ0f9PApkRzOOVje/
	 0UCnH4oyIotPA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:50:01 +0100
Subject: [PATCH v5 38/44] drm/rockchip: inno_hdmi: Remove unused drm device
 pointer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-38-6538e19d634d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=mripard@kernel.org;
 h=from:subject:message-id; bh=1We2UZx5ZDbQPKfDfMqOP+mc5xLMdSsl/KcWM2D6+wE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL9s8+Dfstffv7H7r3v14If+W1xOkXxy6K77CsefG/
 kkF2x6e7yhlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEGOIZGVby29hO4uf+e8NG
 Q+LRtfWN+31drrV7nZsl+iL8t4SnmjHD/5j+5qM57WtWC2rf4daOUtnK+e2c5J/rGszCn5Z8W+i
 7jBsA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_dev field in the inno_hdmi struct stores a pointer to the DRM
device but is never used anywhere in the driver. Let's remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 77b530f377c0..0f3ec6eaf270 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -39,7 +39,6 @@ struct inno_hdmi_i2c {
 
 struct inno_hdmi {
 	struct device *dev;
-	struct drm_device *drm_dev;
 
 	int irq;
 	struct clk *pclk;
@@ -648,7 +647,6 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 		return -ENOMEM;
 
 	hdmi->dev = dev;
-	hdmi->drm_dev = drm;
 
 	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))

-- 
2.43.0


