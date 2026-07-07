Return-Path: <linux-media+bounces-66831-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J1B6IvDhTGoGrgEAu9opvQ
	(envelope-from <linux-media+bounces-66831-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 13:24:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E4371AE77
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 13:24:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=nxsw.ie (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66831-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66831-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D6DAA301275A
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 11:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E323F411F;
	Tue,  7 Jul 2026 11:13:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110022E7393;
	Tue,  7 Jul 2026 11:13:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422807; cv=none; b=fr30FE5d3g91lUc9W5DkgVoUDB3ZKaBewwYQyPt0laIJ2G3uwGsZw10ZJiXqo3vHotn8Xns2NgZNEh82Ml+XbjNNOTzQEV5UyVCTt8ahhlus/XTZ94M44URCVJ/qW65IQAc5ff0uBcre0yfFZ4DEFUrlmGtwzvtAv4w+bntNNQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422807; c=relaxed/simple;
	bh=ahmwbermViJuGDO0JlmdI+XCGsT2mqWi1L5lo+gNyC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VviVKHAZwvzBzTERChwa8vJqwwqsrrgKPo9eUnGIrRoVVBAQCve7+C6sDjHHdGQr4H43S4uexAnTfv1LcefUXKM32LulIDDUh7QY2dVSAQpIns39HYnLijFiXOdv5NBFAmFRmUo+pH20+wqhMTPDO++jyV5FREN9d+sMrU8epY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F036A1F000E9;
	Tue,  7 Jul 2026 11:13:22 +0000 (UTC)
Message-ID: <6b5e573a-c13d-418c-af5b-759deb40bfab@nxsw.ie>
Date: Tue, 7 Jul 2026 12:13:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <bqRcqVTcU8Jl1ClRlFeaaigWdG8pICB20xCQDPVqOB5QHXdtjWu1UYXWqhvyAuj30sim2P91BHvVLHLYgdD7vw==@protonmail.internalid>
 <7e36238b-96ac-4269-a6e5-0a6763e437e7@oss.qualcomm.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <7e36238b-96ac-4269-a6e5-0a6763e437e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[nxsw.ie : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66831-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gjorgji.rosikopulos@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bod.linux@nxsw.ie,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod.linux@nxsw.ie,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxsw.ie:mid,nxsw.ie:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86E4371AE77

On 07/07/2026 11:55, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Vladimir, Bryan,
> 
> On 7/6/2026 3:00 PM, Vladimir Zapolskiy wrote:
>> On 7/6/26 13:12, Bryan O'Donoghue wrote:
>>> On 06/07/2026 08:11, Atanas Filipov wrote:
>>>> Note: The handling of shared camera subsystem resources (power domains,
>>>> interconnects) for child IP blocks is still an open design question.
>>>
>>> Why ?
>>>
>>> A device needs to vote on its own interconnect and power-domains on any
>>> bus. A sub-device of another device may wish to ramp a clock for
>>> whatever reason.
>>
>> Certainly a CAMSS device will vote on all needed to it resources, some of
>> which are shared and got their description under CAMSS device tree node.
>>
>>> There is no "master" device in this block of devices - save perhaps for
>>> the CSID mux / wrappers on some of these parts.
>>>
>>> We have shared resources like camera noc, system noc and external
>>> clocks.
>>>
>>> Please include power-domains and interconnects.
>>>
>>
>> Why? The common power domain and interconnects have already been
>> described as resources of the parent CAMSS device, there is no need
>> to duplicate descriptions in every child device tree node of CAMSS.
>>
> The initial patch and work for JPEG was as independent driver.  I agree
> from hw perspective it is
> 
> part of CAMSS subsystem and maybe from design perspective proper way is
> to be child node not of the CAMSS.
> 
> However the resources shared by both can be abstracted in other
> frameworks, example ICC voting allows to have shared
> 
> clocks which can have policy to keep the higher rate and satisfy both of
> the HW's.
> 
> So maybe it need to be decided:
> 
> Do we want really additional logic for handling CAMSS resource of the
> CAMMS sub-devices by the CAMSS driver and create separate CAMSS API,s

No, agreed.

> or we can use existing fw's for that. ICC, clock, OPP which all allow
> sharing of the resources. Also there are cases where CAMSS and
> 
> is not needed but JPEG encoder is: Example RTSP streaming or UVC
> streaming which require jpeg encoder.

Yes.

> 
> Anyways my opinion:
> 
> 1. CAMSS is not prepared and not ready to handle child devices, only the
> populate child nodes is not enough. I think it is little bit mess,
> 
> some of the HW;s CSID, IFE etc are instantiated directly from CAMSS and
> jpeg and Ope are described as child nodes.

That's not the strategy.

The strategy is gradual transition from monolith to bus.

https://lore.kernel.org/all/d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org/


> 2. Jpeg on its own currently does not have any dependency with CAMSS
> driver code. It can use shared resources without issue and leave
> 
> the ICC, clock and other frameworks to do the job.

Yes as a fully self-described sub-node so that we can do 
compat="camss-bus" with the minimal amount of additional churn on top.

Make JPEG a distinct standlone node now, and you preclude the bus - you 
have to make the argument to Krzysztof, Rob and Conor that "the old 
binding was wrong but let me away with a change to it now"

Not an argument I will be making ;)

We should put the JPEG, OPE, ICP as sub-nodes of compat=camss so that we 
can make

camera-bus {
     compat=camss
     power-domains=<whatever is common>
     csid {
         compat=csid;
     }
     jpeg {
         compat=jpeg;
     }
}

a reality.

Put jpeg at the same level as camera-bus and you basically preclude that 
model.
---
bod

