Return-Path: <linux-media+bounces-19816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 015DF9A3404
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B624B281A18
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9288F17B4FC;
	Fri, 18 Oct 2024 05:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPyE/E/x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E166F15F3FF;
	Fri, 18 Oct 2024 05:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729227687; cv=none; b=pJbIgQAf9t/H2H5MX0ECszoCK+kFDQNBeq/Uan7skgo227B4gBEHmQIkGaq3UKBDO2z1U2rGFBiiW0e4yMAriKDA9W5T1JaZs8TOP6nbQHk/ms8l5jGp9XMVMqHIW/4PWCLXJlNS9xY9ZaFYl9DTBCm3IUpBUhwKpI9p69XQ2pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729227687; c=relaxed/simple;
	bh=r0Fhyd9JehchlqW6mZ+ZEgy9xDeIQ6PrnJVT+qBQq7U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h0/dK8ktQg0xJcQyyYPbZC5jwmc3went/fLwkO5kIjX2SPOOgfe57G/28nlRcfWqtZTWleyM2QlXAJ6YJhqcpl3zDVczJQ4pOYGTRdHLjNHlRFASC/3qC3t0LDqyTXhegDhER7M2qsTfGsfQSuyMkRT3Y3feNlJr6EMq5Xrn++w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPyE/E/x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65154C4CEC3;
	Fri, 18 Oct 2024 05:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729227686;
	bh=r0Fhyd9JehchlqW6mZ+ZEgy9xDeIQ6PrnJVT+qBQq7U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KPyE/E/xCtbWmKp5+6eidKeyy99yoi5i5nyTKAJZvcGwowPypixLksS85yJMnXbm2
	 UbeCsgaahtVVhm2ihcp7hIripijtD/7eGTShxDE5MwgSo+meH7ED/+/RjSD7AcYbVH
	 Vg8E1oBVmCKoL0C537B01ylUpcAOrll3WkMGpi7USrq4lKoYjuvci3P9OWv3YJ7QJv
	 xgVguw8i1KudhJjoB0o+m+M9d0LSnnHbr34wkkC6YiQfkRGYoYIUVrHJ2HSOeyc+LH
	 66VlWvT7kxToTpgJ1ekA8UDxrD3DS6L4pIzuwQXfcSJjOD+qSwGIB6TjELNPUNqk0r
	 0OG+sV/Oipfjw==
Date: Fri, 18 Oct 2024 07:01:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 10/13] media: adv7604 prevent underflow condition when
 reporting colorspace
Message-ID: <20241018070121.5883b2e5@foz.lan>
In-Reply-To: <c04c22f5-cafa-4618-ad7c-319a8afc6214@xs4all.nl>
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
	<41d12c1afd6571f9cc56c1b920df6ba558d0b927.1729074076.git.mchehab+huawei@kernel.org>
	<e591ffa7-4214-4ec0-91f3-65c809aedce9@xs4all.nl>
	<20241016132448.15e5a4fa@foz.lan>
	<c04c22f5-cafa-4618-ad7c-319a8afc6214@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 16 Oct 2024 13:58:48 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 16/10/2024 13:24, Mauro Carvalho Chehab wrote:
> > Em Wed, 16 Oct 2024 12:57:53 +0200
> > Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> >   
> >> On 16/10/2024 12:22, Mauro Carvalho Chehab wrote:  
> >>> Currently, adv76xx_log_status() reads some date using
> >>> io_read() which may return negative values. The current logi
> >>> doesn't check such errors, causing colorspace to be reported
> >>> on a wrong way at adv76xx_log_status().
> >>>
> >>> If I/O error happens there, print a different message, instead
> >>> of reporting bogus messages to userspace.
> >>>
> >>> Fixes: 54450f591c99 ("[media] adv7604: driver for the Analog Devices ADV7604 video decoder")
> >>> Cc: stable@vger.kernel.org    
> >>
> >> Not really a fix since this would just affect logging for debugging
> >> purposes. I would personally just drop the Fixes and Cc tag.  
> > 
> > The issue is on a VIDIOC_ ioctl, so part of media API. Ok, this is
> > used only for debugging purposes and should, instead be implemented
> > via debugfs, etc, but, in summary: it is what it is: part of the V4L2
> > uAPI.  
> 
> The ioctl, yes, but what it logs to the kernel log isn't part of the ABI.
> That can change.

Sure, logs can change, but this is an user-visible bug.

> I think it is overkill to send this to stable for an old chip that almost
> nobody uses, and that requires an i2c read to go wrong for it to produce
> a wrong debug message. It seems an unnecessary waste of time.

Agreed. Will drop cc stable.

> > 
> > -
> > 
> > Now, the question about what should have Fixes: tag and what
> > shouldn't is a different matter. I've saw long discussions about
> > that at the kernel mailing lists. In the particular case of y2038,
> > I'm pretty sure I saw some of them with Fixes tag on it.  
> 
> But patch 13/13 doesn't affect the operation either, again it is just
> an incorrect log message that can only go wrong if Pulse-Eight still
> sells that device in 2038 with a firmware build date >= 2038. 

> And v6.12 is guaranteed to be EOL in 2038 :-)

We can't count on it. Civil infrastructure is now working with a 10 years
SLTS:

	https://www.linuxfoundation.org/press/civil-infrastructure-platform-expands-slt-stable-kernel-program

I heard somewhere that having a 15 years or 20 years stable Kernel is a
need for certain usages.

Even commercial distros have a minimum of 10 years as LTS.

Suse is now working with a 13-years support. Both Canonical and Red Hat
announced a 12-years ELTS support. As they usually takes the last year's 
LTS Kernel, it means support will end with a 14 years old Kernel (so, 
support will end in 2037 or 2038 if they release an LTS distro next year),
and don't decide to extend it further.

I also heard during LPC that there's an increased pressure from Linux
customers from commercial distros to extend it even further.


Thanks,
Mauro

