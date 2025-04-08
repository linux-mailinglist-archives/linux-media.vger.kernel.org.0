Return-Path: <linux-media+bounces-29638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D376DA81103
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 17:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 277EE188977B
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 15:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC5722F178;
	Tue,  8 Apr 2025 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U2Xt1RIG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F82F22E3E8;
	Tue,  8 Apr 2025 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127703; cv=none; b=PA5jpp0JrAn1AuGFVS0MR9csGv7XH2IUupYKIK4NH7zNa62E7F6Nqxj4cWfsn0WYFUrc+phxG1OiPrkJFxtnXRMiukwOU70XnrJ16TbsaG1g2cak6U2bCkiY4c2n9nUF3DVcHQyP23WSEWZB6gu+eCakhbQp39Z4U2xddff9jIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127703; c=relaxed/simple;
	bh=rLk1PPqcpHuhzHZmHvLKnDZSccgdd/AVi0k7fRNFahw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Krl+HCFQ/WfFdlkynNV7yNP51bIK8ybN44MKK59yz0FoqtGhVXFpW750NiM3hkX82e4AgNj3ZvdVLilADX7JjlRD9OlchgSl6xGjNXwp4PhW9L+o+gNmGg1VneA+RQKYX3pKRVj2/CZzz8oFax0DbDxIXKoyEYt5Hr8RwmAoHz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U2Xt1RIG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Aj7gP006556;
	Tue, 8 Apr 2025 15:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0yL16xedETI3G5m4NzT+PtqGHXyQfUvmdjVt51KZRg=; b=U2Xt1RIGMMmMGJW4
	qH8IVBApGyKtnZ1XdJMChBVpx98mTq9Tr24a27sKI7CWEXPXYARGbPBQZHSP2/0r
	SO562FCCszU8sMbCD1MOEVhF/WxK1KoYNUxRZDK6723ou15FF+9qZS8HNJMjmjIR
	I46LBtnRnexNdXirkzV6RT/+C2WNhx9xGJZRBSiny3MpLMc4aG6s5RkcY9od87Gf
	tjVtoMm13gR9oq5NRdEDwg3aO88vS49xeiJgMykrvNLzK0HQdX2xNI7NpErp1DgF
	K9HyU/A4ydXMrW51tyUKy1WoIGzyxeHz4C7u9Gsc4en9VGSl4mRIT6mr29KJCCq1
	euT6hA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftg6w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 15:54:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538Fspoj001501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 15:54:51 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Apr 2025 08:54:46 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 8 Apr 2025 21:24:16 +0530
Subject: [PATCH 02/20] media: iris: Update CAPTURE format info based on
 OUTPUT format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250408-iris-dec-hevc-vp9-v1-2-acd258778bd6@quicinc.com>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744127674; l=1340;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=rLk1PPqcpHuhzHZmHvLKnDZSccgdd/AVi0k7fRNFahw=;
 b=tg+qckywgDkSYRc7WfOMOkDuxiNktJd7ApQnBb4sbAjmK7/2K84lSA98q246Rn5Hi0VnqeW9b
 SfEWWo/0LBABivMIdzzXVcwnjANTe7UdPMn29znHDKbgmwxvf47z/0P
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f546cc cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=H4aCPc18VLGkYZj90ZUA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 56B4MW-n6WZ-s-gQpls20l3R9skYQI2Q
X-Proofpoint-ORIG-GUID: 56B4MW-n6WZ-s-gQpls20l3R9skYQI2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=906
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080109

Update the width, height and buffer size of CAPTURE based on the
resolution set to OUTPUT via VIDIOC_S_FMT. This is required to set the
updated capture resolution to firmware when S_FMT is called only for
OUTPUT.

Cc: stable@vger.kernel.org
Fixes: b530b95de22c ("media: iris: implement s_fmt, g_fmt and try_fmt ioctls")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 4143acedfc57..c5d85936b3ae 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -171,6 +171,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		output_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
 		output_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
 
+		/* Update capture format based on new ip w/h */
+		output_fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+		output_fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+		inst->buffers[BUF_OUTPUT].size = iris_get_buffer_size(inst, BUF_OUTPUT);
+
 		inst->crop.left = 0;
 		inst->crop.top = 0;
 		inst->crop.width = f->fmt.pix_mp.width;

-- 
2.34.1


