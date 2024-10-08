Return-Path: <linux-media+bounces-19241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D755B9947B6
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDB6C1C24ED1
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0141DF721;
	Tue,  8 Oct 2024 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="XD8Lo72y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3731DEFF1;
	Tue,  8 Oct 2024 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388207; cv=none; b=Go/rILCVpMd6A/Mug4IPKWpOPtAiP2ZyflBmlRGPJndRVSpBIi1TdiiKcWEOS9qzcE0UkHfV8TKyZKuSxcMRXlwniV1gyJVlqL5kOcznNB/utNQpJD8e+U/GdbsM8e7vKuglyHRTB1LruDTQYkJpyIH0ZejoDL4Y0gVPdhEG9wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388207; c=relaxed/simple;
	bh=uHCcsnQARIuwiUEcq+L18xIRwNPj1IHXtEZslZlqpP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QAX0ga17MPzyn6CZ1hZwqQi4qomtFV5zZQ8C7YDHGGorNLIBCAUd66rYo1E3dt708RQohAGS1oL/h4WNHIsXtDH66WPqPfOkCO+OMqeuszXQyHIgy1LYPm0YMrgIt5f1d8hvQLEPEG06LtljzCwvjK5t8qTgUhjKrtusLILlIdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XD8Lo72y; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498B85O5010486;
	Tue, 8 Oct 2024 13:50:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ezNjJ416FrgMLBGxqqXBcKBs7f7037S7P18JphZTJM0=; b=XD8Lo72yvjBXQ7pJ
	2PEcajwlVEM2xuEhvJy8/0ky9MZzSkJFuHoF2ubxVhzmm0jH4QJMrODdcg64dbeP
	g17dk0WF9OWoBy9XVuaWVSEBLAoqGCM8cCQsSFUnuwmCO2priVIv2WF2EkMLlduL
	YeuK2xE3L/V1UhqTBphp3oEoOJ4odrpdg2z0uedSCEsNupdGbPq7vqaaNcL61vz5
	uVOu4NcL8nphbm6LDpZ9QCVT/oXSdx2NiEgXrXc9Q+eHnfh9lgqHeIMwbCFOZd5G
	1TRGoutUty3S+KPk7iA/PJKEh1i2uQQHSb8juJZ6OLQSZAsmy8B8gCKmER3YelN1
	TlGFQg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xs55ubq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:50:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9515A4004B;
	Tue,  8 Oct 2024 13:49:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 23DF426357F;
	Tue,  8 Oct 2024 13:46:36 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:46:35 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:46:05 +0200
Subject: [PATCH 1/4] media: i2c: st-mipid02: fix mipid02_stream_enable
 error handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-st-mipid02-streams-v1-1-775c2d25cef9@foss.st.com>
References: <20241008-st-mipid02-streams-v1-0-775c2d25cef9@foss.st.com>
In-Reply-To: <20241008-st-mipid02-streams-v1-0-775c2d25cef9@foss.st.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Alain
 Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Following addition of cascaded s_stream call within
mipid02_stream_enable and mipid02_stream_disable,
the mipid02_stream_enable error handling must be fixed to simply
disable the clocks & data lanes without also calling
again the s_stream of the source subdev.

Moreover, main control registers are reset to 0 for all cases
of error within the mipid02_stream_enable even if they haven't yet
been written. Correct this behavior by simply returning an
error when register clear are not necessary.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/i2c/st-mipid02.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index b947a55281f0..bc637a651a22 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -480,7 +480,7 @@ static int mipid02_stream_enable(struct mipid02_dev *bridge)
 	int ret = -EINVAL;
 
 	if (!bridge->s_subdev)
-		goto error;
+		return ret;
 
 	memset(&bridge->r, 0, sizeof(bridge->r));
 
@@ -490,13 +490,13 @@ static int mipid02_stream_enable(struct mipid02_dev *bridge)
 	/* build registers content */
 	ret = mipid02_configure_from_rx(bridge, fmt);
 	if (ret)
-		goto error;
+		return ret;
 	ret = mipid02_configure_from_tx(bridge);
 	if (ret)
-		goto error;
+		return ret;
 	ret = mipid02_configure_from_code(bridge, fmt);
 	if (ret)
-		goto error;
+		return ret;
 
 	v4l2_subdev_unlock_state(state);
 
@@ -531,8 +531,10 @@ static int mipid02_stream_enable(struct mipid02_dev *bridge)
 	return 0;
 
 error:
+	cci_write(bridge->regmap, MIPID02_CLK_LANE_REG1, 0, &ret);
+	cci_write(bridge->regmap, MIPID02_DATA_LANE0_REG1, 0, &ret);
+	cci_write(bridge->regmap, MIPID02_DATA_LANE1_REG1, 0, &ret);
 	dev_err(&client->dev, "failed to stream on %d", ret);
-	mipid02_stream_disable(bridge);
 
 	return ret;
 }

-- 
2.25.1


