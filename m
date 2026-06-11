Return-Path: <linux-media+bounces-64615-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YdneBeoRK2qS2AMAu9opvQ
	(envelope-from <linux-media+bounces-64615-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 21:52:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83F674DF9
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 21:52:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Yo6fWrbb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bt3ZO0ZV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64615-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64615-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 586EF3156E2A
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 19:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744EB362149;
	Thu, 11 Jun 2026 19:50:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44A133CEA2
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 19:50:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781207428; cv=none; b=QB4sicLen2h4WXDjua6m1nz4DtD6ZbTNjri8vZnas0KAZY1SKnzC0Bi0+/BHaSNM7qriqoGYVm+onE4ecKM7lTtPxYkJqCyYp30ml/6Tb2BIsENlS7PXQaxUqX23W5Kt6PcpLoB4aXFsU0sy//zvxyAbsj8KNeh/YBCXFpNj9Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781207428; c=relaxed/simple;
	bh=iPj1GW/qSdbvXy/m2TA9PC5plLIoUtFqYoEG4CieKos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSKGktLGjO7xptaPVN4k8NQz1lieewjVLJD0Zvy2VRgaSAOWUsD+aV1R3eta+B6hn9rJyZCJZTlB2jJN/jX7eMrSjxQ7shib0CNuHeTfVom5gZHRD16TyHWEkSuursB29NRxt3UO2Q8XT9NKtT22Ja5x0Lu2naVrtTv9T7nExgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yo6fWrbb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bt3ZO0ZV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3QXo1527152
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 19:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Td9/GS8UuO/ePGeolAIDFl2twIGZizf7TvlVctc8VrI=; b=Yo6fWrbbHEqTdN2+
	BXCMmGE/oR4TVPurtKi4M6rkVpTUtoKihAoOU4cvGMpsgMbuChFoQwpTHFzAAdPw
	u4tX1IexymsYYpI25vcFD9nrEIbLk7T5GWFYQw5+wYbB6zUAEnkvFiAaCA9VO1zm
	vm1pFpbA/1jveqNBGGVEpHg33p5GvyQu9U5Zu0rNs00YH8nUsgRwX8iwYd8bSZST
	RSjjkBOvrUDGZGfJ8KJQXtdCd+L4k9vXKIeiaVQS7x/MFntYLEWkGoXUFnKYLHVi
	Y4vlKQowdjseGxsDCiXY6kKl0DF0pIJMNMg+D7j6kJF0VCAmI0jRMIwGlIxBKEQk
	qtzeHQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29urayh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 19:50:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422382178bso150958b3a.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781207425; x=1781812225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td9/GS8UuO/ePGeolAIDFl2twIGZizf7TvlVctc8VrI=;
        b=Bt3ZO0ZVZppckBl32IfyDsM6SYxaK0rz0qn2vaABfJNk3Nh/GuS/ZAB0IvikD5sHnw
         TUmQ94GTTxQWPd+4+dM1oMaL3mP7BvREeTKq0i/AEqao4wtQl7ZMuiEdgTVnS4DExyw8
         sZayVU66SErrAhfVC6ojUDXpKWWfgqSC32IIJW/LpVMipZiyDsYZeSxIaRi8JOL5DjUl
         65aByLW/BVchBhhOtZ92nxmD2Sk+vEpoiVZtym9IL8RvKiYkFaqD/q4QhDBnS9DKB7l6
         XdJLQeDwCh07GM5iGxT/V4XeneJ/iU+rbXCE2axrcICwyoLC+b29OsqReumILLsLY9rk
         BdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781207425; x=1781812225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Td9/GS8UuO/ePGeolAIDFl2twIGZizf7TvlVctc8VrI=;
        b=Mw+RZU8ZukoV9R3p/avOejU55V6/2lzG8dA/cEj9zkV/fx+2b8nHtpQmeAPxhafuOo
         YqcHkXB11KvbJeTUvRFv3d2ga+tLwWAHpQdQtSpKrzAxl1MAKDqtDjpfKAU1U1G89OPt
         4XKEJKCzQmzbOE7bdfmQtLjHTwZubyxzIFcqeTlJ3e4LvzjHmORQ11QTZmyUmTKnR95+
         +gE0S8/NJjutdm7jWWW6O/SSPjdo7RBFCh9LX5h6dw4fQFA6BAHd1ssw8jhVu/zKXVc8
         gkE9AA1U6C9UMCns/i0Z2ikpYJk0550tkUabMs8nThbzXITaUbdMd4k5/Dk8HRHh39Dg
         9OEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PrN8nCzkpO3+0w4Eo6gByGluzXvcWq86DWvdioZqRac2leGpEuO7qJSQvHuNxqY3qDCxqTgPXNpZX9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqMw0cz6b8bXJf+x2t2oPlLxuNyYvlKteRW1wTCAuJFJJTCFAN
	l0ZVeBaGG/wSjBMf/FF/qh9iK2lKmbD2ujjJBkKu9cgmVt9MJTgYMQpAoSkCwuph3infnkwjdlJ
	O8q6foC3AcJjqIUpN88oT501cuLsja9el4T5Zn232VvWUPTnT0+6yZgRK9XagcM4xrQ==
X-Gm-Gg: Acq92OEhn+++ZQRA+IFHY1Pe37Z5kIKHF6N6EaeFGIgxBK26JVefjdyehkA6WdA3+mx
	mODMjbxcULyPSAYEyw8nmPhwQhYUic7tjvIYc3EH9pOWoJoPmFRjNvDrSLNNKQTk7BajtEDqA0n
	2YAM3NxroPGXZ/z3e67PKNWUWOmPJ+Y1bzWmV6Qpvr1I1+Wm8MMpvp7XkESdgL48LhHPSKpocjr
	eAEV9Ix5acLs96dcAFSzXbI31KrTinIeI701yoaopZ89aZI6tFjTwxfMM2zW/CQKorlZEwH7cP4
	18A+GpyWfAkRKSA/yj7+HpD32SSJ1rN+Nk0tD6ewXj49O1k0txvMNT23LbRURf4+RNccDV5c+Xu
	l9syk4ZrM1edx4z177qM9aXG8aHNZttvr/yMzI3kLZwPxfPMZCgrnI7Zz
X-Received: by 2002:a05:6a00:1412:b0:842:6004:3fb9 with SMTP id d2e1a72fcca58-84336bc5d2cmr4894868b3a.25.1781207425422;
        Thu, 11 Jun 2026 12:50:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1412:b0:842:6004:3fb9 with SMTP id d2e1a72fcca58-84336bc5d2cmr4894822b3a.25.1781207424932;
        Thu, 11 Jun 2026 12:50:24 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c93d1sm2711872b3a.36.2026.06.11.12.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:50:24 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 01:19:42 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: shikra-evk: Enable Iris core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_vpu-v2-3-bf8727370a1e@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781207404; l=840;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=iPj1GW/qSdbvXy/m2TA9PC5plLIoUtFqYoEG4CieKos=;
 b=0BddLLk9elfDid2qGrQaV/W6cgRA/MvsDd/saJZnUXolYmQyxSdrHMOniDHoXkqOZwWy0dIh/
 pgtJdKPsrF7D4J3Tlb3gRPrwMMjavdL0MKjVR8utfAqBX5X7wdFP+uG
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5OSBTYWx0ZWRfXzxUlMZnLJ0GH
 xfGzc8Oq8AM2M959sR12FQU9AmYmOU75Hr6+n0qV6hIfh3VF4pYS6VCz6im3qAkxCC2ug7H8qKx
 EJTbKQqkSh1iFyVgNkHFRR9BmHHXoOI=
X-Proofpoint-GUID: KqLlDg3vE4PevmdwZVpdgcHzngK1yBxS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5OSBTYWx0ZWRfX9r0pswQuSTiD
 qNqCFC0MrzLD2G5JRM9eqx6Rm2i+5Ltg6IXA2hv9m2ZgdLY0j8BvG8iaLxZ2iFOA/vHhBNGiMs0
 fyUA60rcFsrETxxvd8WwFI/iItZve5WnXGdujpMABvqiGwlTSsDbXPyEm3f+uqMWdWhDVPkJtJa
 54VWQsAOFSPGNby8+hJyRfo1vj/cdvBa44z7DCWqYnCHIK2kPnHulI2fyjjuw6XcQVEufyw3KYS
 RUjzjGV14bSwz554ptg8YHaza4sCLRrOFkYKFVAbrNzpvn6MmaMjAHQ5M7ktfgJbVS4d/F7bMx0
 v7gUv68EVOiIlbG2m7B5Qo8H+exC8vy0Ke1XpJefmwTvHkjwgIuIMldOx/Me9BoBdy0SNVMCBZG
 Q6Bu4OwLPHOhR8L5x+ZsMeXoN6a4neDLRE4QvKY66FqRcwbO5eTABksttdxsI0tEwI6aSIeuLZJ
 hxd3izrKk6JwehQ+sJA==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2b1182 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=c0ntbg5kzuLjbw3eiskA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: KqLlDg3vE4PevmdwZVpdgcHzngK1yBxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110199
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64615-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D83F674DF9

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


