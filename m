Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE741CF6FD
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 12:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbfJHK04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 06:26:56 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40650 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728866AbfJHK04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 06:26:56 -0400
Received: by mail-ed1-f67.google.com with SMTP id v38so15130789edm.7
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 03:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TuTp4qSs/ib4dWqdltJLc9xTt5QmDdIVXlg895SiimI=;
        b=anQG58BQbSDFEwGX4sXa027j9aWBAUcj+wsxH2AEo964GdrVfgqTdTeY8elwiU65O3
         QuzoQ6VdSB7i2X3m4gwA0QNl5qMpSg9Euq0ViC/EtK4kjLfBpbA9B6Xov0017C6yDHHU
         93NNIknMKE/eiFm0+EnnelPjm4r0EzvhuQJjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TuTp4qSs/ib4dWqdltJLc9xTt5QmDdIVXlg895SiimI=;
        b=Ev60F1/iZusjGRfj8dkX2YF6gOqJd/gk5zuZGKkC5VuDaBltpRnRc/UTrJVwudM/UG
         Pylk3fENDFN+VP2KgVrM94+MvURqlgrYw9N0ReeUzE2fS2AMsknfCE7CWj2JUEy1Xzt8
         YYW4rZQimhdAdUqilBEHdGXgEQUsZQsCNjL0NRKn5PNOtxD1s51C/ZSMjo1d0go+mNRe
         +1zw+aHAUM64g0T0PK4YvQqd0D/ljD6jvrTqjZ+M07c9+0P5ShydIISANALznFBg0Lh6
         sHAthBQ6pMp+Z3cD7LUZZWkhFV59VsO2gVglEbykSSK895uEYGcLA+xjOMBTNOdiEwXQ
         BX/w==
X-Gm-Message-State: APjAAAWOE20YEyC0Gj4PTkjKfIpcBjGBYX/+Dn4JsHVDsdOmck+VhzJt
        X6Fg3UxfdTY8RPetPcZDkWnSMdFAdkWnQQ==
X-Google-Smtp-Source: APXvYqzklebzhB5YavgpTSceWVaisH/8f3FM7VDrxHsJ/gDA20OUYauE3V5ijBRXCrv2Z+1uqZARWg==
X-Received: by 2002:a17:906:4910:: with SMTP id b16mr27159642ejq.301.1570530413276;
        Tue, 08 Oct 2019 03:26:53 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id i30sm3846870ede.32.2019.10.08.03.26.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2019 03:26:52 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id v8so18765213wrt.2
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 03:26:52 -0700 (PDT)
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr28188191wrt.100.1570530411726;
 Tue, 08 Oct 2019 03:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-4-ezequiel@collabora.com> <HE1PR06MB4011204B3FC2DAABB4BD1BACAC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAFQd5BEPO3nicr1PzRNWoVEzsvKvv5AkqoMVh2AG7qST+bZdA@mail.gmail.com> <HE1PR06MB40111D7287970183CF6D0DD1AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB40111D7287970183CF6D0DD1AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 8 Oct 2019 19:26:39 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AqYsUJeM5tzOY3WNFRZu74k6Yst3TpxcfB61zZtaHJDA@mail.gmail.com>
Message-ID: <CAAFQd5AqYsUJeM5tzOY3WNFRZu74k6Yst3TpxcfB61zZtaHJDA@mail.gmail.com>
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

On Tue, Oct 8, 2019 at 3:23 PM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> On 2019-10-08 05:29, Tomasz Figa wrote:
> > Hi Jonas,
> >
> > On Tue, Oct 8, 2019 at 3:33 AM Jonas Karlman <jonas@kwiboo.se> wrote:
> >> On 2019-10-07 19:45, Ezequiel Garcia wrote:
> >>> From: Francois Buergisser <fbuergisser@chromium.org>
> >>>
> >>> The setting of the motion vectors usage and the setting of motion
> >>> vectors address are currently done under different conditions.
> >>>
> >>> When decoding pre-recorded videos, this results of leaving the motion
> >>> vectors address unset, resulting in faulty memory accesses. Fix it
> >>> by using the same condition everywhere, which matches the profiles
> >>> that support motion vectors.
> >> This does not fully match hantro sdk:
> >>
> >>   enable direct MV writing and POC tables for high/main streams.
> >>   enable it also for any "baseline" stream which have main/high tools enabled.
> >>
> >>   (sps->profile_idc > 66 && sps->constrained_set0_flag == 0) ||
> >>   sps->frame_mbs_only_flag != 1 ||
> >>   sps->chroma_format_idc != 1 ||
> >>   sps->scaling_matrix_present_flag != 0 ||
> >>   pps->entropy_coding_mode_flag != 0 ||
> >>   pps->weighted_pred_flag != 0 ||
> >>   pps->weighted_bi_pred_idc != 0 ||
> >>   pps->transform8x8_flag != 0 ||
> >>   pps->scaling_matrix_present_flag != 0
> > Thanks for double checking this. I can confirm that it's what Hantro
> > SDK does indeed.
> >
> > However, would a stream with sps->profile_idc <= 66 and those other
> > conditions met be still a compliant stream?
>
> You are correct, if a non-compliant video is having decoding problems it should probably be handled
> on userspace side (by not reporting baseline profile) and not in kernel.
> All my video samples that was having the issue fixed in this patch are now decoded correctly.
>
> >
> >> Above check is used when DIR_MV_BASE should be written.
> >> And WRITE_MVS_E is set to nal_ref_idc != 0 when above is true.
> >>
> >> I think it may be safer to always set DIR_MV_BASE and keep the existing nal_ref_idc check for WRITE_MVS_E.
> > That might have a performance penalty or some other side effects,
> > though. Otherwise Hantro SDK wouldn't have enable it conditionally.
> >
> >> (That is what I did in my "media: hantro: H264 fixes and improvements" series, v2 is incoming)
> >> Or have you found any video that is having issues in such case?
> > We've been running the code with sps->profile_idc > 66 in production
> > for 4 years and haven't seen any reports of a stream that wasn't
> > decoded correctly.
> >
> > If we decide to go with a different behavior, I'd suggest thoroughly
> > verifying the behavior on a big number of streams, including some
> > performance measurements.
>
> I agree, I would however suggest to change the if statement to the following (or similar)
> as that should be the optimal for performance reasons and match the hantro sdk.
>
> if (sps->profile_idc > 66 && dec_param->nal_ref_idc)

Sorry for my ignorance, but could you elaborate on this? What's the
meaning of nal_ref_idc? I don't see it being checked in the Hantro SDK
condition you mentioned earlier.

>
> Regards,
> Jonas
>
> >
> > Best regards,
> > Tomasz
> >
> >> Regards,
> >> Jonas
> >>
> >>> Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
> >>> Signed-off-by: Francois Buergisser <fbuergisser@chromium.org>
> >>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> >>> ---
> >>> v2:
> >>> * New patch.
> >>>
> >>>  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> >>> index 7ab534936843..c92460407613 100644
> >>> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> >>> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> >>> @@ -35,7 +35,7 @@ static void set_params(struct hantro_ctx *ctx)
> >>>       if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
> >>>               reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
> >>>       reg |= G1_REG_DEC_CTRL0_PICORD_COUNT_E;
> >>> -     if (dec_param->nal_ref_idc)
> >>> +     if (sps->profile_idc > 66)
> >>>               reg |= G1_REG_DEC_CTRL0_WRITE_MVS_E;
> >>>
> >>>       if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
>
