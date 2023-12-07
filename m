Return-Path: <linux-media+bounces-1854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F11808C3D
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 16:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 794451C208CC
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 15:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB48745C04;
	Thu,  7 Dec 2023 15:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qn0IYS+x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBEF1D54E;
	Thu,  7 Dec 2023 15:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502AAC433C7;
	Thu,  7 Dec 2023 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701964176;
	bh=N/byJx61MB/G+xPer+BE3L2kaBiCkfIycNZTFhMyqxU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qn0IYS+xXVt98u5JQmLzprmafaUmc+Nx31sQTVta/7A2h3no627Ry6GGHeFEZr3Nc
	 ktJbQb+xgyB5b8rT260XmhMkVqt+QzCc2oF5RvWfXsYhTk3qIDuAbn1tL78yrCbF4/
	 85UDnN5nw3bk8rwbzejxP8au4gckM4Jl0If3zT2nR0n/raVZRQvKN0U73594I2NRXP
	 S2XOeRkecUJ7zw+NdBACCN3cdZzPr4F/+W90MIG1RSJLED+gTAdK5pPIwaPuksHvGX
	 7obGPzVKmTKbF1XRinWyWkhwOYDTUQVeak0Q8r6eeOA84UcKtAi28pp8Gr2pGdsquB
	 rOaZ3GoMDh9jQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:25 +0100
Subject: [PATCH v5 02/44] drm/tests: helpers: Add atomic helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-2-6538e19d634d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=mripard@kernel.org;
 h=from:subject:message-id; bh=N/byJx61MB/G+xPer+BE3L2kaBiCkfIycNZTFhMyqxU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL1t6VRXK5zR87DjjniA9T8ugxan7yJL1sd/0Iyrms
 +5s7JbpKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwETqXjIyLJgvWqj2ajLr7ik7
 3JPmRZ05zvXM4GPQ6TxrNvVb9dIZ/xgZzt39UPM7/u7z6yLMG1jzGVZsSo+9v1Zzsr3MYZVzn/d
 UcwEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The mock device we were creating was missing any of the driver-wide
helpers. That was fine before since we weren't testing the atomic state
path, but we're going to start, so let's use the default
implementations.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index bccb33b900f3..272a3ba46d60 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_kunit_helpers.h>
 #include <drm/drm_managed.h>
@@ -13,6 +14,8 @@
 #define KUNIT_DEVICE_NAME	"drm-kunit-mock-device"
 
 static const struct drm_mode_config_funcs drm_mode_config_funcs = {
+	.atomic_check	= drm_atomic_helper_check,
+	.atomic_commit	= drm_atomic_helper_commit,
 };
 
 static int fake_probe(struct platform_device *pdev)

-- 
2.43.0


