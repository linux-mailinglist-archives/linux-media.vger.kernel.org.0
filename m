Return-Path: <linux-media+bounces-36775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E821BAF8A36
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18B3D540527
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 07:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29776288C2E;
	Fri,  4 Jul 2025 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lZXbJbgW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17829288C8F;
	Fri,  4 Jul 2025 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615645; cv=none; b=kktwMOLsP7gnP0gzHH4XZyY0fzx+NkyLOM+OpYiZavr80Hi9/1Nvj4SxqT7YQHm37hMr95SbpmPchMOYepsdo3mzROcH0e2RZLv5AvyUWEieZ+wJzLBIpKUuoEJtT/WJha/xoEHpOWouvskIgg21XIb6v2mszdXj4ap1BNFV640=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615645; c=relaxed/simple;
	bh=9sgrDBDt6l/8nblPznn01M3b9Hq+ziVBP/+mB5n2VUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=i6VwTKiD1pEUy9UrSW8A/IOaX5eMTr2IVa9azxDShFbY5atgMF8/zAZzXGu9JZRnT3zSXoIrHyyVBVGhC8RCPufuLGAyDI3EMCeE9L/4U6GIZ/+/CuBzeDQ6Q39oVaXzCDEu6HJgPDMpfFxurSOWsMnVZvBgOefcQmyVjIm4A4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lZXbJbgW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563JPJc6029542;
	Fri, 4 Jul 2025 07:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZ9nWVQW0Uu8adQyey2qqf18o2DXaVid4arZvYDvmPc=; b=lZXbJbgWfLv6KgYH
	kUpQd6lRdFpBM5zK+goIBG0mQXEeUFIe20StIskSaf4Shw4bbre4INID+CjumCNB
	YJajbpncic1+WP2bsOlz35djKHisADQCfyladqZ+sX/WFK3OWHF3e3ZEmAxuXyRE
	HMdkdjVo8d51Kg33uLIA8JU6J+4iAgM0YBldiucZesOM1+1VjPkDz3DMAYilFzwF
	IIPpZCtxT2Zv4Ushe+nQifIvFkuBTpGuYeQHDSe7uaWieBbG4DfsU70QeMSE3KfC
	hFAi9Y+V2Q8hGvVm76ICpk2kpPiA4eaSg1Yk3Kwg7X98gwVTcXqO7NOq1R2g2tcw
	5QvvdQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s4bqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:53:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647rw4G001317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:53:58 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:53:53 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:10 +0530
Subject: [PATCH 10/25] media: iris: Send dummy buffer address for all
 codecs during drain
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-10-b6ce24e273cf@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=1360;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=9sgrDBDt6l/8nblPznn01M3b9Hq+ziVBP/+mB5n2VUI=;
 b=8gdEqX3ioLbGIwAo0ImHMaulSmHJUsHiDJa11+REZswR7rQEt3YCd3hSomC32+fjsknaYS6hk
 15kySHUSWh7B9HIWvwnBf78npElmrn+u1+f41u+PvUZ+il5lCyMIqII
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=68678897 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=9ca8n8zwjEs3-HHftV8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX2XEYUgSthNa3
 f0HW2y49pttzFW2RkH8ZjmLpB5s2IdDvdp8v9LOAzmKHPpwtitC67+rKHd9wJK13ctSQNAoSIEX
 RINYpBcyYlLUMx4r2m/bluwxhZR140WOJqfEHQGg7KyXQ/UECjixTZVoLPX/bSuWc/EmXGq0d/p
 YdmaumEczfTYQwLBO6wJe2uO/GJSQCu/PAMvVcqOTA8BwH4poUMKiAJUh943qT6mVWatQ/Te8qG
 znRHINsYiBeNMCHL/QWUBzZ91/srxfxvHhDLKvMIXe+tfx1mNPtYRshCmRb6jGrLKLcrfQHSTUW
 UlUi910RNKlQqzYycB7C3JQxW2feFRYGilbXo3aF8MYJmvKkO0OtX124bw2F//v3gMPEn1OcV1Q
 1fC2Y6rVvfKl752722ugpCDiltjCThS/qCnakvzmhq4bUwgC2UaBJdLiVd8hUegncq02+ZTa
X-Proofpoint-GUID: ZcyaU_NlAGAQ185LjZaP4i5b5AFTX_LM
X-Proofpoint-ORIG-GUID: ZcyaU_NlAGAQ185LjZaP4i5b5AFTX_LM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040060

Firmware can handle a dummy address for buffers with the EOS flag. To
ensure consistent behavior across all codecs, update the drain
command to always send a dummy buffer address.

This makes the drain handling uniform and avoids any codec specific
assumptions.

Fixes: 478c4478610d ("media: iris: Add codec specific check for VP9 decoder drain handling")
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


