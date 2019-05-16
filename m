Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33A63204C6
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 13:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbfEPLcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 07:32:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34052 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfEPLcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 07:32:48 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C37262FD;
        Thu, 16 May 2019 13:32:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558006365;
        bh=kmLdLJMgQrKk27vWP7Mh08EHrE97wUo6m4autq/HMqc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=decNP9OVqo2WGdg/RNa4R1r82EnthD4QeKmOgC+koow1jahcmVMtaDvQz7dAdDOQy
         6rHI5fsrHKgQB5d34zQeKeZzTnIeV4NLi7x5dk3/kqcX6yxEQ1J7z5/hDBg9GmVTpB
         +AhEeEgn1Kj8CYEUFkmz0K8be+q0O7zitAUmao10=
Date:   Thu, 16 May 2019 14:32:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ulrich Hecht <uli@fpond.eu>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2 1/8] rcar-vin: Do not call
 pm_runtime_{resume,suspend}()
Message-ID: <20190516113229.GA15125@pendragon.ideasonboard.com>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516011417.10590-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWqw-PAUbm9WLJwYecrQxoJ-vN6iOHEL7Jwx_H9d_LdBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWqw-PAUbm9WLJwYecrQxoJ-vN6iOHEL7Jwx_H9d_LdBg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 16, 2019 at 09:23:41AM +0200, Geert Uytterhoeven wrote:
> On Thu, May 16, 2019 at 3:46 AM Niklas Söderlund wrote:
> > The driver does not implement runtime resume and suspend function so
> > there is little point in trying to call them. This is a leftover from
> > the drivers soc_camera beginnings.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > index 7cbdcbf9b090c638..b821ea01786eb1ff 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -798,9 +798,6 @@ static int rvin_initialize_device(struct file *file)
> >                 return ret;
> >
> >         pm_runtime_enable(&vin->vdev.dev);
> > -       ret = pm_runtime_resume(&vin->vdev.dev);
> 
> Please pardon my ignorance, but which device is vin->vdev.dev?

This is the V4L2 video node class device, we shouldn't call any runtime
PM function with this. I assume the current code works because the class
device is a child of the physical device.

> Who calls pm_runtime_get_sync() on it, and where?
> 
> I see this function calls rvin_power_on(vin->v4l2_dev.dev) (before the
> call to pm_runtime_enable()), but presumably that's a different device?

That one is the physical platform device.

-- 
Regards,

Laurent Pinchart
