Return-Path: <linux-media+bounces-10987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C93958BE370
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1134EB26504
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0D315E1EC;
	Tue,  7 May 2024 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlLWv+GE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD2D15E80A;
	Tue,  7 May 2024 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087869; cv=none; b=KXb1pF/CvIdeouCXjZzwsD/9AvbXHovP4V2m1BYdAEZqFC/kKQvwwDMNoT/7mK8hpEG6zqws2a60xrutfVR6/zgmDDqVchHjapo6bYiWbxIuabv1J9WVdhOuYCIocITVkNWR1Sg9WMpJzW3SdMoT7Xj21uunQy+a30QIjIOE3po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087869; c=relaxed/simple;
	bh=RHQ+M/X8yAIVLRtJQPx77FibueWozKcb1Cr3A01lM9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMy90B/pXeDKqwb0SqL68ZJl0zRxm87ttp/cBLHs6Vj6y6C0ZGCXZGcPwyO2SdR95544JQlK+wbLe5FZt9HJ0FxoT5cTKgbKL1EVlH2gthPFyvxjw3h5Lf7pRHKOQYlhn+ZUT6SFOurcICkgfh6djCh995GalXZNdetCJt7LdKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QlLWv+GE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4000C4DDE3;
	Tue,  7 May 2024 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715087869;
	bh=RHQ+M/X8yAIVLRtJQPx77FibueWozKcb1Cr3A01lM9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QlLWv+GEXCa2lAO38Dh4VCIk8N6Lhjgr7s2/NI8bJSb2fTV5mmgHYtRElTKoVBWmE
	 H99okaTVcPHHsetwnCECjzJn3a2sFIJp6sLQLGmVSZEwELU86DXK+IHgjabljKOOHR
	 PhTgsIyiajV1LknZZZ/Jc8OoyPAS92wx5Wqe3+j/S7rfMNsuIk2yJ/Mw8KcDqTyfoY
	 gyDM0u5nb4s0yH/tMEg/s6DyUrOXzZ3tcOgnWyYlkvX2rLU5PDcSUvhLLFLnyTzsqa
	 XgCcWpAW5WHUP/NACWO2YDBwb+znGRuMVMDU7e6k8ZuVzODU6OE4tUoZ4HhU/u2kpe
	 +kmH9T1g9k5mQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 07 May 2024 15:17:20 +0200
Subject: [PATCH v13 02/28] drm/mode_object: Export
 drm_mode_obj_find_prop_id for tests
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-kms-hdmi-connector-state-v13-2-8fafc5efe8be@kernel.org>
References: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
In-Reply-To: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlWms8Zin188hQuPxBZxXy1/N6tpwbfHXWjE1YeWFPFl
 rwyjfVjx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE9gQLk4BmMi5W4z1IZPETxzmV+HmeDR1
 4laJlblb3nWuCazXkju0OILjhAynffjTSUdChHP2359kY3Jmdscyxlq5XWVqBVX9OYv0Y+0LXfh
 z1sp9N0vawndLvtCr5bpcJ2eP/IIP/oavtkj/LF+T3ViyFAA=
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


