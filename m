Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16B03BBA1E
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 19:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbfIWREW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 13:04:22 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41760 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbfIWREW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 13:04:22 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NH3nAa118445;
        Mon, 23 Sep 2019 12:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569258229;
        bh=Gq5Vo3S9H8X/qOV/SVOG/Ag1IkhnyH+qcHVEISUte9U=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=qqMzPAz8+o0U+hXkti/96TavrE19rs9R5Tf5pHRGSHq7Y9PN+bI+0Rqy7goYSUINZ
         9cYIuMxK5N3ZtSRDc+/Nko6mu82/i62TG5t/u5RV54UO2OIz99McISPJiFQhmxyt95
         fDVwriwz3THL+dRMSu0qeJpe4rRHr1xwLasE4AuE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8NH3mJP045595
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 23 Sep 2019 12:03:49 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Sep 2019 12:03:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 23 Sep 2019 12:03:48 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id x8NH3m5k092029;
        Mon, 23 Sep 2019 12:03:48 -0500
Date:   Mon, 23 Sep 2019 12:05:57 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v2 5/7] media: i2c: ov2659: Add powerdown/reset gpio
 handling
Message-ID: <20190923170557.mggr5gcov43pcmfs@ti.com>
References: <20190919203955.15125-1-bparrot@ti.com>
 <20190919203955.15125-6-bparrot@ti.com>
 <20190920101706.GX5781@paasikivi.fi.intel.com>
 <20190920165529.it7urirm6epg4woq@ti.com>
 <20190923061731.GZ5781@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190923061731.GZ5781@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Mon [2019-Sep-23 09:17:32 +0300]:
> Hi Benoit,
> 
> On Fri, Sep 20, 2019 at 11:55:29AM -0500, Benoit Parrot wrote:
> ...
> > > > @@ -1400,6 +1440,18 @@ static int ov2659_probe(struct i2c_client *client)
> > > >  	    ov2659->xvclk_frequency > 27000000)
> > > >  		return -EINVAL;
> > > >  
> > > > +	/* Optional gpio don't fail if not present */
> > > > +	ov2659->pwdn_gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
> > > > +						    GPIOD_OUT_LOW);
> > > > +	if (IS_ERR(ov2659->pwdn_gpio))
> > > > +		return PTR_ERR(ov2659->pwdn_gpio);
> > > > +
> > > > +	/* Optional gpio don't fail if not present */
> > > > +	ov2659->resetb_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> > > > +						      GPIOD_OUT_HIGH);
> > > > +	if (IS_ERR(ov2659->resetb_gpio))
> > > > +		return PTR_ERR(ov2659->resetb_gpio);
> > > > +
> > > >  	v4l2_ctrl_handler_init(&ov2659->ctrls, 2);
> > > >  	ov2659->link_frequency =
> > > >  			v4l2_ctrl_new_std(&ov2659->ctrls, &ov2659_ctrl_ops,
> > > > @@ -1445,6 +1497,9 @@ static int ov2659_probe(struct i2c_client *client)
> > > >  	ov2659->frame_size = &ov2659_framesizes[2];
> > > >  	ov2659->format_ctrl_regs = ov2659_formats[0].format_ctrl_regs;
> > > >  
> > > > +	pm_runtime_enable(&client->dev);
> > > > +	pm_runtime_get_sync(&client->dev);
> > > 
> > > This makes the driver depend on runtime PM.
> > 
> > Obviously.
> > Why? Is that bad?
> 
> Well, if it is, then it should be listed in driver's dependencies in
> Kconfig.

And I see that most camera driver using pm_runtime calls don't mark it as a
dependency in their own Kconfig. There is actually only one that does.

> 
> > 
> > > 
> > > See e.g. the smiapp driver for an example how to make it work without. It
> > > wasn't trivial. :I You won't need autosuspend.
> > 
> > I took a look at that driver, but I don't get your reference to being able
> > to work without runtime pm!
> 
> The driver didn't need runtime PM, so it'd be nice to continue work
> without.

Ok.

> 
> What smiapp does is that it powers the sensor on first *without* runtime
> PM, and then proceeds to set up runtime PM if it's available. The sensor
> will only be powered off when the device is unbound with runtime PM
> disabled.

In that case in your original reply you suggested that I move the content
of ov2659_set_power() into the pm_runtime callback, but based on this
comments then I should keep ov2659_set_power() as is as I  would need to
use it for this specific purpose.

> 
> Regarding the smiapp driver, you can replace pm_runtime_get_noresume() and
> all the autoidle lines with pm_runtime_idle() call after
> pm_runtime_enable() in the ov2659 driver.

Ok, I'll study this mechanics a little more, as this is not immediately
clear.

Benoit

> 
> > That driver looks pretty similar to ov7740.c which I used as a reference
> > for this.
> 
> I guess in practice many sensor drivers don't work without it on DT-based
> systems I'm afraid. :-( They should be fixed.
> 
> -- 
> Kind regards,
> 
> Sakari Ailus
> sakari.ailus@linux.intel.com
