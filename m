Return-Path: <linux-media+bounces-61003-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ik2dNaxn/2my6AAAu9opvQ
	(envelope-from <linux-media+bounces-61003-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 18:58:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 562CE50096A
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 18:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67C3F3003996
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 16:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564B239C01E;
	Sat,  9 May 2026 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGwKaC+2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DjCRj4LW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B15397694
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778345894; cv=none; b=KeSR/E/Z6qYDXD66q3rzjs6DLr9A5Jm6MQIvTy08V5o+kFEE8/er6EkiwBZUtFhQIsW1YBfgrMyCoFXmh7EP0Bh5LDrh6k2lmj+EKDxMhPblWvscpC8utZZo/riB+y4KEO8ehGxizep71treJxy39/RiQVzzLjqYEsBDGnZ7A1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778345894; c=relaxed/simple;
	bh=WNTc0OGO2a4taecvbw4qU+LYVnU1uXeaDf9Wyp0bAOE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cwhntIRP6kGDxikh7tNCYLmODkV2lSHHo9+Jv23uey2XtlBHh6NNL7Tt3qARhn6N2atmUH6HtZcDofPYd5su/9Quqdl5GcCzk7+zwQCWyheV8RmsEkgCdMAr0gh9jZjSMO0b1qATphNz+Jq8IIYzCR8mPOuTm4TUC0AiI3QcXjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGwKaC+2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DjCRj4LW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6492pjnw2866503
	for <linux-media@vger.kernel.org>; Sat, 9 May 2026 16:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aG81+2i+7FJNAObHDDs20lBo/zkXJ9T+aw/fqgDq/mE=; b=GGwKaC+2k6E2YZ7J
	dtwr1lKS/PsHv+vQ7zpR4RDncYap1jlbTL50665hbiCqZa6LOTAU874d2yCAxRbv
	aSdWaqS+0GL4DihkQ/Uevpa4kpaehth/jG/LIUroyNfqjwvLQvBMYx6abr9PHeY/
	ZpEJJ+yZBvtyNDBoVRCK3NENvSPyYforSwWYwli7+6oUnMn+GSy0BWYb53ly+5Co
	VSK3o1NB0i0yISa/klcRo/Wzz6p9VRzwh6JLQAonXjGN9Bn3We87ss+OvDh5F9AV
	Hy+41KrfSocn4D3r9A+Gana0OBgJanSL8L4ND8wXO6YEVKt4KNqoWYKmfCmg+9Hc
	wrAP6w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1vgy1d9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 09 May 2026 16:58:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36629e48023so3265900a91.2
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 09:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778345890; x=1778950690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aG81+2i+7FJNAObHDDs20lBo/zkXJ9T+aw/fqgDq/mE=;
        b=DjCRj4LW5npJeFk9nzdUUK1pwogvIaERNaIFOcbaBKC+K9sdYq8o0gyROtT4wk51Zf
         oGBXYHkFvI3JJNNjK9FABDsB0s9UGHbTk9tfYlEXkGcxwdq4CbCO+8eUuHI5NKamiGJy
         IGhgNWfTgaFnX75GYPbz8tObjLe5Dr2Y3qlVztEpTARGRKD9HXuOApmP3jzk8B6sUozK
         MC9ffdazICDXC3a2JW6WrPrvdel1ipqkdI5hJj/W4txv55AGUQlJsROAzA8N3SdBfk+n
         Zu7MI+TreGWXPyG+jnI4sypNEFPXMwXN6JzymQHAurW75dfVIbTnsK0JzAQDZ4tVmth3
         duuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778345890; x=1778950690;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aG81+2i+7FJNAObHDDs20lBo/zkXJ9T+aw/fqgDq/mE=;
        b=olX2DEnctcmQspidyka8X8u8VDFomN7Gg976tRDnmKXPQJz+/N4n/NBDLgAp6D6VhW
         IeTfwLytba4yZ3upcKOPSKa46+qE6N8eglo3Jr7pozS4Dwj7HuZ8MSj031tr1BHAiYPT
         zAXfFwl5DvkR53+Gxe3fOd8LVc/TtjxwIAzcfF6kwMplkYS+wQufWxU0Jtpf3uIhQA8y
         k6PBUV0vOP5clXh3jsmc6KC4yG1vIj1A1Rfk6Mefqls3AMTmirQaz0bSM7tjVfOd7ET9
         iVj06wAQdS4kD89WqIZeaZihPlAns82B0A/KwBLuBEp/G4/ctCz3meV/N2lK0A60uV7X
         32cw==
X-Forwarded-Encrypted: i=1; AFNElJ/VLvZWYaDsZWeK/cXAEH+JIJflV6mnYfFGkf4u3dy3HbBeZb8S6hgmWhsoxw61KHnIYhHfiT67bO8S7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAWKTT0hsEF4wrXVNntSQIsknc5xtgMJIbmspzqCA0FNybwXfK
	j0p9N6leBH9KLEgShjzykD81vf9itEY3VkGMVBWpzQkd+BqLIXnmwok9mgN5tqsmtZ4zsTlZa2Z
	EiwpghRgTiGWFCSLvw5p3jYpvzSvE15uPlCyVep2tUIKAFCQvdFIjOfEESjmtAEJmsg==
X-Gm-Gg: Acq92OFH1Wd/EHSDdQ9sGZR5TmDhl9zMb68yN1vGPmONDF1YWhNeQIh16ZnOEYPehvw
	VrL8TmSt6pw5jQYn+AsCGba+tZsiQLx0PLlLR1tinxGisJf0gafCu5GZKtQqwZJSCxwNtRY9zF7
	ber3H0MjDo/6igElEg/zxX7ZiGfvwxc5+mss5am6EHAQHvUO7rNVGf6hmiQOQP2pSZqA00VCHg1
	2HQhd9Twfvnp0mQvbkHNzj97fPcZGDsPU6BHb0dujbjhFArj/rZXpEU9npxywWBTensZqFVZlYu
	sF8W5wF7SCeEF/FpWZRjHNx8S/FNVJRyUoW4a048GZ86bqI6y1+8sny9kp3CpVoZRF/Yf5yreRe
	rQtWWO2K77js0DaqTeNWfZLVZheEKJPe9pEB1IMjs+vQ+TAxSQJg=
X-Received: by 2002:a17:90b:5603:b0:366:479c:59de with SMTP id 98e67ed59e1d1-366479c5db9mr8171377a91.8.1778345889990;
        Sat, 09 May 2026 09:58:09 -0700 (PDT)
X-Received: by 2002:a17:90b:5603:b0:366:479c:59de with SMTP id 98e67ed59e1d1-366479c5db9mr8171370a91.8.1778345889474;
        Sat, 09 May 2026 09:58:09 -0700 (PDT)
Received: from [192.168.0.9] ([49.205.255.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35632sm58541735ad.53.2026.05.09.09.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 09:58:08 -0700 (PDT)
Message-ID: <34962003-c54c-a64a-2846-8f741fec5802@oss.qualcomm.com>
Date: Sat, 9 May 2026 22:26:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 13/14] arm64: dts: qcom: glymur: Add iris video node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-13-7fbb340c5dbd@oss.qualcomm.com>
 <b36tyrznuwwjiya4lt2ajqbyopnonvubedpofasmzknwjd2mrs@eenc4epvbokm>
Content-Language: en-US
In-Reply-To: <b36tyrznuwwjiya4lt2ajqbyopnonvubedpofasmzknwjd2mrs@eenc4epvbokm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fpHsol4f c=1 sm=1 tr=0 ts=69ff67a3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=SpcZ+gRb+6o1zy8jT5J+bQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tcww-dwagKCKl4DpuMYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: VfTxcAIo1IcGY4Uk7NI8tRV6VpxN_gcE
X-Proofpoint-GUID: VfTxcAIo1IcGY4Uk7NI8tRV6VpxN_gcE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE4NCBTYWx0ZWRfX9VUPOWWaCoWj
 v4qxLH7MJ/11bkARCBvpXoPnQ4KCKNOCVIxBf5/r4vWEgnBr89EocJ8+ETw1m4XUMKknpxZ7iHK
 AJJtf1DmVYCm4vCeUyFtMzU0TA8m/fJFbWeyQBAGu1QkhQoOqlqC8QTfmCY4NzLJNJBxYnnhm+P
 Ccj7+ZGV5gAeisiXBH5ffy/kXvoQjP+Z0qpMVJwQarbWLoOG94HzY+rO8Dyx5MR0+HGWKLqO7ie
 VX+G1/+xoW9U8572Xy3FNWpU4YPqhTle1OO+b4O62O6I58AeUojmqwlzQeRYoNXWtqtDargzGCX
 J4OhkznQ8GjY9juySneJPr6SmPHuVOfA5x+5j4zbpzwD2zsIuEsqJeHiWcmte9NPAiHbN3hU1hS
 /P2ekWJeZAkgFNUzbL6FUWNuV2FjdyO8x+ZPIgWtlGdBUi2ueObs2l7kRcNma0A9n9/+VEzvD8q
 bv/rcLIE7kO58GmaWEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090184
X-Rspamd-Queue-Id: 562CE50096A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61003-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,aa00000:email,ae00000:email,a400000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/9/2026 12:57 AM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:30:02AM +0530, Vishnu Reddy wrote:
>> Add iris video codec to glymur SoC, which comes with significantly
>> different powering up sequence than previous platforms, thus different
>> clocks and resets.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 118 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77..c47443174f97 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -13,6 +13,7 @@
>>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +#include <dt-bindings/media/qcom,glymur-iris.h>
>>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		iris: video-codec@aa00000 {
>> +			compatible = "qcom,glymur-iris";
>> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
>> +
>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_CLK>,
>> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
>> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
>> +				 <&videocc VIDEO_CC_MVS1_CLK>,
>> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "vcodec0_core",
>> +				      "iface1",
> I first wrote the comment regarding resets. But the clocks seem to have
> the same pattern. It's not just "iface1" clock. It's the clock for one
> of the cores. And there is another clock for another core. Please make
> that nicely named.

In v1, I used iface_ctrl to reflect the clock purpose, but received the
feedback [1] to align with the iface1 naming convention used on earlier
platforms.

[1] https://lore.kernel.org/all/20260414-lush-reindeer-of-storm-bbe918@quoll/

>> +				      "core_freerun",
>> +				      "vcodec0_core_freerun",
>> +				      "iface2",
>> +				      "vcodec1_core",
>> +				      "vcodec1_core_freerun";
>> +
>> +			dma-coherent;
>> +
>> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "cpu-cfg",
>> +					     "video-mem";
>> +
>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			iommus = <&apps_smmu 0x1940 0x0>,
>> +				 <&apps_smmu 0x1943 0x0>,
>> +				 <&apps_smmu 0x1944 0x0>,
>> +				 <&apps_smmu 0x19e0 0x0>;
>> +
>> +			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
>> +
>> +			memory-region = <&video_mem>;
>> +
>> +			operating-points-v2 = <&iris_opp_table>;
>> +
>> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>> +					<&videocc VIDEO_CC_MVS0_GDSC>,
>> +					<&rpmhpd RPMHPD_MXC>,
>> +					<&rpmhpd RPMHPD_MMCX>,
>> +					<&videocc VIDEO_CC_MVS1_GDSC>;
>> +			power-domain-names = "venus",
>> +					     "vcodec0",
>> +					     "mxc",
>> +					     "mmcx",
>> +					     "vcodec1";
>> +
>> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>> +				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
>> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
>> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
>> +				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
>> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
>> +			reset-names = "bus0",
>> +				      "bus1",
> The names of the resets suggest that there is single "common" reset and
> then one reset per each core.

Two resets for controller and two resets for each per vcodec core.

>> +				      "core",
>> +				      "vcodec0_core",
>> +				      "bus2",
>> +				      "vcodec1_core";
> Are there two codecs? Or are there two cores? Your naming suggests the
> former case.

Two vcodec cores.

>> +
>> +			/*
>> +			 * IRIS firmware is signed by vendors, only
>> +			 * enable on boards where the proper signed firmware
>> +			 * is available.
>> +			 */
>> +			status = "disabled";
>> +
>> +			iris_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-240000000 {
>> +					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
>> +					required-opps = <&rpmhpd_opp_svs>,
>> +							<&rpmhpd_opp_low_svs>;
>> +				};
>> +
>> +				opp-338000000 {
>> +					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
>> +					required-opps = <&rpmhpd_opp_svs>,
>> +							<&rpmhpd_opp_svs>;
>> +				};
>> +
>> +				opp-366000000 {
>> +					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>> +							<&rpmhpd_opp_svs_l1>;
>> +				};
>> +
>> +				opp-444000000 {
>> +					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>> +							<&rpmhpd_opp_nom>;
>> +				};
>> +
>> +				opp-533333334 {
>> +					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>> +							<&rpmhpd_opp_turbo>;
>> +				};
>> +
>> +				opp-655000000 {
>> +					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
>> +					required-opps = <&rpmhpd_opp_nom>,
>> +							<&rpmhpd_opp_turbo_l1>;
>> +				};
>> +			};
>> +		};
>> +
>>  		mdss: display-subsystem@ae00000 {
>>  			compatible = "qcom,glymur-mdss";
>>  			reg = <0x0 0x0ae00000 0x0 0x1000>;
>>
>> -- 
>> 2.34.1
>>

