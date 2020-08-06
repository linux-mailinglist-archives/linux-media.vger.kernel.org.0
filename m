Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B436C23E3E5
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 00:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgHFWPk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 18:15:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:47512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728986AbgHFWPk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Aug 2020 18:15:40 -0400
Received: from localhost (130.sub-72-107-113.myvzw.com [72.107.113.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6FA49221E2;
        Thu,  6 Aug 2020 22:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596752139;
        bh=6V+A6F9WaUs3FGFH0cDcq6c0VYlcrNfuScxXobnpo3k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=fhmU7icYI+Tc7SdZpy0wowfM7RZbgqmTi3wJpP/mfqdrweNF2ylB0kgeJmvGZP+SC
         r6T8pC2+JbWbuIfXwHpyb7GEcnAV5L7TkPgsr2rCnf03hFchFiYc9G78EvO+K8Lugb
         sQim6ONph1cpwxAKr9aO6oLqE148o0w5L0GKqqtg=
Date:   Thu, 6 Aug 2020 17:15:37 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Cengiz Can <cengiz@kernel.wtf>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] staging: atomisp: move null check to earlier point
Message-ID: <20200806221537.GA703560@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730084545.GB1793@kadam>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 30, 2020 at 11:45:45AM +0300, Dan Carpenter wrote:
> On Wed, Jul 29, 2020 at 06:13:44PM +0300, Andy Shevchenko wrote:
> > On Wed, Jul 29, 2020 at 5:00 PM Cengiz Can <cengiz@kernel.wtf> wrote:
> > >
> > > `find_gmin_subdev` function that returns a pointer to `struct
> > > gmin_subdev` can return NULL.
> > >
> > > In `gmin_v2p8_ctrl` there's a call to this function but the possibility
> > > of a NULL was not checked before its being dereferenced. ie:
> > >
> > > ```
> > > /* Acquired here --------v */
> > > struct gmin_subdev *gs = find_gmin_subdev(subdev);
> > > int ret;
> > > int value;
> > >
> > > /*  v------Dereferenced here */
> > > if (gs->v2p8_gpio >= 0) {
> > >         pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n",
> > >                 gs->v2p8_gpio);
> > >         ret = gpio_request(gs->v2p8_gpio, "camera_v2p8");
> > >         if (!ret)
> > >                 ret = gpio_direction_output(gs->v2p8_gpio, 0);
> > >         if (ret)
> > >                 pr_err("V2P8 GPIO initialization failed\n");
> > > }
> > > ```
> > >
> > > I have moved the NULL check before deref point.
> > 
> > "Move the NULL check..."
> > See Submitting Patches documentation how to avoid "This patch", "I", "we", etc.
> 
> I always feel like this is a pointless requirement.  We're turning
> into bureaucrats.

There is a danger of that, and I'm more guilty than most.  But I do
think there's value in consistent style because it allows readers to
focus on the content instead of being distracted by different margins,
grammar ("move vs. moved"), paragraph styles, quoting conventions,
etc.

Ideally we would scan previous commit logs (and the existing code!)
and make new changes fit seamlessly so it looks like everything was
done at the same time by the same person.

But often that doesn't happen.  Sometimes I take the liberty to tweak
things as I apply them to try to avoid trivial rework.

Bjorn
