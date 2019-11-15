Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 320E2FD462
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 06:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfKOFbh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 00:31:37 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42728 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbfKOFbh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 00:31:37 -0500
Received: by mail-oi1-f195.google.com with SMTP id i185so7601387oif.9
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2019 21:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MCNN5DQiyUg5unIl3TP6bO/3H28cldcBiZgTEqQ4VpQ=;
        b=lzfPUgurpjNSGJpH2QGHtyjA1g1ga7AIKylE5tDvoaoFRzkNuuoAO6yFdQ2UZzrmWc
         MUOmA3AGNN+JLkcvThQPQ+kcDNiPUwjIcYRdoxWt7FA8Q3QI8FeYKef/2UBGa1vOcALR
         YIuAc5jKP2Dzql84qKUm09Trwc6w8B/lV2ZiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MCNN5DQiyUg5unIl3TP6bO/3H28cldcBiZgTEqQ4VpQ=;
        b=bLtt0wiFZkc8osQvDtq58/0PXg3odF366A02xHHt4xrs+L+5beVKlVYwb+WXrxX58t
         J77QiiHz0HM0IsNHkUTOx8d1PWamwFZg6RYOETabXJ00Sk92nIS64qcmm0rEdhW0Jewb
         Ouf0/KIwJOyfIQgotnncUnfGcG3q5xYEM4HecNRmk/0SfLFQJ8Ybtu+/0v3wvQJVqD6C
         9hY1dbDuAydLW/5SWP/XtByTu+DdJsconSLBdzaccnUANr/vUXdJhif4214gz+4mBJZP
         myvM4p+OV65JZZ7M5ZD6bI1Vsigd0PvE50HaAmzXe+VHpAT/ioOu/PBSw7zAHGsTS1cI
         4SSQ==
X-Gm-Message-State: APjAAAV+dVo+f7gGfq2VNThaylCLBbZITsHX214a3dcDwAj+w3O0n9Wd
        LQ6z0i46nDSnc7NB8OIPUIpVRxFUeg0=
X-Google-Smtp-Source: APXvYqxdTsoG5I851C2z0pyOMqABoAosOo4DzdU/xWyigrGDW5EYaPu133KPgHJG8VK5JbHfBwv2Mg==
X-Received: by 2002:aca:f553:: with SMTP id t80mr6417884oih.60.1573795895538;
        Thu, 14 Nov 2019 21:31:35 -0800 (PST)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 94sm2598663otx.3.2019.11.14.21.31.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 21:31:34 -0800 (PST)
Received: by mail-oi1-f182.google.com with SMTP id s71so7569211oih.11
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2019 21:31:34 -0800 (PST)
X-Received: by 2002:a54:4e85:: with SMTP id c5mr6371256oiy.71.1573795893946;
 Thu, 14 Nov 2019 21:31:33 -0800 (PST)
MIME-Version: 1.0
References: <20191115035013.145152-1-acourbot@chromium.org> <20191115053630.129b473b@collabora.com>
In-Reply-To: <20191115053630.129b473b@collabora.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 15 Nov 2019 14:31:22 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXa_9Ji5TwEF-HqPRO5JFG9HU1VDDGJdk-+Smczg0RHZA@mail.gmail.com>
Message-ID: <CAPBb6MXa_9Ji5TwEF-HqPRO5JFG9HU1VDDGJdk-+Smczg0RHZA@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: make update_dpb() not leave holes in DPB
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 15, 2019 at 1:36 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Hi Alexandre,
>
> On Fri, 15 Nov 2019 12:50:13 +0900
> Alexandre Courbot <acourbot@chromium.org> wrote:
>
> > update_dpb() reorders the DPB entries such as the same frame in two
> > consecutive decoding requests always ends up in the same DPB slot.
> >
> > It first clears all the active flags in the DPB, and then checks whether
> > the active flag is not set to decide whether an entry is a candidate for
> > matching or not.
> >
> > However, this means that unused DPB entries are also candidates for
> > matching, and an unused entry will match if we are testing it against a
> > frame which (TopFieldOrderCount, BottomFieldOrderCount) is (0, 0).
>
> Hm, I might be wrong but I thought we were supposed to re-use matching
> entries even if the ref was not active on the last decoded frame. IIRC,
> a ref can be active on specific decoding request (X), then inactive on
> the next one (X+1) and active again on the following one (X+2).
> Shouldn't we re-use the slot we used when decoding X for this ref when
> decoding X+2?

I am not sure how often this happens in practice (if at all), but
maybe this logic would work as well. In this case we would need to
mark DPB entries that are not used yet differently to avoid the issue
that this patch attempts to fix.

To give a precise example of the issue, for a stream that only uses 3
DPB entries at max, after an IDR frame the 4th DPB entry will
incorrectly be matched with the IDR frame of FieldOrderCount (0, 0)
and be the only active entry for this frame. Hantro is ok with it, but
this is not an optimal use of the DPB and MT8183 does not like that.

>
> >
> > As it turns out, this happens for the very first frame of a stream, but
> > it is not a problem as it would be copied to the first entry anyway.
> > More concerning is that after an IDR frame the Top/BottomFieldOrderCount
> > can be reset to 0, and this time update_dpb() will match the IDR frame
> > to the first unused entry of the DPB (and not the entry at index 0 as
> > would be expected) because the first slots will have different values.
>
> We could also consider resetting the DPB cache on IDR frames if that
> works on Hantro.

Maybe that could be enough indeed. Let me experiment with that a bit.
I believe this would work since in practice the result would be the
same as this patch, but for safety I'd rather have unused DPB entries
be unambiguously identified rather than letting the (0, 0) match do
the right thing by accident.

>
> >
> > The Hantro driver is ok with this, but when trying to use the same
> > function for another driver (MT8183) I noticed decoding artefacts caused
> > by this hole in the DPB.
>
> I guess this new version passes the chromium testsuite on rk-based
> boards. If that's the case I don't have any objection to this patch.
>
> Note that I was not planning to share the DPB caching logic as I
> thought only Hantro G1 needed that trick. Have you tried passing the
> DPB directly? Maybe it just works on mtk.

Passing the DPB directly I get corrupted frames on a regular basis
with MTK. I also confirmed that the firmware's expectations are what
this function does. Using the same function in the MTK driver, the
decoded stream is flawless.

>
> >
> > Fix this by maintaining a list of DPB slots that are actually in use,
> > instead of relying on the absence of the active flag to do so. This also
> > allows us to optimize matching a bit.
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  drivers/staging/media/hantro/hantro_h264.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
> > index 568640eab3a6..2357068b0f82 100644
> > --- a/drivers/staging/media/hantro/hantro_h264.c
> > +++ b/drivers/staging/media/hantro/hantro_h264.c
> > @@ -474,14 +474,19 @@ static void update_dpb(struct hantro_ctx *ctx)
> >  {
> >       const struct v4l2_ctrl_h264_decode_params *dec_param;
> >       DECLARE_BITMAP(new, ARRAY_SIZE(dec_param->dpb)) = { 0, };
> > +     DECLARE_BITMAP(in_use, ARRAY_SIZE(dec_param->dpb)) = { 0, };
> >       DECLARE_BITMAP(used, ARRAY_SIZE(dec_param->dpb)) = { 0, };
> >       unsigned int i, j;
> >
> >       dec_param = ctx->h264_dec.ctrls.decode;
> >
> > -     /* Disable all entries by default. */
> > -     for (i = 0; i < ARRAY_SIZE(ctx->h264_dec.dpb); i++)
> > +     /* Mark entries in use before disabling them. */
> > +     for (i = 0; i < ARRAY_SIZE(ctx->h264_dec.dpb); i++) {
> > +             if (ctx->h264_dec.dpb[i].flags &
> > +                 V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
> > +                     set_bit(i, in_use);
> >               ctx->h264_dec.dpb[i].flags &= ~V4L2_H264_DPB_ENTRY_FLAG_ACTIVE;
> > +     }
> >
> >       /* Try to match new DPB entries with existing ones by their POCs. */
> >       for (i = 0; i < ARRAY_SIZE(dec_param->dpb); i++) {
> > @@ -492,18 +497,19 @@ static void update_dpb(struct hantro_ctx *ctx)
> >
> >               /*
> >                * To cut off some comparisons, iterate only on target DPB
> > -              * entries which are not used yet.
> > +              * entries which are already used.
> >                */
> > -             for_each_clear_bit(j, used, ARRAY_SIZE(ctx->h264_dec.dpb)) {
> > +             for_each_set_bit(j, in_use, ARRAY_SIZE(ctx->h264_dec.dpb)) {
> >                       struct v4l2_h264_dpb_entry *cdpb;
> >
> >                       cdpb = &ctx->h264_dec.dpb[j];
> > -                     if (cdpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE ||
> > -                         !dpb_entry_match(cdpb, ndpb))
> > +                     if (!dpb_entry_match(cdpb, ndpb))
> >                               continue;
> >
> >                       *cdpb = *ndpb;
> >                       set_bit(j, used);
> > +                     /* Don't reiterate on this one. */
> > +                     clear_bit(j, in_use);
> >                       break;
> >               }
> >
>
