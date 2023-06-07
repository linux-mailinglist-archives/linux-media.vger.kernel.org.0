Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65399726573
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241404AbjFGQHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241433AbjFGQHI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:07:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77AB21BDD
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:07:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126233170111.36.openmobile.ne.jp [126.233.170.111])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16E3E74C;
        Wed,  7 Jun 2023 18:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686153998;
        bh=PiOjf5Jgo5bFFQRCLwb0qiQbDp30TvgANDpaP9tJExY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jDWeX4jx7n22nIuIgqrgApp2dOqzEicWAPJnl4zChh7g37XRjVmqstTHX9UZDAf0D
         SJDAHWXNaz3bvXEECzkiCFXN1L7stOKLQDNjQKzptQ2kTgFR/WGgTIyvsSI+DEx8rL
         1vOivNDK7GjD9GsG4oz0E0HdYztPHKapZkNfAAW8=
Date:   Wed, 7 Jun 2023 19:07:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: atomisp: ov2680: Convert to new CCI register
 access helpers
Message-ID: <20230607160700.GI22127@pendragon.ideasonboard.com>
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-3-hdegoede@redhat.com>
 <CAHp75VeqeA4GA0_r_KgH0wv0_TQ4rQUdTY99DFFR_oWfdiDxfw@mail.gmail.com>
 <c34ca549-8d07-35db-0635-a5c60728dfc2@redhat.com>
 <20230607155115.GF22127@pendragon.ideasonboard.com>
 <3dd04737-8c9d-d359-9a6e-919fe34d1674@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3dd04737-8c9d-d359-9a6e-919fe34d1674@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jun 07, 2023 at 05:59:08PM +0200, Hans de Goede wrote:
> On 6/7/23 17:51, Laurent Pinchart wrote:
> > On Wed, Jun 07, 2023 at 10:53:54AM +0200, Hans de Goede wrote:
> >> On 6/6/23 22:53, Andy Shevchenko wrote:
> >>> On Tue, Jun 6, 2023 at 7:58 PM Hans de Goede wrote:
> >>>>
> >>>> Use the new comon CCI register access helpers to replace the private
> >>>> register access helpers in the ov2680 driver.
> >>>>
> >>>> While at it also switch to using the same register address defines
> >>>> as the standard drivers/media/i2c/ov2680.c driver to make merging
> >>>> the 2 drivers simpler.
> >>>
> >>> ...
> >>>
> >>>> +       cci_write(sensor->regmap, OV2680_REG_SENSOR_CTRL_0A, sensor_ctrl_0a, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_START, sensor->mode.h_start, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_VERTICAL_START, sensor->mode.v_start, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_END, sensor->mode.h_end, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_VERTICAL_END, sensor->mode.v_end, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_OUTPUT_SIZE,
> >>>> +                 sensor->mode.h_output_size, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_VERTICAL_OUTPUT_SIZE,
> >>>> +                 sensor->mode.v_output_size, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_TIMING_HTS, sensor->mode.hts, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_TIMING_VTS, sensor->mode.vts, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_ISP_X_WIN, 0, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_ISP_Y_WIN, 0, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_X_INC, inc, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_Y_INC, inc, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_X_WIN, sensor->mode.h_output_size, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_Y_WIN, sensor->mode.v_output_size, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_FORMAT1, fmt1, &ret);
> >>>> +       cci_write(sensor->regmap, OV2680_REG_FORMAT2, fmt2, &ret);
> >>>
> >>> I know that &ret thingy was discussed before and Laurent is keen to
> >>> have this, but has anybody actually tested how bad or not at all the
> >>> code generation becomes?
> >>
> >> The cci_write function is in another module, so it won't be inlined
> >> and as such I don't see how the code generation can become bad. We
> >> loose all the if (ret) return ret; checks here, so the code should
> >> become smaller.
> >>
> >> Or are you worried about having to pass the 1 extra parameter ?
> >>
> >>> ...
> >>>
> >>>> +       struct device *dev;
> >>>> +       struct regmap *regmap;
> >>>
> >>> Isn't the same device associated with regmap? If so, one of them
> >>> probably duplicates the other.
> >>
> >> You are right, but the entire atomisp-ov2680.c file is going away real
> >> soon now. I plan to post a series to get drivers/media/i2c/ov2680.c
> >> ready to replace it later today.
> >>
> >> So I'm not even sure if this patch should be merged, as I mentioned in
> >> the cover letter this one is mostly here to illustrate use of the new
> >> helpers.
> > 
> > How about porting drivers/media/i2c/imx290.c ? That's a real-life
> > example that can be merged, which is good to serve as an example
> > showcasing the API usage in mainline. It will also help ensuring that
> > these helpers are a good fit for drivers that already encode the
> > register width in the macros.
> 
> I prefer to port over drivers which I can actually test,
> at least for now.

I can test it for you if you want :-)

> I already have converting ov5693.c (which also already has macros
> to encode to width) on my TODO list. I'll convert that for v2
> of the series.
> 
> And I also have a conversion of the "main" drivers/media/i2c/ov2680.c
> ready.
> 
> I'll post that conversion as part of my big main ov2680 changes series
> which I'll post in a couple of minutes (just need to write
> a cover letter and then its ready).
>  
> >> I also wrote this patch to make porting recent atomisp-ov2680.c
> >> changes over to drivers/media/i2c/ov2680.c easier. Part of the series
> >> to get drivers/media/i2c/ov2680.c into shape is converting it to the
> >> new CCI helpers so that I could then easily copy over bits from the
> >> also converted atomisp-ov2680.c.
> >>
> >> So it might be interesting to still merge this so that the latest
> >> state of atomisp-ov2680.c is easier to compare to
> >> drivers/media/i2c/ov2680.c if the need arises.

-- 
Regards,

Laurent Pinchart
