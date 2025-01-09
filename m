Return-Path: <linux-media+bounces-24492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE439A0722B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 10:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305BC3A215A
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 09:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9DB218AAB;
	Thu,  9 Jan 2025 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lBznLDvU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QrK9rFoh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wmYb6zww";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w8e++lfR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BFB2163A5;
	Thu,  9 Jan 2025 09:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736416178; cv=none; b=UwDANeNsBJO0T0T8bu0SIA/4PrOo7lqCpvENEC+N6Oe3kK/kAJG6amzNM1WzQ6jphufoIasjGFbCNIt4WxXwNksbmtKu+/peFf8JTFvcl4R2QSv4q5axUUPF8vwb2RQmiY9MnXQBJJWbWnf1WNTzZRd0J69KGg0BRCeYMVm1ask=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736416178; c=relaxed/simple;
	bh=1Pz3F7NJmQ4/qH5zLjVQAP24S9XudzgTeuJ9f0/pAvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrrreTl2V7XaVsswfaC15dtXcztXSuiqWG4K1SuUW7tyL2huRumadXP+TUsuys3pl53brcJ+68iIeyetmfunMHXswJersA/ZPgvH53Yuy6a+Mx2CXKNzfOnZnPQ6mZ9r3o4ivFuY3UJZjiiaPvQSIVTXDkfa5td2OlZni7Wz5BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lBznLDvU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QrK9rFoh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wmYb6zww; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w8e++lfR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C4EA41F385;
	Thu,  9 Jan 2025 09:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736416173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vx5OEJsz3JrMh8pTaCwYJkErxJAW4Q0oclhMS/GAdxo=;
	b=lBznLDvUfMOezF93clL8gq2rOiAelOjTi/J5kIEDE4vU2vshNDWyOdwIu0ugUFQ+msD3CO
	G/N4N+7pRgkU/eEqZ+JEdn4aajk9qXqPFR/VdDcRzrs7gPmDwkEZtpano4tMo9wk0EAwo2
	hNiQnqvzCaNpWUyBmnFfjoFwY4Fl3zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736416173;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vx5OEJsz3JrMh8pTaCwYJkErxJAW4Q0oclhMS/GAdxo=;
	b=QrK9rFohuGhG0IA51v0VmL/2KefJ95kghaeZBPQdKsazQFkk7xnOYVMvbCG9qy6oFVR87y
	ftWGa1Xj4PHhnqBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wmYb6zww;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=w8e++lfR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736416172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vx5OEJsz3JrMh8pTaCwYJkErxJAW4Q0oclhMS/GAdxo=;
	b=wmYb6zwwKwVSQGBjssi/Nmw12rcIgpT8oODcT01Ls3eTtARMusquVR3ciVA/2WbecGl9+W
	nyttngTQKyFLbnPJ6eP3Fglu47ilLu5DM8cJwSkYP7lfmjCdqf9uhdkpAQ2J4aeEiuFkxz
	RBQBaZe/RiMIY3TQNwrQF/6MzfjpUbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736416172;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vx5OEJsz3JrMh8pTaCwYJkErxJAW4Q0oclhMS/GAdxo=;
	b=w8e++lfR7hCMuSEq329Hj6agNAyxEUfe2FfQDKWR0mDMJLEVNPTwSm50q57pNi0bp9L/uM
	2QyBpYNvpynEnCCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BB0C913876;
	Thu,  9 Jan 2025 09:49:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jcw0K6ubf2cHBQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Thu, 09 Jan 2025 09:49:31 +0000
Message-ID: <b0bf27f8-ea31-42f5-864d-f769bcbb3833@suse.de>
Date: Thu, 9 Jan 2025 11:49:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of SM8250
 SoC
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, Sebastian Fricke <sebastian.fricke@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <20241223113027.21b8f7ab@foz.lan>
 <fbe0d935-a3cf-dfa0-aad8-56834a0a002c@quicinc.com>
 <635ce4ed82aaca422b869f467300b0eccf9c8703.camel@ndufresne.ca>
 <c0f59149-713b-45e4-3755-4a52cfaa93f6@quicinc.com>
 <498a99e1-77ca-4acf-8850-cb74417ae88c@xs4all.nl>
 <9fc76dd1-ef49-a9d2-0271-eacb50943b03@quicinc.com>
 <9b33ba28-5aa9-4863-8fde-535841ddbc10@xs4all.nl>
 <6654d78e-d16b-489a-3532-e2fbc788b0ef@quicinc.com>
 <067d0deb-50ea-46bd-9f09-827b0ba61aa3@xs4all.nl>
 <5953bea1-194d-fe2e-251a-d4ef3e7544d3@quicinc.com>
 <20250108155237.5cf0ba10@foz.lan>
 <e2716cd5-4765-d8da-888b-bcdcd86df5c4@quicinc.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <e2716cd5-4765-d8da-888b-bcdcd86df5c4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C4EA41F385
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,xs4all.nl];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[xs4all.nl,ndufresne.ca,collabora.com,quicinc.com,kernel.org,pengutronix.de,linaro.org,baylibre.com,gmail.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dt,huawei];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Hi,

On 1/9/25 10:43 AM, Dikshita Agarwal wrote:
> 
> 
> On 1/8/2025 8:22 PM, Mauro Carvalho Chehab wrote:
>> Em Wed, 8 Jan 2025 16:42:03 +0530
>> Dikshita Agarwal <quic_dikshita@quicinc.com> escreveu:
>>
>>> On 1/8/2025 4:13 PM, Hans Verkuil wrote:
>>>> On 1/8/25 11:21, Dikshita Agarwal wrote:  
>>>>>
>>>>>
>>>>> On 1/8/2025 2:25 PM, Hans Verkuil wrote:  
>>>>>> On 08/01/2025 09:51, Dikshita Agarwal wrote:  
>>>>>>>
>>>>>>>
>>>>>>> On 1/8/2025 1:17 PM, Hans Verkuil wrote:  
>>>>>>>> On 08/01/2025 08:43, Dikshita Agarwal wrote:  
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 1/7/2025 7:27 PM, Nicolas Dufresne wrote:  
>>>>>>>>>> Le lundi 23 décembre 2024 à 16:21 +0530, Dikshita Agarwal a écrit :  
>>>>>>>>>>>
>>>>>>>>>>> On 12/23/2024 4:00 PM, Mauro Carvalho Chehab wrote:  
>>>>>>>>>>>> Em Thu, 12 Dec 2024 17:21:49 +0530
>>>>>>>>>>>> Dikshita Agarwal <quic_dikshita@quicinc.com> escreveu:
>>>>>>>>>>>>  
>>>>>>>>>>>>> +	.dma_mask = GENMASK(31, 29) - 1,  
>>>>>>>>>>>>
>>>>>>>>>>>> Setting a mask to GENMASK() - 1 sounds weird. Is it really what you want?
>>>>>>>>>>>> I so, why?
>>>>>>>>>>>>  
>>>>>>>>>>> Hi Mauro,
>>>>>>>>>>>
>>>>>>>>>>> the value of this dma mask should be 0xe0000000 -1.
>>>>>>>>>>>
>>>>>>>>>>> The background for the same is, 0xe0000000 onward memory space is allocated
>>>>>>>>>>> for IO register space so we are restricting the driver buffer allocations
>>>>>>>>>>> to 0xe0000000 - 1.
>>>>>>>>>>>
>>>>>>>>>>> Based on the comments received in the past, we are using GENMASK to
>>>>>>>>>>> generate 0xe0000000.
>>>>>>>>>>>
>>>>>>>>>>> Does this answer your query or I missed something?  
>>>>>>>>>>
>>>>>>>>>> I'm not sure it will do what you want. (0xe0000000 -1) matches ~BIT(29). Perhaps
>>>>>>>>>> you wanted to use ~0xe0000000. 
>>>>>>>>>>  
>>>>>>>>> value of dma mask is coming as expected with GENMASK(31, 29) - 1
>>>>>>>>>
>>>>>>>>> qcom-iris aa00000.video-codec: dma_mask DFFFFFFF (0xe0000000 -1)  
>>>>>>>>
>>>>>>>> Isn't this just the equivalent of GENMASK(28, 0)? Can't you use that?  
>>>>>>
>>>>>> Too early in the morning, this suggestion was clearly wrong.
>>>>>>  
>>>>>>>>
>>>>>>>> It's much easier to understand than GENMASK()-1.  
>>>>>>>
>>>>>>> Sure, I can use either ~GENMASK(29, 29) or ~BIT(29),  
>>>>>>
>>>>>> ~BIT(29).
>>>>>>
>>>>>> It's really weird to just disable a single bit, so I think some comments
>>>>>> explaining why this mask is needed would be good (if there aren't comments
>>>>>> already).
>>>>>>  
>>>>> I tested this some more, and seems ~BIT(29) doesn't work, as its still
>>>>> conflicting with the register space.  
>>>>
>>>> Odd, perhaps a 64 vs 32 bit issue?
>>>>   
>>>>> Correct value would be GENMASK(31,30) + GENMASK(28,0) to set the exact bits
>>>>> to get the desired value i.e 0xe0000000 -1  
>>>> Honestly, in this case I would prefer to just go with the actual hex value
>>>> 0xdfffffff together with an explanatory comment.
>>>>   
>>> We moved to GENMASK way to address comment on previous version, but sure
>>> can directly use 0xdfffffff with a comment.
>>
>> If I understood it right, bits 0-31 can be used, but the hardware has some
>> issue using bit 29 at the mask. Could you please comment why it can't be
>> used?
>>
> That would not be a correct statement, We don't have issue with using BIT
> 29 with mask but upper limit of DMA address available to use is 0xdfffffff.

I'd keep the original representation of the DMA address mask. This is
not an register to represent it via GENMASK. It is used by the driver to
set the hardware limitation on the upper bound of DMA address range.

.dma_mask = 0xe0000000 - 1

because we set it through dma_set_mask_and_coherent() which expects a
mask we subtract 1.

~Stan


