Return-Path: <linux-media+bounces-34216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5A8AD0019
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8F4F3AE333
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 10:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB30286D62;
	Fri,  6 Jun 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKGLe6jE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6464181724
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749204594; cv=none; b=Df4oD0+nN2OsFR1JZZL7IAEf4p7BuMRKg9G36QmcXRkOEHG8cdC/3q2dHBv6ixExkfV0UcUcI6GlUvcXnNwttq8zmjSxEPzz8dwHm3ft64C2GqMRXgK3d+i9JVk7pS5zKy5QYgQZG6rHoqjpSGNLMERI1IVnNV7LIR5zZzBs5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749204594; c=relaxed/simple;
	bh=LpL31W6AKDCpdo/fRCicU1F0HGSNhPmft1JV8Pa5bLU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sUWZqcYgzmHWcPcRPLlLn8hOArjUBrYxhXYXY70XpWW6tTUOm6Bq37I5unqwH81efBRIRTX67fDtW1CHT/ZqJ5lo01LEdjGyk2E+a2rFbYdBm2Fi1dc1Q3am7q0J4scq7KffXfUM+iSh0N9lhEJT1irxDKoteRz6ntbDG6ejR9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKGLe6jE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5567qgQb011419
	for <linux-media@vger.kernel.org>; Fri, 6 Jun 2025 10:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1Rull5WUa5O/co7lCOuxKulj8U2Z6zdeHoH
	V9/g0S9I=; b=AKGLe6jEmO+oDiPNCgLtN/CuAN6XN+v1tEqUqlW4/pGOCi7POa6
	ILJ8a4+a36YxnCcp3T7ymkdEfvHdsphU5CNX4pNezkyYD7/aZJQal+2DhWPh8JMO
	Mr/AxO9Sfq0qferAyJW4M6cBNPWvk6a0q2V0oBE/C+qiOHWlESmW1qaZmbuzxNlp
	VIBYRRlyaLoymBzBgMtkKegF0MlUM8+7ourNSudo9QcHUyupWm7AFK+18iz8DxgB
	vTs4w1CjPnx5VrA9OGDFtRmt/7JYJPTtNFS6o4/MrVSdqcS/HJunrMaOfrg6Q+fb
	VtOn4Nev4Ub2PBSdqHFHGDlVd1ve3gLjBpQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202whv8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Jun 2025 10:09:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c760637fe5so312875085a.0
        for <linux-media@vger.kernel.org>; Fri, 06 Jun 2025 03:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204590; x=1749809390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Rull5WUa5O/co7lCOuxKulj8U2Z6zdeHoHV9/g0S9I=;
        b=c4XX7LxDn8ZGYLOjLxrqPSdOnVmIiPYjeD5V8imrswqFdD0dH4HCygnYKm/wfg/94r
         icEJtJZ6C6Cyijx9JPhNHZhfrgA9rQzO5YbyCYsL49hixCbPlC50BvC/l2ezdrvjf+Eb
         2kv2EI6v+UjElytSaMmxaRiBQuoklsbkCRBxX8/pF8CPD2rWb0MZvCbKpxim+Di4Og5T
         Y84ebI9KFgd4/SRuFhQfGTSJwbgX/7egh1WVBJb2e+GknsbRooGXrv0whurBl40C8qt4
         PrBgDMqtLQdMsHC8vacVDX52tbmpPXBoAwVwIE+73UJTzCrpmYBxeO5YDEN6JhEvLaw2
         1VAg==
X-Gm-Message-State: AOJu0Yyg598P/VNkbrf+ceRJhkD4jiSBcT6fOETAZCAXqu488jOBMxe7
	gXiOwogRlNpWdVKgNmRusyzL3TwrsuWxVDfnjmRhINg7VMKk1L3S3maOEMDlKX6qRMLw7ljY8u5
	RK4FNnVeW00BsYQit25BriwoAQTkL8QyipuIGydqaUSZGxfsNfchPZSLOHlInyEaYIw==
X-Gm-Gg: ASbGnct7zZT1F8o4sqwRZOKZuibEoY9smg5cogKx7I2//XSv0KXITlod2NyGonkNS8U
	lmEWrrJDe7wR5uGFiwthEUr58v8ERBrE+qDB9HaZwjpfgcqLfoztsAa9Bsib887hKzMtIVSpW/F
	8TvCj/jbprB9uasniG8RUGrvqelSCwSjAb7vszPz62g5X6pmmklhX/+lQSOJuSnwf2F9QgxIFBw
	Wgw/htOXFrtVcy8xSB4R61i+BV7uJfSsj79OTfK7Y8tds0bsezhB+77ZDD+7GbMK1lKpqda2MZE
	CSiqM9ASEdJErtMqvDUdsgSBHd4eF4NawK4PeHqh/sYOYV16lvY/dzXjC1043wEhnpKnfG7eoH/
	4
X-Received: by 2002:a05:620a:1b99:b0:7c5:4adb:782a with SMTP id af79cd13be357-7d229851bb9mr483085885a.9.1749204590318;
        Fri, 06 Jun 2025 03:09:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENkAzJPgUxlRrOfxnaDBFgN+TY7Ep3pNndFgZuX9TRNL3Vyzjg5cluQwW3LY0RCEI363Xj0w==
X-Received: by 2002:a05:620a:1b99:b0:7c5:4adb:782a with SMTP id af79cd13be357-7d229851bb9mr483076885a.9.1749204589288;
        Fri, 06 Jun 2025 03:09:49 -0700 (PDT)
Received: from trex.. (142.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464581sm1415418f8f.95.2025.06.06.03.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:09:48 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, stanimir.k.varbanov@gmail.com,
        quic_vgarodia@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: venus: protect against spurious interrupts during probe
Date: Fri,  6 Jun 2025 12:09:44 +0200
Message-Id: <20250606100944.4104715-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: py4a4R7_BMxw9yFNj-25IhoG_OyHsNgg
X-Proofpoint-GUID: py4a4R7_BMxw9yFNj-25IhoG_OyHsNgg
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=6842be6f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=jucdD076RO8dzeEYkB3eYw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=4rlHZoThpNXEEVWAyUMA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5MyBTYWx0ZWRfX0BBz8p7I2Ve8
 6bYIIfVhXSvQKySuMkE5867J+IC2vqgMMnZrlejEKtpwlz+vY3Tv4lBcmVKTsEgm2RUkTUY0fNE
 3YUR2WURFwtNOe4/0EJh013dvOMx13hjv+zw0rSdwp4ta4qyJzXiwNZPmMcsEVZxGhqWqxdxd41
 Ejyj7jGuaVwlxVudtvSyQTzvVkCuRpqpZgvFtfkEOs4r7QR4IAAqwTKFpQsh24homYpSNHKSZ7a
 ZYKhUcdxQhfaQ9wXvJ6OFX1FKP0doYnvmO6VYto3cesAYWWBfoX6tpJfb8Btjt3XtUFnzbGYqWO
 iSg6cQytVxO4HWfk05XduKMJ3jyPyH6usUhRUnILSx9FzThHf45o5ftuj/15pwfMCu4T+gp0EOx
 gnq25foPntSj4GyjcyLsvBp+BvJcdF1fgGpPTQaYsbNWFxl90NYWEGQ46E4cRy0klLuhva/q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=952 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060093

From: Jorge Ramirez-Ortiz <jorge@foundries.io>

Make sure the interrupt handler is initialized before the interrupt is
registered.

If the IRQ is registered before hfi_create(), it's possible that an
interrupt fires before the handler setup is complete, leading to a NULL
dereference.

This error condition has been observed during sytem boot on Rb3Gen2.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 77d48578ecd2..04641a7dcc98 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -424,13 +424,13 @@ static int venus_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
 	init_waitqueue_head(&core->sys_err_done);
 
-	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-					"venus", core);
+	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
 		goto err_core_put;
 
-	ret = hfi_create(core, &venus_core_ops);
+	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					"venus", core);
 	if (ret)
 		goto err_core_put;
 
-- 
2.34.1


