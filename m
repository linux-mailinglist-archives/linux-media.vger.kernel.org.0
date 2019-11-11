Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB6BF78C6
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 17:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfKKQ3K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 11:29:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:49282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbfKKQ3K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 11:29:10 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59CAE20656;
        Mon, 11 Nov 2019 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573489749;
        bh=k0yKxYG7YYQn6/z4LuiNzgCLnQUCfr6MpxgggPEt1j4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CnEnZ7YTDtXFLQ0tNgqHC6wLHoOi4pfKQQ1yBRqnDAfrigKMB7Hu+GSrH0+jSPyOG
         HMyk9kdswqJj9Jb5HExtNTk2tZ7Cc4yvTMYb/ktF+8C4lnJeQKv4B52SD3ajruSRH0
         Yp7na36mAs/WHjy3YpN2b65xiaPtpJWFMYeWKmno=
Date:   Mon, 11 Nov 2019 17:29:07 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Omer Shalev <omerdeshalev@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media:usb:cpia2: Properly check framebuffer mmap offsets
Message-ID: <20191111162907.GA1017642@kroah.com>
References: <20191108215038.59170-1-omerdeshalev@gmail.com>
 <20191108204949.GA1277001@kroah.com>
 <a1c55e7d-4710-70e9-f4d0-8fc155197f07@xs4all.nl>
 <20191111114615.GA418224@kroah.com>
 <20191111182409.GA20121@arch-vook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111182409.GA20121@arch-vook>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 11, 2019 at 06:24:42PM +0000, Omer Shalev wrote:
> On Mon, Nov 11, 2019 at 12:46:15PM +0100, Greg Kroah-Hartman wrote:
> > On Sat, Nov 09, 2019 at 12:39:43PM +0100, Hans Verkuil wrote:
> > > Hi Greg,
> > > 
> > > On 11/8/19 9:49 PM, Greg Kroah-Hartman wrote:
> > > > On Fri, Nov 08, 2019 at 09:50:36PM +0000, Omer Shalev wrote:
> > > >> The cpai2 driver's mmap implementation wasn't properly check for all
> > > >> possible offset values. Given a huge offset value , the calculation
> > > >> start_offset + size can wrap around to a low value and pass the check
> > > > 
> > > > I thought we checked that in the core of the kernel now, to keep all
> > > > drivers from not having to do this type of thing (as they obviously all
> > > > forgot to.)  Why is this still needed here as well?
> > > 
> > > Where is that checked in the core? I couldn't find anything, but I might
> > > have been looking in the wrong place.
> > 
> > Sorry, took me a while to find it.  Look at be83bbf80682 ("mmap:
> > introduce sane default mmap limits") as I think this should handle the
> > problem already.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Thanks Greg. But All other drivers I've seen implement it like that: if(size > total_size || offset >
> total_size - size). Which I think, is a better way to write this code, and generally more
> secure. Plus, no extra code is needed (just changing this line).

The point of the above commit that is in the tree is that no driver has
to do this check at all, it's already been done before the driver ever
gets called, right?

So yes, there's lots of history of drivers doing the check themselves
(and getting it wrong as you point out), but that should not matter
anymore.

Can you verify that your change isn't even needed due to the above
mentioned core check for valid values?

thanks,

greg k-h
