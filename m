Return-Path: <linux-media+bounces-42955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD90BB91C62
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 16:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55498189C6AD
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 14:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EDC281355;
	Mon, 22 Sep 2025 14:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dbclt5RU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EDC27FB27
	for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 14:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758552206; cv=none; b=rBW7IkA8uapUPbBHjIuDOStE/Gkd9Wv11w1LU3X9BmWknoM1bWveKjqY0zhxqCPYNY9LjH/c0opyM1+BOBet83NqyMGeMiDclxijbdcjXXZuTC93wnTisb9lghKIu3gKf6HugIEaNloKOFF8Yx6bbdSa5k32FV0bTFKPAJUyyko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758552206; c=relaxed/simple;
	bh=01eLBwKsR2MPC5ljxSM0eM0q4VqlpbK29DMtnFjku3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WK433VuaXlmHeB4L9Zm0M05Ix1brS5cswPCdWOWlsIBKoF2DvALIrzL2Qk8gfryNIyk/uhWrltDGA73ZpCov9tPb/ziaw3DH+RZunokUZMrzSPlaKKrZ4C8hEQg7PBISIJ+edsC0YmnfM77BmPvjrUkS6gnDkve3WIklqKzMh4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dbclt5RU; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-361d175c97fso35846411fa.3
        for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 07:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758552202; x=1759157002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F0lMUB1ROfKuK75/vGdOophe58nNykYwwEOWTGObV+k=;
        b=Dbclt5RURZ5S3nBkBhGAJfnMXY5irBTsOgkqqkhfsEqo9yqiNRnYfnMkgdpnenNIjV
         95W7EqA3Sy0V9DEdK8H4DNqF91pKTaVo59yND4P9gszI62iSDxf7qVpMIWLYen0W6UGQ
         iC4J+Ej+d5iqAnl95fWncSOvi5/bA/yWr40pO+SOWK+mq9MPzUDttyxIczUjj4qIFqZB
         uPAB4W0wX+jmuSsRZXayXhqHEBlRsUb6s/5d9trZhPcEZMDO7rRqnWS6BZSVtM05I52w
         A4bnTYarvAfCEYoiIAktf+IrlGKiPtKbWDAa44kCvnAEmAt3jPPba+dj0s53JN+POOth
         UxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758552202; x=1759157002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0lMUB1ROfKuK75/vGdOophe58nNykYwwEOWTGObV+k=;
        b=wZUxsLH2WQsTSFb4oFbqneOWJ1iiB7fQUo1UKULF5D8HrH0zXrDp1wKhgA/C61gh7N
         Yb+0pqTizZZitYtd11//0TFuAY/KMs4hDjJfHtMQ0DguqDGSAGleIRjEMgKbZ1jf6ZC2
         sD22M6qyT4iZNnB+wjL10651fTsqqt+JDyskX8QlRGDMBK2RE5SKEc7ZOJV09p3Yu2j0
         qjQwlDEXg+OrrSRIqx9PEkRG23UjxsURDBJHbQnLveGxrSxxV6GwRcrbnMsDfAAFtzdZ
         bITFwYi8udc22q+K5EJzhlkbmQe357oyHsBixVbA94Tfu1iIsrOWUwHvoBRxBdyE6Xl4
         /cig==
X-Forwarded-Encrypted: i=1; AJvYcCUe1GTB0I9ZeEBK/lZy8k44xn4Iq5Rm76uDIFDGnKC1pq/BlOwBxkm1UNlgT7KXKga8vHwyfBWPP7DRaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2k18FdWeVcjVDAizWH9xyMw1nefOFH5UTVZq5H0zpmoM37RAC
	KQ3h1fjpYZqLPha2PiH3YphcVILaMbJWKKxn3zVu20LYp7JZxTlH6JfK
X-Gm-Gg: ASbGnctNLHGSUPSvi4xfM9ZrgtYBXsmgHOJ+VL4rdlRqQIGido34OuMV5o3qsm7TzDS
	HvXECGfW3edhy+7+QOozNxj1wsipCoZLv7jwV+1I6HFPd/VDZTFQTJHgZzQ8pVROQ0vd6Q+mJln
	kj0TWHpquAMizw4CYSx+DhF9QYrbnD+6QVREb/S6mZkseWa13qw0sv6EjkKp1CM3vF0+dwJ0B/r
	dNS7d257AVQt7Fzs9llDXXY8k1SvIphY4fEI+AOmujtzqherFZTtYS+gRWIn+I4QRIaa0LsOY61
	av+YNnU4tvP+rNJLeu5OGnMXkiWWVJnefDALHOdAvEpBnnbunvNTs6PHLrNyoC/DK8Gc5s+qQCl
	eD8Ub8S7KUz/IPZI+1dUYkGa8jmzoOuIu/LH39ZCqDRQhHwnb4nDVKPfXXGxBqiHbqAxgMZcWpR
	w7xtVfkIBqtbcBHCPz
X-Google-Smtp-Source: AGHT+IG0k8GFm/GzeFNoiWTic6tM3XN6hehF7mLWcX6QsOfPfppRRO6H9eJxef5vfYTewNG17se7sA==
X-Received: by 2002:a05:651c:545:b0:36b:4cc1:15ff with SMTP id 38308e7fff4ca-36b4cc116b5mr18512911fa.5.1758552201998;
        Mon, 22 Sep 2025 07:43:21 -0700 (PDT)
Received: from localhost.localdomain (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3673e015747sm15960611fa.62.2025.09.22.07.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 07:43:21 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10] gpu/i915: fix error return in mmap_offset_attach()
Date: Mon, 22 Sep 2025 17:43:16 +0300
Message-ID: <20250922144318.26-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandr Sapozhnikov <alsp705@gmail.com>

Return value of function 'drm_vma_node_allow', called 
at i915_gem_mman.c:670, is not checked, but it is usually 
checked for this function

Found by Linux Verification Center (linuxtesting.org) with SVACE.
Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>

---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index a2195e28b625..adaef8f09d59 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -706,8 +706,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 	mmo = insert_mmo(obj, mmo);
 	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
 out:
-	if (file)
-		drm_vma_node_allow_once(&mmo->vma_node, file);
+	if (file) {
+		err = drm_vma_node_allow_once(&mmo->vma_node, file);
+		if (err)
+			goto err;
+	}
 	return mmo;
 
 err:
-- 
2.43.0


