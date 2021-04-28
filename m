Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F5736D66F
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 13:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238733AbhD1L3o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 07:29:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:47098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230420AbhD1L3n (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 07:29:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9319613D9;
        Wed, 28 Apr 2021 11:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619609339;
        bh=Iic85jAgXlML0nAoIg9PqnUZHUYCqj/YyqkkB9K1oEE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MNxqDVQfnvBIpHFIFHBl/6oVJ7gcZD9mAcnkRI/7m0WU7CX1BqeOpcgKrojv0AHFl
         rRHCcUIBND+jR20sDGzuk9/00UJKepztXsWAL9Q1Ovl1qy3POX8l7wnVEKyLP/jHxr
         bFwj6SYYHCEo7VU93QqPz0p3JxjUoHZDghkDv+chLVK9vrMsO9m3dyUSkyHv/7/SQZ
         rFQ08ezLUtLJ9OihZm+000+rsR2YHdmcC4FaodhaPYM1aGvNCcLS0TMjSEgjeKZ/QI
         hM00RPB9LfC4V+HvfG2E9EdA1OOkQ8EOqs8AFoGTr6v4H6dFDaX+8n+kgQ9S0oD7zU
         LQWHbeAQyDfow==
Date:   Wed, 28 Apr 2021 13:28:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 38/78] media: i2c: mt9m001: use
 pm_runtime_resume_and_get()
Message-ID: <20210428132853.65b162a0@coco.lan>
In-Reply-To: <YIkzZs8t0lMWVjzt@hovoldconsulting.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <beddb7295807f43a190f2add6c1665b7475cb154.1619191723.git.mchehab+huawei@kernel.org>
        <20210424082454.2ciold3j3h2jw47m@uno.localdomain>
        <YIPsTsEA/F+o7fhQ@hovoldconsulting.com>
        <20210426163840.67ea8af9@coco.lan>
        <YIgCOA1kSd/lzLFc@hovoldconsulting.com>
        <20210428103148.590191ac@coco.lan>
        <YIkzZs8t0lMWVjzt@hovoldconsulting.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 28 Apr 2021 12:05:26 +0200
Johan Hovold <johan@kernel.org> escreveu:

> On Wed, Apr 28, 2021 at 10:31:48AM +0200, Mauro Carvalho Chehab wrote:
> > Em Tue, 27 Apr 2021 14:23:20 +0200
> > Johan Hovold <johan@kernel.org> escreveu:  
> 

> > > You're call, but converting functioning drivers where the authors knew
> > > what they were doing just because you're not used to the API and risk
> > > introducing new bugs in the process isn't necessarily a good idea.  
> > 
> > The problem is that the above assumption is not necessarily true:
> > based on the number of drivers that pm_runtime_get_sync() weren't
> > decrementing usage_count on errors, several driver authors were not 
> > familiar enough with the PM runtime behavior by the time the drivers
> > were written or converted to use the PM runtime, instead of the
> > media .s_power()/.s_stream() callbacks.  
> 
> That may very well be the case. My point is just that this work needs to
> be done carefully and by people familiar with the code (and runtime pm)
> or you risk introducing new issues.

Yeah, that's for sure.

> I really don't want the bot-warning-suppression crew to start with this
> for example.
> 
> > > Especially since the pm_runtime_get_sync() will continue to be used
> > > elsewhere, and possibly even in media in cases where you don't need to
> > > check for errors (e.g. remove()).  
> > 
> > Talking about the remove(), I'm not sure if just ignoring errors
> > there would do the right thing. I mean, if pm_runtime_get_sync()
> > fails, probably any attempts to disable clocks and other things
> > that depend on PM runtime will also (silently) fail.
> > 
> > This may put the device on an unknown PM and keep clock lines enabled
> > after its removal.  
> 
> Right, a resume failure is a pretty big issue and it's not really clear
> how to to even handle that generally. But at remove() time you don't
> have much choice but to go on and release resource anyway. 
> 
> So unless actually implementing some error handling too, using
> pm_runtime_sync_get() without checking for errors is still preferred
> over pm_runtime_resume_and_get(). That is 
> 
> 	pm_runtime_get_sync();
> 	/* cleanup */
> 	pm_runtime_disable()
> 	pm_runtime_put_noidle();
> 
> is better than:
> 
> 	ret = pm_runtime_resume_and_get();
> 	/* cleanup */
> 	pm_runtime_disable();
> 	if (ret == 0)
> 		pm_runtime_put_noidle();
> 
> unless you also start doing something ret.

Perhaps the best would be to use, instead:

	pm_runtime_get_noresume();
 	/* cleanup */
 	pm_runtime_disable()
 	pm_runtime_put_noidle();
	pm_runtime_set_suspended();

I mean, at least for my eyes, it doesn't make sense to do a PM
resume during driver's removal/unbind time.

Regards,
Mauro


> 
> Johan



Thanks,
Mauro
