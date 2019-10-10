Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D95DD21E6
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 09:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733252AbfJJHje (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 03:39:34 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35523 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733089AbfJJHgZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 03:36:25 -0400
Received: by mail-ed1-f65.google.com with SMTP id v8so4545594eds.2
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2019 00:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j2LxCDafDAW02/WxF7QeZcp0q72h+B7Xlq2HfqSe0sE=;
        b=EW/Ygj0EAHXhkRDxuxtERiyCDOa0gnnMecZN7ArVqesXfPWt5j+cnDEqjJzxFn9SnB
         j9tskjx6w94C9tJ7mapr7kCU0T2i8+HA2AIe+JUV2F0DPvq8JpOYq+VgJBevcjD0phY6
         LpCGiVGUqgYtzICLIaLlmgiFFb3/hPYunPhp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j2LxCDafDAW02/WxF7QeZcp0q72h+B7Xlq2HfqSe0sE=;
        b=i4nB9LLVqitAi4YbD8HQE8zqS2rHRYs3/41hY9gQbezyW/AvTph+y3V7+5IT1tzjGv
         avVDn9/JVfm/us9WcprWZN/uQPFmHJgVSTBM//LP2/WkgzgveJFF4+8vgwsdS5DpRFCe
         51zE3aKH135/zURhtAcFXjv4vIVeJRwBUrMxneBj2PqbrwMfSI8R15tXKnw2ZYzOdqt2
         4XdRYi5FjyPaqylgJCkcZrhYovoTSVZJgBAnKid1gwLVv81QJPAfoQLru9p72ro1Wnjz
         nsMwTVS9KkxDhg2vOqn6xnC4UfI0+RTG3AViwFnFDkHQuTt0Hdqw1o2/H5V6XXG/yc3M
         nsBg==
X-Gm-Message-State: APjAAAWJvui2epzB3uQBGr8XkIQ7oH38zU2uqa8ud59mDAlHscPIXpck
        a20oAXTsS/LA0nGzbsFqIQF5sk71SWHtqw==
X-Google-Smtp-Source: APXvYqxd834y/F47xorpQZIrzl5QLI4hUAI+CCznJgW3oSMCb7lufzE2U/I/2leRAPOoKHhNAVOEvw==
X-Received: by 2002:a17:906:1651:: with SMTP id n17mr6659476ejd.220.1570692983316;
        Thu, 10 Oct 2019 00:36:23 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id ay13sm587878ejb.81.2019.10.10.00.36.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2019 00:36:22 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id i16so5749194wmd.3
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2019 00:36:22 -0700 (PDT)
X-Received: by 2002:a1c:2e50:: with SMTP id u77mr6752094wmu.64.1570692982129;
 Thu, 10 Oct 2019 00:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-4-ezequiel@collabora.com> <HE1PR06MB4011204B3FC2DAABB4BD1BACAC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAFQd5BEPO3nicr1PzRNWoVEzsvKvv5AkqoMVh2AG7qST+bZdA@mail.gmail.com>
 <HE1PR06MB40111D7287970183CF6D0DD1AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAFQd5AqYsUJeM5tzOY3WNFRZu74k6Yst3TpxcfB61zZtaHJDA@mail.gmail.com> <HE1PR06MB40112032B360DE217C939FB3AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB40112032B360DE217C939FB3AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 10 Oct 2019 16:36:09 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bmng7SjS7qEnZkyKik1h4iX7KcDFSC4JSN+dby2+xkwA@mail.gmail.com>
Message-ID: <CAAFQd5Bmng7SjS7qEnZkyKik1h4iX7KcDFSC4JSN+dby2+xkwA@mail.gmail.com>
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

On Tue, Oct 8, 2019 at 10:57 PM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> On 2019-10-08 12:26, Tomasz Figa wrote:
> > On Tue, Oct 8, 2019 at 3:23 PM Jonas Karlman <jonas@kwiboo.se> wrote:
> >> On 2019-10-08 05:29, Tomasz Figa wrote:
> >>> Hi Jonas,
> >>>
> >>> On Tue, Oct 8, 2019 at 3:33 AM Jonas Karlman <jonas@kwiboo.se> wrote:
> >>>> On 2019-10-07 19:45, Ezequiel Garcia wrote:
> >>>>> From: Francois Buergisser <fbuergisser@chromium.org>
> >>>>>
> >>>>> The setting of the motion vectors usage and the setting of motion
> >>>>> vectors address are currently done under different conditions.
> >>>>>
> >>>>> When decoding pre-recorded videos, this results of leaving the motion
> >>>>> vectors address unset, resulting in faulty memory accesses. Fix it
> >>>>> by using the same condition everywhere, which matches the profiles
> >>>>> that support motion vectors.
> >>>> This does not fully match hantro sdk:
> >>>>
> >>>>   enable direct MV writing and POC tables for high/main streams.
> >>>>   enable it also for any "baseline" stream which have main/high tools enabled.
> >>>>
> >>>>   (sps->profile_idc > 66 && sps->constrained_set0_flag == 0) ||
> >>>>   sps->frame_mbs_only_flag != 1 ||
> >>>>   sps->chroma_format_idc != 1 ||
> >>>>   sps->scaling_matrix_present_flag != 0 ||
> >>>>   pps->entropy_coding_mode_flag != 0 ||
> >>>>   pps->weighted_pred_flag != 0 ||
> >>>>   pps->weighted_bi_pred_idc != 0 ||
> >>>>   pps->transform8x8_flag != 0 ||
> >>>>   pps->scaling_matrix_present_flag != 0
> >>> Thanks for double checking this. I can confirm that it's what Hantro
> >>> SDK does indeed.
> >>>
> >>> However, would a stream with sps->profile_idc <= 66 and those other
> >>> conditions met be still a compliant stream?
> >> You are correct, if a non-compliant video is having decoding problems it should probably be handled
> >> on userspace side (by not reporting baseline profile) and not in kernel.
> >> All my video samples that was having the issue fixed in this patch are now decoded correctly.
> >>
> >>>> Above check is used when DIR_MV_BASE should be written.
> >>>> And WRITE_MVS_E is set to nal_ref_idc != 0 when above is true.
> >>>>
> >>>> I think it may be safer to always set DIR_MV_BASE and keep the existing nal_ref_idc check for WRITE_MVS_E.
> >>> That might have a performance penalty or some other side effects,
> >>> though. Otherwise Hantro SDK wouldn't have enable it conditionally.
> >>>
> >>>> (That is what I did in my "media: hantro: H264 fixes and improvements" series, v2 is incoming)
> >>>> Or have you found any video that is having issues in such case?
> >>> We've been running the code with sps->profile_idc > 66 in production
> >>> for 4 years and haven't seen any reports of a stream that wasn't
> >>> decoded correctly.
> >>>
> >>> If we decide to go with a different behavior, I'd suggest thoroughly
> >>> verifying the behavior on a big number of streams, including some
> >>> performance measurements.
> >> I agree, I would however suggest to change the if statement to the following (or similar)
> >> as that should be the optimal for performance reasons and match the hantro sdk.
> >>
> >> if (sps->profile_idc > 66 && dec_param->nal_ref_idc)
> > Sorry for my ignorance, but could you elaborate on this? What's the
> > meaning of nal_ref_idc? I don't see it being checked in the Hantro SDK
> > condition you mentioned earlier.
>
> My somewhat limited understanding of h264 spec is that nal_ref_idc should be 0 for non-reference field/frame/pictures
> and because of this there should not be any need to write motion vector data as the field/frame should not be referenced.
>
> My base for the hantro sdk code is the imx8 imx-vpu-hantro package and it uses (simplified):
>   SetDecRegister(h264_regs, HWIF_WRITE_MVS_E, nal_ref_idc != 0)
> for MVC there is an additional condition.

Aha, completely makes sense. Thanks for clarifying.

Best regards,
Tomasz

>
> Regards,
> Jonas
>
> >
> >> Regards,
> >> Jonas
> >>
> >>> Best regards,
> >>> Tomasz
> >>>
> >>>> Regards,
> >>>> Jonas
> >>>>
> >>>>> Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
> >>>>> Signed-off-by: Francois Buergisser <fbuergisser@chromium.org>
> >>>>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> >>>>> ---
> >>>>> v2:
> >>>>> * New patch.
> >>>>>
> >>>>>  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 2 +-
> >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> >>>>> index 7ab534936843..c92460407613 100644
> >>>>> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> >>>>> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> >>>>> @@ -35,7 +35,7 @@ static void set_params(struct hantro_ctx *ctx)
> >>>>>       if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
> >>>>>               reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
> >>>>>       reg |= G1_REG_DEC_CTRL0_PICORD_COUNT_E;
> >>>>> -     if (dec_param->nal_ref_idc)
> >>>>> +     if (sps->profile_idc > 66)
> >>>>>               reg |= G1_REG_DEC_CTRL0_WRITE_MVS_E;
> >>>>>
> >>>>>       if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
>
