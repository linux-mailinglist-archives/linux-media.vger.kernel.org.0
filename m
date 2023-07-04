Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79DD47470B4
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 14:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbjGDMTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 08:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbjGDMTr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 08:19:47 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC85E7B
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 05:19:44 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-471b3ad20e1so1448983e0c.1
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 05:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1688473183; x=1691065183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFqisgc9G7Lh2Sez3b92rfIFH8P04G7O33TFdonmIGQ=;
        b=NXf8zSI+SBj0BueKhsHIpdu+YpZCiWwmPfcWDWHC/DLfEhNCTkZTzYhJ3h1BRCFuDx
         OCFfC0v/LjacQzNBRuJ56zkP7edGPhqTc3dmPvXxCA92CW+0gyyfVUTIWPdntj36gb65
         V5Is2AFTx+pdWgTQ+xbG3o8MSvNODBguzQFCa23h5ifYjaFlyVb3qYL6F3bhkU2XRg1F
         i5OtjxfGZRTJvfSH/gKy5q9SVag4ULEOjIgzsD9Wd3e4kQm4uRRATfpU7s3U1TzrtYC2
         plQU73oN/HvhgaN254A5paeqZUsEDVizqVFugZkzSL62ulNwf5p32ZrFmOAtiMAjKWkU
         DewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688473183; x=1691065183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFqisgc9G7Lh2Sez3b92rfIFH8P04G7O33TFdonmIGQ=;
        b=XDVTQX6jKPHiZnkis6fZwgT3tp6pFhiK1HNyiD1SJekUE22r19uwsUcVKCPw3XmV2l
         9qQNAHmTO5JPYClQ9LfJrdrZ1HEJ2rNyKon0Cj1aPhiiPkfLnwEGgtwzLCmcFHXo44zM
         HCxAFiPoXi9zw9XseP3fsMZtapCzfFZdH5SXUOz42KOSoICSfGSardGYDWUk/lPP6Oa/
         FUZoFnyzmuVAo6mq6m6O6SX/zp2WxR/2T2ypMqXmySOOBncBgTLj08xn38+THa/03j1h
         xouEjY0yz6qxTt+VWCyjLlcensAoTts7xeEg/zgluS2wf5HIwkunekwOPW7ylfqDCgmf
         gXgA==
X-Gm-Message-State: ABy/qLZyiqK2qf2SAbmfR7QHAONnooHajFG7GRBQc6+oVDqsBT0xWxyZ
        CCZVDHtp8frMvoDNRAdLzSpb7kz0QVpkHtR0Hwt2hg==
X-Google-Smtp-Source: APBJJlHde8/uCapJzfh/Vanxo3h+jPRDrI/zGCLA79vn0CSSnZsOEfyu82FvoHkB3AMIJsRzEQFEmm8+z9LeKdnQC2I=
X-Received: by 2002:a1f:4544:0:b0:471:c1b1:bcb0 with SMTP id
 s65-20020a1f4544000000b00471c1b1bcb0mr3787135vka.3.1688473183458; Tue, 04 Jul
 2023 05:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230627131830.54601-1-hdegoede@redhat.com> <20230627131830.54601-29-hdegoede@redhat.com>
 <6f3d903c-acdc-983c-216b-45792a71d603@ideasonboard.com> <750f6763-d08a-efe1-f75e-b8c3a10b7c46@redhat.com>
 <CAPY8ntA4NexYVDuuw6-vqLJ33zz7jx+qN9bzx6c3wVGgF51ZfQ@mail.gmail.com>
 <04b22ece-84e0-22de-071b-55d77628c091@redhat.com> <5b2d0bfd-c074-c511-d583-56bad00787c1@redhat.com>
In-Reply-To: <5b2d0bfd-c074-c511-d583-56bad00787c1@redhat.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 4 Jul 2023 13:19:28 +0100
Message-ID: <CAPY8ntC0R4PvQ02EH1b-5E2z8Nh0mDUjENbnSfgUQPCy=ck_tQ@mail.gmail.com>
Subject: Re: [PATCH v3 28/29] media: ov2680: Add link-freq and pixel-rate controls
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 4 Jul 2023 at 12:32, Hans de Goede <hdegoede@redhat.com> wrote:
>
> p.s.
>
> On 7/4/23 13:29, Hans de Goede wrote:
> > Hi Dave,
> >
> > On 7/4/23 13:23, Dave Stevenson wrote:
> >> Hi Hans and Dan
> >>
> >> On Tue, 4 Jul 2023 at 10:45, Hans de Goede <hdegoede@redhat.com> wrote=
:
> >>>
> >>> Hi Dan,
> >>>
> >>> On 7/4/23 11:22, Dan Scally wrote:
> >>>> Morning Hans
> >>>>
> >>>> On 27/06/2023 15:18, Hans de Goede wrote:
> >>>>> Add read-only link-freq and pixel-rate controls. This is necessary =
for
> >>>>> the sensor to work with the ipu3-cio2 driver and for libcamera.
> >>>>>
> >>>>> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> >>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>>> ---
> >>>>>   drivers/media/i2c/ov2680.c | 23 +++++++++++++++++++++++
> >>>>>   1 file changed, 23 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.=
c
> >>>>> index 8bc542df1890..95d3152ddd22 100644
> >>>>> --- a/drivers/media/i2c/ov2680.c
> >>>>> +++ b/drivers/media/i2c/ov2680.c
> >>>>> @@ -75,6 +75,12 @@
> >>>>>   #define OV2680_MIN_CROP_WIDTH            2
> >>>>>   #define OV2680_MIN_CROP_HEIGHT            2
> >>>>>   +/* Fixed pre-div of 1/2 */
> >>>>> +#define OV2680_PLL_PREDIV0            2
> >>>>> +
> >>>>> +/* Pre-div configurable through reg 0x3080, left at its default of=
 0x02 : 1/2 */
> >>>>> +#define OV2680_PLL_PREDIV            2
> >>>>> +
> >>>>>   /* 66MHz pixel clock: 66MHz / 1704 * 1294 =3D 30fps */
> >>>>>   #define OV2680_PIXELS_PER_LINE            1704
> >>>>>   #define OV2680_LINES_PER_FRAME            1294
> >>>>> @@ -118,6 +124,8 @@ struct ov2680_ctrls {
> >>>>>       struct v4l2_ctrl *hflip;
> >>>>>       struct v4l2_ctrl *vflip;
> >>>>>       struct v4l2_ctrl *test_pattern;
> >>>>> +    struct v4l2_ctrl *link_freq;
> >>>>> +    struct v4l2_ctrl *pixel_rate;
> >>>>>   };
> >>>>>     struct ov2680_mode {
> >>>>> @@ -145,6 +153,8 @@ struct ov2680_dev {
> >>>>>       struct clk            *xvclk;
> >>>>>       u32                xvclk_freq;
> >>>>>       u8                pll_mult;
> >>>>> +    s64                link_freq[1];
> >>>>> +    s64                pixel_rate;
> >>>>>       struct regulator_bulk_data    supplies[OV2680_NUM_SUPPLIES];
> >>>>>         struct gpio_desc        *pwdn_gpio;
> >>>>> @@ -906,6 +916,12 @@ static int ov2680_v4l2_register(struct ov2680_=
dev *sensor)
> >>>>>       ctrls->gain =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN,
> >>>>>                       0, 1023, 1, 250);
> >>>>>   +    ctrls->link_freq =3D v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_=
CID_LINK_FREQ,
> >>>>> +                          0, 0, sensor->link_freq);
> >>>>> +    ctrls->pixel_rate =3D v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PI=
XEL_RATE,
> >>>>> +                          0, sensor->pixel_rate,
> >>>>> +                          1, sensor->pixel_rate);
> >>>>> +
> >>>>>       if (hdl->error) {
> >>>>>           ret =3D hdl->error;
> >>>>>           goto cleanup_entity;
> >>>>> @@ -913,6 +929,7 @@ static int ov2680_v4l2_register(struct ov2680_d=
ev *sensor)
> >>>>>         ctrls->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> >>>>>       ctrls->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> >>>>> +    ctrls->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> >>>>>         sensor->sd.ctrl_handler =3D hdl;
> >>>>>   @@ -1030,6 +1047,12 @@ static int ov2680_parse_dt(struct ov2680_d=
ev *sensor)
> >>>>>         sensor->pll_mult =3D ov2680_pll_multipliers[i];
> >>>>>   +    sensor->link_freq[0] =3D sensor->xvclk_freq / OV2680_PLL_PRE=
DIV0 /
> >>>>> +                   OV2680_PLL_PREDIV * sensor->pll_mult;
> >>>>> +
> >>>>> +    /* CSI-2 is double data rate, bus-format is 10 bpp */
> >>>>> +    sensor->pixel_rate =3D sensor->link_freq[0] * 2 / 10;
> >>>>
> >>>>
> >>>> I'm a little unsure on this one. My understanding is that the link f=
requency really ought to come from the endpoint properties (which in our ca=
se would be set by the ipu-bridge; though it doesn't for this sensor at the=
 moment because I didn't understand it properly back then) because it's a p=
latform specific thing. What the value should be, I have been determining b=
y reading the PLL settings for the sensor whilst the laptop's running Windo=
ws. So whilst this is probably technically fine in supporting the link freq=
uency that the driver already expects to configure for whatever platform th=
is was originally designed for, my guess would be that the Miix expects a d=
ifferent link frequency and ideally we'd support that instead. For example =
see these commits for the ov7251:
> >>>
> >>> The datasheet is clear that the ov2680 is intended to be used with
> >>> a fixed pixelclock of 66 MHz:
> >>>
> >>> "2.2 architecture
> >>>
> >>> The OV2680 sensor core generates streaming pixel data at a constant
> >>> frame rate to a pixel clock of 66 MHz."
> >>>
> >>> and the ov2680 always operates in single lane mode. So there really i=
s
> >>> not much to configure here.
> >>>
> >>> Also the datasheet only contains a rudimentary description of the PLL=
,
> >>> which is not really enough to write a function to configure the PLL f=
or
> >>> arbitrary link-frequencies.
> >>
> >> Working from an OV2680 datasheet I've found on the internet [1] I'll
> >> agree with you that the pixel clock is intended only ever to be 66MHz.
> >>
> >> With the FIFO at the front of the "image output interface" in fig 2-1,
> >> and the dividers shown in fig 2-8, the link frequencies could differ
> >> from one fixed ratio from the pixel clock.
> >> Not being able to produce fully arbitrary link frequencies is totally
> >> acceptable in a driver, so there's no obligation to understand or
> >> control those dividers.
> >>
> >>> The adjustment to make the sensor work with a 19.2MHz xvclk instead
> >>> of the default 24 MHz comes from the atomisp code. How to make other
> >>> adjustments would pretty much be guess work.
> >>>
> >>> I guess we could add code to check the link-frequencies and check
> >>> that there is only 1 and it matches the expected 330 MHz then the dri=
ver
> >>> still honors the link-frequencies property while at the same time
> >>> sticking with the fixed setup the sensor is intended to be used with.
> >>>
> >>> Would adding a link-frequency check like that work for you ?
> >>
> >> This is the approach taken in other drivers - see imx214 and imx219
> >> for 2 examples (I've not gone looking for more).
> >>
> >>> And if yes what should the link-frequency control return then,
> >>> the actual achieved frequency (this would be better IMHO) or
> >>> the one from the property ?
> >>
> >> You've checked that the link-frequency matches the expected 330MHz, so
> >> isn't the actual achieved frequency the same as the one configured?
> >> I'm confused by your statement.
> >
> > On x86 devices the ov2680 is used with a 19.2 MHz clock from
> > the PMC rather then with a 24 MHz clk.
> >
> > This results in a link-frequency of: 331.2 MHz instead of 330
> > MHz (and a matching pixel-clk of 66.24 MHz instead of 66 MHz).
> >
> > So my question is do we make the link-frequency control
> > return 331.2 MHz or 330 MHz when a 19.2 MHz xvclk is used ?
> >
> > 330 MHz is what will be requested in the link-frequency
> > device property. 331.2 MHz will be what is actually used.
> >
> > (the 24MHz xvclk scenario results in an exact link-freq of
> > 330MHz)

OK, that wasn't clear from the earlier discussion.

> I just realized that since both the xvclk frequency and the
> link-frequency property will both come from the same ACPI
> glue we could fix this be actually putting  331.2 MHz
> in the property and making the driver accept this as valid
> when a 19.2 MHz xvclk is used.
>
> That would make the property and the actually achieved
> link-frequency be in sync again. So this is probably the
> best way to handle this.
>
> Does this solution work for everyone ?

Yes, asking for the right thing sounds like a good solution.

It's the same route as I went for with imx258 in [1]. There 24MHz
results in a slightly different link freq to the existing 19.2MHz
configuration.

  Dave

[1] https://patchwork.linuxtv.org/project/linux-media/patch/20230530173000.=
3060865-9-dave.stevenson@raspberrypi.com/

> Regards,
>
> Hans
>
>
>
>
>
> >> I'm assuming that it's the ipu3-cio that needs link-frequency, as
> >> AFAIK libcamera doesn't.
> >>
> >>   Dave
> >>
> >> [1] http://www.datasheet.es/PDF/1045403/OV2680-pdf.html
> >>
> >>> Regards,
> >>>
> >>> Hans
> >>>
> >>>
> >>
> >
>
