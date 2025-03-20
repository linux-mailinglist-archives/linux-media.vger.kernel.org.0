Return-Path: <linux-media+bounces-28537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E474CA6ACD3
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 19:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B6B4488AE5
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 18:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9A3227EA1;
	Thu, 20 Mar 2025 18:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gzu//wCC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CF41EB5D9;
	Thu, 20 Mar 2025 18:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742494063; cv=none; b=u5PR1QzTF0XmjLYSsbdix1yp9veN+WwRJJ2Fs/yWGKfkSozKzxAfQUoL2DuG6Bhix8ScdKjv2SPV3DpZDLAvKEM2HlffWHKHMCbmchvFGmjI663L0OAy+JIq+G3Wetc8zwjC2Xwwt62iNmfDo8OHKtP5jBMVK4wy5+2YV4SMmtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742494063; c=relaxed/simple;
	bh=QV8L3eVu7WzhPo4f9l+/FZnZO++yXN6ZtUYKcJzPTjU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=GbrUMnHu3FynYj9ggM2olyoTqK7v2SvDz+Prll6kksdx4i700BwcL1Xa50VUQXLXUgn/gP3Axse2N/v4UwjRtEylKS4Q5MwXFuBdBnwbVWRuX92hA3iR2xaSIhRRCe7nXG5Ix2Uyp/NweENBBAyKxrufc8fKEcr7cScNnqBDvx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gzu//wCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KDl50c016217;
	Thu, 20 Mar 2025 18:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tadcaHxvBRJlFagk5nf3Zh
	Q7Wvcdf0zs7Bhe9EIYvoc=; b=Gzu//wCCDKo9L+fF10Ijhr0H1dC8qdPMcldMCn
	D+ZsSb+oAkpR/mh1uLxJuPk43MaTchVDP1+U/WNcsHakr8OqUVBKL0aLzIke4wBk
	mtAYIeCVM3X6rAkCDo171Ysu/dvm4Uf3e+O6w9ja7yN8T/G1hfps2uNXYrH/Cqzq
	z4NliqhmeFqi+kl8U+sLfWPu+w2Gt0u3jMe/d8l6+mvY2bcbRIwv/Paohoq/Q7Np
	afvV9F30S2iwkfx28tQ3gVdC+CTJ/sL7meACwvYA5IITkC4y+cdykQPOKEh2Yzu9
	LzJMXXDHxsLpxvYT7Vpgv3EtUmJcFil0eTaFCk/O8exiXL6g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g4t43cgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 18:07:38 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52KI7bGP014994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 18:07:37 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Mar 2025 11:07:33 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v3 0/3] media: qcom: iris: add support for SA8775P
Date: Thu, 20 Mar 2025 23:36:49 +0530
Message-ID: <20250320-dtbinding-v3-0-2a16fced51d5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADlZ3GcC/1WOzQ6CMBAGX4X0bE1/RIon38N4KNsF9mDBFhsN4
 d0tJCZ4nC87k51ZxEAY2aWYWcBEkQafQR8KBr31HXJymZkSqhRaCu6mhrwj33FTK9m0IEuJNcv
 3Y8CW3lvrds/cU5yG8NnSSa7rryJ3lSS54CUYUTmt28ri9fkiIA9HGB5s7SS1c9X+g6Sya5xBa
 09YnQH+3WVZvhuprHDgAAAA
X-Change-ID: 20250310-dtbinding-8921bfc151e9
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sumit.garg@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742494052; l=1153;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=QV8L3eVu7WzhPo4f9l+/FZnZO++yXN6ZtUYKcJzPTjU=;
 b=uJbnqkjfGzk4h+QepT29doFi3uOF7Sb+ut5M00khKcDnoIxs0k7dfSZ/AtkTVAy9ao1yO+LWa
 PXBuVodK3+5A7RcDepLd3E5YKZDWANZMg+XXy0dBYwP0xjs7qXEdwEQ
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HMPDFptv c=1 sm=1 tr=0 ts=67dc596a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=uUO1Guatd2edvWoe2zcA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lWW2PVSU77sp1TjwE-GVwLAA2WlwpfgQ
X-Proofpoint-ORIG-GUID: lWW2PVSU77sp1TjwE-GVwLAA2WlwpfgQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 mlxlogscore=989 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503200117

add support for video hardware acceleration on SA8775P platform.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Changes in v3:
- Fix nit review comments.
- Link to v2: https://lore.kernel.org/r/20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com

Changes in v2:
- Drop 01/04 patch as it was not needed.
- Introduce sa8775p as fallback compatible to sm8550.
- Move firmware files to board DT
- Link to v1: https://lore.kernel.org/r/20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com

---
Vikash Garodia (3):
      dt-bindings: media: qcom,sm8550-iris: document SA8775p IRIS accelerator
      arm64: dts: qcom: sa8775p: add support for video node
      arm64: dts: qcom: sa8775p-ride: enable video

 .../bindings/media/qcom,sm8550-iris.yaml           |  7 ++-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  6 ++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 71 ++++++++++++++++++++++
 3 files changed, 83 insertions(+), 1 deletion(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250310-dtbinding-8921bfc151e9

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


