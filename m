Return-Path: <linux-media+bounces-18253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B39397806C
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 14:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4AA0B24869
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 12:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30FB1DB537;
	Fri, 13 Sep 2024 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="RVtsq11r"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CEF1DA2F5;
	Fri, 13 Sep 2024 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726231775; cv=pass; b=nGrXUHRjjgLq2po9P5CUJF8B/YJrW6CN3WWLl+805gsm57ytPWKRo95RzA9N5hS8KFhvmVKELb16IqnA38/KzwR2we2sX0sMGz3S0XSu+/d62kiI5eT5IeKlX+ArLgt/IiBWhY7BOUkBPFGoPE6BIrK5uKLCqev/SSguwdWXIkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726231775; c=relaxed/simple;
	bh=j9fxkIckaZRFjZBTdCAB2ad0eiY6EGtMfgHWpTnR1gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XiHz96PhW1NOYjS4rFTtkGLHQRl73gXjtFUanBgeCKSWMiKechYZH0Jzl1QgcwuXz2RqisKiUNT4GmABMll7WLG/kdM0YL/9pVprORHfw2a91XRr+n2+AKbK5LoaclwPins8cYFY2HmLsaj0Egh0c+iBeEyBqWL/fPDrrHUAdRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=RVtsq11r; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1726231757; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eRmUTlczT4Ojz0yLmORGlctuuhknFZc9oFV7cb3pjIH6snTZFemK1ZWdWKUDII4tKXPEr1qfvxrb8WOKl1ikaKXNXvkx2dyhRMFz/MgNByELtd3MncutYZbilftF+tk2b+TaXDV3iyNaAQaTKPCeiMsIzFSaAwDqTzphNXfdRWY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726231757; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tOmkiNeVoubNbMOpF1oIX3mV4RjrwsW567k6frbbaH0=; 
	b=jYtRyEFLCnGB7yHKVDyteYV5PW4Mj9nOhOJv0ckONctxuSbOR63rSt7y/g3UIMw/SNwTX210L23/UJJfEXqUPddmmCu8rASHSUrP8ktLKAbFvpY7zPWiEtuv/VVwpLQBn3nnD01W5hkvWNxdGIiw0b1cKD2aFXskYecNSXxytnc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726231757;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tOmkiNeVoubNbMOpF1oIX3mV4RjrwsW567k6frbbaH0=;
	b=RVtsq11rrXBBASWwxE6s7NyEnLttF2Qia1wJqeYybL8M9LkJt7ZiWRMYsgTBtwfS
	4U/IGhQbJE01/psB2BUeI8q/LWoGm0w/OUtYcvwzkUH42D1OaMl+/PTGEdxGn301PLu
	pYSrugdtylsBRU8LsGYdjChmY8fOP9/e2q+3oC64=
Received: by mx.zohomail.com with SMTPS id 1726231756259603.0430132743846;
	Fri, 13 Sep 2024 05:49:16 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v6 2/5] drm/panthor: record current and maximum device clock frequencies
Date: Fri, 13 Sep 2024 13:42:10 +0100
Message-ID: <20240913124857.389630-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913124857.389630-1-adrian.larumbe@collabora.com>
References: <20240913124857.389630-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to support UM in calculating rates of GPU utilisation, the current
operating and maximum GPU clock frequencies must be recorded during device
initialisation, and also during OPP state transitions.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 18 +++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_device.h  |  6 ++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index c6d3c327cc24..9d0f891b9b53 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -62,14 +62,20 @@ static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
 static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
 				  u32 flags)
 {
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
 	struct dev_pm_opp *opp;
+	int err;
 
 	opp = devfreq_recommended_opp(dev, freq, flags);
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
 	dev_pm_opp_put(opp);
 
-	return dev_pm_opp_set_rate(dev, *freq);
+	err = dev_pm_opp_set_rate(dev, *freq);
+	if (!err)
+		ptdev->current_frequency = *freq;
+
+	return err;
 }
 
 static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
@@ -130,6 +136,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	struct panthor_devfreq *pdevfreq;
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
+	unsigned long freq = ULONG_MAX;
 	int ret;
 
 	pdevfreq = drmm_kzalloc(&ptdev->base, sizeof(*ptdev->devfreq), GFP_KERNEL);
@@ -161,6 +168,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 		return PTR_ERR(opp);
 
 	panthor_devfreq_profile.initial_freq = cur_freq;
+	ptdev->current_frequency = cur_freq;
 
 	/* Regulator coupling only takes care of synchronizing/balancing voltage
 	 * updates, but the coupled regulator needs to be enabled manually.
@@ -204,6 +212,14 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 
 	dev_pm_opp_put(opp);
 
+	/* Find the fastest defined rate  */
+	opp = dev_pm_opp_find_freq_floor(dev, &freq);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	ptdev->fast_rate = freq;
+
+	dev_pm_opp_put(opp);
+
 	/*
 	 * Setup default thresholds for the simple_ondemand governor.
 	 * The values are chosen based on experiments.
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index a48e30d0af30..2109905813e8 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -184,6 +184,12 @@ struct panthor_device {
 
 	/** @profile_mask: User-set profiling flags for job accounting. */
 	u32 profile_mask;
+
+	/** @current_frequency: Device clock frequency at present. Set by DVFS*/
+	unsigned long current_frequency;
+
+	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
+	unsigned long fast_rate;
 };
 
 /**
-- 
2.46.0


