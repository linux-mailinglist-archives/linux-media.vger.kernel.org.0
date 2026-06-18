Return-Path: <linux-media+bounces-65173-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t0bJJY3LM2qqGQYAu9opvQ
	(envelope-from <linux-media+bounces-65173-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:42:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061469F72F
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:42:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Twmne1MZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=di3TCsG9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65173-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65173-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8466930841CC
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 10:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395243EDAB3;
	Thu, 18 Jun 2026 10:40:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695EA3EC2DE
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:40:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779231; cv=none; b=rniOfyrhq63fG2rxXVCNNK/1/Dc0HcGRkYR0u6RHGB14Wo8dpN10el+JIh0iuK2LsvZwNP8yLJY0BAi8b8Y5gGL3BvpFBeQkDJZRjGFKTEqFMSEJ8KYrIiSHkKO4mHMWzp8TGUYMfTqWlNfmbXMAd5/nP5RW1gZkGIiHTWX0SPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779231; c=relaxed/simple;
	bh=bvJsSHJn1wMIY2sMhHsk9OqRNB88NkxzAhcUkRGHK2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHRlo/3r1jjLoNG5fi4LBusXGakCkDgikPdBB1vj6L2FQ0K3jHt6GEKeqy/oHiSaP9xAG3sXQayFnXsKkfclv9Ksxz6gHsAoNgZaH5QiuA0DCkPTtjmxgIhv2f9WaoeuE7utLGyX3mah2vMiBVMTjXW/io9oFc/vjq4G3M8hmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Twmne1MZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=di3TCsG9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DZAn3399910
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+wmvz3/hhyQfymHRBOe6Vev9M+V/PwrFjFJeB4f2ZXM=; b=Twmne1MZNzuJGeFf
	3B3UrzUItdxZ/zG4NvOjMZbu80p/s31EiqiQtTJRqsTWfkmu2/6f1id3sjhNHYuv
	KEHo/Mbna55pl9m1nShgTsh3GmKcly61YKMvLaRE3+pAkpxS8+eUB690aABPIqjS
	mSvN7ttWr1pKhATWIgB8q9Gvd+RfU5YJvRV7m0XrTyNGooMWCx/nmVxnBJUPnvVD
	EGprhom7G3x+O0WY+x5XD1n72i8KmxCYm6qAPHVZ2GaS/ItlIEOShIBAGpjEjEn8
	bZNOjnz6difGSuCY2gbqC2yAzj162jU62eCV2D0oMRE68br8YFZbvq0rZOuTjN7M
	0irKAQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vk30m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:40:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84540760dc9so878286b3a.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 03:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779229; x=1782384029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wmvz3/hhyQfymHRBOe6Vev9M+V/PwrFjFJeB4f2ZXM=;
        b=di3TCsG9PU2s2NkCHy2pJsAB0VDQEH8MCPlhf7jIvdVW4qmBJUKlYEYmsIUI+L+nFI
         06+zCiGdkzHSHIctwseygPcDQkthdasJXN/fp5+qQxCndgeD9rHBSnaH2+OGGVr31kSR
         k7g0YOKEmd1EeAPMqX20jkr6ka4VGcA/CRcbV8VT6lTgnJ4YctWIc/MC0fsIKFrcMIaR
         eeZqF/whuHygA+5z7DJ3X76HdCjQL0vubLKbzcRlqrQ/SjreEQZa4qkgVEThW+JejsoO
         /K48qNVq7Z0LhJ0BSt76UwhGKeSxtZmlbcgsHNjYXbmjqwUAtSD1+O7I8CGuMQ7w/as8
         YjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779229; x=1782384029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+wmvz3/hhyQfymHRBOe6Vev9M+V/PwrFjFJeB4f2ZXM=;
        b=qsQRLqihmcm0nqz8/7JspwrURJcqpEwkf+UylKGMAbpuSHfHyYFMdbMHrONxJi9Q0B
         twwG7T6AcxMr+pSxTw3nIWyTB0UrwBpH/d7oifeR5wbOjz9S59xNT68N/HX6vyfQ8A+Z
         ihyLdmbHR7OMki7kFb68ZOyTlkGmhelzAHiJ0EsxrIbveft0rKsjAVD8knhWmXDFXyEB
         Fj57rjPNgmpEckghQy0YNkoAgJa3lOCBpqVWlrmlSNNt+RxfwDM4nXK8LQpLH+s214dC
         NDovt2Bpi/zsFzWkhK+ktXhQeUKygPeFCjetyV850mn5mSqL9T6RbTLKuOdFQCIKR/Pb
         Tl7g==
X-Forwarded-Encrypted: i=1; AFNElJ+/gbeDLeb8u1bCJLKcnhssOGf9WGly13ZKuvscS5wXau1F2u1qNcB4sSRlnhDYtSDNdAj44lAF7U0qCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTzvKDZy8E4k5PznW7uf8a5s2Fjq4UjwEi5AWmuHjrx44wfsHt
	weSmRdxMO2rOAzIAxEO1ZY5LtHg5daTYPB1e90eYw7LtRlZYz6t9WElQL1Q6OuI7NK3x2Em9UZd
	SqAH11n3tgexlC6l0g2NNAQsqYx63iGFtM+GhNx/mEi3iOW9jWBybS5E60Ff8I59rFA==
X-Gm-Gg: AfdE7clI0/16pLVdYxOhaC56oNjGFiRUGE/wZwGCcQAuykQUB5Rny0T/bS4+eU0cQiQ
	le5dk27hC+JvWD5ymr8nP+GrDSawWWciQzhtVdgbr0iTPoScLsilpqZZxhH7DHkXC016g31lAtM
	04B9nWZkjpXIE927bf/5Kg/PQqZEU7JgV0NO1d/6CShDkR8uRhghdvttnTlcq+BFf61A/01gaiD
	5tHX6ik+Xhu7pnczlFo2Uld2f5+U63NSsUgWlN9Y1DwDb8cgp9HTOV5fb/IyUcz3qLOLWQ45iyX
	e6BO83Aa6K0b14IalqPqtoyBKPPjbFnywVo0dcA08qKTI0340SpR5WDgvY5MyV5Y3rTMx2HBplh
	vRPC3GJKu/llHp6Hn2LlQxlLH5tJ5MoBfXT/GWdqAqBVFcw==
X-Received: by 2002:a05:6a00:2d17:b0:839:44c5:c321 with SMTP id d2e1a72fcca58-845247b623fmr7831513b3a.44.1781779229014;
        Thu, 18 Jun 2026 03:40:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d17:b0:839:44c5:c321 with SMTP id d2e1a72fcca58-845247b623fmr7831482b3a.44.1781779228560;
        Thu, 18 Jun 2026 03:40:28 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm17254731b3a.45.2026.06.18.03.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:40:28 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 16:09:55 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-shikra_vpu-v3-2-1a32e26a35a1@oss.qualcomm.com>
References: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
In-Reply-To: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781779212; l=2863;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=bvJsSHJn1wMIY2sMhHsk9OqRNB88NkxzAhcUkRGHK2M=;
 b=8HvYdksS9yPrZlLZNGFVEEz26pDMCA5lCv+cWsroIYFY28xZNoDG7uPuW7V0cionndvNgj3Mp
 Tc2ylHH3ANfD9MgmnGu/17z/22QrnBN9fDaaFiaAYCkU+pA3KRl0e6+
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: NQJS57XBLHhoud_q8XQCE9NSMe1pqVJX
X-Authority-Analysis: v=2.4 cv=DNy/JSNb c=1 sm=1 tr=0 ts=6a33cb1d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=R7IlRtgiQXbz3SMwMBcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: NQJS57XBLHhoud_q8XQCE9NSMe1pqVJX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfXyZ0X1HmVV2J1
 Ko7oiG+n+4FvekfiQHS452miW23sjqA9EAMN/V+925cyiKF6jvlFs6mwItx17pEtwvpxr4U694A
 t87gcE+Zre8gExPL2uo3uyCXgNyNbpc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX891IVW/SLTOR
 zP9Rg9NT7pdCFK/o/hRl9hbqQVvJvmH3vucFTHocLaRi5Xx5zb0Lt+dwRvUxKCjiWrdQgetC2DE
 0i4QM68QrucCaCGkW0bONwJovzeKWstcAMvFJ9WCat+CCSrpFQaUhaqFdtC6ma5FNK/5mb77Nkt
 Fn/GvFIeheRRPgRgur7McRS5xBg7LBivmWwTRBNEx9zVUW7nk1gNywhuyAQ68TDw5xvqP73eekm
 B8+COi/wmTsIOPqdBPmLFl2Dl+bTZS3cMbT1S8J54e+KwnzJGHls9RiwFjq4+EaAopUlAfo8c88
 RbGygOfkQv/SWOBdFvUkECZOVTDXHcbrGqPp6yc0ViqI2a+fVMubSqT19o2ZXOL0hx4abNbs0CU
 tPfI2IsB9wc59eNJ7Diz/5BSNBpOzXpPLRrn4/zSCCy1MTioWygbR94R9kuhjlA1ZnmCz2/TpxX
 3dcrJILv7WgXhdzprtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65173-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0061469F72F

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
index 1ccb0f1419aaa34d32f3c3eaabdb8727a497b501..d8edd14d1f81a49e352f6939d27ea9cf8bb0f019 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -655,6 +655,67 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@5a00000 {
+			compatible = "qcom,shikra-venus", "qcom,qcm2290-venus";
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


