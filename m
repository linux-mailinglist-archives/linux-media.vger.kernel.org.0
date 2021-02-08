Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF0EF3132CA
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 13:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhBHMyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 07:54:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:52744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229715AbhBHMyw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 07:54:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14C6C64E75;
        Mon,  8 Feb 2021 12:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612788851;
        bh=jKCFNY4pwtGWTUBkQVQS9TcgWfmnNWA5LtKj9YpjZ2E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=L/AYg/0f90A8HKIzXYzja7F/Mz3SK/UDnVzRh+AMHQInFzBcJNYrMVgIhYnnX7E3X
         DUTz9iwxKfTzr5jegUuTKNOFH632s2hdOchEhWJ/mhPraEi1f5qHUPjJmRmhJ22fG6
         fN+tZTJZSVzPOHt3Q1XzSpIHt+rVpzWJGP8bQTacbLxM+SJO3DkukVBkpa2T9PTut2
         gnL6MniErU0BEl6NM0pm9+o4hlzQb6kCWoGoNkga0Z6yXqEFe84vWY+DZO0QhKm7Up
         NAOs9ES4PdCTxLBEpkN6/f1CwylwiIZnMdiHhJzBcDkEeOfMy6ogDD536zTUSPpSO/
         8b96zN1GaUDVA==
Date:   Mon, 8 Feb 2021 13:54:03 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v5 11/13] media: v4l2-async: Discourage use of
 v4l2_async_notifier_add_subdev
Message-ID: <20210208135403.68695519@coco.lan>
In-Reply-To: <20210208103244.GQ32460@paasikivi.fi.intel.com>
References: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
        <20210202135611.13920-12-sakari.ailus@linux.intel.com>
        <20210206091546.1497bbcb@coco.lan>
        <20210208103244.GQ32460@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 8 Feb 2021 12:32:44 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Hi Mauro,
> 
> Thanks for the review.
> 
> On Sat, Feb 06, 2021 at 09:15:46AM +0100, Mauro Carvalho Chehab wrote:
> > Em Tue,  2 Feb 2021 15:56:09 +0200
> > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> >   
> > > From: Ezequiel Garcia <ezequiel@collabora.com>
> > > 
> > > Most -if not all- use-cases are expected to be covered by one of:
> > > v4l2_async_notifier_add_fwnode_subdev,
> > > v4l2_async_notifier_add_fwnode_remote_subdev or
> > > v4l2_async_notifier_add_i2c_subdev.  
> > 
> > Actually, all cases outside V4L2 core:
> > 
> > $ git grep v4l2_async_notifier_add_subdev
> > Documentation/driver-api/media/v4l2-subdev.rst:using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
> > drivers/media/v4l2-core/v4l2-async.c:int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> > drivers/media/v4l2-core/v4l2-async.c:EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_subdev);
> > drivers/media/v4l2-core/v4l2-async.c:   ret = v4l2_async_notifier_add_subdev(notifier, asd);
> > drivers/media/v4l2-core/v4l2-async.c:   ret = v4l2_async_notifier_add_subdev(notifier, asd);
> > drivers/media/v4l2-core/v4l2-fwnode.c:  ret = v4l2_async_notifier_add_subdev(notifier, asd);
> > include/media/v4l2-async.h: * before the first call to @v4l2_async_notifier_add_subdev.
> > include/media/v4l2-async.h: * v4l2_async_notifier_add_subdev - Add an async subdev to the
> > include/media/v4l2-async.h:int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> > include/media/v4l2-async.h: * @v4l2_async_notifier_add_subdev,
> > 
> >   
> > > 
> > > We'd like to discourage drivers from using v4l2_async_notifier_add_subdev,
> > > so rename it as __v4l2_async_notifier_add_subdev. This is
> > > typically a good hint for drivers to avoid using the function.  
> > 
> > IMO, the best here would be to create a header file:
> > 
> > 	drivers/media/v4l2-core/v4l2-async-priv.h
> > 
> > and move v4l2_async_notifier_add_subdev from include/media/v4l2-async.h.
> > 
> > This will warrant that only the V4L2 core would have access to it.
> > Also, it is a lot better than adding something like this:  
> 
> It'd be the first header in the directory. I suppose there are other
> functions that could have the prototype there.
> 
> I'll still see if there could be other options for this.
> 
> The topic of split into modules of v4l2-async and v4l2-fwnode was also
> discussed recently, and it's obviously related to this. The two are
> virtually always used together and so would make sense to be in the same
> module. In practice this would mean moving v4l2-async out of videodev2. The
> module wouldn't be large but the vast majority of regular laptop and
> desktop PC users are having this in memory needlessly.

IMO, splitting kAPI headers from v4l-core internal usage is a good
idea for the things that should be used only inside the core.

The RC core has one such header:

	drivers/media/rc/rc-core-priv.h

Several DVB frontend and tuner drivers also have things like that.


> > On a separate but related note, The names of the async notifiers are
> > too big, causing lots of coding style warnings, like:
> > 
> > +       asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> > +               &fmd->subdev_notifier, of_fwnode_handle(ep), sizeof(*asd));
> > ...
> > +                       asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> > +                               &isp->notifier, ep, sizeof(*isd));  
> 
> We started with lots of variants of similar functions over time, so I
> preferred to keep the names descriptive. Now that we've settled to a small
> number of them, it's also worth seeing whether there could be room for
> shorter but still descriptive names without allowing for such variance we
> no longer need.

Yeah, now that there are just 3 variants, those could be renamed to
a shorter yet meaningful names.

> > Ending a line with an open parenthesis is not natural: you won't see
> > any good written English texts (or on any other natural language) that would
> > have a line ending with a '('.  
> 
> This is C, not English, and I'm sure we could have a long debate on the
> topic. :-) But maybe we don't need to.

Yes, but the brains that read C source code are the same that were
trained since childhood to read English (and/or other natural languages).

That's probably why computer languages like MUMPS, where a program would
look like:

	GREPTHIS()
	       N S,N,T,I,K,Q S I="K",S="11",K="l1",Q="R",T="K"
	       I I=T D T
	       Q:$Q Q Q
	T  I I,S&K S S=S+K Q

	f i=0:5:25 w i," "

got deprecated... It is very hard for a human brain to understand
that. It is also a maintenance nightmare, as even the original
programmer will have a bad time to understand what it was written
there.

The main purpose of the coding style is to make the source code to be
easier to be understood.

That's basically why the 80-columns limit is a "soft limit": it is not
the size of a line that makes a program harder to be understood,
but, instead, the excess of loops on it.

> > 
> > While I understand that the name describes precisely what those 
> > functions, such non-intuitive usage of parenthesis makes the line
> > obfuscated, for no good reason.
> > 
> > Also, the entire meaning of the V4L2 async API is to allow subdevs
> > to be registered later. So, IMHO, the namespace for those 3
> > calls could be simplified to:
> > 
> > 	v4l2_async_notifier_add_fwnode(),
> > 	v4l2_async_notifier_add_fwnode_remote()
> > 	v4l2_async_notifier_add_i2c().  
> 
> Yes, I had actually the same in mind. Seems reasonable.

Great!
 
> > Also, we should place at least the first argument afer the
> > parenthesis, even if this would violate the 80 columns
> > coding style rule[1]. 
> > 
> > So, the above examples would be written as:
> > 
> > 
> >         asd = v4l2_async_notifier_add_fwnode_remote(&fmd->subdev_notifier,
> > 						    of_fwnode_handle(ep),
> > 						    sizeof(*asd));
> > 
> > and:
> > 
> >                         asd = v4l2_async_notifier_add_fwnode_remote(&isp->notifier,
> > 								    ep,
> > 								    sizeof(*isd));
> > 
> > Which better matches the Kernel coding style, and it is way easier to
> > review, as the brain will see the parenthesis just like it would on
> > a natural language.
> > 
> > [1] The 80 columns warning is a "soft" coding style violation. It serves
> > as a reference that either the function code is becoming too complex with too
> > many loops, or that the function names are becoming too big. As it produces
> > lots of false positives, and people were breaking strings or finishing
> > lines with open parenthesis, this rule got relaxed, and checkpatch now
> > warns only (by default) if the line has more than 100 columns.  
> 
> The coding style refers to it as the "preferred limit", indeed. But there
> are conditions how exceeding that is allowed.

Yep, but, while not explicitly written there, "preferred" implies that
people should use a good sense on that. See the first paragraph:

	2) Breaking long lines and strings
	----------------------------------

	Coding style is all about readability and maintainability using commonly
	available tools.

	The preferred limit on the length of a single line is 80 columns.

	Statements longer than 80 columns should be broken into sensible chunks,
	unless exceeding 80 columns significantly increases readability and does
	not hide information.

The goal is to improve "readability". When you place a parenthesis on a
non-natural order, you're not improving readability. It's quite 
the opposite.

I've seen enough badly-written source lines on media because in the past,
the 80-columns limits were enforced (and because tools like indent that
were widely used in the past are very bad when applying line size limits).

> Note that aligning the function arguments on the following lines to right
> of the opening parenthesis is also referred to as a "very commonly used
> style", i.e. there is no suggestion it is a requirement. That is certainly
> my preference as well, but I guess it's the priority of these preferences
> that we'd be discussing.

Yeah, this was not enforced for the same reason: sometimes, people ended
doing crazy things like:

	dvb->i2c_client_demod = dvb_module_probe("lgdt3306a", NULL,
						 &dev->
						  i2c_adap[dev->
						           def_i2c_bus],
						 addr, 
						 &lgdt3306a_config);

in order to follow this kind of requirement.

(this is not a real example, but tools like indent used to generate
things like the above)

FYI, the above code, is inside em28xx-dvb.c, as:

	dvb->i2c_client_demod = dvb_module_probe("lgdt3306a", NULL,
						 &dev->i2c_adap[dev->def_i2c_bus],
						 addr, &lgdt3306a_config);


This violates the 80 column soft limit, but its readibility is a way better
than:

	dvb->i2c_client_demod = dvb_module_probe("lgdt3306a", NULL,
					 &dev->i2c_adap[dev->def_i2c_bus],
					 addr, &lgdt3306a_config);


(which would be an alternative that it is less readable than
the current code).

> Let's see how much making the names shorter helps.

I suspect it will solve most issues, if not all.

Thanks,
Mauro
