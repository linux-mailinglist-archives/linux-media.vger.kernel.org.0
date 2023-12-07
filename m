Return-Path: <linux-media+bounces-1853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F10808C3B
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 16:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D43A51F212E5
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 15:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30DE46444;
	Thu,  7 Dec 2023 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODlGU75K"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9391D54E;
	Thu,  7 Dec 2023 15:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8991C433C7;
	Thu,  7 Dec 2023 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701964173;
	bh=81lEe31K2YU0V4EnFq3xxesUJy/t9LyYJwWTzno5+Rg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ODlGU75K8yKtjUopqTiU4wsNotWNVWiC25d6aWYxaxOvFMqQVxZZGkEhMSpN2Snms
	 cpy+aLoHA7sAdr5zqVat4bgL3nPTRSKoY/2m61W5XZs9mxPG0VkkTNoNimV37pEOmJ
	 u6PxyIcDeGCsp/CEWN29NMW/Z43t17GNM/5xtp0yMuxheMBCBwpwkUZYB8yAk/XtGT
	 KMEfjo6M5JUjVzSBmqpE6mOvv0anLYhgrhYQMOawvIfHFtAB/xFDNe+6uT63n7y47C
	 kgxjIz4TEjOVSC0RLPbAf/aRseJcchgJaguN+kPFjiwDsiObO8UMGnLamSAhO55+YS
	 qfNLz4dX2Z8tg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:24 +0100
Subject: [PATCH v5 01/44] drm/tests: helpers: Include missing drm_drv
 header
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-1-6538e19d634d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=mripard@kernel.org;
 h=from:subject:message-id; bh=81lEe31K2YU0V4EnFq3xxesUJy/t9LyYJwWTzno5+Rg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL1sefDpxVV7F8ANfMWcRC3v5Y5/ZYiHhd3wD9yWG2
 1hVP9zbUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIn8FmdkWG16u67kAofX8UNu
 wkfucbosWZ/LwHWiWP3Gvq5Wy5fK3xgZ9jBeF/B56fZy7bpQkeq9P/R3dRXqNH97sptN0GjPz6W
 v2QA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

We have a few functions declared in our kunit helpers header, some of
them dereferencing the struct drm_driver.

However, we don't include the drm_drv.h header file defining that
structure, leading to compilation errors if we don't include both
headers.

Fixes: d98780310719 ("drm/tests: helpers: Allow to pass a custom drm_driver")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_kunit_helpers.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index ba483c87f0e7..3ae19892229d 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -3,6 +3,8 @@
 #ifndef DRM_KUNIT_HELPERS_H_
 #define DRM_KUNIT_HELPERS_H_
 
+#include <drm/drm_drv.h>
+
 #include <linux/device.h>
 
 #include <kunit/test.h>

-- 
2.43.0


