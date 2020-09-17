Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C69226DBB8
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 14:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgIQMjG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 08:39:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47880 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgIQMie (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 08:38:34 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C181F2DB;
        Thu, 17 Sep 2020 14:38:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600346306;
        bh=s9KoUx1z44jLuwvlrdTyTpwp14U8lri6GxDBZu338BM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sZq8B/Xudj93Nt9/BGIHl6RtqbYqRrhrA+muJ3CsgZQcJBK2FFw5A/Q5QWM+Vcr0U
         k/DCkNeLOA43CiHeN/M6umskEigyfpx4dvH0hneZKKkj1ZUXnjZley8RzRAKhe4H9f
         YM62ecKT5FY1qnNcc06Qq6uZNUboTPagxM/gv5MU=
Date:   Thu, 17 Sep 2020 15:37:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] media: usb: uvc: no need to check return value of
 debugfs_create functions
Message-ID: <20200917123757.GC3969@pendragon.ideasonboard.com>
References: <20200818133608.462514-1-gregkh@linuxfoundation.org>
 <20200818133608.462514-7-gregkh@linuxfoundation.org>
 <20200818234719.GD2360@pendragon.ideasonboard.com>
 <20200917122550.GA5053@pendragon.ideasonboard.com>
 <20200917123426.GA3595353@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200917123426.GA3595353@kroah.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,

On Thu, Sep 17, 2020 at 02:34:26PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Sep 17, 2020 at 03:25:50PM +0300, Laurent Pinchart wrote:
> > On Wed, Aug 19, 2020 at 02:47:19AM +0300, Laurent Pinchart wrote:
> > > On Tue, Aug 18, 2020 at 03:36:08PM +0200, Greg Kroah-Hartman wrote:
> > > > When calling debugfs functions, there is no need to ever check the
> > > > return value.  The function can work or not, but the code logic should
> > > > never do something different based on this.
> > > 
> > > Is there no value in warning the user that something went wrong ? Silent
> > > failures are harder to debug.
> > 
> > Could yous share your opinion about this ?
> 
> For debugfs, this isn't an issue, what can a user do with something like
> "debugfs isn't working?  What does that mean???"
> 
> And if we _really_ want warnings like this, it should go into the
> debugfs core, not require this to be done for every debugfs user, right?
> 
> debugfs is just there for kernel developers to help debug things, it's
> not a dependancy on any userspace functionality, so if it works or not
> should not be an issue for any user.
> 
> Unless that user is a kernel developer of course :)

Exactly my point :-)

I'm fine moving the error message to the debugfs core itself instead of
duplicating it in drivers. Maybe it's already there though, I haven't
checked. Not printing any message isn't a great idea in my opinion, it
makes debugging more difficult. I can't count the number of times where
I've had to add printk's and recompile the kernel to debug issues that
really should have generated at least a dev_dbg().

-- 
Regards,

Laurent Pinchart
