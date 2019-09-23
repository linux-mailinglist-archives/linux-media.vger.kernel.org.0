Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE9ADBBA27
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 19:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732836AbfIWRHb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 13:07:31 -0400
Received: from mga14.intel.com ([192.55.52.115]:35720 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730985AbfIWRHb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 13:07:31 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 10:07:29 -0700
X-IronPort-AV: E=Sophos;i="5.64,541,1559545200"; 
   d="scan'208";a="200604852"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 10:07:28 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id DA0B520C9F; Mon, 23 Sep 2019 20:07:25 +0300 (EEST)
Date:   Mon, 23 Sep 2019 20:07:25 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch v2 5/7] media: i2c: ov2659: Add powerdown/reset gpio
 handling
Message-ID: <20190923170725.GE9467@paasikivi.fi.intel.com>
References: <20190919203955.15125-1-bparrot@ti.com>
 <20190919203955.15125-6-bparrot@ti.com>
 <20190920101706.GX5781@paasikivi.fi.intel.com>
 <20190920165529.it7urirm6epg4woq@ti.com>
 <20190923061731.GZ5781@paasikivi.fi.intel.com>
 <20190923170557.mggr5gcov43pcmfs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923170557.mggr5gcov43pcmfs@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 23, 2019 at 12:05:57PM -0500, Benoit Parrot wrote:
> Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Mon [2019-Sep-23 09:17:32 +0300]:
> > Hi Benoit,
> > 
> > On Fri, Sep 20, 2019 at 11:55:29AM -0500, Benoit Parrot wrote:
> > ...
> > > > > @@ -1400,6 +1440,18 @@ static int ov2659_probe(struct i2c_client *client)
> > > > >  	    ov2659->xvclk_frequency > 27000000)
> > > > >  		return -EINVAL;
> > > > >  
> > > > > +	/* Optional gpio don't fail if not present */
> > > > > +	ov2659->pwdn_gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
> > > > > +						    GPIOD_OUT_LOW);
> > > > > +	if (IS_ERR(ov2659->pwdn_gpio))
> > > > > +		return PTR_ERR(ov2659->pwdn_gpio);
> > > > > +
> > > > > +	/* Optional gpio don't fail if not present */
> > > > > +	ov2659->resetb_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> > > > > +						      GPIOD_OUT_HIGH);
> > > > > +	if (IS_ERR(ov2659->resetb_gpio))
> > > > > +		return PTR_ERR(ov2659->resetb_gpio);
> > > > > +
> > > > >  	v4l2_ctrl_handler_init(&ov2659->ctrls, 2);
> > > > >  	ov2659->link_frequency =
> > > > >  			v4l2_ctrl_new_std(&ov2659->ctrls, &ov2659_ctrl_ops,
> > > > > @@ -1445,6 +1497,9 @@ static int ov2659_probe(struct i2c_client *client)
> > > > >  	ov2659->frame_size = &ov2659_framesizes[2];
> > > > >  	ov2659->format_ctrl_regs = ov2659_formats[0].format_ctrl_regs;
> > > > >  
> > > > > +	pm_runtime_enable(&client->dev);
> > > > > +	pm_runtime_get_sync(&client->dev);
> > > > 
> > > > This makes the driver depend on runtime PM.
> > > 
> > > Obviously.
> > > Why? Is that bad?
> > 
> > Well, if it is, then it should be listed in driver's dependencies in
> > Kconfig.
> 
> And I see that most camera driver using pm_runtime calls don't mark it as a
> dependency in their own Kconfig. There is actually only one that does.

Drivers should also work without runtime PM even if they can use it.

> 
> > 
> > > 
> > > > 
> > > > See e.g. the smiapp driver for an example how to make it work without. It
> > > > wasn't trivial. :I You won't need autosuspend.
> > > 
> > > I took a look at that driver, but I don't get your reference to being able
> > > to work without runtime pm!
> > 
> > The driver didn't need runtime PM, so it'd be nice to continue work
> > without.
> 
> Ok.
> 
> > 
> > What smiapp does is that it powers the sensor on first *without* runtime
> > PM, and then proceeds to set up runtime PM if it's available. The sensor
> > will only be powered off when the device is unbound with runtime PM
> > disabled.
> 
> In that case in your original reply you suggested that I move the content
> of ov2659_set_power() into the pm_runtime callback, but based on this
> comments then I should keep ov2659_set_power() as is as I  would need to
> use it for this specific purpose.

No need to; you can call the same function elsewhere in the driver (just
like the smiapp driver does).

> 
> > 
> > Regarding the smiapp driver, you can replace pm_runtime_get_noresume() and
> > all the autoidle lines with pm_runtime_idle() call after
> > pm_runtime_enable() in the ov2659 driver.
> 
> Ok, I'll study this mechanics a little more, as this is not immediately
> clear.
> 
> Benoit
> 
> > 
> > > That driver looks pretty similar to ov7740.c which I used as a reference
> > > for this.
> > 
> > I guess in practice many sensor drivers don't work without it on DT-based
> > systems I'm afraid. :-( They should be fixed.
> > 
> > -- 
> > Kind regards,
> > 
> > Sakari Ailus
> > sakari.ailus@linux.intel.com

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
