Return-Path: <linux-media+bounces-1235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A837FB759
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0ADF0B22029
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6EC4EB52;
	Tue, 28 Nov 2023 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pcw8LsGc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973424E1CA;
	Tue, 28 Nov 2023 10:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BBFC433CB;
	Tue, 28 Nov 2023 10:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701167117;
	bh=3urbyxJOhBJnxOpaqPUf/XFZGd3bz5XAd4Th75mEdek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pcw8LsGckKIMNmgWnoL6TkBVd5O77Urs2ZI8KnnQz1PYDVb8jLDJGYO1dY2tk1LQQ
	 tp9Cl5IOXAjLTXQ9AtXbX7LYPx33UoJHYocpY2hClo8XAp5uh+RNV83Cb10lLQrCAe
	 53tYiXkNDy8aiKEp9S9iS+NzB9MwfxyLPMHgz0JT9j3L8nREBz1Nrq+OAmBKjDZPf5
	 rsSPFSaIAFcOou+oaHJgd0/jERLqXERLZrKBZawDAVhOSOVKmIMIO98G8pTI+uwaPZ
	 l6bdOGq0vgKiWhtiaThOQpuS9OJseZ64S7/ClnTMNIxtWv3WDZVfKd3NFcUKAR+1gr
	 1E9/XSVVTQrMw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:30 +0100
Subject: [PATCH v4 19/45] drm/vc4: hdmi: Create destroy state
 implementation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-19-c7602158306e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3urbyxJOhBJnxOpaqPUf/XFZGd3bz5XAd4Th75mEdek=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y9d+9kzWdLQVDbSa8q9k1ZKdhXbY474pJi+33hBe
 L78Pku+jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExkfj8jw2TpjfLvFvVpO6Ww
 6f81/fmwTeTKjMkfA7/nTuVUd3zRvo+R4WaDYu++lat0o4OerEz9fjo3Y+0OOWa3fKuzP5wm+a/
 M4wIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Even though we were rolling our own custom state for the vc4 HDMI
controller driver, we were still using the generic helper to destroy
that state.

It was mostly working since the underlying state is the first member of
our state so the pointers are probably equal in all relevant cases, but
it's still fragile so let's fix this properly.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 25c9c71256d3..f05e2c95a60d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -672,11 +672,21 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 	return &new_state->base;
 }
 
+static void vc4_hdmi_connector_destroy_state(struct drm_connector *connector,
+					     struct drm_connector_state *state)
+{
+	struct vc4_hdmi_connector_state *vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(state);
+
+	__drm_atomic_helper_connector_destroy_state(state);
+	kfree(vc4_state);
+}
+
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_destroy_state = vc4_hdmi_connector_destroy_state,
 	.atomic_get_property = vc4_hdmi_connector_get_property,
 	.atomic_set_property = vc4_hdmi_connector_set_property,
 };

-- 
2.41.0


