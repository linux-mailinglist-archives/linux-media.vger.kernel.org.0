Return-Path: <linux-media+bounces-53657-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFvxJyY/oWnsrQQAu9opvQ
	(envelope-from <linux-media+bounces-53657-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 07:52:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE11B3854
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 07:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FEA83153B5E
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 06:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCA938A71C;
	Fri, 27 Feb 2026 06:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EyIuFQIy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eu1m1NHi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50648389E04
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175075; cv=none; b=W8sWO/2a/om8vHN6fbYHwY6UU0h17G4FMr7N/ZwPrhJKZu7q1r4qeHMBw7DKbUESZQWgoM6WPH/rrCAfobJo+OCUW2EfCXSZbWws+hODLRv2qbmWif0i8tLGuBICjbtJ7r2chxov3/zXVSehhoDw8tEoETSpgo2T1gRoCyBlobc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175075; c=relaxed/simple;
	bh=Xg8v6dTOR7l+rYqJZ5BHS/ncEr9/7cJ2G9rzTn9NgJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1gCsmuX7IqhOvAkez/XZWaH2h/Ric3MrG+7p84qy3R5fXK6PKf0N3nTsHoWYYxZZKfFqJscQOKhup9KZuZnJ4lmTeE1tsgV2CGgj5QE2c1IAfL4opzywDmcHgPckYRoRtjdO/sCUT0rYm++//uoU//xR/SZ6IkCoeUhvxJHMgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EyIuFQIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eu1m1NHi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2KA423762578
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+h8zI22njroufZfTDg7+r1xw8mysdeduU+UHBap1K8=; b=EyIuFQIyYX9bHnTq
	GFYqS66OLe/qUeNiAgJUtbNOj/Xbh+OMOKAbWIbq7ooQIK1if1TXXZ5VdLua61mF
	lmA+f3eLO7hB19iBoAc8hcbE6zmIp3wTMrReDVc73HX5f8e4Ul+kql+iJKPpsf1u
	fOZQvT+f9Mwp0Myij+oJtwnoDnnbJR7GDxFQR1DOkwRm/5Iwm2/cwT56vppNyFaH
	Hko+9OvtAZvRLHTiAHyDWb9Z1NEoGUPsxFdlvxUUzLmu+YGaCCODH+8t8nUqoZzH
	cwZl4+k3ITNkYep7iXID8Go4DP9UKEWL/EwQZON4Tg3fco6CW1XYF/CpBgJuDUVU
	GlAioQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7yag4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:51:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c0eb08ceso9540172a91.1
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 22:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772175072; x=1772779872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+h8zI22njroufZfTDg7+r1xw8mysdeduU+UHBap1K8=;
        b=eu1m1NHiTJHZmlkp1fvWMlnOrD05npFEvBVDnWNtHkTQ7f+dW9NfW7F05zxibL9P7l
         DVX5iG9dj/gp8pTkmZcBtMTCHPovxzO2JOdxovmcpg7ONf/48aWrAPD90ootDhGaKD9f
         AZdBtPJd/Z5vfz++hPXf5wcC++EBbYz1LQrI6oBGJwRdfr09FyI1PuSnOUHQUbnmO2cM
         3Od7BKtncX/bH0IC/9R+6zGSw4KPZqSScyJXNL0byn7jWoq/CROMwnqXJrVrfixd2C3A
         F7KTBGLwk+nIn6nB8clMy1Aox8LUnZ+VZvFqZQ1kWNcwHj5c8UKuI164/GqtUfXd+4f8
         ImQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772175072; x=1772779872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t+h8zI22njroufZfTDg7+r1xw8mysdeduU+UHBap1K8=;
        b=SfX7btZS25kHNXqblHGKl7beBjKEs+RZuBXXqASVxGRxlwU9WvsumMgkAFMc1tRs3W
         MIXAqb8wicFG0QCRYLMCZpTUN7nhfvf3Cg1IMGm+A9YbLFONxTBU4sWPA7scgSnw5hcb
         sBFlk2VlXHPLAqqlyrIsWDZyT0mlRCAkAkELk4vHyWKcjBel+payEgqyESOl/q79YbCe
         wOTaKp8vUiW2WJcQmMbxlW01cSRY2VdbbHa+UGKupoL7r80KWZtte/dipXWyJryw+eXq
         9SZAb0eH81L8qBkoa9qKkU7zqz3/CWE95awbp9/VLzpaDz3q2OLyLghLjZY86drSEuwX
         hvVw==
X-Gm-Message-State: AOJu0YzzgnNgAjNlLA5jScRXVk01wyr0ZnJ6uQwL+fMa0ZWmoGPvOHpt
	fnQVkry9pwqPh6Uc0qFW1Hb2PpkjnCHk8l6uECw3LcYZZUBc4AWlN1ijsuUmJ76iIDG2I5RsGp5
	iIh3HaxHLYykuiBcp9gdIEXTy4tyVkYAG1Gs5rhv05bRkBkqAwYMQ5mz7i66dJ4M5kQ==
X-Gm-Gg: ATEYQzwG5ck73K3S5fLWKh+CNzvL17P5K5ldi5xmijpLP17wA+w5ZEf0EwxZBnVdbFy
	Sx8XiF7Bko3wvmALMAsfZRstW5pIhlY6TxnJIbfCupWRLbamCUCRE+gQ75E8jQgzT7+3p1KGPc+
	X/zJc9hGGCn6uXUF6RSLhH8HeliADa6h7IFdBj5oT585hdBR6ih9QpMGULY1H+QMYOZK2NPMRR9
	uqNuwcHbI3rd0ZQ2p6iovA+bcbKvN2atVbEtspEn+20Ur/qcJdw4JS4rNiR5c9C8uWYJgeByFGW
	9yR9rENB5UcsdzWpDyrmNmRjyeDfLsE44eH3dYhxSbACFBG51FeEmr2ZlYDMyOrvsrCF9BGrqqM
	h3KGv6EadxPxrKudziZtM93LXa9hx5AFTSfm/1vBeKw092/9d541V3iSnCh8=
X-Received: by 2002:a05:6300:218f:b0:366:14b0:1a30 with SMTP id adf61e73a8af0-395c3b16a8dmr2030993637.62.1772175071775;
        Thu, 26 Feb 2026 22:51:11 -0800 (PST)
X-Received: by 2002:a05:6300:218f:b0:366:14b0:1a30 with SMTP id adf61e73a8af0-395c3b16a8dmr2030970637.62.1772175071259;
        Thu, 26 Feb 2026 22:51:11 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm3455880a12.3.2026.02.26.22.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:51:10 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 12:21:01 +0530
Subject: [PATCH v2 1/3] media: iris: Switch to hardware mode after firmware
 boot
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-iris_sc7280_gen2_support-v2-1-7e5b13d26542@oss.qualcomm.com>
References: <20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com>
In-Reply-To: <20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175063; l=9610;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=3w4YxljxZfU/68M/TpPRKviOI50EzCzvfFM0AfUGESI=;
 b=+S9L+XXLlbu/2C58Jr7dxav27aVzzwY2WrUBQCQQlwUK9+AvRdCSEwqTom/UIof2HHpNrPnY+
 xFt4B/TkoJECPeR4Hisa/EP4+KVKNGuAWIvVZVph03QL/P7S/tsFx7m
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-ORIG-GUID: AiKct9rN3OaV-T_7zl1wWvpqqMXJdI5d
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a13ee0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8QxTX33zP25rWUhdfb4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: AiKct9rN3OaV-T_7zl1wWvpqqMXJdI5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1NyBTYWx0ZWRfX4f3Okq0rRjBH
 4Qt+Fml3aV4aInt1buEJvFrk3INMEw9vo93QG0RU2e91ksIXtrXfLiv1FFOwsK0p2IcTphuU8wu
 A1YsgvMLeeh3grjRHJyFxKLdDFZNlERmdw+n4kS0mZkkUZCHkUGOqszbKuW0KdSlUUj9W5Z3ca9
 p+IzXNn5JqyD6o5gJReMv+Xi2mD4rtlbZreTNlKkwRZcsmVXSRgT+3STLprx96JXMPWdrbv5PT1
 fKXjvO74t6yIAtEvRq2U/RM5603tlYNjKTwE9sxSJUNZMTmPMX1ky2iAs6eYzhCj+EOpzJ4zxy0
 3kuMplvJwkQ/kodvVVfXlDFl0oUFVD2g4L4daTISfPWldZY0r62ceY66p8RUnC0nkr/NKmnXWpF
 Z1YFeGuABtPCLXYixcL8ghQfJQDHnm3Nsb0fOLrFDPb4DExSccppkKYesi0+FWf9Vg17jrFxdy6
 xknVCI8eDCVqSkSTTeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270057
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53657-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 07EE11B3854
X-Rspamd-Action: no action

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Currently the driver switches the vcodec GDSC to hardware (HW) mode
before firmware load and boot sequence. GDSC can be powered off,
keeping in hw mode, thereby the vcodec registers programmed in TrustZone
(TZ) carry default (reset) values.
Move the transition to HW mode after firmware load and boot sequence.

The bug was exposed with driver configuring different stream ids to
different devices via iommu-map. With registers carrying reset values,
VPU would not generate desired stream-id, thereby leading to SMMU fault.

The efuse tells us which hardware blocks are actually present. If efuse
status is disabled for a block, the driver will skip powering it on or
resetting it. otherwise the driver will perform the necessary resets and
then switch that block into hardware mode. This makes sure we only touch
hardware that really exists and is enabled on the silicon.

Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       |  4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++++
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +++-----
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 ++++++++++++----------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++++++++------
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +++
 7 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 8406c48d635b6eba0879396ce9f9ae2292743f09..dbaac01eb15a0e622e85635fddd29c1f7fc18662 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -75,6 +75,10 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	ret = iris_vpu_switch_to_hwmode(core);
+	if (ret)
+		goto error_unload_fw;
+
 	ret = iris_hfi_core_init(core);
 	if (ret)
 		goto error_unload_fw;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 92112eb16c11048e28230a2926dfb46e3163aada..621c66593d88d47ef3438c98a07cb29421c4e375 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -159,6 +159,10 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	ret = iris_vpu_switch_to_hwmode(core);
+	if (ret)
+		goto err_suspend_hw;
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 9c103a2e4e4eafee101a8a9b168fdc8ca76e277d..01ef40f3895743b3784464e2d5ba2de1aeca5a4a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -44,4 +44,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_off_controller = iris_vpu_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
+	.set_hwmode = iris_vpu_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index fe4423b951b1e9e31d06dffc69d18071cc985731..3dad47be78b58f6cd5ed6f333b3376571a04dbf0 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -234,14 +234,8 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
 	if (ret)
 		goto err_disable_hw_free_clk;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
-	if (ret)
-		goto err_disable_hw_clk;
-
 	return 0;
 
-err_disable_hw_clk:
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_hw_free_clk:
 	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
 err_disable_axi_clk:
@@ -266,6 +260,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_off_controller = iris_vpu_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu_set_hwmode,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -274,6 +269,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_off_controller = iris_vpu33_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu_set_hwmode,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -283,4 +279,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index a8db02ce5c5ec583c4027166b34ce51d3d683b4e..02e100a4045fced33d7a3545b632cc5f0955233f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -252,21 +252,10 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 		ret = iris_vpu4x_power_on_apv(core);
 		if (ret)
 			goto disable_hw_clocks;
-
-		iris_vpu4x_ahb_sync_reset_apv(core);
 	}
 
-	iris_vpu4x_ahb_sync_reset_hardware(core);
-
-	ret = iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
-	if (ret)
-		goto disable_apv_power_domain;
-
 	return 0;
 
-disable_apv_power_domain:
-	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
-		iris_vpu4x_power_off_apv(core);
 disable_hw_clocks:
 	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
 disable_vpp1_power_domain:
@@ -359,6 +348,18 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 }
 
+static int iris_vpu4x_set_hwmode(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		iris_vpu4x_ahb_sync_reset_apv(core);
+
+	iris_vpu4x_ahb_sync_reset_hardware(core);
+
+	return iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
+}
+
 const struct vpu_ops iris_vpu4x_ops = {
 	.power_off_hw = iris_vpu4x_power_off_hardware,
 	.power_on_hw = iris_vpu4x_power_on_hardware,
@@ -366,4 +367,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu4x_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fdb7543f76a1871f17257fa2360733..69e6126dc4d95ed9e5fccf596205e84ec0bfc82d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -292,14 +292,8 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
-	if (ret)
-		goto err_disable_hw_ahb_clock;
-
 	return 0;
 
-err_disable_hw_ahb_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_power:
@@ -308,6 +302,16 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	return ret;
 }
 
+int iris_vpu_set_hwmode(struct iris_core *core)
+{
+	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+}
+
+int iris_vpu_switch_to_hwmode(struct iris_core *core)
+{
+	return core->iris_platform_data->vpu_ops->set_hwmode(core);
+}
+
 int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 {
 	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b822341fb21e12de6b1395202f62cde..dee3b1349c5e869619c7f7c294dd711f9ff72b92 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -21,6 +21,7 @@ struct vpu_ops {
 	int (*power_on_controller)(struct iris_core *core);
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
+	int (*set_hwmode)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -30,6 +31,8 @@ int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
 int iris_vpu_prepare_pc(struct iris_core *core);
 int iris_vpu_power_on_controller(struct iris_core *core);
 int iris_vpu_power_on_hw(struct iris_core *core);
+int iris_vpu_set_hwmode(struct iris_core *core);
+int iris_vpu_switch_to_hwmode(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);

-- 
2.34.1


