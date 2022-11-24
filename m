Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C93B663788F
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 13:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiKXMHh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 07:07:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiKXMHS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 07:07:18 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B2A5DBB3;
        Thu, 24 Nov 2022 04:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669291621; x=1700827621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YsgidHp3z6YWpMEV/I6fovM+NYx8bsUJoi4Wsw5apxY=;
  b=MArkUQYSNW/32VOOOrRrjKeQFjPTRqJx7q0W6gtyoFNxEyppICK6w+iu
   6KqeFzr+/u5/Ll8mPeVM0wvXNInGMo0k0wCppD8JfwAU8pZfa1GBSgNb7
   fSYpVRZXfqhMmDYdUmw7AHndOkO8mFddvFn2mPnwa7d5aXEF9BhVfMq/R
   3bXNayt86Xs0ynqYBONdyKMokhVQH3DuhSQa7SzX/I4SGQhBQot+Rv28C
   N20leLoakEkq6S3ehKvBS+WmHl7WLiNnIzp41wJhcBwt818NzD2hYhpzI
   YPEtONyR8/mj/EyOWmSCK6LCRGrnmbPShxnpcZddlxpYWoduz2Tnm1yfC
   A==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; 
   d="scan'208";a="27561043"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Nov 2022 13:06:59 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 24 Nov 2022 13:06:59 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 24 Nov 2022 13:06:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669291619; x=1700827619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YsgidHp3z6YWpMEV/I6fovM+NYx8bsUJoi4Wsw5apxY=;
  b=CAsPUIDnwafQ/ui5JQBW7dM6hGwx5bbIBWXJTz6gn1FQYeJGqwm6e6X6
   J5dKdAcGWPJeP5kZa/FbwBfPUVx/9T+++r/4A4DLNfWjb/KBNqi7eDmNk
   +Jtst9fGd20d/X9HwkOvH75baIG1pAWRVm+YvQnCw9CyW+20CnA34LOfJ
   UOEiCOynEan/r6jy7OtLesKJYcdctaY7ueNo9D++cdYMGmBzX+KQg5ahA
   8GBErlzmAUr3rz+vzFfEpwCzQJ08LT4v4Wblh2kcjU1a82S5lGVrNzYoC
   SLgveSUWeSVLwKadH6Zqo6/7EOf5x4wIH6nBiMvpYVveXDHGcx7Vll55/
   g==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; 
   d="scan'208";a="27561042"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Nov 2022 13:06:58 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B7B0F280056;
        Thu, 24 Nov 2022 13:06:58 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov9282: Add support for regulators.
Date:   Thu, 24 Nov 2022 13:06:56 +0100
Message-ID: <2615981.X9hSmTKtgW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAPY8ntA0oq4qYu1gJszEf3WpRLywn-+8V5=Y36jzboTa69-=Tw@mail.gmail.com>
References: <20221005152018.3783890-1-dave.stevenson@raspberrypi.com> <834648869.0ifERbkFSE@steina-w> <CAPY8ntA0oq4qYu1gJszEf3WpRLywn-+8V5=Y36jzboTa69-=Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Am Donnerstag, 24. November 2022, 12:58:08 CET schrieb Dave Stevenson:
> Hi Alexander
> 
> Thanks for the review.
> 
> Sakari has already picked this up and included it in a pull to Mauro for
> 6.2. https://www.spinics.net/lists/linux-media/msg222346.html

A quite recent, I wasn't aware of that. Thanks for the hint.

> On Thu, 24 Nov 2022 at 09:31, Alexander Stein
> 
> <alexander.stein@ew.tq-group.com> wrote:
> > Hello Dave,
> > 
> > Am Mittwoch, 5. Oktober 2022, 17:20:18 CET schrieb Dave Stevenson:
> > > The sensor takes 3 supply rails - AVDD, DVDD, and DOVDD.
> > > 
> > > Add hooks into the regulator framework for each of these
> > > regulators.
> > > 
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > > 
> > >  drivers/media/i2c/ov9282.c | 38 ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 38 insertions(+)
> > > 
> > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > index 2e0b315801e5..699fc5b753b4 100644
> > > --- a/drivers/media/i2c/ov9282.c
> > > +++ b/drivers/media/i2c/ov9282.c
> > > @@ -11,6 +11,7 @@
> > > 
> > >  #include <linux/i2c.h>
> > >  #include <linux/module.h>
> > >  #include <linux/pm_runtime.h>
> > > 
> > > +#include <linux/regulator/consumer.h>
> > > 
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-fwnode.h>
> > > 
> > > @@ -55,6 +56,14 @@
> > > 
> > >  #define OV9282_REG_MIN               0x00
> > >  #define OV9282_REG_MAX               0xfffff
> > > 
> > > +static const char * const ov9282_supply_names[] = {
> > > +     "avdd",         /* Analog power */
> > > +     "dovdd",        /* Digital I/O power */
> > > +     "dvdd",         /* Digital core power */
> > > +};
> > > +
> > > +#define OV9282_NUM_SUPPLIES ARRAY_SIZE(ov9282_supply_names)
> > > +
> > > 
> > >  /**
> > >  
> > >   * struct ov9282_reg - ov9282 sensor register
> > >   * @address: Register address
> > > 
> > > @@ -128,6 +137,7 @@ struct ov9282 {
> > > 
> > >       struct media_pad pad;
> > >       struct gpio_desc *reset_gpio;
> > >       struct clk *inclk;
> > > 
> > > +     struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
> > 
> > Please add documentation for supplies.
> 
> Is it the place for the driver to document the supplies beyond the
> comments in ov9282_supply_names with regard to which sensor rail they
> relate to?
> Some drivers include the typical values for each supply, but those are
> technically inaccurate as each will have a min and max value.
> 
> Anyone interfacing with a sensor is going to have the datasheet for it
> and should be referring to that for the characteristics of supply
> rails. Duplicating some of that in the driver seems redundant, and has
> the potential to be incorrect.

What I meant was adding " @supplies: power supply regulators" to the doxygen 
(?) documentation directly above.
I agree that no details about those supplies should be added to driver code 
though.

Alexander

> 
> > >       struct v4l2_ctrl_handler ctrl_handler;
> > >       struct v4l2_ctrl *link_freq_ctrl;
> > >       struct v4l2_ctrl *pclk_ctrl;
> > > 
> > > @@ -767,6 +777,18 @@ static int ov9282_detect(struct ov9282 *ov9282)
> > > 
> > >       return 0;
> > >  
> > >  }
> > > 
> > > +static int ov9282_configure_regulators(struct ov9282 *ov9282)
> > > +{
> > > +     unsigned int i;
> > > +
> > > +     for (i = 0; i < OV9282_NUM_SUPPLIES; i++)
> > > +             ov9282->supplies[i].supply = ov9282_supply_names[i];
> > > +
> > > +     return devm_regulator_bulk_get(ov9282->dev,
> > > +                                    OV9282_NUM_SUPPLIES,
> > > +                                    ov9282->supplies);
> > > +}
> > > +
> > > 
> > >  /**
> > >  
> > >   * ov9282_parse_hw_config() - Parse HW configuration and check if
> > >   supported
> > > 
> > > * @ov9282: pointer to ov9282 device
> > > @@ -803,6 +825,12 @@ static int ov9282_parse_hw_config(struct ov9282
> > > *ov9282) return PTR_ERR(ov9282->inclk);
> > > 
> > >       }
> > > 
> > > +     ret = ov9282_configure_regulators(ov9282);
> > > +     if (ret) {
> > > +             dev_err(ov9282->dev, "Failed to get power regulators\n");
> > 
> > dev_err_probe seems sensible here.
> 
> That would have been good - sorry. I must get into the habit of
> remembering to use dev_err_probe.
> 
>   Dave
> 
> > > +             return ret;
> > > +     }
> > > +
> > > 
> > >       rate = clk_get_rate(ov9282->inclk);
> > >       if (rate != OV9282_INCLK_RATE) {
> > >       
> > >               dev_err(ov9282->dev, "inclk frequency mismatch");
> > > 
> > > @@ -874,6 +902,12 @@ static int ov9282_power_on(struct device *dev)
> > > 
> > >       struct ov9282 *ov9282 = to_ov9282(sd);
> > >       int ret;
> > > 
> > > +     ret = regulator_bulk_enable(OV9282_NUM_SUPPLIES,
> > > ov9282->supplies);
> > > +     if (ret < 0) {
> > > +             dev_err(dev, "Failed to enable regulators\n");
> > > +             return ret;
> > > +     }
> > > +
> > > 
> > >       usleep_range(400, 600);
> > >       
> > >       gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
> > > 
> > > @@ -891,6 +925,8 @@ static int ov9282_power_on(struct device *dev)
> > > 
> > >  error_reset:
> > >       gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> > > 
> > > +     regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
> > > +
> > > 
> > >       return ret;
> > >  
> > >  }
> > > 
> > > @@ -909,6 +945,8 @@ static int ov9282_power_off(struct device *dev)
> > > 
> > >       clk_disable_unprepare(ov9282->inclk);
> > > 
> > > +     regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
> > > +
> > > 
> > >       return 0;
> > >  
> > >  }
> > 
> > Despite the nits above
> > Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>




