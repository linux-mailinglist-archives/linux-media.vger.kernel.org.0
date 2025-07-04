Return-Path: <linux-media+bounces-36773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918F7AF8B4D
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 466893AD17F
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CBE288C1E;
	Fri,  4 Jul 2025 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="flGhEYgv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E64285CBD;
	Fri,  4 Jul 2025 07:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615641; cv=none; b=RUE45v+E6J8+SJNxmJh5hLIH1epQl9ZsMYYmUS1C3XN+CJxqS4MmESc45UrbnIMxjBXWlyjPeGH2j314P/eUQy41p29SmSTs1DdRcoSsFjzjkd6lJUlcSHof8AgTXzi5JCSbyYbTFDXLQATw1nhSgGYfsoYKJo2LnKzPAdEryLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615641; c=relaxed/simple;
	bh=nXe1rAWwt0e1F6ohnI+QMUnmDrfMRCDDVmIn0JOu1dM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BlPs4bhy7iMfDDo4lnaYVUlciTKpaO35ghtLGqsCFIjk77An0B0F9ILLj9uWs/H8OrJkfqiTnP0MOa+coXGVw6kUV3pu1ayD+DIHdlVZVXjfWrR8xvru37xWY5uaQ3hfzIq4mv2FimiA7yXHRakjVp9Ycz3hmyVkxDWlr8//S7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=flGhEYgv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56472Plv032116;
	Fri, 4 Jul 2025 07:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BpenVzgD1MUrMTGT+k2H48hWJXx+AEI8C5ji57G8lk=; b=flGhEYgvmljqy7QU
	CAx6V1HugQcsfKVz+QAQy6ICS4oSwn56In4qqVWTE39tQxfJiaOHY3j+h1+IcN6v
	fChtrj+A34VhyXKfHxDsQfN/uQ6lpe4rt6lG/be2Z2jR9YUB4MasyA/DOUtZshTM
	gSpTI7IOEW8yBsR0VyAF6Z5WHDeNDq31cmsPGRpP6JB3rHE4c7u1yw1o2lqdMi7p
	XW9hzaczGY8u+hZ3OCaZwbYwIuqAdFCUgw0YrG6VCkE486jcC4E+1+zyXFE/a4Mz
	DRol7oU9U1D4RMxBCROim7z2NvmihhDCTTKBBgW5WzOq5T8TG/UWpcDmyLfZISPj
	hoOUag==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kka16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:53:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647rrYK017981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:53:53 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:53:50 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:09 +0530
Subject: [PATCH 09/25] media: iris: Allow stop on firmware only if start
 was issued.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-9-b6ce24e273cf@quicinc.com>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=1668;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=nXe1rAWwt0e1F6ohnI+QMUnmDrfMRCDDVmIn0JOu1dM=;
 b=4G9PDDDwAR8a02ZWjfDkk7Sp7Eqiwov3JfHErbnu7li9ksXXEd6h6dKYRP1oKYHBWKfvTJAS9
 LLu4AmNHxiGDvOZ00RT4LGJ/OoDD/HbnLf58sFuw6Scb9MRMUeVXfTB
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68678892 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=rsWgEMF2Pf62jCDWMwkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfXyH4sOy5olELH
 hOa9w/pE7VwtFtEhSG24h/ADjFMNx3wekrU0PTm3a8lSbuoXIRj6xYxMg0/FM3vxd29Q1eYJROl
 HnKS4JuGt2CrVR7AH5uFluza3F6UyNLgrf53Fps4HNT7Y6KkNwWHbfsPps0tPe9eBtq3WVEjAOy
 PiDJunatWb0Zgwr0Q1VptiG4G63IRKHBlubrroOHkRncXqs3QgToGPkqfxGLB8RAXOqCfk4J42t
 dF0Bj3LflY0WXJ8ZHU9ipPzbUx75la3mGnJ5gjQFpo3Q/gHbODkWyPJmuT79j9llOoHKg8mJiX0
 YLa9LQ1TKoV5yZRr3aC93mx+0vm72ZnUT/KZf0vmTF7/P+cOLDAna6Hg4VrQsj0zszSOHcOcjmN
 h+4uloi4iI4Jm5KsiSfl1JCb4EyLJ0dlDBQ0DJ7wCe3ZFINCmcdu9UwAygN+P0n+Ka9KkcAg
X-Proofpoint-ORIG-GUID: vLqv6kExfJeBVv4zlZZayORrMyx5uD2r
X-Proofpoint-GUID: vLqv6kExfJeBVv4zlZZayORrMyx5uD2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=916 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040060

For HFI Gen1, the instances substate is changed to LOAD_RESOURCES only
when a START command is issues to the firmware. If STOP is called
without a prior START, the firmware may reject the command and throw
some erros.
Handle this by adding a substate check before issuing STOP command to
the firmware.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 5fc30d54af4dc34616cfd08813940aa0b7044a20..5f1748ab80f88393215fc2d82c5c6b4af1266090 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -184,11 +184,12 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 	u32 flush_type = 0;
 	int ret = 0;
 
-	if ((V4L2_TYPE_IS_OUTPUT(plane) &&
-	     inst->state == IRIS_INST_INPUT_STREAMING) ||
+	if (((V4L2_TYPE_IS_OUTPUT(plane) &&
+	      inst->state == IRIS_INST_INPUT_STREAMING) ||
 	    (V4L2_TYPE_IS_CAPTURE(plane) &&
 	     inst->state == IRIS_INST_OUTPUT_STREAMING) ||
-	    inst->state == IRIS_INST_ERROR) {
+	    inst->state == IRIS_INST_ERROR) &&
+		inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES) {
 		reinit_completion(&inst->completion);
 		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
 		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);

-- 
2.34.1


