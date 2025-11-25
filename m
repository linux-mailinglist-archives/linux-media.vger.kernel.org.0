Return-Path: <linux-media+bounces-47680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD1C8365B
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 06:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7043C3AEB15
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 05:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26D41DF273;
	Tue, 25 Nov 2025 05:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bl2EmNKN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FI9eFBHw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8342F1A5B84
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 05:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764048869; cv=none; b=V/lljQsnsl20lEEvp7CVrxIV2w9ZpnRaPd1eTHr9qWzVIMFeu8VbeSVRDl/Ik6QQxoQWqRtoadtJPFd0Kk91VJBHHLbXO6/5WKCYWAutUrP4z386ykGYccCZemy3F/xSrouLi50k6SCoI9skaS/+za3wQZaXPbfRc7rhskC74cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764048869; c=relaxed/simple;
	bh=r3O+2ED8l46eo/i1u0pELvC17W+YuHOhwVbpWxEnJkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FRYpAPTr+idFCEeE7cpPPIJ99tb7HODGJgMeqvK6OmoYDmxxPd8w0/l2GT6elaNqLVcY24TQVaH8mLb7ki4V1c+CrYp4VkWiNh+nWphnzHimeedM/D2ZutrWq+4h+xgFvgZKLJTjjkcrXY1owOG5fDRzF670Jba42G5OCr9diwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bl2EmNKN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FI9eFBHw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gm6l1979152
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 05:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ssugvbgvSG7d3SC1KBDZ/I
	lQ9dRG61L1cgvDKh8lTrc=; b=bl2EmNKN1bFK6U1qCep2Ja5jUawrKEpfbeDghE
	ViUZXjKOfzb4toR2ZB3bp47pRk/FjvXHvEVlwbP27sbEEZWGXWBjjkF0zRN9hqXr
	AZwgJDNNRnSS1fGm6OMgF0VSeHwXB+iYmLWbwUMbgR5dU5LUNb/M/EFOBVfcwEuc
	rnz1zZ95QNEU9bHM9PEhKznneBTlxSDrI8mh7K0RP2snsdqjLgiD4GJwGq1YGR/+
	kVEJI+9ClnOzieMKeTjh6rjTF7Ll2r5PEN+xaviaPVpvo8O853Anzvyjc+KCnaGV
	PYdjz/+evL2lakgwTk5x3iDN3u3EPnOS5I3HpOpYX50Y62Xg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amw9gsbu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 05:34:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2955f0b8895so60361005ad.0
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 21:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764048865; x=1764653665; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssugvbgvSG7d3SC1KBDZ/IlQ9dRG61L1cgvDKh8lTrc=;
        b=FI9eFBHwn46SmTQYLp3wi8QOR+uxhXHPH0pjtqQTP1e8t21vj5USEPnHANNEzY5Mo9
         cHJ7s7IcRYdCZcVBfYi1n8rPTgeWQZm9LVFFF6lyGbrPxS4eR44kPVTragZGh/4khox0
         JDKijXnJA1jJU1Prn1EmpPglwlPR8c3+WcyZhxoreGwXtkEDQ1bg349n2N4az/3hqUaJ
         G/h1D76N9Rp5b6mDL8wiN0k7x1g/kFddEH76/ScjXs0eWcTCKQ3R1w+LIvkoJWABZC1q
         ORzdwGNzOpLuEC48ln+xU+adquRAKXC2dxd67MJwpW78kkOe2BRqdpqCvpQEXRgR+wcb
         gpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764048865; x=1764653665;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssugvbgvSG7d3SC1KBDZ/IlQ9dRG61L1cgvDKh8lTrc=;
        b=wYwePirHTGSFElDJpzWbdYWD+kJRieBZLZuCQyz6IknDvfGu8YPyx3QK+nnwaiOCo3
         gITQIvtww2qQ3lUW1sG/uixqqNA5or632f0EYAEDcszjYn+6rvKnI0HdFvUYLpLbnsl6
         Zy0tExuhAOeGrlwey1O0ckYAIRsvCRB9QDgzTTzv9aMY139GflTbV5lUGNmL49omfyOh
         5dvbDr5ua7N6gEyeUL7obX9QgI8r7v8fpU1qUuSe5bM0gv8s5Uzd2LAJccM9yH26uSac
         wm1+WgmUgb7bDmlFVgS/30+wxnRfj/VVk6NeiKONartRDCBCDrEWapUV2P5ZPfE7A0TT
         Aq4A==
X-Forwarded-Encrypted: i=1; AJvYcCUqR000KdaqUtPDytGmS3LiARTaO1IDoXeeyRggOX9YFsiDok1OCqLPEGdousOjHN3buwpYUux/rIjMPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4x4lSek8ng75SS3ALHz0jLJRb1Tf45Kx+RZqN4NauSDYL1Mrb
	tpdOA2dDhmXofwFIZASHUli0XaKPUSlVWoFL7AGaR42Ov8+rjtW/oGInmRgVHQwE+49tFdgR14W
	HlKEF0p6hssk5Jd8EFhnYNGjIj6Ss81vzRFo/RNlkTAxRLHMsv5xNlHqQz+wmqVb9EA==
X-Gm-Gg: ASbGncuWjfzYZ8VzX5pxhhH6FNx71xpBzEz7dSsshtdszobEAM7egFca3SLvMeAkzhZ
	JPmKRn291PZ7ahAPVJucVf/iqSG0qcqmpilfzP32tyYEcYvmNVPwzDl2xCHcO5pvec1MKcT2bzW
	jD3mXB1gTs7WqsMMuYY414HuVMawpK9UXSm5LcwBK2ExJI+27jIPvkY6ZPjawPjKnarEmUBh1//
	aIfxJQSZoT+CJzVV57SGgvQPuvLBMA1EwxSeWd5c0RRhdjVXIJky8XeMwA/Hp3YTyv0Q+OoHTCj
	gGXRhR+OgNqEvkk2y/w1DYFSfnkZpPxEzr9SwgoZT+YNTZrM0mkaDdzxl+wcDVwoeiltyF/Gczy
	4mYIpdWZkFBdqKqr8JoFIiOg/t33+5Dmi3bD6kUSNBCTfh8Y=
X-Received: by 2002:a17:902:f78c:b0:297:eb3c:51ed with SMTP id d9443c01a7336-29b5e38c16dmr208832055ad.16.1764048865254;
        Mon, 24 Nov 2025 21:34:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdv8edE3hDdaAIkYsKudaPF2wQSgX6yN+qcuutIsmnFZUlSxOkKKat+tl1Nn8/w85/NxBgqQ==
X-Received: by 2002:a17:902:f78c:b0:297:eb3c:51ed with SMTP id d9443c01a7336-29b5e38c16dmr208831875ad.16.1764048864732;
        Mon, 24 Nov 2025 21:34:24 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b00e1fasm152016465ad.0.2025.11.24.21.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 21:34:24 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 11:04:19 +0530
Subject: [PATCH v2] media: venus: vdec: restrict EOS addr quirk to IRIS2
 only
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-venus-vp9-fix-v2-1-8bfcea128b95@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANo/JWkC/12MQQqDMBBFryKz7ogzpopd9R7FhWhSA9VopoYWy
 d2bCt108+E9+G8H0d5qgUu2g9fBinVzAj5l0I/dfNdoh8TABZ+JmDDoeRMMS4PGvpCMqQquWfU
 FQ/osXid99G5t4tHK0/n3kQ/0tb+S+isFQkI2pqyGxnBZq6sTydete/RumvI00MYYP4odzSaxA
 AAA
X-Change-ID: 20251121-venus-vp9-fix-1ff602724c02
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Viswanath Boma <quic_vboma@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Mecid <mecid@mecomediagroup.de>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764048860; l=2797;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=r3O+2ED8l46eo/i1u0pELvC17W+YuHOhwVbpWxEnJkM=;
 b=d0GdPcGZ4XXMeOeyU6co30VptwFlHcQolM4Rsf3EKtJmb6uPnOCV6FZLlwjhtl/AX7OL0urvp
 CPfxUmGAxKjAlpQA3QYnW5v1IHuyS94pZy1zEDbIVuTraSEOdNHW0Zi
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA0MyBTYWx0ZWRfXwCjARX5Utlrr
 EoGP2UTYSpsm1f3tmBYrLAFvYgA4sLyreFfbIPd9IXHlg6V8Oj1OXulPCLhl0b8BCybKQ6dmucH
 lUhEUtOz74ZJH+EG7mz8+NmDoLnxUmhCFvG9u6yJpEarX7oRO457AMLSWrtXX2kuaaXStZZKKAI
 7dE/qe0mQJPB5yavdYbETarhX158vdgO840k5EuxfrK6YXhEv3gH7WUOfEdoV/YbvvWGorLG/Pn
 FRTS6TLzFmM7tFomLZ5e29fJ25Y8YT2aaOADySCweWUwmed2wcULVCqCC1P5Thk4aQH/XgLhmle
 vuc3RTLiGf4gtlX+EbN5BPJbnLvreBOmruBKAS5NPZYoQTvrftXB3UIy32Ff+Y9fO74k92x3Mfw
 TbHewJqafjwlyGkBUzjJxGY3eUAZCA==
X-Authority-Analysis: v=2.4 cv=H53WAuYi c=1 sm=1 tr=0 ts=69253fe2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fVowlSO3gPwIgFNTVWQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LrK0Xt_S5X6aFctw9Gu7m-_fSvBz_ArC
X-Proofpoint-GUID: LrK0Xt_S5X6aFctw9Gu7m-_fSvBz_ArC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250043

On SM8250 (IRIS2) with firmware older than 1.0.087, the firmware could
not handle a dummy device address for EOS buffers, so a NULL device
address is sent instead. The existing check used IS_V6() alongside a
firmware version gate:

    if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
        fdata.device_addr = 0;
    else
	fdata.device_addr = 0xdeadb000;

However, SC7280 which is also V6, uses a firmware string of the form
"1.0.<commit-hash>", which the version parser translates to 1.0.0. This
unintentionally satisfies the `is_fw_rev_or_older(..., 1, 0, 87)`
condition on SC7280. Combined with IS_V6() matching there as well, the
quirk is incorrectly applied to SC7280, causing VP9 decode failures.

Constrain the check to IRIS2 (SM8250) only, which is the only platform
that needed this quirk, by replacing IS_V6() with IS_IRIS2(). This
restores correct behavior on SC7280 (no forced NULL EOS buffer address).

Fixes: 47f867cb1b63 ("media: venus: fix EOS handling in decoder stop command")
Cc: stable@vger.kernel.org
Reported-by: Mecid <mecid@mecomediagroup.de>
Closes: https://github.com/qualcomm-linux/kernel-topics/issues/222
Co-developed-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Changes in v2:
- Fixed email address for Mecid (Konrad)
- Added inline comment for the quirk (Konrad)
- Link to v1: https://lore.kernel.org/r/20251124-venus-vp9-fix-v1-1-2ff36d9f2374@oss.qualcomm.com
---
 drivers/media/platform/qcom/venus/vdec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..6b3d5e59133e6902353d15c24c8bbaed4fcb6808 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -565,7 +565,13 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 		fdata.buffer_type = HFI_BUFFER_INPUT;
 		fdata.flags |= HFI_BUFFERFLAG_EOS;
-		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
+
+		/* Send NULL EOS addr for only IRIS2 (SM8250),for firmware <= 1.0.87.
+		 * SC7280 also reports "1.0.<hash>" parsed as 1.0.0; restricting to IRIS2
+		 * avoids misapplying this quirk and breaking VP9 decode on SC7280.
+		 */
+
+		if (IS_IRIS2(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
 			fdata.device_addr = 0;
 		else
 			fdata.device_addr = 0xdeadb000;

---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251121-venus-vp9-fix-1ff602724c02

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


