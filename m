Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC6DAD21E3
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 09:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733107AbfJJHiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 03:38:09 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44616 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732946AbfJJH2P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 03:28:15 -0400
Received: by mail-ed1-f66.google.com with SMTP id r16so4474359edq.11
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2019 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vJlsoh59oqAW/FaeFtNhF8aeiLWws7tRN/rM3DPOGVk=;
        b=c456C2yYsszcTskT+OjzXqm9fVBu3NJ5qlbw7ZUpE1S9D86PePnNay+vuANzmvUm92
         upiwGqr0jcyA9imn8XkWzMB3rUlysShx8nSJvJZ33ARM0S4QGBjMkBg5Rl/59wXkViik
         nvCry4o/SQdvSs13kRgdKD0hN8VZvijYv6jQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vJlsoh59oqAW/FaeFtNhF8aeiLWws7tRN/rM3DPOGVk=;
        b=Meh/C4Bj0bi3NbBM5cAwoBJd+TYoWZySLOlZ/VU3bxZogvpKZhhoxlqetafeZuoAHo
         Ai5twzBLowEaawEDvnCb7LVaPcOTJmDx4gs4z5NtoDKgPQs9D/byTqehxeAaZgn1c0aS
         S5YZtOCNqS+GjNAkCRhrw5x/Sv4+neHLCWSHyLcsIREtCFP2X1eSHGFGeny3Cf1SRuPj
         nktWh4+SqsMNGvQX1x3tmQyLaDaP9RlAm25q0H9dX5aHPeM3R90EXwt2NHa/02flVX+X
         Mb8Qykb4Ak9tpA35JCLX/GFapnONeGcKH0oPVIaEbIS8HNHuDXOZyMawjRFTLYjLPvbk
         Wi2A==
X-Gm-Message-State: APjAAAV3k+JFd3pp07Nm8Fpu83XsKQ5V7gepKbVbk+1tosGsE4X0/sLm
        w1ZmuJDusOW8SlfJQZNhmYnObUplNkKXRg==
X-Google-Smtp-Source: APXvYqxDvyyE7pemmYRqvTc9REt16i/Hvdk5pbyb9qoMEwtotAJXUpM1k6hlZYY/zu2TG+Oft25DVQ==
X-Received: by 2002:a17:906:55d1:: with SMTP id z17mr6791723ejp.300.1570692491305;
        Thu, 10 Oct 2019 00:28:11 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id t4sm770235edq.35.2019.10.10.00.28.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2019 00:28:09 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id v8so6464439wrt.2
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2019 00:28:09 -0700 (PDT)
X-Received: by 2002:adf:fc42:: with SMTP id e2mr7509472wrs.100.1570692489004;
 Thu, 10 Oct 2019 00:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-3-ezequiel@collabora.com> <CAAFQd5BNu2ea3ei_imHmEwmdna0+iiSbQSv_SBsdHfP4Uh1h4Q@mail.gmail.com>
 <HE1PR06MB4011EC9E93ECBB6773252247AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAFQd5CWoAP1psrEW6bVMkRmhFeTvFKtDSLjT7nefc2YiFovqQ@mail.gmail.com>
 <CAAFQd5AYCiKcA9pGc44L3gGHLPx6iMSb7KywkO8OqVv4gS8KvQ@mail.gmail.com>
 <CAAFQd5AQXGX_2gmKLfymH5mLG-uVh-v+XXtGXzbfzYzVVV42mA@mail.gmail.com>
 <HE1PR06MB4011B897EA5497659A19BCC6AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <HE1PR06MB4011D0189027292BD1107CAFAC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011D0189027292BD1107CAFAC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 10 Oct 2019 16:27:56 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C4nH1YmrWy3b281By2ER=SCMYu6NqE=ObAgrq4Kg+yxg@mail.gmail.com>
Message-ID: <CAAFQd5C4nH1YmrWy3b281By2ER=SCMYu6NqE=ObAgrq4Kg+yxg@mail.gmail.com>
Subject: Re: [PATCH v2 for 5.4 2/4] media: hantro: Fix H264 max frmsize
 supported on RK3288
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     "fbuergisser@chromium.org" <fbuergisser@chromium.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 9, 2019 at 5:39 AM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> On 2019-10-08 16:12, Jonas Karlman wrote:
> > On 2019-10-08 15:53, Tomasz Figa wrote:
> >> On Tue, Oct 8, 2019 at 10:35 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >>> On Tue, Oct 8, 2019 at 7:42 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >>>> On Tue, Oct 8, 2019 at 3:31 PM Jonas Karlman <jonas@kwiboo.se> wrote:
> >>>>> On 2019-10-08 07:27, Tomasz Figa wrote:
> >>>>>> Hi Ezequiel, Jonas,
> >>>>>>
> >>>>>> On Tue, Oct 8, 2019 at 2:46 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> >>>>>>> From: Jonas Karlman <jonas@kwiboo.se>
> >>>>>>>
> >>>>>>> TRM specify supported image size 48x48 to 4096x2304 at step size 16 pixels,
> >>>>>>> change frmsize max_width/max_height to match TRM.
> >>>>>>>
> >>>>>>> Fixes: 760327930e10 ("media: hantro: Enable H264 decoding on rk3288")
> >>>>>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> >>>>>>> ---
> >>>>>>> v2:
> >>>>>>> * No changes.
> >>>>>>>
> >>>>>>>  drivers/staging/media/hantro/rk3288_vpu_hw.c | 4 ++--
> >>>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> >>>>>>> index 6bfcc47d1e58..ebb017b8a334 100644
> >>>>>>> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
> >>>>>>> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> >>>>>>> @@ -67,10 +67,10 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
> >>>>>>>                 .max_depth = 2,
> >>>>>>>                 .frmsize = {
> >>>>>>>                         .min_width = 48,
> >>>>>>> -                       .max_width = 3840,
> >>>>>>> +                       .max_width = 4096,
> >>>>>>>                         .step_width = H264_MB_DIM,
> >>>>>>>                         .min_height = 48,
> >>>>>>> -                       .max_height = 2160,
> >>>>>>> +                       .max_height = 2304,
> >>>>>> This doesn't match the datasheet I have, which is RK3288 Datasheet Rev
> >>>>>> 1.4 and which has the values as in current code. What's the one you
> >>>>>> got the values from?
> >>>>> The RK3288 TRM vcodec chapter from [1], unknown revision and date, lists 48x48 to 4096x2304 step size 16 pixels under 25.5.1 H.264 decoder.
> >>>>>
> >>>>> I can also confirm that one of my test samples (PUPPIES BATH IN 4K) is 4096x2304 and can be decoded after this patch.
> >>>>> However the decoding speed is not optimal at 400Mhz, if I recall correctly you need to set the VPU1 clock to 600Mhz for 4K decoding on RK3288.
> >>>>>
> >>>>> I am not sure if I should include a v2 of this patch in my v2 series, as-is this patch do not apply on master (H264_MB_DIM has changed to MB_DIM in master).
> >>>>>
> >>>>> [1] http://www.t-firefly.com/download/firefly-rk3288/docs/TRM/rk3288-chapter-25-video-encoder-decoder-unit-(vcodec).pdf
> >>>> I checked the RK3288 TRM V1.1 too and it refers to 3840x2160@24fps as
> >>>> the maximum.
> >>>>
> >>>> As for performance, we've actually been getting around 33 fps at 400
> >>>> MHz with 3840x2160 on our devices (the old RK3288 Asus Chromebook
> >>>> Flip).
> >>>>
> >>>> I guess we might want to check that with Hantro.
> >>> Could you check the value of bits 10:0 in register at 0x0c8? That
> >>> should be the maximum supported stream width in the units of 16
> >>> pixels.
> >> Correction: The unit is 1 pixel and there are additional 2 most
> >> significant bits at 0x0d8, 15:14.
> > I will check this later tonight when I have access to my devices.
>
> My Asus Tinker Board S (RK3288-C) is reporting support for 0x780 / 1920 pixels:
>
> 0x000  (0) = 0x67313688
> 0x0c8 (50) = 0xfbb56f80
> 0x0d8 (54) = 0xe5da0000
>

Looks like that register doesn't work very well in Rockchip's
implementation... Thanks for checking anyway.

I guess we can allow 4096x2304 for the time being and see what happens.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
