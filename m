Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E540556B1CD
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 06:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237221AbiGHErZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 00:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237170AbiGHErY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 00:47:24 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1931A2AD7
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 21:47:24 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id he28so25795688qtb.13
        for <linux-media@vger.kernel.org>; Thu, 07 Jul 2022 21:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Ih4uyKjXNRK2+O+XI6blNNhZM/IgSk7Uel9KFwQu5E=;
        b=b0ZddOV/wKmYfAX5xRnmoZkL0d8bYZJRspOUzYxGlKP4AoSE2NP108KTWj+EPK8YPv
         ksJxTr3hn84QYpDP+F68jMWaF4HIqJhpSigOFYTc+avE9tmIETue9j2gHdKqsYEiF9le
         Sn622V5IW06fOGT0S66Uwbc5C/YfSVfixxJBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Ih4uyKjXNRK2+O+XI6blNNhZM/IgSk7Uel9KFwQu5E=;
        b=4o1WECweDKkZe4XTkZhnGPCk+Bbu09qQcUAjbcH+VI+96ZLWnsTCHKahpNPepfy+l/
         AquHiy51M6O86VIH9q5vdr1rPscFzH8kFRj3gM8RYsrQhTUIen5kdkbpbMfjfZHBE7cH
         SP3SXoickoXnCh0hjR7R2pO3aJJ3eDwqOHlkWEYiqdi6xUec/xbnI2wYiuRf+V7KIpCv
         adFBZWMkZokJq+ezueAmICyifYLxoq1UNn+y+Wc3TEZkLdypByzm4lpNP9mj4U/FD2T6
         YSxrhhTBZxjBFFCqqf3bJcprSs7t7GpXfb94DmR6ElRiIO0Jldkdj9RAOd5/hqzGhpdM
         WLxA==
X-Gm-Message-State: AJIora8v2Ijay+byeV7rNh1HN9f9dpLTJUFA9Oyv77j0EPKnDT6HExSL
        QMALqqZRGYE5r90r/p0lvpx39JvovuK5lxNw
X-Google-Smtp-Source: AGRyM1suRllz7wdCTs6oO0CzOJf6BlpT5zJKznXS4rWuMUThUZOXz1fJRxKp0vRpU1M8Ztj0MCK72w==
X-Received: by 2002:ac8:5b85:0:b0:31c:b896:fb7d with SMTP id a5-20020ac85b85000000b0031cb896fb7dmr1374604qta.188.1657255643121;
        Thu, 07 Jul 2022 21:47:23 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id ea2-20020a05620a488200b006a79d8c8198sm23800845qkb.135.2022.07.07.21.47.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 21:47:21 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id y195so4804973yby.0
        for <linux-media@vger.kernel.org>; Thu, 07 Jul 2022 21:47:20 -0700 (PDT)
X-Received: by 2002:a25:858e:0:b0:66e:4898:63e2 with SMTP id
 x14-20020a25858e000000b0066e489863e2mr1750974ybk.296.1657255639791; Thu, 07
 Jul 2022 21:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220706182657.210650-1-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <20220706182657.210650-1-ezequiel@vanguardiasur.com.ar>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 8 Jul 2022 13:47:06 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Ap=oY8nf8d=o3p1D8avkmxPXvJz5X5SAaAS3M-pTC7_Q@mail.gmail.com>
Message-ID: <CAAFQd5Ap=oY8nf8d=o3p1D8avkmxPXvJz5X5SAaAS3M-pTC7_Q@mail.gmail.com>
Subject: Re: [PATCH 0/8] videobuf2: Replace vb2_find_timestamp() with vb2_find_buffer()
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Thu, Jul 7, 2022 at 3:27 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> All users of vb2_find_timestamp() combine it with vb2_get_buffer()
> to retrieve a videobuf2 buffer, given a u64 timestamp.
>
> Therefore, this series removes vb2_find_timestamp() and instead
> introduces a vb2_find_buffer, which is more suitable, making
> videobuf2 API slightly cleaner.
>
> Ezequiel Garcia (8):
>   videobuf2: Introduce vb2_find_buffer()
>   mediatek: vcodec: Use vb2_find_buffer
>   tegra-vde: Use vb2_find_buffer
>   vicodec: Use vb2_find_buffer
>   hantro: Use vb2_find_buffer
>   rkvdec: Use vb2_find_buffer
>   cedrus: Use vb2_find_buffer
>   videobuf2: Remove vb2_find_timestamp()
>
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 12 ++---
>  .../vcodec/vdec/vdec_h264_req_common.c        |  7 ++-
>  .../mediatek/vcodec/vdec/vdec_vp8_req_if.c    |  7 ++-
>  .../vcodec/vdec/vdec_vp9_req_lat_if.c         |  8 +--
>  .../media/platform/nvidia/tegra-vde/h264.c    |  9 ++--
>  .../media/test-drivers/vicodec/vicodec-core.c |  8 +--
>  drivers/staging/media/hantro/hantro_drv.c     |  6 +--
>  .../staging/media/hantro/hantro_g2_vp9_dec.c  | 10 ++--
>  drivers/staging/media/rkvdec/rkvdec-h264.c    | 41 ++++++---------
>  drivers/staging/media/rkvdec/rkvdec-vp9.c     | 10 ++--
>  drivers/staging/media/sunxi/cedrus/cedrus.h   | 13 +----
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 16 +++---
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  | 16 +++---
>  .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 36 ++++++-------
>  .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 50 ++++++-------------
>  include/media/videobuf2-v4l2.h                | 12 ++---
>  16 files changed, 100 insertions(+), 161 deletions(-)
>
> --
> 2.34.3
>

Thanks for the series! I think it's a nice cleanup indeed, but please
see a few comments in my replies to individual patches.

Best regards,
Tomasz
