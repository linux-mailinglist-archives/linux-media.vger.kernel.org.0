Return-Path: <linux-media+bounces-11672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA608CABA5
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 12:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE010282521
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 10:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525A673531;
	Tue, 21 May 2024 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXRsSih0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14A77319C;
	Tue, 21 May 2024 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286438; cv=none; b=CBe2a32uGSUU4GmIc4/TbHLFOZwDnThKfX/IxuDMH13A9Fuz3gQeULmT+El9c0WsUNQc2wmdxderJ1+2wALzRFAHzUgxNVkBXI5/vBjwu1JWcmaimE9xEaUt8rAZthkJL/GFbg1SCo5d90d4Zrz8KpFRizscdV2xnxFNTZYHXW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286438; c=relaxed/simple;
	bh=RHQ+M/X8yAIVLRtJQPx77FibueWozKcb1Cr3A01lM9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VU3TaKHJ9ebGQOeCAFpxuhdA/6+ZUbgZLNrGlu4FOd0puA2XxJLVF++xg2EU4gA+CxjlbjhbQ/mMbZkdmLfqam5De3n4Rd2dLV9CziOCvVn7b5kYchkJ61DebJJPOiPxAaIwUzUt++DBuB8isBQbWQNR0VlIitknSig+bJqIhtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXRsSih0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D658AC2BD11;
	Tue, 21 May 2024 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716286438;
	bh=RHQ+M/X8yAIVLRtJQPx77FibueWozKcb1Cr3A01lM9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SXRsSih0Mj5GfwbMrS07ZwAtAkQmA0QjbNIddcx2ZflDqJJePZ8k01EWEfb9Xmvo5
	 ckuIz70CYkEdHsxSgtGQOuNs+LiWc8ix2IYHoAnPbNZPIEivKrZ7ceUwQDaayvLOln
	 rWLjFN0WaazcvSsUSSYzXplNZyT8HJeMszxa+o8srEj0AMt4t4BOc8k3fplDFAJdNd
	 iWsgXhcWNzP66IATC71fSNJ8UZ7Fl2D6GHnTDscz8PuMBMOZOKK90MKL95aP3JSekn
	 zWj+PU/bL/GH30xDfNKPm+yK+Z81R+i9D89paj7o3CzomfIuvabpTSaguCtXjsXJyA
	 DR5rmaWNAhWgg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 21 May 2024 12:13:35 +0200
Subject: [PATCH v14 02/28] drm/mode_object: Export
 drm_mode_obj_find_prop_id for tests
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-kms-hdmi-connector-state-v14-2-51950db4fedb@kernel.org>
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
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=937; i=mripard@kernel.org;
 h=from:subject:message-id; bh=RHQ+M/X8yAIVLRtJQPx77FibueWozKcb1Cr3A01lM9s=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGk+xRelV+UeDr0cWyd+7C+LpjTDd2ExIaHwTbNmnT/7I
 dCSvX9tx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiI6zXGWplitm8PPXpV7CPd
 PPe6f/0s+KLe8n3/8XjHChuvG12hn/WUnpte/OvD9+PzwdYvnPzMjPWV7GpGh81eP2NTWOph9mz
 ew9dHXd8f4XfMmRUsYW5dffSka5ub3pttYTU1P40y1FZ4VQMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

We'll need to use drm_mode_obj_find_prop_id() for kunit tests to make
sure a given property has been properly created. Let's export it for
tests only.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_mode_object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index 0e8355063eee..df4cc0e8e263 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -476,10 +476,11 @@ struct drm_property *drm_mode_obj_find_prop_id(struct drm_mode_object *obj,
 		if (obj->properties->properties[i]->base.id == prop_id)
 			return obj->properties->properties[i];
 
 	return NULL;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_mode_obj_find_prop_id);
 
 static int set_property_legacy(struct drm_mode_object *obj,
 			       struct drm_property *prop,
 			       uint64_t prop_value)
 {

-- 
2.45.0


