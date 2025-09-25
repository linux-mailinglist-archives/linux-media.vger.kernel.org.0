Return-Path: <linux-media+bounces-43111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E2CB9CC70
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 02:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE774171581
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 00:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F744C9F;
	Thu, 25 Sep 2025 00:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHjGhZkr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305144A00
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758579; cv=none; b=BpDY0hEjitrzQ2RzsjLTFkk4xxTFnBy5aclFeA1qVKkb5r3du3gJXP65BGqyxoR4HwTZSkVB9ECtjiPGJcw86RDD3CRdxqwHYX6ebF4sFpyF52UVTP0VI5BvcBSC2DwB78JjYbeCAjgF5GNpKhZXdSphERkvuJtsoANR8m8Tx7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758579; c=relaxed/simple;
	bh=WBOdnGCqtO8/DJkdBoR28EHJL+lRE3iOJ/Mmmvw684U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WWzwQUPqiafRfm72hJQRRQJW/MgGT+XJXwKnsvV3xZdaV+1Ut6qTeLX51JxWdj5TJcDljBHhAlfVHgVZEPQGydGFHlYoB0g9Tr+OGxQ0uUpQbwMr4F71qeu1w5XanBwDFR6sUjJwR/7ocOxSOk/19s2oocGep4IdzkiCuBLapDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHjGhZkr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCq7p5020897
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FVDJLdbn7C6FBvhh2FmnyA
	hinN5l1LuKxaCC0VoE73I=; b=NHjGhZkrpyzFeyJAR43y0NKgVD/KJ8vyVnwa+C
	GVVC7JOBE1gTnYtrsY8t9Qgw8hGXUAFue2bJ36crMqBgt25ccZakEA35hNSftrPe
	LS5VBLPPOaFolDjcfLrlKDbbIKohOI64g3hMRtO9Duypgr4aMv87mMiCV5zrw5rd
	HYKygtEErPrg0GwWDZAfHXK59OY3Yybx8GL2sb9tgqyBbkzEM22fYzB87LcjY6NC
	i9nJkSgNVkrxeinZyCjUFk6jUvOpY9RPSp+myPdiNQ8ARwYOwbutlm2TU2yR2OEY
	sQfsFr56fsWvVjSwajYMTbA1QLj4Fj2ARd9ee6YR3oWklweg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdyb3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:02:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b55397041dbso391052a12.2
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 17:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758577; x=1759363377;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVDJLdbn7C6FBvhh2FmnyAhinN5l1LuKxaCC0VoE73I=;
        b=iiQPPeg5DkecoREsjO3ZKqU2Ej5QnuTc0gp1aHtuUtr4aSiCf+SaeRkz/MX7AOifP8
         8SgeF7woxry6U3bja6G/vEK6GvsBZ4Oe1RYCfzVFhstdD6PiX5kOJGOjLWJ3xSBg0s+0
         sUrd56WDAkYteSWd2slnykiJ8V/m7YUs7TYE0cqeWqkAH9kg6AC0YvjF8hb5PQiUbz3V
         fa2OWGLoVzXQPoYCJmtwBtH4CRZTKrXsEmjebXB80Iiayvk8p+NiTI2044E+sirpn05b
         LS5ITjhiDqSp71uKY/zhXcKSd9JUERyv63WrAlrXIBh83euNe8uAZ+6SecYqfkFWs4td
         te7g==
X-Forwarded-Encrypted: i=1; AJvYcCXdotOmMNH0fG1t90YaClX169An28fi5dM3zk/tp7S341GhMPKvlCqI400/geGeYnwXkDwfgTpwYvBOVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKAn452hc2CU4Q5KkTL0bemIBuc195l8iM8wl86E3GmHcBJ9bG
	O9q1Xl0VIZjlnWv7RxM98RiaD8u8sVj07ACKCpuZBr4mzHBTH/bzAa9U0EK34oRqfcWO2Kl1owF
	Eh8WtGVs1VbpMpobK/Srz1UrsjnW/E+gxqGFKQu7cu5MOhhplKmSuClf8keY5MnCv4w==
X-Gm-Gg: ASbGncs0zkZqDFQdSHS9yWKY6aY1YkuN+eu4g9SBD6i6xV5rMIx0eNONC9cqRd40izF
	qFcFbRcPP/bXSwUo4A6wXus31RhfTnqTCZ5ugb/ChAd5mxPpi/HnEhcBYuoWxXOQxSM5mlNB9Po
	l+aImYjHNU/+Y7OsjKHdmZtfvGSfnyQY/Pzv7m84Kd3ksH7j3FlQE4g1dO75Dyy7nsfGf+s+1lh
	mzNGpgLKHUEKqXBhLdvtNHDqUMLHrFcAnhvqmwu7QW/ZcRg3naz/T++nwlamScmHskjyFk8sbTO
	600s4PdZdChmu5792kHki3JQS6ojxDah2KldGuGIrXabqDmnyiTlrYyEDdJVUDf0+HbtnqDL57F
	f1VyLqTGN6W75yUk=
X-Received: by 2002:a17:902:e88d:b0:263:b8f:77dd with SMTP id d9443c01a7336-27ed4a5ec57mr16016935ad.57.1758758576425;
        Wed, 24 Sep 2025 17:02:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDia2gmtmkvCVOrNQm+dLiZu+nms2zkdbZoHc/NFzjpKjXRmJZ2zf89NbxCNarVMVoCxn2Qg==
X-Received: by 2002:a17:902:e88d:b0:263:b8f:77dd with SMTP id d9443c01a7336-27ed4a5ec57mr16016615ad.57.1758758576011;
        Wed, 24 Sep 2025 17:02:56 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6715f0esm4807215ad.52.2025.09.24.17.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:02:55 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/6] media: qcom: camss: Add Kaanapali support
Date: Wed, 24 Sep 2025 17:02:47 -0700
Message-Id: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKeG1GgC/x3MQQqDQAyF4atI1g2MsS7sVYqLOBNrKE4lKSKId
 3d0+cH/3g4upuLwqnYwWdX1lwvqRwVx4vwR1FQMFKgNHRF+84KRZ0xNktDKs6NmhFIvJqNu99O
 7Lx7YBQfjHKdrP7P/xeA4ToMmEEFyAAAA
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758574; l=1899;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=WBOdnGCqtO8/DJkdBoR28EHJL+lRE3iOJ/Mmmvw684U=;
 b=r4eDTZd32hxHigyWyEa52AxJeKsEUWCWng3+hmyr9O8xR4vdHrn/0zAUu9fBaojanEFuQxsky
 Q071JVU2c8nDO1WcSYps9UiWc+7pL/dwA4h5x+vNynWx19+elT4mvly
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: l87g16FFzWKtIj-xMH_9auP8uscG8cCW
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d486b1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=BuH3vWvutgcbvWnSHJkA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: l87g16FFzWKtIj-xMH_9auP8uscG8cCW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX4xU6J+qYAnEY
 dZ+hXHEXS5JSxxGmS5qnwfV0lmpa3qtWVLC1D8MqFCRKn5I2h1kzngWGx6Xk8WoLvSHOLhiIgTM
 /S6AvOSfKBdOvTbi1jfi7ckS3f1CdlqiSZcRElfL5t32ZAlwmwSv+pCAK8K7VNMcwP2P60GJzBc
 +RL1aymQY8vGVMJ6xCFC/ZA5QIYmNb0RQA6w95YtY3ZQAwNKa3n1FKAa7+0okw/i/l9+/O55ln7
 l8j0N+AWARrkMLE6FS4Y5/H0C5dcmFXYT24RTcqg2liTinksf9XsdvnBRCETrb0TCLuGLCXDhlW
 vorMx88+2ZT3OEzktLrj5A1Y4qEhf7FApA7nTDitU21FxW5EXV3yTczwnuL2nMpGKuzkRkwzOAd
 Kj8hDWoQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports.

Kaanapali camera sub system provides

- 3 x VFE, 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID
- 2 x CSID Lite
- 6 x CSI PHY

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Hangxiang Ma (6):
      dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
      dt-bindings: media: camss: Add qcom,kaanapali-camss binding
      media: qcom: camss: Add Kaanapali compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  17 +
 .../bindings/media/qcom,kaanapali-camss.yaml       | 494 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 379 ++++++++++++++++
 .../media/platform/qcom/camss/camss-csid-1080.h    |  25 ++
 drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 138 +++++-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 156 +++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  15 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 347 +++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   2 +
 13 files changed, 1575 insertions(+), 11 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250922-knp-cam-d3de05e4923f

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


