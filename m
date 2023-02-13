Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB4D5694BFC
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 17:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbjBMQEp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 11:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjBMQEn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 11:04:43 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DA21C5AF
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 08:04:39 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id dz21so1556973edb.13
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 08:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pxEYyeXpHjIwqP6E0jaxM12xUh+I/mEeeBzcpaCrdNM=;
        b=pvj5aKF+ocnisi0dcycPt/aLbqNTVR0yQLcgLAFPa+YFxQBzkp9LT/Tr5/g2tMaW4I
         5tap7d9ZlWF3qVvDz/S8e76PTOPqsAKz5rE4cvX1+DyzvIUjRD2cslXIitOJjIxjGmKO
         7Ywm+dcOg5R1IvWm3OQL9kx+C8RUquRlyCAi7tg6gHNgx2+9U4vpgmD+XPniEpp3Aa7G
         02rGVu9ICA9LMkQFHv4jx1zU+lSkb3itPk22u7KOSCTwUSGvY6AWzwmBEd630guagTcS
         /A6e/lzvRZ0LhiXGhP4pQglGt79d+nYX7/Y75jCEjXd1pJaHcchqiwdgkRNkgSpb5oZU
         zdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxEYyeXpHjIwqP6E0jaxM12xUh+I/mEeeBzcpaCrdNM=;
        b=metKM1py81lKj3Gn/ueWv89zGUt0Qcv1crSWbTPk+8elKqq2+aUsJwGc2nGiCALXMg
         CY144B1En9hoejzE1g1xkZCH+IUF32nHp7177zo2rsPmIZDRPChY8zQ1TV2CqV9sWvbt
         ZczO9YuJ6hK03pdcQAAQ9kghOd0g6bQB4Ocnv4lov1zpNghFPifBygPLekk/RB/ArUjL
         kbW7v5RBjmjGqDRJMzJy5MAyZeBr+2C+C+cLhq7PibzjyRPA/5rd/URyJb5M3nY/fFMs
         wXbBnQozaWF0VZD3rhoZ/kPS/FX+kVCFedT5vPYmgVczRr27AGHWbqtpf96ddFq8aiU6
         68sQ==
X-Gm-Message-State: AO0yUKWtvVI6gGRIUS2S3lShNKgRWdgIlYR6T+4Xx4MPj9xQSmcQj0gs
        a/we6ZUun01BYREp+CnqP1gIzg==
X-Google-Smtp-Source: AK7set/Dx2GEUq7A20HRkhtivnBym6oPmTrCtYksIoVYNzxfqB8sNbGBy1Cbc6fa7SPtPbYic7kmYw==
X-Received: by 2002:a50:9557:0:b0:4ac:bb85:c895 with SMTP id v23-20020a509557000000b004acbb85c895mr6701168eda.1.1676304277822;
        Mon, 13 Feb 2023 08:04:37 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id e12-20020a50ec8c000000b0046b471596e6sm6675386edr.57.2023.02.13.08.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 08:04:37 -0800 (PST)
Date:   Mon, 13 Feb 2023 17:04:36 +0100
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rcar-csi2: Prepare for Gen4 support
Message-ID: <Y+pflNn3AS0yGum4@oden.dyn.berto.se>
References: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se>
 <20230211145310.3819989-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXrBmWzkwm-m2uiNzZn4cXm=_T0pYD6Sp+1WfWMgbuZgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXrBmWzkwm-m2uiNzZn4cXm=_T0pYD6Sp+1WfWMgbuZgw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thanks for your feedback.

On 2023-02-13 16:41:22 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Sat, Feb 11, 2023 at 4:05 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Prepare the driver for supporting R-Car Gen4. The starting of the
> > receiver and how to enter standby differs between Gen3 and Gen4,
> > create function pointers in the device info structure to control the
> > different behavior.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> 
> > @@ -1416,11 +1441,15 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
> >  static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
> >         .init_phtw = rcsi2_init_phtw_v3m_e3,
> >         .phy_post_init = rcsi2_phy_post_init_v3m_e3,
> > +       .start_receiver = rcsi2_start_receiver_gen3,
> > +       .enter_standby = rcsi2_enter_standby_gen3,
> >         .num_channels = 2,
> >  };
> >
> >  static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
> >         .init_phtw = rcsi2_init_phtw_v3u,
> > +       .start_receiver = rcsi2_start_receiver_gen3,
> > +       .enter_standby = rcsi2_enter_standby_gen3,
> 
> This part means R-Car V3U is still treated like other R-Car Gen3 SoCs,
> not like R-Car Gen4.  Just double-checking if that is intentional?

That is intentional.

The big difference between most Gen3 SoC and V3U is that it adds the 
ISPCS (Channel Selector) between the CSI-2 IP downstream (not on the 
CSI-2 side) and the VIN IP. In short this moves some logic for routing 
which video stream is routed to which dma-engine from the VIN register 
space to the new ISPCS register space.

On the V3U the CSI-2 module is the same as on the other Gen3 SoC and it 
only supports CSI-2 D-PHY. No major new CSI-2 related change was added 
for V3U.

On the V4H the ISPCS is kept and all changes to the VIN module are the 
same as for the V3U. The new thing is more or less a new CSI-2 module, 
the register space is completely different from Gen3. It ties in to the 
same place in the video pipeline so most of the DT and V4L plumbing can 
be shared between Gen3 and Gen4. But how to start it and how to enter 
standby differs, more on standby in the reply to patch 3/3.

> 
> >         .hsfreqrange = hsfreqrange_v3u,
> >         .csi0clkfreqrange = 0x20,
> >         .clear_ulps = true,
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund
