Return-Path: <linux-media+bounces-61695-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ja9KgIMB2oLrAIAu9opvQ
	(envelope-from <linux-media+bounces-61695-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:05:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2329254F097
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2616731265D8
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92E7481ABD;
	Fri, 15 May 2026 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G4jVhYSf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNinHipR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91450481FD7
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845709; cv=none; b=Snh1se05zPB4i25jZbc8yYW+zSIZ8FE2JgA4ARnk/Sf9ccWC3RPf6dN2MdDX59w7kaN+EwZlAPhAou8Oy/uiOxgRWr9UFET+tUO6xYthWsAfy2CpXl6VXo+hxuikknN7dXJl+Y50nTMKp7KAJK23RjRjgtQ1JO8V+p43KFDQn6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845709; c=relaxed/simple;
	bh=PZMTLxLwbvZOwA8LX8WRjQ2jAtxisx1shd7n6n36z4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kx1Xo4ZUnzk56/3MPQFaHndW6TSR5WWVENGQAoFgeggIpazUd56an+Fk07S69zAz+YvYaEhoeCcuw72tjL5/GBBeM/66BZACtbwIshk0jBzMMmmUo7B0hfCNwHsfD6yY5ZEvi0Fr6WZmMF++USwoG30J6c1fOP2rmzXNfDD5Ins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G4jVhYSf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNinHipR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB3pnG2676218
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=; b=G4jVhYSfQ84ZVdW2
	tx/VeMsX6Ad/DFD+4cCp4rwjNY2QbotmXxorBSrjJ7FB/KjmPBwUYfCdxla1bpYZ
	VqlhHZosF478JDOQV3hlLS91fjl+I1zxFc4aiiFkpQY2S6lmcEzCtEO4K6G4rLC2
	E0W/YCo/SOhcxKOhtKyUBFt3P5DrS+wU+lT52o5ReH3a4LieHPmuiaExSqqY75br
	tHh52PSVX2pkoHbOF0rJbVoYqZPzZmCf++drg0XKANUmLVgoKyYE2jCMezsIDITs
	heJmaROE7nQVMWUj0Rpk1uv8GHUpuzgDbeYH59+KpCTvCtRANk5JXUwo7EBz/E92
	D2BX1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vu44e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514cbe73d00so121230541cf.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845701; x=1779450501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=;
        b=PNinHipRpYOYUT1actZl2axOxu79d9+41JLqetriOYGHLQO2znaOwxWmD1Qua0m7dJ
         5g1Oa6xGhOsjehK9boO03bZavFI4pRHm75aG6LAvmHtzhy0h47FTNsoPoOKV9leGNtdz
         lveu61f6anx04kx6xPmAtpQK9FfgTRnrNFrcgWi9LsM1PxOIEXXr0IRr8ecChvJvKGbV
         Af10Nw+gtW/LW1ayVtc2SNu1Jgs3CZXJ8Tu033a3zlxiOP2EtoRMA81YKDk2QwjqWbFw
         BWdxrHwNGpB1hgRvA9bbVVuYi77iP5hHgxkJsqWMcyiAW3l0GA02p+oGvVZZoNnEb38z
         CB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845701; x=1779450501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=;
        b=FtjbhBXLwaxSMLX9RUXYHkZxNhM6CMStQQL7mGG69S9IvxfWcZcuxAEgrsCg3Aty5A
         MSNcpcvZT9YrDfAuUVyRw4Bk+pU0ZtsMHqIKBzBJyVC3QbnKeIRykbmhwQEj/riZ1Ev5
         4v6WsPfhVRM+DTy6jcX5GUKj6/JDIOGfBIKrCfOwn2mT2kaePXdhlCclAco+b/qq0NUE
         KGPgHk/8VkcEX2UchCB36ovccj+O+IYR5ZcgVFplGxflYT19mzs/qhAAb9d4V6b0E++r
         kRqgo1ImWz2ST3j/GLtKtrpTI7Eoq8oCTGDsTAO91WiNQbS4Nlsov9tSa6PM4Tj56QBW
         3yTg==
X-Gm-Message-State: AOJu0YzgW++Xe7OmMsPurt3+nXxg8xcwX+U/38nhUO8l7cT+ut53WkKB
	U0nZDn+KhtXekHS4sd4ZHtZdtl0RjFZ4xY78gR/TbKftKldQqIn8D+SzM5OIVZ7LQO8nhRXnwES
	4ugGoMcqmxwMuYn4aok3Z9JsrKlP+A6WgSM9nA5BxCDEGZ5wq4hFGSCwxcwOCGeVLhg==
X-Gm-Gg: Acq92OEd7q3HJVQ9qk2paDeY4HA3ZppH5x4t1k0zuVlMyt8qaRCr/xLvcw0zLzYupJ0
	hKvH/4Vg8xH1wxZEaiNZ03KhF6/bB/5JvGr6S4yd369nkSxKvOG/5gyEtLAIXpH9tLahjh03bGe
	Yy7Z4UIdsLXb9qeV1hXLlWaAK7W+re2Ca1u8ZSjBzW7fQ1oAPCw7FeW9gJ+YfbwdzMKjeWTKDiR
	q4mZCjy1DqYTt/r3hszIC0vUY41HvBwwtz1SwJi9FMie8obl/h38FxJpQU2z4odBqyYkAu1p37T
	nqmP3wkMXeaxx68WyqZ0w7cb3vU4OEFQIPHNhntNvcmKZU0UhOcwR9MwRqTYvjx4GwbeL6fh5j1
	hNJut34gMSHeyqns0QaMnbjBmhvE/AofbRc3xIFMWzLREkqHVcQ6KMuyH20nv83Tc9GgxeyhOkc
	CS4Ke5pSHODATdsR5oinkQ88ZhmRCfwBFBzsw=
X-Received: by 2002:a05:622a:1b05:b0:50e:42ec:ca7f with SMTP id d75a77b69052e-5165a03f084mr50859901cf.18.1778845701543;
        Fri, 15 May 2026 04:48:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1b05:b0:50e:42ec:ca7f with SMTP id d75a77b69052e-5165a03f084mr50859291cf.18.1778845701067;
        Fri, 15 May 2026 04:48:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:06 +0300
Subject: [PATCH v3 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-7-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4991;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2AZDVaVeHjBN9ieMkt6OZ54VG8WgR2+oqvqtNSNqUsY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf1F9avgrZWq+v0I1pdodAUt/N3MADwO/BeF
 YPULYqOuAeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9QAKCRCLPIo+Aiko
 1RavB/kBUB7psisjYBhnxLnD65L34JyEGjWu0//xRyJf6bEggrC5MYMJyqMMS5SD88Eh2lqB90R
 0vmtqmO+8nRwjTRwkR9InqVGyT3eFDNbbakJhttOL1+3NH2CICvrWLR33qvmXRRgq5q/bvCLZrF
 PlH845qsyQsn7vhyCH3WBKX0UKmXzbJEn+drUbaus1AylXbIQ81Bemuw1t9ID4bFGYLBP1QhXMs
 jWgiIVkea93/CTSHlih/9qn407lADicGzS6rP7ZCFsgJeQLWd2lvDka9dUlpaykzuL64oBghucz
 QRIuea9bzmEmzk2xgFyLyIJ9ERuBMhTuXWe/kN+8NQ+SfeF4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a070806 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=hZPXDZ8rEFHKWOVG6IQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX/h2jalLZ7Jup
 k6oluwKkquO6zGqdCXE8WzmxNSxWLswaxUnmskVboCdA9ZpWwzkxi4GsZzkV9q8UQ7Q7kFT+e/c
 MvEKwl+y4ttO177GEPljsISsR2eLvXpXKfCl8/B9RPI2ZtzHKiJbsSQ2xAaO/2JYeI7+NNm+/Uj
 9MrZFQLjfzBa474OUZjDc5a8Hx6zahzOC/SO8xBWtyNX79fyVO0vrdZdrchia/DM3DmNqnNEenw
 yvYAYjsCjvujX9q8beh/44a40q1KhBCTUd5xDDzKJppO5lzgheVnEZ3rKCeb58dLYjZplYUgbOv
 QeiNqvdPbE4bgrF+GEZo7ChdyJN7/y9fzv1zung/Um5kcSTlO7OMh7I67l86HeEW3euYMO66Vzg
 YOE930/VfEo3JCU/n8+GYfj5VeGvzcLqYVa0TlYqGtnUXSrzvjISw371Cb2jM/exe3ll+0qvGQ3
 LycvCk8IXSFbgJQ0tTA==
X-Proofpoint-ORIG-GUID: glsdKIeSzxTK8cd4xaTrSzlF40dFhCU3
X-Proofpoint-GUID: glsdKIeSzxTK8cd4xaTrSzlF40dFhCU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 2329254F097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61695-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

In preparation of adding support for AR50LT core, introduce
platform-configurable IB multiplier and enable IB voting for all SoCs.
Existing platforms default to IB == AB, while AR50LT requires 2x peak
bandwidth.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 51d8faf6fd1a..e1dc226066c1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -284,6 +284,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index eeef453c583f..e2fddc29abc7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 5fbaff5c01ca..8c1c8b19fa99 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -109,6 +109,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -139,6 +140,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -177,6 +179,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -207,6 +210,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..caeaf199cef7 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -18,6 +18,7 @@
 
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 {
+	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
 	unsigned long bw_kbps = 0, bw_prev = 0;
 	const struct icc_info *icc_tbl;
 	int ret = 0, i;
@@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 				return ret;
 
 			core->icc_tbl[i].avg_bw = bw_kbps;
+			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
 
 			core->power.icc_bw = bw_kbps;
 			break;

-- 
2.47.3


