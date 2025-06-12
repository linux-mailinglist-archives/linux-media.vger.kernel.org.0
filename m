Return-Path: <linux-media+bounces-34590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 934FEAD6ACB
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 10:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 106593AE7CF
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 08:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4268223DDA;
	Thu, 12 Jun 2025 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjobSVab"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C0422173A
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716993; cv=none; b=ZB5vH3co/DE1YpN3RgGoeUHIMLjPAQ/GYSc0UC9WcpRQERftP81yo0CZGBrUrE1eizUF73oLYKmUQuZE0w4tEHJrn8/18ndSdD9oiw9Lqi1GPM6eg9v6ApW5vR0B+yabkpI+FjcdoOZxTAvitx8TJpBwC6essksSF3oPc89b/FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716993; c=relaxed/simple;
	bh=O7x0B7PsXPJevh+BL6rfGJApjiXJdDSLqfDhsZCX96o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DUSkneZkc8LlB0kiSgqWM1avzfNSgCjlwRIMct6oTjdPHEpR7k/EiBh+FtOHO25LFHpYO0v6sCDcuf0Rk0q7rJAoiXIXV1DPaWWPpKgp3CMilrsEScOolMTv2j4XGYfqij6i5+0LjTxhb9ag2+DLafpFX7JoQfoqgHxrM0xIAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjobSVab; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BMF1sJ031684
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 08:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4/kKfIR6xBOxkE9lm0H0LtbeIPTX/AL/TrO
	0VUBg0Bk=; b=JjobSVabtX4EGJwcKNn5miyV2FrBDJ1rgXzHxzM1yAVc85MHn1I
	hN+FXVNJ52Hvw8sKt8kfWR7fauElBp9gKez7pAlikmc4S3vbxbv/E315hC6qg8Sj
	2dJlJqVcWecWkSYyS/O5tNyUp9jznL47S3cg3VAep7rpGlN2+SN8aTc9CflxVxcN
	YasbW7pl7S0VWAjhwviAa9TTn8J05SdmklMA4eZB+gI4UfKlHJ4lZDkFO07v92Ck
	v03/mKXgjAVFLhJxFfiHLvXZEVZanfJI0JV2ZaoRsZxsT3ipU/NNpnkxq+U4lGY+
	/ODvR/72wyI4xdfs9P5kNJR1AaWRysyKm4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jdwsb98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 08:29:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee988153so121217785a.1
        for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 01:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749716989; x=1750321789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/kKfIR6xBOxkE9lm0H0LtbeIPTX/AL/TrO0VUBg0Bk=;
        b=usJNEtpwWqjwGJ0K4PkE0wYCTnBlKubYoPe/6n3dJhBQmshxT1q3rp5DEPNECqysbw
         3eM8Tx//5i97jYZi8GWvHPiHPNVRAz1Mrs+bczWUs6Eta0XQTriZc6aqt1a3MHBxRxeB
         vb4po9sMEsXcK/OXkRZbqPsoHxDe3tgeZPxDyrg5zZiRzWLPoXcH3sgr8AGu9XaIWMPW
         E1fvvJduBpx1zUu420oGOFniAKFUAro7US4apJ8Ke/ht378O1bl4NsRdgxHz0WTITFKn
         uLt+DeU+USMBg0w8kTzMjwr16Vd2uw6lm8hgdj3IURubCUQSZX6dbzKuRBZCSb10Imby
         e3kA==
X-Gm-Message-State: AOJu0YxQfq7k7tfCjIZBOg290rd9a0EnoeE0N7HbUKQLTEWgp/wXF3Y3
	e68EPRQqYwOQHnG9XfJvi64bFMjkq51yaM5NgM64xEipL2ydOLRfyiY3kCoDKhBjRfYFHq5BTGg
	z7c7cavzL2UMKhoa7+Ok/+W02ftL2mFyij7l37aBUvJePpScmXnHuNyCFC49eqh18mA==
X-Gm-Gg: ASbGncvPhQj+v0/vNwtVR+CofqzsdSiwPrVmkgoSSJwVkOAR4yB7kuxa0/Hk9GeRexc
	q5WWaSgXttEyM8azbwElolhCPi/wJbsAVhWSgkZiOUSV6oreqf5qGPNr9BNqlAYQPnE8N8KczdS
	iMhLNqelAfAn/MZrS96EgtBJfU8FsF/lBHJbwWZXbGiNXB8KZrtFgT2xE6zxF2X4hBZ/rM5zbW0
	W7qMf9DI9yPoj+QmZF4tG/ABVmonq7pNqOyH3/YDWw2cF3eZXsKezbEOtA/rDpOMeZSWf6YlVlm
	NimUECbAv5RwganKvh10rYY9M1gbTL7eC/n/logGcr4npX9o/qYKESR4J73G1YsDESDf2kJ0H3q
	Z
X-Received: by 2002:a05:620a:254f:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7d3a8833b2fmr961433585a.21.1749716989482;
        Thu, 12 Jun 2025 01:29:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0YIQPL7yWdIZPDe+4/PhpHgaQ3NUQnaAcVDSL7xrmvOjCe78h8IeCoSoHcBLcGRhjCtwMgg==
X-Received: by 2002:a05:620a:254f:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7d3a8833b2fmr961431785a.21.1749716989132;
        Thu, 12 Jun 2025 01:29:49 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b4b5afsm1263883f8f.75.2025.06.12.01.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:29:48 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
Date: Thu, 12 Jun 2025 10:29:43 +0200
Message-Id: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA2NCBTYWx0ZWRfX+udC8na/lrH7
 61I8/atBHXPIlJtraphLpqBd9XhraK5eMpYNpxNr4Cd8P4gKDSBucHUcXwJVCTXEN0fX+jzPRmG
 qGA6CUy7Q59LczfGNX3nJXjuuRDBg5Z7GXDAA+opMlujASb1Ua1+D0OoOVINMl+s1hR0hq23UJA
 KeZAq2GTcZ7y/moJymTRbKKkBlhNByVbryHL9e8jBB5m+H3Jf/0gQfVIO0r1AqFc9Xg66HQYL2M
 9SbRT1IUg4ebyfhMwKvXE0BMsB1ESBNGGqVZRv7xvg1e7kKD+Oc6/a+ZPtWcyT7agOy0ZXDYXNb
 C23OPRLwx69ZK75lPceS+0C7MwOKvNuzNLhwnJTNhMijTHchLn3WZqJRjC25g6IcxMploelGy7B
 ea7ttetNQsVMrB4+O86YFLXkznEgPXhj9tCoQhiBoUzO8/3T4UPHwB7/uXquynl61+NLjzqV
X-Proofpoint-ORIG-GUID: 9vKmzhJRx9BC5v0g5p0Utim3o9DLDtN4
X-Proofpoint-GUID: 9vKmzhJRx9BC5v0g5p0Utim3o9DLDtN4
X-Authority-Analysis: v=2.4 cv=Jce8rVKV c=1 sm=1 tr=0 ts=684a8ffe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dqxo6Gcs7TcCqA_HyOEA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxlogscore=682 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120064

Ensure the IRQ is released before dismantling the ISR handler and
clearing related pointers.

This prevents any possibility of the interrupt triggering after the
handler context has been invalidated.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index b5f2ea879950..d9d62d965bcf 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
+	devm_free_irq(core->dev, core->irq, core);
 	core->ops = NULL;
 }
 
-- 
2.34.1


