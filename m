Return-Path: <linux-media+bounces-43773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB3EBBD6B5
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 11:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BB761892FFD
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 09:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F0E26657D;
	Mon,  6 Oct 2025 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BNxivvhF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0B23FC7;
	Mon,  6 Oct 2025 09:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759742322; cv=none; b=WzT1F5umM3LczbGeey8qGyExTEFp9QpMXw3xFSxpN3UGpPg6NlSPqPmwZRngDgpO68pAYwcBl2DKT1MJt5/wIf4xopEiNil1ujiPzDAndDPD1Og1VgBIdHTg09c4iT30jEkcPN+EEcU+JdqkMWz018B9A5A+IN8CH91pXZVN/wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759742322; c=relaxed/simple;
	bh=jXeM/u0/nnZafGW4O+70km7d+QdoV5xSOImlb1WmmiA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eITaTQsAJZhRzECqEWO9ik/oFgSg26LZlkzZyVxeJSJupXO/HJ6alT4P2QuSb3CMeXU/tALRkCWrp2GCnfzEhyViu+D4PB2Z+2pWrov/QENiw++E06Sz3rpcIg9cyklYetnLmrMQAa0QQYqAZOWi3J256KnjCkOZlIIscmGVESM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BNxivvhF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5961V50c012073;
	Mon, 6 Oct 2025 09:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UIcBLPogFPr84n3P+mfbWNgH/jB3ny8AyGp
	DWMJ9E4g=; b=BNxivvhFHx+0NIHFIZNkjzuRIJb3BIfhn0AJ6Qd//9a4EMfSt5i
	6x2VngAM2FixRugqtmvkTqPfSz+MwwE54na1g6dzI2EHNfGsP+91VOTiOK8QOn8I
	uc76cnETnL1qRp0zO7aym2aLaoBh8dpNfBltV7XGKZIA3GkoxyQm42cFOvW8NIxl
	98zu6cj3FaUi18ARUEguvzV0pk5+AJ+wF1d71U99s37JQexr8dPD2v5RxWHNue3K
	s/PobUQ5HKih5ng2w8rRvsgfpFlYUJW8yOE54SJGvMJWR3MCKpxtyfbUSCa3wgBO
	02VZ48/Q7wKqRWKZFgsWsReweWWyaRzvnPw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn3p16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 09:18:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5969INFc028688;
	Mon, 6 Oct 2025 09:18:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49jvnm1h0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 09:18:23 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5969IN4m028681;
	Mon, 6 Oct 2025 09:18:23 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-bvisredd-hyd.qualcomm.com [10.147.240.98])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5969INLn028679
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 09:18:23 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4559132)
	id 2808C570; Mon,  6 Oct 2025 14:48:22 +0530 (+0530)
From: Vishnu Reddy <quic_bvisredd@quicinc.com>
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        hverkuil@kernel.org, stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>,
        stable@vger.kernel.org
Subject: [PATCH] media: iris: Fix ffmpeg corrupted frame error
Date: Mon,  6 Oct 2025 14:48:19 +0530
Message-Id: <20251006091819.2725617-1-quic_bvisredd@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX6ZvXHcGvdiKS
 8Htf+ElNLrR5niwhBWl/JPydGYnk7QZV8z2qPqqUAgz84WyJja0pLHzgIOB74FxJxiCE/5fpdie
 7Y1VlMNVXg9L3wigegMJzEBLbfTdI4LZ2KJI1OWOtNyZMuX4pvldVciOntIhw3HNZeOBsnLsPmE
 dP6sRAUC32cDH2BbNeUeEkhLZv1KyBrvXEywvOSeN85m4f09hsqtP1HbRZqTHJ2YlPDuGFE9Ngl
 Exue3GG0HzRjCvcdxY515926pTpCqH80nw96lBQKaS/7+M8RrE5OpYtRDR4gr8gdCgOGkPr8rq4
 pQuFgyxUkGokk+9en1azeP+eeU9qQSvhGFO6FLq0RY4wzB5zPFSYj7Hrk32XUOzD33uyxtgZZ+h
 2Ue9g4ebjZWwpDFdVWtLBUih8zZn8A==
X-Proofpoint-GUID: lKA8AbMXEIRdwqMl9WmwXxbLHs3Ru3qB
X-Proofpoint-ORIG-GUID: lKA8AbMXEIRdwqMl9WmwXxbLHs3Ru3qB
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e38965 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=pO0-sYB_UKqAWa9ZsqIA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

When the ffmpeg decoder is running, the driver receives the
V4L2_BUF_FLAG_KEYFRAME flag in the input buffer. The driver then forwards
this flag information to the firmware. The firmware, in turn, copies the
input buffer flags directly into the output buffer flags. Upon receiving
the output buffer from the firmware, the driver observes that the buffer
contains the HFI_BUFFERFLAG_DATACORRUPT flag. The root cause is that both
V4L2_BUF_FLAG_KEYFRAME and HFI_BUFFERFLAG_DATACORRUPT are the same value.
As a result, the driver incorrectly interprets the output frame as
corrupted, even though the frame is actually valid. This misinterpretation
causes the driver to report an error and skip good frames, leading to
missing frames in the final video output and triggering ffmpeg's "corrupt
decoded frame" error.

To resolve this issue, the input buffer flags should not be sent to the
firmware during decoding, since the firmware does not require this
information.

Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index e1788c266bb1..4de03f31eaf3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -282,7 +282,7 @@ static int iris_hfi_gen1_queue_input_buffer(struct iris_inst *inst, struct iris_
 		com_ip_pkt.shdr.session_id = inst->session_id;
 		com_ip_pkt.time_stamp_hi = upper_32_bits(buf->timestamp);
 		com_ip_pkt.time_stamp_lo = lower_32_bits(buf->timestamp);
-		com_ip_pkt.flags = buf->flags;
+		com_ip_pkt.flags = 0;
 		com_ip_pkt.mark_target = 0;
 		com_ip_pkt.mark_data = 0;
 		com_ip_pkt.offset = buf->data_offset;
-- 
2.34.1


