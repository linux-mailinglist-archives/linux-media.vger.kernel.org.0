Return-Path: <linux-media+bounces-61675-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FXcOL8DB2okqwIAu9opvQ
	(envelope-from <linux-media+bounces-61675-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:30:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3BF54E795
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39510301F374
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD6A480328;
	Fri, 15 May 2026 11:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VpybtXJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zx6frrY0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117E248032A
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844254; cv=none; b=dKS7F8sEagTpgWuWQgkydCUAiZWn3JBf9vNspeuMTzK0IWJIny9BvJTNX04ZFi7mG0W3SKNAsr2kDdrIt4t50ufAypYMC1Ill6m9DyOce7WSjQ4MUe5UhpYxLCWxFUFJfe8aex5P7TFrImJ4iEXMMJTd41VszO2d5RJ3xnWCD44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844254; c=relaxed/simple;
	bh=onJeJiw9EMeTDpFkD/CSfgq5ekY6oL32ti+K4AKPSPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UchXEn05uBzCxmzG806Xm2HYZRE5Ma0AgqDHORdAmNnPJo8MRXAHhxFHVpqzBZ1EXkWo+y2V7/cpdcrKixEMmMdXRa40LNfU0asspDC2Y/nMj1sGWUFtvj/RNm81+arM9k/ANE3q/j3MqMDup7Shl/cQWEu4Pd0T2CEZjvAUK08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpybtXJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zx6frrY0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5Hq2D4020904
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqDWRt1uVdCbnOpqf0M1wXSvFfZm943941fN6LZQjNI=; b=VpybtXJKXRzZNwba
	8WbuhX2Zkcyaafql9qS1X3k5OE/Od7UaPjK7oTgpT6XiYFbyceoWLueLj5NdxkeS
	thxq9h3XGvhKEZqJn3aduRpz+5wHf1orYy2j5WIXYmE3uBQod/5QlRgndk6qHstF
	Mr47kxvWj3mdyHsSGwYjyfW8cgvluSe/q8fRiIp0KEkNsra5JtWUFS+YxlXPtFp/
	uL8CJ0koAlbNoiA9miVsWhyHez4HbXPh6ZilUb286ZpgOBKiWYz8m072x4vW1VpH
	TEqIyo45LtmTAfV0lqOlTDtrg8P3xMJyhiqnGfVenDcaVlJb6RU1Vw2+UivkYhOB
	HOrnjQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru1g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368b15eeb3bso8401914a91.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844251; x=1779449051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqDWRt1uVdCbnOpqf0M1wXSvFfZm943941fN6LZQjNI=;
        b=Zx6frrY0W6hnTyT1OS5ummvhPqH+8UjsRa6oRiMNBRRPJJtUeHq+rSnMJMvExJ76kM
         7XyVGJWKL/Igvk97aajBV/lBKqnYNZFcnEDjK0wgsrv42x0ytAg/CVX8+R7FNAIThra9
         4FZUs3QKYqbvqCIypg7AjmOydgXfE/x9aLQzQZXMD2HZiJufMLXUnhajPVNVGG7g2OPd
         S1ZqsNkE4+vIe6zgMQQvFZ7ZsWtfAAyj5pxK2ZfCiqor94F9Cl+vSeYYqT6ZcujF2GGJ
         OZW+60jPXOhJvHCooEDURlf+l9ay9gUgIPjWUoAfXPKO/m5pTHH0oZht5bNPuL+essTS
         V3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844251; x=1779449051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kqDWRt1uVdCbnOpqf0M1wXSvFfZm943941fN6LZQjNI=;
        b=J0qygIpUVZ5L7ERWcpvZWsNuTJLRiCETZRAFQtXdttTeMn7hdtKyfgsSr/33U8ONgL
         /0o4wawJiMIETBakiLud5EOJ8mkReuk0uiCcyjI9Qk1ppqgjwj5sjlt+0ARjvdkUxBq1
         ri6E+rab0GG9yUaa9weVna3v7lE9tZoHKHSFnMbsWQsfwDShRAIgwBSagE5wKWG6loDn
         PWDfSO3c+JIq+Ja3nbV5qPrhbLPuoN2lfTqVa5yGr4zckDjMt5LA/Nx/ersTlayn4KUm
         4FFBn+jTPjB6Bom6ZlpBlmRFPvktTPfPFpG+40PtzDPmz4YM+JSN3H41/DgNHS3PC8YF
         lccQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hJlhwfJ2PW7pHmOUQ9+OMu6iYFA6JqKlpGwenX42/8z5RZLJEijMq1LmZ/4xhvOybpaKXRfmnrijalw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZyNlSx94z+YY6kOqdT7u7oW6XfeIrTUg6IM4ThJ5Z3CT+LOpI
	q/gNr+nPFd0zIf1wbZ5kHA92FUeFsqkZsJOJlljA2yRSQ8WnTqeagUJrcUpFmqnKVWvuJRsq4F2
	p4g25CI/8ReMcW8yLwPW2WBznh0Unf79xK2Uni972CIU9XgdFyLV5tQ9zSbjS/flWBwpoVqCaZw
	==
X-Gm-Gg: Acq92OE3ZopXJ3eA0iEPpK0bMrkdgb+9Mw84RbRtg6bWM1/McwzCvav0uhonAgGTENb
	URSMEIbOQOA5ixFKB0aSkQvVhmfT20lbGOfKWOZvYSKUAUK+undVP2XDVWOPJdQxhXHqo3yIGEE
	lxrG4l6ZhPvMf/R5V5quxmrNJy/XAbmR+Xs1ZRVNmKUQ2e7jhLYzkaeNectJcKZPKvXv+0yi3Gq
	vB3j6sGsaoXmt/joINgpIIa5vYImM0pX/8Pze6X7k2ktExH7mgLHj2MzxjYR+gsZ3kWQW/yAsIH
	dcxd6ccBTZgq6BlbD/0dUKiXLc80NJ9wPg+r8i1z0gLHK00hwEs6kZfphg8aCw7Q2+ptbPVoKBw
	TDOlo6I5CRb82E97/lAvwN7ukH6L03bxSvK9WajmhypOzaApvi/pae80=
X-Received: by 2002:a17:90b:5203:b0:369:1dff:6bd5 with SMTP id 98e67ed59e1d1-36951b7840amr3169845a91.17.1778844251431;
        Fri, 15 May 2026 04:24:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5203:b0:369:1dff:6bd5 with SMTP id 98e67ed59e1d1-36951b7840amr3169793a91.17.1778844250844;
        Fri, 15 May 2026 04:24:10 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:24:10 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:22 +0530
Subject: [PATCH v6 07/14] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-7-f6a99cb43a24@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=7327;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=37/hiTXVX9eQYBQu3HR7YyKJBAxiMFbmP14R68LJz1k=;
 b=q2XsJHyGRXSvCFhZ9XflyOp+xKQepeFWo5kYnqWncMEmKnQ9NbTfv1uP2lLTp6gG8XKFZTxf1
 hYis/YIYViHCru8bXKmV5UDifTIS+HbBgHtglbIlfNn/Tcn4zV6cfbh
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 5pySRyy_K9yiuiP2Iar1Z39akCSxk76n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfXxeeV2BWbOftY
 Zexx0Ej6qV8qOgBkQdMfNh6UYSLQcs+JAW17fu1zgMl1sWVZ123RhNO1Z18E2VCZgmzQP7CrELt
 yCB3a22+4KtUAWDv83HlGHlC9UkYCSILJM32vi1LHprKieuR7jokM6DiV37HynO4PK2kEDojvJ+
 rAUZZV/71GPG32frbheyX4pRua89lRogAFQzHppDRDmpXDNGPLYLgB7s1Yml+ycqTFRFddq5y/f
 +GYmXsitYwkiAB46L6U7fXg70sWKaW570Vy2MeICEWyUqRInhT40x/mqcwdmbO5hXnTSKSNud2p
 OVnjXd81WgEkfE1tgJPtPNjRaoqgik5lBBaeFvTfsywOJ8x2NBHLSAtV+tIlUWyHnp+YhVHE123
 hTxyo+/6WNvdOVNk2wrSWd8Nrmwmw2ciCvLCmuScPLdu8UuKwUMNYz5BVlgghEKOjdesIrqoOdi
 JRe0ezcxsdgqO2irtuw==
X-Proofpoint-ORIG-GUID: 5pySRyy_K9yiuiP2Iar1Z39akCSxk76n
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a07025c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U8OLdchxA3Z7P0hrdlYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: 8E3BF54E795
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61675-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Action: no action

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

On platforms where a hypervisor is present, all Secure Monitor Calls
(SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
(PIL) memory region so that TrustZone (TZ) can access it, forwards the
authentication SMC to TZ, and upon return maps the PIL region and
triggers the co-processor bring-up sequence:

HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS

On platforms without a hypervisor, Linux drives these steps directly.
The SHM bridge infrastructure required for this is already upstream [1].

To isolate firmware memory in its own Input-Output Memory Management
Unit (IOMMU) context, a dedicated stream ID (SID) is required, tied to
the firmware function ID. This SID is specified via the iommu-map
property in the device tree using the firmware function ID as the lookup
key. A firmware device is created and mapped to this SID.

The presence of a SID mapped to the firmware device via iommu-map is
used to detect whether a hypervisor is absent: when the firmware device
has a SID mapped, Linux manages the IOMMU directly; when no SID is
mapped, a hypervisor is assumed to be present and these steps are
skipped.

Extend the Iris driver to support Secure Peripheral Authentication
Service (PAS) on platforms where Linux manages the IOMMU, by creating
the firmware context device and performing the necessary IOMMU mapping
when the firmware device SID is present.

[1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
@oss.qualcomm.com/

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
 drivers/media/platform/qcom/iris/iris_firmware.c | 73 ++++++++++++++++++++----
 2 files changed, 67 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 24da60448cf2..2edba569fa25 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -36,6 +36,8 @@ struct qcom_ubwc_cfg_data;
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @fw_dev: reference to the context bank device used for firmware load
+ * @pas_ctx: SCM PAS context for authenticated firmware load and shutdown
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -81,6 +83,8 @@ struct qcom_ubwc_cfg_data;
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*fw_dev;
+	struct qcom_scm_pas_context		*pas_ctx;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 1a476146d758..8bdc9273036c 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -5,6 +5,7 @@
 
 #include <linux/firmware.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/iommu.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -15,11 +16,14 @@
 #define IRIS_PAS_ID				9
 
 #define MAX_FIRMWARE_NAME_SIZE	128
+#define IRIS_FW_START_ADDR	0
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
+	struct device *fw_dev = core->fw_dev ? core->fw_dev : core->dev;
 	const struct firmware *firmware = NULL;
-	struct device *dev = core->dev;
+	struct qcom_scm_pas_context *pas_ctx;
+	struct iommu_domain *domain;
 	struct resource res;
 	phys_addr_t mem_phys;
 	size_t res_size;
@@ -30,14 +34,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
 		return -EINVAL;
 
-	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
 	if (ret)
 		return ret;
 
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
+	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, IRIS_PAS_ID, mem_phys, res_size);
+	if (IS_ERR(pas_ctx))
+		return PTR_ERR(pas_ctx);
+
+	ret = request_firmware(&firmware, fw_name, fw_dev);
 	if (ret)
 		return ret;
 
@@ -53,9 +61,27 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 		goto err_release_fw;
 	}
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
+	pas_ctx->use_tzmem = !!core->fw_dev;
+	ret = qcom_mdt_pas_load(pas_ctx, firmware, fw_name, mem_virt, NULL);
+	if (ret)
+		goto err_mem_unmap;
+
+	if (pas_ctx->use_tzmem) {
+		domain = iommu_get_domain_for_dev(fw_dev);
+		if (!domain) {
+			ret = -ENODEV;
+			goto err_mem_unmap;
+		}
+
+		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
+				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
+		if (ret)
+			goto err_mem_unmap;
+	}
+
+	core->pas_ctx = pas_ctx;
 
+err_mem_unmap:
 	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
@@ -63,6 +89,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	return ret;
 }
 
+static void iris_fw_iommu_unmap(struct iris_core *core)
+{
+	struct iommu_domain *domain;
+
+	if (!core->pas_ctx->use_tzmem)
+		return;
+
+	domain = iommu_get_domain_for_dev(core->fw_dev);
+	if (domain)
+		iommu_unmap(domain, IRIS_FW_START_ADDR, core->pas_ctx->mem_size);
+}
+
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
@@ -77,13 +115,13 @@ int iris_fw_load(struct iris_core *core)
 	ret = iris_load_fw_to_memory(core, fwpath);
 	if (ret) {
 		dev_err(core->dev, "firmware download failed\n");
-		return -ENOMEM;
+		return ret;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_scm_pas_prepare_and_auth_reset(core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
-		return ret;
+		goto err_unmap;
 	}
 
 	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
@@ -95,16 +133,31 @@ int iris_fw_load(struct iris_core *core)
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
 			qcom_scm_pas_shutdown(IRIS_PAS_ID);
-			return ret;
+			goto err_pas_shutdown;
 		}
 	}
 
+	return 0;
+
+err_pas_shutdown:
+	qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
+err_unmap:
+	iris_fw_iommu_unmap(core);
+
 	return ret;
 }
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
+	int ret;
+
+	ret = qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
+	if (ret)
+		return ret;
+
+	iris_fw_iommu_unmap(core);
+
+	return ret;
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)

-- 
2.34.1


