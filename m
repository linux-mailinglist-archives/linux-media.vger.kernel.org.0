Return-Path: <linux-media+bounces-27106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39825A4732B
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 03:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EA3A3B0457
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 02:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DED117A30F;
	Thu, 27 Feb 2025 02:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P8iNTptN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0759335C7;
	Thu, 27 Feb 2025 02:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740624263; cv=none; b=AdSWsSY1Fdk5YVXL9u88uS2sH1ylS1TyxdxpwexesNYb7k2qfFO59hA1bE3iQhR4nrKaGG3YaFv0SgHs8kqECh9kMeHb8irfAPr5p9D0GUBxUb7djIrzTHWXVxMMg6FoyJznjLSOxR7QXF4GpjpikSbG3TyQNs4uAUn9F3Y0sh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740624263; c=relaxed/simple;
	bh=zMhIA38U6KKpcrXTJD8P/zuZ95lzjvrx09BOjo3hyTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=rS51oGpfGL4BalbA9PDRnVqzVYBFNTadoWvyk42sUhrlMaadN2v8hRPWKwwGN7xRiEMo9Av7EnN4Ahsqz8Zaf07uo1lAW+TGCQVIN+KIyYAGJuviniEimjAVEYYVy4IPDPXPJhkgH4NDzyn/x8cb0+AHEWW1V0Pap2YPGHrzfA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P8iNTptN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QJoItb021539;
	Thu, 27 Feb 2025 02:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zFNp9WBQrr19XP+ditdOWb
	D5YmcXDRqAVW9tWJ1Nz1o=; b=P8iNTptNvWdxV67ZTPyPgPskWeh6O2QNzp3pz1
	kewzqTr/tcThvnqcxkFLEt19ScNK1i4BaQ3toxfg83DrZ776gl2If2usE6KHB8er
	7h6n/nwGzqUPN/kMR9Sc+CpDaxtwHoytQ3LQc3jKLJjVO4ie2vp4zSW64jc7UZCn
	pQDGAh4Mo4pqq5v/+cMvoKzpVJK2Pxs14CcfUFZMMqWoNyKe/qU6irho0dCnHj3l
	LQvDB9rIZOunKrp9rtOyR/jEYxtnikb9s5J9B7iRnHtzHE2TG58OXAytHr/A0l2w
	4kqC/APkVsnDFx7fpuDIb65M6BAVGaDz0Bc9LV5G6tA6n63Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prkm15f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 02:44:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R2iGmZ026149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 02:44:16 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 18:44:14 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Thu, 27 Feb 2025 08:13:54 +0530
Subject: [PATCH] venus: vdec: queue dpb buffers to firmware for video seek
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250227-fix-seek-bug-v1-1-497ee6406477@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGnRv2cC/yWMyw6CMBBFf4XM2ia0pU7lVwyLPmawMYC2YEwI/
 24jy3NvztmhUE5UoG92yPRJJS1zBXlpIDzcPJJIsTKoVplWKRScvqIQPYXfRoFRBzZd56NiqMo
 rU/3/uftwcqb3VqvrOYJ3hURYpimtfXPVXjO3Ot6kI8sWDZPFDgNa6YySjDZEkgjDcfwAZ1OxD
 aoAAAA=
X-Change-ID: 20250227-fix-seek-bug-7d3cf544bd2f
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740624254; l=1660;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=zMhIA38U6KKpcrXTJD8P/zuZ95lzjvrx09BOjo3hyTo=;
 b=BiTYibGPDAd6H6FJjV1q6HhicajzGVPGGEW7iiVGJs1bfRPJOIDBkR2VEH5HAxd/bBUBx0asz
 lkiBKLsvUvhDF8gmN5bOQWM7EAvNR1P7EZsnFr8kUOCzJEXLe6ktuDa
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IWrKiS6uu0azo1j7p4Zteyi6aPuUlH5F
X-Proofpoint-ORIG-GUID: IWrKiS6uu0azo1j7p4Zteyi6aPuUlH5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_01,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=844 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270020

For the seek case, the input port will be called stream_off and then
stream_on in the driver. Firmware will flush all buffers during stream_off
input port. Therefore, driver needs to queue DPB buffers to firmware
during stream_on input port to ensure that decoder can decode normally
when it receives enough input and output buffers. Otherwise, decoder
will not be able to decode due to lack of DPB buffer even if there are
enough input and output buffers.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 6252a6b3d4ba6d49b343bb53dfb7b0e683410bb4..7d932c985a0b82aa547a7ada75b620c65cb44030 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1110,10 +1110,20 @@ static int vdec_start_output(struct venus_inst *inst)
 
 	if (inst->codec_state == VENUS_DEC_STATE_SEEK) {
 		ret = venus_helper_process_initial_out_bufs(inst);
-		if (inst->next_buf_last)
+		if (ret)
+			return ret;
+
+		if (inst->next_buf_last) {
 			inst->codec_state = VENUS_DEC_STATE_DRC;
-		else
+		} else {
 			inst->codec_state = VENUS_DEC_STATE_DECODING;
+
+			if (inst->streamon_cap) {
+				ret = venus_helper_queue_dpb_bufs(inst);
+				if (ret)
+					return ret;
+			}
+		}
 		goto done;
 	}
 

---
base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
change-id: 20250227-fix-seek-bug-7d3cf544bd2f

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


