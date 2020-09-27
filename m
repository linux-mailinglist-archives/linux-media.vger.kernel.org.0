Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FB127A0B0
	for <lists+linux-media@lfdr.de>; Sun, 27 Sep 2020 14:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgI0MCQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Sep 2020 08:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgI0MCQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Sep 2020 08:02:16 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE063C0613CE
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2020 05:02:15 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id k14so7067297edo.1
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2020 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kMNZXCsFPJ5Yj9MinqhxrpNg+ne7y9z3VvRD3ob/tmI=;
        b=A8UOtGFozTIUewfXMpSBinX97KX132eg0eXOdSYcijKTcVD14qPO3fOQcJoqsHqEzn
         f2WJhBNkS4WyS2JGJWdqkY7uYm1/YUiQJ8qTzbTG0IwhNfBCH8W7x7mhFVZ6kQvg6QQG
         5VWZkUiBkiKLPaRXcJ4bP0s/1WXKHfE6nlkpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kMNZXCsFPJ5Yj9MinqhxrpNg+ne7y9z3VvRD3ob/tmI=;
        b=oqwPVQ0+jRhhdZT/QyK1qDiCup4qmA/4TXy7cy7BI+GubJCg0Pkc0smvye9IZIEhni
         UMSPesz6K9JaMUED3PjSgGRVdBk+bC/t7yAPL7qzpDzQdUtLeb/R1DJeHrB1farSGZdi
         Z2clsX2DRVHULAsTuHHhtLCI1uRQEP7aZVps0imYmoxWsxxCyncZ0M38t6Q/dre3eIdT
         zbm3YUCKoTxmCSabZTGYLkru3KRGLmCBXUwVxpMyM/R22bbkatErxNag0emUBMwc3fds
         Jp0Pg501e1tuqkZkMH14eEBpHEL9gtd9CH9sPEvtfrxINMXorvTLPEyV9XtLlRzKuhfS
         ghGw==
X-Gm-Message-State: AOAM532axbkOW+tTq7QpGbZNk9+Kx6JmwPz7V9E5jOv2ZNU7NT1yOjHb
        l+BqaodRd0eWLrDDAvvM7kXMI6l1c7DVLQ==
X-Google-Smtp-Source: ABdhPJw60f6haHPs9tei6+teGVVEEHW0L+bJEueiIdRe2EFDG66VzYc4lT2TaEEP2LHTNUOXSMBxQw==
X-Received: by 2002:aa7:c648:: with SMTP id z8mr10778839edr.239.1601208133998;
        Sun, 27 Sep 2020 05:02:13 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id n11sm6214981ejs.38.2020.09.27.05.02.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2020 05:02:13 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id m6so8699529wrn.0
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2020 05:02:12 -0700 (PDT)
X-Received: by 2002:a5d:6552:: with SMTP id z18mr13318065wrv.32.1601208132469;
 Sun, 27 Sep 2020 05:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
 <20200901111612.10552-3-dafna.hirschfeld@collabora.com> <20200926131708.GE3781977@chromium.org>
 <86b5262f-6bb3-7c02-f49e-cbe8edab3490@collabora.com>
In-Reply-To: <86b5262f-6bb3-7c02-f49e-cbe8edab3490@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sun, 27 Sep 2020 14:01:56 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CXv9EvqpoxG4JGHSVydK=XtHK3kRu9hxf1E6AQUN_3Ww@mail.gmail.com>
Message-ID: <CAAFQd5CXv9EvqpoxG4JGHSVydK=XtHK3kRu9hxf1E6AQUN_3Ww@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] media: staging: rkisp1: cap: remove unsupported formats
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 27, 2020 at 11:33 AM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Hi,
>
> Am 26.09.20 um 15:17 schrieb Tomasz Figa:
> > Hi Dafna,
> >
> > On Tue, Sep 01, 2020 at 01:16:04PM +0200, Dafna Hirschfeld wrote:
> >> For Ycbcr packed formats only YUYV can be supported by
> >> the driver. This patch removes the other formats.
> >
> > I can see the driver already setting the
> > RKISP1_CIF_MI_XTD_FMT_CTRL_*_CB_CR_SWAP register according to the
> > uv_swap flag, but it currently does it so only if comp_planes is 2.
> > Wouldn't just doing the same if the number of planes is 1 fix the
> > support for at least the YVYU format?
>
> Hi, Laurent already suggested it and I found out it does not
> work, see: https://patchwork.kernel.org/patch/11471301/

I see, okay, thanks for double checking.

Best regards,
Tomasz

>
> Thanks,
> Dafna
>
> >
> > Best regards,
> > Tomasz
> >
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> Acked-by: Helen Koike <helen.koike@collabora.com>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> ---
> >>   drivers/staging/media/rkisp1/rkisp1-capture.c | 17 -----------------
> >>   1 file changed, 17 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> >> index f4d5cc3e2f12..79195e74d995 100644
> >> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> >> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> >> @@ -88,13 +88,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
> >>              .fourcc = V4L2_PIX_FMT_YUYV,
> >>              .uv_swap = 0,
> >>              .write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> >> -    }, {
> >> -            .fourcc = V4L2_PIX_FMT_YVYU,
> >> -            .uv_swap = 1,
> >> -            .write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> >> -    }, {
> >> -            .fourcc = V4L2_PIX_FMT_VYUY,
> >> -            .write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> >>      }, {
> >>              .fourcc = V4L2_PIX_FMT_YUV422P,
> >>              .uv_swap = 0,
> >> @@ -197,16 +190,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
> >>              .uv_swap = 0,
> >>              .write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> >>              .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> >> -    }, {
> >> -            .fourcc = V4L2_PIX_FMT_YVYU,
> >> -            .uv_swap = 1,
> >> -            .write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> >> -            .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> >> -    }, {
> >> -            .fourcc = V4L2_PIX_FMT_VYUY,
> >> -            .uv_swap = 1,
> >> -            .write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> >> -            .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> >>      }, {
> >>              .fourcc = V4L2_PIX_FMT_YUV422P,
> >>              .uv_swap = 0,
> >> --
> >> 2.17.1
> >>
