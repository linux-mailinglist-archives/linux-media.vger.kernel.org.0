Return-Path: <linux-media+bounces-60743-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOTBM6c6/GmUMwAAu9opvQ
	(envelope-from <linux-media+bounces-60743-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 09:09:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA3E4E3E49
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 09:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EF2230269F8
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 07:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81A234C140;
	Thu,  7 May 2026 07:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfDnszid";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcVEJNnB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A39D34A794
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 07:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137714; cv=none; b=bb8QpxhyxXjeBxI7zQG7JWde9XWukvCG8txZe6mdWMq8FOID6a5Nqwm/sF8iCiPk6pUvV99Y0glFoJ+4oUSZFJMAnnVH1t7NFLkJG9C354i1Lu6ZJhfinI/acvaT7VvB8HUETwNZOho4X7Tuk6eD34wSoYcmhqQtamcoMEpt8ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137714; c=relaxed/simple;
	bh=m9X312GlyTzYrjaE5voUXDp0+TdVreRfHVkajhAsNBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kiY78PYNvgmJx8J6K4xeKsNl+Kx0jBEiUsMzx0cdIqsNIyPKvChTX/LBxTxu9q+0WkU+hKFYOm/o/ZTjMA4fWegXDnlwAbuf8z+N8Q+Ja6V2U4QudUS01tXxgexfjUhQBq3ECiYfiIrZ62SE0YFEdZWle668p5scyOEhs0+QPk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfDnszid; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcVEJNnB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wQxn1926195
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 07:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=; b=OfDnszidh1huHy7n
	dOSgZhK+fx8rZMoI+iMYbTptdWmsKh+pXr7mZkXyuaDDy0ZEdELNfBF+yzb63Oaq
	84g7qaZ/URporNtjEO4+dARnUPY5FjU+Xlwe8xtYwsqkUvHFfpgnJPNedSWJNKhu
	3ZX9p8kBz1UUkfSAH1i0e6Fbq2WCoCuDPC+g7fQ87StfhcMAWjsT1mn8rk6G2PJq
	0EKQHhGPKqQGPVgItqQ2iAUuShuSw1L0SQ7LXaS6VL1kEXCGESpXR3rDrP9QWt4K
	SgHmlkim0mxClH7xtu/Da40QtDuplc9tUdZXQJ2oiZJRElG4vZJz5Hv90K+pBFrP
	ow552Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g88jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 07:08:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8f461b583acso168027685a.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 00:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778137709; x=1778742509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=;
        b=NcVEJNnBj77xvXFFNERLgxdfV6oXjFgjjR3PUBCi03wqYXsPpQB6O6ujld0toH7on8
         WUdLbGnJiL1IzB6JiNvSkmw6i4V6Xg92Nm8eNqzBRFahLavplwvFf3VGpFFQTDA+q75G
         k5/g9AwuDTmjryY3O7drY7PvzD0iiBpv4S+FZKR/tgc2SUlCq/dY1KmHTl/30832tAdY
         zl8eKH7wg1e/IRgkEe48yBkrCcIt06KeDeq7vQfo3/sxYNwNpVpZrVK3y/t3zkD4cqlZ
         yCdQBjgeqY7dqfrhcuBspP8pQtdF+ZFc0Hs2Ga3+uXik7VHPp/iTCznDz6d76vKFgHfK
         D+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137709; x=1778742509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=;
        b=o9WGuXfo8zsd0HPyZHqYiG6675TMx3o65k46UsjrQvF7p8kGB8Yr3my044sNgD6Coj
         PiZ9oL1JL81XlD2UeiUTJigUqZuAnRKwAYFe02t1/kQoXbKQWH9ZiBZn9NcPOEb0MAcA
         hCtJnhNEU1ERDRBHVYABxEBFi7BODrZP7jJ0mtg6yFX2TKe4tPMQWHa7ee08rphtdn1W
         Q8c60EF/30WysU2i+cSaDIpGxZbTPfmWD1CJ1m1DT+L9L3KowlByfcAxdgpIaCuRS51G
         63sdT0A5bnJZtoV4Xz0b20RR8EbWnD9cNSFVpWDVpeGh/zyWy91oY6/hqHBKMEiPgerm
         3OUw==
X-Forwarded-Encrypted: i=1; AFNElJ9HMsOYHsYEaWclEzr1qcN8dxmsbqGUm9x4+vifdPEBGxGCNMi7BozfXU+RY5kydjOwwHiAn1JWS7Us4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YysSSEyiBO9YYDJCf8X6xIc6oNrvCgHc0QiAAx8DHqkONDhFux+
	MPFRz/6hTlI/E9b8XJ02Q2GIs06rKncFn0pdbYesvLvp6PfFCxNIRUf11KIKLOeGmZIIJb6DgLx
	Zy53AmPw4OdaoNnCByWysOasVNMPqCb/LR4ZnTk7oSwcIVHKzsApCSKw5xvnBFGGrUw==
X-Gm-Gg: AeBDiev69Ku3n2z6cmXdyp6Fv/s189O7W22k7pBy6c6c5wNycmqija2kWyfrVi++asT
	yuTmtG6uMNz8RYBCkkNAwzstfmjIsvciVzqOpiEUkFu76z3ATG3VGNTBdcnCdltizlus1g72+aR
	SptHsNdjhP5op4epVhqFGlubqdnBHd6/nWpCo0AOvOMtDl6rQR5dtmWERIH5rC6oJhuzx2JM2mv
	4ONigYJFG87dsTpIzAwVgLP7Ns8RcXVEaVJ4mA2fwHm1RvCyUa93kgliU7LhHBqOevuvhoYHmiT
	2+D3zaI/+BEynHbc6mH6mVLo+03dGvjVI4Ap6TTfcp2QN0+ue+0usN2Gf+MfTYnHxDtoMC13hla
	fyJtVIbHnW12KwQLXg397I8nrpzkCuSfmWC7g0KIDTGp1D3382rJt09VtsLB7RVFN3BKhMktkb4
	QuqmBOHIxQk4PN2P7NPHlO5WQWstBXjghKbzyXqbUMSjzG1g==
X-Received: by 2002:a05:622a:5145:b0:50e:41fd:52e with SMTP id d75a77b69052e-51461fce4e0mr88874691cf.37.1778137708757;
        Thu, 07 May 2026 00:08:28 -0700 (PDT)
X-Received: by 2002:a05:622a:5145:b0:50e:41fd:52e with SMTP id d75a77b69052e-51461fce4e0mr88874531cf.37.1778137708343;
        Thu, 07 May 2026 00:08:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm4296784e87.43.2026.05.07.00.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:08:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 10:08:11 +0300
Subject: [PATCH 3/4] arm64: dts: qcom: sm6115: add venus device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-sm6115-v1-3-0b082ad8eea8@oss.qualcomm.com>
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=m9X312GlyTzYrjaE5voUXDp0+TdVreRfHVkajhAsNBw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DpgH8Ky50VAX+QaOuWk0Kw51X0lsmHYY6OtT
 sCMRPq123CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw6YAAKCRCLPIo+Aiko
 1YPxCACGOzREuq6F0fo5UGrKdPv9UFXP/CN5XxQXw8/Y5r9n1h1xwc5Bqx77HpJ+Y53mla1l4Nl
 FJJ1YpPMm+IYuy2PuP2gn5XXVhdCBJS3NfG30J5JTfB58rsvpFgLs47SigzorPadKF8W4yg4R3o
 NkCJ4krilnUZK6DO0JUTs5QNQbFxWhuwKKPF++oCR17N7cil1R/vm92L+fMkibC5+R+k8ZIgZ6Q
 pItBZUVqQ0Fsf8MeVMN3ecAAQ/lKwBH5+m//zLZQnZQUwqYQTUPCM8F+UfI8yjzELRZjBaL00ld
 FtSwaAqakzu/38kFqudc09UYu+cY6ns5C3QfwliHXjGrdSLz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc3a6d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=RLkLXjOyRIPW4P0KXqIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: cX0mxTI6mo34UZSzYsVTBn97_DxcCNM0
X-Proofpoint-GUID: cX0mxTI6mo34UZSzYsVTBn97_DxcCNM0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OCBTYWx0ZWRfXxUvKWz4DutZD
 kP9fCHacp3A6JSxWstwe1AhEsCxiV8wABVaRj6fXMnbEGCdCGe9gZD9AlAQ+3vJZOKD7DLKSLIH
 s0yDxgrjIGXBes39HDawchF7Xr0ljuGqYsaoHcwBlQKp7gjWLaiLL5WnaqA2mjrGmLbgqGEQdZB
 7/mN4gbl5OVWbDjVrzujRJg2qjBddfV2GcS2ime2gx7mF64ePLM/x4U2p/YHeMxD3n9O5Iv3nEJ
 E7mrnlSNgiqPd9Od/w4pU7HmDAHK1rz2uI27PUczXFfLmnoqr6dPaLCK2N3CQRcDdLEC7mdD3yN
 mF0PTKomGe7c4jAx05igZ31WEwQ5Edzc7DPMSt4UuFc7Q3I8pRiqNm8ltf9iVFXujUERTO5L4PZ
 /FnPomoJtkjz/a2L86EoFbX/eLIlL/MiWTNFZ2dgRrkShDRF4rviMobw5Nr7/7EC3ZxfCEj/ULI
 lrR1XTSoQWHdp+4+QUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070068
X-Rspamd-Queue-Id: 6EA3E4E3E49
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-60743-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,5e00000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,59a0000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Define the video en/decoding device present on the SM6115 platform. The
core, AR50LT, is mostly compatible with the one present on the Agatti
devices, so it uses qcom,qcm2290-venus as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index bd94eb87d6f9..3520802d1fed 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1853,6 +1853,71 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		venus: video-codec@5a00000 {
+			compatible = "qcom,sm6115-venus",
+				     "qcom,qcm2290-venus";
+			reg = <0x0 0x5a00000 0x0 0xf0000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd SM6115_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&pil_video_mem>;
+			iommus = <&apps_smmu 0x860 0x0>,
+				 <&apps_smmu 0x880 0x0>;
+
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&bimc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,sm6115-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.47.3


