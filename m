Return-Path: <linux-media+bounces-53460-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOi2BFIVoGlifgQAu9opvQ
	(envelope-from <linux-media+bounces-53460-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:41:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7E61A39FD
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D95003018053
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 09:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11840396D1B;
	Thu, 26 Feb 2026 09:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLS7ItEK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC94389462;
	Thu, 26 Feb 2026 09:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098845; cv=none; b=sQ0DdanaG7Cc/H2b85cN4uM6HSJcmj8fs+nzqIWnWE3b03vwMdSPta8nVNftTtrP/ItuiObhaRIqLL0xonjdLPR0O1adU7dDhjPqcQs8qCNfZRAvcmGobtQXDawkHdGNXgZdB52on+kUaLY/2eSafPGfhnxjv35ds2FdehwGViQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098845; c=relaxed/simple;
	bh=QHY47h/TjPBp6NY294KbWIc5ru66u4hKqyorM2kux24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWlIuGFCaTpM6yYWh9SKjRWD1z7SSleZJ2T+OBY/DTozdGi8tsKeT5qkkd8geTOAw+s91c98/QBx3gvUF8FhDeCt682c69X96SoBF4D8G60gxgr93XyFWwMtiKFPCzz+Vwvq+4M8XRD+lKpmIbg2+dewVlfSyeYxYcScroDTdFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLS7ItEK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F98C19422;
	Thu, 26 Feb 2026 09:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772098845;
	bh=QHY47h/TjPBp6NY294KbWIc5ru66u4hKqyorM2kux24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HLS7ItEKocqtKSSl6JcAhpO3gkAZxhcKgyu9WU/sQeIQ80c+0f+n0KU7Q9r3GVfEf
	 i2ImvM1Wq1/DJ33giPojRzfCvGw4CAodyuJPXrTAANr8ZT3ClaR4g3NnBhxcBLFctb
	 DJTpBlenGtb3UOKGENAMstHgHDZdf1hi0WyFmSdHX5ys5+42DzokJx/b38osHlNkgJ
	 bnxtrteuYkhiVdfOZjQRlsOyUobIbomu1CyKRtFaH0zlWb22sQcK4rDEY94uCp7q1a
	 z+WHVCMwI63SY9vU1sI3WcMynGu9r6shhyJC4Jup6rUIwRt2TNSLxDawlARP8ROci9
	 usdFoo/7oRCnA==
Message-ID: <c2d9742c-3d82-4340-a11b-16370bcad5ea@kernel.org>
Date: Thu, 26 Feb 2026 09:40:37 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/18] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-2-95517393bcb2@linaro.org>
 <CuJMpimPBtwHGAd5-YHUArL6FkU2HQeY4SjbxeMwf0ToQ7LKO3zWSTn86L-HKxC1KfarWc4rRbZqnCMQsv0pcw==@protonmail.internalid>
 <20260226-fluffy-complex-malamute-7ecec6@quoll>
 <35b1ba2a-e156-4542-b33a-d4e53f6a62cb@kernel.org>
 <tVxcOw7tqTRGXAoW06WPM_voMVBY3SO7Mm_MTMWp6OuotVmgmyi0DOgVHdDavO2V6o3iRH7ax0NosgHuzGkHgw==@protonmail.internalid>
 <4ebe2f26-29fa-4104-bc90-3f5aa7009ec3@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <4ebe2f26-29fa-4104-bc90-3f5aa7009ec3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53460-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C7E61A39FD
X-Rspamd-Action: no action

On 26/02/2026 09:33, Krzysztof Kozlowski wrote:
> On 26/02/2026 10:27, Bryan O'Donoghue wrote:
>> On 26/02/2026 07:07, Krzysztof Kozlowski wrote:
>>> No, it does not allow that. You cannto change the ABI.
>>>
>>> That's why I reminded multiple times before reviewing new CAMSS bindings
>>> for Milos and something more. Because once it gets accepted, you cannot
>>> change it anymore without valid reason. And there is no valid reason
>>> here provided. I kept these patches in staging/waiting for long
>>> enough...
>>
>> I thought your policy was - a dtsi had to have it, which we don't yet have.
> 
> And from where did you take that policy? I am pretty sure my each
> comment is about ABI. Heh, I even commented few times about implied ABI
> purely based on kernel, without DTS.

Correct me if I'm wrong. I thought we had discussed either @ the Linaro 
Dublin meet or the Linaro Amsterdam meet that changing upstream YAML 
would be feasible _if_ you could show there was no dependency on it - 
say u-boot, FreeBSD etc.

I completely understand why you'd say for a UART definition its an ABI 
since quite likely another OS might consume the YAML but, I also think 
nobody but upstream Linux cares about this binding at all and our only 
actual user is upstream dtsi in Linux, which doesn't exist yet.

---
bod

