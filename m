Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D50174D9CAC
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 14:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347358AbiCONyi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 09:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235678AbiCONyi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 09:54:38 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 036CB3388F
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 06:53:25 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id r6so28674705wrr.2
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=olsmTLLGKwSXQ0dZNDDliQg/YSTi666jkRwfRGen/oo=;
        b=jJ+hma0UV4212rH/Cp2AFCXr6b8954oIOh5xOhyrUfh7CC6D9tS78HAv+00fPLkSCu
         zwxUJIoGdETy/2MhiLkBLBZ5V1ag4WsyrIW5r976imJQ1i/13RWJgYU3hrWRmPIFDORv
         0tszkcI/uK1qAraqeVRML+WTDH4/7uK7OWijdiT6ZS/u6nykt1V52mgny542BpFZ4ONa
         scmkpNjHtjmj5DWwVCq6AGpjBPKulVaXzCMlET3GOOjoreG2VUtT3HfbkdI9Ow8gNt8I
         jB7FlqzKsSVmbri3/iAoY9l4dvF130XojD5ZPS3Zed4ZGuXORoyxBxgbczdBATjCy2dL
         FMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=olsmTLLGKwSXQ0dZNDDliQg/YSTi666jkRwfRGen/oo=;
        b=U3PIfhRh7vAayDBRwHBqZ6UaI5qZ0+KM1dxPXzzh8hNP3oFm3L03DCbiGeLEroLn3e
         hixTpfTixDHHgXE9e3Rxn8lCa9mc7vr728/CXth1ysB9+LjXBAgsiWxW7y5KcmA/hOqT
         aky0qB+Rmj6heOn9qxYimFDtzC581pCzvERWcTT+XcVu0jefQgieZ2YWArpmV9uczhRt
         EphAiFVeWN2wBujibZyUf+Pp8LDcNaef4awBVM8NmRlbRXCv5vAyXWrfHXyuWkCR+XUM
         H1FSH8o9pwwt70tkKdrcNAKVQmwKM9oRtuNX10dVPEPG5bk37VqbpQ3g8ZAMtcePicil
         0kGQ==
X-Gm-Message-State: AOAM531vQ1LVGLjxT1OgKU9T4q3tA6Sb9d6iJvgwcOfrgXGBkBsgMMXN
        Pr5OWaZNYGkiW1Uv/BXYOR/9w/HhiW8=
X-Google-Smtp-Source: ABdhPJyIQqRTm5fnoBZO9GH/oim3E3j6U9H6R2SnFwSJneewoGOXPRUmH0LbNuT8RDaJnx+ZVlDMbg==
X-Received: by 2002:a05:6000:15c3:b0:203:b7a0:ae6b with SMTP id y3-20020a05600015c300b00203b7a0ae6bmr7498532wry.692.1647352403442;
        Tue, 15 Mar 2022 06:53:23 -0700 (PDT)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id 10-20020adf808a000000b001edd413a952sm15781868wrl.95.2022.03.15.06.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 06:53:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 15 Mar 2022 13:53:21 +0000
Message-Id: <CIKHOTOFTHZS.2GNLCTM1A0CKB@arch-thunder>
Cc:     <linux-media@vger.kernel.org>, <kernel@pengutronix.de>,
        <linux-imx@nxp.com>, "Paul Elder" <paul.elder@ideasonboard.com>,
        "Sakari Ailus" <sakari.ailus@iki.fi>
Subject: Re: [PATCH 4/5] media: imx: imx-mipi-csis: Remove duplicated check
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        "Jacopo Mondi" <jacopo@jmondi.org>
References: <20220314103941.46021-1-jacopo@jmondi.org>
 <20220314103941.46021-5-jacopo@jmondi.org>
 <YjB4zDdyQxJG6u7U@pendragon.ideasonboard.com>
 <20220315122748.npt244uyzvewqmhw@uno.localdomain>
 <YjCOt9okSYIXjUJF@pendragon.ideasonboard.com>
In-Reply-To: <YjCOt9okSYIXjUJF@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Tue Mar 15, 2022 at 1:03 PM WET, Laurent Pinchart wrote:

> Hi Jacopo,
>
> On Tue, Mar 15, 2022 at 01:27:48PM +0100, Jacopo Mondi wrote:
> > On Tue, Mar 15, 2022 at 01:30:20PM +0200, Laurent Pinchart wrote:
> > > On Mon, Mar 14, 2022 at 11:39:40AM +0100, Jacopo Mondi wrote:
> > > > The mipi_csis_log_counters() function already checks for
> > > > csis->debug.enable, it is not necessary to do the same in the calle=
r.
> > >
> > > Does it ? It does only to decide whether or not to print counters tha=
t
> > > have a zero value.
> >=20
> > Roght, I mis-read the condition there.
> >=20
> > What is the usage of the counters logger ? Should we make it
> > conditional to debug.enable ?
>
> It's been there from the very beginning, so I'm not sure what the
> expected use cases where. I'd be tempted to actually move it to debugfs,
> possibly with a single warning message at stream start if any error is
> detected.
>
> Rui, what do you think ?

This were there to trace events when debug is enable or irq_src_errors
where thrown in the irq_handler and report them at start stream.

But, it looks good to move it to debugfs. Thanks for your and Jacopo
work on this to improve it.

Cheers,
     Rui
>
> > > > Compatc the code in the caller as well by removing an empty line.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > >  drivers/media/platform/imx/imx-mipi-csis.c | 5 +----
> > > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/m=
edia/platform/imx/imx-mipi-csis.c
> > > > index 4a6152c13d52..4bb469fcb6b3 100644
> > > > --- a/drivers/media/platform/imx/imx-mipi-csis.c
> > > > +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> > > > @@ -913,11 +913,8 @@ static int mipi_csis_s_stream(struct v4l2_subd=
ev *sd, int enable)
> > > >
> > > >  	if (!enable) {
> > > >  		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
> > > > -
> > > >  		mipi_csis_stop_stream(csis);
> > > > -		if (csis->debug.enable)
> > > > -			mipi_csis_log_counters(csis, true);
> > > > -
> > > > +		mipi_csis_log_counters(csis, true);
> > > >  		pm_runtime_put(csis->dev);
> > > >
> > > >  		return 0;
>
> --=20
> Regards,
>
> Laurent Pinchart



