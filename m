Return-Path: <linux-media+bounces-41105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C90A4B37966
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 06:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0BF61B65427
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 04:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C44D30BB86;
	Wed, 27 Aug 2025 04:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FTX85omX"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5006A30ACE5
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 04:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756270751; cv=none; b=mRtydQynrq+YDicqEjtE0Psr8duPfgDM+6t9BK0joeH7V/kZG3lacpP88ZN7HeK81q+kts1n6D8tPtgS4QfFnqaIv9j99jl7uDg92IBl+ISlCR2xCRKOPx/74leivwnmShprBZAtsyHaJqvbJsE8sS++pDxT8P0XZwsUhEnLzqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756270751; c=relaxed/simple;
	bh=VKOTiVgb3NZp/RJs2R0cfCmNJs+zE1QkjYhgAeEbwnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=rvCa7hO/Qmg39OFVJHmOCvIXB5O+Np7EdgQl9YnP9QYJDd1F5FQlCPVomYQXyWPc1zFAC60+6scwCgcWbq7zrCjxmRsVYLI1Mxcg2exkehmPeQZ/8/ftSb3xHnexG3Fkjr/uM/od548YovPPLg9I2uFX+jXiolSSwItTpHvcHxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FTX85omX; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250827045907epoutp02aa86f59500bec3797f3e33bf971d9d97~fhvCczkK23041830418epoutp02U
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250827045907epoutp02aa86f59500bec3797f3e33bf971d9d97~fhvCczkK23041830418epoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756270747;
	bh=4OaX8SYxIlvnIjTkW++dFL0U3/EmZSsNqRJJF3Co8hI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FTX85omXfrgSzUmKDRyWP3+NX1JgnQV87XUHKwsChnIDBwL2m8HzAyqMDuSCZVBaD
	 UX4mOQ3eo1HEpJ8ALuY4/32IKdV9PRQ+TA/4Gl20v7lW8BR5mOFN1P8v9Nt0F3f2Yv
	 GQg/RA3sfpp0aVbZxEWu9J0eFDBsQMDbcjL6hVNM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250827045907epcas2p2330c46b8a707ebf26928786595989d76~fhvB7xaPP1733617336epcas2p2C;
	Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.100]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cBXPQ5GpDz3hhTQ; Wed, 27 Aug
	2025 04:59:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250827045906epcas2p2198037517886df0714e24d8d908a6c57~fhvA-1I341733217332epcas2p2Z;
	Wed, 27 Aug 2025 04:59:06 +0000 (GMT)
Received: from mclaren.dsn.sec.samsung.com (unknown [10.229.9.108]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250827045905epsmtip2928268d367150f1c7d2d0e8b4493e7bb~fhvA3r_Mm1856618566epsmtip2d;
	Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
From: Kisung Lee <kiisung.lee@samsung.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Mauro Carvalho
	Chehab <mchehab@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Kisung Lee <kiisung.lee@samsung.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 4/4] media: samsung: scaler: Add Kconfig and Makefile
Date: Wed, 27 Aug 2025 04:47:20 +0000
Message-ID: <20250827044720.3751272-5-kiisung.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827044720.3751272-1-kiisung.lee@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250827045906epcas2p2198037517886df0714e24d8d908a6c57
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250827045906epcas2p2198037517886df0714e24d8d908a6c57
References: <20250827044720.3751272-1-kiisung.lee@samsung.com>
	<CGME20250827045906epcas2p2198037517886df0714e24d8d908a6c57@epcas2p2.samsung.com>

Add Kconfig and Makefile for Scaler driver directory.
This will serve as the entry point for enabling and building
Exynosautov920 specific device drivers.

Signed-off-by: Kisung Lee <kiisung.lee@samsung.com>
---
 drivers/media/platform/samsung/Kconfig  | 1 +
 drivers/media/platform/samsung/Makefile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/samsung/Kconfig b/drivers/media/platform/samsung/Kconfig
index 0e34c5fc1dfc..baff5f7b9c3a 100644
--- a/drivers/media/platform/samsung/Kconfig
+++ b/drivers/media/platform/samsung/Kconfig
@@ -8,3 +8,4 @@ source "drivers/media/platform/samsung/s3c-camif/Kconfig"
 source "drivers/media/platform/samsung/s5p-g2d/Kconfig"
 source "drivers/media/platform/samsung/s5p-jpeg/Kconfig"
 source "drivers/media/platform/samsung/s5p-mfc/Kconfig"
+source "drivers/media/platform/samsung/v920-scaler/Kconfig"
diff --git a/drivers/media/platform/samsung/Makefile b/drivers/media/platform/samsung/Makefile
index 21fea3330e4b..7a9e6f126628 100644
--- a/drivers/media/platform/samsung/Makefile
+++ b/drivers/media/platform/samsung/Makefile
@@ -5,3 +5,4 @@ obj-y += s3c-camif/
 obj-y += s5p-g2d/
 obj-y += s5p-jpeg/
 obj-y += s5p-mfc/
+obj-y += v920-scaler/
-- 
2.25.1


