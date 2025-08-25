Return-Path: <linux-media+bounces-40886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E06A4B33736
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE9E5480DF3
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2964B29BD87;
	Mon, 25 Aug 2025 07:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dlaEYuta"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE5C28B3E2;
	Mon, 25 Aug 2025 07:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105308; cv=none; b=A7bWqGKRYGTqIiSMdHQrectRN5gSs10D0FM1HFKYvTpHoHOeFyEM5iG+544bXXEyum/65BrPBXrBFxcLSMqY+Ny1iQU6TY5iCShZ/tAupJpsa9SXGo8ZPesbRf4iKL5pvEPESWvkSV2u5RUSnmWQl/xaLAjbA/UoQNvRIgq2/e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105308; c=relaxed/simple;
	bh=MykWjmYJewC1B1MpyMD9JPrZjqPm+47zDg+Pw8jJGMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dawVV0IpNuoktCFJBeoFOm4ubD7UWvRzm9imxUcFZhHy4zuqRgpu/KpP33+KBpp08gCjXr8nQKke8xdf4WvtRsbEkGwX5zOescLQ4vUnSybKNImkpqmwyn4RkeV+H6N0zk5Qmw7LH6VdJM/w+mGii78QNfOJMmzHau1WAqHYq28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dlaEYuta; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P0S8Dr032598;
	Mon, 25 Aug 2025 07:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l68KOnvWO8v0xeNQlzNyQoS6Tj/ib65Q4LA0a2ywn4g=; b=dlaEYuta8kdVtNdq
	RhrMxo++YWVX1f88qpvt3FL6wmrI2dU5me0FczcH4V8vOJG8kgypKyy0rKjiH35i
	i4Oa3U9w4ubdBKh3UM0PBnD+QXARqlw9YNgaiIygMU4os2U3eYJFP08GtwnEnhq9
	zRMApdmqoVwzet6SR1kRj23CKbnJwNuCPqOlOVCxL8kIPhpHOlgVf6snpJdaNGCV
	CeaAkF9vZGFNkF41s+FhM51KKNnnGIF1GyXZFPtzlcwkQwX0bBgdfEFV0K5KSEXe
	rhcOx8NvYYGfyXvD2QN2PjFhoLrL0D0tV0wzNbCVsQIJuMPV8huiGERlFVpgHdHC
	1PpEJQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfc418-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P71W4v018411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:32 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:01:28 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:36 +0530
Subject: [PATCH v4 12/26] media: iris: Fix format check for CAPTURE plane
 in try_fmt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-12-84aa2bc0a46b@quicinc.com>
References: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
In-Reply-To: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=1502;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=MykWjmYJewC1B1MpyMD9JPrZjqPm+47zDg+Pw8jJGMU=;
 b=jtl8NUN6+P+GAJz9Ykw9sUrWTmhUKmIk2R8FJKOMcL+ofuNSqzDTY3yxy+Ff3GoNEu+bE397L
 +0juFVtAsIRDBdnnmlCm65Nn6kX/G+8yavVq9qi5fLwkskqXcZDiTDJ
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX2RO7oln2NJqz
 3x8M9OVngheIuNzqBbnigODEVlWQyTWl75LiCOLPivCxSGBQz5ILlj18Yla9C0UXb4xmndsDb+Y
 NUdrFfWpQg+msO3mjl/xGT0c0MC5O4+rCSZWlIcS7xlxulVaZLAWLXDrJp0EZD92ptMwFM8F+1f
 e3z9lWkEXTteqGVk2NODpxFJiY0ZamZQCakGlLuMt/pj7Jw/8aiDGbjoDShg/hvFnLZxcGKO9Th
 YGrRvN+1PVrs19fYgVheNmIuaq0btO0GzSEZ29lt3bBOE0bVD7SB64QvsmXdHRoa3Q/LIIisk3H
 zZuYtFSepkdl0wyHav7irSMsm6scUXKXWQtUWArXGbWoLaSKuql7Wt1JJPAQ7nC9Of2Acfi0Sr1
 2mHb6peF
X-Proofpoint-GUID: oT-uSZrWOUKCGWywYzT8VF8OMAQ6o-PK
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac0a4d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=_KQ2K_wEe_ab9PmVUd4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oT-uSZrWOUKCGWywYzT8VF8OMAQ6o-PK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Previously, the format validation relied on an array of supported
formats, which only listed formats for the OUTPUT plane. This caused
failures when validating formats for the CAPTURE plane.
Update the check to validate against the only supported format on the
CAPTURE plane, which is NV12.

Fixes: fde6161d91bb ("media: iris: Add HEVC and VP9 formats for decoder")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index d670b51c5839d1fad54d34f373cf71d5f3973a96..0f5adaac829f2263fae9ff0fa49bb17bad2edecb 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -158,7 +158,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!fmt) {
+		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;

-- 
2.34.1


