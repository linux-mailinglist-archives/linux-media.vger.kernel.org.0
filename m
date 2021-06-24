Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2A93B2DE6
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 13:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbhFXLfD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 07:35:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:40260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232274AbhFXLfC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 07:35:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B94A6611AC;
        Thu, 24 Jun 2021 11:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624534363;
        bh=Y+Vf4VwRcwhSeuhX9p+YbNjJ8eKw5Zw6LgeNCgP26Dk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=e8JLhPlNi/B0OhSjGcmDPbLsgG2UVYFi1piUidCT+0atJw/5LMGPUThvl92IT4iaJ
         7SxgeeUO59vbphFzXcH1+SbM6wG5D+wD+MYaekfGJuqsx7Ivxq13Yl6MKbQ0Xe6+pw
         bkYK8byY+/Z0IRmBzSmBFiKVEBGNJTziKsHnzQ7vImIpsGWs07EFEr+82yvZqWnYjO
         w+GFROs0nHNqbONOjn2CQXCqUP139mSw8gGfCWQ+NrRm3aaD61VpDVb7SWepgoqasF
         Vo1QTZZsUa9LmY7rAzZ+I+brZoOmaC+keFKd6CK5HSbo5j8rlv/BcZ9DjEEASzvNko
         po8GdYccGVVzg==
Date:   Thu, 24 Jun 2021 13:32:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] media: v4l2-flash-led-class: drop an useless check
Message-ID: <20210624133238.006c7b64@coco.lan>
In-Reply-To: <20210624101443.GK3@valkosipuli.retiisi.eu>
References: <cover.1624276137.git.mchehab+huawei@kernel.org>
        <e1629ac223470630eed4096361965d154aff70b7.1624276138.git.mchehab+huawei@kernel.org>
        <20210624093153.GJ3@valkosipuli.retiisi.eu>
        <20210624115925.357f98b6@coco.lan>
        <20210624101443.GK3@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 24 Jun 2021 13:14:43 +0300
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
> 
> On Thu, Jun 24, 2021 at 11:59:25AM +0200, Mauro Carvalho Chehab wrote:
> > Em Thu, 24 Jun 2021 12:31:53 +0300
> > Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> >   
> > > Hi Mauro,
> > > 
> > > Could you check if your mail client could be configured not to add junk to
> > > To: field? It often leads anything in the Cc: field being dropped.  
> > 
> > I have no idea why it is doing that. I'm just using git send-email
> > here. Perhaps a git bug?
> > 
> > 	$ git --version
> > 	git version 2.31.1
> > 
> > The setup is like this one:
> > 
> > 	[sendemail]
> > 	        confirm = always
> > 	        multiedit = true
> > 	        chainreplyto = false
> > 	        aliasesfile = /home/mchehab/.addressbook
> > 	        aliasfiletype = pine
> > 	        assume8bitencoding = UTF-8  
> 
> I tried sending a message to myself using git send-email with an empty To:
> field and it came through just fine, with To: field remaining empty. I
> wonder if it could be the list server?

It seems so.

> > So, this is not a false-positive, but, instead, a real issue.
> > 
> > So, if led_cdev/fled_cdev can indeed be NULL, IMO, the right solution would be
> > to explicitly check it, and return an error, e. g.:
> > 
> > 	static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
> > 	{
> >         	struct v4l2_flash *v4l2_flash = v4l2_ctrl_to_v4l2_flash(c);
> >         	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> > 		struct led_classdev *led_cdev;
> >         	struct v4l2_ctrl **ctrls = v4l2_flash->ctrls;
> >         	bool external_strobe;
> >         	int ret = 0;
> > 
> > 		if (!fled_cdev)
> > 			return -EINVAL;  
> 
> The approach is correct, but as noted, the check needs to be done later.

> I checked that the same pattern is used throughout much of the file. I
> suppose if smatch isn't happy with this instance, it may not be happy with
> the rest either. Admittedly, the pattern isn't entirely trouble-free, as it
> requires the parts of the file to be in sync.
>
> Addressing this takes probably a few patches at least.

See, the main issue is not the smatch report, but the point that, on
some cases, it will de-reference a NULL pointer.

And yeah, the same pattern is everywhere within the core.

IMO, the right fix would be to ensure that fled_cdev will always
be not NULL, but if there are good reasons why this can't happen,
extra checks are needed along the core (or at leds core), in order
to prevent de-referencing NULL pointers.

> 
> Could you drop this patch, please?

Just dropped from media_stage. It didn't reach media_tree.

> > > Please also cc me to V4L2 flash class patches. I noticed this one by
> > > accident only.  
> > 
> > Better to add you as a reviewer at the MAINTAINERS file, to
> > ensure that you'll always be c/c on such code.  
> 
> There's no separate entry for flash class, just like the rest of the V4L2
> core. I think it could be worth addressing this for all the bits in V4L2
> core, but that's separate from this issue in any case.

It makes sense to add entries at MAINTAINERS, but yeah, this
is OOT here.

Thanks,
Mauro
