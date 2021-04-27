Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C76136C600
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236009AbhD0MXv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:23:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:46420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236149AbhD0MXu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:23:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48C3061006;
        Tue, 27 Apr 2021 12:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619526187;
        bh=AJLtzyEqMg1MI8ZSuMF/zVWlFVjrxqfNK/tQEDyfMbk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BRk8hDPlHytn1Y79GNXQuaBA8Js6HoFcIs8Q94Io5o2fytD503tZk7wjFfrtpAEFZ
         qY44Km74RyW6r3P/QklOzLUevzWUpwNkdwakIyUlEtQdw8RDE+IB7xkwQr1wwbI7l6
         Luc7wfOwcKiw9Rmx/4aukAJXfC5vJ5T6uN+CUJIBZ4J0GY4wKTmaG3Kr6uKg4CJnoe
         CN4o1vW3NLMdUrjpVOqqG3EBT4Aeipbby0uzokUGLnvlrhSiItBz7HyzVtpf8RjOzN
         Fqw6ZfXdaQ5PG73lkIfc7LLVCqQA+4qS0OLbQOAyIIGgjO9v6DRH7sUPbdqBMQ5fai
         op8prupQyaitg==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lbMkK-0002VL-S4; Tue, 27 Apr 2021 14:23:20 +0200
Date:   Tue, 27 Apr 2021 14:23:20 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 38/78] media: i2c: mt9m001: use
 pm_runtime_resume_and_get()
Message-ID: <YIgCOA1kSd/lzLFc@hovoldconsulting.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <beddb7295807f43a190f2add6c1665b7475cb154.1619191723.git.mchehab+huawei@kernel.org>
 <20210424082454.2ciold3j3h2jw47m@uno.localdomain>
 <YIPsTsEA/F+o7fhQ@hovoldconsulting.com>
 <20210426163840.67ea8af9@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210426163840.67ea8af9@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 26, 2021 at 04:38:40PM +0200, Mauro Carvalho Chehab wrote:
> Em Sat, 24 Apr 2021 12:00:46 +0200
> Johan Hovold <johan@kernel.org> escreveu:
> 
> > On Sat, Apr 24, 2021 at 10:24:54AM +0200, Jacopo Mondi wrote:
> > > Hi Mauro,
> > > 
> > > On Sat, Apr 24, 2021 at 08:44:48AM +0200, Mauro Carvalho Chehab wrote:  
> > > > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > > > added pm_runtime_resume_and_get() in order to automatically handle
> > > > dev->power.usage_count decrement on errors.
> > > >
> > > > Use the new API, in order to cleanup the error check logic.
> > > >
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  

> > I'd say this kind of mass-conversion is of questionable worth as
> > pm_runtime_resume_and_get() isn't necessarily an improvement (even if it
> > may have its use in some places).
> 
> The main problem is that other parts of the driver's core APIs
> assume that get object methods will only increment the usage
> counter if no errors. The pm_runtime_get_sync() is an exception.
> 
> Its name doesn't help at all: A function like that should, IMHO,
> be called, instead:
> 
> 	pm_runtime_inc_usage_count_and_try_to_resume().
> 
> Or something similar, in order to make clearer that it always
> increment the usage count, no matter what. If possible, all drivers
> should get rid of it too (or alternatively add comments warning
> people that keeping the usage_count incremented is desired on the
> very specific places where it is really needed), as it is risky
> to use something that has a different usage_count increement behavior
> than other more usual *_get() functions.

pm_runtime_get_sync() has worked this way since it was merged 12 years
ago, and for someone who's used to this interface this is not such a big
deal as you seem to think. Sure, you need to remember to put the usage
counter on errors, but that's it (and the other side of that is that you
don't need to worry about error handling where it doesn't matter).

Also note all the pm_runtime_get functions *always* increment the usage
count even if an async resume may later fail so there is consistency
here.

And regarding naming, the new pm_resume_and_get() looks completely out
of place to me since it uses a different naming scheme than the other
helpers (including the ones that are used to balance the new call).

> With regards to mass-fixing it, I've seen several patches seen
> to media fixing bugs due to the bad usage_count decrement logic.
> So, the best is to solve them all at once, and stop using
> pm_runtime_get_sync() inside the subsystem.

Sure, having the script kiddies patch drivers without understanding what
they're are really doing is bound to introduce bugs unless it can be
caught in review.

You're call, but converting functioning drivers where the authors knew
what they were doing just because you're not used to the API and risk
introducing new bugs in the process isn't necessarily a good idea.
Especially since the pm_runtime_get_sync() will continue to be used
elsewhere, and possibly even in media in cases where you don't need to
check for errors (e.g. remove()).

Johan
