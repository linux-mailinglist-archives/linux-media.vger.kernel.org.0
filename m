Return-Path: <linux-media+bounces-40882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AD4B33723
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DCAE189EF35
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9890528C035;
	Mon, 25 Aug 2025 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VvhTjB7/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7A418C31;
	Mon, 25 Aug 2025 07:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105302; cv=none; b=lMzxydWXett2dpb5fTWu5/6n0wB+5Z+pHxwGYjgTCN+nAAWE4NUkSZnoe6ua5K2L7ocWaCHImAlXzkWVoH2FUQEC0I/u9CTZ4tkatGZW+DSFLUz27vma+2XqMCjhtoIUJ6TD+MwwZPhJXCIVl+0fQTqx6XBBKJ5FaUzBVoQaqpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105302; c=relaxed/simple;
	bh=hzF3OAntQFHfarfsOELgP2CZziChyfn8qdvNP/9xvr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hYm6K6l+jIrSIyrSO9KWJ+e6J6bsV6svwcSL1G0F7KQxAhopowIB6Ti2SxhgRQpLxFHrxv/TISc96nClIHWi7ZoysohSVHyIlItUr6xAxmAKGqYu2yvx2zrhPUetkO46OqOmg5fhddvzumVjW62aZBPoxMT6ui7fej2xGKqGrvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VvhTjB7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OM2Kmp021722;
	Mon, 25 Aug 2025 07:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GL1mwpTt0OldpHG1efv6hf1m2nXH3tMwnt2ibAfVRO8=; b=VvhTjB7/kZZ2xZPI
	p2XYfCNAnySl6mR9AFztq6mzcebul2wquVCiQBKH+na+dbqjdCFze1UnXpn3NioP
	iNAiFe/85gwQaYZKG5Hq4UHpauHL4WfBrkHhMi6uNzDMv63dfmj2PiK3ig0K2NKi
	NAo2/zF2POhTffmHZMw9pFyu9ReZE2PYRPCbjnIDh1xjagGPnAH8FddLE5k7UId8
	eB1f1F5s5rnY7zgQcPZ7j12Yu/8WloGSh3PzZ7OOhiaRGvgCa59q+Mc4yzwg//hh
	3NgW75l7Tph0e5p0iByqn4K5v/tdK9602X5L40Y+wwi2BG6J1LaC448EQdFCj9Rs
	ncr6Kg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615c1w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P71JP3008939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:19 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:01:15 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:33 +0530
Subject: [PATCH v4 09/26] media: iris: Allow stop on firmware only if start
 was issued.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-9-84aa2bc0a46b@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=1643;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=hzF3OAntQFHfarfsOELgP2CZziChyfn8qdvNP/9xvr8=;
 b=i5ftHgiB5y6qkw4CiahU9VCIyDIev2zUqrbqRwz2Z2vvJlxvX/PMrqi9X8XYW79Zy2BvVsLEd
 NwUyz8zoJX1D/steUOiySEkxUo2Q1MiDl3iaUUa1ONu5U/pUuaxufYq
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX1q9bZQP7I9B9
 Ke5q4U7ruRcS3Wkd4qtwFYVNwNDlaLR0PPRv+WSdIAAkQJGVWMl6VqsIn+W5j529G3ABlkuwH/z
 c18ccRyqIlNT5Voc4yJBDAh9eo6n89f6HFDzkQW8oSu/ZuVYt7RUSviAUp1B0rFFNNIbag5Vo5p
 FJoSAw17m80WS2Wx4Rq2laU8z3ScE910NwKLWJYkXS9KJP4E95tOx5zugoyfzdLomEltiO9nc+1
 WuBOpi+2SKfRKNB8OTcTsduBITxYNNJIoFhCFDPzGth1ZzmuwMn+O28Xq34r73v1+zowsnup0Em
 d1CpsmYPN4Zz5OryUPgQz35WsRImF8p+gzujluLvIL327/tVC/ziU9te0vReV8sYfyPy+uJvrSY
 gV48L/FK
X-Proofpoint-GUID: _UrEgBB1ZCjwvlBRmkhp7U29yAPYqCfC
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ac0a40 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=qy3FSly7IIgnPcZaVksA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _UrEgBB1ZCjwvlBRmkhp7U29yAPYqCfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

For HFI Gen1, the instances substate is changed to LOAD_RESOURCES only
when a START command is issues to the firmware. If STOP is called
without a prior START, the firmware may reject the command and throw
some erros.
Handle this by adding a substate check before issuing STOP command to
the firmware.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 3e41c8cb620ebe51636a4cc5202909bb043ed4ab..a3461ccf170ab1abb3a9ce70c4d93415773b2772 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -202,7 +202,7 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 			inst->flush_responses_pending++;
 			ret = iris_wait_for_session_response(inst, true);
 		}
-	} else {
+	} else if (inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES) {
 		reinit_completion(&inst->completion);
 		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
 		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);

-- 
2.34.1


