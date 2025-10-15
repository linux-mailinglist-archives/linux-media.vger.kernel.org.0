Return-Path: <linux-media+bounces-44488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FFEBDC303
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 04:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78E124226BF
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 02:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BFE30C61B;
	Wed, 15 Oct 2025 02:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjH63oWy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B272A30C340
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496163; cv=none; b=E47kiG9o70ZRbmuIrX55o3Q82Teh+zikV7ade0FFKncNx7HC4PVi/9Se1c9g8eki/56AuAm2EkmFhzcuxvD0il071G1a1K9XlXXXtuduRxPkU8iTTpK1ypfqc9V58h7DagrNYDLHJZdY1u11OoX8VKbtX0COrvGu/RiF14kFffY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496163; c=relaxed/simple;
	bh=/6TPoOK2H46ODoVR5vH0U3mZt/KkWJx+/Oa6plnyqHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qQfxLupOOwcse3ZCGcJsMJzpMJsaJDlS2+ra2KJRlGFbXynC0MNyTe5k1/2v0/DZrrTNNgleIc9qsuwdjdiBUGvVO/EHe/A50CpJ+RhGbyGPiI5dASSGEslGf86UD7apaV8uy7wvmxXsTVwh1ctW+Wa7aAG6mdzw8HPkp4Epjtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjH63oWy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2dK2h006133
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dOCcVsAuRxmu1r6muulhHh
	87A+yiQ6uas2Eu9RO3UAg=; b=UjH63oWyXxi0phUyzS4u13zULHUEaOQm7/ETIu
	z6wekMrqatX5BiuVYg2yEF4iF68lKCd6BvJYQh3fjnbxde809CMxKg/zZR8TpsRA
	xFx9IUYsqc4hUPP1PpM+qmm7jU294SI+FUSrnK4oYVLdY7g5Ri27pQnPwN39NGkT
	BWFmfwtuRgWjtFo++HSo0nkv4slxeGESa0V2rBRJHqNkQ9tArDeraaP1EOf3d4zs
	rlC1b/0pH40t1dPuiPw+1BLWl16CBL/8Y+H0QuzZqxKz/XTho0rVguOxg7tg62mA
	gXnNLsGEq0l2a/wlEgDwtq5LFSe4/uzZ8zng3Y+AQNIGHNhA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8hbmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:42:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5a013bc46dso9056256a12.1
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 19:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496159; x=1761100959;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOCcVsAuRxmu1r6muulhHh87A+yiQ6uas2Eu9RO3UAg=;
        b=by6nr9v7bFNa6p1dZ/vWijhdRqubaTW9+V5XAYKd1gcMchNFVU2ai9d+1M1T3xoT2O
         IsJxxJptz2aNAegZGUdUTVJzbO0XBtYn+qGNHf8xY0RZS/XtI8dkXKcUjGydWZWBbAnY
         yvBweiQSmvML5HWHvcwI5qk/2SUXhSVoAmu6khzbWtZH4fZ/mq2EBBXaFYekp7ws3XKl
         7VFL66KtTLc0hTkIC3/P6AxB/Ax83VFJBvmbLjKVgjo9KH5ML38+GPnWs1ofrOKMzA0e
         sEnqFW2gMknxAPCWNj3bcWsHBwFE06poThswhOEMWW7HFY/8aP9auAnlrlQ5Ck836hdc
         86kA==
X-Forwarded-Encrypted: i=1; AJvYcCWfRp644y/okKqW32W1Woeir63JMwhkJIoQ22Q21xiCm1PNHM5qXRhIcHgWN88J8654IRueEf7Gl2d9bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBDpFflq/zq34SaQ2mfoEcm9tN/gZw5h0S8/rykJ8D1lzRAaDb
	vas06mioiQtc9UfE60R8h9tAxOAubtukrAvQwERSr8xUju3Ki8AAf04ra4MQCA4WZGLk8NVRCWr
	FbS+HWLEdWRJNUescQjVDhTSQVzWL+/Nta4CYh5s2jKmy5TCnyG+pUAIrykLLf3iFVg==
X-Gm-Gg: ASbGncvpkh+7JP9qMYqomOJgIxL3qF8/S+FkPo3k4m7mIouazgEUGbMoYr61WES0B9n
	g+IEPGHCnOkT3+kP1jOxJRTGI/25MO+wOWURHvV1B6wQlajkF9IR5FUGM8IcUqWBgJreXAzGnDb
	Z/h6QQsA5pZCO1PBdK4zHRpXcZmwdoRK9ho+ZLBOxmNz/AAYtl5kmg/g2Bh2SUK+aRGV60sWj0Q
	/4c/O82H7jjJ2sKhBbQDuKZ+mP/RR6oZdrxdpIHzivWwuqnqqyUE8STTOMhIP69ZkbEvekdCZ76
	/jmguifoUyokxuQTeMseeBWKEEYUWPd97DpNub0NYC24GzYd1o3eA7MhREm+cUKX3ve48sqh648
	fq68IjnzyWPsHDGZ7AI8=
X-Received: by 2002:a05:6a21:6d93:b0:2f5:ba02:a2a2 with SMTP id adf61e73a8af0-32da839f958mr39408108637.36.1760496159192;
        Tue, 14 Oct 2025 19:42:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVDUEuabDTwYSs9PWSrrtbuyqOQI43lG/pFTuKEjT/hk8Y2pr3EkOb62jBuR5TAFgHA/XjeA==
X-Received: by 2002:a05:6a21:6d93:b0:2f5:ba02:a2a2 with SMTP id adf61e73a8af0-32da839f958mr39408069637.36.1760496158707;
        Tue, 14 Oct 2025 19:42:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678ddcc604sm13174412a12.11.2025.10.14.19.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 19:42:38 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:42:30 -0700
Subject: [PATCH] media: qcom: camss: Use a macro to specify the initial
 buffer count
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABUK72gC/y2NSwoCMRBErzL02oYkfvEq4iLJdLQXSbSTiDDM3
 W3UVfGKR9UCjYSpwXlaQOjFjWtRsJsJ4t2XGyHPyuCM21tjHY5GmL3Eir3iTKV2VbJXMYyUSLC
 MHDRioGiONpx22wPo2kMo8fv7dLn+WOg59LD/y3X9AIs1TTmOAAAA
X-Change-ID: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ZrAsIN9YjfVS95RP83eu4XM2qjDvBWbZ
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68ef0a20 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=z1bv0FqhIyCrtqLIgW4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX5fIRO11ISNiC
 NkWNZgalX+R0V4UJlWAFbhR1fZlCixKlW/D1fgMofnmNvl6YGO28uBvi8FadVUMWi0A1OCIF2uJ
 HalZfjfJ5RJFpLk4nHCXFlF1R5In7y1qwNc2FD7hZt+9MjNLXLks0pCdOPGFIRoi7bPx+NxHcCd
 iuSZ8yh2GlFmFhP2KXsXuBhJAAuURbRsVgGCPUNSeu64r9W6ViCVTtXA/H7vk50aR1D9JAQRIDk
 lj5OSWYDLxcMr7AE9AyP+hYGDT5/N9IPrJOd8MlYPrNqGzTcQLxv9dA+BigHYZqHh0lxymxKAA/
 jVNkQD16F84gN1Hb4i/BIjRRA9CP2l2SeekQYEQ/O/rI8CW8eJobbHmnt4v4TZqK5YOChkMH3Ph
 EEEDm6fc57Evd3wIHIAPFTT0XeIcaw==
X-Proofpoint-ORIG-GUID: ZrAsIN9YjfVS95RP83eu4XM2qjDvBWbZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

Replace the hardcoded buffer count value with a macro to enable
operating on these buffers elsewhere in the CAMSS driver based on this
count. Some of the hardware architectures require deferring the AUP and
REG update until after the CSID configuration and this macro is expected
to be useful in such scenarios.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
This change use a global macro to specify the initial buffer count. It
meets the requirement that some hardware architectures need to defer the
AUP and REG update to CSID configuration stage.
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
 drivers/media/platform/qcom/camss/camss.h     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 09b29ba383f1..2753c2bb6c04 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -541,7 +541,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	ops->vfe_wm_start(vfe, output->wm_idx[0], line);
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++) {
 		output->buf[i] = vfe_buf_get_pending(output);
 		if (!output->buf[i])
 			break;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a70fbc78ccc3..901f84efaf7d 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -41,6 +41,7 @@
 	(to_camss_index(ptr_module, index)->dev)
 
 #define CAMSS_RES_MAX 17
+#define CAMSS_INIT_BUF_COUNT 2
 
 struct camss_subdev_resources {
 	char *regulators[CAMSS_RES_MAX];

---
base-commit: 59a69ef338920ca6a5bca3ec0e13ce32809cea23
change-id: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


