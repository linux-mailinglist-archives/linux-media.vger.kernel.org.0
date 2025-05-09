Return-Path: <linux-media+bounces-32190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A996DAB1FAA
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 00:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D64533B44C5
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 22:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AAF261565;
	Fri,  9 May 2025 22:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="RYZQT9eL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VWnLLtyR"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9EA17588
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 22:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828698; cv=none; b=PBj/7LhPu9D5VlEY4zND9fWeL/lpmTApWtHfJ8/FJ6JM0GegZ1jZwv58m9iiHE1HAd/2x8oEE0tc6DXtPmUjBGMeO3nyYcFD1/dgvsoYBXSCp3f8IBgIlOF8HnfvBIg6au9JV/8F6/6AAKoIUAbc2qT5cagzTT9x0EcTAIryA+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828698; c=relaxed/simple;
	bh=S+7TB3p+z3odP6t6s5jJD/28Til6UYjtrrUTy2wuVe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGp1gw9Qr6qFfqIGF0JkxNWjAxJsRRHvT4k43Rx2nWa+wqrpaXdBp8peMqLYN1VMgBVjI3WyOZdY77rT01CaYcAtcSeEK+u8yiyMcCVx6UB1z4kGNcUxkHambXysn7fSgQly5nlnpZ4Ax5xHIj/nkQpxylG7sQxCL67s66YBtNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=RYZQT9eL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VWnLLtyR; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id AA92B1140121;
	Fri,  9 May 2025 18:11:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 09 May 2025 18:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746828694;
	 x=1746915094; bh=yqP2qIC+IdsMlRcx3BejDE7pK6inOdjc9BEMmWImJm0=; b=
	RYZQT9eLQ5m/p6IWG69cAHGl00g8iiq7qf74dwoi7szHHllDgc/fdW6sxfzCWOsh
	2ZFnVO8Ai4qy5lF8jGRXrYiMXWTZZRq86LkK+ZwS7sqEY+lUk1xB1gYU0Hfe7bad
	oiOHT+Q2UkeGeqogjhBJXK4YG3XV4T5zW8Qj3zT+OPJFqxUybxVmPDG8y6R2NS1J
	mmhbo1nxgoCGidWyeBQVWztoiwwmrBI0XzQ2693/vBC+8pphhk3dbIVdUZHzamMj
	q2jAqt2YyLOgc7pnYTzyfQQzZlWE8JI+dbod0JrG6TjmvwvRE0DDMcLBF9CFvs/v
	DLkjjD98hPEPbvbHjNSKnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746828694; x=
	1746915094; bh=yqP2qIC+IdsMlRcx3BejDE7pK6inOdjc9BEMmWImJm0=; b=V
	WnLLtyRuvSWxfmQtksLHWBWl6k27RvC1fj6yVmjL9HN9TIso80oO1vggSkutKWlt
	UY/H9+mANPVGtIxrKSxuozEeEOG9c5U4LhKKOf0lFDDVpQ/aApb6KAEoyPjGjFrq
	2ExZf+r+SfUGxaf1LbVHRnNSCfGEOoaQupayshQboRii8RZ71rjl+lZDcihatr4Q
	DR/TO4A0j/8zIBQ+BMVRZkmUIa2wowWIpFaoxlncdONI6WSabKbvW6LMMZr/6l8M
	+FVcXG+92ImKpEWORe5iL4+eVT7oFGq/CYUQmzJFqRAn7Z5NHzXlOLQPW0dRL6Nk
	XIwtkXc/lM/B/FZThVn+w==
X-ME-Sender: <xms:ln0eaLm7kI9qE1C3mpseh56UOXhGapRYsTl94Iq29-aWwgplLDUdeA>
    <xme:ln0eaO0_yu0WuvRHz4WMBXzlj4ZQSCARHqj8Pbrpy1qVtBk_iIKKt04Np-fPwcNoJ
    BzlIIQIc5S1pxAlWNE>
X-ME-Received: <xmr:ln0eaBp-aGAIq_5mj3hSVHJ6H1ifKotWfwuyc_3VdT9ySsDZfAgIdQuoj7g9mZyRraBQSpQSI-eBYxKFEC0ySQEcywZgSUfnmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehhedvteehudelkeejudfhvdfgkefhveffffelfeetjeehieelveeuhf
    euvddvieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghl
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghh
    rdhsvgdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprhhisggrlhgurgestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    mhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ln0eaDl5pP57b024y7i0xVLHBJHz17EBGbxdBtM0KmJPxdAJgULWng>
    <xmx:ln0eaJ2XwJurhB1Cdbtuomqr93kkkKy2bufRiCXCXflxhqjTvEfjmw>
    <xmx:ln0eaCs42sSrkU67zkqKrnp9e0b5vdZxiUSRpHvxZFPjQo62MzS7DQ>
    <xmx:ln0eaNUdomOhHXued7rCyNjd3MSQwsL7BXC_KOp7V-WoHofnE4qTzg>
    <xmx:ln0eaK-198BNLhDavZqxh911Zqm5IcIOwvEIdl-WDLLBv68Fc89qKi3U>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 May 2025 18:11:33 -0400 (EDT)
Date: Sat, 10 May 2025 00:11:31 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org
Subject: Re: media: v4l2-common: Reduce warnings about missing
 V4L2_CID_LINK_FREQ control
Message-ID: <20250509221131.GA1722387@ragnatech.se>
References: <20250508083745.1697364-1-niklas.soderlund+renesas@ragnatech.se>
 <681e71eb.050a0220.3a7ab3.60bf@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <681e71eb.050a0220.3a7ab3.60bf@mx.google.com>

Hi Ricardo,

Thanks for all the effort you and others put into the media CI!

I just got this error report from the CI telling me a patched failed the 
style check and I don't fully understand the error message, maybe it 
could be improved?

I read you where working on the CI and as far as I can tell you where 
the one who committed the patch in question. I hope I my report go to 
the right person, if not sorry for the noise.

On 2025-05-09 14:21:47 -0700, Patchwork Integration wrote:
> Dear Niklas Söderlund:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test media-patchstyle:./0001-media-v4l2-common-Reduce-warnings-about-missing-V4L2.patch media style
> ERROR: ./0001-media-v4l2-common-Reduce-warnings-about-missing-V4L2.patch: Committer Ricardo Ribalda <ribalda@chromium.org> is not the last SoB: Niklas SÃ¶derlund <niklas.soderlund@ragnatech.se>

Do this mean you should have added your SoB when committing the patch?  
Or is the CI confused about me using a +renesas both in From: header and 
in my SoB? I don't understand where the error message got my mail 
without +renesas from.

Minor sidebar, the mail charset was set to utf-8 but somewhere it seems 
to have mangled my döts :-)

> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/76068776/artifacts/report.htm .
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
> 

-- 
Kind Regards,
Niklas Söderlund

