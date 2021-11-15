Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46C48450592
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 14:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbhKONiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 08:38:05 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43128 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231977AbhKONhO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 08:37:14 -0500
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D054FEA;
        Mon, 15 Nov 2021 14:34:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636983258;
        bh=LBf8ZstxekDRRxDir9wR5xHoYMboVaCYI8JVbMOmuEY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FRAezB8LQKHyH7Y+SB6X6Y7J+WHLfbGSLDlbSKGoInORANb6iSfQuXI47yd3xbPcq
         yE9V5QAJvGPpmOQJ4fAbF5gvaIA6/qDMN+mWmprSH7OytwX/0J50+HccEmzYTRxtfG
         c4Ww8VpVndE4tBkg703453PjofiSe+KUW5oUJ6C8=
Date:   Mon, 15 Nov 2021 15:33:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Message-ID: <YZJhxJ+z4Zvg8ewP@pendragon.ideasonboard.com>
References: <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
 <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
 <CAPY8ntBZpZjecHNCMf-eMefcp2EgmbqkXMt4p=UeOe0n-o8WrA@mail.gmail.com>
 <6e832988-4810-fe59-7357-886b286697a0@redhat.com>
 <CAPY8ntB3pT4EqornywTtqcn4_iD-QUHPkApq=nb3XCc+6CuepA@mail.gmail.com>
 <YY2Ta34aTqFKPYnS@pendragon.ideasonboard.com>
 <CAPY8ntABHNcgO4iVOryYZsdePVvjTiddZJCBah60LuzSXkL3PA@mail.gmail.com>
 <YY5GIFudxS81q/Qp@pendragon.ideasonboard.com>
 <YY5R99cHfxZe5M0M@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YY5R99cHfxZe5M0M@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 12, 2021 at 01:37:27PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 12, 2021 at 12:46:56PM +0200, Laurent Pinchart wrote:
> > On Fri, Nov 12, 2021 at 10:32:31AM +0000, Dave Stevenson wrote:
> > > On Thu, 11 Nov 2021 at 22:04, Laurent Pinchart wrote:
> 
> > > Sorry, just my two-penneth as someone who has to support general
> > > users, rather than just develop platforms or address specific use
> > > cases.
> > 
> > As mentioned above, I certainly don't oppose improving power management
> > for VCMs, as well as the VCM control API in general, as long as we can
> > cover all use cases. I'm not familiar enough with the use cases to tell
> > whether making the kernel side more "clever" would be just fine or could
> > cause issues.
> 
> Personally I found the
> 
>   kernel <--> library in userspace <--> another library or app
> 
> schema is more flexible in many ways:
>  - we unburden kernel from the heavy code that has nothing to
>    do directly with HW
>  - we allow nevertheless to use kernel ABIs if needed
>  - we decrease burden of the ABI evolution by doing it in only
>    two places

I think that's generally true (provided the low-level userspace library
is well designed). In this specific case, we're moving towards that
model, and even if it ends up being better, I agree with Dave that the
transition can be painful.

> After all this kind of schema might lead us at some point to the
> shifting of 'we don't break user space' paradigm to the 'we hardly
> try not to break user space and do not break library ABIs / APIs
> in user space'.

Is that an officially allowed policy for kernel subsystems ?

-- 
Regards,

Laurent Pinchart
