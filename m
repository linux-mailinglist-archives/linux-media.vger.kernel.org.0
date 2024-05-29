Return-Path: <linux-media+bounces-12147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ED58D322C
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 10:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A14B28BA4C
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 08:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273CA169AD6;
	Wed, 29 May 2024 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILaViMH0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07055168C18
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716972207; cv=none; b=VCisSALRMtk/FQotBIFx63idSXMyYYXemaDOah0NJ6zixpPPwseDhuJLMwatV38v0FsFNxT1ckM69trQ44Z22uaBt+0WCb+4+z6Bx9c0xhZdb9npdv0AB+9Xvv1pHJfhDNqVdYQ0YKKyH3xOhxU8nZ/5fiTbfD4gh+GIs39rJZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716972207; c=relaxed/simple;
	bh=BN74gmJKS3JFa97V0N0NoFvUUhwKCALLUf6zdqSdfX8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WCXupVP64NYzpFDl+gcajFeBzTkmuRLeguk6MrKgxuE80UuBKoxcVnXPWB3HxOxPc7HGoy7kY8vZeyxaoaIgie5/yNZjv28hDxncULpsXloe7D7wiXNyVrugefrvG7QB0BuzoTWmN8ksazE6h/pyDgSdRRheOnF18jy/TFmPZyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILaViMH0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42120fc8d1dso12864225e9.2
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716972204; x=1717577004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lvhs1YIV6pAjRxwybpgLmMel6kLADeGuuGr92YQQdas=;
        b=ILaViMH0R4lQUGJxQ6X9D3r8a5qtQvTCBh2RVwL2bfEP+7GJ4UmBxlsbqM2MipSCc9
         8LVQArAY/qZn0Y02JbheUGE+0lJq42r4tpOnuBj6CKGSK1gIc+kv0UYXH9Q+Nt7hwBUI
         lTBQxu+5Z3YWeFJ00ZvLRKVq34AzTZHDhUVsB8HD9MqCf2qS4OnrY8/bfPvD0P2O3jD3
         gMpfHLl5BsGUHdNbw/gbJV3RrrQkuSpfkW8UI4hYjnri/Z2UY+483DVTnUg7JfI6mVLx
         rU/yS1nDDv9SWmB1gxczb3gl4b8mdtq/2YvYFaQqHbvlSSk5ZwoGDoj7WoGRH50WAvRR
         +Tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716972204; x=1717577004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvhs1YIV6pAjRxwybpgLmMel6kLADeGuuGr92YQQdas=;
        b=mbx1k/0KE9yQBBP7u/DA1/Le9BXNatooq7m5aqHYUhU7lJuM1AzLZBVHmsBRQs/Smi
         hEmatcg1ry3YEzPmk+NAvMk/ht6NTjcQb019NAjITFmmZ/NTGKjeaRM1aUYUivW5QaR7
         q0P2F1m+OTM+PA/N0clhdUffkYHkzFt0hm12s2ab7PACUFXXU8yU0HKSCiEQFuNxsqf2
         15Eb/tG2esCEEyiRdtIBQBIyPXuXnMY9FN1eHvZ1grST/jjkhEgUOM/5Do2U13fT52Gs
         NrZdxUrKHZoz1s7q38aolMWXmhrubBVG6DZOyevbm7GGZYs7mekbflQdEto2qhIM7tmv
         0W/w==
X-Gm-Message-State: AOJu0YwsKBj7L6L/kqb2Cvq8KzeBBpAwubsE28c6STyAn6e9vxXVAs/Y
	X7ApDqUTPnquL8RCux9LCQCGC0I2BlOH7fXrqJq3cQIuhMAqNjcVFLxJKvaT
X-Google-Smtp-Source: AGHT+IHKTLDXQAqpReBZKZ8jDWLCepRMhyiee8/k86QBffcnCdZq0RvxicFRDsDKZ2JIjkbbv4RAGQ==
X-Received: by 2002:a05:600c:314d:b0:421:7ad:daab with SMTP id 5b1f17b1804b1-42108a4f606mr106018725e9.7.1716972204003;
        Wed, 29 May 2024 01:43:24 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:150d:a900:2eeb:e69b:7ecb:9c4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3577505a218sm10975107f8f.31.2024.05.29.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 01:43:23 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: sumit.semwal@linaro.org
Subject: [PATCH] dma-buf: add a warning when drv try to reserve 0 fence slots
Date: Wed, 29 May 2024 10:43:22 +0200
Message-Id: <20240529084322.2284-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When dma_resv_reserve_fences() is called with num_fences=0 it usually
means that a driver or other component messed up its calculation how
many fences are needed. Warn in that situation.

When no fence are needed the function shouldn't be called in the first
place.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index e2869fb31140..5f8d010516f0 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -186,6 +186,13 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 
 	dma_resv_assert_held(obj);
 
+	/* Driver and component code should never call this function with
+	 * num_fences=0. If they do it usually points to bugs when calculating
+	 * the number of needed fences dynamically.
+	 */
+	if (WARN_ON(!num_fences))
+		return -EINVAL;
+
 	old = dma_resv_fences_list(obj);
 	if (old && old->max_fences) {
 		if ((old->num_fences + num_fences) <= old->max_fences)
-- 
2.34.1


