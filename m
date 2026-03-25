Return-Path: <linux-media+bounces-57073-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DdYOhQExGnOvQQAu9opvQ
	(envelope-from <linux-media+bounces-57073-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:49:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D003286D2
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AFD332B3E0D
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 15:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06733FA5CE;
	Wed, 25 Mar 2026 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXdOQg4y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZOEW6giv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECF73EC2C5
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451435; cv=none; b=IK1ztThJQ8LWGS9n1ACrbkDUfz0NwXen1tleIoUNzKjRbKASNrUaufJTmE5QVPH79RKbLF2e03A9/afbgSVxLstp5kJTDiV2PiwXdTS/pVoeNlK/xpmhamYVeyANDpN+zPJRU3wlRa3wauwcZc6t29qZ3bdOHMBosHTNQOlCuho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451435; c=relaxed/simple;
	bh=ZxQippknm3j62I6Jp9U2pT0kpqpuo+x9nwZCCQAspsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dt9Iifuv/V1XMTuSjOCRud5YrEioKMxr5+S9+NytTWLPkVC6gV7wnp8wCfW6LioFzVuPCrT1d6Rlp9vpXFg0uKldXlG+mZVxXRypSqSW3ElZ2dTxKNNLx0wn9tAupQKPym5IzhqeycRA856BhqXZ7wKO1R46npPjBMBNfRmQwDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXdOQg4y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOEW6giv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGXbj051842
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 15:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xtE4+84n9r+ybTVsuVpzR5BgwB77paJIB/iP6lAPjeA=; b=jXdOQg4yOpBTwPC4
	bXol2Jm/1QTPgXiiIsuUowmRLL1+x/GVw8R+9S75/ormqR+rAm34O6a7PM67RlVb
	34m5/h1eWxQ+vhBfT4JZl6/57TdsZmRaERsFvhA8Z4uEC1dLEr4Ms2k8mK88tPsY
	fCw/PYGd6r0Q+r0iTQunb+VPk3QbAGpGAT0KTYWPMkDOgTaIQm9ykXEviTbkY/ng
	jZMymY3BKvhDiixMwxeGB9Hl7r9UbK5KVX4i63Cm+EZ2PbeTt3jBdL+yfhXyJ3iw
	C7ACxl04G5w4zlLLXKGPZBZbyrtDID0bpv8xky9FNAofV42/NAF1BjNDXxo8s3H4
	jlTgPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp2ma9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 15:10:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0565d77a6so37276155ad.2
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 08:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774451433; x=1775056233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xtE4+84n9r+ybTVsuVpzR5BgwB77paJIB/iP6lAPjeA=;
        b=ZOEW6giv/0YGM45qWSlniiHNwMoStebf+HP2s5Xl1BdxhzjBnUdqCeQLpb1tiNwwdz
         IpvvOWDuBNBE1jt8LnKSHXuJyMVFq4F2UJEbwoz+S9JLPN8XMrmt3p7A+aTMvsEc29iL
         /OdCIWD0gFgZaxoBg77nktmyXMOa4VVkZcngKsbrU0ft144ZAxRMnn31Po56qx9ccTLr
         /JIrKajg7LSe9WwnBGruoubwJAgzsYvHV2141IZXk3E2NXOvDq3/+5rzsId6ljUJ5rMF
         +ryDv+KJF8bs3D0AMsKjeTZ4tPDw2vZQ52ZUMse0UPmJMPAxesaQVzpUvPxDtSMXynq/
         MqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451433; x=1775056233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtE4+84n9r+ybTVsuVpzR5BgwB77paJIB/iP6lAPjeA=;
        b=Dyqlovf+DwIsrSNIck3/OBREKki1ekuphpDsFxMAkcCQdQDVmPvS3WTbfRznMJjGTN
         7bQnPJ2cRRHjIYUQfoK5pb5g+ieMBD4U2LAcazep60FHqsSrkLLHaEpYdTKi/B8d4012
         mVs2SCqDjppUYoFREl+R3nzJknWLEZzxrTspD5VZ/Egq5x8apCbFqNDsbXaAX9CKXul1
         RusmIsmi/0bGgyJkWGKQwXUjX3ypjYdwn+RWcM19i6gS9ikd0RbYHiGq5UikeIU+AYzs
         EcMTZRtrc07JLLUWuPijb/Uw2pl/VuSFiG1gLIPHmcJQgOqUEadeCCKztfmMUGNydxGj
         PaNw==
X-Forwarded-Encrypted: i=1; AJvYcCVwTQEl26WGISpISMrClH1AGCCJ37nept0k8g/1yyxQePUUaxQUE6NzeM+vn4IXLqhe9w/cPSn2ND4yEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLf4yehbHr6z79E54jJJ/QRUV0o4lWtYZ3Lh7h570sQCPWzs0Z
	TfZyly0scwZLWOaKKuHaVDdV1tGWoA9QY5U88JbHKNDMX8c7TclrVCLOVzYQoRETbqd8xvbJvem
	oARZSEBEGl0n4EO75W22rOzN+ZEzNC201XwJaR8jIfs4PgAYVdx6Crl8jHV1e4ViPOg==
X-Gm-Gg: ATEYQzz66bUM9MBIBvamyFHLiaQSswM+0zvljKVa7ZUDn/qo3DSnKyegexQFBb3Lsbg
	5eIaf6wFA2MAKkv4HYdfRqR6ic3y8H7d1m9dioOoI7PfIreHuVX//uJQTEQUYgOBPksGteVhkY3
	F3g5Uux+hHK0M01qBAlcjblvX90WWr/wfB1fVaJkDUop/CsdZgIHNOIMG2CsqLHaAISvD0FfesG
	tYXsAFQxqrZ8A5g985TSBn80e4YHKxbanjADDdOhTWlkI5v/3y+uEd9HLNIS4BRQrlKowVk8ZT9
	YC5uHB9sHr1sTwEan8T6jYMP72Fsmx85ebrkMlybtQ5Xd3sgGWXiWgz3ysPEM9UXmiUvGMU0zSQ
	3WTZ8LLM/Vd65unV/ZVqqgxURFCgU7OsuGxGR96S93j5G4Rltz5Xi5A==
X-Received: by 2002:a17:903:2a8d:b0:2b0:6e8f:8e73 with SMTP id d9443c01a7336-2b0b0b2d665mr46305085ad.44.1774451432471;
        Wed, 25 Mar 2026 08:10:32 -0700 (PDT)
X-Received: by 2002:a17:903:2a8d:b0:2b0:6e8f:8e73 with SMTP id d9443c01a7336-2b0b0b2d665mr46304635ad.44.1774451431825;
        Wed, 25 Mar 2026 08:10:31 -0700 (PDT)
Received: from [10.204.101.77] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7a9deesm1665755ad.28.2026.03.25.08.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:10:31 -0700 (PDT)
Message-ID: <bdae0b95-ee88-4398-8690-031803a85a92@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 20:40:23 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
 <hfuqu5uwjuh4ie55zwaqqbsflhf5yn55hnjva356nivoq46m2i@o5pkjnfrwycq>
 <62027e78-4b7a-4b94-a51a-13a9ae77b722@oss.qualcomm.com>
 <5otifv465c7duslmogb5uzaxrh2k3u2ayiylcd6dnz3kc7win5@kltv3fxhtso4>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <5otifv465c7duslmogb5uzaxrh2k3u2ayiylcd6dnz3kc7win5@kltv3fxhtso4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: l1YwD0cl6i1bW1wP9wKT0fURhyojKSCU
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3fae9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=puI59K64icZz00i_70MA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: l1YwD0cl6i1bW1wP9wKT0fURhyojKSCU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEwOSBTYWx0ZWRfX5/+3IFWqXLBm
 SjhvM/tO/vqbqxem6v2PyNb1MI9UFCgBa0VtQ6lES/PrzeKvEcMGlH1+oIg6YtsATI/ksqxgwLA
 HRe58FlOSabQvwd46YcRpeQRA/o4CmOFqEwkz60U4rXGWyDHKHxtrjgsV9c4tgA1t1ZuFNBIk8v
 6MVoJs4IScPlXYlJor99WhEieDkvHQilPRt5Pca3wR7PdCsJd0jl32xv3J0+lKZo0i07lbPDL7y
 ZKqe681L+d0BwA1nouTySiRqNlP9/O3gIyjX4+/LsNs4R1cIVkS9nvn9VFGi+r300C6o3DCXw8l
 lMaEhNlV6Z5SLyz6PFWtgSn06p4lTCb2XGpGjE10VoRKp5iMzQ3CBPUMqUUvM5aYsnZzBpEqvNM
 03raj1XiIbmc3JHPEWLOzsLD3yGFy6UjYDgXh5W6od29Mw3VRw9nIUorfin7xHCFDHPFQsnzEU9
 GM5/EeYGkpjNBX8a4VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250109
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57073-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.30.132.128:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 49D003286D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 9:10 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 08:46:52PM +0530, Vikash Garodia wrote:
>>
>> On 3/13/2026 8:32 PM, Dmitry Baryshkov wrote:
>>> On Fri, Mar 13, 2026 at 06:49:35PM +0530, Vikash Garodia wrote:
>>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>>>> compared to previous generation, iris3x, it has,
>>>> - separate power domains for stream and pixel processing hardware blocks
>>>>     (bse and vpp).
>>>> - additional power domain for apv codec.
>>>> - power domains for individual pipes (VPPx).
>>>> - different clocks and reset lines.
>>>>
>>>> This patch depends on
>>>> https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
>>>>
>>>> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,kaanapali-iris.yaml        | 254 +++++++++++++++++++++
>>>>    include/dt-bindings/media/qcom,kaanapali-iris.h    |  18 ++
>>>>    2 files changed, 272 insertions(+)
>>>
>>>> +
>>>> +    video-codec@2000000 {
>>>> +        compatible = "qcom,kaanapali-iris";
>>>> +        reg = <0x02000000 0xf0000>;
>>>> +
>>>> +        clocks = <&gcc_video_axi0_clk>,
>>>> +                 <&video_cc_mvs0c_clk>,
>>>> +                 <&video_cc_mvs0_clk>,
>>>> +                 <&gcc_video_axi1_clk>,
>>>> +                 <&video_cc_mvs0c_freerun_clk>,
>>>> +                 <&video_cc_mvs0_freerun_clk>,
>>>> +                 <&video_cc_mvs0b_clk>,
>>>> +                 <&video_cc_mvs0_vpp0_clk>,
>>>> +                 <&video_cc_mvs0_vpp1_clk>,
>>>> +                 <&video_cc_mvs0a_clk>;
>>>> +        clock-names = "iface",
>>>> +                      "core",
>>>> +                      "vcodec0_core",
>>>> +                      "iface1",
>>>> +                      "core_freerun",
>>>> +                      "vcodec0_core_freerun",
>>>> +                      "vcodec_bse",
>>>> +                      "vcodec_vpp0",
>>>> +                      "vcodec_vpp1",
>>>> +                      "vcodec_apv";
>>>> +
>>>> +        dma-coherent;
>>>> +
>>>> +        interconnects = <&gem_noc_master_appss_proc &config_noc_slave_venus_cfg>,
>>>> +                        <&mmss_noc_master_video_mvp &mc_virt_slave_ebi1>;
>>>> +        interconnect-names = "cpu-cfg",
>>>> +                             "video-mem";
>>>> +
>>>> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>>> +
>>>> +        iommu-map = <IRIS_BITSTREAM &apps_smmu 0x1944 0x0 0x1>,
>>>> +                    <IRIS_NON_PIXEL &apps_smmu 0x1940 0x0 0x1>,
>>>> +                    <IRIS_NON_PIXEL &apps_smmu 0x1a20 0x0 0x1>,
>>>
>>> It think we still haven't settled on letting iommu-map to have several
>>> entries for a single function.
>>
>> I have described the hardware aspects in the discussion [1], if there is any
>> alternate way to handle this, we can discuss in the same discussion.
> 
> Yes. But how do you plan to merge this? You've split away the patches,
> they don't seem to be listed as dependencies, etc.
> 

1:1 mapping of function ID with stream ID is closing on the reviews. I 
will have to update this patch to represent it in 1:1 mapping.

Once done, this patch can be merged with the dependency marked in this 
patch i.e 
https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15

>>
>> [1] https://lore.kernel.org/all/21fda4d2-72e1-4e5b-aee0-a799886f53b7@oss.qualcomm.com/
> 

Regards,
Vikash

