Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3BC64ECD8
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 15:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbiLPOZb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 09:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbiLPOZa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 09:25:30 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DE01402D;
        Fri, 16 Dec 2022 06:25:29 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id y4so1331058iof.0;
        Fri, 16 Dec 2022 06:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ur+Q94W+tlLvcOe4ht4yOK0w75RNLrh3v8/58jGnyVs=;
        b=l8XJEbOyRSCwIEQM31P6iLpIZxA6v71R/BMtlVq6CRFC+LTBG23nspEIf72pcMxiol
         OhSGPHkJqTw1d+8uLRvv0vmXyvh32qRKegtsKctjbAXqtoNAJnrKakCf3lo0epaet1xz
         dRTsuKoEEAhhAcWS4uJq59f+g8s5V9BoZnq3WH13jUTafN8Ubk+vPNpnXPVh6Wh/ONPa
         IEp6cQNjNhJ2lhGlh9GQ6xkx3+7gQ9juT5SgqlNW4zijcfV5TlWWJgssSYYQatHXgFhZ
         R546UPf7Pf7Eejx6P113C/tneRVjpgVHcj9JQ/bndxBWgnEc7LU9jXmUZQ4+4SGQkUii
         E+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ur+Q94W+tlLvcOe4ht4yOK0w75RNLrh3v8/58jGnyVs=;
        b=bwUm2YYys55NPUWUxZm9hsBPnwNYa7Q9Fml3rSTFD8FYHO6oGm6arY6rHrMowaqi1P
         0Xj0nG02O+rysCWyupepLPvxLgHkAGaqK8pzmgkyePuULUhL8kMtuAeUMsGsLHg5jCAc
         p5cz5UZH13ZFTXVAi2+fzvO6sTUUTizHaDvVTVBvBa90GzJs5vS0fa5NsMqLVtz32KDX
         cX0TB1zxAUL+kx64iCnDVuOX8wtMeUKVUismieRVSSzdlg+lU6kI/aODr1MdJY6Onk8Y
         uroQtPi1Ket6g5OMlD7rHzI0YUc2ocVjjE0n9grWkEETaWAk0QIx9KFVS1GlrSN2XG1y
         3swg==
X-Gm-Message-State: ANoB5pmUyEktfm6uMuDFqkHB4XKpaOU3L8McXv9Hmi48K4Ov9Xk1L5UT
        jrVW197f3kAmBF1c/xd17YPcbarxHpyZoufO/S8=
X-Google-Smtp-Source: AA0mqf7aNeS1+ly25P/SG8wXsV+a2d7JwnPtwKx+uPm+IxqCX8Nh0RJG+ZY2r/HqsmKpHHYpclyDOWku4O+eekL8G2s=
X-Received: by 2002:a05:6602:42c2:b0:6e0:117f:f0a7 with SMTP id
 ce2-20020a05660242c200b006e0117ff0a7mr8609833iob.127.1671200728384; Fri, 16
 Dec 2022 06:25:28 -0800 (PST)
MIME-Version: 1.0
References: <20221216134409.6868-1-j-luthra@ti.com> <20221216134409.6868-2-j-luthra@ti.com>
 <Y5x5UbtLFDpFIoEp@paasikivi.fi.intel.com>
In-Reply-To: <Y5x5UbtLFDpFIoEp@paasikivi.fi.intel.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 16 Dec 2022 08:25:17 -0600
Message-ID: <CAHCN7xK370ddjYjd1nMnb2rSOVvKOr7HTq+D-pAea4bVj_RqBw@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: ov5640: Handle delays when no reset_gpio set
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jai Luthra <j-luthra@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 16, 2022 at 8:09 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Jai,
>
> Thanks for the set.
>
> On Fri, Dec 16, 2022 at 07:14:07PM +0530, Jai Luthra wrote:
> > Some module manufacturers [1][2] don't expose the RESETB gpio of the
> > sensor directly through the 15-pin FFC connector. Instead wiring ~PWDN
> > as a proxy reset with appropriate delays.
> >
> > In such cases, reset_gpio will not be available to the driver, but it
> > will still be toggled when the sensor is powered on, and thus we should
> > still honor the wait time of >= 5ms + 1ms + 20ms (see figure 2-3 in [3])
> > before attempting any i/o operations over SCCB.
> >
> > [1] https://digilent.com/reference/_media/reference/add-ons/pcam-5c/pcam_5c_sch.pdf
> > [2] https://www.alinx.com/public/upload/file/AN5641_User_Manual.pdf
> > [3] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
> >
> > Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index e0f908af581b..4bb7bf557cfa 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -2466,6 +2466,7 @@ static int ov5640_set_power_on(struct ov5640_dev *sensor)
> >
> >       ov5640_reset(sensor);
> >       ov5640_power(sensor, true);
> > +     usleep_range(26000, 30000);
>
> I think you should only do this if you don't have RESETB pin.
>
> I'm not sure how to best describe this in DT. It's not the same as if you
> didn't have RESETB GPIO.


 Can that function check if (!sensor->reset_gpio) and do the delay
only if reset_gpio is not present?

adam


>
> Cc the devicetree list and Krzysztof.
>
> >
> >       ret = ov5640_init_slave_id(sensor);
> >       if (ret)
>
> --
> Kind regards,
>
> Sakari Ailus
