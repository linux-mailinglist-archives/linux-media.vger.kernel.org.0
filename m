Return-Path: <linux-media+bounces-31912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47850AAD8CA
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D1DE3B69C2
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DAD228C99;
	Wed,  7 May 2025 07:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PC+4BPHx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1FB221739;
	Wed,  7 May 2025 07:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603698; cv=none; b=C0uvDwfe4O8azc83ztAoug7/7otRW9pFibOLLwpDCJSPlYsNw/Govxkn9MbBzFU6MkOnOyGhh1DDVrEfw0/u0MOScW7mdCuk+v93AKGP+LEQJbGi5CtiarKoPKodLyPmQD9pAS3SHQUQvpxEVK1pEDf0+ta+3LhQJ0BZby/Ubj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603698; c=relaxed/simple;
	bh=1BfXjKxKZfUP783lvwFuy0UhnMmYulubKzpuWCCXISE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ftUG91vYi1yzWD52HgPNQJ0yoRciMwy5BO8K2rhENlaQ9VHYdPL1toge6gZqIDBVqEyT0shumdEIFbLohgoL9pnVTers5ZvvcCjFFkxVST8a4XTnPW1jsjw6HCtSnsWILkjN7FK1hmG/wmKwwpjfgDOTg7RT3L5j1CtHl+7CZos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PC+4BPHx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GovN002585;
	Wed, 7 May 2025 07:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vrgHxtOi1GC5A9+DXCSHoSJo8Tx9h16jhLJ4vM1LbRY=; b=PC+4BPHxI/gP/rPF
	Xs2BmQRLfNSZ6ywwz1LZBwIy6Rb/eDSg1wBtXd+WUC5D/JrQDg0vB6R8mMT/kJLM
	hi8i8JukA763JEXo559XPoRUkjsSN/QYJfVC92gS6M22m81aAPMu4MBTA64044nR
	qbNC35NKHOrDoqUGtnBo8RtRaOd0IaAeQpqRTNo2S94GVIYcZ/s2KK+zMHeyNkPo
	RLWrHq8sgHsBhVRrD9jn2+eoSSVhPjvbywLimqYf3aHxzUAYzB6si6RtQ0/eaFfa
	rTG18gmYTxGMuiyYqXPU77BnFYPOXSxODsRNl5/RfOlfWJDwqAqKWwViQ6IHA99p
	7OGxvw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fsmt1bpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:41:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477fXJH000670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:41:33 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:41:29 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:48 +0530
Subject: [PATCH v4 17/25] media: iris: Add handling for no show frames
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-17-58db3660ac61@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=2070;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=1BfXjKxKZfUP783lvwFuy0UhnMmYulubKzpuWCCXISE=;
 b=hRZClpNqd5Ti+9+bAT44MP1soC8olYa0biTFQfueFQ+4hj/va+/s4TznRcL2rbEYTd4SgFWAp
 7543+U8AS2pCBUPmKnIuGX+2EUlNGv7TkxmZrEEy7NIqG5w3uPQ6zyK
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=U9KSDfru c=1 sm=1 tr=0 ts=681b0eae cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=jWvzItAkzE0BTinG1IUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: X21aP9dtnDBHeFRuC5iqJJm2erGAG-ll
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX0rFWFbts8FRi
 qJ0zuH+1EOSro65uj5xnZCKAGVq5idAKGGBTnEItSO21H4SMZIThKEgeTEObGKB4VoyZ5T2uOCK
 z+2qoAXM9COZ7dcW6Du6FuepvKtNn5HSEBmEsS7IwlJqYL3HaEaP4Mx/9KTflndIPDabHD48YDJ
 jV3JWEa+f6RUiEDSHHoD6lriUmg/vVa169d2GbvLVWGH1pSIoxy3F7caC7FCduHVhthk6dFRfQo
 79eT8EzTdUO3hY967Bcpt5+ENy4+oqXj6SjTlTuqGy4taoZV3FtOxpoa7oxCRsAF9/HcxgM3l+E
 BioFg/3uxRjU4DPrkpGsToBNIdv1/AruUiqIde+0N405p6nZNZlZU3J1P48vZ/89CyM0znfEOjT
 08yWlAD27mK3bedTl+DhqoGzNr3PGOtWlgCYhulmiVIWi6HeKH0L6WrifTebrHYBBbSoGuzJ
X-Proofpoint-ORIG-GUID: X21aP9dtnDBHeFRuC5iqJJm2erGAG-ll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=835 phishscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070070

Firmware sends the picture type as NO_SHOW for frames which are not
supposed to be displayed, add handling for the same in driver to drop
them.

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h  | 1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 806f8bb7f505d25cafcfd5e75a39d0f00eaeac42..666061a612c304698067337f63ac9332c75c5d36 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -113,6 +113,7 @@ enum hfi_picture_type {
 	HFI_PICTURE_I				= 0x00000008,
 	HFI_PICTURE_CRA				= 0x00000010,
 	HFI_PICTURE_BLA				= 0x00000020,
+	HFI_PICTURE_NOSHOW			= 0x00000040,
 };
 
 enum hfi_buffer_type {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index d2cede2fe1b5a82cbd4dd399860c43ef044d687f..b6d0ff860d7866c85c7768ec263f0d30b42446a6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -91,7 +91,9 @@ static int iris_hfi_gen2_get_driver_buffer_flags(struct iris_inst *inst, u32 hfi
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 driver_flags = 0;
 
-	if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
+	if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_NOSHOW)
+		driver_flags |= V4L2_BUF_FLAG_ERROR;
+	else if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
 		driver_flags |= V4L2_BUF_FLAG_KEYFRAME;
 	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_P)
 		driver_flags |= V4L2_BUF_FLAG_PFRAME;

-- 
2.34.1


