Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E997E311CDB
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 12:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhBFLT1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Feb 2021 06:19:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:49500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhBFLTZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Feb 2021 06:19:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2BBC64E5F;
        Sat,  6 Feb 2021 11:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612610325;
        bh=cCUjBRR2xYapZbnU8xfy02aSLJ3iAyGXKpgpO78nfvA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TaV0GlEU469tPmzMwcc/hls4pIDUl52yC2n0QTrPKS0fV9cxO8GK7ie0+MMOSVkTj
         G0N022OGvuxcoDiEsbA5my0+NopUfJoZHRPIXYdfwnAI0uVEiZfkPjChDvWthWR4aa
         BjMzC1i9h2+2ns/qC5c68mLKNNe/4taK7kyBF8ox+dGj2TciHEomhVPVKX98GZLSKp
         XONg0MueALTXQ22MF3rqQMKyoRTAtiP6bJyBF4aguLA36Iev0G8OIpJFESRaJ1h9oK
         mv6v+P3XOKg7WW49+Hzt+/gYiu1xrp2QiFxiHDxOXGBf/WhMcvBXHvKxp7XAWC8mJb
         iWNwEUKG5qSlA==
Date:   Sat, 6 Feb 2021 12:18:39 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tony Battersby <tonyb@cybernetics.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-kernel@vger.kernel.org,
        Jari Ruusu <jariruusu@protonmail.com>,
        David Laight <David.Laight@aculab.com>,
        Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        linux-media@vger.kernel.org
Subject: Re: Kernel version numbers after 4.9.255 and 4.4.255
Message-ID: <20210206121604.4e9a10b9@coco.lan>
In-Reply-To: <8220e22e-380f-5b4e-fa69-5c6fcace8535@xs4all.nl>
References: <a85b7749-38b2-8ce9-c15a-8acb9a54c5b5@kernel.org>
        <0b12bac9-1b4e-ec4a-8a45-5eb3f1dbbeca@cybernetics.com>
        <20210205191105.128c6e48@coco.lan>
        <YB5DTUiurAwqZbz1@kroah.com>
        <20210206102402.2611b23f@coco.lan>
        <YB5hZop6JZ2Lgv63@kroah.com>
        <20210206104809.30c15609@coco.lan>
        <8220e22e-380f-5b4e-fa69-5c6fcace8535@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 6 Feb 2021 11:18:15 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> >> Yes, driver "version" means nothing, so functionality is the correct way
> >> to handle this.
> >>
> >> Any chance you all can just drop the kernel version stuff and just
> >> report a static number that never goes up to allow people to use the
> >> correct api for new stuff?  Pick a "modern" number, like 5.10 and leave
> >> it there for forever.  
> > 
> > Good question. I like the idea of keeping it fixed, marking those fields
> > as DEPRECATED at the uAPI documentation.
> > 
> > However, at least the v4l2-compliance tool (used for V4L2 
> > development) currently requires it:
> > 
> > 	if (vcap.version >= 0x050900)  // Present from 5.9.0 onwards
> > 		node->might_support_cache_hints = true;
> > 
> > Not sure if uname would work there, or if we would need, to use some
> > Kconfig symbol to only return the real version on debug Kernels.
> > 
> > Hans,
> > 
> > What do you think?  
> 
> It could be replaced by uname, but if we fix the version number to something
> >= 5.9 (which we will no doubt do), then there is no need to change anything here.

Sure, but needing to check for a so recent Kernel version probably
means that we should have an extra capability somewhere to the
feature that it is enabled only if Kernel >= 5.9.
  
> But I was wondering if it wouldn't make sense to create a variant of
> LINUX_VERSION_CODE that ignored the sublevel and just always leaves that
> at 0. In practice, media API changes only happen at new kernel releases and
> not in the stable series (there might be rare exceptions to that, but I'm
> not aware of that).

I guess there were one or two exceptions of uAPI regressions that happened
after a new version that were fixed at stable sublevel 1 or 2.

> And while we are using capability flags a lot more these days to ensure
> userspace can discover what is and what is not available, we never did a full
> analysis of that and I feel a bit uncomfortable about fixing the version
> number.

We don't need a full analysis for past features. If the version gets
fixed on, let's say, 6.0.0, if caps.version >= 0x060000, everything
supported up to the present date will be there.

We'll just need to have an extra care of ensuring that every new
feature added upstream will have a way for userspace to check if
it is present.

> I see more usages of LINUX_VERSION_CODE in the kernel that look like they do
> something similar to what the media subsystem does, and that probably also
> do not need the SUBLEVEL.

Yeah, other subsystems seem to use it as well.

> A LINUX_MAJOR_MINOR_CODE define (or whatever you want to call it) would solve
> this problem for us.

There are ways to minimize this problem on future stable Kernels.

My main concern is if we should keep letting applications relying
on caps.version. By keeping 

	cap->version = LINUX_VERSION_CODE;

(or any variant of that), applications may simply rely on it,
instead of properly implementing a functionality probing code.

To be clear: my main concern here is not about media development
tools, like v4l2-compliance. It is about real applications that
could end breaking on backports that won't be properly
back-propagating cap->version.

Thanks,
Mauro
