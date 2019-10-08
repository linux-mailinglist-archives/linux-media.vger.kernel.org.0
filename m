Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F482CF140
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 05:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729965AbfJHD3k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 23:29:40 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46849 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729860AbfJHD3i (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 23:29:38 -0400
Received: by mail-ed1-f65.google.com with SMTP id t3so14284873edw.13
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 20:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EvafDVJviid1Lod+sDu0bEw60oGKxGZ5GVF0o7ApXbk=;
        b=Bqopbd1fSDtzVkQJrSaKPt8f5oWAzVJy4oUD3Au2A8ZU2xbsPXki7QEQ6F8ZTZSZHz
         V2zz9TR2KCF5Ma3jlofSqdC+ChNfxdcaa07+hMltQlqqZRRE21I+gpOzAJJLkuhBAzq5
         rZ5Z0ip3O/EYiXMt0uDz40T+TuPpnGDBil6u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EvafDVJviid1Lod+sDu0bEw60oGKxGZ5GVF0o7ApXbk=;
        b=QGz0/BN++Rcmn183BrodMrfWmPbyrNyIEYsTKYil/6+mb0Pzyh5pMwV4mLNhobwvVo
         nWGU4RQ2/R+L/skNcbRhkYtWKAYagGY1967APFFumHH0RjsCrQW7SfVswUARfgaq4q/Z
         wq/1PY4O0Z3iaWx2P71Kip630zKNPdtmADLtar+o0JEfdC61g1V5Buk2HzBdeGts3v04
         27cbLuWHWAhTcV0WwzwcGb2trvhCMbekX3hVW+Aqb1tamn76BipmkXs0nnBdj5YZnsjp
         H7VtDFAiYBCK7MWZltBzG9RWjmurY/9wDIrJVvEXFvW9DaDbaCAuvp70kuauBXrfcQ1H
         Lz4A==
X-Gm-Message-State: APjAAAVpUmHMGtEFwqvj/dMcmg4VRFBrEr5+FdNi8XVSv/+oAAoTXdS9
        g5cMoxlCnGPB489YrPolgLkBMqvwoJKs+Q==
X-Google-Smtp-Source: APXvYqya8mCPaKu5txruoniJLnYZEvDruCead87H4AJm6YDjIZGE8MxbtezYW5eLyOviU96xSm7Dag==
X-Received: by 2002:a17:906:b742:: with SMTP id fx2mr27079878ejb.205.1570505375917;
        Mon, 07 Oct 2019 20:29:35 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id f15sm62308ejy.82.2019.10.07.20.29.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2019 20:29:34 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id y21so1492676wmi.0
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 20:29:34 -0700 (PDT)
X-Received: by 2002:a1c:a516:: with SMTP id o22mr1979936wme.116.1570505374139;
 Mon, 07 Oct 2019 20:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-4-ezequiel@collabora.com> <HE1PR06MB4011204B3FC2DAABB4BD1BACAC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011204B3FC2DAABB4BD1BACAC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 8 Oct 2019 12:29:22 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BEPO3nicr1PzRNWoVEzsvKvv5AkqoMVh2AG7qST+bZdA@mail.gmail.com>
Message-ID: <CAAFQd5BEPO3nicr1PzRNWoVEzsvKvv5AkqoMVh2AG7qST+bZdA@mail.gmail.com>
Subject: Re: [PATCH v2 for 5.4 3/4] media: hantro: Fix motion vectors usage condition
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        "fbuergisser@chromium.org" <fbuergisser@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonas,

On Tue, Oct 8, 2019 at 3:33 AM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> On 2019-10-07 19:45, Ezequiel Garcia wrote:
> > From: Francois Buergisser <fbuergisser@chromium.org>
> >
> > The setting of the motion vectors usage and the setting of motion
> > vectors address are currently done under different conditions.
> >
> > When decoding pre-recorded videos, this results of leaving the motion
> > vectors address unset, resulting in faulty memory accesses. Fix it
> > by using the same condition everywhere, which matches the profiles
> > that support motion vectors.
>
> This does not fully match hantro sdk:
>
>   enable direct MV writing and POC tables for high/main streams.
>   enable it also for any "baseline" stream which have main/high tools enabled.
>
>   (sps->profile_idc > 66 && sps->constrained_set0_flag == 0) ||
>   sps->frame_mbs_only_flag != 1 ||
>   sps->chroma_format_idc != 1 ||
>   sps->scaling_matrix_present_flag != 0 ||
>   pps->entropy_coding_mode_flag != 0 ||
>   pps->weighted_pred_flag != 0 ||
>   pps->weighted_bi_pred_idc != 0 ||
>   pps->transform8x8_flag != 0 ||
>   pps->scaling_matrix_present_flag != 0

Thanks for double checking this. I can confirm that it's what Hantro
SDK does indeed.

However, would a stream with sps->profile_idc <= 66 and those other
conditions met be still a compliant stream?

>
> Above check is used when DIR_MV_BASE should be written.
> And WRITE_MVS_E is set to nal_ref_idc != 0 when above is true.
>
> I think it may be safer to always set DIR_MV_BASE and keep the existing nal_ref_idc check for WRITE_MVS_E.

That might have a performance penalty or some other side effects,
though. Otherwise Hantro SDK wouldn't have enable it conditionally.

> (That is what I did in my "media: hantro: H264 fixes and improvements" series, v2 is incoming)
> Or have you found any video that is having issues in such case?

We've been running the code with sps->profile_idc > 66 in production
for 4 years and haven't seen any reports of a stream that wasn't
decoded correctly.

If we decide to go with a different behavior, I'd suggest thoroughly
verifying the behavior on a big number of streams, including some
performance measurements.

Best regards,
Tomasz

>
> Regards,
> Jonas
>
> >
> > Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
> > Signed-off-by: Francois Buergisser <fbuergisser@chromium.org>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> > v2:
> > * New patch.
> >
> >  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > index 7ab534936843..c92460407613 100644
> > --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > @@ -35,7 +35,7 @@ static void set_params(struct hantro_ctx *ctx)
> >       if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
> >               reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
> >       reg |= G1_REG_DEC_CTRL0_PICORD_COUNT_E;
> > -     if (dec_param->nal_ref_idc)
> > +     if (sps->profile_idc > 66)
> >               reg |= G1_REG_DEC_CTRL0_WRITE_MVS_E;
> >
> >       if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
>
