Return-Path: <linux-media+bounces-59754-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJKNJTsx8GltPgEAu9opvQ
	(envelope-from <linux-media+bounces-59754-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 06:02:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9197847D4B3
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 06:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72F683040450
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 03:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66ECD33F5A8;
	Tue, 28 Apr 2026 03:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMqO6xr9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SNLPbgum"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0AA33D4E4
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348630; cv=none; b=HrCVxy4lX5T1isgKNMY3HGDn58jp9DpYs8S0/0put9rlABt80qdmAdEQzWMgtQCk9cNyhuOgsFS92AG1hotia+MKiQ3DO0n8fNCKB86wlnIDieQUUUpyY6L0+ufGWI9g5AcJv9ZYEJXguPjxq0g5OT0w76sgKKs59VceV0uigzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348630; c=relaxed/simple;
	bh=yXxIUMbwRxMABCGjVIR7TpLcAseI+8GQJ4r/4Bl8Qow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7aEN5j2BYlemvUSW23/bb1lBr9mfe/MYXcpA8U4chpMQC7PgxY742ldLWR3H0TeuVcEpQzQw9DH6cwRt8yU4//xrH4EM6vas1O+95kB4C3wPMdsn3B4kXM0OigFbpfQTlpmLTIRaYx+SIAH+dSxPY2bTKOd2OU0FLqRPAna8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMqO6xr9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SNLPbgum; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJ013Z2006325
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWdgJZns+NnF8pzUEhG2MpG4641DiTRaUryPkckm208=; b=PMqO6xr9CPU1Wq8n
	SJyshVN0O8Xlj9PIl1MwnZbWf7YJ9j90SYr+3MxosFLewO9qZt8ewA5+R2aFKdPc
	Fu3Sl/HiD4eKeAUlSVGE6S4GXit1cxcYGbYe9qFhvjtYV3dyCqz1THV+ictuHX5u
	zuhwMbePEJOvd+hHbA3ZoY2CDGeS+vyqJrBZspQFRuFstGxi456f50xowwKY7zJ5
	qaoAa/uj4K0y1uKXC3De/S06G8sqEgVwQIIebMg72X0gdlnC2t5Q5C/A3fzQWH6O
	8ETeoppdvYL0Z8/7AyTLcEaNSYt16VZsX/qimuzByR4rA1JDtIGiQ73BYvygupJ6
	M18UKg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkk7fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:57:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da8eb0553so12643115a91.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348627; x=1777953427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWdgJZns+NnF8pzUEhG2MpG4641DiTRaUryPkckm208=;
        b=SNLPbgumNWRoP5AkJAKklagmKxqpUVSi6zGiIa9+fgNHzHj6JmWW8fg4RETa7eAn3V
         YpyxRNXl1igZ3JYX8CWKzMawk7WCbkErjnMRcAJ9p2Bbn/zeyTkdo+HbgN3W/TDRyAPB
         EhTtdkQpWwDFVoEGRve/VZL//mhkl5DDKVz+ZALY8jCbN6h300Y0k/+uNpql62LjFwWD
         eWOEwUR022a+KVRwQcmlnfjG9UANKI19LMObsqXNCJUtj1QoUsDPlKoMJT02IPrqct28
         af8VEmfQ/7YoHHdywj9VRa4LHta8Lyew9tcyVgU+0/3GpactID8FY3+/CKl8E/SVIV8C
         wGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348627; x=1777953427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWdgJZns+NnF8pzUEhG2MpG4641DiTRaUryPkckm208=;
        b=H44ZrFuBkp3cvEeT6WbpUfCzGvPH8vdKaEMZ8vK1sOVVQBuAGkOkkjA3lTi+gW/FLC
         0Wyum4cI8UmdbX9VMvf1by9Dy2AANrD9Iqqpf/aFs8M0PA6+OX/xKspdxYlwfo3/9kpY
         MRxqdeG0qT8b5L62XPyqv1tn/SHAfC5H+ggA/J90iCVRhrwAaJjMKJ6YRguvrdvUon/u
         wZmCExokMBt8lU7AJ3TbKqoRGEta9lSM0l0abcQvz7RHZ+dCW+8cH5yUmkUk7KMAWkbr
         Dot9yI4JYyKsdy0nT0CkFcelYUTd0ZcahZRZbx/woZ8/MQhQHdx8P+DpaMY43bqp/k2V
         7MNQ==
X-Gm-Message-State: AOJu0YyMfMNJSGS7b24es/TJAVbCLu3sUlcSLc6E/GV9Up80pQCR2jcz
	MfV7tTsKOJgHjiA2o+ZefO+nws+47RARDALiShoLjk8pT58Nyxe7YRkv8x93w3LaP/Cin/iKZ5n
	x2xExciJm+e87JFRDwpA4x5wpE3H4Acagy6Bs3AqttTyZilJTQXfvb1XC9gopd5iyZQ==
X-Gm-Gg: AeBDievA2jYW6mZIk56TwX+eK6wfTXUeFQPtwykqPcWjIDNMC5pO7RHZt7b+oaAEyhK
	ai+2HK8ff7cO/fZekYwxxXhCrURIMZIyd8sViWBAFaTDSeZQV2TPbW/Cb8bXEmG4uxIBzvEE7f9
	9phAg7jY4b10Mjv2ZKSp2eO70o/Zql/w6/L7VxmqI8z9doPDR33KE5l4upxexuMxyVUcFgSOZll
	I34VrCiHGlFOSF5pB4EXh3aCuJZSXgdENzR0K2lasqcbFBIGpPngzELYbcO9phcfbaRTFFA0KhF
	JQZ1gYszME06MQaNlrl9U/veHitKqKbxhGqKZY6PrYHjvcTyBv073bNFGx3+kFvpXEhHyV9GURu
	hVlOa6qhXV5gS1Ovtp18SHd/iuo7FilvLuSOhlrTZh2/E3t2vSbYsi6n+kFGDtZ9b0g==
X-Received: by 2002:a17:90b:48:b0:35f:c493:cac5 with SMTP id 98e67ed59e1d1-36491af88e9mr1374132a91.16.1777348626963;
        Mon, 27 Apr 2026 20:57:06 -0700 (PDT)
X-Received: by 2002:a17:90b:48:b0:35f:c493:cac5 with SMTP id 98e67ed59e1d1-36491af88e9mr1374115a91.16.1777348626446;
        Mon, 27 Apr 2026 20:57:06 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:57:06 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:16 +0530
Subject: [PATCH v3 10/12] media: iris: Add support to select core for dual
 core platforms
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-10-8f28930f47d3@oss.qualcomm.com>
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=13630;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=yXxIUMbwRxMABCGjVIR7TpLcAseI+8GQJ4r/4Bl8Qow=;
 b=3P81yvcdwmoK+f3EQxNcrrCCNdvVhyfIUuKoqrnY+f+58kFTy830j81tytMW066xRfg9TSaZF
 RHwx4TWFTJCBXhrxuZsp1hYjbTtBji/1zAILlZEKeGdWZbKyiGp+mmo
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: -oBY89_ZUmnWXCVoV39_t1HdRj1nStBr
X-Proofpoint-ORIG-GUID: -oBY89_ZUmnWXCVoV39_t1HdRj1nStBr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfX4E0AXdNnnISp
 u1aLAs74kc9BtQWdWvvGHTTz9/Pz8xu+s2NCuJh0dIbQp7uAijMkPt3N6T2T20QgXcVpAg/6uqi
 uoQPCTor9697sGLt/lByP6ncCspWox3bBbml2yxZOwKqmE4QYi7rZQnz9E5hRhNLOcGpGLwlNi/
 UsDO/N77RcSvQfnYBRADwRBqnNru6oCwvkP5m83l62LHAZyXP9hW1Wss4y9/7aUdhmdDRClLvh1
 VS505a0gL/4DzfW6DC7NXC7KfMf5NTtfe6p5yu+MIdeI3uvg1Kmq4tWOyaRyguTYeDsJOKOca2u
 GQnB64ZrQwCm1PYY5nusmznIBn3lPoknigiS1jIIFWR+kn1u8yFPdjXxaohaKq9b5NccU3b78g3
 JsIkSG4kHQCUOS5gESyRk9t/aMJqzgwU6wZylBKcoypnPv9oaVnsoGucFYczCHX9YLypphzEq6E
 hPTVNBMlhDMchuZB+ZA==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69f03014 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SR9mA3E-jA3Ceylw1tAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280033
X-Rspamd-Queue-Id: 9197847D4B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59754-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On platforms with dual vcodec cores, select the hardware core for a
session based on current load. Assign the session to vcodec0 if its
MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
the selected core to firmware using the new HFI_PROP_CORE_ID property.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_common.c     | 10 +++
 drivers/media/platform/qcom/iris/iris_common.h     |  1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 +++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 drivers/media/platform/qcom/iris/iris_power.c      | 11 ++-
 drivers/media/platform/qcom/iris/iris_utils.c      | 91 +++++++++++++++++-----
 drivers/media/platform/qcom/iris/iris_vb2.c        |  4 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  6 +-
 12 files changed, 129 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 7f1c7fe144f7..3b3fc482e194 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -46,6 +46,16 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	inst->metadata_idx++;
 }
 
+int iris_set_core_id(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+
+	if (!inst->core->iris_platform_data->dual_core)
+		return 0;
+
+	return hfi_ops->session_set_core_id(inst, inst->core_id);
+}
+
 int iris_process_streamon_input(struct iris_inst *inst)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_common.h b/drivers/media/platform/qcom/iris/iris_common.h
index b2a27b781c9a..34e32c60f768 100644
--- a/drivers/media/platform/qcom/iris/iris_common.h
+++ b/drivers/media/platform/qcom/iris/iris_common.h
@@ -11,6 +11,7 @@ struct iris_buffer;
 
 int iris_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf);
 void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
+int iris_set_core_id(struct iris_inst *inst);
 int iris_process_streamon_input(struct iris_inst *inst);
 int iris_process_streamon_output(struct iris_inst *inst);
 int iris_session_streamoff(struct iris_inst *inst, u32 plane);
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index b396c8cf595e..54a8649841e4 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -30,6 +30,11 @@ enum domain_type {
 	DECODER	= BIT(1),
 };
 
+enum iris_vcodec_core_id {
+	IRIS_VCODEC0 = 1,
+	IRIS_VCODEC1,
+};
+
 /**
  * struct iris_core - holds core parameters valid for all instances
  *
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 3edb5ae582b4..fbaf852a6b99 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -124,6 +124,7 @@ struct iris_hfi_command_ops {
 	int (*session_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_close)(struct iris_inst *inst);
+	int (*session_set_core_id)(struct iris_inst *inst, u32 core_id);
 };
 
 struct iris_hfi_response_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..9d9fae587297 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1300,6 +1300,24 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 					inst_hfi_gen2->packet->size);
 }
 
+static int iris_hfi_gen2_set_core_id(struct iris_inst *inst, u32 core_id)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 payload = core_id;
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_PROP_CORE_ID,
+					     HFI_HOST_FLAGS_NONE,
+					     HFI_PORT_NONE,
+					     inst->session_id,
+					     HFI_PAYLOAD_U32,
+					     &payload,
+					     sizeof(u32));
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
 static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
@@ -1317,6 +1335,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.session_drain = iris_hfi_gen2_session_drain,
 	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
 	.session_close = iris_hfi_gen2_session_close,
+	.session_set_core_id = iris_hfi_gen2_set_core_id,
 };
 
 void iris_hfi_gen2_command_ops_init(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index cecf771c55dd..600e9dc07669 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -56,6 +56,7 @@
 #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
 #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
 #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
+#define HFI_PROP_CORE_ID			0x030001a9
 
 enum hfi_rate_control {
 	HFI_RC_VBR_CFR		= 0x00000000,
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..dd341ca5be57 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -37,6 +37,7 @@ struct iris_fmt {
  *
  * @list: used for attach an instance to the core
  * @core: pointer to core structure
+ * @core_id: specifies the hardware core on which the session runs
  * @session_id: id of current video session
  * @ctx_q_lock: lock to serialize queues related ioctls
  * @lock: lock to seralise forward and reverse threads
@@ -79,6 +80,7 @@ struct iris_fmt {
 struct iris_inst {
 	struct list_head		list;
 	struct iris_core		*core;
+	u32				core_id;
 	u32				session_id;
 	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
 	struct mutex			lock; /* lock to serialize forward and reverse threads */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8995136ad29e..502d7099085c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -258,6 +258,7 @@ struct iris_platform_data {
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
 	u32 core_arch;
+	bool dual_core;
 	u32 hw_response_timeout;
 	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
index 91aa21d4070e..0e116c63f529 100644
--- a/drivers/media/platform/qcom/iris/iris_power.c
+++ b/drivers/media/platform/qcom/iris/iris_power.c
@@ -77,9 +77,9 @@ static int iris_vote_interconnects(struct iris_inst *inst)
 
 static int iris_set_clocks(struct iris_inst *inst)
 {
+	u64 vcodec0_freq = 0, vcodec1_freq = 0;
 	struct iris_core *core = inst->core;
 	struct iris_inst *instance;
-	u64 freq = 0;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -87,11 +87,14 @@ static int iris_set_clocks(struct iris_inst *inst)
 		if (!instance->max_input_data_size)
 			continue;
 
-		freq += instance->power.min_freq;
+		if (instance->core_id == IRIS_VCODEC0)
+			vcodec0_freq += instance->power.min_freq;
+		else if (instance->core_id == IRIS_VCODEC1)
+			vcodec1_freq += instance->power.min_freq;
 	}
 
-	core->power.clk_freq = freq;
-	ret = iris_opp_set_rate(core->dev, freq);
+	core->power.clk_freq = vcodec0_freq > vcodec1_freq ? vcodec0_freq : vcodec1_freq;
+	ret = iris_opp_set_rate(core->dev, core->power.clk_freq);
 	mutex_unlock(&core->lock);
 
 	return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index cfc5b576ec56..add57632fdbf 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -90,40 +90,95 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
 	return NULL;
 }
 
+static u32 iris_get_mbps(struct iris_inst *inst)
+{
+	u32 fps = max(inst->frame_rate, inst->operating_rate);
+
+	return iris_get_mbpf(inst) * fps;
+}
+
+static void iris_get_core_load(struct iris_core *core, u32 *core_load, u32 *core_session, bool mbpf)
+{
+	bool dual_core = core->iris_platform_data->dual_core;
+	struct iris_inst *inst;
+	u32 load;
+
+	core_load[0] = 0;
+	core_load[1] = 0;
+	core_session[0] = 0;
+	core_session[1] = 0;
+
+	list_for_each_entry(inst, &core->instances, list) {
+		if (mbpf)
+			load = iris_get_mbpf(inst);
+		else
+			load = iris_get_mbps(inst);
+
+		if (inst->core_id == IRIS_VCODEC0) {
+			core_load[0] += load;
+			core_session[0]++;
+		} else if (dual_core && inst->core_id == IRIS_VCODEC1) {
+			core_load[1] += load;
+			core_session[1]++;
+		}
+	}
+}
+
+static int iris_select_core_id(struct iris_inst *inst, u32 *core_load, u32 *core_session,
+			       u32 max_load, u32 new_load)
+{
+	u32 max_session = inst->core->iris_platform_data->max_session_count;
+	bool dual_core = inst->core->iris_platform_data->dual_core;
+	u32 core_index;
+
+	core_index = (core_load[0] > core_load[1] && dual_core) ? 1 : 0;
+
+	if (core_session[core_index] >= max_session)
+		core_index = core_index == 0 && dual_core ? 1 : 0;
+
+	if (core_session[core_index] >= max_session)
+		return -ENOMEM;
+
+	if (core_load[core_index] + new_load <= max_load)
+		inst->core_id = core_index == 0 ? IRIS_VCODEC0 : IRIS_VCODEC1;
+	else
+		return -ENOMEM;
+
+	return 0;
+}
+
 int iris_check_core_mbpf(struct iris_inst *inst)
 {
+	u32 max_core_mbpf = inst->core->iris_platform_data->max_core_mbpf;
+	u32 core_mbpf[2], core_session[2], new_mbpf;
 	struct iris_core *core = inst->core;
-	struct iris_inst *instance;
-	u32 total_mbpf = 0;
+	int ret;
 
 	mutex_lock(&core->lock);
-	list_for_each_entry(instance, &core->instances, list)
-		total_mbpf += iris_get_mbpf(instance);
+	inst->core_id = 0;
+	iris_get_core_load(inst->core, core_mbpf, core_session, true);
+	new_mbpf = iris_get_mbpf(inst);
+	ret = iris_select_core_id(inst, core_mbpf, core_session, max_core_mbpf, new_mbpf);
 	mutex_unlock(&core->lock);
 
-	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
-		return -ENOMEM;
-
-	return 0;
+	return ret;
 }
 
 int iris_check_core_mbps(struct iris_inst *inst)
 {
+	u32 max_core_mbps = inst->core->iris_platform_data->max_core_mbps;
+	u32 core_mbps[2] = {0, 0}, core_session[2], new_mbps;
 	struct iris_core *core = inst->core;
-	struct iris_inst *instance;
-	u32 total_mbps = 0, fps = 0;
+	int ret;
 
 	mutex_lock(&core->lock);
-	list_for_each_entry(instance, &core->instances, list) {
-		fps = max(instance->frame_rate, instance->operating_rate);
-		total_mbps += iris_get_mbpf(instance) * fps;
-	}
+	inst->core_id = 0;
+	iris_get_core_load(inst->core, core_mbps, core_session, false);
+	new_mbps = iris_get_mbps(inst);
+	ret = iris_select_core_id(inst, core_mbps, core_session, max_core_mbps, new_mbps);
 	mutex_unlock(&core->lock);
 
-	if (total_mbps > core->iris_platform_data->max_core_mbps)
-		return -ENOMEM;
-
-	return 0;
+	return ret;
 }
 
 bool is_rotation_90_or_270(struct iris_inst *inst)
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index bf0b8400996e..5a05f7d65501 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -176,6 +176,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret)
 		goto error;
 
+	ret = iris_set_core_id(inst);
+	if (ret)
+		goto error;
+
 	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
 		if (inst->domain == DECODER)
 			ret = iris_vdec_streamon_input(inst);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bd38d84c9cc7..eb167cede4c0 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -41,16 +41,20 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
 
 static void iris_add_session(struct iris_inst *inst)
 {
+	u32 max_session_count = inst->core->iris_platform_data->max_session_count;
 	struct iris_core *core = inst->core;
 	struct iris_inst *iter;
 	u32 count = 0;
 
+	if (inst->core->iris_platform_data->dual_core)
+		max_session_count *= 2;
+
 	mutex_lock(&core->lock);
 
 	list_for_each_entry(iter, &core->instances, list)
 		count++;
 
-	if (count < core->iris_platform_data->max_session_count)
+	if (count < max_session_count)
 		list_add_tail(&inst->list, &core->instances);
 
 	mutex_unlock(&core->lock);

-- 
2.34.1


