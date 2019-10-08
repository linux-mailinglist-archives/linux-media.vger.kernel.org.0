Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F13FCFB68
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 15:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731052AbfJHNf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 09:35:59 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45668 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731033AbfJHNf7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 09:35:59 -0400
Received: by mail-ed1-f66.google.com with SMTP id h33so15606092edh.12
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 06:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wVJ+FdvHdUxX6dsy0E9HRzVQZtw18J8A0S6Zbzj9c3A=;
        b=VacZJkEpr6vNQChW84ZDLffmdyv2F5KBVlSX6V6+3u3r61JaKwuJb1QDBo7WQDcuoz
         pt6qJK64/P1c84WHfPWhlytaoYQB22MGuMPxPGGZrUgyA/VXV2CCHUMuc5v8CxcuaDd4
         iMO9Yu4g8ypa+ZmBhQOErn4DQqw2h96jqrU2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wVJ+FdvHdUxX6dsy0E9HRzVQZtw18J8A0S6Zbzj9c3A=;
        b=dRupQgziRgHm4ZB4JuuG3fy3dXrn+J3jECtw+26euj6MyO/MG/3dh8ZfxNlHAIe3BF
         O/r+jIvNGlCjeHUox0300KvtafD2Gg4yQ4GHrrZ8WjQDxdYwnb05GWHCJEUo7r7ljw/J
         ntWaEqncvmQ/AgXfikfDD64iZoFithweJwXfDbuCs5FN/fmbcwnU//U2JLtQyLVaycQO
         2ZrOSz6V/+PU2aDERQhOXepOtdXQNkmjclqttlFH2Kva/GurROzXlMphAnGjJcqSytYs
         G212/u1HsF970biv6ZjyBEcXEE9pnN4KLu/foBUNGDdUWc0DPi02dmttr+QChrw6INT6
         gmeA==
X-Gm-Message-State: APjAAAVoMxJYDD5xOxbXROOVKFsbcm3Yc+Kc1UKgLpEpy+uF+op45yx9
        ptLMzdLWsq5gZ6L9642HhWEf4wdf5LiuPA==
X-Google-Smtp-Source: APXvYqzIp2a3YN8V99zueCk5t+mHomkCUd8Up0oo+X75esC143jHDmd/szle5XzE4IlQrqMrEF7YsQ==
X-Received: by 2002:a17:906:1152:: with SMTP id i18mr29082216eja.113.1570541755463;
        Tue, 08 Oct 2019 06:35:55 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id os27sm2288494ejb.18.2019.10.08.06.35.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2019 06:35:54 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id v8so19467284wrt.2
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 06:35:54 -0700 (PDT)
X-Received: by 2002:a5d:4b47:: with SMTP id w7mr20720607wrs.7.1570541754161;
 Tue, 08 Oct 2019 06:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-3-ezequiel@collabora.com> <CAAFQd5BNu2ea3ei_imHmEwmdna0+iiSbQSv_SBsdHfP4Uh1h4Q@mail.gmail.com>
 <HE1PR06MB4011EC9E93ECBB6773252247AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAFQd5CWoAP1psrEW6bVMkRmhFeTvFKtDSLjT7nefc2YiFovqQ@mail.gmail.com>
In-Reply-To: <CAAFQd5CWoAP1psrEW6bVMkRmhFeTvFKtDSLjT7nefc2YiFovqQ@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 8 Oct 2019 22:35:42 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AYCiKcA9pGc44L3gGHLPx6iMSb7KywkO8OqVv4gS8KvQ@mail.gmail.com>
Message-ID: <CAAFQd5AYCiKcA9pGc44L3gGHLPx6iMSb7KywkO8OqVv4gS8KvQ@mail.gmail.com>
Subject: Re: [PATCH v2 for 5.4 2/4] media: hantro: Fix H264 max frmsize
 supported on RK3288
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        "fbuergisser@chromium.org" <fbuergisser@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 8, 2019 at 7:42 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Tue, Oct 8, 2019 at 3:31 PM Jonas Karlman <jonas@kwiboo.se> wrote:
> >
> > On 2019-10-08 07:27, Tomasz Figa wrote:
> > > Hi Ezequiel, Jonas,
> > >
> > > On Tue, Oct 8, 2019 at 2:46 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > >> From: Jonas Karlman <jonas@kwiboo.se>
> > >>
> > >> TRM specify supported image size 48x48 to 4096x2304 at step size 16 pixels,
> > >> change frmsize max_width/max_height to match TRM.
> > >>
> > >> Fixes: 760327930e10 ("media: hantro: Enable H264 decoding on rk3288")
> > >> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > >> ---
> > >> v2:
> > >> * No changes.
> > >>
> > >>  drivers/staging/media/hantro/rk3288_vpu_hw.c | 4 ++--
> > >>  1 file changed, 2 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> > >> index 6bfcc47d1e58..ebb017b8a334 100644
> > >> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
> > >> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> > >> @@ -67,10 +67,10 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
> > >>                 .max_depth = 2,
> > >>                 .frmsize = {
> > >>                         .min_width = 48,
> > >> -                       .max_width = 3840,
> > >> +                       .max_width = 4096,
> > >>                         .step_width = H264_MB_DIM,
> > >>                         .min_height = 48,
> > >> -                       .max_height = 2160,
> > >> +                       .max_height = 2304,
> > > This doesn't match the datasheet I have, which is RK3288 Datasheet Rev
> > > 1.4 and which has the values as in current code. What's the one you
> > > got the values from?
> >
> > The RK3288 TRM vcodec chapter from [1], unknown revision and date, lists 48x48 to 4096x2304 step size 16 pixels under 25.5.1 H.264 decoder.
> >
> > I can also confirm that one of my test samples (PUPPIES BATH IN 4K) is 4096x2304 and can be decoded after this patch.
> > However the decoding speed is not optimal at 400Mhz, if I recall correctly you need to set the VPU1 clock to 600Mhz for 4K decoding on RK3288.
> >
> > I am not sure if I should include a v2 of this patch in my v2 series, as-is this patch do not apply on master (H264_MB_DIM has changed to MB_DIM in master).
> >
> > [1] http://www.t-firefly.com/download/firefly-rk3288/docs/TRM/rk3288-chapter-25-video-encoder-decoder-unit-(vcodec).pdf
>
> I checked the RK3288 TRM V1.1 too and it refers to 3840x2160@24fps as
> the maximum.
>
> As for performance, we've actually been getting around 33 fps at 400
> MHz with 3840x2160 on our devices (the old RK3288 Asus Chromebook
> Flip).
>
> I guess we might want to check that with Hantro.

Could you check the value of bits 10:0 in register at 0x0c8? That
should be the maximum supported stream width in the units of 16
pixels.

Best regards,
Tomasz
