Return-Path: <linux-media+bounces-53458-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBZtLh4UoGlAfgQAu9opvQ
	(envelope-from <linux-media+bounces-53458-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:36:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 644AA1A386D
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AB7B30464DE
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 09:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E92314D16;
	Thu, 26 Feb 2026 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sH2H2F8l"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A4727F4CA;
	Thu, 26 Feb 2026 09:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098554; cv=none; b=SaH9dLqpAB6vx9v50hJvSGqTxWekyFkvfe6D6GHdqoUJim/jCmp+leV3i84PctLCum8OADWX6vkVbjEKK/RfZpEEO2bY3JPm21l6sQN4rSP0BXkYOdxn9jRq5qBo+W70bcOIzEkESkC57vJOFDE9Qv8LCsvEQYuxZQbyCLte12g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098554; c=relaxed/simple;
	bh=D5cEhfkk+LS+RkHszu82ZDd0Fjkauhn5RcU1rKkqBGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlHr1RxJHuHBqeZOZrH95oxL+fPLmRpUPV2OdyHO0RbdHwhCTlvkUSpM219K3Jmfpok1KKOB7qQcGD7EM0ggjXi8x6S1+/lz5n0fVDOl+mu+pH23H57Sa4F6IFGzIpBs40NUs30uJoE6icQStxQhqXVOEU1taRdJaKgtTYvqlcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sH2H2F8l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95F2C19424;
	Thu, 26 Feb 2026 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772098554;
	bh=D5cEhfkk+LS+RkHszu82ZDd0Fjkauhn5RcU1rKkqBGs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sH2H2F8l5rnWitV2agYm7GmJKBPfYhTQ2b0egmmUP5yV5ZNUXzO/UWod/YJWNZiSD
	 yASzVeRhLn23h+xwOUy84yGc0cR/GYHZrrIBa4mxlhyfRs8Kp6qThG9755sr6JGK2J
	 IqrLBj7y/w0TqkYdOmKoEK3sUe8x9sCvk8BDMTOwGnTeCw073sT+NtltKhyz9+f08e
	 E5pg4Qdi5hWoIz/OaiG7PgKg7lNDObeUOxOHVmoz2YsZ3zrbHN3JXmV6FzW9lxCaOQ
	 LznTidF5XS4DSRXm7nRgLyuZMoAwT2kYPzOnnltcYxzvle0+jOOeb1jbtZDmtvjrdI
	 CJkLMFoiA0Vmw==
Message-ID: <f9242e8f-95bc-4b2b-9b7d-2ad80bea1e46@kernel.org>
Date: Thu, 26 Feb 2026 09:35:47 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/18] dt-bindings: media: qcom,x1e80100-camss: Assign
 correct main register bank to first address
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
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-1-95517393bcb2@linaro.org>
 <6JLP5a_yJmhmmwSmtFoMmzlT3Gh5yhHVpVSRTqDb93I2_KFB6-p_6mKmGKaqtStt2bbVPqQ16j0Sfp2Z-LvhlQ==@protonmail.internalid>
 <20260226-resourceful-pelican-of-defense-437c7e@quoll>
 <13853dc8-1a54-4cfd-b801-f23d88be4a88@kernel.org>
 <5QUAno5rJaSIXrCTC1Y9QJOrrx2Pt1GGVJspvhutMHgSh6mcu5S6gsZHu3lOEVXjG7pqSyJjH6RB1wXRszZ-Mg==@protonmail.internalid>
 <860cb545-8283-4f2b-9f21-19d207ed7da3@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <860cb545-8283-4f2b-9f21-19d207ed7da3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53458-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 644AA1A386D
X-Rspamd-Action: no action

On 26/02/2026 09:32, Krzysztof Kozlowski wrote:
> On 26/02/2026 10:25, Bryan O'Donoghue wrote:
>> On 26/02/2026 07:04, Krzysztof Kozlowski wrote:
>>> No, that's ABI break for no real reason. This ABI was shipped and there
>>> is upstream (and maybe other) user of it. You cannot change it.
>>
>> We don't have an upstream user. The dtsi for CAMSS hasn't been committed.
>>
>> So this is changeable right ?
> 
> No. You have user since v6.16 (or v6.15, don't remember). This is
> released ABI.

Yes but I distinctly remember us saying if we could prove there was no 
actual _user_ then a change was possible.

Is that not the case ?

---
bod

