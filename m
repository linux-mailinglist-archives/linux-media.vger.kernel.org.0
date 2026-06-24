Return-Path: <linux-media+bounces-65521-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uuYZNKebO2oyaQgAu9opvQ
	(envelope-from <linux-media+bounces-65521-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:56:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D306BCB93
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:56:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q1kot4NO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BYAnkewt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65521-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65521-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EED8630F1A7C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 08:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314EE39A809;
	Wed, 24 Jun 2026 08:52:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F145939A4B9
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 08:52:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291124; cv=none; b=OdoDgcyZAv4r6qElLxEPY2N2B30HMY0QC50fJFZRaY91e4RPJimovIklQxPj9uQfqiW2NlmJNIPgCYmMERRdclLLmDhjGjiuYKZbQH6Brdpp4nqdZcHB//WO/emDpCXad7x7yQJhT7yUIS/TsMvRPBvaf1pGcC/NRf00EMi6buM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291124; c=relaxed/simple;
	bh=LwmUNyKZHzda4EbIv2wZXVP305kqBbe9yR6+msrQP9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MAMrAa4pLN6gVxr6nt4abc22iXYKE0UySkTUpusZw7VlTVEs0OgV5LYqwx94tK1GPe1EukB3niDBY9ASDCXe6DJBmZzpet1ldeQhsRc79iqZO18MS1WiHj+Pus7hfRTNGilmngNWk8vnp2kGOsoS6w+wmozp8PmvcXF8ZU6q7RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1kot4NO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BYAnkewt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uH8n2460747
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 08:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YvkdU1L7UyS7XtGOx/bPrcCG6ZAPejVXJWoEsK1zfhQ=; b=Q1kot4NOM7qtOVKl
	eHugkTqpWa1UwhVL7o09WgvrdU/83/V0I/PArCrPymwStPMfr1jtz8Y4nMkrBHPx
	YSRgMnFJ+6lCDrFKsp+AjUor0IPx5OR9wUdkLSRASRGz0yFg8M3iL79BLiB7uVqU
	7l+oREOjJrJRhc97ZOljLY8w2mkBHjHtHbDzIviKuiDDa3smHX6MywgEP40U8S70
	/JgE9AmiaDIfGuCRHhMRtPOeBFgDeKrf0RFr/jdYw49xtJelEniFdvd1nh4W4Ec4
	2TXd5As4Zma37JHvRLZSUczVvpgV2zLpT3aPgRgjtVGgxaQeFBPIEoZq0Gm74Hw2
	04Wx1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh40c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 08:51:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso718775a91.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 01:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782291119; x=1782895919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvkdU1L7UyS7XtGOx/bPrcCG6ZAPejVXJWoEsK1zfhQ=;
        b=BYAnkewtYZu/Zqnwoz6tZIac/1j5bvQBiOhuuESFDcQrYL5xD/RI4nnf2/abv26uF5
         dI9d6/+5nbMo3z4dEP5icgrb2nGWvLd6Top/ec/kyq9/4Zu37bUWXT5Gp5mmi8u1aSRC
         4ruenY4KymEGu+mk63RrdNNv8FJ3mnsMuioDf1lOlZgu6Bh1RT1htrbZUvNR9exQyrXb
         tcX6bhBWjCwOsaC+7oM6zFkHNkxBE4w/17L+k0FORy8QEJEyoV5uvV0Ph+4w3aJ4k8bc
         OItP9F2p0NJNHruyCJtCZmjdB7GEqUm3gYR7rcVs1tgBO6mIEpu4NOKhsYhy94Izwbdm
         65pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782291119; x=1782895919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YvkdU1L7UyS7XtGOx/bPrcCG6ZAPejVXJWoEsK1zfhQ=;
        b=UsHeoAs/ErAhm1Qov5CkH3JgOkk+CSKtaiWlL8lUVK5PrFsCCsFsQqSU4Xmd2/vH2a
         YRWv8LB71hDGelXqk5a+eVWST19ecRnwGVaIG4+lDWE8GSAVAuuQCdLnqqV9KBVJpTQr
         AKgqMKad1InKZF7/uPd52gTq+QQ48rCV8UgKolhXmWjG6TUkGGK2rb6ZMGwQrBEcBCkm
         IXP1U0jt4EQKwTuBtHZbgbJRGGa3aGlPVFTU3ZdTgRRWSaUzAI/kOZ8YGTG3vGMFIHSt
         zbSzs/XaoupQe9C9kPp+1AWfWvJ57aJ0DzqfV2c2K303PErx6vMwG6fQ4do1jb4Jh9YM
         cuqg==
X-Forwarded-Encrypted: i=1; AHgh+RqCW34S695ioAMh6YiqM+fyO3HqYnh0idUBN17dn2ZciYoY2DxgOoH48vky7SHgydpIl7055faZOuZOUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxZPoY85kl7U0x3rW9kxTS8hIccDtCCQM1b4djhlfJ2CJOxSeD
	0nfgEpcdv5CJwuehPv4wiMzjwnyKcDl9twCqrpjzDRyv57nRY5JlaZOv4JeDDkZlGYQEtZqEIdY
	R2cfCQBgv9oJo/x8xTbp3WIj0CutxqTUSKSMg5a9fodF1KgHQYBDvh9julwDRnKF59h9P9FhpgU
	El
X-Gm-Gg: AfdE7cnSGankeV7J6W5Hwkg7nf+4kvSX3tijxeMuoH6FrymLyGidF2MWcCBnfFgHXIX
	VEZ9StR1jL1YMTQSRvHttezEqNxDbhFHIAlF/aO/OW/rExzixfPQRXgHDbwAIj1oS5zerGFN58Z
	jCa///tsTyigYepU08v0qTxDLj8dFm8fG7HFHx29UEC9ILsDKalOlc5d9HsXkT0Rgcd6u19tU33
	KlyFdCI+g2Modt09/wyvg1nx/RWrjsEUR2zlugghyrF5/rpSnrrvt+W0QGb7BFOQYYOsyKT90Ez
	mr+qmOzL1bKsyJiHb2PSsAA6FlijTF+hSWBTcSUPBOeXigA4XiRzZ18gx3hcUTlUGaElWDR//h8
	+x7qP0HODTdLfmXIcZIjSjQZee+Y/ENQCGfOg0HqgLQdc+lTyHzthstDhFv0WbGPT0wCq2T/Zpw
	eG/SVqq8oOYA==
X-Received: by 2002:a17:90b:2dc1:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-37de41a9c32mr3090893a91.7.1782291118844;
        Wed, 24 Jun 2026 01:51:58 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc1:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-37de41a9c32mr3090861a91.7.1782291118330;
        Wed, 24 Jun 2026 01:51:58 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c406sm11926464a12.19.2026.06.24.01.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:51:57 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 16:51:45 +0800
Subject: [PATCH v3 2/2] media: qcom: iris: Add request key frame support
 for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-dynamic_encode-v3-2-f2a2db0ac2af@oss.qualcomm.com>
References: <20260624-dynamic_encode-v3-0-f2a2db0ac2af@oss.qualcomm.com>
In-Reply-To: <20260624-dynamic_encode-v3-0-f2a2db0ac2af@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782291107; l=8085;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=LwmUNyKZHzda4EbIv2wZXVP305kqBbe9yR6+msrQP9o=;
 b=H4WkNp0qpM4mGQl+i6nUIalToLJWDSNLtifIqd5fk0FIm1QQ8BYItWCfAZ19fvApYXX5kyv3W
 /949AuKYF1RC+uOgmm6erMbb+uZyBiPa+aImHeBRFqMoypyY2DCfyeX
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA3MiBTYWx0ZWRfX6r8oWtLUBnMI
 eJ6Bkv70FpzAOAUk5UN8iy1fFZalwKGu0Qf+j6uq4Cyg84HoGzazbU4h32qo76/i1RTQb1W9j7+
 uWbINuh20ywpwkLk9IKV+bJrL7xDzYaxdHK0ZoenMNC68oNJzOjb722cZUNHcAXHFN9A+Y5hziK
 AxmXFcfliogWuL2E6iLa31+5g+zAnF9kuRoUxhXDvAZzFVFr1JshuSHoeozCtDbRzmzhrcRSguG
 0AcdnKM6+3p3ucImO300rJiaFe2XjdkuZhhIzTLU2YY/TXw1HHOI5+5ErLoW/XjX4mApd37JKap
 kiNnAlZw+/XGgxz8NsTZi4B2UHD78ynmEEr5X0Te263iP3/627ELrcBS0M3W16gkRSDZp85s6pJ
 q1mn93nmr1floGJomaqzFBd0jOudZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA3MiBTYWx0ZWRfXwo+eUUpIpoHb
 K6Nynh6FftSm74xN/rD4pagb6BBp0wMwgShfnVtMkFMtQnvZYgM6T6DeEYUAMa/DkaQ1hY7cBWI
 o55VdUvDjIX7WttsnENHsr3oMtEsw+w=
X-Proofpoint-GUID: mfuT7YY_diV5dL1AdQ4truQPZorbEiFk
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3b9aaf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dH0LTkPdLIk2lxNp47gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: mfuT7YY_diV5dL1AdQ4truQPZorbEiFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65521-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20D306BCB93

Add request key frame support for both gen1 and gen2 encoders by enabling

V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 10 ++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 +++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 8 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 391e1fc5f6e2ec8e9cf5ba4e0f76b2d1da3e2a35..2918a7df0b403a886648e90ec00968f51c4660a0 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
+		return REQUEST_SYNC_FRAME;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case REQUEST_SYNC_FRAME:
+		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
 	default:
 		return 0;
 	}
@@ -1477,6 +1481,24 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val = 0;
+
+	if (inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value)
+		hfi_val = HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR;
+	else
+		hfi_val = HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32_ENUM,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190be8935176b290588f224fe4f144a4..8d8bbef960076c08e5af0f65920dde187f24a313 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index eff9216bb50143c0d752051a6400605bbaf3803e..0f7e7d6b25f41eb8a67a9a8f01dce20ea54dc335 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -375,6 +375,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_bitrate_gen1,
 	},
+	{
+		.cap_id = REQUEST_SYNC_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_req_sync_frame,
+	},
 };
 
 static const u32 sm8250_vdec_input_config_param_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 7674b47ad6c49adfaf16b444c8ec7295b230a529..d7fd867cf6c98523123e9205fcfe4b469708da72 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -741,6 +741,9 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
+	case HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME: {
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 0e4dee19238464a9671a94eaab8eeda2d7f7ca9f..275f3fea3d2aabe26a2a0498c78c09ec28765b24 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -157,6 +157,7 @@
 #define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER	0x2005026
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
 #define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
+#define HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME		0x2006004
 #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
 #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1ae726c94ab6346b0b4b2b3db1d7b..7d6fde36f0e9036145e45b84054b439536b25e50 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -937,7 +937,17 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
-	}
+	},
+	{
+		.cap_id = REQUEST_SYNC_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_REQUEST_SYNC_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_req_sync_frame,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2cd5555cbced8e438cb32e87a539c..a8b47e4ceba0fc868125f841a5635476571aab85 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -90,6 +90,13 @@ enum hfi_layer_encoding_type {
 #define HFI_PROP_BITRATE_LAYER4			0x0300013f
 #define HFI_PROP_BITRATE_LAYER5			0x03000140
 #define HFI_PROP_BITRATE_LAYER6			0x03000141
+
+enum hfi_syncframe_request_mode {
+	HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR		= 0x00000001,
+	HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR	= 0x00000002,
+};
+
+#define HFI_PROP_REQUEST_SYNC_FRAME		0x03000145
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
 #define HFI_PROP_QUALITY_MODE			0x03000148
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index ff48333ad089894c3393e8ad45903c2603288eb9..23b6e7676d05bd01725f8e2cfca47b06ef112c27 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -182,6 +182,7 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	REQUEST_SYNC_FRAME,
 	INST_FW_CAP_MAX,
 };
 

-- 
2.43.0


