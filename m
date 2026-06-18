Return-Path: <linux-media+bounces-65174-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4sy1OOzLM2q6GQYAu9opvQ
	(envelope-from <linux-media+bounces-65174-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:43:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4B269F769
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:43:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HCjf9rhN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FAx9ITxE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65174-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65174-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA1B330C1552
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 10:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F793ECBED;
	Thu, 18 Jun 2026 10:40:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06FE3783BB
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:40:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779237; cv=none; b=nNd3sXpeC2z+xIVBlLNtNBEPlrU2yBV0ng5260AtVownovqjQUNPngtj2RxwtR7TRsHzYcrxn5EkFeMSiGT2eYkVolmLLTryuP3XLuoN7xGWNqbbmSW9WZ4u/pK9Q6ed+UVpzm4fFb9ngbwEqlvYU3t2ZufVcor3NSvshaN818E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779237; c=relaxed/simple;
	bh=iPj1GW/qSdbvXy/m2TA9PC5plLIoUtFqYoEG4CieKos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gBjpBjxPeG+oGQmZY6dfOrerI5325ZwjWNp2pazD+cuO/5SlV85cZmyinR4DePTYoj5DLoDZCPDHJy8aSYNC+yuYntdFfyTHEj2T288IOu57t0hXcibIgDF9k0Zd/vYDOzdvPNUF02hEr0hzgMEk2cgLD83ROmOWxAVH3wPA118=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCjf9rhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAx9ITxE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAdAAv1567564
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Td9/GS8UuO/ePGeolAIDFl2twIGZizf7TvlVctc8VrI=; b=HCjf9rhNPuAVw0BH
	gBRfm7Am8zssdcIFqsVgen+u2j6ChfQHw06ViV8NjPyVI4w9IwjiFRUNFXVPk8eb
	G0DYU/V9PI7u5WM2HKDdYh8a2oMUU3KoQkoLBisQUj2kMdQlB8aBgjsA7gaRsarS
	gC6dng1PnQBJc1P/ufcxSaH68ELivlCnTlygJgOWmYDVZiKuddbD4vLzIQJwYS8h
	HeVfQvLnu8edPIAkCdw+SzeIMUZjiVRWSCsPP4yd2RGhNuhUmDXs1/s+E0uNfKAo
	RRiGPGin8NVgN5nQHu/bnJMJuzhRozzdsBMX1AWpftamMBLeTNtiSv/ZjSm+1tpM
	Z+NBzg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2jv5fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:40:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so551539a12.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 03:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779234; x=1782384034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td9/GS8UuO/ePGeolAIDFl2twIGZizf7TvlVctc8VrI=;
        b=FAx9ITxEWLPllEsH7dVME1p7nI2tQmYT0f8e8mgChuqGooSoS4tdm0vETsd+RYjYvn
         emavg8lkU1cwmePHVvTSu9hV96ulorbTKuH+r7qtT1jZDMXYm4R3xbt4lWvhpQo6uaEh
         ZHDb++i3LhSkFQzHw5wprtJxHJFrGEobxFkZmlffO8pCh9u/gnNSJ/EFAyl7Y1a0iqsa
         P2nSM62x9EaOaM7a1L/FrYrz/PxeuQ3ukTXYDeChXEQUoxsMXy4Z6f0sFvkoQKw5MiSe
         1IYI30U7PwAh3uTdT43Zof6DEHOz5+XcdpPrQQEF1whGERje7Zj+1hzwOPd/w2kAUN7w
         JvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779234; x=1782384034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Td9/GS8UuO/ePGeolAIDFl2twIGZizf7TvlVctc8VrI=;
        b=BXbkEkDnF5F5H91Qh0bJsBRYFH7fRVoesMlIm62suHpA/nEY3X1jLyf1CpXobyJ5JS
         chQHbUU3kaKsmIekiECyF2gJAIQi94IKXRnxyfr7zYK2cOu2egQil8OKzMxZetNu7xt1
         Pm8DXxTZVVxBrr7IwWOT9odJjJ48Nwee0Wug7kANibuGxKKck5jScmCJ39MYeMvJStuJ
         rjc8en6vTetQ3Lr0TU5o6hlGn6YwqmFWpXW6oZzsRFi7jgTbZ6IPJLDLIw8zD/lPCpDS
         1NQnFh6EE2lJr3jS+bcMti6jMJ1K3gvFJR9PPtXzQ3YUuOJU2kOCrvmcltDi5Ewo1/O+
         tNOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9VW2qhirVY4PikUx/UD/42EUBBMugH/RTI60Rkf6mpYmIAS8gms2TsK8ejlSvbjXdkJLc2AcrA3mMGYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySSfwuk9lQuJGZo38Vi2mwBtxYzvf8hviNbjD33qaIOfv+OnI1
	XCdjCauVNlpzJeB//5ZVW3YVmijN1BdJ1/JofXWH/Jw9GHNh1pDSoKFIkEwzjSF33j0TsMjHv2k
	bECiPmBRU7es37QtEW04yJyCaZmtJgJxlh8JRU1JYw551FOFkR8ozjb0NcL712j6kkQ==
X-Gm-Gg: AfdE7ckZRzLVOXIE7oPl2Q3dtedU/oD9hCzmXRLLMV3KZYJxoR45tP5nKmagpUE73dI
	N+0GgsTaf8kP4sjqPkyx5FXcDRRokGuk2mvheqRcBBEfDZRNj0mQ/byWXP0oclhvFbCH8y2NWUh
	lpvKA8JAapvuVmqCUUlJ44n2wPdA2yGYf5h9sD6E/QQMcZlgHL+pOFq8lBdTkFLRgeCHu+qaPi3
	qybgzXlvoEyuCFL7/Zw3dK8LPwO53klTRhYih3NKNzjjIXC9/qa9UzUVl/VbOQZOr2e6kqfqxFc
	qMu+ceQG3ZTZkM8sqOkiEN/6rQsA1zLfBTBgOcItCfxEPZNrvJ8dtRFH8kqawDgP1NGwPzIhbzg
	KN1cPqdFl3/A0fnO3Ac6ZvRYp+RNPShnLbB+RQS//pRTpjQ==
X-Received: by 2002:a05:6a00:6c9c:b0:842:3aee:12c2 with SMTP id d2e1a72fcca58-8453b1522fcmr3370466b3a.18.1781779234044;
        Thu, 18 Jun 2026 03:40:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c9c:b0:842:3aee:12c2 with SMTP id d2e1a72fcca58-8453b1522fcmr3370422b3a.18.1781779233605;
        Thu, 18 Jun 2026 03:40:33 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm17254731b3a.45.2026.06.18.03.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:40:33 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 16:09:56 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: shikra-evk: Enable Iris core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-shikra_vpu-v3-3-1a32e26a35a1@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781779212; l=840;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=iPj1GW/qSdbvXy/m2TA9PC5plLIoUtFqYoEG4CieKos=;
 b=u1eOdbBJ7MTDC4UO0Q1/IwXufMdM3RcgLnGCCFVwQC5bLYLtqhGGelWwDoU//oKQfVPxcHIIF
 Wkpyxiq8rYwCyPv2eHpsOPa/SX7OfV3lZXD96cjcxCLAWSXA5H3FFgp
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX+419CKowg0y7
 CfqRFxZZIJG+B6485Rd7s1JjXCw+m6l9Oe9HHbbkPP/qADDc2UQz2q1neJo3w9BE+z2Jn+m8gB1
 uZ0H+8z+nwiQq065VrZdJsPBwIQgS/GNK1YteQV4eWaDLCoNzAPty+81Ex3qtIDhp5uSnO3D3Qe
 ta4LjDyoNsG6UaVCkGq0NN6wX0vZh9+OrkiSJFykT06vTWvGvVs6+DB8/ImLQAJsQm8D4OCLOOG
 R5jdINn2lXH4byqdNusWgcmqHX2YK6bDxh2LgvAnYb6fj9sXof8EE68ZWt8f3lS80wsd4itISj3
 ilIYmNZ5fAszjw+bho7BX/5h0ZP/qUqt3pnswkpa2J8BXkGar6SHrigZJzARCFlDviC61BAfnOl
 JwcLXbZKEPbfh5BGKOCOA+xu6ZP8TJqxvrqUS7iP71CpeNx0GypT91H9CBcnzJLa8aAd3cUCSYC
 5lYFl0soRKPacAei7Tg==
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a33cb23 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=c0ntbg5kzuLjbw3eiskA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: IWV_TOeDBPLyGKh0bSIDxB2Od7UEHqtE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX/1R/jF0TqFvI
 ng/4m9Dn+LddxX0VwrLTKz/DcAjjH7tuWXC1zSJIP/NnQ6ZokGxBD/XTC4fshabAdEBLpVOhzdv
 HxKkAdd29u1T0V3I3HuWSYBrhY5ECPQ=
X-Proofpoint-GUID: IWV_TOeDBPLyGKh0bSIDxB2Od7UEHqtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65174-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D4B269F769

Enable video en/decoder on the Shikra EVK board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index d0c48bad704c61d17309753ba2a97e89bbfe083f..e2a3131594f0410931122657b12c8a6e70b435f0 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -3,6 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+&iris {
+	firmware-name = "qcom/vpu/ar50lt_p1_gen2_s6.mbn";
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.34.1


