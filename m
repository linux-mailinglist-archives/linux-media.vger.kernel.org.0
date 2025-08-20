Return-Path: <linux-media+bounces-40367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F3BB2D7E4
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85AD018887BD
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAF62E8DFE;
	Wed, 20 Aug 2025 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n8h+njfQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F9F2E8886;
	Wed, 20 Aug 2025 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680930; cv=none; b=BXo9WFsLzVTV46IDBZdiVVUAoC044HIMqK15cBYlpk7n0S1VfbKjGPHVxq+hQg+ut7mAJQoj8jzGvjKtfePAKqk3Zk1yFIQAGGxSqSYbGEfh/kTJY6qmmO9ZD5/3bzBQmtRAHUOFkyyEIIqBluoPYYVjnk83+8f6mTchFOsI+yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680930; c=relaxed/simple;
	bh=k2L5tEtI8bsLkQUn4UThqgjvqaBk8dpifo0fVVtD71U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gWwokzCU21oreA7IgFVT+gAF7b8WB0aTnyruoB+UwrKmXpLR4BB7+0PeGQrPIAXtbEQI5Ds5OkRr7WHTEZ/Z+qgfJIBpbq4ojAQioDr52Pcgl17tohlFf84Gqvve6bztbTw6Qe43x2NdooS90Q3b7Cgv1KipnlX4BXjAwZUtquc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n8h+njfQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1osGu024847;
	Wed, 20 Aug 2025 09:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mNyDJ2K+CoAlAddjZ2/zbihTqrTnoxYSKZJPGucqNXc=; b=n8h+njfQqAi3lVwH
	3sbGBv0aL2ffPl0v331QF00Dar499JptDuBAsvIYEgDu0ZHuIMyAOiSJmTkfGeRu
	S2CEXuAhgtbl11i2fiE6uK0xKh0+zSXAkKegV6eT9aU4VFSbfYaz1J849B3GLdG/
	tGySWYRMTPrMrPvZfDo8CTyiZZv0k26mCLFm2swEv05SjdPgWcXz3uENU2hbL06g
	bo/imxe/mARdMX9JUGSIZSQApU16da3t06qfRXvyOP7Cl6oZgM851EMQQSmmj5tJ
	afE9XvGA0dpx7Nv5nEnskvwEAg6NKLMhGmnrUZYAZeb0nHErChGWqesXYLbosejX
	3ulOFw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52914fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K98c1Z005209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:38 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:34 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:50 +0530
Subject: [PATCH v3 12/26] media: iris: Fix format check for CAPTURE plane
 in try_fmt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-12-80ab0ba58b3d@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
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
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=1237;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=k2L5tEtI8bsLkQUn4UThqgjvqaBk8dpifo0fVVtD71U=;
 b=/qqrHsdvi3bkfBo0sATHmv8DyT4SWj26MIuqdC1p3a8irmDCBfGnCIRVb6SkpdIZoS01jiWa3
 HR6Xw2+qP2lC3yEYX2Al/YBVk9bsFPiUXIxlJETvZpeC7RkyFK6kRae
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a59097 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=_KQ2K_wEe_ab9PmVUd4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: qQMV0TjeCrTT5xg4edsgzUNqSZ3zLzo0
X-Proofpoint-GUID: qQMV0TjeCrTT5xg4edsgzUNqSZ3zLzo0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8ycDdLb0J7KN
 aFhsoPtwEtUFE+BsmdYYNpPrmf6M4Rv+H2rFVVrroIg8ivMVOLK0lHhJ1XB7KF/VjVHAuxQuBc+
 pn0xXzBCIhFIhdhe3FPbK0EXmcqBDW7e05mLq/lk3Xn31MRBW3FfXUchgHvk9kdIzi0ulXRh0d3
 eVHq/gYh6cJKLftmglghQDQ8zrQekfDDXjt/6TDuEPzKLfY1eyuzus6TEvbtYfxohl5Cp+LfJk0
 8qrtr9+hAyQV3FAXfXr/UvJwNBP90wlfQYUz+cknPr4mASRQX5HLqhDy3QJrH52Wi+inZ4ouc/K
 cAFvS5vGmxLGKmwhYuE1stlR85QwhHvgf8iJlQbIj598MiAg7dXt8x/1cvNTfgPSryd+bT6EgyZ
 cO1jQJndNWSU0XW+Yi80um4KPxKMww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Previously, the format validation relied on an array of supported
formats, which only listed formats for the OUTPUT plane. This caused
failures when validating formats for the CAPTURE plane.
Update the check to validate against the only supported format on the
CAPTURE plane, which is NV12.

Fixes: fde6161d91bb ("media: iris: Add HEVC and VP9 formats for decoder")
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


