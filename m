Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD2E257DEC8
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 11:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235379AbiGVJN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 05:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235420AbiGVJMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 05:12:43 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCD93206E
        for <linux-media@vger.kernel.org>; Fri, 22 Jul 2022 02:10:23 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id bp15so7527856ejb.6
        for <linux-media@vger.kernel.org>; Fri, 22 Jul 2022 02:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eaFmSkZtWgNBBlFH/lSyHxIFcJ0yHTzPKvNZtyR9/ao=;
        b=Pa/jS35r+euzCp49FKerZ71t+aiOv0OILwdEYrRXbxrqESocqtUR4WMNvsYJnln/tx
         Z1W5qI0hvvhMoqE54a3jWY2ouNZghaG/ctrSvUAOv6xTz/jgSZ/lcgZ4SBDmDXA/qVkE
         o8XR1vHVV+ThntkfkY/2mZ8pRQ8MtfIci1M/vzR7NBvEYhQ/FgGwIH057fCovzoRXUS7
         MBXndLCpZs77a6I67d2ohD2UAC05L/yYFdgTlpmWFYnnhMI+pehhHG82TA4JNep1kIEA
         dFbpL5ksJ2qgesOsJcFSQ5otSBPpXdg+glARrBKlWYXJam5UGUB+N76AH8YzV1SVyxIi
         sD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eaFmSkZtWgNBBlFH/lSyHxIFcJ0yHTzPKvNZtyR9/ao=;
        b=5zasmyHU4ZDnkdn068wXuibeT4KC79k99sTTvvkYLw1jww9js5fgLLo43Lg9W5zd9i
         VNHQB1RJOFjidoFG/MKE2aqQxmjJEmnMwvelZarjY3x6jz5PUYV0XFvq5NhnJbxrd2vC
         qyojPAR/Qjmtm+9DIFTgpcffzf42fMAXb6sKfYOGCl1Dy906m5XuEhFNLmTsJvopwslO
         4A17+HIbNOxTuII2nIUX6/oGeGL5VUqp3QQl7Ar6uSVdmTM8a1Of0XCpgxIxXPvxz2gu
         ejtFlL0JR32hrI8ofvyloJqCZWV2Mf9O6q86ssEcmrFO+++grKfAgLoSv0m2Ky9QYTba
         UHRA==
X-Gm-Message-State: AJIora/a7y6nJb5Yhryr5evpOHLMXadEXesxAIMBmLKcDsEK/DGECYsl
        Pm/2bNxWcQjaxL9Oi1laYH4a6zOfpv2SNa+fBZrHOw==
X-Google-Smtp-Source: AGRyM1uY2tUB1yJR7yeYaZsd325zrcukxiGlHBxwTtecjd7BDwjHrflP2m+EP+aXcdCiS2KDLDrrfNnax20uhqXNrOw=
X-Received: by 2002:a17:907:d92:b0:72e:e94d:b675 with SMTP id
 go18-20020a1709070d9200b0072ee94db675mr2275113ejc.742.1658481022062; Fri, 22
 Jul 2022 02:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <4314456.BEx9A2HvPv@steina-w> <CAPY8ntBRQJFwFX1sV7kjUDwK2iHSqbTyUmEie2RFH-BVvyHcyQ@mail.gmail.com>
 <3555790.PIDvDuAF1L@steina-w>
In-Reply-To: <3555790.PIDvDuAF1L@steina-w>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 22 Jul 2022 10:10:07 +0100
Message-ID: <CAPY8ntDDQ2-5hao_G5LEwCp+Z_3p-8Kh-sdScB+UtEa1p30nRw@mail.gmail.com>
Subject: Re: Re: Re: [PATCH 16/19] media: i2c: imx290: Move registers with
 fixed value to init array
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 22 Jul 2022 at 06:53, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hello Dave,
>
> Am Donnerstag, 21. Juli 2022, 18:19:56 CEST schrieb Dave Stevenson:
> > Hi Laurent and Alexander
> >
> > On Thu, 21 Jul 2022 at 12:08, Alexander Stein
> >
> > <alexander.stein@ew.tq-group.com> wrote:
> > > Hello Laurent,
> > >
> > > Am Donnerstag, 21. Juli 2022, 12:40:36 CEST schrieb Laurent Pinchart:
> > > > Hi Alexander,
> > > >
> > > > On Thu, Jul 21, 2022 at 12:08:50PM +0200, Alexander Stein wrote:
> > > > > Am Donnerstag, 21. Juli 2022, 10:35:37 CEST schrieb Laurent Pinchart:
> > > > > > Registers 0x3012, 0x3013 and 0x3480 are not documented and are set
> > > > > > in
> > > > > > the per-mode register arrays with values indentical for all modes.
> > > > > > Move
> > > > > > them to the common array.
> > > > > >
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > ---
> > > > > >
> > > > > >  drivers/media/i2c/imx290.c | 8 ++------
> > > > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > > > index 78772c6327a2..fc6e87fada1c 100644
> > > > > > --- a/drivers/media/i2c/imx290.c
> > > > > > +++ b/drivers/media/i2c/imx290.c
> > > > > > @@ -192,6 +192,7 @@ static const struct imx290_regval
> > > > > > imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x300f), 0x00 },
> > > > > >
> > > > > >   { IMX290_REG_8BIT(0x3010), 0x21 },
> > > > > >   { IMX290_REG_8BIT(0x3012), 0x64 },
> > > > > >
> > > > > > + { IMX290_REG_8BIT(0x3013), 0x00 },
> > > > > >
> > > > > >   { IMX290_REG_8BIT(0x3016), 0x09 },
> > > > > >   { IMX290_REG_8BIT(0x3070), 0x02 },
> > > > > >   { IMX290_REG_8BIT(0x3071), 0x11 },
> > > > > >
> > > > > > @@ -230,6 +231,7 @@ static const struct imx290_regval
> > > > > > imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x33b0), 0x50 },
> > > > > >
> > > > > >   { IMX290_REG_8BIT(0x33b2), 0x1a },
> > > > > >   { IMX290_REG_8BIT(0x33b3), 0x04 },
> > > > > >
> > > > > > + { IMX290_REG_8BIT(0x3480), 0x49 },
> > > > > >
> > > > > >  };
> > > > > >
> > > > > >  static const struct imx290_regval imx290_1080p_settings[] = {
> > > > > >
> > > > > > @@ -239,15 +241,12 @@ static const struct imx290_regval
> > > > > > imx290_1080p_settings[] = { { IMX290_OPB_SIZE_V, 10 },
> > > > > >
> > > > > >   { IMX290_X_OUT_SIZE, 1920 },
> > > > > >   { IMX290_Y_OUT_SIZE, 1080 },
> > > > > >
> > > > > > - { IMX290_REG_8BIT(0x3012), 0x64 },
> > > > > > - { IMX290_REG_8BIT(0x3013), 0x00 },
> > > > > >
> > > > > >   { IMX290_INCKSEL1, 0x18 },
> > > > > >   { IMX290_INCKSEL2, 0x03 },
> > > > > >   { IMX290_INCKSEL3, 0x20 },
> > > > > >   { IMX290_INCKSEL4, 0x01 },
> > > > > >   { IMX290_INCKSEL5, 0x1a },
> > > > > >   { IMX290_INCKSEL6, 0x1a },
> > > > > >
> > > > > > - { IMX290_REG_8BIT(0x3480), 0x49 },
> > > > > >
> > > > > >   /* data rate settings */
> > > > > >   { IMX290_REPETITION, 0x10 },
> > > > > >   { IMX290_TCLKPOST, 87 },
> > > > > >
> > > > > > @@ -267,15 +266,12 @@ static const struct imx290_regval
> > > > > > imx290_720p_settings[] = { { IMX290_OPB_SIZE_V, 4 },
> > > > > >
> > > > > >   { IMX290_X_OUT_SIZE, 1280 },
> > > > > >   { IMX290_Y_OUT_SIZE, 720 },
> > > > > >
> > > > > > - { IMX290_REG_8BIT(0x3012), 0x64 },
> > > > > > - { IMX290_REG_8BIT(0x3013), 0x00 },
> > > > > >
> > > > > >   { IMX290_INCKSEL1, 0x20 },
> > > > > >   { IMX290_INCKSEL2, 0x00 },
> > > > > >   { IMX290_INCKSEL3, 0x20 },
> > > > > >   { IMX290_INCKSEL4, 0x01 },
> > > > > >   { IMX290_INCKSEL5, 0x1a },
> > > > > >   { IMX290_INCKSEL6, 0x1a },
> > > > > >
> > > > > > - { IMX290_REG_8BIT(0x3480), 0x49 },
> > > > > >
> > > > > >   /* data rate settings */
> > > > > >   { IMX290_REPETITION, 0x10 },
> > > > > >   { IMX290_TCLKPOST, 79 },
> > > > >
> > > > > 0x3480 is INCKSEL7 for imx327, not sure if that should be set yet for
> > > > > imx290 (only) driver, without proper imx327 support.
> > > >
> > > > Do you mean the register doesn't exist on the IMX290 ? We could make it
> > > > conditional on the sensor model, but it's not added by this patch, it
> > > > has been there since the first version of the driver, so I'd rather do
> > > > that on top.
> > >
> > > As far as I know INCKSEL7 is only valid on imx327. On imx290 the whole
> > > 0x300-0x34ff range is reserved.
> >
> > IMX290_CSI_LANE_MODE to select the number of CSI2 data lanes is
> > 0x3443, so clearly the whole range is not reserved.
>
> You are right, I was looking at the wrong table, my bad.
>
> > > I agree this should be conditional on the sensor model. If you want to
> > > keep
> > > it, because it is not new, I'm fine with that.
> >
> > 0x3840 is documented in my IMX290 datasheet as being INCKSEL7. 0x49
> > for 37.125MHz clock. 0x92 for 74.25MHz (default).
> > Removing it *will* break this driver for existing platforms as the
> > rest of the code configures a 37.125MHz clock.
>
> I guess you mean 0x3480, just a small typo. Just to be sure.
> Interesting, the datasheet for imx290 I found doesn't contain INCKSEL7 at all.
> But good to know, that this register applies to imx290 as well.
> Thanks for that information.

Yes, typo of 0x3840 vs 0x3480.

I did spend a fair amount of time looking at IMX327 / IMX290 a while
back, and do have datasheets, so happy to help out with reviews. I
really ought to clean up my patches and send them to the list, but
I'll wait for Laurent's set here to be merged first (assuming that
doesn't become too drawn out).

  Dave

> Best regards,
> Alexander
>
> > See [1] for adding 74.25MHz clock support.
> >
> >   Dave
> >
> > [1]
> > https://github.com/raspberrypi/linux/commit/125f7e7ef1194d4849c74b25c87d18a
> > ea9de2de7
>
>
>
>
