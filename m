Return-Path: <linux-media+bounces-30462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CA7A92087
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 16:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42A377A5270
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 14:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC94D252919;
	Thu, 17 Apr 2025 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLvAoc5I"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89857252905
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901909; cv=none; b=jYQ+ak1Pg3A/LivEz5LERc7wndkO4p+RnPZJdPMdQBxaGMDVvdt4B44mUCjWAoHABS9K+weYl6c94+1Gyeh3g8bQXHoF458NzzAIGIBzHj/FefewlFqhfMI6KioObo5R1UgR+PLRPDhJ9jJ9WBmdpb0S4FylE1yxMqmR3bJ9Ypk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901909; c=relaxed/simple;
	bh=pMY/0jIG3lrEg5GZ5KFr6KvJdcNAhAJuMKM0H+1/Kts=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m/I9Uy2UL7JBHzsZ+SgBA1MfTom+4AXbVbhf8dz6fVaTjQLo/Kzak2p/lNAfbV0OsBUDe7i3Ygj6rnoZeF5qjErfc0RC1RoXJmqfDW1TLS4mmk042eznuso5izsopU+LwDHHpmffI7aZikl/gqxyUEa27skR1Yv3av53ImRQ77g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLvAoc5I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClN2Z015925
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 14:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LfeP4sLjU5GUk2YiZ8K2Y7aMNcxds06nnNs
	GpShGCS8=; b=CLvAoc5ILoc9/M3HYws8E9cMTY6YpliwWiJ8W6W8w4D5BQorj8b
	s/BWFxF+3zrH8fST7rAK1F0aBLhCk969X1/GyRBrfP4jFDTKXwg/edLzl15LWHlq
	xXNNPIjidSTL2RgH8WGA+FuitdM4io1Xqc9zQBQ2JN9sNmHL27Lk6pz3wqGQFjl2
	TQXzh3VOq/498IRRxrluclXzxuvbY+zPnHSKdmcu3lsKHIcOKzR6AEiz7zHigcne
	50vLWzhqJhXTWFmpNqTlztBfHXx5nAkHk/qIgZYIzcTv23zKk6bSprWzOO3lBYdb
	4FAtWeUXHiRkO1l/L0mrxvQJu70++ucMbug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqfj26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 14:58:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso10056636d6.1
        for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 07:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901905; x=1745506705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfeP4sLjU5GUk2YiZ8K2Y7aMNcxds06nnNsGpShGCS8=;
        b=cSgDUsdhk4vNx4vwqi+KodymUHO5k1dARxPwqqK8GGjz7qcv96ojiRRnAWd3FOZqIG
         gN6x35TQiRJjTzhK/u7iXL43Ye67APcz05zMKXK89diUYj39mUGcs2l5q1IdbPJ8o+l1
         jFc4ted6IWFm9v7peg7Z554Is3wBWLSJcnbacSAfVVYnjHkFMOWqIwpANGDjy6R5Cii9
         4IcmXryQUZuwiNuJPrJvizIuez0CmGMEVCisb4iN8S/KJOiJdl4Gy5a2ZDHOxyCt4M2H
         77Crz+VdCFq5Z5BAoS73pqYWhd0xKlBhnztKeUeq7OyfgYmSQVOwZnCz/+OJ+ETFqWlY
         kRaA==
X-Forwarded-Encrypted: i=1; AJvYcCXq9l7d9cWU19yDLRPRoo5427R/el9C3g+xY+lOX8pQ212sAhqTskQgo8Q/MnYUZ9V05dijNp8UF3vJ3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRbTAjgNCoCczQT87zdVPzZE2v5E8oGsp94G+b0GyWZY515Jda
	RVUmjk7sDfSj5393an8l2uvZwcWdTO8Uc5r+54ZbLqXrldRf8ODVt/sFoxjdLeQcWDhSZEljQ8x
	dZgGANt+mXsK1NExdjVo6h4bAl739zYIS+YqUlm2tK1eA7uUoBY+phOT/t1FqfLeuHtXvEw==
X-Gm-Gg: ASbGncv36vbQ7Rmx439sPBhgARcV0qLEBjUDz+OXgGr79ddeAAsdLHQhNoGcH7lrl+P
	+iLO6zgkKCex5A7RY5ar3Lccdv2xcsyNBfB1dd1HLYDhcATsJvCsKNKRBO+notAt1ExDIln+WX1
	9P2M5Oymul//bL9PUlIfka2khaLBo9YOTxQ1P9mOhJpvIkyJ9ZWLBAEC36JlneepyUKyyQvyaSA
	BPL6JY9Z33K26mzlKk5UItC4YLqelOJgCCPGnGvPFa0TTUXCAnZuTPLzjDvu2M9kO5M/JmGP6M2
	D3GK1rXKVx601q6XVztXo3tLOsFk76Ic1Kmm+nkcRqxDX8M=
X-Received: by 2002:ad4:5ec9:0:b0:6ed:1651:e8c1 with SMTP id 6a1803df08f44-6f2b2f2f506mr78612466d6.13.1744901905152;
        Thu, 17 Apr 2025 07:58:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs94tMrUJU6Q62wJ271EI8ckueD3aicioYZneDeaoprC9wGbLMO8noE1UoVIR9qzr6m545Lg==
X-Received: by 2002:ad4:5ec9:0:b0:6ed:1651:e8c1 with SMTP id 6a1803df08f44-6f2b2f2f506mr78612186d6.13.1744901904817;
        Thu, 17 Apr 2025 07:58:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15e4:d866:eb53:4185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm3966166b.148.2025.04.17.07.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:58:24 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: qcom: camss: Add qcm2290 support
Date: Thu, 17 Apr 2025 16:58:13 +0200
Message-Id: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: C9L_lgiqwX0jncwOrwmUoXyU8Mx2qkRQ
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=68011712 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=ZpVVgv6hLUNts_qYB94A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: C9L_lgiqwX0jncwOrwmUoXyU8Mx2qkRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170112

The Qualcomm QCM2290 SoC camera subsystem features the spectra 340 with:
- 2 x Thin Front End (TFE) - 3x RDI + 1x PIX per TFE
- 2 x CSID
- 2 x CSIPHY
- 2 x TPG

Support for Pix Interface and TPGs is not part of this series.

This series has been tested on Qualcomm robotics RB1 platform (QRB2210) with
the Vision Mezzanine (OV9282 sensor to CSIPHY0):

```
media-ctl -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -V '"ov9282 2-0060":0[fmt:Y8_1X8/640x400 field:none]'
media-ctl -V '"msm_csiphy0":0[fmt:Y8_1X8/640x400 field:none]'
media-ctl -V '"msm_csid0":0[fmt:Y8_1X8/640x400 field:none]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:Y8_1X8/640x400 field:none]'
yavta -B capture-mplane -I --capture=1 --file=image.gray8 -n 1 -f Y8 -s 640x400 /dev/video0
```

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- Use RDI_NUM instead of RDI_CLIENT for consistency
- Add comment listing bus clients
- Static maps for TFE ifaces/subgroups + Warning on invalid line
- write to write_relaxed for reset function
- Use GENMASK and FIELD_PREP for register bitfields
- Fix coding style: lowercase hex, unexpected line break
- remove inline for reg_update_clear (pointer callback)
- Change avg/peak interconnect bandwidth to match downstream
- Add IDs to camss CSIHYs
- Reorder camss dts node similarly to sm8550
- Fix camss node name with first reg address
- Ue RPM_ACTIVE_TAG for APPS->CNOC

---
Loic Poulain (6):
  media: qcom: camss: Add support for TFE (Spectra 340)
  media: qcom: camss: Add CSID 340 support
  media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1 init
    sequence
  media: qcom: camss: add support for QCM2290 camss
  media: dt-bindings: media: camss: Add qcom,qcm2290-camss binding
  arm64: dts: qcom: qcm2290: Add CAMSS node

 .../bindings/media/qcom,qcm2290-camss.yaml    | 261 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         | 103 ++++++
 drivers/media/platform/qcom/camss/Makefile    |   2 +
 .../platform/qcom/camss/camss-csid-340.c      | 190 +++++++++++
 .../media/platform/qcom/camss/camss-csid.h    |   1 +
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  89 +++++
 .../media/platform/qcom/camss/camss-vfe-340.c | 320 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 148 ++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 11 files changed, 1118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-340.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-340.c

-- 
2.34.1


