Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2807122D82F
	for <lists+linux-media@lfdr.de>; Sat, 25 Jul 2020 16:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgGYOp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jul 2020 10:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgGYOp6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jul 2020 10:45:58 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC53CC08C5C1
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2020 07:45:58 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id a26so373816otf.1
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2020 07:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PrYFb2IYZKFYNy0ZRqbrO/ZpY3ot25T0Fu/kJw/KuIo=;
        b=a52n/QvUYfIOQ1LipBknthVlW9Mcm3lbMy3gRRgPbFFfUjZULnS0fWRKJEpWifwT88
         1jvcX4G60H61GouIWGnYOKEQL5cSHNAXXfhBfPOhpU3a8+GA1QqQHfuiHRhCstCOt60t
         tiZ0zXsmcoHSVqHUba7f3nuC/T8AGy58vUksw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PrYFb2IYZKFYNy0ZRqbrO/ZpY3ot25T0Fu/kJw/KuIo=;
        b=gAe5Iyp1e6FGj5EQ+vQUaQClcsdRIWPs97VHAzPte+HG6JYrXrjWGuz/Sc35H5pUIt
         eunDvKkMBDulTROf9IwR0qAlHLihzrDdK+q9MhuKdx72gYNzfmpFSZgAXxvhkeDjsKod
         K9iS7YiYcOwk4iY93BqhX4+sYRUnVWHichKu52wlyh5sZ4rQfuXCell4EXkJD4fpBGCv
         4qP1hUZZ5mYXgU7Fk0lEUJ9hDbEtIckFzGL5ormOp7SKV9g6q1OafdFXWg9okRbxhcBn
         YtLI/j0KCYW1nNi+MO/jwrgsjOF5G+pcGP8wfwNUkSwWW0WHr/QLEBcCdtMRPB9wuQ5y
         etOQ==
X-Gm-Message-State: AOAM531iXtd5ccYs/QlyPWxMR1GSEYPOIfRowFf9+UomxANa08GeD2ca
        YWEjXs9+342azFnf7z8YgWFkWrf9LSk=
X-Google-Smtp-Source: ABdhPJw56S54PAGzpI0egIvBTffpBKTncV402vyg2zlP952VV3LxNtOxNlh2c7CcmrD/xnbPB75cDw==
X-Received: by 2002:a9d:851:: with SMTP id 75mr12724534oty.122.1595688356939;
        Sat, 25 Jul 2020 07:45:56 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id p18sm2113282oto.11.2020.07.25.07.45.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2020 07:45:55 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id t18so9161689otq.5
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2020 07:45:55 -0700 (PDT)
X-Received: by 2002:a05:6830:1daa:: with SMTP id z10mr13317108oti.36.1595688354490;
 Sat, 25 Jul 2020 07:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200715202233.185680-1-ezequiel@collabora.com> <20200715202233.185680-10-ezequiel@collabora.com>
In-Reply-To: <20200715202233.185680-10-ezequiel@collabora.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Sat, 25 Jul 2020 23:45:41 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWG5aXuc7ExiaKvgtLL0o=HDYKFa4D4-v8hfvyGiNFBdA@mail.gmail.com>
Message-ID: <CAPBb6MWG5aXuc7ExiaKvgtLL0o=HDYKFa4D4-v8hfvyGiNFBdA@mail.gmail.com>
Subject: Re: [PATCH 09/10] media: hantro: Don't require unneeded H264_SLICE_PARAMS
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 16, 2020 at 5:23 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Now that slice invariant parameters have been moved,
> the driver no longer needs this control, so drop it.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_drv.c  | 5 -----
>  drivers/staging/media/hantro/hantro_h264.c | 5 -----
>  drivers/staging/media/hantro/hantro_hw.h   | 2 --
>  3 files changed, 12 deletions(-)
>
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 34797507f214..3cd00cc0a364 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -306,11 +306,6 @@ static const struct hantro_ctrl controls[] = {
>                 .cfg = {
>                         .id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
>                 },
> -       }, {
> -               .codec = HANTRO_H264_DECODER,
> -               .cfg = {
> -                       .id = V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
> -               },

Isn't this going to make the driver reject (as opposed to just ignore)
this control altogether? Also, even though the control is not required
anymore, don't we want to check that it is provided in order to ensure
user-space follows the spec (granted, this would be better done in a
common framework shared by all drivers).

I'd also suggest this patch (and the following one) to be merged into
the previous one as they are just removing fields that have become
unneeded because of it.
