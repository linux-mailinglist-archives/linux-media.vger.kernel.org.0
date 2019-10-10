Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2EE3D21D1
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 09:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfJJHiI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 03:38:08 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42843 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733074AbfJJHYO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 03:24:14 -0400
Received: by mail-ed1-f67.google.com with SMTP id y91so4477352ede.9
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2019 00:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q3z5xsYuGI9Tu3hogsHQpREAbRY7gTtghNiSpU/J3oU=;
        b=aTpMvin4UR3Y+GqBZUEXUSlE/N1e1h/5CeUiSTAjWqPoyNYd3yCMpw52TAVTtJr7Rp
         H8O9IkcLedmQ5rU4UP+iCw0WxO9d6J8HB6QjuHy172SJ7kJjHHgQ9kWEHGOldZNpvJ6o
         +W3XDpcK0uPJ3Kpk+QRcObX/aRSzQdGq5OB6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q3z5xsYuGI9Tu3hogsHQpREAbRY7gTtghNiSpU/J3oU=;
        b=BLpu8rUSI1G0wf3EpA3acWhzjRgaCKtRVnwG2w5epqqv3nNg3tRH3YFGVYBO2qubz9
         re4vZDRDIE5LJaNtH1OTlh0ZLk2Tlrp3gu55ub59JmuKz+GmDwpquZfLfW2k1s0Sy4m1
         D6dxcM+aylN6WklqP0vTmSV3y41K1Yts4YJ9Yhxu5S8sIxabd6uQNby8lsGW+xpJ3AA/
         5d9GOlhAwLX+S6NLobCLvnq+G5olLuAkLC6cjqryFfJSqPU5dvUyL19WqM4ds2Wen+X+
         MWBPWnbYuzITpdtn9j0fQxGL9CNHbLYq2EnnecwQ7aqy/L/8iDHL5Mg87nW90RbzWJzK
         +uQg==
X-Gm-Message-State: APjAAAVuZH+nRG4BlFSh6WY+mLORO2eV467T7W4tQLckwgr4zFq/I4JC
        BLXqqwNmtyOSQDtq2qg4cFxGojILBteStA==
X-Google-Smtp-Source: APXvYqwhkQ3/ICk+46YFzwGYBIJhjqNWoAW7ciPkzV0aempH9lK1isaHeUC74HQlCy0uUGvKprMU6Q==
X-Received: by 2002:a17:906:b6c6:: with SMTP id ec6mr6796746ejb.54.1570692250479;
        Thu, 10 Oct 2019 00:24:10 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id jo12sm576538ejb.7.2019.10.10.00.24.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2019 00:24:09 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id y135so6438269wmc.1
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2019 00:24:09 -0700 (PDT)
X-Received: by 2002:a1c:2e50:: with SMTP id u77mr6698598wmu.64.1570692248666;
 Thu, 10 Oct 2019 00:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-3-ezequiel@collabora.com> <CAAFQd5BNu2ea3ei_imHmEwmdna0+iiSbQSv_SBsdHfP4Uh1h4Q@mail.gmail.com>
 <HE1PR06MB4011EC9E93ECBB6773252247AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAFQd5CWoAP1psrEW6bVMkRmhFeTvFKtDSLjT7nefc2YiFovqQ@mail.gmail.com>
 <CAAFQd5AYCiKcA9pGc44L3gGHLPx6iMSb7KywkO8OqVv4gS8KvQ@mail.gmail.com>
 <CAAFQd5AQXGX_2gmKLfymH5mLG-uVh-v+XXtGXzbfzYzVVV42mA@mail.gmail.com> <HE1PR06MB4011B897EA5497659A19BCC6AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011B897EA5497659A19BCC6AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 10 Oct 2019 16:23:56 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DEhHF+_oO_0ZKS1mi26hJ-JueFxXfdpyQ3ATzMW5Czaw@mail.gmail.com>
Message-ID: <CAAFQd5DEhHF+_oO_0ZKS1mi26hJ-JueFxXfdpyQ3ATzMW5Czaw@mail.gmail.com>
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

On Tue, Oct 8, 2019 at 11:12 PM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> On 2019-10-08 15:53, Tomasz Figa wrote:
> > On Tue, Oct 8, 2019 at 10:35 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >> On Tue, Oct 8, 2019 at 7:42 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >>> On Tue, Oct 8, 2019 at 3:31 PM Jonas Karlman <jonas@kwiboo.se> wrote:
> >>>> On 2019-10-08 07:27, Tomasz Figa wrote:
> >>>>> Hi Ezequiel, Jonas,
> >>>>>
> >>>>> On Tue, Oct 8, 2019 at 2:46 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> >>>>>> From: Jonas Karlman <jonas@kwiboo.se>
> >>>>>>
> >>>>>> TRM specify supported image size 48x48 to 4096x2304 at step size 16 pixels,
> >>>>>> change frmsize max_width/max_height to match TRM.
> >>>>>>
> >>>>>> Fixes: 760327930e10 ("media: hantro: Enable H264 decoding on rk3288")
> >>>>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> >>>>>> ---
> >>>>>> v2:
> >>>>>> * No changes.
> >>>>>>
> >>>>>>  drivers/staging/media/hantro/rk3288_vpu_hw.c | 4 ++--
> >>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> >>>>>> index 6bfcc47d1e58..ebb017b8a334 100644
> >>>>>> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
> >>>>>> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> >>>>>> @@ -67,10 +67,10 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
> >>>>>>                 .max_depth = 2,
> >>>>>>                 .frmsize = {
> >>>>>>                         .min_width = 48,
> >>>>>> -                       .max_width = 3840,
> >>>>>> +                       .max_width = 4096,
> >>>>>>                         .step_width = H264_MB_DIM,
> >>>>>>                         .min_height = 48,
> >>>>>> -                       .max_height = 2160,
> >>>>>> +                       .max_height = 2304,
> >>>>> This doesn't match the datasheet I have, which is RK3288 Datasheet Rev
> >>>>> 1.4 and which has the values as in current code. What's the one you
> >>>>> got the values from?
> >>>> The RK3288 TRM vcodec chapter from [1], unknown revision and date, lists 48x48 to 4096x2304 step size 16 pixels under 25.5.1 H.264 decoder.
> >>>>
> >>>> I can also confirm that one of my test samples (PUPPIES BATH IN 4K) is 4096x2304 and can be decoded after this patch.
> >>>> However the decoding speed is not optimal at 400Mhz, if I recall correctly you need to set the VPU1 clock to 600Mhz for 4K decoding on RK3288.
> >>>>
> >>>> I am not sure if I should include a v2 of this patch in my v2 series, as-is this patch do not apply on master (H264_MB_DIM has changed to MB_DIM in master).
> >>>>
> >>>> [1] http://www.t-firefly.com/download/firefly-rk3288/docs/TRM/rk3288-chapter-25-video-encoder-decoder-unit-(vcodec).pdf
> >>> I checked the RK3288 TRM V1.1 too and it refers to 3840x2160@24fps as
> >>> the maximum.
> >>>
> >>> As for performance, we've actually been getting around 33 fps at 400
> >>> MHz with 3840x2160 on our devices (the old RK3288 Asus Chromebook
> >>> Flip).
> >>>
> >>> I guess we might want to check that with Hantro.
> >> Could you check the value of bits 10:0 in register at 0x0c8? That
> >> should be the maximum supported stream width in the units of 16
> >> pixels.
> > Correction: The unit is 1 pixel and there are additional 2 most
> > significant bits at 0x0d8, 15:14.
>
> I will check this later tonight when I have access to my devices.
> The PUPPIES BATH IN 4K (4096x2304) sample decoded without issue using rockchip 4.4 BSP kernel and mpp last time I tested.
>
> The vcodec driver in 4.4 BSP kernel use 300/400 Mhz as default clock rate and will change to 600 Mhz when width is over 2560, see [1]:
>   raise frequency for resolution larger than 1440p avc
>
> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.4/drivers/video/rockchip/vcodec/vcodec_service.c#L2551-L2570

How comes it works for us well at 400 MHz? Better DRAM? Differences in
how Vcodec BSP handles the hardware that somehow make the decoding
slower?

Best regards,
Tomasz
