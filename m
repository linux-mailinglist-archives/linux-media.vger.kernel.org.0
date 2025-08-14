Return-Path: <linux-media+bounces-39933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CB6B26C48
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 18:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E40A5E59E6
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 16:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7ADB2561D9;
	Thu, 14 Aug 2025 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c0+a11b0"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CB022422B;
	Thu, 14 Aug 2025 16:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187866; cv=none; b=hPrxqhrhYR/ACqNbBLwEji/vYnf5d0T7Ut8SjgTQ0IQZ62PY6dexgBl5q9FxJ3oP7QaVRY68n4quV1x6lYAndP2Jryva/U/+gGMPM84bzVZMTFTNgHEfdPg1L5A88cqB9P0mkfPkON9YaHxqL/eBj+0L3Zi9TaY1x1p9WZ/MgCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187866; c=relaxed/simple;
	bh=XHV9UrGEnitol49ftiO/ZNvDXQoRWNPkFOwiowa3AcI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oXONuczvWUmuJAztWuO9c8sXNMi9tctnU6XZo+Sfe9MbrcZTAsbIxo3wA5bfHQV373OV+6nEf4oYJh2FaxZoWIzp9KBO8J66EQBxqy0s4eGTlTIVBwEf47az2JxxbEmrA5Ox49BqlwPq3HoZvpXNUY9ByxLAYB0N74fIvPqAvgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c0+a11b0; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EGAokI1916355;
	Thu, 14 Aug 2025 11:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755187850;
	bh=LpgToupgEg8P8EBDABiEqZQeCDsv8DH/034a0fs0cvQ=;
	h=From:To:CC:Subject:Date;
	b=c0+a11b0yLEg+ccD8HKj+/j0zFUIHqh9owudS+mB9eqhfIKaS3T7ekVztpa7JcDjK
	 w0q6bS0Z7zigiTFxe5WJ7nZpzZYs795fC2KacWctqRII1sRFo0twdVU3bM2Z2RHWBV
	 oO0YCuP2gI10SD1zeNkyjSdQUWQY7edb6W8UC+jc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EGAoBo1823421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 11:10:50 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 11:10:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 11:10:50 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EGAndk4172380;
	Thu, 14 Aug 2025 11:10:50 -0500
From: Andrew Davis <afd@ti.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Paul Cercueil
	<paul@crapouillou.net>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        Daniel
 Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2 0/3] udmabuf: Sync to attached devices
Date: Thu, 14 Aug 2025 11:10:46 -0500
Message-ID: <20250814161049.678672-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello all,

This series makes it so the udmabuf will sync the backing buffer
with the set of attached devices as required for DMA-BUFs when
doing {begin,end}_cpu_access.

Thanks
Andrew

Changes for v2:
 - fix attachment table use-after-free
 - rebased on v6.17-rc1

Andrew Davis (3):
  udmabuf: Keep track current device mappings
  udmabuf: Sync buffer mappings for attached devices
  udmabuf: Use module_misc_device() to register this device

 drivers/dma-buf/udmabuf.c | 133 +++++++++++++++++++-------------------
 1 file changed, 67 insertions(+), 66 deletions(-)

-- 
2.39.2


