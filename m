Return-Path: <linux-media+bounces-34261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C7CAD0525
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 17:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6558F1894578
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 15:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C6F28937B;
	Fri,  6 Jun 2025 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdwYGjCF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF071B0F1E
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749223531; cv=none; b=HXeeQibKPO5/as+ggf43rAFDwRBKsDLP7jXnslHfjgjVKa64Wvwv/Qiz2oLdT5Vnwg5F8tuju42MLsRsPzgT/raqCfRIvbHvq2jCDCiaLzndPyy3KrwRVHOXPyr07gshK0FjQCp+I84fe7tVyRE6L5Qd4tHfngBsanF6dmoyIhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749223531; c=relaxed/simple;
	bh=HC6LsIuSjJdJIiJFfJoG+7VCrWOecIYvMQ4VvDDwg8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M1miOakHA4BnwCENVUSpsk78CA6LGSxqR03VkhdV1qS9eKnsQLwf1bUoOH32Lfd+It2kZpMsnNncHUhTZaq9LWBcyKnxmOW0+S1JJrfEN79Jg1gomdzYVIW0BuYC7AcQjQJJk4OnXktSv6odVG/syOsZYG461psLMZMom6sq6Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdwYGjCF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9EC4027239
	for <linux-media@vger.kernel.org>; Fri, 6 Jun 2025 15:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QMrk3eQZuTJ6Bbd8ZWvEu0BI3B7FJkAMmmB
	mL0sh1sA=; b=bdwYGjCFEG7vaEpcIiuCiiXREzZTyhBYBqo0YNGVj/OFHAG3dWy
	k26BWitZglZYM6Sw/ImDKvlujGPtvpmQcV7XdtkYH6hilKOtf2TDyEVH6x3uDsxN
	wFGqhCqjI163CeZaFwnnrA0Nq4ppV/FT+TVEq3qc2UdtyOsR+ckRyUuQYsrOyELD
	LAmeNq3TvRGLDXoHF9n9wZtDTnPORczrhFh/19xzmZoIB9s8xLmQG94Y0COFNz/N
	ljW4kgnaGoEUgeAcHNVenfY6D1eTDAnn9OpZhPlqBHFMPEeK8uQbAvKRj8D7Rw67
	dSH/oqxKPaZkbrQBaHJGNTne7iR9ct+QLgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s54cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Jun 2025 15:25:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0962035b7so371944185a.1
        for <linux-media@vger.kernel.org>; Fri, 06 Jun 2025 08:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749223527; x=1749828327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMrk3eQZuTJ6Bbd8ZWvEu0BI3B7FJkAMmmBmL0sh1sA=;
        b=i+OwW8VImrK3WDUAZ6qld3dKtnwYJzbs0Uzbz8Vy8N74+AXfrB01pouzHzQ2/R41u8
         MJWW9dh+7k1DKibx4fvuF5yahaQqapc6VcfDLR7itBNrVMeVSIrL4z5889v6Xj1Cf8Zw
         7tI73TtCABHzXAbYEa2yO3aUiI6AJqosR9BCt6M8vF1UW00tJwM2C2GupN16whI0bQgn
         y2xkIxluvuugsIdlH+kbkor/HEwNVwYeC3Gbnf4yLc76VhovLycMmTm38CCTLylp3v/l
         DUShKe4wJTWYmgotcggThyr2zbPWSxPoWkmkWqJZxEvvpUlbOMnNlW06uZn2RblqAN5k
         6FkA==
X-Forwarded-Encrypted: i=1; AJvYcCUvTc2i045BMsh8Zb/eKDy/6eE/ZwjHs3w6dJHnkDAEvlIcN+ewxPOZHUk1Dub82d10ykFLjeGcf0+KJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/+kRt7vuE8SPcug2cZ9HtBGTnlEmcnxBfxgC7ucowzh5PFL9
	kq1dr216D62mySJeAstqLq4d7/3avA9u7M6TuOoLZ10b++WPRh5H8lvF5DCPnGiRR0gn7HMok6f
	yzhs7S7VxwwiZVr4NPBK2xlkf/7IW3PBHGnTaovDxmVPk+3LNhgCZc30Pjvw2+Wc84A==
X-Gm-Gg: ASbGncv5aSNdN+kTO1d+mfr2Px1hMZh8Uq/DDz7bWBQ1bh4UOU8A+qubw70eaHv72wa
	CZkaQ19JT2b34kf3qO4n3VmQ5wZUFExlIKOgHEkTbFvKyJWF/SZWfV0LuvGMd2f8uLYJfOxBQFP
	9AP5iHdbPYZFcWRz4c50f8GNOO+zxyFQ12RpZJEWQdMowa4eRGMbH8FWXAWBv+TOy5B9lb+ZDh+
	TDh2Cw9RjYh7bsIbVPstJTzOCM5hcrBeYnlt0Kw5jtBsA1DHJp0Z5xoBQmdh+zIzZSLyvEA04cL
	oHCKTPYr2gtEss9XLZyQkJiK/CYD9Y3QdAQtVd4HANwfGN2RxTU6laLWdz9fttXUog==
X-Received: by 2002:a05:620a:4487:b0:7ce:bd05:83ed with SMTP id af79cd13be357-7d22987d994mr658446885a.7.1749223526800;
        Fri, 06 Jun 2025 08:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7SY5w0YSLHb0XHZ+BNK1tvP4sA95RKfBWut3ciF+YIVDSFV5SVbZ2+XhvLmzE/7rcFXto9Q==
X-Received: by 2002:a05:620a:4487:b0:7ce:bd05:83ed with SMTP id af79cd13be357-7d22987d994mr658444185a.7.1749223526437;
        Fri, 06 Jun 2025 08:25:26 -0700 (PDT)
Received: from trex.. (142.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521370961csm27575945e9.22.2025.06.06.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:25:25 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org
Cc: hans.verkuil@cisco.com, stanimir.varbanov@linaro.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCHv3] media: venus: protect against spurious interrupts during probe
Date: Fri,  6 Jun 2025 17:25:22 +0200
Message-Id: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6DBgMD5pPQt7ezCKLDs700ilkEmudFOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNiBTYWx0ZWRfX9hfb6cpwgZOh
 6cua6TGra0q0fudfvY3EzSvipic4zgmfn9FpPy7CxBdsbVpF7eV/ac7cBbZ9lTM0CPWjs1wj7f2
 J0e4tTh6BIEde5JwOY3+fLzV093KkYa9lEgcB9iKjbB2H5KGV+FQsKuq25IpO5wwsrmZB4Rt8y6
 z1uaMWgoPIrySSnTzfOMnV35w9x4KOAfN7l9XaFFLyfvuSrW+SWWKvdFPgE3YTMjlrLDzi9nZ2a
 CFTDKyaxOmh/tyVfqzc+vCsYZqSUP54AgpgJEtjnbQ1Bq8dV/OiKXHmcR+yhpScPoH/9YmEnPD6
 MApjG0wVpGlAP2FwCjZr8R3HityYbOByvLOzphYFdo9AYDDUFzYRF9fJfwPWm8HRGBNTAQ4Li6X
 tTIFyASdrKdBhagc1E4FcAtvUbZJHf3Q15MKkqJ2i612q2DSCYi6iXwsyHUXLJLku4/0Fwut
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=68430868 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=jucdD076RO8dzeEYkB3eYw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ixoX2jXuh38yZQZJg40A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6DBgMD5pPQt7ezCKLDs700ilkEmudFOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=877 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060136

Make sure the interrupt handler is initialized before the interrupt is
registered.

If the IRQ is registered before hfi_create(), it's possible that an
interrupt fires before the handler setup is complete, leading to a NULL
dereference.

This error condition has been observed during system boot on Rb3Gen2.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 v3:
    Added Fixes tag
 v2:
    Fix authorship
    Fix spelling mistake
 
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


