Return-Path: <linux-media+bounces-61221-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIuqGFbwAmrpywEAu9opvQ
	(envelope-from <linux-media+bounces-61221-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:18:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0811251D7F7
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AA6930EFF38
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFCD3A5E61;
	Tue, 12 May 2026 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYytrwek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vh/QPyMR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840D13A3820
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576134; cv=none; b=mFwRESkZ/n3r5NChf5cnPvftk8x41+b9+RSyOB9TL/dJ/woqn35HIFaUMkUdQ6ediJpR48uoxdR7/wdPT2/OJucARG87rz+RhR6yxawTzqZ4RveQ65nhGlTvBLvAibkaz3hKepdTxOvMSd00izwmfDsEcFUpvmZ2SYeQgxAY0vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576134; c=relaxed/simple;
	bh=+jjoLi1geBfonyp8XtU8nugaD1xkWUl8LpP38hNPSFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O32xCTF9MEgcfbmUN8vClM1vdKued6BnCPBS3fJxOZHhF3Q1ceDnvqPC3MlQyYFAptDVPHqbXKMhJ9UOPt88nvLXZi4IYbwcwgPGLWRk7EeWuFGb6JuXshnzG0v0dfYJLMv8POA30SQslC7xieXysZUfubeHq7NDovxc0QO+ZIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYytrwek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vh/QPyMR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5CLqU3443736
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Pp4q+m9WiUalNcrg6WYFPWfAjzQPqHJBOyGjHc4AB4=; b=KYytrwekau/+2RgR
	4DHEfb0LYadI6jFJInn7pRiGhTNcPXq05987kOCdwPHoJF9Zze5wYCqUFNP6IeOZ
	P6p69cQmIwYFs1bC1LY+8YZ3czrZd+iHlQdBlMu8hiZNAnTUbGHFX9arnlGtjnW8
	HpkeChfSfZyCxywC0aK2nmIMr5TshPojFFIGv9LUy2iolX7A3wk6Tf/hLo6jKaP/
	NWS+6Kv6BnHRGVxI/CdDNN4Cv6spVdJZ688IlSQZeedZV4ujM4jahUvn57cBVL4P
	brbzVI7863FiZZpcdgbbkw19FpKmlz3eUXaxG5A/nG8zgpNABuECAiL7tTo9ZipT
	fD7rSg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0jc0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso58132855ad.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 01:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778576127; x=1779180927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Pp4q+m9WiUalNcrg6WYFPWfAjzQPqHJBOyGjHc4AB4=;
        b=Vh/QPyMRlTIt/Rp841EHQT9pc5yWqw6MlVzWq67NHKDhiLIycbCVOiGlT9rkOB9+3+
         yQDt7nKZmSS8dtJWKjU2VyEMqJLkwszre4lu41cMwSu9D/O7mHnl+fyJDZZntYaL1XIp
         p6uY9TQKgwo5WJRXBGxNZtahRYv+Oj/8pi2EPGXHsXb7rcZZF+CWGK8NfvtCH+Gj+IS3
         WgznzI28reNbfEltsgpbcwmuErpGANxQe++yL+I6heQRKSSnEURX16QwUmakxl20ogHp
         4QXJ6m4yUKoVswqte/gZV9zrz3C/XePpUDpWqk6Buu0BhzHxlwbBXBdT+aB00b1T1Ici
         uIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576127; x=1779180927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Pp4q+m9WiUalNcrg6WYFPWfAjzQPqHJBOyGjHc4AB4=;
        b=RRUzGNLcNkJtnVrTyLUtd3DRKu6S0f0TIoLj5Uvf/1PDfTwm3nLyLbQDgA2a8xcgrr
         AntXdQAIkm/N1x1sfYCpGI4R4NjE8mXBbg+f2AyT8TtUtDwgr4BVzh+p39g+nKIgJUyz
         OxbT6USdVjCqSQ9KqPVsy9bVMCp+9KfWbKXR5pPeEmygaxPFUB22dnYVRoZA3u3GwctF
         siYHyIlhiHWgihNxZlX2tv2KRsmE71zBIRyocpurqHgWuADeOF40magIIFpjZkQyrI49
         zTJdiYBZQtwUPPDLYm6MsExRuR7bpyYAJZ0haHKOOV02Ay3K5O4M0kinWFSdngZc7i3e
         zV/g==
X-Gm-Message-State: AOJu0YzczrmmcmR0wKpXMM+cv8Oshgs6gpHm3hrAMuB1bmtYFscz6gLO
	bLCyXERTvAmb6DAOom1yJHMOjovl11jWvBUuu7Ad8N12IswfPpH0gtWxxGrbelqptoV1la69sGA
	UwcQIkKCDEmQZNYp8KmFr1QIU0BiZAX9h9P7OIgRiNsddyqshyiyzlIMi+QgzAk+6iQ==
X-Gm-Gg: Acq92OFEhv5mHKu4X8SgXNTDPEFGFKtf+w1StOpwUlqJ/dLmgZGWyvaarcJtvv9UEtO
	h3vUGTD41L9TuMEF6XvG427DVygXnoMVUFbEplvXCI6li4SpFEPcNm6p1KwFoBa9V0C8pGwHQLm
	4eGg7hsTMJxTS9a4S6ccXj+ujTvSZnZHGDPlabEx1ZE65q8oQ36f37BRBpNzxo3udKsjDElPdMX
	edo6PkkOlIj3IgOhACrDFYI2wBsDBM+8r0A1C2dqVTPa2YPzZKeOoIv2yh7FjTM9s3idXbhQx/F
	zIelJB7N453XLDThvwWy9S/NjDj4OA8v0PaT6ngTeaPk/J/xRMgEr28sh8YwMT7aKTNTdguFwUE
	NvqyWXFCu3xqY45SptY8tK5gljFdhj9bDIV5PGsOkFatMmqKdsaSzcF3atM6yxgIHqbk1tXtZ9U
	ZqXzO5GCpcGc7lDSuD0gWl
X-Received: by 2002:a17:902:e790:b0:2ba:bfc:76b5 with SMTP id d9443c01a7336-2ba78b40166mr289281185ad.4.1778576126964;
        Tue, 12 May 2026 01:55:26 -0700 (PDT)
X-Received: by 2002:a17:902:e790:b0:2ba:bfc:76b5 with SMTP id d9443c01a7336-2ba78b40166mr289280845ad.4.1778576126347;
        Tue, 12 May 2026 01:55:26 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e90854sm127641405ad.66.2026.05.12.01.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:55:25 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:55:11 +0800
Subject: [PATCH v7 2/6] media: qcom: iris: Add Long-Term Reference support
 for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-batch2_features-v7-2-4954e3b4df84@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
In-Reply-To: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778576115; l=16362;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=+jjoLi1geBfonyp8XtU8nugaD1xkWUl8LpP38hNPSFc=;
 b=NvAFYvpXRwOBda1gPLPkE7VO+X+NWuMTNZZ6qu7XzpBWN5Rc6JTOu6+YbqHJx2Kf9DHzKyTVc
 7EQYJ1Zt/KkADBZLXQN5Wdu9U2UmQ0/G077WFxrNIMc2q43QJFCPNaD
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a02eaff cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QunbDvX0_-zBgmAapgUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: yHUzkh7vXPY7NQMypOFv68KtWHnrmshP
X-Proofpoint-ORIG-GUID: yHUzkh7vXPY7NQMypOFv68KtWHnrmshP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5MCBTYWx0ZWRfX6MRFFesUO+Tj
 8kRAxb/mkOQ0dnqmUozM1fWNvUzxf80q6nyFz3IgmxVjVAGXfLodALTppXNEgD3pPmym2GxB/ef
 qcCoK2lhMzpee9h+WEvQklXSQy+8oHr07Z21jUPsjjppRdASuVzrAJXHrEvhiEXWlyPYLbs6D8x
 d9bp0zqEuE6WrC8oOVf3nPYz0k/facTPQNivcFsbW1VHe1N8gmqDbDSwarHQDd3PHwl+Dw9ie4Q
 bJ1QCU1kqS+fXnaaUJQup2CTB5w2NQtIT0m9tRuHSFqlSho/NnXBRX8NILKtyGwFz5p59bml8f9
 oFqAlo3AlaUmAGduvCcMKrPP2nBKO9SdUihL8EP2GKxMtIlAfyqBCTypKmch7wYzAqM1NhCRSsV
 49AurtGDF02g9RrnqpBe3PzAx8XRJaH9Vi0cXGfV70gH6bVP6QLnKBZvcrjrrqYqc8XGLqcQ3nX
 smoPSckIlzQT074+b6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120090
X-Rspamd-Queue-Id: 0811251D7F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61221-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add Long-Term Reference(LTR) frame support for both gen1 and gen2
encoders by enabling the following V4L2 controls:
V4L2_CID_MPEG_VIDEO_LTR_COUNT
V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 128 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   5 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   |  30 +++++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  25 ++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  24 ++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  30 +++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_platform_common.h      |   6 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  20 +++-
 9 files changed, 267 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 287cfc53294169cf5b75375105abc3c8c2d2a551..87d10ce1a9a572c5242d425b5a02abba01f911b5 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -112,6 +112,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return IR_TYPE;
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
 		return IR_PERIOD;
+	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
+		return LTR_COUNT;
+	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
+		return USE_LTR;
+	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
+		return MARK_LTR;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -213,6 +219,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
 	case IR_PERIOD:
 		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
+	case LTR_COUNT:
+		return V4L2_CID_MPEG_VIDEO_LTR_COUNT;
+	case USE_LTR:
+		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
+	case MARK_LTR:
+		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
 	default:
 		return 0;
 	}
@@ -1033,6 +1045,122 @@ int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 					     &ir_period, sizeof(u32));
 }
 
+int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 ltr_count = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_mode ltr_mode;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_mode.count = ltr_count;
+	ltr_mode.mode = HFI_LTR_MODE_MANUAL;
+	ltr_mode.trust_mode = 1;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_mode, sizeof(ltr_mode));
+}
+
+int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_use ltr_use;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_use.ref_ltr = inst->fw_caps[cap_id].value;
+	ltr_use.use_constrnt = true;
+	ltr_use.frames = 0;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_use, sizeof(ltr_use));
+}
+
+int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_mark ltr_mark;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_mark.mark_frame = inst->fw_caps[cap_id].value;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_mark, sizeof(ltr_mark));
+}
+
+int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 ltr_count = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	if (inst->hfi_rc_type == HFI_RC_CBR_VFR ||
+	    inst->hfi_rc_type == HFI_RC_CBR_CFR ||
+	    inst->hfi_rc_type == HFI_RC_OFF) {
+		inst->fw_caps[LTR_COUNT].value = 0;
+		return -EINVAL;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &ltr_count, sizeof(u32));
+}
+
+int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_val = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count || hfi_val == INVALID_DEFAULT_MARK_OR_USE_LTR)
+		return -EINVAL;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index a0d5338bdc910bd30407132e8b700c333ad74e4c..996c83fdc6f492dc252771129fc1d62e8b7a7e07 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -36,6 +36,11 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 9344d20042fd4dd5ed123463a93188f36efbd137..6db693a602aca296f032dfc31987071f8e15bd1c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -243,6 +243,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_ir_period_gen1,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_LTRMODE,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen1,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN1) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = 0,
+		.max = (MAX_LTR_FRAME_COUNT_GEN1 - 1),
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_mark_ltr,
+	},
 };
 
 static const u32 sm8250_vdec_input_config_param_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 051ba0d157c77263ea57b15296c86f61629621de..a441c897aaabdf1ecae37d34032cd22d4f987233 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -695,6 +695,31 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
+		struct hfi_ltr_mode *in = pdata, *ltr_mode = prop_data;
+
+		ltr_mode->mode = in->mode;
+		ltr_mode->count = in->count;
+		ltr_mode->trust_mode = in->trust_mode;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_VENC_USELTRFRAME: {
+		struct hfi_ltr_use *in = pdata, *ltr_use = prop_data;
+
+		ltr_use->frames = in->frames;
+		ltr_use->ref_ltr = in->ref_ltr;
+		ltr_use->use_constrnt = in->use_constrnt;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_use);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME: {
+		struct hfi_ltr_mark *in = pdata, *ltr_mark = prop_data;
+
+		ltr_mark->mark_frame = in->mark_frame;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 04c79ee0463d7f32a2042044fe4564718cc01561..34249fc0d047918c2463517b8303e30df3666b97 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -147,8 +147,16 @@
 #define HFI_INTRA_REFRESH_RANDOM		0x5
 
 #define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
+
+#define HFI_LTR_MODE_DISABLE			0x0
+#define HFI_LTR_MODE_MANUAL			0x1
+#define HFI_LTR_MODE_PERIODIC			0x2
+
+#define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
+#define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
+#define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
 
 struct hfi_pkt_hdr {
@@ -460,6 +468,22 @@ struct hfi_intra_refresh {
 	u32 mbs;
 };
 
+struct hfi_ltr_mode {
+	u32 mode;
+	u32 count;
+	u32 trust_mode;
+};
+
+struct hfi_ltr_use {
+	u32 ref_ltr;
+	u32 use_constrnt;
+	u32 frames;
+};
+
+struct hfi_ltr_mark {
+	u32 mark_frame;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 401519fef0e2e87152e3c7fd7080490e9659d60d..495327160ec292f5fdc8f9532054c58046a10250 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -715,6 +715,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen2,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN2,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen2,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN2) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_USE,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.max = (MAX_LTR_FRAME_COUNT_GEN2 - 1),
+		.step_or_mask = 1,
+		.value = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.hfi_id = HFI_PROP_LTR_MARK,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index cecf771c55dd36a13616344ff4583bf1d0544e17..aec19efc41a5ef47bbad2471d3c4575704859743 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -71,6 +71,9 @@ enum hfi_rate_control {
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
 #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
+#define HFI_PROP_LTR_COUNT			0x03000134
+#define HFI_PROP_LTR_MARK			0x03000135
+#define HFI_PROP_LTR_USE			0x03000136
 #define HFI_PROP_TOTAL_BITRATE			0x0300013b
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6a108173be3548af9868697c2557e353136d147d..2f4392e6a42ea9280d48ae46791277394b2f3be8 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -28,6 +28,9 @@ struct iris_inst;
 #define MAX_QP_HEVC				63
 #define DEFAULT_QP				20
 #define BITRATE_DEFAULT			20000000
+#define INVALID_DEFAULT_MARK_OR_USE_LTR		-1
+#define MAX_LTR_FRAME_COUNT_GEN1		4
+#define MAX_LTR_FRAME_COUNT_GEN2		2
 
 enum stage_type {
 	STAGE_1 = 1,
@@ -151,6 +154,9 @@ enum platform_inst_fw_cap_type {
 	VFLIP,
 	IR_TYPE,
 	IR_PERIOD,
+	LTR_COUNT,
+	USE_LTR,
+	MARK_LTR,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 9270422c16019ba658ee8813940cb9110ad030a1..891aed5091c7a0fd0bf1f1a3a7737d49e6d8cea2 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -934,6 +934,19 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 				  num_vpp_pipes, inst->hfi_rc_type);
 }
 
+static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
+{
+	u32 num_ref = 1;
+	u32 ltr_count;
+
+	ltr_count = inst->fw_caps[LTR_COUNT].value;
+
+	if (ltr_count)
+		num_ref = num_ref + ltr_count;
+
+	return num_ref;
+}
+
 static u32 iris_vpu_dec_partial_size(struct iris_inst *inst)
 {
 	struct v4l2_format *f = inst->fmt_src;
@@ -968,7 +981,7 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
 {
 	u32 height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 width = iris_vpu_enc_get_bitstream_width(inst);
-	u32 num_recon = 1;
+	u32 num_recon = hfi_buffer_get_recon_count(inst);
 	u32 lcu_size = 16;
 
 	if (inst->codec == V4L2_PIX_FMT_HEVC) {
@@ -1677,10 +1690,9 @@ static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
 {
 	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
-	u32 num_ref = 1;
+	u32 num_ref = hfi_buffer_get_recon_count(inst);
 
-	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref,
-				       false);
+	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref, false);
 }
 
 static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)

-- 
2.43.0


