Return-Path: <linux-media+bounces-40364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5E5B2D7C1
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3ABF725E5B
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD322E7182;
	Wed, 20 Aug 2025 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NkXtAuPq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21812E62AB;
	Wed, 20 Aug 2025 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680919; cv=none; b=jQ4RofzCh9a7L6uB+jkFzC/YTgVwBozBchCwPuVxfJbhWJg1E5qJQfbt3T3TDfg2cVqHe3hdholTwgFcoYXCbtj6BaRi5YPE405NzkRG54jdFlIyw/S1ycKT3E6FdmW4YWC9qhiMYPVEDj3JiSHzjuAyCIJDY7kpkkDX2G751uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680919; c=relaxed/simple;
	bh=q8RNu0HsA967d9Ym2Ii/3CflyF38ZhQ5GWZlB8jV90c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bZo+qZ0dkCjCqPsmrQBJXMbJi4yLJp9ZO50Szx0WIpGm6YOrTyL0F0lcJQLeAMQvh+gkDQi+iEi/DFixTSav1o/7NEO4luJodulHEFneis+Do1IQRzmTJPsdr0BFhrarVlrAuwQzd3ck24cqHB3qw5IVj1/gRgP3UPNBqgjhp9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NkXtAuPq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1ocw7006132;
	Wed, 20 Aug 2025 09:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yg6qGp5dMk8IdgsB3BRI30xBjas/Yst5+y0tOL5n2cE=; b=NkXtAuPqZFFJak0n
	aV5J2SzKw5lSBn+ujKxrRSyZoYiAWtCHWU3ZjNBYrJFdmY0GmqkigSv8KtVEx3wa
	bIAgIH0OFiA+fNZ6iCs1iIyl0G1L0tT6AMtAlxKxFh2FPtAVMOd8bz/HJMinHgoG
	NhefmNfUz2UcD9P897LQeQkUEWorwBzQpRkF3zKsrRghCg5QPcH3C58akiXHDVxx
	LSLAEzcQsC7UFuMYeAOQmfYoqq/tfFRcY8SXykhnN3H8FLqCTD1SwY28tNrMDLCi
	yw5KrR0sJZH1+XUFem2eD6+DmTyeWt6a7ULs+BASK7DGoArGE3fSD1HPzUerR0i1
	h4aFWw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52913y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K98U90005135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:30 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:26 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:48 +0530
Subject: [PATCH v3 10/26] media: iris: Send dummy buffer address for all
 codecs during drain
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-10-80ab0ba58b3d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=1543;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=q8RNu0HsA967d9Ym2Ii/3CflyF38ZhQ5GWZlB8jV90c=;
 b=TUq6PKQtrYxxVGWm5+P0kLey9FePvL+oa+4vsM1akyue8pS1qKi4wnVejw4AU8+o9ZKweCOI4
 ObSYp/zHF8VAlKHn7sM+FL7bOUcDFS5NTVfQ13ffWhoXASH7616dE3e
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a5908f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=9ca8n8zwjEs3-HHftV8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: WPYB-pLPs-sfTbhvevqj5DFKO0_qt5dR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+AINQX/FRWCD
 6MRF55i+CK6bnm9g4LxHd8Hn7njnVajh6kiiW6vOGtHMDcB98Grn0l9OFMm7EMw7wliqJ2Vzc/i
 SwmN+2iJAwFghSs5NLKCqqA79f23j5dCM3+lzUOJq5SKdCbJwYVgN6HFtBRUB3oVhI91jRW1owH
 i6H7v3qenQAZLdCpWdZolzde6i+dfHmTS3N6FXwJRiIEsNVHCSlern5fM3drVzpvO5dp9avfLq4
 AwBhDfLV6KRTwXBahJQPvVSh/emH4QwvmPIkzyOztcF/fbrqkWhrOSlGLK0ZqNUpPYA76pdraoU
 MEZGM5wUbZTnGU0y2hKArGYofgs8w3vxEjff5heiiQa8FMvW2AlwoEZmDvwry/6ZWzJuxrbNP9O
 Lw5c1QU22ustQickS7ppCMOcPLA3RA==
X-Proofpoint-GUID: WPYB-pLPs-sfTbhvevqj5DFKO0_qt5dR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

Firmware can handle a dummy address for buffers with the EOS flag. To
ensure consistent behavior across all codecs, update the drain
command to always send a dummy buffer address.

This makes the drain handling uniform and avoids any codec specific
assumptions.

Fixes: 478c4478610d ("media: iris: Add codec specific check for VP9 decoder drain handling")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index a3461ccf170ab1abb3a9ce70c4d93415773b2772..3f4f93b779ced5d2c7f646006bad936658be1b24 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -397,8 +397,7 @@ static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
 	ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
 	ip_pkt.shdr.session_id = inst->session_id;
 	ip_pkt.flags = HFI_BUFFERFLAG_EOS;
-	if (inst->codec == V4L2_PIX_FMT_VP9)
-		ip_pkt.packet_buffer = 0xdeadb000;
+	ip_pkt.packet_buffer = 0xdeadb000;
 
 	return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
 }

-- 
2.34.1


