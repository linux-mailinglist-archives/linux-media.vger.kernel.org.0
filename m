Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAFF236D3FE
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 10:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237110AbhD1Icj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 04:32:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:42412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236961AbhD1Ici (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 04:32:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8553F6141F;
        Wed, 28 Apr 2021 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619598714;
        bh=8q8seLvWtMALwDRZ39mid0YWnYDGfBmHECWjMoz1lq0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=s7qJ3e7DskhEutLmfwsUuD32czlpqWLeGFX9js6vhnpCPZDB8Nvlr7LUTtD+5NQCD
         ZgrQQ7aBwJEM8vdfO9EpIO7wX+Nbznf/iAwBM/4sfddeYptKUv6KWuvd/0QaA/q1hZ
         Od9X3METL1DUGc3ttLlNUD6vfc9yBLy25o8oZ/kGpvk+fi9vHQoYCclFWw0/DYbBWg
         bD/3ERMlPtqzdlgC+9o3PwE9GdcfnhLjQBMGVb4TMrHTeXjpc4lel9ZhWH/psLWliw
         AsLZ+lq4Csm3WKHsGrDNw1ZqDERjia7xLBrgiCXDBHQk4UuXkCRnXM9v9EWOWna8R4
         ceOq4ULS89/eg==
Date:   Wed, 28 Apr 2021 10:31:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 38/78] media: i2c: mt9m001: use
 pm_runtime_resume_and_get()
Message-ID: <20210428103148.590191ac@coco.lan>
In-Reply-To: <YIgCOA1kSd/lzLFc@hovoldconsulting.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <beddb7295807f43a190f2add6c1665b7475cb154.1619191723.git.mchehab+huawei@kernel.org>
        <20210424082454.2ciold3j3h2jw47m@uno.localdomain>
        <YIPsTsEA/F+o7fhQ@hovoldconsulting.com>
        <20210426163840.67ea8af9@coco.lan>
        <YIgCOA1kSd/lzLFc@hovoldconsulting.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 27 Apr 2021 14:23:20 +0200
Johan Hovold <johan@kernel.org> escreveu:

> On Mon, Apr 26, 2021 at 04:38:40PM +0200, Mauro Carvalho Chehab wrote:
> > Em Sat, 24 Apr 2021 12:00:46 +0200
> > Johan Hovold <johan@kernel.org> escreveu:
> >   
> > > On Sat, Apr 24, 2021 at 10:24:54AM +0200, Jacopo Mondi wrote:  
> > > > Hi Mauro,
> > > > 
> > > > On Sat, Apr 24, 2021 at 08:44:48AM +0200, Mauro Carvalho Chehab wrote:    
> > > > > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > > > > added pm_runtime_resume_and_get() in order to automatically handle
> > > > > dev->power.usage_count decrement on errors.
> > > > >
> > > > > Use the new API, in order to cleanup the error check logic.
> > > > >
> > > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>    
> 
> > > I'd say this kind of mass-conversion is of questionable worth as
> > > pm_runtime_resume_and_get() isn't necessarily an improvement (even if it
> > > may have its use in some places).  
> > 
> > The main problem is that other parts of the driver's core APIs
> > assume that get object methods will only increment the usage
> > counter if no errors. The pm_runtime_get_sync() is an exception.
> > 
> > Its name doesn't help at all: A function like that should, IMHO,
> > be called, instead:
> > 
> > 	pm_runtime_inc_usage_count_and_try_to_resume().
> > 
> > Or something similar, in order to make clearer that it always
> > increment the usage count, no matter what. If possible, all drivers
> > should get rid of it too (or alternatively add comments warning
> > people that keeping the usage_count incremented is desired on the
> > very specific places where it is really needed), as it is risky
> > to use something that has a different usage_count increement behavior
> > than other more usual *_get() functions.  
> 
> pm_runtime_get_sync() has worked this way since it was merged 12 years
> ago, and for someone who's used to this interface this is not such a big
> deal as you seem to think. Sure, you need to remember to put the usage
> counter on errors, but that's it (and the other side of that is that you
> don't need to worry about error handling where it doesn't matter).

Before we have those at PM subsystem, the media had its own way to
set/disable power for their sub-devices. The PCI and USB drivers 
still use it, instead of pm_runtime, mostly due to historic reasons.

So, basically, its usage at the media subsystem is restricted to
drivers for embedded systems. The vast majority of drivers supporting
PM runtime are the I2C camera drivers. The camera drivers can be used 
interchangeable. So, in practice, the same bridge driver can work 
with a lot of different camera models, depending on the hardware
vendors' personal preferences and the desired max resolution.

So, in thesis, all such drivers should behave exactly the same 
with regards to PM.

However, on most existing drivers, the pm_runtime was added a
couple of years ago, and by people that are not too familiar
with the PM subsystem.

That probably explains why there were/are several places that 
do things like this[1]:

	ret = pm_runtime_get_sync(dev);
	if (ret < 0)
		return ret;

without taking care of calling a pm_runtime_put*() function.

[1] besides the 13 patches made by UCN addressing it on
    existing code, I discovered the same pattern on a 
    couple of other drivers with current upstream code.

That shows a pattern: several media developers are not familiar
with the usage_count behavior for pm_runtime_get functions.

So, doing this work is not only helping to make the PM support
more uniform, but it is also helping to solve existing issues.

> Also note all the pm_runtime_get functions *always* increment the usage
> count even if an async resume may later fail so there is consistency
> here.
> 
> And regarding naming, the new pm_resume_and_get() looks completely out
> of place to me since it uses a different naming scheme than the other
> helpers (including the ones that are used to balance the new call).
> 
> > With regards to mass-fixing it, I've seen several patches seen
> > to media fixing bugs due to the bad usage_count decrement logic.
> > So, the best is to solve them all at once, and stop using
> > pm_runtime_get_sync() inside the subsystem.  
> 
> Sure, having the script kiddies patch drivers without understanding what
> they're are really doing is bound to introduce bugs unless it can be
> caught in review.

Yes, but as I pointed, the current code has bugs already.

> You're call, but converting functioning drivers where the authors knew
> what they were doing just because you're not used to the API and risk
> introducing new bugs in the process isn't necessarily a good idea.

The problem is that the above assumption is not necessarily true:
based on the number of drivers that pm_runtime_get_sync() weren't
decrementing usage_count on errors, several driver authors were not 
familiar enough with the PM runtime behavior by the time the drivers
were written or converted to use the PM runtime, instead of the
media .s_power()/.s_stream() callbacks.

> Especially since the pm_runtime_get_sync() will continue to be used
> elsewhere, and possibly even in media in cases where you don't need to
> check for errors (e.g. remove()).

Talking about the remove(), I'm not sure if just ignoring errors
there would do the right thing. I mean, if pm_runtime_get_sync()
fails, probably any attempts to disable clocks and other things
that depend on PM runtime will also (silently) fail.

This may put the device on an unknown PM and keep clock lines enabled
after its removal.

Thanks,
Mauro
