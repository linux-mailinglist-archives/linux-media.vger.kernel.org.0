Return-Path: <linux-media+bounces-39766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9B2B245C9
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8E2A1BC4D6F
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0FC2FABFB;
	Wed, 13 Aug 2025 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nt6/cnAu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7CD2FA0EC;
	Wed, 13 Aug 2025 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077943; cv=none; b=PThbGNWlxOlmw8CxGjBwEvNUqdEf9EHKxwIWuRzZtOmfuzSYn2FbCKKM3/Q7BxcNIjDlbMYDsNgME5qx8TfpK81dg5oyAMocz9qjBqJuBdnVcA8BJ0QimB72BoicPFmyOt7ZWk1Iex8Gm46y1qBYyOq/5adlYLVQ12roTb5C5n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077943; c=relaxed/simple;
	bh=ow06m3D5d3htUsZwBov/Kst86Ql86Ze1rrKCk5GYNzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YeXQCS7yjGuJgJ9r95fQ0/GwnHjMT5BT9ypPTT2pJC0u4RLMT9OWriQcDBtEqOWZkKZuTe11ui3ZUCph6gdV9OyoiLBLzsjf+7JKCB86V1+17gBA3zwD2mFwzUSc/6KySzEn+NhphxR0lVdxpquTrKOrI3/UWkX2Cut/hvNbLTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nt6/cnAu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mIlx015675;
	Wed, 13 Aug 2025 09:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqNeAcWLcjnDaKwcttN2QVGUyj/yT7SB+NqimHylzwQ=; b=Nt6/cnAu0OSV8tSW
	SfGEqaUYvVAxNCtkmrkZtsVgPXxjW9pCvvpap/B0c0XUWytge9RcSGSeY2E8+vc5
	qJSIaNXhfYgY+90vTFOrNOawcOtR6R3++/JgLD/wgYRP3X8kOuH3WnIEsqLydEiM
	z7MCfpZblXVUpglRTe74fmEsEyMjMBYWeUQ4JSNxlhdV0oc6IT93ajhb2gmgjnmQ
	nrITycd7KQsrRjq/JoCJD0lzOuA+L+rooNPlUN68u67DTABxZ4aVF6Q74P9eEg+C
	tQ5nY4tUgSQ4uavFseSezVzoVdBpDmNYg04L6/EP/yCBcv5ifusdY3oDcyjInn++
	y78/zA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbefke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9cuZk028477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:56 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:38:52 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:07:59 +0530
Subject: [PATCH v2 09/24] media: iris: Send dummy buffer address for all
 codecs during drain
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-9-c725ff673078@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
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
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=1483;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=ow06m3D5d3htUsZwBov/Kst86Ql86Ze1rrKCk5GYNzk=;
 b=P68dkySm1ryKSGM9Xbx8S5GIwZMMZ/q4d/plllpHp0Rw5pkKint3PAC0nFcvAsiDAwXBjKoJe
 wqOOEVj0C4dDq5rmFI0Sf3oHuxXMxrJZGN5ENg0qwbEY9Cla2nf7o22
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689c5d31 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=9ca8n8zwjEs3-HHftV8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfXztcQthA0pF8p
 rRELr9OvT5QnXsWO/nbmDc02AnXeF5HUGkTjLL60VGMRDj/R8SJ1/stWHPDRzq09y/R+iCBMacQ
 DsBVyC6PCAOICbaWguAqIgXj+exie2gTsK8//16FTAyuWDLU1UG1obbkllZ7R5gveJL0B9N1iJT
 Yjt4Lc5kCXhFgW0T0Q803Dna3mwtJM3E8OCFUg0xJbLNmkR6F5KgUChyub1Dp086L9BCvf/2JGg
 5WAspZjGd+YIqm6YyrInVTSunlZ85SHFsquLIHz5fCJ6Lp1kOK+nhD5XsT0YIenw3t69/AWxfrF
 DJ+aR2KxHJAGK5H0doXS4ddGYtrn0u/a1Rc7ArGGgmy03wdG8yzWXVdRQ/XuDbxuvCY5gAhs6AG
 Fh+r6bZq
X-Proofpoint-ORIG-GUID: 02jNoQvGhVNY5QdjV5Ncg7b3u4d42vg2
X-Proofpoint-GUID: 02jNoQvGhVNY5QdjV5Ncg7b3u4d42vg2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

Firmware can handle a dummy address for buffers with the EOS flag. To
ensure consistent behavior across all codecs, update the drain
command to always send a dummy buffer address.

This makes the drain handling uniform and avoids any codec specific
assumptions.

Fixes: 478c4478610d ("media: iris: Add codec specific check for VP9 decoder drain handling")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 5f1748ab80f88393215fc2d82c5c6b4af1266090..5097680ee14ebba3a126213c0584161627ca47d7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -402,8 +402,7 @@ static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
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


