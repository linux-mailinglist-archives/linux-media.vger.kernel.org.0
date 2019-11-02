Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5D1ED0F4
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 00:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbfKBXJ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Nov 2019 19:09:56 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:36172 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfKBXJ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Nov 2019 19:09:56 -0400
Received: by mail-vs1-f67.google.com with SMTP id q21so8716667vsg.3
        for <linux-media@vger.kernel.org>; Sat, 02 Nov 2019 16:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8eOjimCXAMVT0g+dVB3v4ZC+luS1RZJawQJvhl1t+Ek=;
        b=MHuXqE7o5cqkl6VxmJtHSJsU4FakufGmfDpiMSNAGerCiLDyBOKLSdG+v2cMRv+KhT
         41o7ecOxklXcU1p5dlihH7KrPCdQlAnNBh6RgfuqkYCa59WvD54I7jWEgtAYzgVQPeE1
         YAyuvJ8niSIqGXt3WMtyOip0Oix4JNdY/aDPEvrcP3iq1FA5kdZTZT3xrV9npRhK83IT
         EYWLO1ioFTrUvr0wK+laIQQmkjLX/9R1GY9QnmfH2Zn7YP4x/8GSmh3agY1fe5bFHjwM
         cynHL4GW1CyWTA3tBEpwU8g3X0PLGQgJxNGqdwfe3gExYvrRBPlh1stILp8vh0O4UCFi
         KL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8eOjimCXAMVT0g+dVB3v4ZC+luS1RZJawQJvhl1t+Ek=;
        b=NgbRksSE1Gm/1A6uPt8SS7xEUZboZZ3EsNOa9G6KOGoMgx5l/Nts0iZqHgQU3EyPSb
         qqDR57A4nk9MK+5ljsEYR1jgPo5HZMzKz7/ns6mWivzEzcw+K2NKr/T1mVtS0teErBx4
         uBlwW1NVugAk+7kDbUNez5iX8ING5R/c4mRqCKsssSP1I0hNwV/WirWuMXImNWL2gzDJ
         WChll67ZE5IHibj63la1Rl1DMRuzXdTu1vwz42/tXZpwDyGjp7GkQbDh3Jrgm+OIp8Iw
         HsDSpsEZz1uUHUebgi525pwnKlGw8l9ZvP2r/OFvppSMCkM812Gyk8eKw240VmXkobbr
         b6mw==
X-Gm-Message-State: APjAAAXissb1eFy3TfIVYZDvJb/X/VL45S0zA62qO595xmeKIfp34gKf
        nvaCD8GuKDo7l0UjLEpmDK4jXyXIJsuuczaI6XAIcg==
X-Google-Smtp-Source: APXvYqwIKAmXBjKlfcpj4wpfj8gl/gweJdHLuSLoH5/i0/TFEUqSHyMJeiarfrsQeQ+b5DbVOp4sYPo7Z2BA8XU2wq0=
X-Received: by 2002:a05:6102:531:: with SMTP id m17mr9432988vsa.105.1572736193990;
 Sat, 02 Nov 2019 16:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191029012430.24566-1-jonas@kwiboo.se> <HE1PR06MB40116FEF3EBE4706E426A5FFAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB40116FEF3EBE4706E426A5FFAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 3 Nov 2019 00:09:42 +0100
Message-ID: <CAAEAJfCjUe=V8Sqj2Yqy-Su7iE=ptFDz40vg92bYqUS8XrE73w@mail.gmail.com>
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

On Tue, 29 Oct 2019 at 02:25, Jonas Karlman <jonas@kwiboo.se> wrote:
>
> From: Francois Buergisser <fbuergisser@chromium.org>
>
> The setting of the motion vectors usage and the setting of motion
> vectors address are currently done under different conditions.
>
> When decoding pre-recorded videos, this results of leaving the motion
> vectors address unset, resulting in faulty memory accesses. Fix it
> by using the same condition everywhere, which matches the profiles
> that support motion vectors.
>
> Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
> Signed-off-by: Francois Buergisser <fbuergisser@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index 29130946dea4..a1cb18680200 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -35,7 +35,7 @@ static void set_params(struct hantro_ctx *ctx)
>         if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
>                 reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
>         reg |= G1_REG_DEC_CTRL0_PICORD_COUNT_E;
> -       if (dec_param->nal_ref_idc)
> +       if (sps->profile_idc > 66 && dec_param->nal_ref_idc)
>                 reg |= G1_REG_DEC_CTRL0_WRITE_MVS_E;
>
>         if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
> @@ -245,7 +245,7 @@ static void set_buffers(struct hantro_ctx *ctx)
>         vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
>
>         /* Higher profiles require DMV buffer appended to reference frames. */
> -       if (ctrls->sps->profile_idc > 66) {
> +       if (ctrls->sps->profile_idc > 66 && ctrls->decode->nal_ref_idc) {

How about a one-line function (purposely not a macro,
to have type-checking) ? I think this should emphasize the fact that
the condition
needs to be the same.

Thanks,
Ezequiel

>                 size_t pic_size = ctx->h264_dec.pic_size;
>                 size_t mv_offset = round_up(pic_size, 8);
>
> --
> 2.17.1
>
