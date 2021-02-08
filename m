Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64BA313301
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 14:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbhBHNMA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 08:12:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:54382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229993AbhBHNLt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 08:11:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3219764E85;
        Mon,  8 Feb 2021 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612789869;
        bh=DhCfAvO4/Izxym8gYZJsjsSzL8u4lIOArAufKfQ5KWg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=E41nSyaObGZmRvYnJMugLW6g9aKHgkpjh4OmKX5Tx0K/jv8gNoo2b3Zxh8Jv3mOyM
         7uAsI3O7G8jlNfZ24kG1I5EqBjpm3B0TT334Xo0XvdH7nSbR/udPLFI8qlrNVB+xTJ
         Y0J2+aGxOrveBbiu5pWFuwcog8eEgNRfi2/Z7IO7Tr2KwwjOz3LkmrK76F2ANbiqQm
         HzdQiAyWmCKpjyK6tBLA2HnDjsa0rhucinKudTu/B1zhRKDIIQIMeiY0edVcpgiHrb
         /yZifOQa/AP3UKFeRoHGa3LFw2FzfyXimLX4c37V9+XCsijRy61IswXf8LK/CHmffv
         443ZbYvgzYF+g==
Date:   Mon, 8 Feb 2021 14:11:02 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] media: i2c: fix max9271 build dependencies
Message-ID: <20210208141102.3d5999dd@coco.lan>
In-Reply-To: <20210208114142.skwc22xps5xiqdyo@uno.localdomain>
References: <20210208113208.35449879@canb.auug.org.au>
        <20210208065315.1914616-1-mchehab+huawei@kernel.org>
        <20210208072701.GI32460@paasikivi.fi.intel.com>
        <20210208083616.3iulzo56mhn4ymmq@uno.localdomain>
        <20210208084147.GN32460@paasikivi.fi.intel.com>
        <20210208100822.76ca0c2e@coco.lan>
        <20210208092424.GP32460@paasikivi.fi.intel.com>
        <20210208110723.4859ddda@coco.lan>
        <YCEhVrSFpqX1Th4x@pendragon.ideasonboard.com>
        <20210208114142.skwc22xps5xiqdyo@uno.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 8 Feb 2021 12:41:42 +0100
Jacopo Mondi <jacopo@jmondi.org> escreveu:

> > > If you do, instead:
> > >
> > >     if VIDEO_V4L2 && I2C
> > > 	config VIDEO_MAX9271_SERIALIZER
> > > 		tristate
> > >
> > > 	config VIDEO_RDACM20
> > > 		select VIDEO_MAX9271_SERIALIZER
> > > 		...
> > >
> > > 	config VIDEO_RDACM21
> > > 		select VIDEO_MAX9271_SERIALIZER
> > > 		...
> > >     endif
> > >
> > > Then you also won't need:
> > > 	depends on VIDEO_MAX9271_SERIALIZER || !VIDEO_MAX9271_SERIALIZER
> > >
> > > As select should do the right thing in this case, ensuring that MAX9271
> > > will be builtin either if RDACM20 or RDACM21 is builtin.  
> >
> > I also vote for usage of "select".
> >  
> 
> I would prefer that too, I was concerned about possible un-met
> dependencies, as Sakari pointed out, but the current situation is no
> better, as the only Kconfig symbols where those can be listed are the
> camera modules one.

Works for me. I'll make a patch for it.

Thanks,
Mauro
