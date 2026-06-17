Return-Path: <linux-media+bounces-65103-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AVaAAXVtMmoNzwUAu9opvQ
	(envelope-from <linux-media+bounces-65103-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:48:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F446980C7
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:48:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h7tx5YRC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ECtQk/eT";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65103-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65103-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C5F013004D13
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 09:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE313CAE7F;
	Wed, 17 Jun 2026 09:48:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6347C3C73F6
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 09:48:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689711; cv=none; b=sqBi3BWExpl1cTJlU4XSAVpM94wONdnAwtJEJKQtsql58k2tq00AByOq+mcfscVclSwnaw6s+I/1AE/9oIgueji7N4B+TiqnXPaxEzrcM95kZkMEe4k5Qra7/BYwKFuZgQ7TgM7Yni8pSFMn6cJUaYFKHWITr4O+s4hWpMXP/NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689711; c=relaxed/simple;
	bh=RDlq0QlpZF1Yk6nwIj57XH+2UjgnGQXUyT5CSkrput4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FVbcJet8D4UyQakUDtbsCz3RE4Rv5/j9zfCULbNyEWhLijeemW/S83YYgr9JN3+Ug6MRSAaKDfLN7A07Fon4YBquV4f2bmEDrL3ixlqLHHYM9ztCX1okGcb5RZrjKNfgN/hOB1A6ap8N37TfLxQzKHQrI7KsPgsCbosSKjLvEpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7tx5YRC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECtQk/eT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Vxd22056606
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 09:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Rr/ngv/2ytVGX2mGHKNa46HYx0Ceuzd0Ez9qBttTUI=; b=h7tx5YRCnRmYZDXs
	MWt0D9ZXNWWW4NteemrIOjLcSQHaMvRNlyLyotm586le5nxORBKOAgrC99HuSNRC
	qF8fhOiG06h3/JbG8SX09dKPiVdixFaPiJdbV0xVL9WuHQQL3hLx03YCgtWApFzj
	T+VGc5So45R2gRO2Ftkr2Jn0kvpUMLBLrfT0khhX/9McXRRoBrJCV7HCIF4iugQZ
	ufWhtYjuF5QV6iBWF29ZPf1yqzwfa34DWibAKAmFegMiAvA8ZGZzZOJ+zwABFvhV
	CDXUT9qCni1W8fhsC1RDE20OZyU4PakkT+X30u/s7ZXFBwpjeBt3X1yFMeJ7FRNv
	a+032A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesagt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 09:48:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccee12a34dso12361376d6.1
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 02:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781689709; x=1782294509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Rr/ngv/2ytVGX2mGHKNa46HYx0Ceuzd0Ez9qBttTUI=;
        b=ECtQk/eT6RvNF5zyFZ0sQ1+ZmvUTwgQDmBZPZwYRIjOJ/medajyqWqpbNEoCii0u+w
         TU1lsby2XeW80+8zRhmeFvLXmhXMfhVOi294f4Igi4EaPFhTHDVOZEQBluLr8TPMfAMp
         1PT8vRf7/KLKTyNm2kRL3lSy956uMmSngdpfnUXnaFgrmdQnqBXweFpb6soqhVPl4M/a
         3Bfw0Y/tW3EOxqVGCOVW2Ee4xa08qv2FYDMdSJKDsMQ90jDI2FFrtsw0Mr1kYK++rk2J
         L4DyUlp5oHL9o10sYUTo5631AEA9zqhFmItWkSer3Y+QwEtZ2IbKwU5ZDrEwdEbwH33i
         kbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689709; x=1782294509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Rr/ngv/2ytVGX2mGHKNa46HYx0Ceuzd0Ez9qBttTUI=;
        b=pAFcybGw/rUl2TMYNB1aneqKP28a0vd0ZNGfPJi9sC432fm+euQ2x6gyxUSFCxErDp
         +yyZ4896+w72d7Ev9zZ7zfBTh4nCqYTj9VYHGsgMjlAUiVMUgKKaJY0T49m6xGII2xri
         iO/5qb7RGFioNS0aHGjb5DGjvMDTejvb+BjCTWGuNljPCP4/edvqHJQ5akUemPF7Xxee
         50gFYJ+tXLx3nQP91MioJcS1CF3e7EyBCjaCWmzZfsz23aVRLfRtoRUMwxtc5Q5aWRDy
         IBndA3FRw/RD8WbYtltJwHMuVfoA6iEqLAkSx+BQvhIq3AAhF5WeEGx+N2dGXQIKIq7w
         t6Ig==
X-Forwarded-Encrypted: i=1; AFNElJ8Aaiv0p+8VzUWMHA8D4vDTVWb+dkC/Ks1RFw4SKjKgWknVOrwjMOoKDsHhL3D4AI/XQRMtixFQyfe/Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz99WRiEfYqkeJDUK6DVmDnygU6ERz4y+OH2MyRlkY2z5gW2X0D
	CPw+rmXImbLBLpuQjZO4HWsPOp4wgxAU5WyZxfd35CKsYreRO0oDjZhHbKjAEiqAHqrsh9WdGs1
	rf4SWxtSr1kdoWB0QEbDEm0eO+2+gex5NCx86GImi8fDA5j/OCnXBFqxwI43YxjO8MQ==
X-Gm-Gg: Acq92OEvHGhNMcNFq7ZnWTsAwDmrKlXNia39ulThumBWWTNELsUpR9x/wuTZOwzcKY6
	fFY0/QLUYn2A/z0s5xSo+jUlH6+hE/Qqg3yEH/eRA3av5Bwdgxc169UGJVGUfqEQ/B1ZgkbMu2K
	kEPQ4sU+K/pNNjKEnbgns+KmVgbSyz3tgM5xSi6oP1ScBDSC58gwDK/0crBElN512ZYxw1ovpSw
	6aFlz1lktGu0CevkV4hsqscUG0Lm617z8kKSCfpD/hfxXmLAFnIg0IMsaknB/GYK5L+Xf0oPPGA
	wZmYswtdOtW45JXTXLCUp8oRDtvmq/MH+Umi+yPiBTymgTEoPY4BLHGRpvMMBTkWRmfrRX//ylp
	YRjZ7UghkP8vx+J4QtGSu7TVq5oBYxGjqeV0=
X-Received: by 2002:a05:620a:4410:b0:918:588c:d095 with SMTP id af79cd13be357-91d8e0ab2c3mr313538685a.8.1781689708728;
        Wed, 17 Jun 2026 02:48:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4410:b0:918:588c:d095 with SMTP id af79cd13be357-91d8e0ab2c3mr313536385a.8.1781689708347;
        Wed, 17 Jun 2026 02:48:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d9b7sm771513166b.41.2026.06.17.02.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:48:27 -0700 (PDT)
Message-ID: <f5bf56ef-a57f-4b1a-b18b-63aff94a3bcd@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 11:48:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/12] arm64: dts: qcom: glymur: Add iris video node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
 <20260610-glymur-v8-11-1c79b9d51fc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-11-1c79b9d51fc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5MiBTYWx0ZWRfX+mFC2vgDD8pT
 kRCYjc1RNPxmeBMl7GcVHVZ9cgVn8way2lfWFx1FLwbjlIUrNWmx6V8EYY9p64gFVXQY/ISbioL
 lXEUeVezPbOFhD9QE1GxOmViZcUwguI=
X-Proofpoint-ORIG-GUID: s1TwX4Db4iEf-xMIuj1skH0vYHu1a9EA
X-Authority-Analysis: v=2.4 cv=R6oz39RX c=1 sm=1 tr=0 ts=6a326d6d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LDWERgqoa3hHt-U3m1oA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: s1TwX4Db4iEf-xMIuj1skH0vYHu1a9EA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5MiBTYWx0ZWRfX1PbTpVu+xXQN
 6sVGfYGPD00XF6ZCeOF7UHFuY0bStHlnECIyQ1aeN0COsU4IgBsJ6burZwMfOGH1OprovZm5iev
 X7v2g9LmOSosESmdtoPcdK+B6zBukEbpmgzrGjTQ0i2hvu1kJtk7SD/4v2yUCDjrAqeNzHaQnpF
 VSQ/UP5ojXM2Dmt8h44Z0g7i0BYUPg2uS+0cJj+H66oun672PV4Lj1CTWrYys9LGUkOIIwgmgr/
 s0jAzj5r+FqbgiWxzqSsYu04MXXMyZdW3Ctmwn0tyXPN99D4iDD+jYHxmQRsHDXmLzwQR/yZwbg
 I4MtNiSPkeqsELIvGvAgzDT4IVmVJpaUEAPuXRmsYn4B8orJF+IC1jz3AB1//QsM1++mDhLhDNS
 eLbvbC5YpIq9r69B3/4Ofk3vlCxB9YQ+oaerX3TtPXCmYg+9Y1uqJSPRBJG/pdKpHvoewKK1jBO
 MO5/EeUHmJe9w1XGyLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65103-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91F446980C7

On 6/10/26 8:29 AM, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous platforms, thus different
> clocks and resets.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..42bcd03c4d3e 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -16,6 +16,7 @@
>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/media/qcom,glymur-iris.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -4788,6 +4789,123 @@ mdss_dp3_out: endpoint {
>  			};
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,glymur-iris";
> +			reg = <0x0 0xaa00000 0x0 0xf0000>;

Please keep the address part padded to 8 hex digits with a leading zero

[...]

> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable on boards where the proper signed firmware
> +			 * is available.
> +			 */
> +			status = "disabled";

I find this comment superfluous

Konrad

