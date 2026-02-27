Return-Path: <linux-media+bounces-53778-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GPSKWERommxywQAu9opvQ
	(envelope-from <linux-media+bounces-53778-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 22:49:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 234D71BE490
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 22:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D51443033E2E
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 21:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76DA478E5B;
	Fri, 27 Feb 2026 21:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhfwMwnF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26499155A5D;
	Fri, 27 Feb 2026 21:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772228949; cv=none; b=TlghXmbs0g3JOcvMn8kPGMAMggTtIB+xAQ97DZZg+oa2BGdrWOSpSlkaZtTVEmTYJrKARt+8AxLTXcGpt8u+pDgyjlIb5K57DvtK688bRVb9qLtm55ZLtgyvPlaMtZHJV/veOkenV7XCAXnmvlw+0qZIgJfoyEvDaSDDz6Vp5b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772228949; c=relaxed/simple;
	bh=QfBBgQJBS8F95UKPbfTjtdgwQT1EATTGVxmUd+d+Riw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RqGJhR+jjfAPgly/ZlxgcC50QQHasevNRCuECVEd2CPxtVfNNifvx04tHoeZH26OqC1+Vd6UPGOd6vtVRWuP+6jd7Mb+fbA2kIt/M+isFM7Qn1sJpsjyWjW/XWg7Su0b0WehfXYzh3sqqPHbYOI9a/2CYBMKQSH4ov3lGQ7SqPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhfwMwnF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2290EC116C6;
	Fri, 27 Feb 2026 21:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772228949;
	bh=QfBBgQJBS8F95UKPbfTjtdgwQT1EATTGVxmUd+d+Riw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OhfwMwnFm4k4QtZFUyS6cAeYof4aOTtqem7wVsjHE7om/Oe669FT2bSvaCyWXRa6c
	 qT5ZzPeTEE8CwKfCKw6GHfDKUq5REZo8oz1aVPDydEyvp7K+dnFcRMsU7sXomWP4tw
	 gLiWNBJkHE7ACuvpCqNCnEIDRepU5FQLMQlX3ECQH7dWVof5G+dyVi0G1GlKSh0oXe
	 up57U10udV5RTkNuJqO/bS3C+j0aYFYV4ZnbkQF+l6KCgairZeQVrY3oAMHy2CaeIZ
	 jVaJftzfz8r2lD9WxLZq+Ryo6XV1v8jx5YlX8QeyF1RJR+HKAG6ktoy932DEl0fjEH
	 d7UWWTohbi9IQ==
Message-ID: <1d11c60b-cb17-4d79-b5d8-98cfa4a01c92@kernel.org>
Date: Fri, 27 Feb 2026 21:49:00 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/18] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <CuJMpimPBtwHGAd5-YHUArL6FkU2HQeY4SjbxeMwf0ToQ7LKO3zWSTn86L-HKxC1KfarWc4rRbZqnCMQsv0pcw==@protonmail.internalid>
 <20260226-fluffy-complex-malamute-7ecec6@quoll>
 <35b1ba2a-e156-4542-b33a-d4e53f6a62cb@kernel.org>
 <tVxcOw7tqTRGXAoW06WPM_voMVBY3SO7Mm_MTMWp6OuotVmgmyi0DOgVHdDavO2V6o3iRH7ax0NosgHuzGkHgw==@protonmail.internalid>
 <4ebe2f26-29fa-4104-bc90-3f5aa7009ec3@kernel.org>
 <c2d9742c-3d82-4340-a11b-16370bcad5ea@kernel.org>
 <72f0ed74-ac86-4571-8a72-d41282349718@kernel.org>
 <d1ddaa7f-cfba-4e71-8a9f-70014c57de74@linaro.org>
 <934812b1-a853-471f-beb7-3988eff0856d@kernel.org>
 <71fcb165-7fda-4714-b56b-40d6537b8ccd@linaro.org>
 <TuRzw7gvHq4kGuIPxOGlsFrWpncg6AaWqgAfNKN5AeVkKD7gxm9MYa492tYtlOoQA0QjUvcnWVZzJ3Nnaxk8FA==@protonmail.internalid>
 <woncxvvebqt2iyoozkjnpjf3k5w4ibwzf2yhk3zbtck4fz2lgo@ai6rrd5iqpvp>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <woncxvvebqt2iyoozkjnpjf3k5w4ibwzf2yhk3zbtck4fz2lgo@ai6rrd5iqpvp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53778-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 234D71BE490
X-Rspamd-Action: no action

On 27/02/2026 20:10, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 08:48:45AM +0000, Bryan O'Donoghue wrote:
>> On 27/02/2026 07:24, Krzysztof Kozlowski wrote:
>>>> Well, is there a way to support both then ?
>>> I would just not touch x1e80100, but if you want then probably binding
>>> should stay backwards compatible, where you keep all properties intact
>>> and only add csiphy nodes.
>>>
>>
>> I really want to stop adding new stuff with the legacy way that has broken
>> power-rails, even if that means x1e has a bit Frankenstein binding.
> 
> X1 is fine. Please thing of a migration path for the older platforms
> too.
Yeah no we're very much singing from the same hymn sheet here. As I told 
you elsewhere but its worth stating for the internet machine, I thought 
"put the CSIPHY at the same scope as the CCI" and am not wedded to the 
choice between sub-nodes of CAMSS or peer nodes to CAMSS aside from the 
above statement.

Being able to move older platforms with already fixed schema to the new 
CSIPHY driver hadn't really occured to me but, since you raise it, I 
think its worth trying to support.

I will alloc(cycles);

---
bod

