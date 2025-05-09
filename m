Return-Path: <linux-media+bounces-32100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0572FAB0D78
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EFDC7B7ED5
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7844528030B;
	Fri,  9 May 2025 08:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F8p250j+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D270276026;
	Fri,  9 May 2025 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780022; cv=none; b=WPf5TRmUjcY77YfCboWEDmStuvCzuxjmyOm6qCurTPomdy/daI8DWEcT6Ko8yBJHYu/Yq/SWr2NzhQaq1WK4MiimbuaHNTOKDr+6l0bs6bJRYWHeGu+OaR3RI5ZmMvmLeeCekT4ge3DoT5u+KwwDkHkr88UKM3BnjW9P1ZeRF7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780022; c=relaxed/simple;
	bh=rxaJyxV+oOHrMSEIUfapGZcvhgJSlzdYeJUgtN4Ktuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WAFRLFqWWhUS+zBweLXx+SOIxqBR0W0sUYZBwc7Jv6K1vSCmKkmlM86S6COdIMokKcZHsWiqegQcOTGVTaJKgaVFJzog5+ECbmnLwo5OrwzhpFRlMR9VKM5aQDJgKL3fIR6lYFzURUryWltJEVP8LxbmM8APAJNjd3UelXIjce8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F8p250j+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491g1fm016559;
	Fri, 9 May 2025 08:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	At/SnqFizXf3aeit7aRwArxvaV+Ss6Y4V/CxYXmJYEY=; b=F8p250j+ewu5skV2
	iBd7FnaNFshpdKD3rh6ncmP71uG+zUPQHvi8MfeiCBOGZk50cEKHHsq0jQQDorEW
	gPKCn/9V2CxmKMigaaCB2y8oNYh52oQj7z8BCnAtb7DtCMIqoke8GrqDbHovP31j
	B6PL9ObQ3NQ3s6IhFx1QP5pWfMvwLBdTIe9ItwC8Bpw3AvlrUVse/BzuwBTJ6UOv
	KIbdQqJYnFfmbpSo1SsVF/EhtzhDOAnefRuheQ4HT1hDwBXFgEBkMGRxkxJXsyN3
	Ng9kDRsyH5GrQZcFHmeFzsrysZK8AteVqcBDWFK7hW9z5wCsQsLNV8jWwCmEvXuD
	1zMXLQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8uxxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:40:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498eCr2000325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:40:12 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:40:07 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:09:01 +0530
Subject: [PATCH v5 15/26] media: iris: Skip flush on first sequence change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-15-59b4ff7d331c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=1567;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=rxaJyxV+oOHrMSEIUfapGZcvhgJSlzdYeJUgtN4Ktuk=;
 b=iNsylIggO/YBf/Hh2WgjMiXJ+5x36fpPex+oFWxhJkDdIjHglHHqXCyj5vrWSJbXkqQ95Z9hf
 gEuu+9i29QyDytIOt+QeUtmXHpzrJL3RB24KQWbRjP08PyyYpYgjVrF
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JTc803qtLkgtwPBO5MOn_27NuBUQuYId
X-Proofpoint-ORIG-GUID: JTc803qtLkgtwPBO5MOn_27NuBUQuYId
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX8w17LFkgBOKb
 L5+WndLzMNBcozTn7FPw2dR1Mp9IZH01UzjWrK6CidASy4FQ02AcI9JV1UUspe2dhcKYfFAORCt
 yxb0ZLvS6tfvMgvZsrtLZrd3lpVWt9PQFupwC/d2K49HgHzUe77akG3EuOZUaNxOrozf7Msps/Z
 lDRA3P7s/X2OxoxlskgwL4qdCXwA/Z3vx99HQ9yv2EgdvnXad/Wj0w/WgB8MgonLF6HYeRaZCQX
 s9POHB2jG5pgnyb8BKcuth9iQh59SNDamLBS7cQZfaM9ZTw96IyBFClxOPA2PLJfioNKwtrUyCE
 ZijJRxdLFu/rIK8P7401N7KhWJgE9JWJO9anNM9gSZNVk4+WqtFC2bM+518fCed3juiwnr66QyJ
 nAHkDlvVSs7lGzE7pa4LrCTxpvE/eGbp5X/nfyMSSuRErCkk20Z4uSCrwLaXkCrxXEbqI2OK
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681dbf6d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=PmrpfJqh8gS3DHDx6swA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=882 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090083

Add a condition to skip the flush operation during the first sequence
change event. At this point, the capture queue is not streaming, making
the flush unnecessary.

Cc: stable@vger.kernel.org
Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 271e1446922311e2be6b7b2f9b68e26fa14ead9c..aaad32a70b9ecba94b4c3bfadd8687db7d22a5b4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -200,7 +200,7 @@ static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
 
 	iris_hfi_gen1_read_changed_params(inst, pkt);
 
-	if (inst->state != IRIS_INST_ERROR) {
+	if (inst->state != IRIS_INST_ERROR && !(inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)) {
 		reinit_completion(&inst->flush_completion);
 
 		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);

-- 
2.34.1


