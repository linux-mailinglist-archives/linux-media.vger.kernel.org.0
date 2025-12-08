Return-Path: <linux-media+bounces-48366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D82CABF7B
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 04:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D857B3010E52
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 03:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDEE2F5A22;
	Mon,  8 Dec 2025 03:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBMqLymv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3zmyEfx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D33A2F5A2E
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 03:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765164831; cv=none; b=QwoWK3jjf3aBWcypavULsHIoGuTpdgVxwb2ej3DjWmD4antMyjbePMKBk6GBtiPg3CSGQb0ZMK+ftdZC7dzZ6rDTFumXP5vqOCx/kyzbBPCAb9EXLJn1MmZQMOw5s4RUq6LG2ySzH1CG/844BsPnUkWV87lhBeSdkyVCw0aZPNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765164831; c=relaxed/simple;
	bh=nrpyGRDbRTzil87p0IDZgBpYmVtwM1uvVSenw0xPFpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UYLSeXlOju5eMbtjoncH3ku4L7VbJe8LllEj/ZluZTXzNSnl05a2EdBrtyuOJoZglvnhKjNlcmm1P9n7zy/cPZ9wBUxJ4dBqnPtgO48wpZNViKQqwDDr5SD65S5xgx4tb0tVFq8vc0z3O3vuWXSjWmvIhmoQiMZl0cjaw6mt8+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBMqLymv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3zmyEfx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7Mu9t82377198
	for <linux-media@vger.kernel.org>; Mon, 8 Dec 2025 03:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vECANsRZAsv0+/HcW0Znhs
	Pk5JYhO1vf6Ev66v/SoT4=; b=SBMqLymvhsOYKX/Dp6GsGz/NNwmw9k6WlkTFah
	HJXtBL/gnW9hL2fZoAfiCxlg/ulRKdCNBfr5XPOU10HEXrPsR9Uncb/gNEhCmiXq
	cKllVQtfPYa9MfGH8s8ddbjWVMuZiMXx13cNA5uB43FNTd20qBmGnd6rKYvZYb2w
	LShJ/3EeZ2R4d5QdK0Slt1IBS/WIFH4zBbW0DwoJQOWrrzI0QZsJFokROsqeBXiW
	PThTvw45OHl7His0F4lwGG6UfnfSiWBd66Jz4HzAds9K1BsLP+b0TC7Sg/MsYvWc
	QR7ZpKtRhyUv9aK8+cQHDFxalDNSHoD3FWhERgECATHJqwyg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avdnjud46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 03:33:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bd74e95f05aso2773639a12.1
        for <linux-media@vger.kernel.org>; Sun, 07 Dec 2025 19:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765164828; x=1765769628; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vECANsRZAsv0+/HcW0ZnhsPk5JYhO1vf6Ev66v/SoT4=;
        b=Y3zmyEfxaKjqABqBmJROCituejoGW5BAhMop/eZHxkHwP6BAIInYDRWyw9xoHVSnQ1
         Vi/GfGTDAzbU7fXxf/UWbJG7EiqpPg3lRaftv/1eytmCFr+pjgPigeCCH3VYkYkv/V2R
         igJG3pzBtJYPtYA61SymYzSM6KFkU0EFNK+NucdYwI9OmzfBizws9W910K8aivjXB4ru
         O6U8YXS6KB/T8mJ774+RjoOR5ZpJ+XgqYLoONohIYzKyJ3FbYzCYuP28BABWrhNsSetu
         xm+W2/C2vWA85Cg7tK0FOSYkRVjncyzcY1MSseXRc7OptNAohAWEZFew5ksJxBsD4O4T
         8/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765164828; x=1765769628;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vECANsRZAsv0+/HcW0ZnhsPk5JYhO1vf6Ev66v/SoT4=;
        b=YgX5m3/07rCWSdXzGlsjRLgBo06pcrXcy6HZL1Ot4sSm2PyMONaGkZPwvmCapGMOQu
         kkwGF+wQ+Hb2jghBT2tGQaVL+6v0ZvHqNsKl59G1q2rmxEsHMlLDrOEVXPDqeLcl+0Xy
         VpWnmRnEWuTYn38R6e1NC12wQqCr9trYbk9wPyxxI55LpWtB4PuHDmR6kq9JTZhc7K+j
         o+P01bAi4/IgjRUwE6sKOcTjjVpha4JmjBbKdPBgKsJ5fviWh9OhnzxukSTsQ/Yu/U9y
         mTqrxX8S+BqpPpdBM2nw1V9apDBDLGMcn8Nz+Sx4ajUwneQnVj5j4NUBVqHLc15E/oDF
         L1GQ==
X-Gm-Message-State: AOJu0YzzER67j0wAC6lubnwsGoVKN4MpGqZ2I/zYNU675R+kiydVm/GC
	MFT6F2tIwxMEEGkmeiHhtZrKJlv1GoPJT3J11f1wwXfU1031uHBZfPtbPgCFp0R8vbNtcy0QtI5
	JxdXUQi18wZ7TpOYHFw+MsTc3q1F4mfTEQoDk3R4PA+5dI1KJYZl8j790orL6XaQBCQ==
X-Gm-Gg: ASbGncvxiFtW/70ADgARXCXBk+iz79IOhzT5gGJm4DWxiVhQqeQ4yb0PI/8Br/O0BHh
	jQHtxEE9N1LhPnNrn6FMv7K+Da+4R21pr0kITHPdvBZY8Vna6qZNU/xTHBTbyYHSCSpuNDZbeL9
	zWyLXZPe8ho+qOOUVTFgbNjVoLYzUV4N7x2P4FucManF2Bjxz6LcrKp1MCb002g2fl//IKu7PZf
	fgnSeBNTPKgbCjD4XY43xg2stt1uqgJA6qc+oZG4vaRH7H3NQQkl21N+3f0NzpNNFnZVgeYGV+m
	JcYLml5m5wfOCMHr0tGT4OR/mK45fvXH7L1h8ui2lnNbSDv/da7/X+8MqvL2kFE7IKlTzlC4anQ
	ZCKPe9f2c8yJ3S+smJ7TnKC6MqnW7w6VicZzrhRanKAlz2mZLR2Tr5YKxvVSAM4IBCP9oirjY1a
	1/vKfyCn4=
X-Received: by 2002:a05:6a20:72a6:b0:35d:b415:7122 with SMTP id adf61e73a8af0-36617f04261mr5397832637.26.1765164827905;
        Sun, 07 Dec 2025 19:33:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOSp1CHXkk5vR8ZWGY1ypXn5YdHgRhkrIoj/QqBPGpdX2bidaEXrhd+8hg2OkcoU241CbTBw==
X-Received: by 2002:a05:6a20:72a6:b0:35d:b415:7122 with SMTP id adf61e73a8af0-36617f04261mr5397816637.26.1765164827390;
        Sun, 07 Dec 2025 19:33:47 -0800 (PST)
Received: from hu-renjiang-sha.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a36bbc60sm10545177a12.36.2025.12.07.19.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 19:33:47 -0800 (PST)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Mon, 08 Dec 2025 09:03:42 +0530
Subject: [PATCH v2] media: venus: vdec: fix error state assignment for zero
 bytesused
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-fix-error-state-v2-1-255b62ee2eb6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABVHNmkC/3WOQY7CMAxFr1J5TVCdpElhxT1GLJzGGSIBgSRUg
 1DvTijr2Vj61vfze0HhHLnAvntB5jmWmK4tyE0H04muvyyibxlkLwdEaUSIf4JzTlmUSpWF1Dg
 qGgc1Th7a1S1zq6zEn+M3Z74/Grh+l+CosJjS5RLrvjNG+d4jBRWIAxurJnJBO+N6a1HvaLTkL
 Qb4sE6x1JSfq+yMK+xfrxkFCqXDTjc7h2Y4pFK29wedP6+3bcBxWZY3qVg0YAEBAAA=
X-Change-ID: 20251126-fix-error-state-24183a8538cd
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765164825; l=2033;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=nrpyGRDbRTzil87p0IDZgBpYmVtwM1uvVSenw0xPFpo=;
 b=IC8/VmvIE54k3bj645ATMZB3udCmokzu9hbG1W9b+tMkOGNvuINt92VLFFIqcI2LLFrbbLeMA
 V6Mt4cFi6NKB/m0ONAlpao34nsHn/8uar3tKZ0W1csimWAj437RUMxp
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Proofpoint-GUID: doaiZ6N9AAmFaJgbm1K10H03Kh7e0y2Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAyOCBTYWx0ZWRfX30UD6M/gaodZ
 8f14ZxRURWcOzy5yjcxUwYnT3Mt7iOinrPM8/FRmPJtJ1xdFLjXaTdT1/KFlrln1zaAxdAriE8T
 nE9mUtU+0R5tpNO+n0+AwVlOGlMzOmJ67F9jN0an6Fg+YGU8dYXM44V7IqUWRGe5m9KW8/Vdvg1
 GLC/kzG91hGvuskbipHR+EAEDNPpVZvZtU2CBHFnnt6mNaqDk5AjXchHlpVweDejY6gHzi3I+8d
 aHEUKbbG0B3feOzoEly96oPg2Q9Po5yWvTMTYKfknTYyWTbSOUXamnyXphgm/Xan5hfBRfpdUCi
 Q+gsmjE3rn0woLlI/DQfDeR1LUi9YhZaY7h3SxPDZZSkiBt1tLz/uPqYcPnxtzDpJKaQZXHAh+M
 Se5sf6912GRj5BCdkh//cPkBGzzR1w==
X-Authority-Analysis: v=2.4 cv=RvbI7SmK c=1 sm=1 tr=0 ts=6936471c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2SL7H1QK8vwNC9hrVHQA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: doaiZ6N9AAmFaJgbm1K10H03Kh7e0y2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080028

When hfi_session_flush is issued, all queued buffers are returned to
the V4L2 driver. Some of these buffers are not processed and have
bytesused = 0. Currently, the driver marks such buffers as error even
during drain operations, which can incorrectly flag EOS buffers.

This patch moves the zero-bytesused check inside the non-EOS branch
so that only capture buffers with zero payload (and not EOS) are
marked with VB2_BUF_STATE_ERROR.

Fixes: 51df3c81ba10b ("media: venus: vdec: Mark flushed buffers with error state")

Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
This patch refines the error state assignment logic in the Venus vdec
driver for Qualcomm platforms. Specifically, it ensures that the buffer
state is only set to VB2_BUF_STATE_ERROR for non-EOS capture buffers
with zero bytesused, preventing false error reporting during drain
operations.
---
Changes in v2:
- 1. Update commit message.
- 2. Add a Fixes tag.
- Link to v1: https://lore.kernel.org/r/20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com
---
 drivers/media/platform/qcom/venus/vdec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..d0bd2d86a31f9a18cb68b08ba66affdf8fc5092d 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 				inst->drain_active = false;
 				inst->codec_state = VENUS_DEC_STATE_STOPPED;
 			}
+		} else {
+			if (!bytesused)
+				state = VB2_BUF_STATE_ERROR;
 		}
-
-		if (!bytesused)
-			state = VB2_BUF_STATE_ERROR;
 	} else {
 		vbuf->sequence = inst->sequence_out++;
 	}

---
base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
change-id: 20251126-fix-error-state-24183a8538cd

Best regards,
-- 
Renjiang Han <renjiang.han@oss.qualcomm.com>


