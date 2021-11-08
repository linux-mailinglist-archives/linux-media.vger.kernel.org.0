Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13DE0447E2D
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 11:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237660AbhKHKoa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 05:44:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:58588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233956AbhKHKoa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 05:44:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92BD161360;
        Mon,  8 Nov 2021 10:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636368105;
        bh=HmX7Iu230vaqFLoWNOfpIDZEQ/e7d6sGmYSkqSPi38A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ta8iXpjgABI78bfr7rCNWvbrUeM8XvPZ3VtSlngMXNlLva6sZAgSHODXcDtuoCWTg
         F37RrZ42cpAJWSJPR9OIFuwugHDWdFDy5MUgDXpRsiaX/7al2tgJlO+Zr+du2u4tV3
         42T9a4g+S69bvsWaUh8kDOMkF3tb5/2nS1pBCBxJLg7IEkvnvPc5/i9SyNwlRPKyPx
         uBOEKZKNzFv8RYd5FYSyzvyY+86luQJBJ6cDPndtFdj14b79TrTYNRvliI4lqczUYW
         RblkNki2L53Q1WOj09QXJ7+NkPu0ExCDMDThvs/wbGnBX8h1Ajl4QEeNemBHudfqqL
         eMbCHp5ZRj9qw==
Date:   Mon, 8 Nov 2021 10:41:39 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Alan <alan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: allocate a v4l2_fh at open time
Message-ID: <20211108104139.18ee4023@sal.lan>
In-Reply-To: <20211108100902.GE2001@kadam>
References: <7a59d8613331d242624e887d9089ded399015a97.1636105894.git.mchehab+huawei@kernel.org>
        <20211108100902.GE2001@kadam>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 8 Nov 2021 13:09:02 +0300
Dan Carpenter <dan.carpenter@oracle.com> escreveu:

> On Fri, Nov 05, 2021 at 09:51:38AM +0000, Mauro Carvalho Chehab wrote:
> > ---
> >  drivers/staging/media/atomisp/pci/atomisp_fops.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> > index 7df982c80b1a..41fa0ca2d8d4 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> > @@ -782,6 +782,15 @@ static int atomisp_open(struct file *file)
> >  	 * FIXME: revisit this with a better check once the code structure
> >  	 * is cleaned up a bit more
> >  	 */
> > +dev_info(isp->dev, "opening v4l2 fh\n");  
> 
> This line looks like debugging code that was committed accidentally?
> Not indented.

Yep.

> Doesn't apply for on latest linux-next.  Not sure why.

Yeah, I dropped it when I applied the patch on media_stage.

I should have sent v2 without that line.

> 
> regards,
> dan carpenter
> 
> > +	ret = v4l2_fh_open(file);
> > +	if (ret) {
> > +		dev_err(isp->dev,
> > +			"%s: v4l2_fh_open() returned error %d\n",
> > +		       __func__, ret);
> > +		rt_mutex_unlock(&isp->loading);
> > +		return ret;
> > +	}  
> 
