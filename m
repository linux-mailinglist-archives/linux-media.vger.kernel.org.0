Return-Path: <linux-media+bounces-43060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F06B99ED5
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 14:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DCEA327567
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 12:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5FC3019A4;
	Wed, 24 Sep 2025 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbaU+AjR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5560928468D
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 12:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758718140; cv=none; b=mJHBgCpATdDzHXx7h1YB4qWJT9hcgjj1FUCD4rPpv74y3BjEgGwOX/+8BsYC6yYYb3qmwx25s6Vk8KdbvM4UewzMIOeJBEqcnUfifWY7+tYJWup+YRCnf43wKkHdc7jpfhX6K35RkPHWCe3CO7XZ5V+VFQMJMdoGChhZJy4bJ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758718140; c=relaxed/simple;
	bh=/oGFj5yDl52VwtbI9NgtZJZkkt/CMZMsg9opZuMOGEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T3s6piilTAuiZNEvGhtLSDErBjZ1M4ia6XXsSplxsaVn2cu4U+I9AfHDvf3mSqr87E3AMVtnZcuQZ6L1hJ2+VIRjrOfEOUp/5AoJ6cu39Swmzn17dnGbbz4QmYlgPhg9yh79uQA+c0/oZPhxzOHNzxe8XNrYhw53o97C7cOajUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbaU+AjR; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5821dec0408so658105e87.1
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 05:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758718136; x=1759322936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7JhEQyLJ4tStQZeMjbdNTURPvFyv2MDrZVanIpjsKA=;
        b=fbaU+AjRaCJpOoCh6YFfhsUzE3KROTu3gljtkJrsQVSDVKK1YJlIjL0j5X6hWNXUjC
         IJOjOR4mytR8MyahhRk96704uhL8PixEm7E8au61cvix/eMQUP0zR9XNhK8UJCXPh7iP
         FR35DXfXWZGRS/1UpSs+jNcDO9rSPsRDRfWHBLweEyX2IGFU3EOvaVgRECg6GgHKCfFx
         fXqZLag3abK+FInr3fALn4DN3n/hiOLnCmKne3ycWM/WB5UU+qNOwt67EHwOnsGA3tFq
         HMFn39V08hp+yRQse3OCQKNpi4iUvZXkkQ+I3pJ2Xg3KZp2Xq/+5uAs/oZ9J4z6OnOJl
         r2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758718136; x=1759322936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7JhEQyLJ4tStQZeMjbdNTURPvFyv2MDrZVanIpjsKA=;
        b=ii7AdiTwHwd9l76JBnhLoveK6/wT7XWWnddko9Tohr9F0hjHsgnmiPHA07/XG9zOz/
         4rr8B4Yta1b0vM/lfMsg7pQkP+nFop+FqvDkZEphOIdw3WZMGBdwdrr+WsRKVfSh0RpT
         0l+dmYSFIOGHqhrh7dzj6VedBjVKisqR2tMQGdcHGj184f2Pj6LddB2yuxIuepAsXGQY
         qor58SaPEucgEky/EMbqs712Jz0UCUjuh3mcb9PNSUYWS5KYS3Ht1Xt9AEBbGClGG4rA
         6Z+RbroNesl94EewX4vs0k7IEJ5xjHHftTiLDlTNJjzjE5Qspb6L20qC1XSdWCSk6YyB
         MTAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYNn3KJm9lk4a3aGfdQ8NKHb+wNSNfYZanZ16S2RwIvghEgh/siJTo1jzS4oMe7vEnMkhJ5zqKiumbaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi+rMEpsoHRCoSIAEhXxX56bxH0+Y0iGMsgvVSpRlAQJRJXIiP
	grDSBR+tk9x+9158VEa3SXoVenj8YxwI/XyOdfafsB/0+PbLTJBxUB7c
X-Gm-Gg: ASbGncuDoC+XkzfxVtJ2QIp54pvffVl90MCfK/YDa8iZz8e+5rkdY2YnRmeEeydBWvx
	uAsMZJs6Ta+ZcNbFoAd6W4Vk2DQlbZkOtQXTFjuBGOkQ9MVZxxOSkdrxv0zcQKcpbSW2QWixyWh
	BODHDxUaJ7bKKUrKdJMDo8BSDyrcK9dt8Sj0N/mJAInKw30I1JcOF1R8YDuCMtuDf4w0Ng5BlV4
	ttTAb6WrZ3Ilx5dVIwed8kySUrRQWgFE6stXcnMAIk9Q3RBZXmA+GAMF9sAvf3IweUUuJFNs/zO
	iPRlIOMf019AOQcaJbwiLZewuyp44FvRT7sKFPWTFfCmVUglBgvbh4VBUyS2SiuvMc07nz9OHR2
	QxZ+aajWVYSaxMuJqKtMFF+h7hdVVcwGa8+KZeZV02kh8ebMCkhesF7WTB6wPehTNFVfHgSut+n
	8SyT5zY/dalVaRrkvI
X-Google-Smtp-Source: AGHT+IGsCjQ5kbJbHGIPwqnOsa+Tesxxo/+eEFeOI/jBB9wKGApdlCpF0dLkSsx1lqdtZ8hj+A5qAQ==
X-Received: by 2002:a05:6512:3b88:b0:55f:595f:9a31 with SMTP id 2adb3069b0e04-580745c448dmr2342043e87.51.1758718136145;
        Wed, 24 Sep 2025 05:48:56 -0700 (PDT)
Received: from localhost.localdomain (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9668090sm5052943e87.109.2025.09.24.05.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:48:55 -0700 (PDT)
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
Cc: Alexandr Sapozhnkiov <alsp705@gmail.com>,
	linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] gpu: i915: fix error return in mmap_offset_attach()
Date: Wed, 24 Sep 2025 15:48:50 +0300
Message-ID: <20250924124852.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return value of function drm_vma_node_allow_once(), 
called at i915_gem_mman.c:672, is not checked.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 75f5b0e871ef..eb76f8f2bd95 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -758,8 +758,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
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

