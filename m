Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28C16C9E0C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728915AbfJCMG4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:06:56 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54680 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbfJCMG4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 08:06:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x93C6pXX012402;
        Thu, 3 Oct 2019 07:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570104411;
        bh=fIgeJdEZxeUHDYtIIEIg9Wo4Rny89F3Ow23zWdC1F0A=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=RTG4/tZ7CqcXeaBvlrenopT0+I30vfNXrumomGwdsUPczLjuRRVeuAp4ni5QRbd4T
         rcbeYrvyOPcSK7gUS77lryPhzY/aAAVVkOkQVznGqWJvHED/Gn2m1LkvB4aQssX+PB
         n6MR8WKARX1f2+JIZK0tR4zrXYh4Hlnw6iV646F8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x93C6pNu107500
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Oct 2019 07:06:51 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 07:06:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 07:06:50 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x93C6oR5005970;
        Thu, 3 Oct 2019 07:06:50 -0500
Date:   Thu, 3 Oct 2019 07:09:02 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v2 3/3] media: ov5640: Make 2592x1944 mode only available
 at 15 fps
Message-ID: <20191003120902.wd3w2qmiry5bpa4h@ti.com>
References: <20191002135134.12273-1-bparrot@ti.com>
 <20191002135134.12273-4-bparrot@ti.com>
 <20191003073155.4sl3jkmobnm53tm2@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191003073155.4sl3jkmobnm53tm2@uno.localdomain>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jacopo Mondi <jacopo@jmondi.org> wrote on Thu [2019-Oct-03 09:31:55 +0200]:
> Hi Benoit,
> 
> On Wed, Oct 02, 2019 at 08:51:34AM -0500, Benoit Parrot wrote:
> > The sensor data sheet clearly state that 2592x1944 only works at 15 fps
> > make sure we don't try to miss configure the pll out of acceptable
> > range.
> 
> The datasheet clearly indicates that 15 fps is the maximum achievable
> rate with that resolution, so I guess preventing it from being set
> to anything faster than that it's acceptable.
> >
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 103a4e8f88e1..d5b0be2c7a0a 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -1613,6 +1613,11 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
> >  	    !(mode->hact == 640 && mode->vact == 480))
> >  		return NULL;
> >
> > +	/* 2592x1944 only works at 15fps */
> > +	if (fr != OV5640_15_FPS &&
> 
> As long as 15 fps is the lower framerate declared in
> ov5640_framerates[] this is ok, but I would make this condition a
> check for "fr  > OV5640_15_FPS" so that it's safe for future
> extensions.
> 
> (And I would check for the resolution first then FPS, so you check
> the most unlikely condition first, but that's really a minor
> optimization).

Ah, very good I'll change that.

Benoit

> 
> With the above small details addressed
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Thanks
>    j
> 
> > +	    (mode->hact == 2592 && mode->vact == 1944))
> > +		return NULL;
> > +
> >  	return mode;
> >  }
> >
> > --
> > 2.17.1
> >


