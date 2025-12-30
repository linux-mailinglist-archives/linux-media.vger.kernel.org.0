Return-Path: <linux-media+bounces-49755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E463DCEA442
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4625B3047AD3
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C800330B10;
	Tue, 30 Dec 2025 17:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o82qzU75";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MkehyYhf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5794A32FA2F
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114210; cv=none; b=ou4hAvP+hTk0NqHCQTd4+Yzw7LODcEYPHUe3zV11T6aeg78K2BlRhEcSxyY6EWaVTD/J/Qe9I5ZKmgFAS+LRytDlSE6tWP7sDbyqZxKu+us+eb9Cp3PVSmnxaxapqQksvKnqDfVZ7oXknSOqN+GZ/a8T0w+WpS+1zc8bl7mVJ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114210; c=relaxed/simple;
	bh=kA1N2hOuLQrj/EaUF95l88PLLc5P0t4Cl5tmXihS2sI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P+J7zOudIcBkqobDlV/FZvT/tnI8ViVDh+XtQt+tndUUbl6pDGmB68O4BIMvVtnX4VqvlgsAS6pGG3sWtZTmCqSf3S7RpEmu8HcQ4cqUtVi7wwoU84yIWL29gHy2T3x50YxAdio6NnEmna4fwi4GL+iF17EmtxMlQmZqsb7WQ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o82qzU75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MkehyYhf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUCtXDY714846
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gf2M/z0Ttme8n6CVO3CwrC/GTtTad5tzePlYQsx+38Y=; b=o82qzU75gXhbRpdG
	wcQM/eamZdmrpLq+RwBjPP2zyIpvCxOKN/MlKo+ZhAhb1ifztPvyjj4DMbF+bY9f
	OnQb17jWCf0/jTtPtNU+dXDOtq9PAOCf0/G/2MbMEAjwtAXEBvH9c7KrFInM43fZ
	ePSX0gKRZ3NMc7KYAbUSXlzpNu5o7oTRBuC4sIKXgiv8RRMkHph3e32jJMiPZO9i
	yHxi18aighDZxfZqG+AXPdRpt+PzRiXkmHuxBt4CNroh/3FJggZ5hHXNr6XOyjtZ
	gK4NLB3rnJtlphbaZkItVDWtDXF0hBLuMMQuqFsmeevbqDjb3m1MqTNGVCsPjaMP
	ksuXkw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcf5yrjs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:27 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7900ab6755fso53748807b3.0
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114206; x=1767719006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gf2M/z0Ttme8n6CVO3CwrC/GTtTad5tzePlYQsx+38Y=;
        b=MkehyYhfG7lG4CJQC4dfTl9z7rVX5cHNsECVnTvj7W+inigxXZXObY2rwXs9tAICQE
         OyDyoV50dO5xwYKvR0vCMqzkBGTyu72E9TAnoGzPmYvK0aRLiMb8WeGzSKUVuqu1gdmz
         UlNq9LPfVdc13K+gqzvkNhdXFejYB1tPE9MxYH/5UHDAz0ZsU0mWxU7V5wX0UhXYAWjo
         ca+gvFa+MKNuYFSMgr9x554xxyzB1+Gyr5hwT9MacQIJlm+lRtgTJshkm/EhjUXzQQij
         n/7lGY6TeIl/4wB33ZLFL/kkWxCNeIpb//GdbDcoyOn27b/mG+yxEBasAJB2ytAMnpeO
         HVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114206; x=1767719006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gf2M/z0Ttme8n6CVO3CwrC/GTtTad5tzePlYQsx+38Y=;
        b=s88VEvo5G569352iAydw/cx38rO/SbHZXmhRTX8sIwGigp4venxnQ0MFLN0tee8Yv2
         ABP6Om2NOudlXfYn7WLCpvRZ8nhaFnzu8m7AVF8y/vQotsDcOuDMhYm1/aEovHTt2JRt
         3PJTmL4vQhR9XXlW54M2AcYkPxBV90ZLDqlbF8a0lG+CNz2Zey53XFPOxE1ii5OR305Q
         yo5TD7jeCgzMnkAWrbctXQNYcCzA33cOpE+7nvjJKItxXT8+h3/iqmv3LXQV7sXs5KAR
         L+tW4UB+6KnZMbQsh0mBOar4Dd8JtMn9a+xFWuggSUKiwAxevUrqxKxqGdCFUAFRGXqf
         6D8A==
X-Gm-Message-State: AOJu0Yxlv85QGUbV76YZIBnVsVhPa/ueuNCvgvXlHZeGsTrNhwKOfF+c
	PbkhAD3SbyDv388Squ1NwoZET3lftosMS0syshJG1LUmcC5q60x5N6Jgd0SGBZSnNxTPoKzZsOW
	C6Di54zN9CHLOlWjfG333UiuHMq+47CvCrTHdkyH7J9GWaugmOaK5d2m40S/E08biuQ==
X-Gm-Gg: AY/fxX6DgEm8X9GVoICrBSsgpsMNNNVy3qTI9UqP0Lx7VMg5Mg8uzKtKPk5kzUXnbJQ
	jWK6WMMa6P6OLF/cb38aqCWD7A/QkhCGHltFxcUC4+ysFY+hAuV2qHKoKvDqHcaiPHxO/bbTDVb
	Qvlv5YFif6u7MOyH0EmMoPveBPaldQlf6NAOyhOvw/LzfxRIkqqXbhmj0bJY1fMai4cs5VhAxgU
	BVhBPrz/l2rGGPu1lkg+7wL7F98A46mK9SZXjcRr7NOmgaIFl54GROz2xl//9ybkBY2EFxkVviH
	WWFCxXofVrs0d/8GfBO3K+iOdEsUTSMOObaTgJl3w50jRtnCHEjg9xq/l5rANV4JMaEJpFhMA76
	bcNoh/ni9Pm0D4Iu8+wOQG64jq5i6lAa1sF0wxAcZrdr5rZ15ofzsygFOi02vsmr+mgte5E2fTE
	PnmFBb/0f9JwVUhB0Z/VwVnSb1lxAJtgpEzdqWrJRu
X-Received: by 2002:a53:bf89:0:b0:644:457e:a58a with SMTP id 956f58d0204a3-6466a8443f6mr21716445d50.7.1767114206386;
        Tue, 30 Dec 2025 09:03:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiL4SgoIsztZDtlVQfOtybYtaReJL9rnPrj4hpvD2o4RhoYZuFv0cTAfrROPJhzn/Ejkqnxw==
X-Received: by 2002:a53:bf89:0:b0:644:457e:a58a with SMTP id 956f58d0204a3-6466a8443f6mr21716426d50.7.1767114205935;
        Tue, 30 Dec 2025 09:03:25 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:25 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:09 +0100
Subject: [PATCH v5 12/14] media: mt9m114: Drop start-, stop-streaming
 sequence from initialize
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mt9m114-atomisp-v5-12-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX1Ujto6qAA266
 PbEPYgIszxKVE61LaFpiqN9C4bMyOC3oJxVnbNMWNeadfRwvCPbDOLB52n0ecst2U0S/u8vcTfI
 xYMWBpjo5EpoT5+ayP+XkSIKi88L0X822hjocD3iNyrF8tk4BRpisfaDPe6ZlZFfEwd5qYcrMbo
 bnWM0dUim0GLoiIj4UgxCM2j12RQ7iI0Bin9WWWD8bxv0FSWvt1Js0Z4r02j5RQedfNC6pH3ke9
 J0lTGvrW3crofrUsSCBgITW6XTGiDXgc8pkLs8sFMJZpUN/6swHLokLVofiR/Xm+GcfItyBoPG2
 oW5XxW0ob3HwNuqONER5QapI9TZobN1aV3zCjK+ywSc1Y4Lh2KxT+SPVmLBglAM5yMuc6NrzhJc
 +IfsMINfIDVQuf6jZ9uCxRIYvD9CWbURB7rSugcI7Tc2qJIP/7FqvYUWrzeLFDzCtI6ZTcD0iDl
 sjcohZhdyY+xPWJVRuQ==
X-Proofpoint-ORIG-GUID: Gng76lTHQOT7-M5ZWetwZ_5KQtJ9oqVp
X-Authority-Analysis: v=2.4 cv=KvNAGGWN c=1 sm=1 tr=0 ts=695405df cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=hSCjdWxdfPpt4Nx0-uUA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: Gng76lTHQOT7-M5ZWetwZ_5KQtJ9oqVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300153

Drop the start-, stop-streaming sequence from initialize.

When streaming is started with a runtime-suspended sensor,
mt9m114_start_streaming() will runtime-resume the sensor which calls
mt9m114_initialize() immediately followed by calling
mt9m114_set_state(ENTER_CONFIG_CHANGE).

This results in the following state changes in quick succession:

mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
mt9m114_set_state(ENTER_SUSPEND)       -> transitions to SUSPENDED
mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING

these quick state changes confuses the CSI receiver on atomisp devices
causing streaming to not work.

Drop the state changes from mt9m114_initialize() and move
the mt9m114_initialize() call to mt9m114_start_streaming()
so that only a single mt9m114_set_state(ENTER_CONFIG_CHANGE) call
is made when streaming is started with a runtime-suspend sensor.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v5:
- Drop "and identify it " from comment in probe()

Changes in v4:
- Move the mt9m114_initialize() call to mt9m114_start_streaming()
  and drop the config_change_pending flag
---
 drivers/media/i2c/mt9m114.c | 33 +++++++--------------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 5e0fbc34921023e1e7a69ec3d098f936eba93ebb..18fcf1a105a4268a501f517a155f12def0753929 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -789,14 +789,6 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	if (ret < 0)
 		return ret;
 
-	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
-	if (ret < 0)
-		return ret;
-
-	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
@@ -967,6 +959,10 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
 	if (ret)
 		return ret;
 
+	ret = mt9m114_initialize(sensor);
+	if (ret)
+		goto error;
+
 	ret = mt9m114_configure_ifp(sensor, ifp_state);
 	if (ret)
 		goto error;
@@ -2318,19 +2314,8 @@ static int __maybe_unused mt9m114_runtime_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
-	int ret;
 
-	ret = mt9m114_power_on(sensor);
-	if (ret)
-		return ret;
-
-	ret = mt9m114_initialize(sensor);
-	if (ret) {
-		mt9m114_power_off(sensor);
-		return ret;
-	}
-
-	return 0;
+	return mt9m114_power_on(sensor);
 }
 
 static int __maybe_unused mt9m114_runtime_suspend(struct device *dev)
@@ -2574,8 +2559,8 @@ static int mt9m114_probe(struct i2c_client *client)
 	/*
 	 * Identify the sensor. The driver supports runtime PM, but needs to
 	 * work when runtime PM is disabled in the kernel. To that end, power
-	 * the sensor on manually here, and initialize it after identification
-	 * to reach the same state as if resumed through runtime PM.
+	 * the sensor on manually here to reach the same state as if resumed
+	 * through runtime PM.
 	 */
 	ret = mt9m114_power_on(sensor);
 	if (ret < 0) {
@@ -2587,10 +2572,6 @@ static int mt9m114_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto error_power_off;
 
-	ret = mt9m114_initialize(sensor);
-	if (ret < 0)
-		goto error_power_off;
-
 	/*
 	 * Enable runtime PM with autosuspend. As the device has been powered
 	 * manually, mark it as active, and increase the usage count without

-- 
2.52.0


