Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FF636D565
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 12:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239087AbhD1KF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 06:05:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:32908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238345AbhD1KF6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 06:05:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 942BE61026;
        Wed, 28 Apr 2021 10:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619604313;
        bh=MyeSwjuWDkzwkgFnTJD3WNHelmDMb1YG6N+hdAddu3g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jsg5uBYN0tqjOsXJoDGuhGzUgumrzePDIHuFSW+c8aeNPs5+ayoQ4bXXomBh6mwVZ
         NeWmNhQB4KslN0JoubOPJRNj6e6XuY3Z+2D3XrgrGl8tr62HPWL0zFpUHOPlWJNUPS
         j6+1PjcmN8VTI2NDtO/pKOKymfmPHQLKHNmRZ7EY3+rjudM3vi/9PZJKQb+wjXaBR5
         Rer55BJBxx9YMHsw8YkSmg0q9PF0bjx+cOOkXyK0UibOkSMuGRNBKfaJqxF1uIlEtk
         hnqgCLTCdGVaeK8J+n7RObpHWJrM4lrE+SA3Dt+VJq4AzJ3RfyPqaba0gM4+q4vtrx
         XLmMhMYPWQ7Tw==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lbh4Q-0003ws-5z; Wed, 28 Apr 2021 12:05:26 +0200
Date:   Wed, 28 Apr 2021 12:05:26 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 38/78] media: i2c: mt9m001: use
 pm_runtime_resume_and_get()
Message-ID: <YIkzZs8t0lMWVjzt@hovoldconsulting.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <beddb7295807f43a190f2add6c1665b7475cb154.1619191723.git.mchehab+huawei@kernel.org>
 <20210424082454.2ciold3j3h2jw47m@uno.localdomain>
 <YIPsTsEA/F+o7fhQ@hovoldconsulting.com>
 <20210426163840.67ea8af9@coco.lan>
 <YIgCOA1kSd/lzLFc@hovoldconsulting.com>
 <20210428103148.590191ac@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428103148.590191ac@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 28, 2021 at 10:31:48AM +0200, Mauro Carvalho Chehab wrote:
> Em Tue, 27 Apr 2021 14:23:20 +0200
> Johan Hovold <johan@kernel.org> escreveu:

> > pm_runtime_get_sync() has worked this way since it was merged 12 years
> > ago, and for someone who's used to this interface this is not such a big
> > deal as you seem to think. Sure, you need to remember to put the usage
> > counter on errors, but that's it (and the other side of that is that you
> > don't need to worry about error handling where it doesn't matter).
> 
> Before we have those at PM subsystem, the media had its own way to
> set/disable power for their sub-devices. The PCI and USB drivers 
> still use it, instead of pm_runtime, mostly due to historic reasons.
> 
> So, basically, its usage at the media subsystem is restricted to
> drivers for embedded systems. The vast majority of drivers supporting
> PM runtime are the I2C camera drivers. The camera drivers can be used 
> interchangeable. So, in practice, the same bridge driver can work 
> with a lot of different camera models, depending on the hardware
> vendors' personal preferences and the desired max resolution.
> 
> So, in thesis, all such drivers should behave exactly the same 
> with regards to PM.
> 
> However, on most existing drivers, the pm_runtime was added a
> couple of years ago, and by people that are not too familiar
> with the PM subsystem.
> 
> That probably explains why there were/are several places that 
> do things like this[1]:
> 
> 	ret = pm_runtime_get_sync(dev);
> 	if (ret < 0)
> 		return ret;
> 
> without taking care of calling a pm_runtime_put*() function.
> 
> [1] besides the 13 patches made by UCN addressing it on
>     existing code, I discovered the same pattern on a 
>     couple of other drivers with current upstream code.
> 
> That shows a pattern: several media developers are not familiar
> with the usage_count behavior for pm_runtime_get functions.
> 
> So, doing this work is not only helping to make the PM support
> more uniform, but it is also helping to solve existing issues.

Sure, I don't doubt that there are issues with the current code too.

> > You're call, but converting functioning drivers where the authors knew
> > what they were doing just because you're not used to the API and risk
> > introducing new bugs in the process isn't necessarily a good idea.
> 
> The problem is that the above assumption is not necessarily true:
> based on the number of drivers that pm_runtime_get_sync() weren't
> decrementing usage_count on errors, several driver authors were not 
> familiar enough with the PM runtime behavior by the time the drivers
> were written or converted to use the PM runtime, instead of the
> media .s_power()/.s_stream() callbacks.

That may very well be the case. My point is just that this work needs to
be done carefully and by people familiar with the code (and runtime pm)
or you risk introducing new issues.

I really don't want the bot-warning-suppression crew to start with this
for example.

> > Especially since the pm_runtime_get_sync() will continue to be used
> > elsewhere, and possibly even in media in cases where you don't need to
> > check for errors (e.g. remove()).
> 
> Talking about the remove(), I'm not sure if just ignoring errors
> there would do the right thing. I mean, if pm_runtime_get_sync()
> fails, probably any attempts to disable clocks and other things
> that depend on PM runtime will also (silently) fail.
> 
> This may put the device on an unknown PM and keep clock lines enabled
> after its removal.

Right, a resume failure is a pretty big issue and it's not really clear
how to to even handle that generally. But at remove() time you don't
have much choice but to go on and release resource anyway. 

So unless actually implementing some error handling too, using
pm_runtime_sync_get() without checking for errors is still preferred
over pm_runtime_resume_and_get(). That is 

	pm_runtime_get_sync();
	/* cleanup */
	pm_runtime_disable()
	pm_runtime_put_noidle();

is better than:

	ret = pm_runtime_resume_and_get();
	/* cleanup */
	pm_runtime_disable();
	if (ret == 0)
		pm_runtime_put_noidle();

unless you also start doing something ret.

Johan
