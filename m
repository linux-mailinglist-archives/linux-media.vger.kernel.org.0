Return-Path: <linux-media+bounces-59417-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBnHFtEh6mnKuwIAu9opvQ
	(envelope-from <linux-media+bounces-59417-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:42:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 185B04532B8
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEF2F31226CE
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 13:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A652BE05A;
	Thu, 23 Apr 2026 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEV6R9wW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abDw+TcZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA972BDC23
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951082; cv=none; b=hyTSKUfd7mgliLX5oTwMTFI4/bM82dKTKhpo3RKjFpUD+o43DY+i4iXZC7A1kdsfIEXuoXbVVeTCDozG8jv3duXcwe3/dZQa6iajm6lrRyV1bDjZ3SJ7KsmAgHX6yRXrgyYq4qseQz5ML2UOvDWhaKRvZlpyABTfDn/g/FIjiF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951082; c=relaxed/simple;
	bh=LCMjOJtIxtHep2v0soQ3sUv2MXiTZMrsIoi3l55k2cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fRbQj6l6x3Kmyr0iqJdQ8VttbUNfThpz7+Rtft6Hvfgshd9BhnWmPUCPZSg32pUqItc+g2xuO4YoK1/yqZm3oaBGFlPtyk9e/P3nBp1+BsW6R1fen96p/JelWPEfAT20xO7svAVtfcd6VECI+HkhTDbB8j251wUrRn9PMN+28Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEV6R9wW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abDw+TcZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8tocd179234
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nayjuY7g5QVFWHFlaeUOOsPyzRCe/yAlG6cR/ITXMU0=; b=OEV6R9wWKHsBjjF4
	W0ZtMmUQMdnWtR/CrwHpgS5TF6gdu71dGYtNDWcS8PnyBCH1PU7ftb8P+0NydsBc
	/Bdd7ZMSg+6VlXFOBIH77Ck5DDsdBQkHz876b3qEy2FJ0L2GrKYU0W1hhWehGcL2
	8uOW5qV4iuA8L02NZMn20k7Vfo55r5VLbhDOSmcobpYtlSKIKojmZ71U4ZfzrG3u
	Dboqlp57bjjRMg6L5xumzMR84Al8yQOFOVVLtYrptHTydkc91VyPOHlnlPCQkIAJ
	pVukQdi4EoY/i4h9bruVn/IK4kZxdMpGEDdn1gVGhN5CQtA3U1VVz0MzbT72/YqS
	+BcogQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62hnpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:31:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b7a77b8ec9so6862735ad.3
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 06:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951080; x=1777555880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nayjuY7g5QVFWHFlaeUOOsPyzRCe/yAlG6cR/ITXMU0=;
        b=abDw+TcZVLf9EQ/iwWPTcMI2v5u6fU/7drPLvr42004/e2AAk9/ubTSgSRxOxxbOR+
         CP5auYfYFjxajKJ55EwsHMAqQgnMqTF/ahomJhPRZ9I/B60i1CyevDAlL5R7X+CZzL4N
         Y4cZnsDVswZY+40Bx6Yr0qCV0giNz9tfjAXL7CV5nyAbZg9M+o+L5YyWXUlDKvKBHNfM
         OJYXmDYf3+3Gdhrh+XgNqW4Ahx6Ktvw+tHsQ7Yg7H9amObspF1secpn6wv28ClNj5w8r
         xM8+0p6dEaRQZNCvmlkQEBG2MTeV2FuGTI31npLJx4uaJrbtJwAWL15ggNSM1QwP9glv
         BenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951080; x=1777555880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nayjuY7g5QVFWHFlaeUOOsPyzRCe/yAlG6cR/ITXMU0=;
        b=jClPU2VR+NkvDLarRZkfzW42w6IL8hEZlKqoTgBduIpqi48+i3sqtbY8M/WR/YDIAU
         Yd7d6mh+0pvMhHIQZNCx4/rciSVFvjZrxJKQUjZ7WJdLcaCdz+ZXxXCM3X759kiuJd6o
         pvd4wmmI/KPeiQpnPx/0Z84bIJEGuHY4pR0BWDogII1pEDWT63PR8LfMNU/4BQJOMv2n
         TA8Dy6akqfagv2p6NILRN6+aCFCXH5w5ekEtMaqnveejfEJSsvipPXtVmezkvuzj/MwB
         Hp6chIWPeCJsOB14FqNE08xQxlCHJl1eAVB8kaCGsxbIkO2VMWRssAqTt3wMAoZM0pzG
         SOwA==
X-Gm-Message-State: AOJu0YxbrNM8OW9/FnmOJWlgBjpFoYMx4QKaVLeyuR/6KWARLCKaNLJ/
	F9ezEmd75yxiQAJyYa22bRauhgl2Opq8ljtD5JDQgAWyLgfp12VXEatA8b0FWwJIbQ2btHmwFqU
	YhzlQrs6sHNe2Gfi+qfRAs/0yWOrFAOamKPvgJsuJYmE5+Ma+dRzFlfPGk61oRVeRPw==
X-Gm-Gg: AeBDietVQU+5lCmdDDjtb44bqjzjmyoZEIFO3BytxReL9zaOfRrHD4fEOTxPwC8LeJx
	coAV9I32u4Nj5wBRT0L7oXuZ0iE4hFgyKV6+sPKAsHO1JKXSM6WCB6CtbD9uM8FRZhJwGiYe4xa
	J8F96aNfziBtsa6TP36kPKxvzUgyopkYzLlorO8HqdxG7xwVjN9NFYjC5Jbro2R/92ckFTMejXb
	52fpb5xWJh0IEdf902VtK8qOo9ipBkksYD7oUJyTcro/Mxv2ZTnUwlatYtBuwJLcebb7wVSIOdr
	u5AFLyl4oSXgVIpYOZnyYG1BGixcoE5QYmfCi4a0/8GTF2G4Wf0oG3S6xBSbyIsWx8Fir8kRovd
	ggFxQjO28omLbhbv4Huw4IMlr1q6vY4AtasNIUifLbpxyRI6XRZZDQEtPTzfIszgTeg==
X-Received: by 2002:a17:902:76c3:b0:2b4:6281:60c0 with SMTP id d9443c01a7336-2b5f9f527efmr211822055ad.35.1776951079540;
        Thu, 23 Apr 2026 06:31:19 -0700 (PDT)
X-Received: by 2002:a17:902:76c3:b0:2b4:6281:60c0 with SMTP id d9443c01a7336-2b5f9f527efmr211821615ad.35.1776951078971;
        Thu, 23 Apr 2026 06:31:18 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:31:18 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:38 +0530
Subject: [PATCH v2 09/13] media: iris: Add power sequence for Glymur
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-9-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=8487;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=LCMjOJtIxtHep2v0soQ3sUv2MXiTZMrsIoi3l55k2cY=;
 b=7X/KgTns18PVEGW+JrZHBV69wODcTX7hJ2smtGg1g7f1oG/DnqCmvhadmTbY/a4SUjPS/a2+w
 69rqAkfhfBwCWSwyuhuGWmWYYSCS7QeYMV5zBevR560DXNeInl5+Klh
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: j1McTQikWCFup4ep0uk9cFrW_pnBg-5r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfX7RwtUDvNh/nD
 K+vTjOedvvqFCGyF/rc4VSpHXj2n0vXIUfVjIPdUjwdIma0HxkAbMcaaerqZ4PGLBedTznGNE1D
 DQ02vTzDG42HMo73+R7mVkkko5eLDW9b3aZ/HzYG1SpNxH35Rz+BWWXLaPgnKYntmnV+AtN6I+F
 KG35y4mi0bikTbccEyX7gEdefZGZFU0ghjhPAhGF2RmYl0NvxJzVCCDhdSwhOmaqXUAVwNrcpXf
 WE6zmPA29oADg4mkSJTNy3RyM0zf8I5XOihnNzBb3pCEKDZwPzO7fvau00wcMyn+Z47eNU+HCWr
 20nc9/d/7CLg8w3E3IUrW8PaIqJNQU4S4NcLuK8d3NL4TE2vrMGgc/OWAeExFdGonVzyxDl5kTo
 sC9gddLlpa3+qz19DBEna3NV520OeusA0qDEMIlSVLmMcUQbXwUnJD4upwTRgq108M3RlIwKHDu
 OXbNB7MogYyvMg0c/CA==
X-Proofpoint-ORIG-GUID: j1McTQikWCFup4ep0uk9cFrW_pnBg-5r
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69ea1f28 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Js87xDwMZ--NYW6i2EgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59417-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,linuxfoundation.org,nvidia.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 185B04532B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Glymur has a secondary video codec core (vcodec1), equivalent to the
primary core (vcodec0), but with independent power domains, clocks,
and reset lines. Reuse the existing code wherever possible and add
power sequence for vcodec1.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 122 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |   7 ++
 4 files changed, 134 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 7d59e6364e9d..8995136ad29e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -61,6 +61,9 @@ enum platform_clk_type {
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_AXI_VCODEC1_CLK,
+	IRIS_VCODEC1_CLK,
+	IRIS_VCODEC1_FREERUN_CLK,
 };
 
 struct platform_clk_data {
@@ -210,6 +213,7 @@ enum platform_pm_domain_type {
 	IRIS_VPP0_HW_POWER_DOMAIN,
 	IRIS_VPP1_HW_POWER_DOMAIN,
 	IRIS_APV_HW_POWER_DOMAIN,
+	IRIS_VCODEC1_POWER_DOMAIN,
 };
 
 struct platform_pd_data {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index a9f43dbfc695..bd70d1c0ea76 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -27,6 +27,16 @@ static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
 	return pwr_status ? false : true;
 }
 
+static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
+{
+	u32 value, pwr_status;
+
+	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
+	pwr_status = value & BIT(4);
+
+	return !pwr_status;
+}
+
 static void iris_vpu3_power_off_hardware(struct iris_core *core)
 {
 	u32 reg_val = 0, value, i;
@@ -260,6 +270,110 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
 	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 }
 
+static int iris_vpu36_power_on_hw1(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC1_CLK);
+	if (ret)
+		goto err_disable_hw1_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_FREERUN_CLK);
+	if (ret)
+		goto err_disable_axi1_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_CLK);
+	if (ret)
+		goto err_disable_hw1_free_clk;
+
+	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, true);
+	if (ret)
+		goto err_disable_hw1_clk;
+
+	return 0;
+
+err_disable_hw1_clk:
+	iris_disable_unprepare_clock(core, IRIS_VCODEC1_CLK);
+err_disable_hw1_free_clk:
+	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
+err_disable_axi1_clk:
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
+err_disable_hw1_power:
+	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
+
+	return ret;
+}
+
+static int iris_vpu36_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_vpu35_power_on_hw(core);
+	if (ret)
+		return ret;
+
+	ret = iris_vpu36_power_on_hw1(core);
+	if (ret)
+		goto err_power_off_hw;
+
+	return 0;
+
+err_power_off_hw:
+	iris_vpu35_power_off_hw(core);
+
+	return ret;
+}
+
+static void iris_vpu36_power_off_hw1(struct iris_core *core)
+{
+	u32 value, i;
+	int ret;
+
+	if (iris_vpu36_hw1_power_collapsed(core))
+		goto disable_power;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
+		ret = readl_poll_timeout(core->reg_base + VCODEC1_SS_IDLE_STATUSN + 4 * i,
+					 value, value & DMA_NOC_IDLE, 2000, 20000);
+		if (ret)
+			goto disable_power;
+	}
+
+	writel(REQ_VCODEC1_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+				 value, value & NOC_LPI_VCODEC1_STATUS_DONE, 2000, 20000);
+	if (ret)
+		goto disable_power;
+
+	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	writel(VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_power:
+	iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, false);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC1_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
+	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
+}
+
+static void iris_vpu36_power_off_hw(struct iris_core *core)
+{
+	iris_vpu35_power_off_hw(core);
+	iris_vpu36_power_off_hw1(core);
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -284,3 +398,11 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 };
+
+const struct vpu_ops iris_vpu36_ops = {
+	.power_off_hw = iris_vpu36_power_off_hw,
+	.power_on_hw = iris_vpu36_power_on_hw,
+	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
+	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b82..99e75fb4b10d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -12,6 +12,7 @@ extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
+extern const struct vpu_ops iris_vpu36_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
 
 struct vpu_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..37f234484f1b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -7,6 +7,7 @@
 #define __IRIS_VPU_REGISTER_DEFINES_H__
 
 #define VCODEC_BASE_OFFS			0x00000000
+#define VCODEC1_BASE_OFFS			0x00040000
 #define AON_MVP_NOC_RESET			0x0001F000
 #define CPU_BASE_OFFS				0x000A0000
 #define WRAPPER_BASE_OFFS			0x000B0000
@@ -14,6 +15,8 @@
 #define AON_BASE_OFFS				0x000E0000
 
 #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
+#define VCODEC1_SS_IDLE_STATUSN			(VCODEC1_BASE_OFFS + 0x70)
+#define DMA_NOC_IDLE				BIT(22)
 
 #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
@@ -35,6 +38,8 @@
 #define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
 #define CORE_BRIDGE_SW_RESET			BIT(0)
 #define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
+#define VCODEC1_BRIDGE_SW_RESET			BIT(2)
+#define VCODEC1_BRIDGE_HW_RESET_DISABLE		BIT(3)
 
 #define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
 #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
@@ -52,11 +57,13 @@
 #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
 #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
 #define REQ_POWER_DOWN_PREP			BIT(0)
+#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
 
 #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
 #define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
 #define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
 #define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
+#define NOC_LPI_VCODEC1_STATUS_DONE		BIT(8)
 
 #define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)

-- 
2.34.1


