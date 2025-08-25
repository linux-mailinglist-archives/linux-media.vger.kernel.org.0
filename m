Return-Path: <linux-media+bounces-40885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 881ECB33735
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B0012023FC
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB92129B8F5;
	Mon, 25 Aug 2025 07:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iPHZhH8i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F758298987;
	Mon, 25 Aug 2025 07:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105308; cv=none; b=EuYL1hS0yFQZa4xHer/6o7JyR0aMHPCK0eSyTRcNZe1oSWzKLm3t++n6KnbF8J7QkkJSCZ8XLKaC7c/YUiOSr544+J6hBBsOMyt4i4BzPK09HbCITAsManA+mFTLNV13ApFcnZZ3Og8qvMIVjnYC/OvUaUQyQoFbRi5sKhEF2lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105308; c=relaxed/simple;
	bh=Cnu7umKytBXoHwshQTjyOGiWx54FTvl2POEgCmA0MYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iJhRJxn+00jhwS974qm4dQnbUZCPxqFxArkXA8XK6SHho9x4xMZqqNRYSD8X7Iq8cpG4f2/YKseNLGPcbjAACOku+c4WZdHGJHtuo4Lc9iCmFYZcmQuWpsKqWIZ7kB+DTsiYyutqYJJoGsg5TQJdedIUlnBf11bGZ4CxkeJLcmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iPHZhH8i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OKxvQQ000483;
	Mon, 25 Aug 2025 07:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MaWY9iyqMhONAmVFhyhrfhbg8gZ6yKOmueJAlm0UvK4=; b=iPHZhH8iUDzp41zk
	WlJHTEdCFG5FPkCNehxXYqdd9mUf7JERgABRDyuDtkt2LdyPXNF7sQ4X6Nbmeg8v
	qTGHUYK9+Y8cJxItQDyjJN1pjvD/vWVuLmqhHn1n/T6FDLDJkB9oKIPlfT+glxAx
	JYcu3RebFV2QYA9y4Ykd5WUxruujbg0stbbYY28Ao4dQOpHybCbk2FvGJDOomEw9
	Bbx5Kz413EFo/Huh5WvTVrasIsr4L/M2kNxT9rQMI+iKoAw5MeYTm1xGQdewaHNx
	btk5qZR1WfLZjsUR+DbaDitMvx8/PMKkuqfnAvV1RFGtK9c6qnrtCjS4spZi5qxe
	N+sNdw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc40ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P71N56018301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:23 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:01:19 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:34 +0530
Subject: [PATCH v4 10/26] media: iris: Send dummy buffer address for all
 codecs during drain
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-10-84aa2bc0a46b@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=1685;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Cnu7umKytBXoHwshQTjyOGiWx54FTvl2POEgCmA0MYI=;
 b=tfUOleF6i7/6o9bH22jS4s9PsZyh97vg209ptuSih7CzOCKqy44irp2f3IDXUJVVCjNywRriF
 7YcWK6lUih7D8m6H1HFx/nDRBSe0C78cN9UtiO+aQJJPDLKCFUNobKF
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX5SLkP2Ox9++E
 43rfy6C3KB2Xv1fsYgYlmQcPeJm6E69FdjBvcPzV96ZHNTsXlkBo3NVMh75p5FXur0eFV7sTUsK
 lur8cd+SQLmZClAn0IsAyC5IIQyUuheqv2kdjn1eQUkY4gnSDaLOcBo9ac2pObQDrmZq4O50teg
 12O1nRjB1XDFLitSch0vAXQtkclsjrfcKKz7jdys+1HCpcDqWjCIUUpCI/Zvhbez12R0YsnSHaO
 QStAoRLHRR66TN/demmrtO+MCDr7tYFPyFsvAZR3aylIQsHy+e4z7q7TgXZZYAWyJQ7ZJyEJnoQ
 erBajqelZXr3WYsorUYQvxGHAI+LG4LJWat9PEbwqpph/ykoRSLjKo9TikIs/WnoyQL4c66wcCc
 SNrsqBvH
X-Proofpoint-ORIG-GUID: dbmkXjYOMFTrXajkZZXTzk1fUtDFIqyO
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac0a44 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=9ca8n8zwjEs3-HHftV8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dbmkXjYOMFTrXajkZZXTzk1fUtDFIqyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032

Firmware can handle a dummy address for buffers with the EOS flag. To
ensure consistent behavior across all codecs, update the drain
command to always send a dummy buffer address.

This makes the drain handling uniform and avoids any codec specific
assumptions.

Fixes: 478c4478610d ("media: iris: Add codec specific check for VP9 decoder drain handling")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
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


