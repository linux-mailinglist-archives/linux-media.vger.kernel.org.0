Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9D3ED0FC
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 00:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbfKBXLM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Nov 2019 19:11:12 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:42912 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbfKBXLM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Nov 2019 19:11:12 -0400
Received: by mail-vk1-f196.google.com with SMTP id r4so3009028vkf.9
        for <linux-media@vger.kernel.org>; Sat, 02 Nov 2019 16:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WhCdznOj6/CiJO2ZBCw5MTKrC7FAnR3U/9q/Xf0fYOs=;
        b=kPUhMy2b6zicwiCWrkHkenmU0jmo3gGF9Bs0Rmn4DTL1JrEavSguW0xAkZu7JYTk9d
         ek8IxOBEjODgpTz1wIDnSHvaHaYUg2acex+4pJ64rJ2OrsvwI2ydLGnxtEupPtUw1+Op
         NHeebKZLXWzDwgz8vud03b/98T/DrLKeDYY0V1bxaGpxgT4K+ee0JK5Z8DSnDGxp+/Mr
         5tt+07jMW35wji3rbSAxYpL7GQxqhd0NjK0YBdE4VDw6LYdM2hjOrYGRD7h+PTYte0bA
         7X0LiXwU+ZHiOa6xm09fMo8Up/hOYKjdmaNSoJ0nlDpVunAzKaGDXruwrcQr9vK9fn2M
         H/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WhCdznOj6/CiJO2ZBCw5MTKrC7FAnR3U/9q/Xf0fYOs=;
        b=OjtvoVv4AdvPuF2Hd4SUiezW32B94e7dmhD/1Sx99voePAJgm45/1hIo4JzFTHJCO+
         CkgDxJNrT4c8PLjuXDBmWeBKHAGL3KkEVNILKZeBkV6MNXkbJUVMUwU/QOV/CAqajnxQ
         Wx6DXIpduElZqTX5n21AJyK+lttk23X7qhUJR6GNvzhyj9/k3k4VbPLlo6GPGmBx1T4i
         TuAi5F3R5c4skSKzbtIfNM3NQqommNGCn4PQnJhTiQ0D7hZLZmz3su2TtdcxAyqoCMCU
         NCKs3AR2v9zEhoLCQMW5/L0GUTTLRMx3F3V/yBgmlzlFTewQ+lT/NEqDmr/qqNKr8c+X
         jGew==
X-Gm-Message-State: APjAAAWzsmT7xPiUNuVu0zplo7OaYQJjmR+FKyNJEi15P1s6kLFOP9/G
        +1QRBETZS1cRDFo36/KnlrgHo89QdhKXikryBbS6jA==
X-Google-Smtp-Source: APXvYqxJIcBiWVIk3ADbBtcrMcyxqe+BG4gUSg3SVRb9JK1xia4TWPS+eTtJs0k4OCYjK3nQfFB2IOa9/ZZZnGycrdg=
X-Received: by 2002:a1f:2f51:: with SMTP id v78mr8770374vkv.101.1572736270640;
 Sat, 02 Nov 2019 16:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191029012430.24566-1-jonas@kwiboo.se> <HE1PR06MB40116FEF3EBE4706E426A5FFAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAEAJfCjUe=V8Sqj2Yqy-Su7iE=ptFDz40vg92bYqUS8XrE73w@mail.gmail.com>
In-Reply-To: <CAAEAJfCjUe=V8Sqj2Yqy-Su7iE=ptFDz40vg92bYqUS8XrE73w@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 3 Nov 2019 00:10:59 +0100
Message-ID: <CAAEAJfDrNf+a03rJ-YnhPugDLb4a-1BJmNYDboMfXP_R8n23Eg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] media: hantro: Fix motion vectors usage condition
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Francois Buergisser <fbuergisser@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 3 Nov 2019 at 00:09, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> On Tue, 29 Oct 2019 at 02:25, Jonas Karlman <jonas@kwiboo.se> wrote:
> >
> > From: Francois Buergisser <fbuergisser@chromium.org>
> >
> > The setting of the motion vectors usage and the setting of motion
> > vectors address are currently done under different conditions.
> >
> > When decoding pre-recorded videos, this results of leaving the motion
> > vectors address unset, resulting in faulty memory accesses. Fix it
> > by using the same condition everywhere, which matches the profiles
> > that support motion vectors.
> >
> > Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
> > Signed-off-by: Francois Buergisser <fbuergisser@chromium.org>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > ---
> >  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > index 29130946dea4..a1cb18680200 100644
> > --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > @@ -35,7 +35,7 @@ static void set_params(struct hantro_ctx *ctx)
> >         if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
> >                 reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
> >         reg |= G1_REG_DEC_CTRL0_PICORD_COUNT_E;
> > -       if (dec_param->nal_ref_idc)
> > +       if (sps->profile_idc > 66 && dec_param->nal_ref_idc)
> >                 reg |= G1_REG_DEC_CTRL0_WRITE_MVS_E;
> >
> >         if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
> > @@ -245,7 +245,7 @@ static void set_buffers(struct hantro_ctx *ctx)
> >         vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
> >
> >         /* Higher profiles require DMV buffer appended to reference frames. */
> > -       if (ctrls->sps->profile_idc > 66) {
> > +       if (ctrls->sps->profile_idc > 66 && ctrls->decode->nal_ref_idc) {
>
> How about a one-line function (purposely not a macro,
> to have type-checking) ? I think this should emphasize the fact that
> the condition
> needs to be the same.
>

Oops, just saw the next patch. Nevermind.
