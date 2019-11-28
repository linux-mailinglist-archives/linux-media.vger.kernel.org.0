Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEC3010C2D2
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 04:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbfK1D0m convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 27 Nov 2019 22:26:42 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41164 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbfK1D0m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Nov 2019 22:26:42 -0500
Received: by mail-ed1-f68.google.com with SMTP id n24so143307edo.8;
        Wed, 27 Nov 2019 19:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=GaoENi4GGygQ3nQqcy3CJUnQOgf4koxEIDao896R3FY=;
        b=dPNSPuTtjgVCeXDIawnm3DokEeJhbvi8YljNZWIhc5NkETTx5R64+n3l6lgWAN2o+L
         9V1syxqOJUok1MK3o1VmsLOhl8xazx27U6o3oc5Ok1Xbob+BEYTsvw4WTMG2HFTBbSgA
         SWJggrI6oiVjvl7NVerL4noyn334KlgX8bbKrPQM10oEZ+UARN4HlB+HsvHVPzoY2Hvk
         LrcTeab5eT2SY2nV+7Ve5GImQP/DksZ7ph9LxbzrwjC7MZifSGAp7mCpTn9H8Tzo1xZv
         MxLZ7GILV1NhVk4PhCCDV4gpUw9Hqikdk4c/wfUTOmfc4GvGmfCQ4eIq1mnfoguHsLGh
         ZhsA==
X-Gm-Message-State: APjAAAXw8cUerO/foQcXT5I/uPjGXrHgn8FCMDb4wWtXJ4OtaK93bdY+
        DudVrNzcXklKNy32ZFNx+Jg+nH2G1Ak=
X-Google-Smtp-Source: APXvYqwelZcjmeo16CrSMhOynJT2e9fglwvwRmClbLFKZ7CbVS8DoJg5lC2JjOjxUYmFG8kN+ORfXQ==
X-Received: by 2002:a17:906:3495:: with SMTP id g21mr53601972ejb.190.1574911598648;
        Wed, 27 Nov 2019 19:26:38 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id d8sm924792edb.18.2019.11.27.19.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2019 19:26:38 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id t2so29225796wrr.1;
        Wed, 27 Nov 2019 19:26:37 -0800 (PST)
X-Received: by 2002:a5d:4a45:: with SMTP id v5mr47663995wrs.288.1574911597488;
 Wed, 27 Nov 2019 19:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20191128020259.1338188-1-megous@megous.com> <20191128102608.035cbb996c8681a6fb035336@magewell.com>
 <20191128030653.5fhcolvib6tzf4zc@core.my.home>
In-Reply-To: <20191128030653.5fhcolvib6tzf4zc@core.my.home>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Thu, 28 Nov 2019 11:26:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v65+4LhHU5UCOhnowKqK+GUiAKzi+wcPxkmuwtJ=itv-iw@mail.gmail.com>
Message-ID: <CAGb2v65+4LhHU5UCOhnowKqK+GUiAKzi+wcPxkmuwtJ=itv-iw@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH] media: sun6i-csi: Fix incorrect
 HSYNC/VSYNC/PCLK polarity configuration
To:     =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>,
        Yong <yong.deng@magewell.com>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:CSI DRIVERS FOR ALLWINNER V3s" 
        <linux-media@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 28, 2019 at 11:06 AM Ondřej Jirman <megous@megous.com> wrote:
>
> Hi,
>
> On Thu, Nov 28, 2019 at 10:26:08AM +0800, Yong wrote:
> > Hi Ondrej,
> >
> > This has been discussed.
> > And Maxime sent a patch for this:
> > https://www.mail-archive.com/linux-media@vger.kernel.org/msg127149.html
>
> Thanks for pointing to the previous patch. But that patch doesn't make any
> sense, and breaks things for me, and doesn't even match BSP code, which
> has no such reversal, and works fine with about 30 cam drivers.
>
> Also how do you explain my findings?
>
> My camera is sending correct signals, verified by looking at them actually (see
> below), and CSI is not receiving the image. I have to flip HSYNC/VSYNC to be
> oposite of that what CSI driver expects and I get a noisy image and if I fix
> PCLK polarity too, the noise goes away, which means now I'm also sampling when
> the data are stable and not when they're changing.
>
> Here: (output from my cam, that I configured to have VSYNC ACTIVE LOW, HSYNC
> ACTIVE LOW) And the signal is clearly that, as you can see yourself:
>
>   https://megous.com/dl/tmp/98df81b7ed0126ec.png

From the looks of things you have active-high VSYNC with active-low HREF.
HREF is not the same as HSYNC, in fact quite the opposite. V/H SYNC are
pulses, active only when there should be no data and the line/frame switch
happens, while V/H REF are held active when there is data. I personally
find these terms very confusing. :(

Now the timing diagrams in the Allwinner manuals would suggest that when
they are talking about H/V SYNC, they are actually referring to H/V REF.
The HSYNC line is high/active when there is valid data, and the VSYNC line
is high/active for the duration of the frame.

I think both sides need to be checked that they are using the correct
polarity, and maybe also have the media maintainers clarify how the
polarity should be interpreted when the hardware uses H/V ref instead
of H/V sync.


ChenYu

> The above signals are received with CSI driver configured with
> V4L2_MBUS_VSYNC_ACTIVE_HIGH V4L2_MBUS_HSYNC_ACTIVE_HIGH. So CSI driver is
> clearly wrong.
>
> I think this is pretty clear the driver is buggy. At least for A83T SoC.
>
> I'm not sure what Maxime found out, but he should probably re-check his
> findings. Maxime, can you comment on this?
>
> regards,
>         o.
>
> > On Thu, 28 Nov 2019 03:02:59 +0100
> > Ondrej Jirman <megous@megous.com> wrote:
> >
> > > This was discovered by writing a new camera driver and wondering, why
> > > hsync/vsync polarity setting behaves in reverse to what would be
> > > expected. Verified by looking at the actual signals and the SoC
> > > user manual.
> > >
> > > Fixes: 5cc7522d8965 ("media: sun6i: Add support for Allwinner CSI V3s")
> > > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > > ---
> > >  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > index f17e5550602d..98bbcca59a90 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > @@ -417,12 +417,12 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_dev *sdev)
> > >             if (flags & V4L2_MBUS_FIELD_EVEN_LOW)
> > >                     cfg |= CSI_IF_CFG_FIELD_POSITIVE;
> > >
> > > -           if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> > > +           if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
> > >                     cfg |= CSI_IF_CFG_VREF_POL_POSITIVE;
> > > -           if (flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> > > +           if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> > >                     cfg |= CSI_IF_CFG_HREF_POL_POSITIVE;
> > >
> > > -           if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> > > +           if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
> > >                     cfg |= CSI_IF_CFG_CLK_POL_FALLING_EDGE;
> > >             break;
> > >     case V4L2_MBUS_BT656:
> > > --
> > > 2.24.0
> > >
> > > --
> > > You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> > > To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> > > To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20191128020259.1338188-1-megous%40megous.com.
> >
> >
> > Thanks,
> > Yong
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20191128030653.5fhcolvib6tzf4zc%40core.my.home.
