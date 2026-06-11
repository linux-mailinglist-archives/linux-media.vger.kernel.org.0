Return-Path: <linux-media+bounces-64551-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lAbiBidsKmp7pAMAu9opvQ
	(envelope-from <linux-media+bounces-64551-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 10:04:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A695366FAED
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 10:04:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FSOyVnmt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g0M1DOGB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64551-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64551-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02109302622F
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7760A3769E4;
	Thu, 11 Jun 2026 08:04:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F112C0F6D
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 08:04:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165088; cv=none; b=tvniUYC5/3JYhdxMQO1erLLxfWEmbDxBQ9fJ0Hr9ezqk0AeI8n0dfPWNrbcz4eeM4OdS8vq8Zw2Mhkk5h4pkln8En4YrpUQeyt+r7Hpqlvu/hLCk+RcJtL50ZAFnRUIVJTinvRRUQaw/8VgSTJkL3AvoRt9N741ar3ew7lIj4ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165088; c=relaxed/simple;
	bh=+SNiFYWYeunpdTDNpXz8CiAxvcMkNdwYzUo5XyecIc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsaPHJOA7OMe22ZbfHLOKUk7ydnqg3+GD8JExgD+8eWv3DO2J+ZAiF5gLJJwRWCkcdOBOxdCxfINZBP39zfPupUkonEtDd4xysoXrWN/g80CteH9ENHCsCm/7TbCTyL2lqu/Bro3cOAmFfl1e444RQHbaVGJXgdQnrf7WnpE9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSOyVnmt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0M1DOGB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GFUJ3863226
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 08:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcPoGpvWH4s+yFG19JRwBR20hHx4EyKKXYhWPVnP30I=; b=FSOyVnmtaK8OqCiq
	XgwVJV/fsPgqUQ2Zjls4qlq1ShFeVnieq2s2vOhSzvBkCfOTGjjAtGiIJ7So0gDQ
	3MVndu3dMgiawolPs1ovDDI7FQtD6gzIYQ58gebHB2yLcpMkh6cC1h68240em+mH
	QSf+rzr3O/mdCK/j+/5/CY/UXGMGGvLJ8Q95MORIjWu0qhibgjhmx1UKf1Vc5JUi
	JgNxr887ZHEFLKU5Iwjsz7uTIrOzM11IBrKJEWQPeFw79KUzSb1rVquxc0PJXl99
	Uv4o11XTx3UJn3Buikyx0NDVMcmDbJOxiB2+xzRYCd4gisgoboRGFjeD0mdpGrzm
	ruGw1A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sjdj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 08:04:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178a632a12so20940971cf.3
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781165085; x=1781769885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcPoGpvWH4s+yFG19JRwBR20hHx4EyKKXYhWPVnP30I=;
        b=g0M1DOGBl9W6eq7I3WNKPoLSCB+/FN8Yl41Vc2MtweNOrpzyjwnljATe9kDn3Jh6gZ
         X/S61qjQlesOvl25RTt6MN6jp1Gp+3XI4Pcur+3KftrJykFLS8GqNYABLS/juqijwyuh
         hF8mp47P7x79pCk9nNeNsnknGCVh4y+nmN/1o+5ozbFDhntfYb9A88CbYfGfl2HAtCS0
         yiA7Cz0i9Zbdt0YMe8e4c7KFcbRoMtsXSZXnVmJK6UsP0FbnSUmXVzq5R8cZCOy+iTjF
         +GPW3ztnq4UCHGLdTwORTkhCNVeUQSRMsbabg1rtFQiqQ72Ka5GhEwwYx9U90feRmJ2k
         cGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165085; x=1781769885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcPoGpvWH4s+yFG19JRwBR20hHx4EyKKXYhWPVnP30I=;
        b=Yo7ugWutW2whTy2EyPtgCTipjciD1n0+zyJrN4MQl9OVMRAUUr/hXv8s1UnBzNjXg8
         lhezhK4ADFLmYoYfbjH6tjUAT+tCBg1yAaloTLiAN2U2sulq1Ng6EDRs4UvrSLzrjjbS
         cvZcnsshTGkozILHvW5nxx9BRh420Ja8wqBS3/SvbGj8mPhRTpJ6659unf3RmBy7quZM
         kQnpsjwMmbc4JUJOzN9DPc9tMLzFjFZeajKZJ7BfG1yCZhjrevYjEb3dYs1hgq6LeC/q
         4OvSRTTygS8lNWyhjzXa5Gy8Kp5klQ7n/QJI3ZINV1Q92/WP8tA2jddPOgIuc0M1ZP19
         v+Hw==
X-Forwarded-Encrypted: i=1; AFNElJ9U8j6vAc0vLPQA/1UVWQdU1hx0mKkK3US0nrYOsis7G1e5WQlf3HycYZtqqR1aXXocj2mhl7kfJOlTqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Dmr2EcHSRMCAbFRYmKwUOyXQBCWKNgCB9+XK6lbpFSl7y2xu
	iJosWb23QTZqVxFjKtOTOdsvCdlxkT8TG5h3qab1ZzpkJUsyeMVQGkAk1D7NIMhGnNQiEje6ekw
	WYgPObWGwID5HQE54PvMXjw97/57RwJV+aCGfZ8vjuZTosf2ReKmNEVAJTbzUZI6bDw==
X-Gm-Gg: Acq92OEhQz090qrvXu7wAakMKpbkjXz09f1VAkDL6Gh6oVXi4qjcYz8QQ7dl37qiry/
	NStKUUPSMuiFOtSoa0mqR7QEHPWH9eAUFOvw4SvQ7aAxcEFwV3NBaOkOL3fSLY7PLsyw+HbgTGF
	h2wtQIhIkLuQiwWAVVcSfIWBi+Cb63A1WCCV1UIWnI/z2c54FUaqHXcShH98WzyH3tin3BP65VO
	I8LWnBCLY05+q0fi0zqXwvANMufxj7Z4LVTyx8pUPB3Eu9tpog9PZdLRXXdm4X7bg3Pt3M4XGN8
	IpJeL1M9Sth+etFPkAQ8iZW5Am5Uj3FwmbbZeqoEAxpwonUn8Cdfa5z8kx1AwmHdVMwjGr0Ah1u
	nsWX12GSsdemm7ANybeptssOOjg729Vy3gr1wa8RG3n2uf95puOfIB+vL
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr16745421cf.3.1781165084837;
        Thu, 11 Jun 2026 01:04:44 -0700 (PDT)
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr16745051cf.3.1781165084377;
        Thu, 11 Jun 2026 01:04:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb5abeed8sm24972066b.45.2026.06.11.01.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:04:43 -0700 (PDT)
Message-ID: <c37b4ba3-c629-42e3-ac35-dbcd69cccaa0@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] arm64: dts/media: qcom: keep PLL8 out of Purwa camss
 hot path
To: Ramshouriesh <rshouriesh@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
 <20260610-a14-himax-hm1092-v1-6-0c9907da47ed@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-6-0c9907da47ed@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kKvm3tC5QbjEed_jSz4lQLoH2VNVk1vg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA3OSBTYWx0ZWRfX467E+gt/ncTF
 MKd2hmjnSbQr1+quWGXeuM6qWFfzUxRH7S1INQO4vuxI+6aTUlOUvmoMfvWdJajBs82xgilwd6i
 myhbPtK430LjxJLUQwz0Umpw2gs/g+o=
X-Proofpoint-ORIG-GUID: kKvm3tC5QbjEed_jSz4lQLoH2VNVk1vg
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a6c1d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YywNEx0Wz6o6_ceNSdAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA3OSBTYWx0ZWRfX4RWKI3/QNrCb
 S56yJBtPcn/a2ZPf3LDJsUlVyDRrRVv/aG0r+5HCl8Jwm9z/qzln4GzyW17IaY4khI4mTEUdM1T
 KiCyWiB4BixJuAoypXQ43wjrDpJjCRTQ+LIxLWpdd+adNVKWxvF4NiurOQk1mZ9yZH9I8VU4BYd
 pT4bB++M1m0Al3ZshkmVvkna5zCGIAGvwCg3LErrGs2w/+t85h7rzyqEDc6e06+ncj5GiGyulBK
 Dn9Cs6fE/q0hegzhnAY3M6gmZ93JQRrNyobsJ+Jbud+ptKOS2CEnOxX1L4NANtlBbbAUP50xWES
 k1vkNxL72J3FGVZ1qTiJfxQks6lPHcBVu8pFNqNklaliWLGCBfkF7IBDCSbe+e8xd1+mr7HwAGN
 gA0igE9Bej55rBzxEgUWjgdw42zyv8F9USDFxHW9O4/fUiu1U3zC8Ho7sYJgNvUdXCGkVvWtaDs
 N2mr/DK+/lEHlQqq22A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64551-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rshouriesh@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A695366FAED

On 6/10/26 1:09 PM, Ramshouriesh wrote:
> cam_cc_pll8 (defined in camcc-x1e80100.c) doesn't latch on Purwa
> silicon. "Lucid PLL latch failed. Output may be unstable!" fires from
> wait_for_pll() whenever something asks for a PLL8-sourced rate, and
> the camera pipeline ends up dead with "Failed to start media
> pipeline: -32" even after the qcom,x1p42100-camss compatible is in
> place.

This patch is not right, seems like you're missing the hunk to override
the compatible for purwa, the tail end of:

https://lore.kernel.org/linux-arm-msm/20260507-purwa-videocc-camcc-v5-6-fc3af4130282@oss.qualcomm.com/

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 9ab4f26b35f298ad7c6c361b3e232edf07baf223..25cd547caab8fa64eb1a134068b77f5178f5c248 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -6,6 +6,8 @@
 /* X1P42100 is heavily based on hamoa, with some meaningful differences */
 #include "hamoa.dtsi"
 
+#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
+
 /delete-node/ &bwmon_cluster0;
 /delete-node/ &cluster_pd2;
 /delete-node/ &cpu_map_cluster2;
@@ -36,6 +38,10 @@
 /delete-node/ &thermal_gpuss_6;
 /delete-node/ &thermal_gpuss_7;
 
+&camcc {
+	compatible = "qcom,x1p42100-camcc";
+};
+
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };


Konrad

