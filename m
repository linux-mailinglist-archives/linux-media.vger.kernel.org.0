Return-Path: <linux-media+bounces-51766-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNF2D/kQe2nqAwIAu9opvQ
	(envelope-from <linux-media+bounces-51766-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 08:49:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C1CACFAE
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 08:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3C85302C743
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 07:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3646937AA92;
	Thu, 29 Jan 2026 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nF7sqw2B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cl7uPmb2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C6937A488
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769672930; cv=none; b=hSv6FDU5jBMsr6anpNeDojWZj9IkpcApfUpNXQdnKU5y6X8A6e/zKk1sBFu8nWqOeNSiPtwADTnKE/uu4rCZIBN3Nd7YBXWna/k31yKiej44JU7dcuwg5bNvhv42jhzbiMmvg+O1MJkpsJKNXAkeoTMES/zgqm8se7r95AnHJnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769672930; c=relaxed/simple;
	bh=vu0FF/0EWxRRRdI+Ueke/qWAx0AFTRqdB2hGPgQ0ldo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sZnaKMqT7VRTGDKfW8aStkdHITlBEI+HoaXU3QLfkiF5ausZmISAl646Nkn3rXbwid1ET9I5Fe3iM+gPdws3vNaNPSHjfHDG1zMr+qknDkEZhrV595u9V9jZ1AN6JkYagOHutnM7lWXiwim7sKNZmPMTlRednwi07JHAmJns3r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nF7sqw2B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cl7uPmb2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2p09i2034151
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 07:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vusokcB14ISYWAIOqjpq0u21/gtzX6Vq7VTeLwjsWM4=; b=nF7sqw2BwWDt2SqG
	qH9w/+/UkyUrEc7ro2ni52WD49yBBIxHitx2U2b9EboRUGT805kwZ/iosprSvP+M
	bK1+y2TUyzuOaz9PR8UMrG0ouf1g66XIEUy7p9jCU2CBfSXcsCVZpdl+m8EUcZ3j
	rXgYw1lde4JrotZb37Tg3gfHdSWSJAaG4if+TYlcKZVClAe0+RvX5I4j2jUEjSQX
	6A9GBrckrdd+TvGsCQQYPA+ZqQ7k2RWHTNRDdESGykvVBrBYsJZq0YSfiJB5O8F4
	H45zt/1g1xZtHmzDZp4JqZGeHGvfYghIW/fEJjNRBlM4msBC2a/LxjOOdj+xJkYl
	e0wzZg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byna7jq8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 07:48:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c337cde7e40so431500a12.1
        for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 23:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769672925; x=1770277725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vusokcB14ISYWAIOqjpq0u21/gtzX6Vq7VTeLwjsWM4=;
        b=cl7uPmb24Hmcn0saNDMnvHzCZ8mBOTohHk83+GMWFyZMbaDZYkcMEUGWIwMvqaRGHO
         qIp2Lt0YuhkNeoLer269SNGr3AE0rlIr1yR9wF/crXQUfXNJKarkMriKpxtT4xWtNc6H
         hcayDatFNVGhUWIdoou9tMg/yOrhzxtg4mE1FihG/ciTkS+ZR45jOXw+zLP/4155qYG1
         /YEaWUwImM+NSPaEIIdGVlaSrHWhARkNNp2wxYSboK6nVwqF7YYVK2LMYGzB2DfPE+eD
         rwpS+/s34RzaF6DirZ8EbW7PjRN9kKfyVt/X6wZlhkYgn9rgBsm0aTLWL4q0sNfJGzfp
         RGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769672925; x=1770277725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vusokcB14ISYWAIOqjpq0u21/gtzX6Vq7VTeLwjsWM4=;
        b=QjaI59M2fr76HV6gAJVYrMRgVG9io++jfczoyU6DKUvFq00r/7T4gd+Nf2mqPm4OEa
         QRELzPDJYpVNNFMXsG91bHDJrzG+U5slFe36h9GBgAoPf4mImZ12/saFZOp+g4sUI+tj
         S+eos/kmI2iEKghy/er1ZT5Pr+q3XbJVBATv4VVzfndLnjTIOkci+O6ga9pZ+EP5fRrl
         u0MBMEIzZcMNeaEJ7UK3PCqX4e6IRTB7CgIt4wIApP5Sl0cy4SC3mEaf15MaBd30OGiE
         F96U6uvLujLJHUhFRPRIf1Qsg+qdNkAFq04lhrqDkyI9VSe9w+l678j4zPyte4wsG0tY
         WpSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWmilKx0opmiy+1GTagJ34zxYqCEbOX48SueL6cXG5bgna54IHmw4K2mO/y4V2zA5FimaSlXZ1gon44g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGEjf2JhLGdKdnmkosHk4huRxEzz0W6Q9BHdiYoC3e0bFTvV5A
	v5I2rekpedtnBm7w/91YHjcNDjwRhQMnOZQHqt9OlPIDUHcprSTuo+WjwQjMg6Cm7r2lXzfmZe0
	y+PacqYLssB8ieJYCzKCpzG7UjIw0j/e9r3pWcFDHWdfEneoOB8ZbJPYpW0PndAV+mg==
X-Gm-Gg: AZuq6aJyd107ZbrmAO5OupNAHvx+Uvdd8y7FEhDBJf2t1TB1qC8548KutV5Z9DZmFuS
	GKHbNNwQnIHxMVP3uyS7q4husRmEdX0MfztWb3guCBUDKOAFAYGxdW44qWdcsyauPMOsDkLscoo
	MOG8eUchZyU5OZCeTkKqBU7eN8VwOTcqYhUNZ5u/vYqxOMBWaFCFR2+hBGzQN8CPR1gOpfoBPS8
	KxAWCt5+yw0r6U1rqak29B4MzspV+fHYzOMQzcz2S5jOFu64LSKXiEcA1Jabd9DJR/Ziv0T1eUI
	aDVnTd/LT8/8oMJypIfT7K7viAwPmJbulvkz8bPN0z2YhZ4tf+3k2zAOVqftxN+1ZhfFDDME4fd
	y5rcNb/iX2fpnikPfuO+9yLCSKQoyYaz+EXqZHtc73+cTN0IMd9GV0uqY47LE5CCvB9ffQ+guBc
	W/exJULRL0vb4=
X-Received: by 2002:a05:6a00:2294:b0:7f7:6229:fbb5 with SMTP id d2e1a72fcca58-82369196317mr7631196b3a.25.1769672924499;
        Wed, 28 Jan 2026 23:48:44 -0800 (PST)
X-Received: by 2002:a05:6a00:2294:b0:7f7:6229:fbb5 with SMTP id d2e1a72fcca58-82369196317mr7631169b3a.25.1769672923975;
        Wed, 28 Jan 2026 23:48:43 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b49fecsm4534634b3a.15.2026.01.28.23.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:48:43 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 15:48:22 +0800
Subject: [PATCH v4 1/6] media: qcom: iris: Add intra refresh support for
 gen1 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-batch2_iris_encoder_enhancements-v4-1-efaac131a5f7@oss.qualcomm.com>
References: <20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com>
In-Reply-To: <20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769672917; l=7870;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=vu0FF/0EWxRRRdI+Ueke/qWAx0AFTRqdB2hGPgQ0ldo=;
 b=5bEjBpBWB4qctfZwZght7IWnWmiuwpvthGMmXrqYOVgo51ZJYeyJQaavYM8UXsA5KhX6xnWyY
 mLXyvMzF7c0CR0AHVCT90/OioLTX9ZNaZEQwu3qzlrkJq1BvDh4uMVz
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: 69OUV2tbSJpdf2t0_iPKzxNRcea3VQH_
X-Authority-Analysis: v=2.4 cv=J72nLQnS c=1 sm=1 tr=0 ts=697b10df cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=vcDqveFK9my7lXZq-ZEA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 69OUV2tbSJpdf2t0_iPKzxNRcea3VQH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA0NiBTYWx0ZWRfXxoiccJbabL6z
 ucLJ2Wi9HbiMLwcgQh2pJtDaqEjQl8O/T5GNmSbjHmrDOFbuk2XohhNZcJBDlgf06zNy45rHydv
 5gOS8XUULT42QG4llwIPCKdafRqoGeIgaKKCCLex9yRQQ6oAtmPY3nFGwPBrDQDgGcNRbU9MTrh
 uSIZBH7lHe9DNISsDnvmlthmZ37MOAwLsedyiiW3fAHC/SPb1kSlVCH15LSi2huCm6JIgJGV06r
 OM7eJCAUxQljXu3SqWw3JykF5dtRNP4EIqwKfPbCXf79bIuxVveaed9oka74eaxumVs1oNz0dgT
 Jf4DCi6MW+GY9LlhpMpJ+y1W/abekdNrZgP/N8kor/IxBVoBBFFh8ltrdFJX0TB/KEJNDxBqbmE
 CT0zkpUAE4Y9NeVLdQMuGAmqzzZpxK9a6uuNn7ct8bvKn0odJHjjvhjexogKps2vGGEOhKzt/Oa
 musUzGlGJ/qrpZEh2fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290046
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-51766-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0C1CACFAE
X-Rspamd-Action: no action

Add support for intra refresh configuration on gen1 encoder by enabling
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 39 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 13 ++++++++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 19 +++++++++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  2 +-
 6 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 3cec957580f5ebbc8d6a7a613866fd0377fe213a..5441278f80fc5d0f97367c09b2ebd98a55c7ff1c 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -970,7 +970,44 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 					     &hfi_val, sizeof(u32));
 }
 
-int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct v4l2_pix_format_mplane *fmt = &inst->fmt_dst->fmt.pix_mp;
+	u32 codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+	u32 ir_period = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_intra_refresh hfi_val;
+
+	if (!ir_period)
+		return -EINVAL;
+
+	if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) {
+		hfi_val.mode = HFI_INTRA_REFRESH_RANDOM;
+	} else if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC) {
+		hfi_val.mode = HFI_INTRA_REFRESH_CYCLIC;
+	} else {
+		return -EINVAL;
+	}
+
+	/*
+	 * Calculate the number of macroblocks in a frame,
+	 * then determine how many macroblocks need to be
+	 * refreshed within one ir_period.
+	 */
+	hfi_val.mbs = (fmt->width / codec_align) * (fmt->height / codec_align);
+	hfi_val.mbs /= ir_period;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &hfi_val, sizeof(hfi_val));
+}
+
+int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 9518803577bc39f5c1339a49878dd0c3e8f510ad..a0d5338bdc910bd30407132e8b700c333ad74e4c 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -34,7 +34,8 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
-int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 11815f6f5bacd4b464f6c76fd32adbd59d4167a7..f30fbb803936cea030c2b5485801cbb7addef34d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -687,6 +687,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*plane_actual_info);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH: {
+		struct hfi_intra_refresh *in = pdata, *intra_refresh = prop_data;
+
+		intra_refresh->mode = in->mode;
+		intra_refresh->mbs = in->mbs;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 42226ccee3d9b9eb5f793c3be127acd8afad2138..04c79ee0463d7f32a2042044fe4564718cc01561 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -139,6 +139,14 @@
 #define HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL		0x2005003
 #define HFI_PROPERTY_PARAM_VENC_RATE_CONTROL			0x2005004
 #define HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2		0x2005009
+
+#define HFI_INTRA_REFRESH_NONE			0x1
+#define HFI_INTRA_REFRESH_CYCLIC		0x2
+#define HFI_INTRA_REFRESH_ADAPTIVE		0x3
+#define HFI_INTRA_REFRESH_CYCLIC_ADAPTIVE	0x4
+#define HFI_INTRA_REFRESH_RANDOM		0x5
+
+#define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
@@ -447,6 +455,11 @@ struct hfi_framerate {
 	u32 framerate;
 };
 
+struct hfi_intra_refresh {
+	u32 mode;
+	u32 mbs;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430ed2a070e092edae9ef998d092cb5e..a7595c302162b9fe758c61706895a709b3b4e852 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -246,6 +246,25 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_qp_range,
 	},
+	{
+		.cap_id = IR_TYPE,
+		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
+		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) |
+			BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC),
+		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = IR_PERIOD,
+		.min = 0,
+		.max = ((4096 * 2304) >> 8),
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ir_period_gen1,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..0de85c51cf745e9a121da14b1ad7bc761505c957 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -738,7 +738,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = 0,
 		.flags = CAP_FLAG_OUTPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
-		.set = iris_set_ir_period,
+		.set = iris_set_ir_period_gen2,
 	},
 };
 

-- 
2.43.0


