Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFEF382B64
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 13:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236769AbhEQLp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 07:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhEQLp7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 07:45:59 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4657C061573
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 04:44:41 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id j6so5649606lfr.11
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 04:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zey77zJy5RVWOhA+DdNIaCVb7wJapM77X61QFGGKNqQ=;
        b=B1er58LCWRRQeezfHO/NxtMNJl0Kq85F9+pQJX4B2jDte85jIody1Lrm++zY+9uYM0
         7vWo1ZGxKMm1GJ4YCNDr72mjH4Ye8TqhRptgEfr+eYawh9cktp/HRxRwoJ0DNYTKw697
         OSWn5VXjz9sbGSsYy10x7Dr02tm0Rdt7ErvH12q/RxYPaGySfKF1fqfy7sGojP9uE6Jq
         sTPKo9HE+jFruY1BV/Ucb17XWz9OW4KUPEqXKH7pbKkVRZs+MxuJeMfhT23KM2frU2ei
         hGW7vp00WPUH+7bI9aOnW4e3kNGDfVbHr8JKaAsUiKO/8yi44dt95rFvOKztKFAjCC3W
         lnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zey77zJy5RVWOhA+DdNIaCVb7wJapM77X61QFGGKNqQ=;
        b=WNOOZdqnQ5yMHSeD37bCTc0+kV1TP+WlSnBzhK6Uuv6FXZ013seSxzxNA7oPWdBykq
         vQYHV+WM9qdk/vE2C2NLb9ck1VlBs6U/vcKCrlJiFY1Hl5IBNtaykeAKX7Lj6gbgJQGd
         PnhNcjj5ixefR4piqQ07knJHEHGxr/J9/8ZgNV+VDKT1+SH1kRfZubX1vZwlr3o4ggdT
         e0dwFwi6EiMFDsEfuysHcJeHE5bkmP8EQ0rmBVLN1mOmcm3jKbFRZ7HtgFd2rcvYOycr
         xOsFFeWztTeZ9DpqtQysDJ+c/AmV4L6nG94rBZzPo3AJ1994kqqIhpSI850qF9PgJrv/
         HI7Q==
X-Gm-Message-State: AOAM533StKBEKsGanQOdSdqjHdxh48fOvHu/qpT30CxwJ3gqMaR5MAJ9
        kCyefXXETkkyi0b+UgSPhUt32Q==
X-Google-Smtp-Source: ABdhPJw5u2zpWaAPtH+fow/yZvEbGYKM8vNhv4j8gzoCAm28djgSLxcv09KrNHZbQpZm5hckO+ofVw==
X-Received: by 2002:a05:6512:10c8:: with SMTP id k8mr43016193lfg.325.1621251880268;
        Mon, 17 May 2021 04:44:40 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id m4sm2849801ljc.20.2021.05.17.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 04:44:39 -0700 (PDT)
Date:   Mon, 17 May 2021 13:44:39 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [PATCH v2] media: rcar-csi2: Enable support for r8a77961
Message-ID: <YKJXJ0ZnEXFuuecz@oden.dyn.berto.se>
References: <20210513140914.742677-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXnduG8q4tmXTgOEgHdyqqVQgXs7s93rif_4yQ-foJGWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXnduG8q4tmXTgOEgHdyqqVQgXs7s93rif_4yQ-foJGWw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On 2021-05-17 11:51:48 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Thu, May 13, 2021 at 4:10 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Enable support for M3-W+ (r8a77961).
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Tested-by: LUU HOAI <hoai.luu.ub@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > ---
> > * Changes since v1
> > - Do not piggy back on the M3-W (r8a7796) quirks as they are different.
> 
> But for now they're still handled the same way...
> 
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -1112,6 +1112,11 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
> >         .num_channels = 4,
> >  };
> >
> > +static const struct rcar_csi2_info rcar_csi2_info_r8a77961 = {
> > +       .hsfreqrange = hsfreqrange_m3w_h3es1,
> > +       .num_channels = 4,
> > +};
> 
> ... as rcar_csi2_info_r8a77961 has the same contents as rcar_csi2_info_r8a7796?

Yes the structures are currently the same but the one added here is 
correct while rcar_csi2_info_r8a7796 will need a new qurik field added 
in a different patch.

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
Regards,
Niklas Söderlund
