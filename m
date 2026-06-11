Return-Path: <linux-media+bounces-64614-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2KVSHrkRK2qA2AMAu9opvQ
	(envelope-from <linux-media+bounces-64614-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 21:51:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A046674DD5
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 21:51:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FwcXw3FL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="JRVX/dZc";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64614-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64614-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A0023027C95
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 19:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4CC3624AB;
	Thu, 11 Jun 2026 19:50:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E31364EA6
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 19:50:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781207423; cv=none; b=Nej1qsVMsjiKWyns2G42iNAZvRcDmBCHcEq3Q9GtNLTCJ7hY7ym4k1fYZRJAyGEZFGUnVnA8tUmxcvPDjhAGnlKVRJyRBgtkYELzbmdUFgkgXkBYjBasFBNsHwvRWAqZTsIXuBIBFKlDnH+47CyF/GlPK0c5ZcqdvNzXfGiXUgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781207423; c=relaxed/simple;
	bh=as0sNBNm6me0DlHIcQsWjM1ap1XelPu7sW9swI/nY1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+zBR+LcHMHeW5U0IaOs5vmOEG3yDC5QelDZjhrogFb5zCCwu3l7+2uK1tTN1eScsrUU0tuB18HeGe+YaFpDSB2BWdFmSMYjrLcEwzpZTuJcVhRBIaNGWDCagB9byuZOWt768Vi28SO65z1naQkZpMhKEUwhrcYt8mK2VHnoykI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwcXw3FL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRVX/dZc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3Ut71427000
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 19:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TvxXV7ZjPo2q3O6Cjs1eCezvf9qSl+w31CkK6I4ZraU=; b=FwcXw3FLwyRhYs8r
	La28tOJiEgZAx6VPkCEJDLhvgOL+9OqrM6+zb3od2H7ZFEhYeRd0fWbhQ0mYVluE
	lgvrO9IBYkTaZoulUOI+qzqdJbOWst+3tNUC60gu1ttDpzKVdHgHJTd5sCmlcR39
	3aTmOEI+dlWtjbZBdTzWZBmWI7e62widiUChJ1rNk+uQ+5Gx3o24AUYDc0Rv7Q/t
	jqFmwWbhgI+xyAJ01i9BRaO4/MHgkFBzeRMjpj/ahdRNzxffroGJMMMP6dxE8bRd
	2+aDh38h6+DqTxvKSAaFCGA5A08e6MnQxqyYsnG81UYeqPFTVZ7Sf9A3iFHu8bJU
	aY+y9g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcgeqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 19:50:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8596e4272aso159236a12.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 12:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781207420; x=1781812220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvxXV7ZjPo2q3O6Cjs1eCezvf9qSl+w31CkK6I4ZraU=;
        b=JRVX/dZc7RULyYv3m/Sv0pJjQB75pS1NSKwGe46urU9TBJkztH0blaD/qOkgNkX8kN
         xuTPmr0EnTAydHn+Tm7kL5zy7Jcrzd4MRJOQ0wpD7mbYEyw1YnQY9vgREwv37rFwSnig
         NdOLZ8OfQDJM5ZiuVgyY3st2joONo18JsLzwr3D9xX9tO7QSiwa5GUSKo1FmYT4pPMja
         /lY3HJVRcUu/34SX6AFYJ3Ria1FTzNatzdXe8NsovoQOqpp5rdxaNbsfC8Vocnzli8LM
         jc007UfDUwiEc7t80OLAODYKicKrpx8jjrhEVeYvy0l4Pjts+nO1yrJIjC9y9xvbN6De
         6edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781207420; x=1781812220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TvxXV7ZjPo2q3O6Cjs1eCezvf9qSl+w31CkK6I4ZraU=;
        b=FR+yRy6PzzXlFmaPcO7v3GYDtKAgkYL66/oG3Sxc4nz9NwnNUwKLDMbxLeYOsKVArO
         nM8AI0jD8h3/N5aXNtQdQ8pDGA7wDcoS4PgdQotrCvZf2b+Ah31AmvCBfFEtNhgjTvIH
         OnaBCLG85O8xykXL48QA3W+LpRoHWLeBVqlVa5B7vOCPyJjrHPCI4GiGB51g4/x7weuD
         8OY3xB/cHPuSYMh+YHJ6HgEuk4x/A4LToju7pxN5faJAZeIiBWZE+w+nfvWi8IPQYCzX
         zsBvCLajBFAblsrhYnHJK9h/VsGDtnhKJhYDgrsY78KpXYvYsdXbriXaVBsH59Hh/74v
         7psQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ilJbGzrWNLXfWg+QvlshYOvVuIsPOf2OiIkrHh8z29H4sWE77f+/dbVaOb07NBhj0DsUH6qWv4LYU5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDPQZn0n2jXjywH1XRME+4tSJx4SvahowVPS/N2RP6oI1H46dA
	Gvo1qSjB7l5GaWNiyWoMt1bZ8RRPKteSgGeQ+7TJJ9jq+ej6d3X0pVabseDpd4MYOHSRn3xaq6M
	UOKg3X4tGZDnGM3T3dC4W23gad73w1/oXIipdW0CNDin6H3P2zcSvW7rog2f++4tPpw==
X-Gm-Gg: Acq92OEmXzEW4i6h+Opb5YCN/mgrMUuSe/dejpMdtfGuMv/2BnxWFSBC61jgbJ80IQf
	U/Za4kLycXdpaq5l8yJff8GPpxwDKGdAhwJtPm1pHJiZ4bu+oC0o6N9V8r2qfCoTSFCJLop2Ttn
	INhwdwZ8jxSbB4Z4CwHYnQRZy8C4NZuqhCbhdi7FuKyVbycdh+PxctD9qHzMYC/bXmgSGq1Lfbh
	wUEvS4dkz/b2kF/PqaHMC8aE53vHPzVY12qACSTuX8WcHr9w1rMu5iIKq65MxY9IUZBukjhWzgp
	mZ1BpsptrxVgLPC3p9qeXu6GDykVc7mWwaY4f4VHDM68DCm78Oihb2bszWEpoIZ5fZBkZDCLEJS
	hfZozoVN4ZKKUFoUjWuvnKU3dkHFHOjqspA2ocXGuwCSibhkUMs9sFoDw
X-Received: by 2002:a05:6a00:39a7:b0:842:55b6:f5a1 with SMTP id d2e1a72fcca58-843367ea854mr4997068b3a.6.1781207420503;
        Thu, 11 Jun 2026 12:50:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:39a7:b0:842:55b6:f5a1 with SMTP id d2e1a72fcca58-843367ea854mr4997048b3a.6.1781207420140;
        Thu, 11 Jun 2026 12:50:20 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c93d1sm2711872b3a.36.2026.06.11.12.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:50:19 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 01:19:41 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_vpu-v2-2-bf8727370a1e@oss.qualcomm.com>
References: <20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781207404; l=2862;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=as0sNBNm6me0DlHIcQsWjM1ap1XelPu7sW9swI/nY1A=;
 b=MAIMFOzEl5yCuvOvAfgQadMj7g9G4RFnLe+nMQzFITlYAtUzJuvyL7hVNYCXokr4kx62H/z55
 Uf6xZQJGdDWA7gM8B0GCTS1IBnLcNxByPsVSLzPTy3Z/i9REPyysolp
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5OSBTYWx0ZWRfX3o6Ymcmv0meO
 Tj69ON+ZkMx6dUF1HcjNrg180E4Rxw0hBUK2OZtpj/TdqHxpap5M5p8/xA87SLRDm6k5hAmri9N
 6aB3+CI1IxEJD6zEYgFxH8KCAmtQ1KEuTO8IQU8wHf1q65oj2SOlk04asKRrCYzWuT9Wyipuaa1
 n7xu7I73M16gMTiOXfwmR/IYzkuW9n4iXK3/TvJ1F23/E0mR25CdsZpcP3VucLes96BhayyckCn
 2hJO+xtIgrHGNIcmDkmn1/Car88PbniW7TgG4kXN0zSwZ9zcqUYhG6HNpc8Lpp1JcjQVA+m3Dn0
 5zst/IB4e4hDCSaKQoyVMd672r4c3XkGgPeF97z58SW710k//mKvMNO7s5dQqmggCTikKGU6oor
 NrOnSxbtY7eIkYr1bQTnAxFKqBPwi7hqwMHB15Q/+M++nzAAEFZZ0FJc3k5wXUXrvQjQ2UvFt8l
 qN9ozEncv3xk35/5igQ==
X-Proofpoint-GUID: S8OpM064uEOd8Dz0mepOaU-U1TegeB-C
X-Proofpoint-ORIG-GUID: S8OpM064uEOd8Dz0mepOaU-U1TegeB-C
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2b117d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=R7IlRtgiQXbz3SMwMBcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5OSBTYWx0ZWRfXwC4pgHkm41mN
 XjBoqr2cCqDQEZMyKeC+XEYZVjlP149uykaCt1DKWremEJl3kbl4ZnmvLF4T5cV93kjCOYGa3JU
 tiJTP1tW7nyLNXLSHXnIE22wdT4Q9eo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110199
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64614-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A046674DD5

Add the Iris video codec device tree node for the Shikra platform.

Shikra reuses the QCM2290-class video hardware and programming model.
The video node is added to describe the Iris based video decoder
encoder block, allowing the media driver to probe and initialize
the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 1ccb0f1419aaa34d32f3c3eaabdb8727a497b501..b77cc9d7d65a6876b4aa058c4e0de8c89cea81d0 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -655,6 +655,67 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@5a00000 {
+			compatible = "qcom,shikra-iris", "qcom,qcm2290-venus";
+			reg = <0x0 0x5a00000 0x0 0x200000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
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
+			memory-region = <&video_mem>;
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0x780 0x0020>;
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
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1


