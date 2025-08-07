Return-Path: <linux-media+bounces-39026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86505B1D61B
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 398027A38B3
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC5E2797A0;
	Thu,  7 Aug 2025 10:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dYzNvpFb"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E39276038
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564023; cv=none; b=cFgxqxZmnASJee4O9ufDWT+UxnBh+y8n8yDCwHhVuFbH0UjyqMIysuxtJr3kgICcAjM7Lz2EICTSJ39iqQEuwiLd9Gl/ZUOZgbmfNJR36ydLyr5IEB14hzkZg2inrGbgcZz0AeiA00ems6yZRhcRV6zpjeRyLyrhCvrJTJ/CNRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564023; c=relaxed/simple;
	bh=Bt378lZ+Cs18jytbHg9RbVCu7Q90SLRzhvx1NHvTBvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=cPSzbCo8LH3Ly5DrKfrjvRilRQCjCqK+wLw1sdGWjv9fVux9XDFyMl1omerdg7YxKKIjgwQAsX1mWc/mvKjMdu1xhl0528ta3uS7ILuOBbDPJjLUyhIhUzBqwm5no4VjCVAtze/Wv0Mk+yjEEl5FtKp341uT+5ESHqB8NzgQ+1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dYzNvpFb; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250807105340epoutp0275d5031a30be87b5d5a6cc7395ceb99c~Zdq4mzhWa1884718847epoutp02O
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:53:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250807105340epoutp0275d5031a30be87b5d5a6cc7395ceb99c~Zdq4mzhWa1884718847epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754564020;
	bh=5MzbbvKs/a2j95Tbyz9m/AbhGl8sczbKFngjNmIDh7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dYzNvpFb0AWByPoGAKnSlG+z0tU5PtlDknLZC9tyJvD/BjZrRggV43mdU/8sddkRz
	 z9j04+NIzkEJ8YLHDFNVydEoNrEZoX/gbGWOkQy4QBm25kvyqRMAhOaWOAk0ihGOma
	 w6WzeX4MYwgK7bUCZXt8pRx61BOiWWMNuWJ5X+1U=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250807105339epcas5p21708ee650a6a54de51efde755ea0ebf2~Zdq36g0Y52077420774epcas5p2a;
	Thu,  7 Aug 2025 10:53:39 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4byPCk3WTTz6B9mD; Thu,  7 Aug
	2025 10:53:38 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032523epcas5p2a270279907bbccdb08b45f56a8c38f21~ZXjevE1a90047300473epcas5p2p;
	Thu,  7 Aug 2025 03:25:23 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032520epsmtip2688aadc45389571d3e7f1ad39f79c9fc~ZXjcvfuFe1346113461epsmtip2T;
	Thu,  7 Aug 2025 03:25:20 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 08/10] media: s5p-mfc: Add new compatible string
 corresponding to S5pv210 SoC
Date: Thu,  7 Aug 2025 08:54:47 +0530
Message-ID: <20250807032449.92770-9-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032523epcas5p2a270279907bbccdb08b45f56a8c38f21
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032523epcas5p2a270279907bbccdb08b45f56a8c38f21
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032523epcas5p2a270279907bbccdb08b45f56a8c38f21@epcas5p2.samsung.com>

'samsung,mfc-v5' compatible string was getting used for both S5pv210
and Exynos4 SoC. Based on SoC-specific, modify existing 'samsung,mfc-v5'
compatible to 'samsung,s5pv210-mfc' and add its variant data. Add new
compatible for Exynos4.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index d13770058e63..f8476bc3a5ce 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -1708,7 +1708,10 @@ static struct s5p_mfc_variant mfc_drvdata_v12 = {
 
 static const struct of_device_id exynos_mfc_match[] = {
 	{
-		.compatible = "samsung,mfc-v5",
+		.compatible = "samsung,s5pv210-mfc",
+		.data = &mfc_drvdata_v5,
+	}, {
+		.compatible = "samsung,exynos4-mfc",
 		.data = &mfc_drvdata_v5,
 	}, {
 		.compatible = "samsung,exynos5250-mfc",
-- 
2.49.0


