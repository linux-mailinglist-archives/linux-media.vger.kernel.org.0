Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A653113D2EF
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2020 04:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730071AbgAPD4S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 22:56:18 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39454 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbgAPD4S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 22:56:18 -0500
Received: by mail-ed1-f66.google.com with SMTP id t17so17629664eds.6
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2020 19:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PD6zdpRIP8Vi2FKz5I9i6BS4RJGaiRXuBmZIDbNDHA8=;
        b=ThNG7h2yPe4UfpOLJJHQW3e5+Qc/HqFyihH3PIkLD+54QGjVJZvc2/nsKO766jQI9g
         5famgfb9ABU5gfBsTrg4zzszF5hHJe9e4hLS7WovHqYypop2EH/j4V3aH9dVkXJe4XOg
         HFwSSXrRph2P3Nzo2C2623uQ4Oxp6H1LSxadY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PD6zdpRIP8Vi2FKz5I9i6BS4RJGaiRXuBmZIDbNDHA8=;
        b=su2lD9pHzxhie6nI8gcAtXApr33q+MuVM/MMt4wfH3GGdAeoGitNgTmWKsq5Oz97nP
         q9qRBeuGjRHI6yxDUtDGotxs69dYqZ9NjtR9L3PjPX4uBl4Wz4p2sQ+yBmPea4AzXSHT
         2FnLd/JcABf76kCNGGvWAVuSghYOOn5kU612L8qBgRAFrDUvckjopykMldj+VaWh9x/2
         NzWwwO1Gid+kl5oioMOIDb9zmn5nAhWoYlbNT26KCKV3aCsh0X2SzDskY0merUX1TRk/
         /CjYvAGaDJ5bv3OG9aCmAwgXms5/Yj4k0diouIjhiG/uSTwzV36vRL7J84K97Wy79WPy
         MzaA==
X-Gm-Message-State: APjAAAX1p4s9uSH16Z7GjL1HEBLrWY6pUzEitwIIFTIiNG9mPOfEb2zx
        9PHQsLYp6sdD4zLivARKK3tSchOVPSVsCQ==
X-Google-Smtp-Source: APXvYqwj6jrvv07BKdbgspD1ypVZlZ3aF9FhRJnIGksw7Ha0scsJI2aYP808Sm6+ACSCCcy341lYeg==
X-Received: by 2002:a50:ed0a:: with SMTP id j10mr33534698eds.215.1579146975736;
        Wed, 15 Jan 2020 19:56:15 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id x3sm777175edr.72.2020.01.15.19.56.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 19:56:14 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id y11so17693958wrt.6
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2020 19:56:14 -0800 (PST)
X-Received: by 2002:adf:f803:: with SMTP id s3mr741232wrp.7.1579146973778;
 Wed, 15 Jan 2020 19:56:13 -0800 (PST)
MIME-Version: 1.0
References: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191106223408.2176-1-jonas@kwiboo.se> <HE1PR06MB4011FF930111A869E4645C8CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAFQd5CSWea=DNjySJxZmVi+2c5U4EKVPa1mf3vHh70+YrAQCA@mail.gmail.com>
 <7b92111b0c6443653de45f1eeec867645c127f32.camel@collabora.com>
 <CAAFQd5CZo5g2gtuvU+OuoRj18ZcCH8XEinGyAjRxqUXRfSQhgg@mail.gmail.com> <9606106c-5c49-cbc1-cb8f-0389ff8281bd@kwiboo.se>
In-Reply-To: <9606106c-5c49-cbc1-cb8f-0389ff8281bd@kwiboo.se>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 16 Jan 2020 12:56:02 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DMVKH_f6nTohw_7LpLAYNWOv=fN77S_sLPPmYZwskosA@mail.gmail.com>
Message-ID: <CAAFQd5DMVKH_f6nTohw_7LpLAYNWOv=fN77S_sLPPmYZwskosA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] media: hantro: Reduce H264 extra space for motion vectors
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 9, 2020 at 12:10 AM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> On 2020-01-08 13:59, Tomasz Figa wrote:
> > On Tue, Dec 10, 2019 at 3:11 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> >>
> >> On Wed, 2019-11-20 at 21:44 +0900, Tomasz Figa wrote:
> >>> Hi Jonas,
> >>>
> >>> On Thu, Nov 7, 2019 at 7:34 AM Jonas Karlman <jonas@kwiboo.se> wrote:
> >>>> A decoded 8-bit 4:2:0 frame need memory for up to 448 bytes per
> >>>> macroblock with additional 32 bytes on multi-core variants.
> >>>>
> >>>> Memory layout is as follow:
> >>>>
> >>>> +---------------------------+
> >>>>> Y-plane   256 bytes x MBs |
> >>>> +---------------------------+
> >>>>> UV-plane  128 bytes x MBs |
> >>>> +---------------------------+
> >>>>> MV buffer  64 bytes x MBs |
> >>>> +---------------------------+
> >>>>> MC sync          32 bytes |
> >>>> +---------------------------+
> >>>>
> >>>> Reduce the extra space allocated now that motion vector buffer offset no
> >>>> longer is based on the extra space.
> >>>>
> >>>> Only allocate extra space for 64 bytes x MBs of motion vector buffer
> >>>> and 32 bytes for multi-core sync.
> >>>>
> >>>> Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
> >>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> >>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>>> ---
> >>>> Changes in v3:
> >>>>   - add memory layout to code comment (Boris)
> >>>> Changes in v2:
> >>>>   - updated commit message
> >>>> ---
> >>>>  drivers/staging/media/hantro/hantro_v4l2.c | 20 ++++++++++++++++++--
> >>>>  1 file changed, 18 insertions(+), 2 deletions(-)
> >>>>
> >>>
> >>> Thanks for the patch!
> >>>
> >>> What platform did you test it on and how? Was it tested with IOMMU enabled?
> >>
> >> Hello Tomasz,
> >>
> >> Please note that this series has been picked-up and is merged
> >> in v5.5-rc1.
> >>
> >> IIRC, we tested these patches on RK3399 and RK3288 (that means
> >> with an IOMMU). I've just ran some more extensive tests on RK3288,
> >> on media/master; and I plan to test some more on RK3399 later this week.
> >>
> >> Do you have any specific concern in mind?
> >
> > I specifically want to know whether we're 100% sure that those sizes
> > are correct. The IOMMU still works on page granularity so it's
> > possible that the allocation could be just big enough by luck.
>
> One of my RK3288 TRM [1] contains the following:
>
> Direct mode motion vector write:
>   Its base addr is right after decode output picture data
>   Its length is mbwidth*mbheight*64
>
> Also both the mpp library and imx-vpu-hantro code both use mbwidth*mbheight*64.
> So I feel confident that the buffer size is correct.
>
> [1] Rockchip RK3288TRM V1.1 Part3-Graphic and multi-media.pdf

Fair enough. Thanks!

Best regards,
Tomasz
