Return-Path: <linux-media+bounces-63161-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNIiNwzOG2prGQkAu9opvQ
	(envelope-from <linux-media+bounces-63161-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:58:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E8A614A08
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06116306572D
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 05:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD04E3264EA;
	Sun, 31 May 2026 05:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLnXbKzl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OVoM6Kx/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296173093C6
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206948; cv=none; b=rv212SayChNTFGCXMYiYirUSwZN/0yTIAjiPBCZSOfEy4jBqmRKqfTXABzs9v70JPDrjMe07vI5xQa+9vIPwS7oNb1MYHWLW/T+3WPNqvLWlyYfmx552UVgT7MEw6EHBPFfSxuZWeeOPm060AE5QXYoSIYguZvIv0Da3oHp75fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206948; c=relaxed/simple;
	bh=GAAkIIXQjYZWxC6zM1mlm9QigG1B8h92fJVsYMtHq4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o1mAwASRZ4xuFz4WY6q9A2iHMcE54lNwU2EB8n9BxLBrOHhU0d2ksbwzeajhBdN788bGw4BjYr7oyLgJcYDp3m82p23fgt67y+kj02GTj5IUByq49CEhHvmtSNqxWnkH6HpdszCr7qaWy+OuCP829kvHaZtSqVcwzj7r+lZSnxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLnXbKzl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OVoM6Kx/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UKhISX2514076
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXD5gNIRtvmr4+Do3wK68iROsdsaJkUKKy74Ap4MRV8=; b=kLnXbKzlwyN7Ykqc
	yrh4wD6vfzhwZqdC9Ea9+0Ez6f3XZar9CRdsMyD6oh4Ol79sSt0fqu/Kew7hELJM
	WEg9tYwThhSK/3QlEKfTpzfHFEd9Wacg94nNZZ2NhrOjmeDd1yC2EUAQGt4bmK78
	n1wM12IgNzIi8BA8uer46L/W+Chg+u3vd4U8nzKilhDEs9asiQ4Bt4vmq/PfXVdy
	g1QP4g//GarbqiTKMuSTQpeR8ZTMjRYzNAWoqZMwhs5AHCQa19rpgVowbKosjIz+
	C5SpTnYsmcSkN6qOHNObDEyoHTcAVUtW+SNfLiccwQe87Rny6LlF+0LsZepOihTN
	nPToMg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr41ax75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0bf6904a6so6725765ad.1
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 22:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206946; x=1780811746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXD5gNIRtvmr4+Do3wK68iROsdsaJkUKKy74Ap4MRV8=;
        b=OVoM6Kx/7QyN+S0TEos07JyMHPSG7ZDiyQaKD+ECnBZb6fKqJAuX9snM+/bllztx2y
         DyTtp+7Qnhc+p6HkqSZv2vYo+dHHAjnKqd658g6KYSZ0PBT58Hz8Iw+pBsl+7cY73ng0
         17Ec2P6G59bcZ//UCZ51G4fk6oubj8Wflq9pC1jjNoOsXmflZJLHt/7Ka4UiAH6Bp7Rx
         wSW3AIA9ZmV8DWEvi2Q3XxxuIf59m7z7uOJsWRwkCes2xjeutWNDETqCHx421kOXjcoG
         kRB00udvEIhWAsher4MXXMcKcOICXLtMYhw9+u/BPamrpAGMquQdg+Pecu+DEJg1ksTV
         K58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206946; x=1780811746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FXD5gNIRtvmr4+Do3wK68iROsdsaJkUKKy74Ap4MRV8=;
        b=KPkJ0N9RZdOHb2b1gag44KHwy8N9tpVMo1/sg2TvqRzxhuvDivpUqIR7TmdCsu9+OM
         aU5N+25iGbAxHMK7TXSPmVyNflis8K0TKuruMmpQdTawTlk4QS3QX/4lHiCIksi9uCPM
         /2tKTTU9dv5zp6yzoHJ81AZkJHum6JN4I7NLWV7HzX2yMZhkjGGZCHafZdeauNhSPBQu
         rtGqVuf41Dx42fYjky06FDM+3GfZhMdiQwjSUeJPgmf9JDGu3NP1U4LsSEcC/f7vBLfK
         nBejP66xanGWvvZr6oFzE4ER2rNaGXtuoScYa0WhxXAWTLd/tcP8gOy6UCZZhRpVSoZZ
         WAXQ==
X-Gm-Message-State: AOJu0YzMixpYL0lopKw/5CyWj/TBViHChtd42cTWV2mUPHtV9grYSXlz
	6+j5tNNZrxl19NSK8OwZWP/eqkZNBrGPNiICqcVTRD3SHa6mqe7b+MeQLeRPNuaYWoVRCmyzSPO
	xHQsX0UR0nIrZ2vkvnQnw1q/VXjiuGc8QZHN4UBs2OdY+2HMzL89wHS/yVJULWzXqrA==
X-Gm-Gg: Acq92OHFY2+WXn8LGDe5F2v98OXJnuvo1+VAvyZfnFy3KzV5D2YeZQWEV3wSdP8TISh
	fOb39Ww5nlHXtzXDgMUAnGG8tELfIGx0maVlDwDAdht6U9BG8lD0PjRxLxmaV1UjmyB3JCYtx8P
	dn7GpWuLIKqg3GtSE/3evQujNXeXix4FP7ew9+gYwPT7eyBL43dG1Wl4Q1IQYgjjwAtjGaBLweQ
	TV+bQhU8WaFs3uGnrpbD51jk/5i8w6+x4KhtmhKLdDkfupKm3MKuy+fw5rHDLoD2/OI3bKMG4CK
	Y2xnWpDgbW30AmYMv1p7qNX8/29VV4hZBeMX/tt68gO+QXK0i6N8y/bYdtCKmGav4Y0JMABHvvo
	dTUFPfU5AEz+Gv+izp3ksEZp45gZSdHLexZJ3PLx4v9YorO8Lncs21Wo67eCULI0kEA==
X-Received: by 2002:a17:903:2f05:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2bf367b1670mr72469415ad.2.1780206945814;
        Sat, 30 May 2026 22:55:45 -0700 (PDT)
X-Received: by 2002:a17:903:2f05:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2bf367b1670mr72469165ad.2.1780206945385;
        Sat, 30 May 2026 22:55:45 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:55:45 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:20:38 +0530
Subject: [PATCH v3 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-iris-code-improvement-v3-4-4c699c3dd719@oss.qualcomm.com>
References: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
In-Reply-To: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=1375;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=aqhs4jaqkXidlgjr5SFVJnDOR/verJ9BG22AWDOERv8=;
 b=fBrM22ZPdY7kkmJhmuG30GdvcjhBdE1aNrF8V8DZcDUn5/mV/L0n3klpalCLskDNABeLyMmaq
 j3SlJUD5JI+AI2Chvgb2tcNg297mCrmG95ZGw3yXBwMxBkKgO/QesQp
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=fOEJG5ae c=1 sm=1 tr=0 ts=6a1bcd62 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7A-KeLSbcoVXy4yL1OsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: SFc8JEoaOlY9_xlblduvK7HLqL-QqRuF
X-Proofpoint-GUID: SFc8JEoaOlY9_xlblduvK7HLqL-QqRuF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfX+1oxQ8NTXEet
 nVuHFphlmY1ZO+3JGC/+4a3a66LpIrtYd/7FrMgqRKXy4Dik0lN35EqLyxfsMuTYvYoO6e4BJN/
 ypr20mcasgfW5YIdaGWMF0nm2IsCSsp23+O6YXetPwUfX7zejZW1KlQLRpJif1Xo/TCcbGAGjq7
 npICQ8+So/dpnbgyFXLQN84IrwoFDQX3dE8TedSHSRM+gn5YtSWGHgQVw+VnfJtHJpwg/ZjffXp
 RvH7Cu53rN+OV2hDLYeXEz3KrkiVsoID3eSMj/Y5cmdJQHFozplKwj8d4ZtS0EZsbPc8URS1RZd
 CMOQW+RnBi8dVqQDoLMcd8xRUWSHu7H0ug9kVjhhFbdV3qfrecUVv+Va0yj6lp8/0YEvKckc6zB
 LXqKNXws/ZfnFOeqbUjiGAUBcmRFqe/S1gXf9Hr1+fuZ+bv7Kb6qH3zF9r+NMl3Kc2jIbgdpw58
 N/R55kT+wbjD9AHMKrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63161-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41E8A614A08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Fold the ternary initialiser directly into the variable declaration,
removing the dead store that was immediately overwritten.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index c90b22a75bc5..fe67ad0ffb4f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -536,10 +536,9 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 tier = inst->fw_caps[TIER].value;
+	u32 tier_cap = (inst->codec == V4L2_PIX_FMT_AV1) ? TIER_AV1 : TIER;
+	u32 tier = inst->fw_caps[tier_cap].value;
 
-	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
-							inst->fw_caps[TIER].value;
 	inst_hfi_gen2->src_subcr_params.tier = tier;
 
 	return iris_hfi_gen2_session_set_property(inst,

-- 
2.34.1


