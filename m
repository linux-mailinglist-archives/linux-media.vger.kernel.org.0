Return-Path: <linux-media+bounces-1217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 715DE7FB71C
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DC34282AD9
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B814E608;
	Tue, 28 Nov 2023 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnWvtLMY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342904E1CA;
	Tue, 28 Nov 2023 10:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3E8C433C9;
	Tue, 28 Nov 2023 10:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701167067;
	bh=Fnr3n9V/rmEGhyYzyhKw6YhgF2ss0cefC+cpk2ChxTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VnWvtLMY80iPcQuP+xsQy4v7vRFYFqKSo7ScwL0WjMFK/GIfD4ojmmavN0ydmyoAv
	 Un8aG1ogypWQEECspemYcXzYrgRoP7+fdpOxeS/QKwBwnE5tHAkvwYI1c6W+DjeTJS
	 d2gOAazTRY3nr0aDqhEanKZUakjMGhcjP+Cqxg0McxbP054gUucNby/kORDYP5mJFE
	 OojQ3xAHlAjmAqimKsrKFcdk0ayK8U5JJcm6H7U3ZiqLtTxTRxOPc6Xk/FKBlEU516
	 p2QETlP6sYMAZ8U4IJidKEwJyKZzr7IV1w66QP3CzqopvcUEfcpTqKZR34NKM3ktHv
	 hJ2bty+eey0aQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:13 +0100
Subject: [PATCH v4 02/45] drm/tests: helpers: Add atomic helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-2-c7602158306e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Fnr3n9V/rmEGhyYzyhKw6YhgF2ss0cefC+cpk2ChxTM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y8u+LXy4p8IgX0Wy6YVdRYufr9zwf2erwHTjQyqS
 r6n6U5+0VHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJrF7G8D+9vWBq4OmlYt9m
 SzF+VBHacF7p+ZzTHqzc884WJxwxyZrK8E9rfoZPA59vwuuI02uSWdhDDiwRFUnyCD4uNYOf/Xd
 pJwcA
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
2.41.0


