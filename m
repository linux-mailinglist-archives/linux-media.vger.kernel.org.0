Return-Path: <linux-media+bounces-50347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9075D0DBE6
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 20:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAF9C303F7B2
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 19:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9452BEC45;
	Sat, 10 Jan 2026 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDQ3fhvx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NevQ3Z2E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6CE270ED7
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073891; cv=none; b=ikmnd0gJD/KnoHHsesYCdF6Gy9zQC2Ik+0Pb5/NJEoyJFrR1Z4Fc7coSAIoVczXBoWJrRbLISRs7qMtrfYi/fQZf5PnwyO2C541no6Tc1sqYTCasRquXZ+QWTCHR2Qa5je3p5a/iky3mkz5AvVS4b34nCzxHcYRcUNDODONSVq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073891; c=relaxed/simple;
	bh=gpcocHCUXsXafKyVqfZhuRHgjdviZ0p9/GuqdmQE/lg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nYyXQKXi04pAXbLLC7/3eQFSnkkI+PBicim2F2+RRtx7mrTpd6tsSdl4pX0B5mX4YEXrMUoE5Y+lD8ftXKzffO7r9wVmtmqcXTRGDmSy1yF6YmBf2CaCef0u4plcw0WOmensChDcp1hyDdHrwo556yYIiI6jNv434i+KVqtVRSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDQ3fhvx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NevQ3Z2E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AF1jVo4189509
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TlhwL1AanJnnOonkZZ2qXptmUOEaroWb0NZ1rA7+PLg=; b=JDQ3fhvxZFqJs7+7
	/xyl9fTT81ulEBVhF8rYgpfULcIkmuo0v8hQvjdIv2SA4JYb5T3td1Sy+XUL6stH
	mW5rhlzU3+qxFz4BLpW7eHL5sIq9L/TY3Mq9QPO6RJL/lkFXsGzP/vAW8sa6hzMJ
	t5FSWA8UV7df9mUp0BhBeVfkfdUHRJ/5+ZmisFjCMSX5DwVU5MaRGGNnT5OpYuHB
	5H4V/CDSp6iC3K3vw+9eTwY/VNsZyO/00Q3K8xreBtkfGn7eqw2UDvH7WmkAADoq
	yHvGPXXUi/p+JXYmPs4T8NqFsgK7O1r4+TRatwN+Hn6pEnrIOuMY0HlNHdTJqRLf
	sXIMQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bks258bht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9fa6f808cso1499602885a.1
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 11:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073883; x=1768678683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TlhwL1AanJnnOonkZZ2qXptmUOEaroWb0NZ1rA7+PLg=;
        b=NevQ3Z2EUdT975tPTVLbnd8f0XZ1DdcKXbXTVDfvY9oGJ2aRmgHeCgNoOOGIMb7BIC
         lcmFjLbzGRsYz+tLcv66Z/XnXUMiI9xtszE1Rz/D7ujeFd8PwT8D24DsHIkPSo8v3ted
         TQ2bURuEZvbdh+yp/jjcVM4IoNAfF7lFU3wl30K29R0dTHquUw6FxUnlpl9sXsKgvqY3
         owQR4BirsHRMLZOY+ajlB8mqN/+pB5kcTUmPzuWHR7FaZ+rShRdxutholqBKol7crgb6
         MKCgI5ctmizsCss3BQaNFR7WaJ51zxUcSg/5Ok+fpIaZcWsAzVOVKLlx28FbSxkH6IZn
         +IIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073883; x=1768678683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TlhwL1AanJnnOonkZZ2qXptmUOEaroWb0NZ1rA7+PLg=;
        b=VibjvOf6LLTJB4zn05yQhvZ17Jy6lRdXtaRBZt+UozPtmE3WDF3ApQAj8Hxyaz8bN8
         Qi6AqX0KlOqX7pmhXFSkDpXc609C1fwQslS7yjBrvhnY2InmWNu0vYWiytSw4dbfhfB9
         O3fSrrBZzircNu7Udua6UCE8aWstDBEDys3cfEY++To6zYeeHWTRRIAGhe3JxoABIyKs
         q0tSC4gtjyPa9xCAORULnTzu2R9MijGc1RCnxqNm3UKd02eUK24SoNjcW44rrimWmPi2
         eMCoN1yYRZjW7KtmzhcVh0ZtMEoMO9DSOXjpVrP8uVOvydbrf5KqS3dsM9NtiLeI6WLs
         Dk9g==
X-Forwarded-Encrypted: i=1; AJvYcCUmbX/glgvtPjt4sqbORpd8/m1fcEi24nO43PfOaHS4P1o1nQ7yWnx7GFaZVoVbMTnBjeZlTPuoXSlwVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2PnUtQOizvDxTBEz9WdUfrl0uteTcQS5hnDfBjJgvqInkzAtV
	b27yP+JBESlUl7N8881tLicLe9V1+HGNrURQXCxtm5RHdc0dyDVKlecP5JYfVC7pU7AKwxOA4ai
	+8UCE2DSwlnb/kq5BBZK/nNLM5uFz7IG8DiTzxlACvUs5amHPtaw4QbSrFk5h1A6QVw==
X-Gm-Gg: AY/fxX41EwKCZ7Y4M7X/RdCUJ2be+MldMNoCoWsswyWRBTsTNrsJaAtDH0zQFsNG28M
	/zZF/y4BJej0gPh9Na0dOKH3+xg5+H0/0yN5agykIOCIAgeps/IlYv4KZK1uqnc3QxmzUQYQ8w+
	GFHc8Elbpz8ZN0A2nfTOUa1pxOE4yW8zn3cacQWgF7cLbPqDaF4gg4QCvp+tU+rRasYcU31lr8Z
	QlQUn3bJQ+09pqfKyfa3Pt+YSKvVZiOuxnKdNOAHOeRfO2ok8aiPWOP66hwck0Rs6Q3ByzqOsA5
	1rO2xl4A/HLxyU7zKb5Zanby4B1IS7suSco6COP0djSSm1/kA1EfLvQ/MDrCV1DHLTdGHOCaCe4
	6eAWmcBCw0oeMqr+OZW/yYogND9iu7KcBVRY8sZ1kC0pqQ2PkpboqIiDL8aMpiJabgUk8CEBUuo
	6PIn5DE3Ke9i5QZtIXsoxJyGo=
X-Received: by 2002:a05:620a:448a:b0:8b2:eb83:b94 with SMTP id af79cd13be357-8c38938409emr2071092885a.25.1768073883282;
        Sat, 10 Jan 2026 11:38:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Fhu3fI/rHF+8/VARZB58+5uap/6Yh/hs4XYGBO8bGPn2y09pUiKUokJLfjBWQZIQw3Taxg==
X-Received: by 2002:a05:620a:448a:b0:8b2:eb83:b94 with SMTP id af79cd13be357-8c38938409emr2071090085a.25.1768073882841;
        Sat, 10 Jan 2026 11:38:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:56 +0200
Subject: [PATCH 04/11] media: iris: don't specify min_acc_length in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-4-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gpcocHCUXsXafKyVqfZhuRHgjdviZ0p9/GuqdmQE/lg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTjEmTAg2fFw4dXnV/yfZCtjbevCqTOR4Lv
 uzYk/iRzDKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1f6gB/94jLwTW2nfUZCMX4NIsS6AIuAIpXej+mAyN67FL9OzGClBIulunDjh5KAOY9TL2ZD9MAe
 qFofyQrofFYiIwZAGkQ6qyYd8aM+oADSU2ZkO5Avrh24VWvBSxdTKIsf8Dmf8wtx6MntOqml4xT
 8dXMnM5arSSOnfp5PTuNojYXC3bddT5YDktG5A9dmzIfAY+MXls8cXgYhFB6ZL4vy0OMOtlv00/
 g62jUUaEu9b0M1c8vWmB7KVcIWVtMcXxv7Pha6PPnZkjNfuZBNn192MPA9gYvexhV8GmueIzNKL
 nD8KeY/C/ra1QsbnaR+9ubdRo6ZQwAZbNqO5y3NoCbHgeKuu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX5YQoK7b53otA
 t09p/rmVOPLJG1Q6rY4FbU40UgQAPQfyt5KxqVqnLgmbnLShjs32MJz/x7iEaZcDpgOaGW/B+OL
 rOIGSl0bzEX3laPp6U5ox5h4ZVN8wlQq0O3Ak8ZQDan52jqvWJA7cS1HNRYZPjtvC3eocvhNDRR
 6OHkfmLqvgJGioraZTNtgiIESRCXjGeE51qPpkASx0mRc8UpiZNTiBn7f+BbzMqx/YVxj19gZW4
 Rh8o1S3bQ4vqt86aq8kHwMl78FQASK/MMnmr7BPx40WISDuhf/se6E2+/uIPNRnUGACifL24SNv
 RRkHpWawj8f5B3kUNEcdLCPzsi6KiSSfeJno36rgmz3RyKXbEJEPIjgiNYeEw5g07ot2k+qFkRP
 PUhoX9MKCiQbxS0zeqzHDG+KJlyvBp7c9ecomRKPwlRNhvtJBaQhendyAKfxwTxJT0piSFqPAaa
 J0WYnFEaft/LeYy4yhA==
X-Proofpoint-GUID: s0t3Bc99IIpdbdt2Gz1M90WcPgLtz-Kf
X-Proofpoint-ORIG-GUID: s0t3Bc99IIpdbdt2Gz1M90WcPgLtz-Kf
X-Authority-Analysis: v=2.4 cv=EMELElZC c=1 sm=1 tr=0 ts=6962aa9c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dSCyfi1qUYuBuoX4_vcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173

The min_acc length can be calculated from the platform UBWC
configuration. Use the freshly introduced helper and calculate min_acc
length based on the platform UBWC configuration instead of specifying it
directly in the source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 5 ++++-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index d77fa29f44fc..878e61aa77c3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
+
 #include "iris_hfi_common.h"
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_packet.h"
@@ -120,6 +122,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
 
 void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
 	u32 payload = 0;
 
 	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
@@ -146,7 +149,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->mal_length;
+	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAL_LENGTH,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8d8cdb56a3c7..3c5f3f68b722 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	mal_length;
 	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c1989240c248..c70cfc2fc553 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.mal_length = 32,
 	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,

-- 
2.47.3


