Return-Path: <linux-media+bounces-55508-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBOcImrasmlMQQAAu9opvQ
	(envelope-from <linux-media+bounces-55508-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:23:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01825274485
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5900930F9456
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 15:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE2E3C9421;
	Thu, 12 Mar 2026 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmmBoa8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DRUqKLFD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A94D3C9ECA
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328477; cv=none; b=snHa0hdtXWUcgzN02UdO2Q9CPCRd28GuTjNWi1F4ZUFxLDQsLRloCMxGJS/GzyMGh89zZmuReeG7fmVPZ5QpRQF7PnHPpxXy9PdTBsuF4+7ci2uov/Xr1DA8jb1Cj6RrRYIbqNA+Ayqr5TTAMZiiEjlBJTIb3daqpgUP7XrXXec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328477; c=relaxed/simple;
	bh=X4cDjWA8XAFt7fsNjwtDKumSnpdsAxkUOQlbbaRz5zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OBka2SkHilFKYbVeINZ6e80k3G14nPaWdw9TaIX56aOdk8ZUIEo3doVVaOLEXZBIpHYkQ8QPB4zrFaWBp4U1FFVR1v64yWsLHdSp5cWUn53tWeW40o41+GCXPF7iIJ7hKEBJLNGApoFtxmEwvV3Fw3SE4molR2ulai3zuUqpKsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmmBoa8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRUqKLFD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9deRN587634
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pWL3fiXA9Fa8ntNChjGkVhOjIJEz1gSYeB7nZbS/3d4=; b=CmmBoa8sMZ3bJUva
	OaHd+G7y+KVjdgtBklNTj6dQF76OhSz30HAdS2DpCK7+dV1hSm0Ve3eltXSlInEP
	bM/MHkKW7wFTH4DKQbGQHZdU2TpxtEsqBkZniHSuojimzYKFDmLN1FewieQTHLoU
	+wkrBd7Phn5kbXQnLUtPiPB08MqQVkHtVVpwGK3Z/1WZigndDuucbhlNFDL5X3Jo
	exiGrQ47h/uDt2RoIASPQ/0hNlsU2Cp+jUW2NNcCJ0Pb90gOdLCV7Ud3EDw1qzwR
	yMT7ygZXGVcXJ1tU/S41vtQGirkBIXGa4YghBxB1HDHYSfLbau36QIjwaXtHPmdf
	bgl6tg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q2jgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77e5e187so583158185a.1
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773328474; x=1773933274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWL3fiXA9Fa8ntNChjGkVhOjIJEz1gSYeB7nZbS/3d4=;
        b=DRUqKLFDzStqiuJEYafwwxPRFbNG3QSJrGyrMVzAQiN6gWGz+Jx88FqmyIXIFgpHbP
         K3AcvvcvFZqt7B6ce7k+nl5AiVJI8fOEyFwsGB8JukWDwfGom0fju1Z9FKJ+tM0CayJL
         NCe4IFQDwfs6sm/6f77GWt4NyQhXJHW8TLBPXPsSAMRM2JkalHkcTJlTcIXfDvmh2X8W
         jKnpkj1c+kkTesShFbajBKNaJcOmTlIM22VsW8PY0dQj34PoOsNHwEV9oyvKNjhPRrMN
         KRxNLQKurhO1WYnTqIB1KOUCIQ1uWD0YWTSADRJ9h5Rc7irSUqiTbRccmJu1ev6dpg5Z
         lSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328474; x=1773933274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pWL3fiXA9Fa8ntNChjGkVhOjIJEz1gSYeB7nZbS/3d4=;
        b=c6hmYjeKVKF7mB+a2iuR3nQVG7eCQxP5LU2ZykcWP+brMYiljl1Vz8m/uoQYIbZE9B
         ulzdLRpG9arD5hypTcFVt0zQxw4V0gO6Y1pD4facEYATkGjRCKwKnqCiM3JGbd8cvmOF
         n/J6KqjUNLLdeJaelTRt0tlxa72WG/ltSksCc6A552ZpX+5Ta5L2k2+CO+hRQGnuInS+
         t4TQ8wp2hQBo6JJYcvtbehkagLU65CvCxw4eNAdSFlhJ/tg8WgQalD8LTT4JyKdr+ltF
         P+hhns3GtT/UEEMo/wT08icT1wLA3HoPaaghxscNEp4GpuR2/jfwWCqZWtyDeidJDwfw
         5edw==
X-Gm-Message-State: AOJu0Yz+MRIzQW/hCs8czJiZChuMxFx1QoZJK40OrUwd2RlPJ8LgxcKU
	dsX3Tb5YFItR0bDxAmUAAODNFcOPzAR43jpsBF1tTHjhElKcIqHM2kJ0xyVwEcxvGAv4yjEMnuh
	WHr5A7bUIHCNnThUlhxrEC++IjTksQasa2IOz/lBVVcadkszioEegNfgdmwy+KbsQDQ==
X-Gm-Gg: ATEYQzxfO2ykMnyqEoK+65dJF88Bsk6cR2NmmECq7ctTAsbFYMBtAMZJS9YNFaULhgF
	SqfEPLndiiYENL+EYWyYgRREgw/OYU3vD9ti286xUVB9ceok3ykYFtJWkQQzsZk0+kW1qxCKhxR
	YmY89kvnPLtqTek2ZEqaK6jPht59vSnbsuKAvBvewLeZWXUWjD7ksKHTfoNVy8+L/wQjV9NS66G
	lZ1eSPmixq46xrvI6GYp32x1qMt2VkkKg+9ggQmSnW2Rlzmro287PuuoW6hnBxdUCtI710M039C
	eLL8MvG6rTKRIMNGsNXSlOOMvDH25mjfMbF5OmCmBpi7A1v88Gves+3sQ5ky+PFnY6q/ZL7r5gG
	v3JKLr+d7S65KrhOw1y+R4byYRAqhI7lM2WusEAUaMTLNUJKLh9Rqokb++/9WIW/GGKg+GoqObL
	sHMDQ7md9f3yHIChST9GIOJe8jUHw3Sb1oyYk=
X-Received: by 2002:a05:620a:4008:b0:8cd:9aba:f5fa with SMTP id af79cd13be357-8cdb5b2486emr5083985a.42.1773328473923;
        Thu, 12 Mar 2026 08:14:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:8cd:9aba:f5fa with SMTP id af79cd13be357-8cdb5b2486emr5079185a.42.1773328473338;
        Thu, 12 Mar 2026 08:14:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm972822e87.61.2026.03.12.08.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:14:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:14:25 +0200
Subject: [PATCH v4 4/6] arm64: dts: qcom: sc8280xp-x13s: Enable Iris
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-iris-sc8280xp-v4-4-a047ef1e3c7d@oss.qualcomm.com>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tNlTLOlCvqnTauAmRZZ8XPo/dz1PdM/NDbJfDYDq45A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsthRRY+bhDvcACRrzx8yoBASgNjQt8b7Nsmor
 kaboSwwrZaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabLYUQAKCRCLPIo+Aiko
 1TilB/95N35HmLGggxXxeKDmXXT6y3f+rMGDyd8mhZkf84hhMDZ2hUnWfDI7t20z45G5Jte1clY
 /ZLNKYKuaaTCDhEg2AIrgUxYJtUmf2BffqqMCKtB/TP0IHPIkkRrqq3vrjw5FpEFdm/i7UVuzG9
 fHaqI/OBnbzmQu/N8DCMUNKvbT5tDlwoi5UkWxKMROTA+yOQtI0XX8YCBIOun4x8zkPi1Hsvhmi
 YnehHP1qOmRzDDjtO+8xFCNAQJf+SIxncNWdBBSyv6Z/779kPO8ROEzAi0Q71e+7hZa0yaWi6Gp
 FlD6ONaOngue1Xp43gPvvCtCsu/QnErMhfkpLnioEaHrlj//
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 36yWqjGruL9XnVAFLxcb-27b8s4rB-bS
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b2d85b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ie9TG8L8bN-JZtJQupEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 36yWqjGruL9XnVAFLxcb-27b8s4rB-bS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfX/QmhKtu9VThR
 FRh2vS74rspl+f4w3Jz67By7mshjgHUuH3Ew2AVP678hpvpyEFjRZ5Ej6JoFdefqHVJCY7+Cou4
 sydWposd+3xIb2G3rNXH9QG0U9tPtsN28h57CeN4vrKoejZfz/ZP/Hw7WEphUkNgm4w4gEVdxEr
 +SRgNEDAaX6pwMVwnm7SZz6CoJDmB8xid5Si9OLU33I7SEnI9mE901WxDGDFLnP1jOjevJu8gWw
 QAq3gCCrKroILZ+07JXFcQ0U/gY3LoduFKcKvATdBHghBvMMkjTvpRx/xSsFZ16NsMKFACTrLd1
 AMpb7Sn3u90M1UBYf4FqXf7TY3EUqhs3kiq2JvTPAi6Luej749l/9LYw1edcszd7Ojm25jXuwe/
 sY4WATZMkf6GNFSSU7AihdmBEo3IrxvblP2Jv/L07b117fSF0bw6MMRf2McC96cQMIX58+vwtcp
 eoITXLYMl+S5AzA8DNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120121
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55508-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01825274485
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Iris and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..0eab03495b8a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -932,6 +932,12 @@ keyboard@68 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;

-- 
2.47.3


