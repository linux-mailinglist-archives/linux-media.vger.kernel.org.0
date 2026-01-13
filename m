Return-Path: <linux-media+bounces-50599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5985AD1AB56
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 18:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22930301C562
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 17:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B213D394470;
	Tue, 13 Jan 2026 17:45:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65501393DE7
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 17:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326302; cv=none; b=c4KR+CslpfuMAIBzKA+FJjdY5qZnlJd/oILooR5WI9ojtMXNKB/Vs2mavCow6crTtCzi5dkxpm2cukP+yTrehPVRVweSSAYSPZVqVaj7JJ5+TsOSUsEtTLgRI7keGrMgST7Y1wel/0eqVuAnjaDyHqOPhapY3L22is7td22YG94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326302; c=relaxed/simple;
	bh=gru4oOn5Z4uZPsJ0ld3fd8SL8rSg/YQgIjZocoovrQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K/U6ZECw5qYoqzpOd5y/J2jeNrxun8haPlQWYpM8ps++pEOS2QGi+oVl/4l3LzFSxYZ9YRQk9bd+dJjDP4nM/O3M37duJzDkCbTPqRlugRwjKdXk6eJxFDFLbZjiaqlx+3VLn/zJbjyvdkVRnHLPzPVyXeh8U3RXmWxlM5Ee/mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-652fec696c9so1994586a12.3
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:45:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326299; x=1768931099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eavvu1t15qKvDTI2jSsLTlj8ivnyPIJR0TkymEC1eF0=;
        b=H+WK87kr1pOBEwjZBRcU7nVn1o/DrqB/NY8FiAQ2McNHI8mfE8GqaNv98oCYstPNtf
         2y9sqgm1EGHKBY3IoFEZaNoD7qfNUa50eFv5kT4FRMTeZyq+TiqUT17cEzDDFINgkref
         rLUVwKQ+SAcVKYnRv+LyliRDKyp4PoFBMitlnCj8FlJMYbvY4+Rn9nBfiQ6LE1afaQFU
         GXHwo77dwPTUVJOrylzan68NU9WBzkcU/v+97HZXKovG0XJwmQwyxAD9bEjjUBchdit+
         psPoMaFpq6nAOioKpcPeDYUZ/KZ9R80H7vHtk2wRwil2vIvDlhavfiaSwHyCeiKClOxT
         mvdg==
X-Forwarded-Encrypted: i=1; AJvYcCVm16csAaroDRHMnb2EeB6pNngllhJRXuanvxZ6QtJvWdl14QleqqRRDIRv5lP52guwq8FMI3oiXnXMNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpnxoILiq6+1o8HxXAcGfdMtOg4FsISHaWaSDWEkMx367PCxXP
	3CUz1I3XueydtcCqlQlzIOM4e5FF/iND90ROKB5CeH3T1adcRLy4T3gg
X-Gm-Gg: AY/fxX6sprsQSFmvs/eKIlpkNMFZ6LV876zwJ4IQBCROe5ouDs7rQ1ohNc93OZHMaZZ
	d7sX1nQXtFCNZoHV7iLLO8YzThzJkKUmbMfn6N8q5Z1L7ghm3zqsEl59++gcNBoNS2YXnmP9Ce5
	n/lW2zx0kG+158DOoi12ErtybPld+RfAAtS0CswoJqPiAUSD8P+VHsuh26j19BJQ+OGvRjCf9WD
	XXWML3CnzGz7p1s+T+FvEDz631UlegsN+Dej9wHv4lzoM8cgeYY4O0Dfz0FOpOcPE5W9AaDW5p1
	ZBUIYbMTrkULEq3UFIsf7EXmA2gcy1qOVjyjphqM7YILucgc1TvgnukdAaPDjd3tRU/txBN696k
	Yp4rXEnIAvuZRQ5uHCqQTp1nAw9NLspugklXiCzyBZzvXZxCilR/WXDTAglUqOEWRsWA/Y05/Zp
	fpDGAreTHfm2cGaEC/vWf8t4Yy0ZVQZ8WGV6/D1NqQR3Q9Fg==
X-Google-Smtp-Source: AGHT+IHjwdSSN4mTRKXDjSC9xCBKsqwskTn4GwaR+B+tRXZTp9WDKqbrL/GHsxrwpYwUo4qku7MY+g==
X-Received: by 2002:a17:907:7742:b0:b87:1eaf:377c with SMTP id a640c23a62f3a-b871eaf3facmr466107266b.38.1768326298728;
        Tue, 13 Jan 2026 09:44:58 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm20873259a12.17.2026.01.13.09.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:44:57 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 13 Jan 2026 18:44:39 +0100
Subject: [PATCH 5/5] accel/thames: Add IOCTL for memory synchronization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-thames-v1-5-99390026937c@tomeuvizoso.net>
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
In-Reply-To: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

The DSP cores have their own access to the memory bus, and it isn't
cache coherent with the CPUs.

Add IOCTLs so userspace can mark when the caches need to be flushed, and
also when a writer job needs to be waited for before the buffer can be
accessed from the CPU.

Initially based on the same IOCTLs from the Etnaviv driver.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/thames/thames_drv.c |  2 ++
 drivers/accel/thames/thames_gem.c | 52 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/thames/thames_gem.h |  4 +++
 3 files changed, 58 insertions(+)

diff --git a/drivers/accel/thames/thames_drv.c b/drivers/accel/thames/thames_drv.c
index bf7355832241d5a671e196f465d891effaa4a8fb..9b72db433fbb8f9239a16a047a52520f0a01d125 100644
--- a/drivers/accel/thames/thames_drv.c
+++ b/drivers/accel/thames/thames_drv.c
@@ -76,6 +76,8 @@ static const struct drm_ioctl_desc thames_drm_driver_ioctls[] = {
 	THAMES_IOCTL(BO_CREATE, bo_create),
 	THAMES_IOCTL(BO_MMAP_OFFSET, bo_mmap_offset),
 	THAMES_IOCTL(SUBMIT, submit),
+	THAMES_IOCTL(BO_PREP, bo_prep),
+	THAMES_IOCTL(BO_FINI, bo_fini),
 };
 
 DEFINE_DRM_ACCEL_FOPS(thames_accel_driver_fops);
diff --git a/drivers/accel/thames/thames_gem.c b/drivers/accel/thames/thames_gem.c
index a153e73a15253e0f955d74020b4765a1fa833fc4..2ad5a62bea275eb38a96b9d9bea804ed94ffb011 100644
--- a/drivers/accel/thames/thames_gem.c
+++ b/drivers/accel/thames/thames_gem.c
@@ -353,3 +353,55 @@ int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_
 
 	return 0;
 }
+
+int thames_ioctl_bo_prep(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_prep *args = data;
+	struct drm_gem_object *gem_obj;
+	struct drm_gem_shmem_object *shmem_obj;
+	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
+	long ret = 0;
+
+	if (args->reserved != 0)
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	ret = dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_WRITE, true, timeout);
+	if (!ret)
+		ret = timeout ? -ETIMEDOUT : -EBUSY;
+
+	shmem_obj = &to_thames_bo(gem_obj)->base;
+
+	dma_sync_sgtable_for_cpu(ddev->dev, shmem_obj->sgt, DMA_FROM_DEVICE);
+
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int thames_ioctl_bo_fini(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_fini *args = data;
+	struct drm_gem_shmem_object *shmem_obj;
+	struct thames_gem_object *thames_obj;
+	struct drm_gem_object *gem_obj;
+
+	if (args->reserved != 0)
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	thames_obj = to_thames_bo(gem_obj);
+	shmem_obj = &thames_obj->base;
+
+	dma_sync_sgtable_for_device(ddev->dev, shmem_obj->sgt, DMA_TO_DEVICE);
+
+	drm_gem_object_put(gem_obj);
+
+	return 0;
+}
diff --git a/drivers/accel/thames/thames_gem.h b/drivers/accel/thames/thames_gem.h
index 785843c40a89a9e84ab634aad77e9ec46111693e..e5a8278e98c578c2903cf23aea1bf887be0389e8 100644
--- a/drivers/accel/thames/thames_gem.h
+++ b/drivers/accel/thames/thames_gem.h
@@ -29,6 +29,10 @@ int thames_ioctl_bo_create(struct drm_device *ddev, void *data, struct drm_file
 
 int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_file *file);
 
+int thames_ioctl_bo_prep(struct drm_device *ddev, void *data, struct drm_file *file);
+
+int thames_ioctl_bo_fini(struct drm_device *ddev, void *data, struct drm_file *file);
+
 int thames_context_create(struct thames_file_priv *priv);
 
 void thames_context_destroy(struct thames_file_priv *priv);

-- 
2.52.0


