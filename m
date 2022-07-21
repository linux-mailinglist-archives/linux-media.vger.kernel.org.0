Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE08857D15D
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 18:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232927AbiGUQUV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 12:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233630AbiGUQUQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 12:20:16 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A22FD10E
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 09:20:14 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id tk8so4015957ejc.7
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qXDwRvZKSwNyHIz+3PE9KeYOAwBMkwU0OIH9QSess68=;
        b=SCA1jYyqaLzOlmNJlmZ23Z4TtApVbSyF93SQfl54Z+z4+gM1PLNPzLZQCXoseO2YjJ
         12hAO19BfdiS0Tlysokrgpv7HaPcv6Qf7JGqWdbwqa8SU8TNSK76E2Y2yJw6v/kl4kqa
         Dl3f/dx5TSktJ+LEqun4GeHkN6KVGHYzR5DjiChJRqY/rNHttwsb9Wh2PEhI5jZnFkXH
         DjcLPVCUGzR3eqMyyBsNp1xdekLbtH3Z5MVLnNuIEi+9H8RqnYKvQjNGcecNcJnQ03LH
         B8AqeR9JnCKrtKljYOQuiLuQsOWyecpC55ixFSRu7cYytYz/R9nxzL7Pkos8oeqNzeFt
         InmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qXDwRvZKSwNyHIz+3PE9KeYOAwBMkwU0OIH9QSess68=;
        b=GbnDD7t+3R0n0cp7nzu/75mI2qzcNUlS8wECK1qHhvU3VpC2gZCAEya7gIyQ39jnnA
         hPRoAXvgFMyxaJORvitgXBTZrfxxXTxbWfHCiOtOmEkFydRkWWmJ6PB+pQb0TQceWI3S
         KRcFTXpvYAIL/4uw2mef1bZloPD2LsmABAp4ktXle+Njsy1yOxZD19PD67YNHeSifzuB
         3pxBtNFL8bvecv2AZjuDeg1VhpDxI9nBYaikxwfyjXh8yjU2ouRBr9r2zAEfKh4sAujT
         qOf9nrtv/gt/vevwAbtRt2b6LZY2M1znGTm7Fz4NtLYfbz/gYkEB6LGKhXVZuLSV+B0C
         CmQA==
X-Gm-Message-State: AJIora8sBzvvxcgZQ5BeaA6sq0m1TONgk7VRsWsGjdIwmGAjaTrJMo0p
        aqidZ3A7txNtXpBOw4TaZ3TfRJkUMBOXIOcvG7katgV9CIRKkw==
X-Google-Smtp-Source: AGRyM1uZ9IDbpLzgns53SI2BujEFILZMQAvgfbGtaAVpXLUzFNKqF2Q4+UkYs4zEwmesKFhjReQERJqF8BTasnklKVY=
X-Received: by 2002:a17:907:2718:b0:72b:6b65:37dc with SMTP id
 w24-20020a170907271800b0072b6b6537dcmr41091881ejk.425.1658420412604; Thu, 21
 Jul 2022 09:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <3980578.jE0xQCEvom@steina-w> <YtktJD/HQu44jTdr@pendragon.ideasonboard.com> <4314456.BEx9A2HvPv@steina-w>
In-Reply-To: <4314456.BEx9A2HvPv@steina-w>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 21 Jul 2022 17:19:56 +0100
Message-ID: <CAPY8ntBRQJFwFX1sV7kjUDwK2iHSqbTyUmEie2RFH-BVvyHcyQ@mail.gmail.com>
Subject: Re: Re: [PATCH 16/19] media: i2c: imx290: Move registers with fixed
 value to init array
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

Hi Laurent and Alexander

On Thu, 21 Jul 2022 at 12:08, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hello Laurent,
>
> Am Donnerstag, 21. Juli 2022, 12:40:36 CEST schrieb Laurent Pinchart:
> > Hi Alexander,
> >
> > On Thu, Jul 21, 2022 at 12:08:50PM +0200, Alexander Stein wrote:
> > > Am Donnerstag, 21. Juli 2022, 10:35:37 CEST schrieb Laurent Pinchart:
> > > > Registers 0x3012, 0x3013 and 0x3480 are not documented and are set in
> > > > the per-mode register arrays with values indentical for all modes. Move
> > > > them to the common array.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > >
> > > >  drivers/media/i2c/imx290.c | 8 ++------
> > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > index 78772c6327a2..fc6e87fada1c 100644
> > > > --- a/drivers/media/i2c/imx290.c
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -192,6 +192,7 @@ static const struct imx290_regval
> > > > imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x300f), 0x00 },
> > > >
> > > >   { IMX290_REG_8BIT(0x3010), 0x21 },
> > > >   { IMX290_REG_8BIT(0x3012), 0x64 },
> > > >
> > > > + { IMX290_REG_8BIT(0x3013), 0x00 },
> > > >
> > > >   { IMX290_REG_8BIT(0x3016), 0x09 },
> > > >   { IMX290_REG_8BIT(0x3070), 0x02 },
> > > >   { IMX290_REG_8BIT(0x3071), 0x11 },
> > > >
> > > > @@ -230,6 +231,7 @@ static const struct imx290_regval
> > > > imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x33b0), 0x50 },
> > > >
> > > >   { IMX290_REG_8BIT(0x33b2), 0x1a },
> > > >   { IMX290_REG_8BIT(0x33b3), 0x04 },
> > > >
> > > > + { IMX290_REG_8BIT(0x3480), 0x49 },
> > > >
> > > >  };
> > > >
> > > >  static const struct imx290_regval imx290_1080p_settings[] = {
> > > >
> > > > @@ -239,15 +241,12 @@ static const struct imx290_regval
> > > > imx290_1080p_settings[] = { { IMX290_OPB_SIZE_V, 10 },
> > > >
> > > >   { IMX290_X_OUT_SIZE, 1920 },
> > > >   { IMX290_Y_OUT_SIZE, 1080 },
> > > >
> > > > - { IMX290_REG_8BIT(0x3012), 0x64 },
> > > > - { IMX290_REG_8BIT(0x3013), 0x00 },
> > > >
> > > >   { IMX290_INCKSEL1, 0x18 },
> > > >   { IMX290_INCKSEL2, 0x03 },
> > > >   { IMX290_INCKSEL3, 0x20 },
> > > >   { IMX290_INCKSEL4, 0x01 },
> > > >   { IMX290_INCKSEL5, 0x1a },
> > > >   { IMX290_INCKSEL6, 0x1a },
> > > >
> > > > - { IMX290_REG_8BIT(0x3480), 0x49 },
> > > >
> > > >   /* data rate settings */
> > > >   { IMX290_REPETITION, 0x10 },
> > > >   { IMX290_TCLKPOST, 87 },
> > > >
> > > > @@ -267,15 +266,12 @@ static const struct imx290_regval
> > > > imx290_720p_settings[] = { { IMX290_OPB_SIZE_V, 4 },
> > > >
> > > >   { IMX290_X_OUT_SIZE, 1280 },
> > > >   { IMX290_Y_OUT_SIZE, 720 },
> > > >
> > > > - { IMX290_REG_8BIT(0x3012), 0x64 },
> > > > - { IMX290_REG_8BIT(0x3013), 0x00 },
> > > >
> > > >   { IMX290_INCKSEL1, 0x20 },
> > > >   { IMX290_INCKSEL2, 0x00 },
> > > >   { IMX290_INCKSEL3, 0x20 },
> > > >   { IMX290_INCKSEL4, 0x01 },
> > > >   { IMX290_INCKSEL5, 0x1a },
> > > >   { IMX290_INCKSEL6, 0x1a },
> > > >
> > > > - { IMX290_REG_8BIT(0x3480), 0x49 },
> > > >
> > > >   /* data rate settings */
> > > >   { IMX290_REPETITION, 0x10 },
> > > >   { IMX290_TCLKPOST, 79 },
> > >
> > > 0x3480 is INCKSEL7 for imx327, not sure if that should be set yet for
> > > imx290 (only) driver, without proper imx327 support.
> >
> > Do you mean the register doesn't exist on the IMX290 ? We could make it
> > conditional on the sensor model, but it's not added by this patch, it
> > has been there since the first version of the driver, so I'd rather do
> > that on top.
>
> As far as I know INCKSEL7 is only valid on imx327. On imx290 the whole
> 0x300-0x34ff range is reserved.

IMX290_CSI_LANE_MODE to select the number of CSI2 data lanes is
0x3443, so clearly the whole range is not reserved.

> I agree this should be conditional on the sensor model. If you want to keep
> it, because it is not new, I'm fine with that.

0x3840 is documented in my IMX290 datasheet as being INCKSEL7. 0x49
for 37.125MHz clock. 0x92 for 74.25MHz (default).
Removing it *will* break this driver for existing platforms as the
rest of the code configures a 37.125MHz clock.

See [1] for adding 74.25MHz clock support.

  Dave

[1] https://github.com/raspberrypi/linux/commit/125f7e7ef1194d4849c74b25c87d18aea9de2de7
