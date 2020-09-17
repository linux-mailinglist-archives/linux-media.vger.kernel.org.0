Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7F126DBE8
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 14:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgIQMp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 08:45:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:54976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726959AbgIQMpn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 08:45:43 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 324E72087D;
        Thu, 17 Sep 2020 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600346728;
        bh=yLl/pMSyF/PtsAZYxQBjwirWi3CZMLMrbkZYBbZEXIs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=18+JUFclrWM6M198v1BOohp3QPPF9Vw4hmsECSXYFb0pvE43sYYUP39+ABSJ6Z4VN
         L3nclMUYyjWWoC9DC3NhjYQvvBMEDb2RN8eSnyx8YkPmuAvofNJ0SF8fg37nStTdZY
         51dm4fDtVV4XT1P7WOMYbDrn4re6yI13vazrjNgw=
Date:   Thu, 17 Sep 2020 14:46:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] media: usb: uvc: no need to check return value of
 debugfs_create functions
Message-ID: <20200917124600.GA3598432@kroah.com>
References: <20200818133608.462514-1-gregkh@linuxfoundation.org>
 <20200818133608.462514-7-gregkh@linuxfoundation.org>
 <20200818234719.GD2360@pendragon.ideasonboard.com>
 <20200917122550.GA5053@pendragon.ideasonboard.com>
 <20200917123426.GA3595353@kroah.com>
 <20200917123757.GC3969@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917123757.GC3969@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 03:37:57PM +0300, Laurent Pinchart wrote:
> Hi Greg,
> 
> On Thu, Sep 17, 2020 at 02:34:26PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Sep 17, 2020 at 03:25:50PM +0300, Laurent Pinchart wrote:
> > > On Wed, Aug 19, 2020 at 02:47:19AM +0300, Laurent Pinchart wrote:
> > > > On Tue, Aug 18, 2020 at 03:36:08PM +0200, Greg Kroah-Hartman wrote:
> > > > > When calling debugfs functions, there is no need to ever check the
> > > > > return value.  The function can work or not, but the code logic should
> > > > > never do something different based on this.
> > > > 
> > > > Is there no value in warning the user that something went wrong ? Silent
> > > > failures are harder to debug.
> > > 
> > > Could yous share your opinion about this ?
> > 
> > For debugfs, this isn't an issue, what can a user do with something like
> > "debugfs isn't working?  What does that mean???"
> > 
> > And if we _really_ want warnings like this, it should go into the
> > debugfs core, not require this to be done for every debugfs user, right?
> > 
> > debugfs is just there for kernel developers to help debug things, it's
> > not a dependancy on any userspace functionality, so if it works or not
> > should not be an issue for any user.
> > 
> > Unless that user is a kernel developer of course :)
> 
> Exactly my point :-)
> 
> I'm fine moving the error message to the debugfs core itself instead of
> duplicating it in drivers. Maybe it's already there though, I haven't
> checked. Not printing any message isn't a great idea in my opinion, it
> makes debugging more difficult. I can't count the number of times where
> I've had to add printk's and recompile the kernel to debug issues that
> really should have generated at least a dev_dbg().

There are a lot of error messages that debugfs will print out if it can
not create a file:

inode.c 329 pr_err("Unable to pin filesystem for file '%s'\n", name);
inode.c 348 pr_err("Directory '%s' with parent '%s' already present!\n",
inode.c 351 pr_err("File '%s' in directory '%s' already present!\n",
inode.c 402 pr_err("out of free dentries, can not create file '%s'\n",
inode.c 563 pr_err("out of free dentries, can not create directory '%s'\n",
inode.c 610 pr_err("out of free dentries, can not create automount '%s'\n",
inode.c 668 pr_err("out of free dentries, can not create symlink '%s'\n",

So I think you are safe here.  If we are missing any, I'll gladly add
them.

Also given that you've never noticed this being a real error, means it's
probably not an issue :)

thanks,

greg k-h
