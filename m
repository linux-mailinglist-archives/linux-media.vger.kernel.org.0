Return-Path: <linux-media+bounces-14825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 812B892CE41
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 11:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CF3B285AA3
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 09:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1BA18FC6C;
	Wed, 10 Jul 2024 09:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="RAaMU1DY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CA284D0D
	for <linux-media@vger.kernel.org>; Wed, 10 Jul 2024 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720604006; cv=none; b=QPRIfjiHA3Pcgh+3NBgfdMpj9kwNC9FJkj2SYdx4g9vzeod4ochEHkymUdZAMoXNdknSh6t9YHgLqd9h9nUGOgZAOhtOHgLcs4FW/qLWEjBBAPNGZVk1f/ufd4d3TTTgdaREJvQW0p3dXFAaop62ZjHlYbNmPDDNZnc4QZXRP9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720604006; c=relaxed/simple;
	bh=N+dZVEJ8nJMAFRXQCYmz3Dujgc4/GF2zc1NIyCFnmmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PsIvt/Yqn6v9cvARCxiAITF9FUdjTTbnLBl0ylkDEbovlPLZ5ZeOfKl9E2PvRU1X85LPJvmSKNaJWgrKBjafZGd8um6bfctBai/isUO7/XQz0+Z3QaQ0zfA3YuJE+/WDVntyRKdpMf79YaLvMr8bB25fScCENyoFac0kpKYVV48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=RAaMU1DY; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ea84b6131so633594e87.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jul 2024 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1720604001; x=1721208801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GTHGZWFFIG2y8znG1jvML///poV3IrhnVzz1kC5uonU=;
        b=RAaMU1DYxFpW2zRlE5w7W+C+/UqEpGSH9cOtRdWVZgc6zye8fn/QrPGJpmL3HgEUKL
         P2hcjvLMXAWmBEhrnWxB9IAvtSs6m/2fYc9cbRX+/AG9D0SAWkkbGZCd6VcC6wOQ5mWm
         jfAULBDrQEQbxYuP1ROSZvHJL+QR2BJsxjDGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720604001; x=1721208801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTHGZWFFIG2y8znG1jvML///poV3IrhnVzz1kC5uonU=;
        b=TWOTwRQWOCFWmVCE6zm2P5w6Mb1iamSBZ/+PJHGXT5zaONP5lAmhs1pHZQMd9lalOR
         X+Htr11mqRUUJgJQirwSYvg//XfrvLjQOpwraqXMN/4zqnavgkdH2XKMBmnDHWnisiUY
         jjg1lYXVj9KaKcJOHNPUAcFYETNXYJ1wfXfCeytNwly1SKuatBKeke/OdMBBiiYMeLOf
         mgjuwIJH2O0/Dt67ppbvyOMhwXSe9StQqKhKkSJOIcU2jpOgk6uXEO5G3HuLVtUSE01J
         tSO29U/Nn/AM/DdXglzlgYkR8CtFM0Hly6RRkAzsop76f8yPh6wSgNEY1njtim/dVapQ
         381g==
X-Forwarded-Encrypted: i=1; AJvYcCVTR1/G9TWCOK6UjG07TA51DA19zICboOy+3RDxHy4O62qW8w2iEV2UDnGo1t6n7EZnW8LIXuYlI474z5V+T0LtUSqjPxXBS5VasuI=
X-Gm-Message-State: AOJu0YzJZrGhb6HIZCU0ONi8+9Tb6u0A0xrqNxtnf+H7q6V95fg/FogB
	KibfFjJ1dg7FQk+xi4Z2YHTKw697tgaFvtQ28S8HCr88yK0Z5nywYyiT39H80Y0=
X-Google-Smtp-Source: AGHT+IE53obXe9iAhMtu+VAErcsSEkowso2ZAWhhq6KbgW5hVFggamUEZCMm4iphO7D+n2JaklYQbA==
X-Received: by 2002:a05:6512:10d2:b0:52e:9b18:9a7f with SMTP id 2adb3069b0e04-52eb9993c36mr3246261e87.2.1720604001546;
        Wed, 10 Jul 2024 02:33:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f5a27sm73448935e9.23.2024.07.10.02.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 02:33:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Daniel Vetter <daniel.vetter@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/2] drm: Add might_fault to drm_modeset_lock priming
Date: Wed, 10 Jul 2024 11:31:16 +0200
Message-ID: <20240710093120.732208-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We already teach lockdep that dma_resv nests within drm_modeset_lock,
but there's a lot more: All drm kms ioctl rely on being able to
put/get_user while holding modeset locks, so we really need a
might_fault in there too to complete the picture. Add it.

Motivated by a syzbot report that blew up on bcachefs doing an
unconditional console_lock way deep in the locking hierarchy, and
lockdep only noticing the depency loop in a drm ioctl instead of much
earlier. This annotation will make sure such issues have a much harder
time escaping.

References: https://lore.kernel.org/dri-devel/00000000000073db8b061cd43496@google.com/
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/drm_mode_config.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 568972258222..37d2e0a4ef4b 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -456,6 +456,8 @@ int drmm_mode_config_init(struct drm_device *dev)
 		if (ret == -EDEADLK)
 			ret = drm_modeset_backoff(&modeset_ctx);
 
+		might_fault();
+
 		ww_acquire_init(&resv_ctx, &reservation_ww_class);
 		ret = dma_resv_lock(&resv, &resv_ctx);
 		if (ret == -EDEADLK)
-- 
2.45.2


