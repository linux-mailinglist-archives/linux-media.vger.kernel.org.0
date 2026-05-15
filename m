Return-Path: <linux-media+bounces-61674-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFlPLWAJB2r5qwIAu9opvQ
	(envelope-from <linux-media+bounces-61674-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:54:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F06754ED68
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E36D931352C2
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADD147D933;
	Fri, 15 May 2026 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHLY65yp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iF3c2SpM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6677647F2F2
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844247; cv=none; b=a4Dy+5U78qVnwSFUYAIcLs0L0xaaLF+vcdI6RB+dNFpJLUVaGzQ7UzAKXmYHgPZpR6s12sLVUA1ujuX7nIyfB9FNXb2xogTeuSdnSTYBcPm3iPAxwcHVWEjs0VnuOozEGm3h4Hes44hV/9McrRdTEOwGGaRwSGRHqq+zaJHehHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844247; c=relaxed/simple;
	bh=HbJDO7h4MkXgsgKVbQfCPfPwW5H3OtSc6iVBjpNeMBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XPmyTfniyt6Pkw+gfufpnNaAZW/tK3h8rrhhQM8sn3Dn11tYWKXwz9mS+6RlVliUZuabAINGnuTfQ118kNJqsXznAedp5gHj0ST5JayQTQbKc85ja4YxYPx3n7jB3zvBWUXKgKjKDvGb0hr9fe5d4nIbHJ+KxMs+1ThF+q/xoqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHLY65yp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iF3c2SpM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAsuuK654914
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BeUeck/PnJeaOYXxZG3voZpfankG9NVFAX+3uH7MhSk=; b=NHLY65yphjy4Fq7y
	VoH5KiywMXn3IbSSHFXnj1SouXITkPl/vrs0uwKYv25HgKSP9BD6iCMF77ZHSS1J
	+zV6toe6EMD4/DHsKMY/mcRRnXeb1HNk7wbcMmgqO790DsJ9MOkVc9p3tyL3LndB
	3jarjdv4qto1jqmeUfcrRjnvKdtTrpkWsu8IR7c33CuiXgWRspPGbkqMlr/aFuES
	6tjdkGUbiGtURXKcG9dtDqdP5Kn5g0h4JsSEaWx/hwKmA8X5/Bi8+5X5EsRn0i99
	qDonOzIqtVK2d4MQ3e+DmLGzmctRbobP4tyZPtxCSA5iba6ibz5lfkaWOpqiE4lp
	druOlQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu2yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4678c6171so97009855ad.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844245; x=1779449045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeUeck/PnJeaOYXxZG3voZpfankG9NVFAX+3uH7MhSk=;
        b=iF3c2SpM5V2mnWWFrRE9UEpa9adBtBl9V6VyWHg6MTq1FUVfYkKvvk8LWJpZvKsPC6
         nkyESoYcZ1vHjHZh71RQglCa7QGoHUSc5u5qObWxezQ0M9vQw8P314+ytxvFqHky5QNm
         9RmSV7q3z6/pBTfn2u/3MHi4LSXL2Dlgqf3hxw1G3Jio8/T6MEe+kxw+ZS4x86VmzkOH
         QrkebI84YN3IdZVKuRo8iAJMLxqSy4GO+Jjtbfhxq746emQGOeD6NMweAHCtdgz+hQrd
         o9YkIVqjh/ETHe8grFE9FMpzBAXx4lAxGeq+9zw1pJfeH/VXmB7VBc7gmG2pOMtzuQfr
         5aMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844245; x=1779449045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BeUeck/PnJeaOYXxZG3voZpfankG9NVFAX+3uH7MhSk=;
        b=bmnT3aYlbsnpTEIzO8A0H/h7XH+iZMAWpxHxDbRKTvPfead0x4AFGwVQgs/CXqT5ao
         E44Y7Skx0Yqe8kAsc4zV4kBW/7V6EGyqzdbpX8XmrGfeQhI9wL2ypcueb0m6djsBWdIc
         oRPc8iyBL/H5dwxiezLuxxWsDRyiDpgzg856omfP49QD9x0zoEuJuQF43UmplOP35s0X
         czrsahGzFDUTLjvwFG4MC0lExxarUjifRbhpLtEn10JogAW1hHW+SC1qnVCEjkArhQYb
         7hGSvaFCyKI81ybKFM35HZSjLAWW4zdtZFnYRlwzYra3VclHJ1nvxKLxuDDStzYtKvt0
         Sblw==
X-Forwarded-Encrypted: i=1; AFNElJ/lCJcs9K5OXwnn+Hjryd70d4Qp4NLowPx6i5UEeWyTqeksR963pvUjULWosxUwxS6tR5XsXhwdgjz9Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7cFZRVnITbVCQDPBkPbET7eYPlTS8lGd9jcvPShtb7H6t8skE
	d6gc+9V+sZ9vDhs7YWMb7KAOiLa7Xcg159YvnrW4+aw0Sa9vR8U2heNw4fQIQZRSwmRIUIR0VdN
	MM5GrPe1SOBEygzV59JqFR88hkB1norV8/2+cpmjuzmCoohujmXcelLlxXoA9iQ6VSDYKrNVhHg
	==
X-Gm-Gg: Acq92OEsOMiAJcvUjKOYXG24TmdG6nvnoYcKJTPdIHf8L1kZgY8wQyUSn9qeJptDRY3
	HdMx0o0N6XRIPEKCEpMY6SLnQidjWSyBqCmgWmUYYl4eWLKevmy9lmXxr0rp0O7l26IF+18x7Uu
	jVoV2vH+lBL0anASomuvET5g3TwTiyvRkeVWO6cKm8kNCCTjQwjXF6il0SE9pbkx+x/dmW5bUnr
	E+kp5wuFeNFVo3bhKr8uxbgl+ilkWNX/7pmzjaoDHQMxKfwqnAJA0DBjCOTnmOSYAR8EVcpSIBR
	dXqBRfuUHlyw7hMnw7t2Xahh27cvGotyu78uvAEIx1mgdtoAdrQTitZ+OsBGXESnU3JUCr3SYUV
	u+lh3xUksX3K+ymMPmNjp3SmXsN295UkqQPpyBQsDvzz74qIbVnZKPH4lzsmDD5Ak+g==
X-Received: by 2002:a17:90b:2d08:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36951ca6064mr3530021a91.23.1778844244677;
        Fri, 15 May 2026 04:24:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2d08:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36951ca6064mr3529993a91.23.1778844244145;
        Fri, 15 May 2026 04:24:04 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:24:03 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:21 +0530
Subject: [PATCH v6 06/14] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-6-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=2952;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HbJDO7h4MkXgsgKVbQfCPfPwW5H3OtSc6iVBjpNeMBo=;
 b=5Ql20Vud027qUgCrsDdN8eNBl6av5FzP2NS6aw/2+3z6TP0/pO36FuTHTiqw0h3Z2qRWiyCI6
 lTq0CqYJvDvCxrxV5MVdBvRFrCeQ97yAv4xs0DQ0aERecLQ3g5rcKki
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: kpXW44bdez2-P1nK8ImrbtlWUoPdrjWG
X-Proofpoint-ORIG-GUID: kpXW44bdez2-P1nK8ImrbtlWUoPdrjWG
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a070255 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hn6c7xJugPWrWid5T_cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX/Bq6CfrCxGyC
 mPbgqofC0JWbq0zmXzqJyBY4i9G2ZdORnsCRcqLmnatTc5d2/RFSRuYFtgO3p8178a9VEz3Vqde
 L+Zmb3WY3sOZeLT+O2qBAIQgKDuVN0B9Wsu7PEEQJ8jgKvI4iRKfyTdXkDFxJKGbQM09eBPAQgx
 P7pwLC07NLeBig5wJKD8ekq58pppBmi074Aj/QVBxhX8XT5Afun+Y/JExy2fxtfsnM9r2rXVvPf
 OnT5JuWMJZdidPDOFak4fEQJUkGiT/GOHEX2MK7KIioZoKfWDXVVEdbyAawJYTNqZedaylxlA5f
 vj6uBB5Tc3AL7rXINGVXce6yJfD+HuAcCcxIOcv4ZIKattP1ODIZeaBjz1F6owNrTWABrloV7Lp
 ebATQJCQP0toHyNI4hjrI9nFSkRZv2IO38kzAQ3QsXrhZiKUK1sJLk3EQ2WHeQTtmf0j5felmf4
 7bOndce1fmhqDCLdQ3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: 4F06754ED68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61674-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Glymur platform requires a dedicated firmware context bank device
which is mapped to the firmware stream ID to load the firmware.

Add init and deinit hooks in the platform data for context bank setup.
These hooks allow platform specific code to initialize and tear down
context banks.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6a108173be35..84fc68128c70 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -263,6 +263,8 @@ struct iris_platform_data {
 	 */
 	const struct iris_firmware_desc *firmware_desc;
 
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index d36f0c0e785b..12596c9a3cbf 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -150,6 +150,20 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->init_cb_devs)
+		return core->iris_platform_data->init_cb_devs(core);
+
+	return 0;
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->deinit_cb_devs)
+		core->iris_platform_data->deinit_cb_devs(core);
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -206,6 +220,7 @@ static void iris_remove(struct platform_device *pdev)
 	video_unregister_device(core->vdev_enc);
 
 	v4l2_device_unregister(&core->v4l2_dev);
+	iris_deinit_cb_devs(core);
 
 	mutex_destroy(&core->lock);
 }
@@ -272,11 +287,15 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = iris_init_cb_devs(core);
+	if (ret)
+		return ret;
+
 	iris_session_init_caps(core);
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
-		return ret;
+		goto err_deinit_cb;
 
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
@@ -311,6 +330,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_deinit_cb:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }

-- 
2.34.1


