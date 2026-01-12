Return-Path: <linux-media+bounces-50391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C7D111C5
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 09:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A75A230055AA
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 08:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA76133C1BB;
	Mon, 12 Jan 2026 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwnbxhZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGwK9rXA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF39430F92D
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205530; cv=none; b=r9DbP2p7pGHsBNyq0ZFb+TfXZAWlS9nurvTY9JxpHf1cyhB7D//aQpsAtfXPKMJCM7p7sZ40W7LewpQRka9J/gniVMrNJ1Pu6lQjHQYMi3tnUQ01kP96kVwQGAknMCFzsKaRL30I0FqMEwp0QY2pVQLEgjsRyiIs0C55ydtjqgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205530; c=relaxed/simple;
	bh=0vK+QqIlVWfxb3zAfD6BbTvvB5V7M2eafy089fVa5I4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O9jKvNResh7cF8gl+puTVXeTY8tMTujL6hcRwZYtWHEy7LtU1Slpmhy9Eu98WHDSELakLpddahqKIQzDoVSVTyF3iLqW0gTuMZBPD5EeVYFSfzxCKxXdWUdjnbu0G8zeJVUEVEU3Vzc/C71rSCziFzibaVK6B57sBIlyUSRxIEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwnbxhZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGwK9rXA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C88Hw03725586
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 08:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ts7gmQogGUrk8U8b1Qf8dm
	xzXu5HSt7TiDCeDL5JsJo=; b=fwnbxhZWyU0rF8UJUwDArHW2LuLc7QKvatLW4N
	VxU63J7NvHlkfiM4u0zIdxssiVo43Zh0Ocr10BN6S+5vBJzDFCPcCQ0n7cIB9GVz
	wDqQoXMi3eabm3xRSg4z+A7M5se9QVjvptz4EMpWMQ/xf3KFwB0yz6pWqbCevOWU
	3muEnZ0yBJroEVndPrPg63pgbHco6/B3eG8tnTcDCom4pqUVPlAI18yWMuRIgdhs
	wHE2ks8f6klIimdtdRxAagKuMXPMkbhqez6BZcOi08yZ8sTXwnL2q+NfmbiKuSfg
	YxAP3AZfWoNphO4S6iHbcMldJbaj5GZ9dGslcDuiipgiGe3Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxus7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 08:12:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e19c8558so188721285a.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 00:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768205527; x=1768810327; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts7gmQogGUrk8U8b1Qf8dmxzXu5HSt7TiDCeDL5JsJo=;
        b=WGwK9rXApQqdsQMumPx6ngNE7FAdd8FtqbFhCRWJ4FxsTeAEuHyXrxBjSN0oiEB3o7
         w0w95Ert0m/vWSA/fSmO1qHThamBSDawCNvysUz1i0o6YTaCkNMgUOTzxD2+zbSG6Z3w
         BIEyiPGs1uMWtcdgc+0YBZO8eQwfLdcT8H64z0abT3KtSAZKh75yECYK15lhu/I+Hmis
         sRKXa/TxyXuolNCEHE1dtM1Tzj6QPh+RpAxLUDlIMBHLgLuTejdwtnrWXmw32ywtb64g
         PfN1AiHpC6sqszNBVJFHQOkehWAaJM/DFrOCUwk/Rb03KQVlTwl1KSGPGu0afMqXaOGT
         Moaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205527; x=1768810327;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ts7gmQogGUrk8U8b1Qf8dmxzXu5HSt7TiDCeDL5JsJo=;
        b=garxeIZTmxf+mTQxYRmT7H1+UbGTIUtgfgc3rIOZbfNkOjiQ7EYZFVCEF/KLiwfE+D
         VHFzMRTEsQ7/E7frmYY/uN8ISYDFSyM/BcbfySYABJPpivQPG7GiDGmaluRvdh+FHwG+
         F9N5TZSTq3f5pOCjzwbPcclZaBZxtx/rLjc1Q82QYL6tYWu7KtxyDDcpUFbtWALz0RzV
         DMmcewDM+jwvAcBlHgWojJToVvkqvuQwln8UffDQOuD+G/l2xO5BpEC7WAEgVE4joDnG
         obz4/14fWJMAmHfO4Frpcs20Tg9CEzdbvF2Z7hjNQwYXDOV1WW7uKtMcQfSyey87j9J3
         NqFA==
X-Gm-Message-State: AOJu0YzPC8o5PZmVxf0YlBo2bPt1zEOoLTgI7AkHM5yi+UUHg9jOevfG
	CW2dQDMiIfAmsY2QBos1FSbq2G3ov+khy5wPGE5qdDDKnMNRHYe+KReI03Zl5m5G8YSwGsn4BqD
	myVZRsHX47ZOT02ISzNNC9/AD/oENS0neMc/4C9Yj3gN6qvfw3QzcmTWSC9w3I+gmaA==
X-Gm-Gg: AY/fxX4Z1zJ4wBYrONHN7McqrRqz+/+KICChrVk44y1Vh16Q+xPBwy1aRADoxDOFJhI
	csxP3Lj6YTeTUceHuMVqbynE0q9jQA1VZnOTiCfFB49nc/xaVULWJ67CJcJTkjSo5LJAme8PkuY
	MKSFf5IbtcraZBwCDD1b8D9KPU0vvepXY0ce+SJ2yy0osEaNujFVBZmX2XUUZk+72HVmy6i7rar
	648BCgm7RkdAb7Fbg3ECvKizNpeocpBGpiXpdll2npUgAjwfjDV17trfBpwFI0KTrOG7N04LXFI
	6bIlX5185PCfJmp2G6qrjvk06EIYJE524D/Qp1Jpc3CjmCWtpt5/A8oMguaO6ecFd6SaOaOms5b
	cqjcFu/GQWACu+ZHWmzdOUsk0BmQqczG6y8lJqpGrTcL8xCvhDk6SdsLimJEu3aQybNe3FkoqNw
	a1
X-Received: by 2002:a05:622a:8cf:b0:4ec:ee04:8831 with SMTP id d75a77b69052e-4ffb4a6add9mr229142571cf.57.1768205114481;
        Mon, 12 Jan 2026 00:05:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEafqlp5VNzDcf7IlNLwy/ydARsSaAA4k9ott1JNlaQCyMzM/jdlh/u5d4J1HMH+DlYQpJ0eg==
X-Received: by 2002:a05:622a:8cf:b0:4ec:ee04:8831 with SMTP id d75a77b69052e-4ffb4a6add9mr229142231cf.57.1768205113901;
        Mon, 12 Jan 2026 00:05:13 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d39230sm123116201cf.6.2026.01.12.00.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:05:13 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/3] media: qcom: camss: Add sm6150 camss support
Date: Mon, 12 Jan 2026 16:04:51 +0800
Message-Id: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACOrZGkC/2WPy27DIBBFf8ViXayBAHa96n9UWfAYEqRgJ4ztp
 Iry78XOqupmpDvSnHvmyQhLQmJD82QF10RpGmtQHw3zZzuekKdQM5MgtZBScspGaODeZiIunTL
 Rhr5XwbN6ci0Y02PHfR9rPieap/Kz09fDtt1ABgSYv6D1wIEHEbRXAaQD9zURtbfFXvyUc1sHO
 77eBQVvS9Wc3y0sI5HdNYdmlxRCQS+N+myVVMAFv+OYcTy1l7T8p1ams4R8W6R5aKISneti9A5
 jFzrjoH5nQIs+aggWATvUGGzVef0C+wihPz0BAAA=
X-Change-ID: 20251222-sm6150-camss-2b46fad884dc
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768205107; l=2829;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=0vK+QqIlVWfxb3zAfD6BbTvvB5V7M2eafy089fVa5I4=;
 b=+tQJC00B9WAz2EN8k02v94WzFgDQA/LntPGE8BBQdenzQWdLZ3WWQH8sVtM/6vJdLgJ0UoTaz
 ZlUpphz1nkUBztCuml5lxChJckLkhHXdkI8iaWgS5q1FVID7wr0eI5q
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=6964acd8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=b5PrnZgeE6CfPZZ6BtAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: w0sRpJwTB0PPu9ikNVYtzdHnZ306FQN2
X-Proofpoint-ORIG-GUID: w0sRpJwTB0PPu9ikNVYtzdHnZ306FQN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2MyBTYWx0ZWRfX2b5XHn41+LSY
 kL8REczWgxU3PJ9FAqNvumAvk4wR+4cdkZ+TVTlqfISGfBNXf/8MBSyy5wrtrLHiYgaLxoOcua8
 mrQJRh2qjNdz96T9GIRfPX3wU9QPHARMIZSaKlrcAPTQEKeuOXx3CDx70sE/YXVWAkelCAZBZrS
 P9cQty4/INfS7OhfT3gWd4BFw/YuBgu4rSIOIfLX20NI/LTOhslObGQZYdeeFVxFIFvSL97/iJZ
 L+fbyTL22xvBqNZVYSQVzhLTANctUE5i0S+9igXfSX31ns6uei4qHEYYqX8kEv8BL54jAkanM6y
 F6Ltu5b5SpElA5MF2Eaf0eBm4FEMIlKRxayz+lo0+gZI5GZ+tubtfYmtLjmZg5OIz6XKVD1MhCV
 nHIRidWqskzpo13Cs2Ibc/FQ93iz84xYD5Kemw5OUOa+1aw2xUaXPCUn4StIzd1PGdTRY5bTsGQ
 tkSr7fKUUZSSN3DqjOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120063

SM6150 is a Qualcomm flagship SoC. This series adds support to
the CSIPHY, CSID, VFE/RDI interfaces in SM6150.

The SM6150 platform provides:
 - 2 x VFE (version 170), each with 3 RDI
 - 1 x VFE Lite (version 170), each with 4 RDI
 - 2 x CSID (version 170)
 - 1 x CSID Lite (version 170)
 - 3 x CSIPHY (version 2.0.0)
 - 1 x BPS (Bayer Processing Segment)
 - 1 x ICP (Imaging Control Processor)
 - 1 x IPE (Image Postprocessing Engine)
 - 1 x JPEG Encoder/Decoder
 - 1 x LRME (Low Resolution Motion Estimation)

Tested on Talos EVK board.

Tested with following commands:
media-ctl -d /dev/media0 --reset
media-ctl -d /dev/media0 -V '"imx577 9-001a":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
yavta -B capture-mplane  -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

This patch series depends on patch series:
https://lore.kernel.org/linux-arm-msm/20251114082649.4240-1-wenmeng.liu@oss.qualcomm.com/

Changes in v4:
- Rebase based on the csiphy regulator change and add regulator load support for SM6150.
- Link to v3:
  https://lore.kernel.org/r/20260106-sm6150-camss-v3-0-d1d5c4d02b0b@oss.qualcomm.com

Changes in v3:
- Change the ICC node names to hf_0 and hf_1. - Krzysztof,Dmitry
- Link to v2:
  https://lore.kernel.org/all/20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com/

Changes in v2:
- Add more resources(BPS, ICP, IPE, JPEG, LRME) and details for CAMSS.
- Correct the order of the header files. - bob
- Add Csiphy id num, improve the resource name. - Vladimir
- Link to v1:
  https://lore.kernel.org/all/20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com/

---
Wenmeng Liu (3):
      media: dt-bindings: Add qcom,sm6150-camss
      media: qcom: camss: add support for SM6150 camss
      arm64: dts: qcom: talos: Add camss node

 .../bindings/media/qcom,sm6150-camss.yaml          | 439 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 200 ++++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 198 ++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 842 insertions(+)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20251222-sm6150-camss-2b46fad884dc
prerequisite-message-id: 20251114082649.4240-1-wenmeng.liu@oss.qualcomm.com
prerequisite-patch-id: affdca1f0af770b95444f99c203d291bcc41ec9c

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


