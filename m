Return-Path: <linux-media+bounces-67147-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FChCD9KWT2pYkQIAu9opvQ
	(envelope-from <linux-media+bounces-67147-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:40:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F11E7731182
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:40:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fA8VosZM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="e/NSNFX8";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67147-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67147-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C085E306B8F9
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 12:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D7742EEC0;
	Thu,  9 Jul 2026 12:36:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEA842379B
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 12:36:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600614; cv=none; b=puW84S/pD3ctZ7CbUNtJPZNGk0Q7imx09uTy5fcgN2gtAkkBVjNHCyvJ++RDzF+zicvQ+bJQu9O0nRrIGhhycbVxZ3uo5TbskrtRJXqansHLlXawrqhvyQ3xgO7uPozGgxLD2Ai5oRtyw15ZwU+6J24rJfM5uY5sFAY3LAfKU+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600614; c=relaxed/simple;
	bh=7pNcyWR/bvOSOJi/ZBGCeMAemrYecspLbz+ZjerCPE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pp5VPMH62vlXvA0m5hEaVWTD4lqDyU0V5Ea7/yfotB+QBrR9jBBjjoSfGz5QHYZFFmlByijSYaV9yXFl2lhqZo0sBGk1m9M0bArfY9KTzl0HmIKtgmtADgiRD4Y1IYSj5jOciIP6/5yhHsCs5RDWOrDqrxKgXEe+k6j0Atp15C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fA8VosZM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/NSNFX8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN9o51668734
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 12:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsqNMYfLEjMtluhTiHwVMmHH0XPzEU87rEf5NqEYUhQ=; b=fA8VosZMg1R5w4bG
	+CFCUtqfvSvLGlB3dP4pxrtemGeHxh9jyzX1knsz+mmph0parnDYKh7RN7KEx5cu
	1lH+iDlefK5eHXnKdhwJ7cPvckoBTjgZnBReQtC+llBbexELqyCDs6pyPS1JfVOk
	2LJxDMNR+IewPTP/yyq1/T0q5M+pOytdNw+78NKDqh612grn2MmWtC3uou3gQof2
	t5bH20ChDUZKUKpznGpV+WbHQLfoHqOlBAHYC40JOsO0ylEn7QgNLGO2swJCby4h
	eT38a9GnFgcImHgyrylBGqkM/JoOVKb+Aojj5dJS00dq06M2kCChJc9pEpeUUF8S
	9lYY6A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418j56d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:36:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so2336021a12.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600611; x=1784205411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wsqNMYfLEjMtluhTiHwVMmHH0XPzEU87rEf5NqEYUhQ=;
        b=e/NSNFX8qEEaWob7HKnSt1F0E3yens3CyDFwJjT+w2ppdE3FGYcC9x3woTqY6oAaaD
         iH4NFCe6fxSITj8v8qecuvZTW1VQt0Oa3n/wesl9yTjAfNeY8T+jIO9NrBmXWtuWAxdG
         3qw8V1QGY8YerO/MkfA7eKFd8USpoTjxDMuHXfUN8QirLV0gRI9SRsAsdbw5x0HY4rtx
         aIKxmPf8+7LEBwW3bqglRiKHa9fJfkPgms9KnU0b9SBq+5uOtTJitARCR2xE4jrGhncC
         +3M29XSiccuOaeqScra2byVjYGu4xhdm7zRmcAtUK7WIIrurjam5eZKblK7hMYgLDOc0
         /iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600611; x=1784205411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsqNMYfLEjMtluhTiHwVMmHH0XPzEU87rEf5NqEYUhQ=;
        b=O0kUUiofA7ciNZOPbUojCmgg6H4vk9vz1cKmiaTUFA0t7rAAGTfc9il2mLUI4UbM1y
         X9hwQ6dydWR0HawvC1Hp7/sbKDNhjGDn2+YsPWCj4PkXeRANsc1JstxSArxTECbSi8T8
         e54NeGg7ew+jIhpU/RuX8APRgsAHHvhByQz323pN2NbTJehAUCcFVGZB51yGLD48MN9y
         XgPag24HfaooGIm5sgVVBTTqiT2Cowhe2BHEyyiZabLnvEvnzVXchfgmu4ZcWVK05iyb
         foGypJz1x4a2Wwhh15y6DwUoRI1yQCz0t8BQ7PBTOvmVWuqj7b2Tip9vdj7Zrq5PA09a
         t93A==
X-Gm-Message-State: AOJu0YxuYpKvCUJIRFKTUsJVXolqXwgCrkwuTgut/iQ1Rxfi1r+Nhjug
	7yeRdUXX7RD4W0ETnmamHsxIs+eVoJiqtp8hDdrf2FbVs8Svf/Ck6No8AJ/5exsXAmnemUqc6Dn
	qqICnOBofQJHjzl+VnqbKsqPUBOdeXKsAjiTBc1r+CcuaFsEYqtIf1/acfVzTXoVPaw==
X-Gm-Gg: AfdE7cn5+teNhEihbeVxuug2xhBYmJVDHpPJJlz8/8PGDKvUpot3MMbUOQbCG3W62Y+
	E99O0K4WoF4YzmPwEfNiWmsSXwcLjlFKOQ7BdZ+IjkbmaT13w4X5f00av0yp3JdCnzKPMH/HLV1
	FoYQuRVUdq23KmET0oKxRA/zgZGakmiPR5vcfcwOpeDUfyiEaBZJVe9W7AXKIqjmNuIK9pb+deT
	KFVB3Ee1WJIcqRJYSJiyePxYR29mEoNdUd64VrB3ea/TWRc5WI/8s3P0FwJv+RtuTtMaQcWi4nU
	cU7E1PF9srAV/zue4VDoKH1xBoa9BTFkYWmkvYrIF5vQse8MZFbkJZEm5/FRrA08cTeNFHP1HmD
	T1PyY+nMbrciS1Z0kzW6k0VEtOqrgO7Qa8ssVmT98LzqURw==
X-Received: by 2002:a05:6a20:9595:b0:3c0:9c19:65ac with SMTP id adf61e73a8af0-3c0bd3799cbmr8729155637.68.1783600611142;
        Thu, 09 Jul 2026 05:36:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:9595:b0:3c0:9c19:65ac with SMTP id adf61e73a8af0-3c0bd3799cbmr8729076637.68.1783600610261;
        Thu, 09 Jul 2026 05:36:50 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:49 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:53 +0530
Subject: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to sub
 nodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2280;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=7pNcyWR/bvOSOJi/ZBGCeMAemrYecspLbz+ZjerCPE8=;
 b=76iVlwQXeP1yvL87CiM+rjtIXpO5ic+HGNqgYH6l7ne0sclcsV3i+3Ip3/3R1y/fYawpCFUkZ
 egXUzRIpx4nADaUe0k+OQIis6iP6fe9/LSWNQ6SZqAL2eg4A9oTYTGq
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f95e3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX8h5yiHrGhiyU
 sbY6ssjV5KF5zHx76rRz/n5laVVhrkCqFktvUUgl4J2pNcvtAo5xcuXij+Th0saxEpn5mlYo6dv
 VAqAaCt13SwqrPxUGLGIV2VIWMA2RBxNc3wxalvGf5pE8LyUlQpyZ3floTUHuH9TNIsosSRCpfr
 RQkkO2juUk+lRee1XcHPF3DeBZbV+HQtU1fAYqNWl8FON+GHqhcoFZH4855U9uWVnjdKKwW61xL
 Op9CLdFLAh7ASioEK/9cCJkUqIS4qlXu5CJYhb4ePlM54Gbp/72KtSc+O+7zhY7OqndQ4d1D/B/
 UmjifilZg8xhhobpGiukn0VZPDlPKjoD8MxnSjrMw4qHhGopCg0B0yYlu6dMG8Y3hYYVUKzSvct
 pOyj8FG8R0L5+pTbLgIluMkmwr+IWy2CduVV8MjlNXJNG2cuFDZE2FWKDwndtYg05Ge4Wi/E1iO
 ULm7FNb2w6t5IT9BFhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX6dWBipYzUsQ7
 etHMM5JmXGiiq6RJkZyjwsnE3NlBDgGZPMr6ck3PilIzSMDjVpx+NzmRmr/7v+5szgeHJm6xcGh
 K0bHw+9L/OAk+zFrd7jv/XYJJCxwmDs=
X-Proofpoint-GUID: KBljQ65PQy5KnGzF5suKqFHqGMUpPuyZ
X-Proofpoint-ORIG-GUID: KBljQ65PQy5KnGzF5suKqFHqGMUpPuyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67147-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F11E7731182

The Iris VPU has separate streams with different IOVA constraints. The
non-pixel stream must be limited to the 0-600 MB IOVA range, while the
pixel stream can use the full IOVA space.
Using a single set of IOMMU entries for the Iris node does not describe
these per-stream limits and can allow accesses outside the supported
range, which may lead to device crashes. One such issue was reported at:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Add non-pixel and pixel child nodes, move each stream ID to its
corresponding child node, and add a reserved IOVA range for the
non-pixel stream.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 60f485a4892e062980d01f0b930af4b02f36513c..a2baa2c9f46dc19c3db11dc784358223a035475f 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -657,6 +657,10 @@ smem_mem: smem@ffe00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	qup_opp_table_100mhz: opp-table-qup100mhz {
@@ -5435,10 +5439,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5446,6 +5451,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				memory-region = <&iris_resv>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1


