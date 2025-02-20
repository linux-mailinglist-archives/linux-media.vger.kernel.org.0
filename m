Return-Path: <linux-media+bounces-26514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A5CA3E26F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 18:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79FE13AE43D
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 17:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEDF212FAB;
	Thu, 20 Feb 2025 17:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OwCsdhMd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1EF211A0B;
	Thu, 20 Feb 2025 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740072048; cv=none; b=X/a7frZMHfUBdHJ0Ngp/Q4vTEaoJ8rTfbkO507LhVY8TAziasY6371qz6i+n0WpplJ9iGFP5O4JLlES8p8v8qnFpk/IaJrHuSvQ5LsaKIIFur1Z5sVpjlVIUnpc48biu6mH8RH6YlbCYzS75SO+W6tNSemQAfhtS6YpfWVcyyi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740072048; c=relaxed/simple;
	bh=tNl3JYwXD9ShFZNzOjInS1Tn8LUzlGf9ITtlvxPDJTk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=IeH5wdh7rf6aYdRXlPFfSDB5BV15WaTi6G4KtOza6uYEB00Fdrb7UwLnqbQjJUoilgwOf/L+VXOXTx9q5SsPzBo8cW2lSJZM3otW44akM9aF5/VJgxKvhaj0W46fRvHnwMCEi3bOVYqm1LfryfE0sgbDhXKGnjyzFuG/T2CFrGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OwCsdhMd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KH8Yh6020440;
	Thu, 20 Feb 2025 17:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J0Ppn/rWoGswZL2H79mmA0
	DqGgrqXSVdijtNbly8JdQ=; b=OwCsdhMdHBd2eOKtSJ7s2NeUCptzjVu+KvUezH
	MB2Fv2vwu6abD8c0je1fguQghGuoMg4Y0s5dJuPvlgqcVZGc14TkqhNAR03Xjg21
	k0j/O0RJmC6G8iAnpJ8Osc5VXT7Srhy+ODa776Qy2af6TNABYoa+G4RVrFVDoQN7
	uTb2APpnEitmXhe1NPgkylrrlwIy0YAHPlUNV1/weaNkrGVACTPBW0JWyq4lvbDp
	3UnTe5NY9mqNpclCcH4Ny1g16zShJjKDNq+eTCWp1H2snQ1gr8w2KFjb2LFvvadO
	O6KqphjfrX1j851bmsQfYZoxAqoY9eo+LE3flsLnH624tlpw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x06t1jsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 17:20:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KHKdAv016719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 17:20:39 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 09:20:35 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v5 0/4] Venus driver fixes to avoid possible OOB accesses
Date: Thu, 20 Feb 2025 22:50:07 +0530
Message-ID: <20250220-venus_oob_2-v5-0-4d29347c669a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdkt2cC/23M0QrCIBiG4VsJjzP0n27WUfcRMZz7ax6kpU2Ks
 XvPjSJGHX4fPO9AIgaLkexWAwmYbLTe5SHXK2I67c5IbZs3AQaCcy5pQtfH2vumBgq8YgqKLa9
 KTbK4BjzZx1w7HPPubLz78JzjCab33QG16CSgjApVaGRalKJR+1tvjXVmY/yFTKVUfLRkP7rIm
 nEh0CCWqv2jxVcDq5ZaZC0BWs2aUjUASz2O4wsGQLXiJAEAAA==
X-Change-ID: 20241115-venus_oob_2-21708239176a
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
CC: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab+samsung@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740072035; l=2048;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=tNl3JYwXD9ShFZNzOjInS1Tn8LUzlGf9ITtlvxPDJTk=;
 b=hx2dHPjXT3EZ/V56Bjj9ECWdOyaHswgglo2ht4VG/0O5U76M0m7vpGtvzs3mzsOuob2WIxhKh
 F3kqIQzNuTWAni9NAueNx+7DFDFD9xZwDMQdiJEb8oD3KlqtQgd2neJ
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: o-55cWh7AbqRMzgZFtJT3tYLvz9009iZ
X-Proofpoint-GUID: o-55cWh7AbqRMzgZFtJT3tYLvz9009iZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200121

This series primarily adds check at relevant places in venus driver 
where there are possible OOB accesses due to unexpected payload from 
venus firmware. The patches describes the specific OOB possibility.

Please review and share your feedback.

Validated on sc7180(v4), rb5(v6) and db410c(v1).

Changes in v5
- Add few checks as per comments from Hans 
- Link to v4: https://lore.kernel.org/r/20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com

Changes in v4:
- fix an uninitialize variable(media ci)
- Link to v3: https://lore.kernel.org/r/20250128-venus_oob_2-v3-0-0144ecee68d8@quicinc.com

Changes in v3:
- update the packet parsing logic in hfi_parser. The utility parsing api 
  now returns the size of data parsed, accordingly the parser adjust the 
  remaining bytes, taking care of OOB scenario as well (Bryan)
- Link to v2: 
  https://lore.kernel.org/r/20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com

Changes in v2:
- init_codec to always update with latest payload from firmware
  (Dmitry/Bryan)
- Rewrite the logic of packet parsing to consider payload size for
  different packet type (Bryan)
- Consider reading sfr data till available space (Dmitry)
- Add reviewed-by tags
- Link to v1: 
  https://lore.kernel.org/all/20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com/

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Vikash Garodia (4):
      media: venus: hfi_parser: add check to avoid out of bound access
      media: venus: hfi_parser: refactor hfi packet parsing logic
      media: venus: hfi: add check to handle incorrect queue size
      media: venus: hfi: add a check to handle OOB in sfr region

 drivers/media/platform/qcom/venus/hfi_parser.c | 100 ++++++++++++++++++-------
 drivers/media/platform/qcom/venus/hfi_venus.c  |  18 ++++-
 2 files changed, 90 insertions(+), 28 deletions(-)
---
base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
change-id: 20241115-venus_oob_2-21708239176a

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


