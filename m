Return-Path: <linux-media+bounces-57574-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APZHF7I8ymnD6gUAu9opvQ
	(envelope-from <linux-media+bounces-57574-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:04:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8323E357BCA
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5779B3008249
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938E73B27E1;
	Mon, 30 Mar 2026 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dgg3NII/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55095383C66
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861358; cv=none; b=mwDu7lmbRwbsmqPwTU8kb17W61O55xze5dIdJ0r627jBryyROWYJ2t5A5RvpSQw3ps1YfXGKYUZR2hhVMQHdRVaI5f5gLNKwArIYyN0t2l3O5vJOmEWsJ0LolP99Z+vAmBf1gANl+Ryk3q4qt/xElP3hzPTiziRHJlWaWXY1H8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861358; c=relaxed/simple;
	bh=ZZT+BdvWtv0IGu5tZFso5VNXIsNQv33LmBSHM/iliNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1wFH+C5AOEM9sv7GLETTT4E23vAX9NWYSlH/UVJaVWjzx9DVxfyjYRiaS6effmArHi4SvWcDSUBlgeEDk7ytBEKh2ZxdqGprE7ZJnzaQ39Q9FK4lST9I8SnBcyq/rKrjVJV9ayahuEJLs7gcoffaI+tCBppj6ahk1I5CQSLTZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dgg3NII/; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b982b0889d8so498777966b.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774861355; x=1775466155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ta07eiLe/pVnHnMt5yIA7myVk76JrlK9RRotd9Crmig=;
        b=dgg3NII/WftjIMiHgwgNlRq2c4WGVfY1c93P8OIuqqVIsg/eXLT0+Fkrl2abzU8g4S
         /DlzGLXyYmlQF31QzMmfzsA558YX9LemKFj/Kv5VjcoJVloLQ2cZHIdFAP1OVxMqCozI
         Lpw1YoZDeXLggOKjINlEyoXltr7tPVvka6ivHdfNB10fe/QtFhsAuLEWQE8HPs8u8euC
         ceVmYqS1gMpiVnxx8Wgai6WKWvzt8KI7I4G0jqHTOpdQyrq1cAZbES1I6JTSP0GwkMzY
         mKVQIuoSn2Z4LZBNE0OIolpZJnJueLo2/py6fD+dEXDAOdGe073jBEh7naPbGvAqDLxo
         eZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861355; x=1775466155;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ta07eiLe/pVnHnMt5yIA7myVk76JrlK9RRotd9Crmig=;
        b=ZukEr/c8IMQ5CiAyofM8ZaRF07OPGlyrqBYwZDIa5pGmjEdWtxEJAnXppY8QYm2Ror
         Ubo5ZlRjo9Nm30Lqo4LAweJh8a4qYrX5KqI2CAiORrfPTcWf8QWn9khXjZA3ncdODohQ
         zViQ+RwxldJIV9R8JBEgQ0cTByKcXt43+grv7WgP4Hi533HiOP7WMFkInCiomR4xdJBd
         g3GgwjG7xn39cO86u9FT+il8RHZdbyyVYYnSpG5FVoC2ZP9Nj4xFv5I73i8KpzPaOoXk
         cevaC9hXh/9NNX+q/OC0HOKQN39D6N6LtB/Nxg8qHy5rbY0aVwjWIpTiOGdNRcEm611+
         brCA==
X-Forwarded-Encrypted: i=1; AJvYcCVQobwOxH5grvVXfJf68MVI8eXG+gCTV9husCQgIWPsFtVuvRBcYTK+s9VMU3Fs24EBT5wwDixlkKzbNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8UkqOM6En9WGcBaQBjQVeLlRsrXv6b6AokW9FnyyIcgSrYIs2
	e3+Vgo4FvwPQZ0Jfj48Y+rY9NO63vsWMzz7YRrtQbQhsfUD9ZwkW1+UTdcVYFctddA8=
X-Gm-Gg: ATEYQzzzAdsqrUSYk7tDSkIW1aW9kfHRBvI22s1gKmwgMfsXwoF9unywZ4xtlz3xrtQ
	0WgDQpFspgI5t/xmiCM6BT9thArGt3m09e5ZLiUEuH9vqs1Cvmotf1hyVeCjFNpjB1KLfENX3cQ
	EGDmfelLt4hjx6NQV/F9AogI5NQKWlcpnh97+eNLPAWOGTvQj80sBEDOSS0LcDExDvHCsC8nIlG
	a+0hT/LPoC8Nbemm0a8UmGb3pSZinYXQSVKwTzwJqyOI4PRtmoZJ+Qrjh5w11Wb+7uebN9bcQbw
	SiyJnpBguLYKwX0sMBbPVE6TP9L9WS7DOStKGKCCpc2gBsBu0DWYIxj9Uf08KvhavyPNqWRMzMC
	02pZtrOKsl+mJeeRgffvSjgwkuS/HvuFF+AdCwFA/moO3+TfF2EmA0CqtYL2SpC7PeFxI1Rqueq
	EFqEZCfzFqAlZ65axHc693M13AFqppjtClNFlw
X-Received: by 2002:a17:907:7b9f:b0:b98:33c5:1bb2 with SMTP id a640c23a62f3a-b9b503b6f2dmr693893066b.25.1774861354146;
        Mon, 30 Mar 2026 02:02:34 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.241.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5924sm263387066b.32.2026.03.30.02.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:02:33 -0700 (PDT)
Message-ID: <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
Date: Mon, 30 Mar 2026 10:02:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
 <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
 <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57574-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 8323E357BCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30/03/2026 08:49, Neil Armstrong wrote:
> On 3/27/26 18:42, Bryan O'Donoghue wrote:
>> On 27/03/2026 15:28, Neil Armstrong wrote:
>>>> To be frankly honest you can make an argument for it either way. 
>>>> However my honestly held position is analysing other upstream 
>>>> implementations connecting to the PHY means we can't make the PHY 
>>>> device a drivers/phy device - it would have to be a V4L2 device and 
>>>> then for me the question is why is that even required ?
>>>
>>> This is plain wrong, DT definition is different from software 
>>> implementation, you can do whatever you want if you describe HW 
>>> accurately.
>>
>> I'm not sure what point it is you are trying to make here. Are you 
>> trying to say drivers/phy is OK with you but you want an endpoint ? If 
>> so, please just say so.
> 
> I'm against using the "phys = <>" property in the CAMSS to reference the 
> PHYs, a "PHY" in the classic terminology is tied to a single consumer, 
> and if it can be shared to multiple consumer you must model a mux or 
> whatever in the middle.

The CSIPHY-to-CSID routing is runtime-configurable and is already 
managed by the media controller framework.

DT describes static hardware connections. The dynamic mux is a software 
concern, not a hardware description concern.


> The PHY API as an internal software implementation is probably fine, 
> even if it makes implementation of split mode much much harder and 
> doesn't really solve anything, you can just call init()/poweron()/ 
> poweroff()/exit() directly from the CSIPHY media callbacks.

Great.

>> I can see an argument for that hence my response to Konrad, I just 
>> don't see why its a Qualcomm specific argument and of course 
>> understood stuff bubbles up in review, we have a public debate and 
>> come to a consensus - that's a good thing.
>>
>> However, I'd want wider buy-in and understanding that endpoints in the 
>> PHYs is a more accurate description of the data-flow.
> 
> It is, and it was designed for that, and extensively used in the media 
> DT representation, so I wonder here you would not use it...
> In an ideal world, you would add nodes for each CAMSS hw elements and 
> adds port/endpoints links between all nodes to describe the data graph, 
> this would be used to construct the media controller graph, and make it 
> much easier supporting new hardware.

Yes but be pragmatic Neil. The first step in making the monolith into 
sub-nodes is the CSIPHY.

Once the CSIPHY is in, we can follow on with adding new nodes that way 
IPE, BPS, ICP, JPEG whatever and also work on implementing the old stuff 
in that new way.


> 
>>
>> We've been applying DT bindings aplenty without that so far. So we 
>> would establish new CSI2 PHY bindings should represent the sensor 
>> endpoints.
> 
> We've been using a dummy representation of CAMM in a single node with 
> only endpoints connecting to the sensors and hiding all the hardware 
> layout in code, it doesn't scale and makes supporting new HW hard.
> I mean this is common sense, why would we continue to stick to the 
> current CAMSS bindings ???

We _won't_ I just don't support a big bang integration. Progressive 
changes over a longer timeline make the transition manageable, without 
accepting endless sub-standard stuff in the meantime or holding up all 
new SoC submission unless/until.

I mean there is a CAMSS meeting which I've been running for nearly a 
year now that both you and Vlad are invited to where we have been 
discussing this for months...

Anyway one conclusion of that is we want to transition to individual 
nodes for everything.

PHY is the first step which I'm taking because its easier for me as 
CAMSS maintainer to convince the CAMSS maintainer to take the relevant 
patches.

drivers/phy notwithstanding.

>>
>> Is that what you want ?
>>
>>> The CSIPHYs are not tied to a single "consumer" block, they can be 
>>> connected to different consumers at runtime, which is not something 
>>> classic PHY devices are designed for. So they are de facto a media 
>>> element in the dynamic camera pipeline.
>>
>> The existing CAMSS binding and media graph are not changed by this 
>> series.
> 
> This is not my point, I don't care about the software implementation at 
> all, I care about accurate hardware representation. Using the "phys = 
> <>" property does not describe hardware accurately.
> 
> In other words: The CSIPHY are not connected to CAMSS. This is _not_ 
> true, tying the CSIPHYs to the CAMSS block hides the real data muxing in 
> software.
> 
> Please remind DT is used by multiple operating systems, and properly 
> describing hardware in DT will help have good software support over all 
> OSes, not just Linux.
> 
>>
>>> And actually Rob Herring asked use to define the complete data flow, 
>>> it was a strong requirement. I don't see why we wouldn't here.
>>
>> I'm implementing feedback from Rob.
>>
>> https://lore.kernel.org/linux-media/20250710230846.GA44483- 
>> robh@kernel.org/
> 
> Where did he ask using the PHY DT bindings ? Is he aware those CSIPHYs 
> are muxed to multiple consumers which are burried in the CAMSS code ?

I freely admit to taking the initiative of phys = <> but Neil there is 
_no_change_ to the media graph and the "mux" is a runtime configuration 
that is one register in the CSID.

You seriously want a mux device in the kernel to model one bit in a 
register ?

No.

>>
>> To me, here is where we stand:
>>
>> - Individual nodes - we all agree that
>> - As sub-nodes - I think the majority agrees this Krzsztof, Dmitry
>>    I'm fine with it too.
>> - drivers/phy - I think we are accepting this is also fine ?
> 
> Like I said this adds a supplementary API layer for no reason and will 
> make life harder, but I don't care personally.
> 
>> - endpoints should flow into the PHY and then back to the controller
>>
>> I get that argument. In fact I _like_ that argument at least I like my 
>> conception of that argument.
>>
>> I'll stipulate to that argument meaning then that, new CSI2 PHYs shall 
>> include endpoints for this purpose globally.
>>
>> As I've said before, there's nothing Qualcomm specific about this 
>> discussion, really.
> 
> There is, because the current Qualcomm CAMSS bindings are insufficient 
> and should be entirely redesigned from the ground up to properly 
> describe the HW.

The long term plan is to do that. Discussed extensively with the Qcom 
teams delivering CAMSS, even invited community members along.

Here are the meeting notes - its all in the public domain

https://docs.google.com/document/d/1yUwWHaKLuovKVgGTzvKm68K1zS6xBONVzjOsRjDl03U/edit?tab=t.0#heading=h.mtbm7qfohwfs

---
bod

