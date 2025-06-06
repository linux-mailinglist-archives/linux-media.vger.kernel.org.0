Return-Path: <linux-media+bounces-34244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA983AD0243
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3823166AFE
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EF7288530;
	Fri,  6 Jun 2025 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQPPGsWv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0BC287513
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 12:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749213237; cv=none; b=X4VriYAydzaHV+KKAfkdphz1rsiFsvvcTsTFXgK7SVDUAwMFjcUITNAwEURD5MUnQZIZx3ShvEPLl+NUG2KRAR+yO/UqmOvuaEsyklJnI0Kyuvz30jI6SOPLJobghIXtO+n26QW21UEsaQb01H/ll6n1rDYzq0Hci5CNS5XvDik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749213237; c=relaxed/simple;
	bh=ivddDW5T1J4JyvrdspbZFEYi06jSdvMZOcvhE69syLI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EiFEJ/seD7LvfBUzqBK74Ga5/ZFBehdPIKcOLUSILhijtS3wbzbHaZW2k5X7WmYjs8O8UNVqQIrtUL4mDo+7MFb7GuMKJiJoGPSJzsi6wH8oQGL1xTpGpWZwSxvHz2IR/vztDmhG8GD2iFhB6tTTsnGaGam3v6PD6hyzQLMVLI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQPPGsWv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556AZpLq013926
	for <linux-media@vger.kernel.org>; Fri, 6 Jun 2025 12:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s8QIRnPERxawgaDmjJObpuottssSVfUeoUh
	Fx/MyZdI=; b=QQPPGsWvIG7XglAeGf4kRQpZ3C9kG3w7hKeUxNtRzAdHxvtyFJ8
	bVnyUyRSiAFiubPR9a3meNVq6VlGBiV40s3Cj6rVDYptXpPo7biWdmb8v+laOu8D
	h0x+ZOpF9rV2HB7dBeQWC6Q9kuTyt3jF9x7H9FloZKuPb87Z50yn3CHXoKd305O+
	zcUNRvcfqMMLY/3aHp6yt0/2+jPXLet1hjZ0+ZpUd3nYbJAKxFbbxP7Of/0/ywnI
	jb/cR38OQWp4LA++0oVQm5k0M3m+0RtnBhOw28EDOftODzLxKsCD16M0zQkGHRpd
	oJgEbq5hN3LtJTypac+szaggIZZQjye41Ug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 473nphsk93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Jun 2025 12:33:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fac216872cso39095566d6.2
        for <linux-media@vger.kernel.org>; Fri, 06 Jun 2025 05:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749213218; x=1749818018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8QIRnPERxawgaDmjJObpuottssSVfUeoUhFx/MyZdI=;
        b=wbTPg3Pzj0Fpu1KEyPhWxa0DRSUOZTxgQKl4HNruFtWZ6xiNPDzTyPpQpRUuR9OGf7
         +pvNcXuT7mA+9i2ulP6E1HF9RDqqNiourU2oUUzOWeMSlx6uLqYiHK9c33+GRCRtDoD1
         N7aQX4vkP2IQEN2YzXw9wLcM6M/EJ+xyDoAak57WiOV5o/bDP/z9PViEvuohTnLHnjJo
         0k+XvPyTm+1gnFGruuM/e53ji2K3ocmJXDAqAF21ixuEVlXOpIyxjYerCVOCBF8tgUtM
         YVPFxmN54i3RpUyOCxJAdPDHAQjQd2yyyctttQJI+qld0xfhYPRzqqYNFQJR4c5O7qY+
         60yA==
X-Gm-Message-State: AOJu0YwvjEOXXVPLv6uD74+Jnm2ThNOpoAtcMKbwP3ooKzLik8ZXaVhs
	vQw7FdLAMWV3gQfB7CjJWnXOFDOm3hvIiVYhgCTttOeFAEFOUrLSllRs8B8X0/ksIPiaTou1583
	M2BuhF5LhxWN3EK5qXITOUUdY0/JiN7Z73ureDdfDUO+3iDYQMFpRWXOFFX0tFHU6hw==
X-Gm-Gg: ASbGnctsybl/APDi1CO5v0dRCXhkzEbTnyMdkrEoPOXCIMzAUig4HxQ6gTF4HmMMQFt
	me8thn8x4yqWR3oyb+0Ej4xO0vjNnbMJGJBruJq14GIsTV1wCPJMc0j7pQoQzqhp38JaCh1ofIA
	sBYvI/FWLagDCog2TcpJDuRPA/tpsSNjon/jYilyMbh11i9+OeHyNZdhKNxQ66EryTiLO9IwZ9m
	QfJsSSrh2IPNtsr5DNJArnOn6UIO7LlaBfSJ2GWlSjCEHWTOys1eIbjwPXAJ/a0sqfc+EQWNSXz
	dwkY7x7ASVvqxsR4TWBk/bmr9VoamNx4SiRWWxeRdYqvf7+YOAB5zk1UFAtQepYIttUHnbLw61z
	o
X-Received: by 2002:ad4:5ced:0:b0:6eb:28e4:8519 with SMTP id 6a1803df08f44-6fb08f86d87mr50834846d6.21.1749213218282;
        Fri, 06 Jun 2025 05:33:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq0LfKT7V7Hdr9+7FwMCh7gMOKBUV5KaU9c5KLNxPHvFir0fRLD3304/1mkrTlVrjWvgwZcg==
X-Received: by 2002:ad4:5ced:0:b0:6eb:28e4:8519 with SMTP id 6a1803df08f44-6fb08f86d87mr50834576d6.21.1749213217966;
        Fri, 06 Jun 2025 05:33:37 -0700 (PDT)
Received: from trex.. (142.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8f12e16sm33777225e9.1.2025.06.06.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 05:33:37 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCHv2] media: venus: protect against spurious interrupts during probe
Date: Fri,  6 Jun 2025 14:33:34 +0200
Message-Id: <20250606123334.4114123-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eQwPs3-S-Vf7MCCIZY1y9i1k-m9bYzdy
X-Authority-Analysis: v=2.4 cv=N8QpF39B c=1 sm=1 tr=0 ts=6842e032 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=jucdD076RO8dzeEYkB3eYw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VOU_bqPf6nVU0ntsUH0A:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDExNCBTYWx0ZWRfX5tg7ihGwH+cm
 8Qm3i84DahJpDF3IgkEqfWoyVgwrKP91JWByyS8uqFkbQKUDiwQOygLg1kyDsoOIERlh/pl0nLk
 1LXwtYt4KSI7NEH+Do0g2hRtYaMT2mkYjl+0uWa4dN+w+nMGT5X1lGBiN0s0gi/UmvbZTJl7zwG
 u9+xtluppB3Z4G5j7OQj3LW2CiXC+mdqBCQTpjmA4QbeeeZO+Ey9SYwvAYywYA8QP6cd9ifsMzM
 xvxNaXwkKaY+aJNdMYrlDsn+9xzpRyvHw1FQ3eBNqvxHojbWgojraJRPhwOsmJ9JCmBVKGa9JmJ
 CZ/kapXzRJZOT7tDDDdwYVpNcKjP90ek+gy2IJUsH0Tw0kwXFd7DsMJ30lS39mYBaaEQxKpafOw
 VOFK67eIKjbjsCHZ3A3pfN4I6eUSuyjsqmo8MJtAApuMCllwwnyH18kOKm1okEdqDb5zotCd
X-Proofpoint-GUID: eQwPs3-S-Vf7MCCIZY1y9i1k-m9bYzdy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=970 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060114

Make sure the interrupt handler is initialized before the interrupt is
registered.

If the IRQ is registered before hfi_create(), it's possible that an
interrupt fires before the handler setup is complete, leading to a NULL
dereference.

This error condition has been observed during system boot on Rb3Gen2.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 v2: fix authorship
     fix spelling mistake
    
 drivers/media/platform/qcom/venus/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index d305d74bb152..5bd99d0aafe4 100644
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


