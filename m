Return-Path: <linux-media+bounces-31899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DECD7AAD898
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F7E73AD93E
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B469E220F2F;
	Wed,  7 May 2025 07:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JhX5tP9v"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5598221D90;
	Wed,  7 May 2025 07:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603642; cv=none; b=ASxy9r9ty0UNUJNLqXmmivjWfJGBNrbisZ3hCeIfSNxT1LaYsPSH7EnLde124otGTqNiqQaR7PYBSG9T1lbAeVBQVsfKC4hg4f+YKA6wNX0dJA2cZDgEC3iWekwEW85D1OQ9fVlXcCXaw3dba4j05ZnC42ZEot/Huz6YNjqYefY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603642; c=relaxed/simple;
	bh=0/z+FHtvtHYpk7riH3UuMUpGFktT5wonREmSKCzpx3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HYmSmG2K8D6txXtqLT5Bp76haHijKwOzS3K6RrSSRH7kB6OBJqWexf7F5ODE1rkViaXWEMQZ1F0sYO85hNlJddMbq9ViL20cTLJkon8PJp8HSdYX3iwvs3LDQnoLwCnjHxaCW8cbHkxHOAQ6FNDmSOk6pvblPvMnxCxOFYOMEIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JhX5tP9v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471Hh3B023100;
	Wed, 7 May 2025 07:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YvfPLhkKLSpezPi0x9DiZt0En5m8l7HTPWqIYtWKbCE=; b=JhX5tP9vd46Zoj9P
	tVz7bCp2+wI5+YsahQ1iyabVdRphcestOItLRFIR08Xlq4jhDS+8ie0/I01USOnU
	UiOwuUe+jWb98fMSR5PKh7fHyykXF4Wxk3WYpVy9di0pJh95Movs4aNthJiE2geS
	GicGsNKlRq1sVlkVGx887ysW9kFYPciXQFXWblOGgDLS+sXU0fDzxVzGtLb05iXG
	pT1NFV18ThFu5Dyew2AVg1+HCp6917fnohLikgIi3wZs/UEisk7WgoeVPIX5waMD
	uphmKd6KV0VUA7dxpFS63yl972ggdNiXgvd2x83zUpsWXOnPo/u98H5AFVRFvh59
	tEOmbA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uuvwgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:40:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477eYw4005913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:40:34 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:40:30 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:35 +0530
Subject: [PATCH v4 04/25] media: iris: Drop port check for session property
 response
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-4-58db3660ac61@quicinc.com>
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=1288;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=0/z+FHtvtHYpk7riH3UuMUpGFktT5wonREmSKCzpx3I=;
 b=5OFnYDJeTLKgikwzqxyS8t8wSVoEIaPXlAx8hbf7EQQLSjFPEmaulf/PUQyQ5i9RSL443BLyb
 s3W6RxwwSK5AnnfjCvn2oPq1/bz89kun3yO+7VkkwABZPVyFZ8/eX57
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=681b0e74 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=cpaLyVTj-7XRyRbX6gwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EHfP3p3JTMwBY0_oW39PEwU297YXXgTI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX9k4R06qQc7at
 MqobIlnIzixyUwfT+GafldaCaug6HnQjVcief/E7Cm04hNVqegDoFtg5JTFD97u/GSQmYBfZyvg
 EfaGWnojkmmsToBflz8z7J5Clcmm6ZmLMT24NpQvicO8htNqVYb+ZkRtZG6gFfffZkfju/OF17a
 ZCZUTFtDHmJUloJT0vy/EQZNLtxI/WiaS2et4XL97iq+kfOX5s4a+8zIF7jO8ohMagoFuD4tpXW
 LZVk1Et17sGtOl0kaFViuwx5pM2p10U7Q1aMGe7U8vJ63PzpdOnUZF4b15iYYgRpJwKQ+1xyqm3
 w+xVheGOK8r7Ej1UYW2h8Ad9k++GS5ytLYeVvgaloPnN4Q3yeVJcZaaOj+wC3vISyvAoU1heQRd
 vGqFy+wuvCWO+RrTz+DCUXEGrdZnK3cJ62dI7/MWWW0ZNRoIMW8Ziyi0gS17r1NjmdjMwsPa
X-Proofpoint-ORIG-GUID: EHfP3p3JTMwBY0_oW39PEwU297YXXgTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=618 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070070

Currently, port check enforces that session property response must
arrive only on the BITSTREAM port. However, firmware can send some
responses on other port as well.

Remove the strict port validation to correctly handle session property
responses from the firmware.

Cc: stable@vger.kernel.org
Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index b75a01641d5d489a03206b3501b7d1617b3ec110..d1a2a497a7b2e6a1a810f2acf7d8d6f332d3d63d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -636,9 +636,6 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 
-	if (pkt->port != HFI_PORT_BITSTREAM)
-		return 0;
-
 	if (pkt->flags & HFI_FW_FLAGS_INFORMATION)
 		return 0;
 

-- 
2.34.1


