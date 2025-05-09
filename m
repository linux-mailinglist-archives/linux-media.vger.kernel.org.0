Return-Path: <linux-media+bounces-32089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34893AB0D50
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB2C44C682C
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF65C27605B;
	Fri,  9 May 2025 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AMPOWNuT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1B227586D;
	Fri,  9 May 2025 08:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779968; cv=none; b=G+tQad13VWkBlRxq6WzMDSLDR+hptKp5KeRq2Zu5XXJVbgNGih+J3wfHQ9UU4cpySJTEa3pmstlDPVUNNRDCAX3bKlM1/D3yITQMnmYnvQbpXUEiDaRgEMM8APfA/CRwej0DwbBGa8rGRwJf+kV80uJ2wciQTH24OLmivk1b5VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779968; c=relaxed/simple;
	bh=gg/a8LuTzhNFq59DYCcM5svUqvpp9j26UBYafnA30VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FSmZ4nT08cfgOoYZc5pzWWePQlbNCoIUPxr36d5f3fL5kJHINL7YnU9qQOb4IIdpahyqeurwrjKxAJJd38C2rtcVg02g3Lxrb+cNmzi7FnJbcQCYckNXJBCEvNaM8twgG1qeXwCEU9R+8l2gobegnBtEyauxpYZsZIQUHOAnEQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AMPOWNuT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54926ltI010480;
	Fri, 9 May 2025 08:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fuREf948XKUvk0GTIBJ/MCSJUS18OkHblS7uxbQoDcc=; b=AMPOWNuT2e+0MYAa
	Gt+bAL5ul+bwdeG/gVTNgqkr/suYSNPrAVVD7BIji54AcjgW/G/k1uI75owkl6dX
	Hx3Pfm9L2kmo4eKMmSardTPh7vrmyrBOpHWqDUjvVzknWGrcH3rkj85rixrGkUgd
	WXWJeInOO4D7TSqd328sian/UhwhLLJUDWokpOZoXWGl5u16Biw1dtjMC88OQAvK
	L39yz+k30C2YOPW80NSa+J/LUjdgvyusbtcIDD97fDIvQEaqyAFqeaHL2j1TgbPK
	A3Cn7sHS0XWHM5LZHnl62NiH1VXdyOYgRmQi01RQf9BdML5h9EsNhJBOzKhAiSdF
	grqOaA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7c1ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:39:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498dLBo015469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:39:21 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:39:17 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:08:50 +0530
Subject: [PATCH v5 04/26] media: iris: Avoid updating frame size to
 firmware during reconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-4-59b4ff7d331c@quicinc.com>
References: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
In-Reply-To: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=3645;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=gg/a8LuTzhNFq59DYCcM5svUqvpp9j26UBYafnA30VI=;
 b=rdQ3NjsGGfjRuNsffa1FvAyC52czIMkkvjikjDO88EjyCOv7ks5UVxjlp92n9vZppS3TaFyq8
 rXcWJtEtWLQBi21nLWq0g5f2EfqGvcJO4Zi2swa2CpAiL/qFaJC0Kcn
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX2zwmz+Dm3bTX
 sW/bTsMWcgO4fOH6wp2NPfKgyQXfXOSTKyG1yOOqk1v9tVSR+o7ebGEazWZO6DWwegY/8iUegnw
 6YjbC/NsFig/ZBzL9Hc4DpbTHHpTbupO2aoZS8Fjvtk1ml50JYIMr1GI5Bktn+ycbV4pZX+mSHx
 x/AHOPWo14D0yqqauTYGfGQzmMbNhArlWdRXiccrMjeojzdeihlvD3TwGb77ogn9XgrkrMIaaOm
 p9SYV7Y0Ca7aVBawwYvXbScA7O4V5azT+GcFv29KqtTZxaqR1MqSiA88W1smqO0v/K3epps8AT0
 x0OFoA8zQE3SNGEWkN70ilaP3uB+NU1VRzL/2I+7OJWRzNCubOEPmC8PkXVzM4hjunc1S8Hjzx/
 SZFNZGn38A5lA4oaPx0BeCDGC8YnMJ/QRmb+cW1ayfp76YKt6jnPUjdv5kLql3+JDC5moG4g
X-Proofpoint-GUID: 3XTtP3Gtg5ly1WRn6AWkWfO4je9B9lY8
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681dbf3a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=E3BzaMTQMFddoOmk_uQA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3XTtP3Gtg5ly1WRn6AWkWfO4je9B9lY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090083

During reconfig, the firmware sends the resolution aligned to 8 bytes.
If the driver sends the same resolution back to the firmware the resolution
will be aligned to 16 bytes not 8.

The alignment mismatch would then subsequently cause the firmware to
send another redundant sequence change event.

Fix this by not setting the resolution property during reconfig.

Cc: stable@vger.kernel.org
Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 15 ++++++++-------
 drivers/media/platform/qcom/iris/iris_state.c            |  2 +-
 drivers/media/platform/qcom/iris/iris_state.h            |  1 +
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 64f887d9a17d739cc404d83f1185dec5742c273b..2a86c27443eaf2e65eef8ec1bb89545fbd5ffa50 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -546,14 +546,15 @@ static int iris_hfi_gen1_set_resolution(struct iris_inst *inst)
 	struct hfi_framesize fs;
 	int ret;
 
-	fs.buffer_type = HFI_BUFFER_INPUT;
-	fs.width = inst->fmt_src->fmt.pix_mp.width;
-	fs.height = inst->fmt_src->fmt.pix_mp.height;
-
-	ret = hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
-	if (ret)
-		return ret;
+	if (!iris_drc_pending(inst)) {
+		fs.buffer_type = HFI_BUFFER_INPUT;
+		fs.width = inst->fmt_src->fmt.pix_mp.width;
+		fs.height = inst->fmt_src->fmt.pix_mp.height;
 
+		ret = hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
+		if (ret)
+			return ret;
+	}
 	fs.buffer_type = HFI_BUFFER_OUTPUT2;
 	fs.width = inst->fmt_dst->fmt.pix_mp.width;
 	fs.height = inst->fmt_dst->fmt.pix_mp.height;
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index 5976e926c83d13ad06cd17bb9eefc31d532b2da8..104e1687ad39dab93ff66450ba3a97c309b1e1e1 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -245,7 +245,7 @@ int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane)
 	return iris_inst_change_sub_state(inst, 0, set_sub_state);
 }
 
-static inline bool iris_drc_pending(struct iris_inst *inst)
+bool iris_drc_pending(struct iris_inst *inst)
 {
 	return inst->sub_state & IRIS_INST_SUB_DRC &&
 		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
index 78c61aac5e7e0e1c7ee6d3fb6f9b121b61481a2f..e718386dbe0402417f408d8fc696a33e5c7f23b3 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -140,5 +140,6 @@ int iris_inst_sub_state_change_drain_last(struct iris_inst *inst);
 int iris_inst_sub_state_change_drc_last(struct iris_inst *inst);
 int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane);
 bool iris_allow_cmd(struct iris_inst *inst, u32 cmd);
+bool iris_drc_pending(struct iris_inst *inst);
 
 #endif

-- 
2.34.1


