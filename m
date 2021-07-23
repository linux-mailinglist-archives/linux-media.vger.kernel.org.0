Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261453D3A56
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 14:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234782AbhGWLz4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 07:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234774AbhGWLz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 07:55:56 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753C2C061757
        for <linux-media@vger.kernel.org>; Fri, 23 Jul 2021 05:36:29 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id h15so739661wmq.0
        for <linux-media@vger.kernel.org>; Fri, 23 Jul 2021 05:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bFm9gyGphXZlqoA8OlM0mMcdR/uVY+OZViqTdiCQk0k=;
        b=rnE/2g8D4iBvvScaBleJSSJrdoE5I1imntcO2/81o5RkIwa+/WMjTHlJPDKmFVB2qn
         Oj0xRPDs4fsRTI8KVT9UUPn8g1+YWaTNAbxzAce4N0MKGCWScf3TXz30KTU6XIpwYZxm
         KfFtX2d09ihdz3nSTlA559xaeGP5G/P5TB8A4BZfw2WJFd8XF4k0mwBJ9KKQyloY9MIk
         kfUrDgJOtLrwyOrOHaeVDiuu273nJXt7/2P8J4uylQs74LbKymkc0IH8MiBf3LTBkJFY
         69I4GVTk9+dRjeXe1w8ZVHRi+IX8Ui0g4LXIv/32W09XNHRl2Vm/MoXLtpmyu5Y3FAZQ
         TdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bFm9gyGphXZlqoA8OlM0mMcdR/uVY+OZViqTdiCQk0k=;
        b=e9sBUFyXPXvjH0A+BfRvezcjen761QiwxrgZzZdsgQr4qx7Th/tGKGs7hY+sositAn
         Uzhq/bEOMmHTdqAOxTMV4a9g5ipziQWGb5EJqjZDDJJsge+cF9sDX5WAPxKP8wVNTkwj
         d+etjbJj/OPQuxysx2aKbroeJema0V7hALCjXt94Ut72Wk6Zcva0uWDs/BFHGYlsfRi7
         v5GcX/ZicMY7xQ+3rX26sW3L99U593qm7W1UI8g+KZxqvq6ckDZp36IYEcize6AIOSXg
         Dml4HmdYSujf6rXAw3TX/qFQoXQ7yaG09EaZxAYj2llDCnkWpTgbmF9N2jOEQNwbNHdv
         4scQ==
X-Gm-Message-State: AOAM5334sM5I9i00yo0XPWKscZ/MAHH4UQt36n2Tg4ffJjE+UdKYn2h7
        0Llo4u6SDe5MlC/vqJ7mbf+THRjQkjeR6iugbTXDUA==
X-Google-Smtp-Source: ABdhPJyHmqakFgCAcjg+RaZe8WTZJ5MXvHMD64pqxv6s8etl7rMKaLLcEO/og+bwo+sLjmGrAFAuVNxWat/qNf5iKv8=
X-Received: by 2002:a05:600c:354e:: with SMTP id i14mr4392294wmq.96.1627043787958;
 Fri, 23 Jul 2021 05:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210723112233.1361319-1-umang.jain@ideasonboard.com>
 <20210723112233.1361319-3-umang.jain@ideasonboard.com> <YPqrp7BKNhzKN8xa@pendragon.ideasonboard.com>
 <YPqtZl6deaxQGYhZ@pendragon.ideasonboard.com>
In-Reply-To: <YPqtZl6deaxQGYhZ@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 23 Jul 2021 13:36:10 +0100
Message-ID: <CAPY8ntD1Kxc19LxpXQcwt8Bn662xiwUzgaPUaWOrGEiGYjjZUA@mail.gmail.com>
Subject: Re: [libcamera-devel] [PATCH 2/2] media: imx258: Limit the max
 analogue gain to 480
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Umang Jain <umang.jain@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Umang and Laurent

On Fri, 23 Jul 2021 at 12:52, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Jul 23, 2021 at 02:44:40PM +0300, Laurent Pinchart wrote:
> > Hi Umang,
> >
> > Thank you for the patch.
> >
> > CC'ing Sakari. For future kernel patches, you can use the
> > ./scripts/get_maintainer.pl script in the kernel sources to get a list
> > of appropriate recipients. The list should be taken with a grain of sal=
t
> > though, it has a tendency to return too many recipients. For this
> > particular patch, for instance, it also recommends Mauro and LKML.
> > Whether to CC the subsystem maintainer on every patch depends on the
> > subsystem (it's more common for small ones than big ones) and on the
> > maintainer's preferences. LKML is a catch-all mailing list with very
> > high traffic, and when more appropriate venues exist for patches, I
> > usually recommend skipping LKML.
>
> And expanding the CC list further to include Dave (for his contribution
> to the discussion), and Krzysztof and Bingbu (for their contributions to
> the driver, as reported by git log).
>
> > On Fri, Jul 23, 2021 at 04:52:33PM +0530, Umang Jain wrote:
> > > The range for analog gain mentioned in the datasheet is [0, 480].
> > > The real gain formula mentioned in the datasheet is:
> > >
> > >     Gain =3D 512 / (512 =E2=80=93 X)
> > >
> > > Hence, values larger than 511 clearly makes no sense. The gain
> > > register field is also documented to be of 9-bits in the datasheet.
> > >
> > > Certainly, it is enough to infer that, the kernel driver currently
> > > advertises an arbitrary analog gain max. Fix it by rectifying the
> > > value as per the data sheet i.e. 480.
> > >
> > > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

That certainly follows the datasheet that I have.

Gains up to code 480 work as expected. Up to 496 seems to work, but
going beyond that causes issues. Adopting the documented maximum value
is the safest approach.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> >
> > > ---
> > >  drivers/media/i2c/imx258.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > > index 4e695096e5d0..81cdf37216ca 100644
> > > --- a/drivers/media/i2c/imx258.c
> > > +++ b/drivers/media/i2c/imx258.c
> > > @@ -47,7 +47,7 @@
> > >  /* Analog gain control */
> > >  #define IMX258_REG_ANALOG_GAIN             0x0204
> > >  #define IMX258_ANA_GAIN_MIN                0
> > > -#define IMX258_ANA_GAIN_MAX                0x1fff
> > > +#define IMX258_ANA_GAIN_MAX                480
> > >  #define IMX258_ANA_GAIN_STEP               1
> > >  #define IMX258_ANA_GAIN_DEFAULT            0x0
> > >
>
> --
> Regards,
>
> Laurent Pinchart
