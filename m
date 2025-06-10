Return-Path: <linux-media+bounces-34383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F40AD2E5B
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80B561888A05
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 07:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB89D27EC7D;
	Tue, 10 Jun 2025 07:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="M+HiorQb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B64821FF25;
	Tue, 10 Jun 2025 07:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539327; cv=none; b=H4Hy0hC+dg71JrLBeG4J7cQjePCR2vHujVg3CAZCliQfdXcswso6ERt/KXbfYVDJWGNRmbw90Ezja9Z0QpOLONWh9uAd/FrcGDXYRZQUTCjA+Dx+rYHV5YoYApI1yTvUHnI4Re4tw8tnJc7NdaL8zPiTC4asiFOCQSMFOE1aN0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539327; c=relaxed/simple;
	bh=U4jGWHaIaMXuRCicMbs1PcoLZQJpE3+kZRirVXC12Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Q7VllF2eyc3qTl6MWggzzwAqjcZqgP7/TX5x6MEttc0tJw4frpSWsc7TFBjAksfbWrzUHQmO5De64KSPvas3TWRyqjwDxFZnztkd0c6miloDi1SJjwy5Ib2oce0F48HM2PyuHwQaCnLuXRS7bvmkwWWgMkBBR/1vArY9a6GUo60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=M+HiorQb; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6s2sX008257;
	Tue, 10 Jun 2025 09:08:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	TV0Ykqz+yMv+EUoGBcc//ckZ5rwVDZ0YS3LKw7DDNAs=; b=M+HiorQbPUS67Vop
	lOGtDiSaBQdsAbRwNg9ZCMZEV3n4RYD9YuLEauesT0tWuJS8lXP6tQuVRHgSfEAR
	3YbpiEdsOwAMdmzpmoGzx+54lJ5bU0OQqStzmt0ExDz0uJ2EWlXK2ToxHUXkEDmk
	mOoR8FNsvKtu2twhNmWBs9wzGlrxrxw4wFYHG4ZLt5rRDwziQzogjUc8IQv3wAyo
	CQBiBSSvNoxXPLv/yOMkhihIQoI6FW3SGFqWpJVhTQjYajNXcr+SFHZ9abXKJ24e
	0xZP43RZdZ9VCu69L86F79kGN4Eok5ZYFhBJiLEyoldljDrxNIoVcMurx3d58KCU
	+JFTjg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2k6sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 09:08:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2776D40059;
	Tue, 10 Jun 2025 09:08:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA57DB9E7E5;
	Tue, 10 Jun 2025 09:07:43 +0200 (CEST)
Received: from localhost (10.130.73.167) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 09:07:43 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Tue, 10 Jun 2025 09:07:43 +0200
Subject: [PATCH v2 3/4] media: i2c: vd55g1: Setup sensor external clock
 before patching
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250610-fix_vd55g1-v2-3-328305748417@foss.st.com>
References: <20250610-fix_vd55g1-v2-0-328305748417@foss.st.com>
In-Reply-To: <20250610-fix_vd55g1-v2-0-328305748417@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01

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


