Return-Path: <linux-media+bounces-1250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A92307FB78A
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 630C5282AB0
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF354F893;
	Tue, 28 Nov 2023 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2ta1p0+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DE94D5BF;
	Tue, 28 Nov 2023 10:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC87C433CC;
	Tue, 28 Nov 2023 10:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701167159;
	bh=sK2tTZgQCVdrA7dGNcfvvdSbrmQiwQvQZKEMFhNEDU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G2ta1p0+w+tiEtPeUmHnpsuY9gwaATW4rZ4syVyroKitA5tR1xKCzIzm6JkcpMQ+4
	 9L2DtjtrFGvMMHDLG4VyDDtNg/sqw0hJs0OsLWtR0FFp4Uhh+OISNBocalc+3JZ/zR
	 PILYXaeFeX9PL5qYQ4pXuHb4+QlIH61dYeey/GUl884m6SkVXTfmqjeCPnmdNNQMmj
	 xAP4q+TMh0AubWK+tIGMJ9pF+poYXG9JE4Haq4ouvKlI4iJ8ReM2fUS8FWzblTtxx/
	 Q7w6Q+m1TIOV1fQbjXhWrm3wGlNMgS4Rei/QfV1f0xCYNbYuDIVPMVEthxN30smwGT
	 6uwvfqJu8ur9Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:45 +0100
Subject: [PATCH v4 34/45] drm/rockchip: inno_hdmi: Remove useless coeff_csc
 matrix
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-34-c7602158306e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2860; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sK2tTZgQCVdrA7dGNcfvvdSbrmQiwQvQZKEMFhNEDU4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y9d/uX54s68rqNnWzvjDug/ZGB2sjg3fVZG7r7w0
 3tep9ue6ShlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBElPcz/OGO4zuj1Ko1cZXI
 dJsHSolPvvyu11ljxqWTLKIZpfTfPpmRYbqSkGyz+PPH1jFpitVPb7EqbmSpenV904F9kw5pVW5
 1ZgIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The coeff_csc matrix isn't used anymore, let's remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 70 ------------------------------------
 1 file changed, 70 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 35f44e556fcf..e4fe02b79a98 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -64,76 +64,6 @@ static struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
 	return container_of(connector, struct inno_hdmi, connector);
 }
 
-static const char coeff_csc[][24] = {
-	/*
-	 * YUV2RGB:601 SD mode(Y[16:235], UV[16:240], RGB[0:255]):
-	 *   R = 1.164*Y + 1.596*V - 204
-	 *   G = 1.164*Y - 0.391*U - 0.813*V + 154
-	 *   B = 1.164*Y + 2.018*U - 258
-	 */
-	{
-		0x04, 0xa7, 0x00, 0x00, 0x06, 0x62, 0x02, 0xcc,
-		0x04, 0xa7, 0x11, 0x90, 0x13, 0x40, 0x00, 0x9a,
-		0x04, 0xa7, 0x08, 0x12, 0x00, 0x00, 0x03, 0x02
-	},
-	/*
-	 * YUV2RGB:601 SD mode(YUV[0:255],RGB[0:255]):
-	 *   R = Y + 1.402*V - 248
-	 *   G = Y - 0.344*U - 0.714*V + 135
-	 *   B = Y + 1.772*U - 227
-	 */
-	{
-		0x04, 0x00, 0x00, 0x00, 0x05, 0x9b, 0x02, 0xf8,
-		0x04, 0x00, 0x11, 0x60, 0x12, 0xdb, 0x00, 0x87,
-		0x04, 0x00, 0x07, 0x16, 0x00, 0x00, 0x02, 0xe3
-	},
-	/*
-	 * YUV2RGB:709 HD mode(Y[16:235],UV[16:240],RGB[0:255]):
-	 *   R = 1.164*Y + 1.793*V - 248
-	 *   G = 1.164*Y - 0.213*U - 0.534*V + 77
-	 *   B = 1.164*Y + 2.115*U - 289
-	 */
-	{
-		0x04, 0xa7, 0x00, 0x00, 0x07, 0x2c, 0x02, 0xf8,
-		0x04, 0xa7, 0x10, 0xda, 0x12, 0x22, 0x00, 0x4d,
-		0x04, 0xa7, 0x08, 0x74, 0x00, 0x00, 0x03, 0x21
-	},
-
-	/*
-	 * RGB2YUV:601 SD mode:
-	 *   Cb = -0.291G - 0.148R + 0.439B + 128
-	 *   Y  = 0.504G  + 0.257R + 0.098B + 16
-	 *   Cr = -0.368G + 0.439R - 0.071B + 128
-	 */
-	{
-		0x11, 0x5f, 0x01, 0x82, 0x10, 0x23, 0x00, 0x80,
-		0x02, 0x1c, 0x00, 0xa1, 0x00, 0x36, 0x00, 0x1e,
-		0x11, 0x29, 0x10, 0x59, 0x01, 0x82, 0x00, 0x80
-	},
-	/*
-	 * RGB2YUV:709 HD mode:
-	 *   Cb = - 0.338G - 0.101R + 0.439B + 128
-	 *   Y  = 0.614G   + 0.183R + 0.062B + 16
-	 *   Cr = - 0.399G + 0.439R - 0.040B + 128
-	 */
-	{
-		0x11, 0x98, 0x01, 0xc1, 0x10, 0x28, 0x00, 0x80,
-		0x02, 0x74, 0x00, 0xbb, 0x00, 0x3f, 0x00, 0x10,
-		0x11, 0x5a, 0x10, 0x67, 0x01, 0xc1, 0x00, 0x80
-	},
-	/*
-	 * RGB[0:255]2RGB[16:235]:
-	 *   R' = R x (235-16)/255 + 16;
-	 *   G' = G x (235-16)/255 + 16;
-	 *   B' = B x (235-16)/255 + 16;
-	 */
-	{
-		0x00, 0x00, 0x03, 0x6F, 0x00, 0x00, 0x00, 0x10,
-		0x03, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10,
-		0x00, 0x00, 0x00, 0x00, 0x03, 0x6F, 0x00, 0x10
-	},
-};
-
 static inline u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
 {
 	return readl_relaxed(hdmi->regs + (offset) * 0x04);

-- 
2.41.0


