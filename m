Return-Path: <linux-media+bounces-39723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD6BB24065
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99B32587B0D
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 05:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520182D0601;
	Wed, 13 Aug 2025 05:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UzaNPVaR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5467E2BF3CF;
	Wed, 13 Aug 2025 05:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755063520; cv=none; b=hbPTgtjTotouc2XE/9sfuFhdi4IRiRdQeYc6oEzsT6kElrbvMJ8KB84qNHTjqop5KI1mu02LK7dtMKp6RLMETIawCWX0Nq/nCZ3jHsg5w+OLw7D988bmq+QODPxqgr+5ja9958fQsh+Kkq/WtTO9hkrpe0BcwZm2DcMNa056rAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755063520; c=relaxed/simple;
	bh=EXdpO43cihyiV02dsNNfJzvTGtgGT8XE+PqbMbhN8Ro=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ORAyomArnd4Qf8ojXk2Tb9DTuXYAC9rfx1BxjwXz9hXmSJYYyYFk5UA3AljbIyQ+pCQMT2pFfdnGUCFYHFkcaPBcA8Ey1H7diup7VGzZuaog5E7lhpKHGGS+UicrLbjdE+aSvuYpoMkWXOrYe3Ou7CZo7AqaVH3ihv1Cpu0ko20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UzaNPVaR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3nY7o027556;
	Wed, 13 Aug 2025 05:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFmkWWs70JXd9JixMQWXjQ9LuUavCOvCgbjsUfSnDbo=; b=UzaNPVaREY99Seko
	bDOyH/OXlX52n0GqpF2xS/w3DODbUXdXr/dzEMOipfxWVCwGKTiWvNjiDFCkzdvI
	NNUjy37ehIZiYMMJRTUOSsLu1E4kFS3lQq6o6Hc2prEIZXbUMppLS+DztfME+5PK
	v/41RHPjLHXyfdTfmwJjJ9sy/TxeZqWfOKrU4gGJtj6RIJwuIViBR8BA89UQuI+U
	qfUyn9rgWr3vtDP5mPuKtQQ9iKo8bYQeCEQAmkUHIg8OoRZ8AvjUaVbNV0vzA/DJ
	cfJQUyJPY0ZqvTdSzBj01c0apSB8CouY99wGEkT54ukhszP6OASGSSKOJaoj4Wnh
	/VGf0g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6pe73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D5cSkR005488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:28 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 22:38:23 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 5/7] media: qcom: camss: enable vfe 690 for qcs8300
Date: Wed, 13 Aug 2025 11:07:22 +0530
Message-ID: <20250813053724.232494-6-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX5cC/VCLzmeap
 GAWK30s2rEFKc4X3YXQsAtRhs+pWbLFViJQE2+Qs1J/anMVqjA2a3TR0iIFMcLJHKk8vjrEPZ7w
 RKm2Cm8OD1OBy5TKGi2+RJ26zMVeu7dkvha6xFHX8OdwYUhVtWAUL439WLSdbeIbVtdVX9ogA9J
 bbZdRwOBFF3MiHlrLZYuDRdtz9O+evU1aDZ7omnjgEc3SekRVho5lAqPtK5D/IU0v2/XPGJMDQH
 WgafV0CVK3RLTkxLMjko8hFSIiYoKhmzmPqLjuV2/H2Fkwh2Bn+CzuUog5KRoZ9pPC+Bl8GJ4Ih
 0PXMerVxiKW1G9n2RzE9G4kgHCn/QdPVWRJQJZFjov0zxKBVPJyKQ6HJ4LYQwSXEEKzREznC8ou
 +zY9168Y
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689c24d5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=DW1U1MRD-txlM0Xp4toA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wGuBm72kEo5UETQzBOsgIZ4Gu8WgTa1U
X-Proofpoint-ORIG-GUID: wGuBm72kEo5UETQzBOsgIZ4Gu8WgTa1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

The vfe in qcs8300 is version 690, it is same as vfe used in
lemans(sa8775p). vfe gen3 have support for vfe 690.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-gen3.c | 3 ++-
 drivers/media/platform/qcom/camss/camss-vfe.c      | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
index f2001140ead1..22579617def7 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
@@ -13,7 +13,8 @@
 #include "camss-vfe.h"
 
 #define IS_VFE_690(vfe) \
-	    (vfe->camss->res->version == CAMSS_8775P)
+	    ((vfe->camss->res->version == CAMSS_8775P) \
+	    || (vfe->camss->res->version == CAMSS_8300))
 
 #define BUS_REG_BASE_690 \
 	    (vfe_is_lite(vfe) ? 0x480 : 0x400)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 99cbe09343f2..1d40184d7d04 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -344,6 +344,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8x96:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_8300:
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8775P:
@@ -1974,6 +1975,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_8300:
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8775P:
-- 
2.25.1


