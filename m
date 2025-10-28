Return-Path: <linux-media+bounces-45834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0A7C15399
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 15:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8D69662538
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 14:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE44223DD1;
	Tue, 28 Oct 2025 14:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJhnnN7x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C101232F768;
	Tue, 28 Oct 2025 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761662311; cv=none; b=hbkZuWrWq2YG+hNUo57eLo+BjAJuvzpQ0fDADtHqtHfKUWftDVAH/EQrcfEqBbpv9XCIMhf8hi9jyZ9gmJXBt7pOWXSzBU5B4pH07LLpaUZugpw9ApWTqR6B3LKL7xIPoOj2iKtmdxdcu8AA9ZyPNuh4YYnnPloKg5hwZo83+jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761662311; c=relaxed/simple;
	bh=4j0un+yBwJcHmr4n8qOyrNQXsu4OKZ4//jycMXfhMYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hskb83rbjzz+Q9Hi7b1JEcQbk2YLtj+qlwzLJm6bbVpkaiGSAjeCqDpBLEYNV3nHA1V+6lIZhEtltYqxAmOpBqWjNqMosfZqpmKw+JQ+MjM5mp0eX+gmdXz+Ks/HTuDMWcWawfW8t/DPPmuDahvSd2NNpn1Qx4r/uaKWlQZveMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJhnnN7x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24348C4CEE7;
	Tue, 28 Oct 2025 14:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761662311;
	bh=4j0un+yBwJcHmr4n8qOyrNQXsu4OKZ4//jycMXfhMYs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OJhnnN7xqjO/KXC55OcRoc9NT3ik2bcnz6NBbWVypD3HuL85Jm7G/Jp+D1e7mjqU2
	 DUInqCdOxiuQEgLYL1IX6qKMroYJpxfrJrd3bZ1b38F6tgb4Y0IvFxsbwEOUGA980h
	 rvahIuwCul9uaOEA2Ol30MpB7wCU9YWwIa/tnjZmDIl83QKwEfXTTzkF6vRMeS4lG/
	 Cbpbv6dtVY2jC8DPuoqSVd35IUg0JQBJQlmUKdm4h2+3PMZF9ZZJUTGw3fVvpxp/q9
	 vYl8KIpi209xwtfYfOerrkiM/rxSyfK7UV/EYZVNJK0ATLOAVDdNBx6NeMEzjJwjFL
	 toAOnynvIq6qg==
Message-ID: <8718bd8e-12b0-4c4e-9155-7e394f0d5a16@kernel.org>
Date: Tue, 28 Oct 2025 15:38:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/25] media: i2c: ov01a10: Fix test-pattern disabling
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 stable@vger.kernel.org
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-7-hansg@kernel.org>
 <rywqbh2ku7aexskohujwsiv7yzgn7lipgdqol3rqtkcvqrmn3q@c6oe7wc45hti>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <rywqbh2ku7aexskohujwsiv7yzgn7lipgdqol3rqtkcvqrmn3q@c6oe7wc45hti>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mehdi,

Thank you for all the reviews and testing.

On 28-Oct-25 1:08 PM, Mehdi Djait wrote:
> Hi Hans,
> 
> Thank you for the patches!
> 
> On Tue, Oct 14, 2025 at 07:40:14PM +0200, Hans de Goede wrote:
>> When the test-pattern control gets set to 0 (Disabled) 0 should be written
>> to the test-pattern register, rather then doing nothing.
>>
> 
> A small question: Do you see any difference between test_pattern 1 and
> test_pattern 2 or I did not look hard enough at the screen ?

IIRC the one has the colors fading (a bit) from left to right and
the other from top to bottom ?

Regards,

Hans



