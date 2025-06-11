Return-Path: <linux-media+bounces-34499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93434AD508C
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 11:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1766517FCC7
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 09:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D077325F968;
	Wed, 11 Jun 2025 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="tqRRcgw5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EB123AB9C;
	Wed, 11 Jun 2025 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749635477; cv=none; b=m+UBp71LlthcVE/cbmlNGXXHTAiXlOmGeFrfInA+sewkt84507+gYrn/FQ2jT2akNxpeYWGsCSv5GRu9Cr0TJb7IAsvk07QedymhlExGK2KLny0d4sGVCuDjD7bR6uUQRJ145OUvdlo9FHm4My6i4Kq+wKS51ik1fSg9DDP9U84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749635477; c=relaxed/simple;
	bh=U4jGWHaIaMXuRCicMbs1PcoLZQJpE3+kZRirVXC12Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RH69dA6ghpzhGKfbY6HOGMP3jVnUyjLQ4k7t3oQnYGdTaHaNq8yqY/i2nm452vivR2y8Y7HJEBZhYYrrFxQ9URqply9gceNHFK9ChdzbG3UIjCOG7xiG6CPhE75SU1Hqbo25tCUbG5JOUKg1PP9ywbCxjDFwe/KWU1IR0Mk0Yu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=tqRRcgw5; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B6Iv5f012912;
	Wed, 11 Jun 2025 10:49:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	TV0Ykqz+yMv+EUoGBcc//ckZ5rwVDZ0YS3LKw7DDNAs=; b=tqRRcgw5gq6Na7K2
	dWJ2gFSn7A40zkOd+PY4FM86BgEAUU0QGq3zvCf2mrn9d9ATFxh9YJZpPKQExB6f
	XETvYXAfy7+3uJ2MYT0on9gBuyBxtSeafwid/VpKIT88iotZJs9esbT1xbng1eTw
	xyqF5Owq2T0zutwa6RJW+3a5WqbGMIGs1Nclt18xUXmA6VxxCiZCejuSKaFDBODL
	/KDOYWWfAtLGwBVaA14ppfFT94RORbpEU/LZW54owDcl8oY0Bh2pQVLe1GWFxmeN
	PIjxG7yKmnqApa0mZFPp5VoWND45Us13Dl7UzhaoPiPYcVuDe8Djh172fOgpWTTw
	wNYs7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aumhngn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 10:49:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DB89840088;
	Wed, 11 Jun 2025 10:48:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6ADD2AFE7D7;
	Wed, 11 Jun 2025 10:48:40 +0200 (CEST)
Received: from localhost (10.252.5.102) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 10:48:40 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Wed, 11 Jun 2025 10:48:32 +0200
Subject: [PATCH v3 3/4] media: i2c: vd55g1: Setup sensor external clock
 before patching
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250611-fix_vd55g1-v3-3-ef4ecf15ddbc@foss.st.com>
References: <20250611-fix_vd55g1-v3-0-ef4ecf15ddbc@foss.st.com>
In-Reply-To: <20250611-fix_vd55g1-v3-0-ef4ecf15ddbc@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_03,2025-06-10_01,2025-03-28_01

Proper clock configuration is required to advance through FSM states.
Prior than this having a different clock value than default sensor's
value was used (12 MHz) could prevent the sensor from booting.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 336dc3c85ac9e695f22aa524e0df6138dc76e45c..dec6e3e231d54a742bdd08ff2a506c152bb89429 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1038,8 +1038,6 @@ static int vd55g1_enable_streams(struct v4l2_subdev *sd,
 	if (ret < 0)
 		return ret;
 
-	vd55g1_write(sensor, VD55G1_REG_EXT_CLOCK, sensor->xclk_freq, &ret);
-
 	/* Configure output */
 	vd55g1_write(sensor, VD55G1_REG_MIPI_DATA_RATE,
 		     sensor->mipi_rate, &ret);
@@ -1613,6 +1611,9 @@ static int vd55g1_power_on(struct device *dev)
 		goto disable_clock;
 	}
 
+	/* Setup clock now to advance through system FSM states */
+	vd55g1_write(sensor, VD55G1_REG_EXT_CLOCK, sensor->xclk_freq, &ret);
+
 	ret = vd55g1_patch(sensor);
 	if (ret) {
 		dev_err(dev, "Sensor patch failed %d\n", ret);

-- 
2.25.1


