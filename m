Return-Path: <linux-media+bounces-20526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC719B49AE
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 13:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D2371F238A1
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 12:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF3720604A;
	Tue, 29 Oct 2024 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icNBz2B8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F3D17996;
	Tue, 29 Oct 2024 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730204940; cv=none; b=dZbowug03uATj0eMIPGqEbuIynKJKjWWzR5M2CMvIkGtkcKMC9Rbbr6Qs0DI2LCSEBKFGzPZuAB8jn0TPJDCKiPAKr1SaThf+Ecv0Qq5MbXFWdAu4XY6058+Jx7Ud4so0R7iZUumu8DfN9j7XOSNJn8UItjHys8vAPVcxI0M1es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730204940; c=relaxed/simple;
	bh=04meLo+wcoUiD3GkzL/77ppX+11YNySAVZTAFjwFCqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RH4Y/IKcJC+n462LmUjwUJ13eFwVHe0Y91+DHcd27GNQq5kzzMLy0igP7frZYUn5DSCTKzrnefy6uESn3kmDiDMF8Ktx4Wyut87XCKf9TbQYaz+dF2HoYu8NiAPMbsC98Gyl1KF6Q0UskmgGSxSDt1myh0K/xW46BvMA9JCRrNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icNBz2B8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D492FC4CEE5;
	Tue, 29 Oct 2024 12:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730204940;
	bh=04meLo+wcoUiD3GkzL/77ppX+11YNySAVZTAFjwFCqU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=icNBz2B8tPiyU0J92l2r6aYkXmlUyG9ErTbhk5iS/yoeKwf/EKsWtlM9+czRrdhEq
	 +m8tTIvuK8QOZX9iUcbYe99T53gsAIaFbJNAMiuSTG9HgXJfTo0FBCd1DNVgTh7Csk
	 PqE726eqo/MQS3qlOXHzT1IgXas7xT6xnb3XfcEV7dbzBdCphuAEwtVpJ/VM1qDHkd
	 ZZzhDBp4HaTtXdGutdZrmw09O310i4wlTZ7YC7Qkq+XuZQ3r8tLH2UWEvuDhDTYAzf
	 367tQPPWke3rDmVuoZHdRjnuxcui/Ma7pa8PqLdLqXgTBTElfv3vr4/G4XNn0cfScd
	 xV/t4RVeIBLCg==
Message-ID: <3ff55dc3-c6a9-40a8-8e21-2e3e43cfd614@kernel.org>
Date: Tue, 29 Oct 2024 13:28:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: media: i2c: Add bindings for OX05B1S
 sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
 laurentiu.palcu@nxp.com, robert.chiras@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
 kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, julien.vuillaumier@nxp.com, alice.yuan@nxp.com
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-2-mirela.rabulea@nxp.com>
 <216a2728-ab62-4b76-aca5-8d911687dfbe@kernel.org>
 <20241029121039.GM22600@pendragon.ideasonboard.com>
 <eeaa92c0-fed6-408b-8471-47acf0ca394d@kernel.org>
 <20241029122150.GN22600@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241029122150.GN22600@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/10/2024 13:21, Laurent Pinchart wrote:
> On Tue, Oct 29, 2024 at 01:15:46PM +0100, Krzysztof Kozlowski wrote:
>> On 29/10/2024 13:10, Laurent Pinchart wrote:
>>> On Tue, Oct 29, 2024 at 07:14:28AM +0100, Krzysztof Kozlowski wrote:
>>>> On 28/10/2024 20:06, Mirela Rabulea wrote:
>>>>> Add bindings for OX05B1S sensor driver
>>>>>
>>>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>>>>
>>>> <form letter>
>>>> Please use scripts/get_maintainers.pl to get a list of necessary people
>>>> and lists to CC. It might happen, that command when run on an older
>>>> kernel, gives you outdated entries. Therefore please be sure you base
>>>> your patches on recent Linux kernel.
>>>>
>>>> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
>>>> people, so fix your workflow. Tools might also fail if you work on some
>>>> ancient tree (don't, instead use mainline) or work on fork of kernel
>>>> (don't, instead use mainline). Just use b4 and everything should be
>>>> fine, although remember about `b4 prep --auto-to-cc` if you added new
>>>> patches to the patchset.
>>>>
>>>> You missed at least devicetree list (maybe more), so this won't be
>>>> tested by automated tooling. Performing review on untested code might be
>>>> a waste of time.
>>>>
>>>> Please kindly resend and include all necessary To/Cc entries.
>>>> </form letter>
>>>>
>>>> Binding also looks very different than all other devices, so re-write it
>>>> starting from EXISTING GOOD bindings. Not some downstream stuff.
>>>
>>> Krzysztof, please point to a good example when making this kind of
>>> comment.
>>
>> Anything recently added. Git log tells which files were recently added.
> 
> If the review comment is a copy&paste (given that you review lots of
> bindings and constantly have to repeat the same things, that would make
> sense), expanding it with that information for future reviews could help
> patch authors. Thanks for considering it, it would be much appreciated.

Sorry, but that's not the point. You do not take 10 yo, unmaintained
driver and use it as template for your new one. Instead you rather take
something recent or something which you know is correct. Same with bindings.

NXP is not a small company which does not know how to use Linux or how
to upstream stuff. This is not individual's contribution, where one does
not have colleagues or 3 billions USD of revenue behind, to be able to
get some internal help prior sending something downstream.

They can spend something out of these 3 billions of revenue or 700
millions of net income to hire you guys or any other open-source
company, if basics of upstreaming are unknown.

That's the comment I was giving about NXP since a year. Some things
around SoC improved, some things from this unit of NXP here did not
change at all.

So again, it's not about me giving them more things. They will keep
ignoring it over and over, because that's how big companies sometimes
behave. You know, community people work for free, right?

Best regards,
Krzysztof


