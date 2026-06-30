Return-Path: <linux-media+bounces-66096-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xDs1OVTBQ2rbggoAu9opvQ
	(envelope-from <linux-media+bounces-66096-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:15:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 854AB6E4B3B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:15:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CSUaqot4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g4lyBcqP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66096-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66096-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F53031501D3
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286FB410D26;
	Tue, 30 Jun 2026 12:57:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E42413244
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:57:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824246; cv=none; b=byBk1WuLwkIcsVAe7MG7s4Cpibesa8kds0/vsk2IsHgdI+vSIhhwzdgw67HMWnsvkhVzdWM4sCdwVJEv9QeqOV/tca7W0FnSCFhIIONQZpGK2YSJ7vrkxBrEcH5i6wVyqpyDCVRTcsgPCCBqmWQPW33pHlkOdceE0N1MosuJUWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824246; c=relaxed/simple;
	bh=pnI7R/xMMC8JZIFxsJK7PSD3LbRqlyz8dhLEqn7HV3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpLeo5aNhjpW+2rwYikffYmjdKEBloMheroBThOZNZiSdZR13p3Ne2YRcn75J1HHB/gWwwNO9TxOz1S3UzSXDCxg4AjaKx+L3rA4zlumcMtBAZjtqpxs720V6BmuxowAJjHSU9Gap1Cw8z6z7XdGM266kcVidTqHQe9XxCYM2ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSUaqot4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4lyBcqP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mnBi1542037
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lJO2RpNQ8kCH+24erJ/udW/2aUgTpJLDMSalLdUaCtM=; b=CSUaqot4rG1+Qoag
	7JeUKJQkjG7CPWAKZWG1C9Z94uUK7BnJspSqdX86AAseWfYyfguPZmTeDzRPDf/f
	QiqjtkGUp/SegO06vuybmvUgLLOcQ5Bhb7xo7Ztx6Yt9FsN05nXMqCzoK9KRH7qa
	W2z4m+LNWg95lLzHlnKvPQSzF/FU2EpJUOGGpH0OlUYA7UP/y0R3TrUxSTCXFMjc
	N8reu2WPv9hd9QIms9NUcQJg4+A2/XGyYAKR+2xlR/MOMCeI3yUU38kuAiAVcF7C
	LZ/R9t+LP25C9VrCsRfiVG4a6jwTfzgpsMpoC71HNNnJYRaVexHGYnhHbiw9pOQ3
	+uQprg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4jhj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:57:24 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bd94ea83c6so105749e0c.3
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824244; x=1783429044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJO2RpNQ8kCH+24erJ/udW/2aUgTpJLDMSalLdUaCtM=;
        b=g4lyBcqPXkHuLVrkMUrh3X1wytvjtp4mloUk/kJ8Ni2J7bLk+J48e6ywuDyE0dsb6b
         woj7tvc1xLUb6g+YEtHbT3vRfbAyGlIFTyXPsi1ZpSUmWZQDtUb5MsbzzMJ1E4BSURlh
         mBMh7q4Wj0QlBG7R9j+YrngEva6DWXCbstx35LeVgPbt4ZItS/IjklynsjykgyGHqbJO
         Pil0RWLXO248JQy7/5qzqOs5eBqcgPooYH/0qJag1UNU8fuOP/TMN3Mrq5d/OIQ0THKZ
         rmCVNNZB7dm5yrIAQ71RXbjRDXEcyhpQsDI20Q/5LLQA/T06NcJP7+khF6VXVFczoEXs
         vYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824244; x=1783429044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJO2RpNQ8kCH+24erJ/udW/2aUgTpJLDMSalLdUaCtM=;
        b=cgiPDLznrLzwyi5GsvTnyV9WjTGLAgKfV+b/j1bhy2mMOAVfVrFkH7lOjlI3QtX/9Y
         4TTlk6l1lGFsS6YtOOR3fAqq/IHjqBcYPBAfa8QTNbOU90Vt6BS+ZxoKk7PFAHcHKLu6
         JBBIrqcyJvp4KyApE/5499VFpKL58a4RSNTQ8U/Ptq4q2sb/lHH/8GLM1PqDGljCMylG
         QjIoqI/6el1nvhD4frq+T14fUiBExC4+rvVXnzaXX6i8qzTxtHLyghSLF2Z5OmmCEVal
         ZIoI9mMM9BHcQlGWA5VKH0YrbyJs6jA/acqqDC6dCDTBTFe8uIcdRc9En+fUEtXD6ytw
         STbQ==
X-Gm-Message-State: AOJu0Yxvc1QmB2jAPAw00IQJ0H2eIqryaDj6n4Axjx3IabJi7ablYrOu
	HjAz8Bqd/E43OVfmL/gKMmsRU0g0t4o209O+v8dgHDWomCGW9PTWW+UidmmpzsDQtoF1v4LRn2i
	i/HG0GwogVwXTorF2xu4KwfeiFA4rLD96qyS5fGgsxzQZXX1iPVWzGeWCH/ZP2FfPZQ==
X-Gm-Gg: AfdE7ckuUFs/Ub70v2xe4ELY9tDXiLhFwwBgARO73wl4Rw/W3ma/50J6gGBsy42cUzJ
	lDcIEb3IdqXDDF4X1L1I4coToO3DzeArJ+eukB25SaWYtwVOgLYsq85QH94RTFNDPyCK+yFGikH
	U/ZnFMEqucZiv4uJ/ObSITNE15onz1dQ+KVo9md1UZvVR5kvYrFKWwNPmaK8q/kdSWmYGKk3Hel
	QIcf1K06k00D+/WUjN079bepRdKnnckYFN4LqOWsZWKBX4sMsahe6k2ySJ7acDpscldhFYvefCq
	Om8EKd9yxu4m6tvPLWwRRB6Gxyo6ebr1Ds182s2tDgoFfUry9fnyLUw/jHoz0Pkwkn/pm27t2rY
	wch6eKHgdMYqSZWNQ7TuSF7VgRyr6aCITxXQ=
X-Received: by 2002:ac5:c814:0:b0:5bd:9b95:d637 with SMTP id 71dfb90a1353d-5bdbedcf783mr411336e0c.3.1782824243745;
        Tue, 30 Jun 2026 05:57:23 -0700 (PDT)
X-Received: by 2002:ac5:c814:0:b0:5bd:9b95:d637 with SMTP id 71dfb90a1353d-5bdbedcf783mr411329e0c.3.1782824243293;
        Tue, 30 Jun 2026 05:57:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3a3ec9sm1170596a12.1.2026.06.30.05.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:57:22 -0700 (PDT)
Message-ID: <bb33d83a-58d2-4156-a7f2-96ab1a7ccd55@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:57:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] arm64: dts: qcom: agatti: Assigned clock rate
 for CAMSS AXI
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-14-bb1055274603@oss.qualcomm.com>
 <ae5d0817-5187-41df-89c5-0acded391fb4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ae5d0817-5187-41df-89c5-0acded391fb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AUjslOuAXhHR1aRseuyFdR7jLjN8Ix-E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX5vSnLbWiD7bO
 L01eQ9do+3q+y1JEDwbUcEMH2Cg99uVK7LJuSXryOT50sL+vG+JgUFISk6AZE9TDEpaQCv/cewg
 PEYWOmtrbtDE7Qp2kgaG2gdzOdK70Wk=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a43bd34 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=jiSQzDTAzoC-fvH6LVUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: AUjslOuAXhHR1aRseuyFdR7jLjN8Ix-E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX86WTuYlaoeQO
 9dGtVlSssNdo/Zon5zgQsJCaXCeXUMroNmA5RIFvd81zhUtMrw9USgKBwCC3F1mM6u+yhsD07nw
 z9/1VsmDTHjuUJqNwXhuN1iZCzE8ws5zr/yJ+6x8hIj5WTb4a9JhFSeUJI67vWb8smeW3cZi6K2
 5sH4kSJ1MyrtsMmAptcAtP8FRLJ9y9ikqixw+9AAJwZ1r1vPDDyVUYk90hUeDd/CXZlwthXkA8y
 xmIj7fv8qIJs8UKEfng+obflIfVwK6WjLMxHoADRTPCMNgqEi4RWsFikRP+6UnAP8peunYVddYl
 ZEEKMC2WIy4lFsfwAqGkHt10oGtkgx5N06b/GD5N5SOftpShNWJkvOiqJAz59ZXUn6xWvZzr4Xt
 UFFcvP2C0OPTVjmKDvfLcYAQ1LSPgc+HfeuGARyB71C4kbnjW34Ju9ICw88Z9xGYoPKMe3gIQNL
 SMK1XMLVCjR6pbCEv/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66096-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:johannes.goede@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 854AB6E4B3B

On 6/30/26 2:56 PM, Konrad Dybcio wrote:
> On 5/8/26 12:49 AM, Loic Poulain wrote:
>> On Agatti, the CAMSS AXI clock is not managed by the interconnect
>> and defaults to its lowest rate (19.2 MHz), which is insufficient
>> and leads to throttling of CAMSS-related traffic.
>>
>> Set the CAMSS AXI clock to a suitable operating point by assigning
>> it to its nominal frequency (300 MHz) as defined by the specification.
>> This ensures correct and stable operation while leaving room for
>> future dynamic scaling support in the driver.
> 
> Now that I think about it, since the clock is already consumed by
> the driver, can we just put a set_rate in there?
> 
> This will avoid introducing a point in time where the DT has a
> suboptimal (power-wise) floor mandated regardless of what the driver
> does

What I just said does not quite match reality

The ultimate solution is going to involve some aggregation and then
a set_rate. We can just hardcode the set_rate today instead, I think

Konrad

