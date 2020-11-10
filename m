Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949BC2AE153
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 22:04:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgKJVEH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 16:04:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgKJVEH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 16:04:07 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00480C0613D1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 13:04:06 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id t11so14274140edj.13
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 13:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xI45YnQNiC4P8J4lgBXG/z8cHmMzcRB6aMt37sREgLU=;
        b=Ffv7bCnbSiujBe1FuKScR6+7em4yb0WJLyXysMA6NcrvjYpAtWgIyLHNA+jRVlDsdU
         4u5wVWxcT3+j9Wl67L0rtT6CdCkfn6Oy6t5M1Y/Cp9UEaNL8UnbqbFkWs2VCwLtXqxSE
         cHPycBFCvM/absTS5+alHKmvnhds4dcyIbLjZvSraRbFx7+0YEVCZt0csdnIVX4QYwo1
         6ZCYX/ldY5YiVAFMlO0iSr+Gnf5itKawwyv88+ZwNObEQ2AQ4Q1oGmHzCTjzkv3HhgzC
         YI5LNiGNTAjXGJ16IcLPFMWs5z824tT9wonIddIe3cj41Rs6+vO8Y2LZ+I89oMXgslzd
         rHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xI45YnQNiC4P8J4lgBXG/z8cHmMzcRB6aMt37sREgLU=;
        b=d992SwRvdfAjsnlYXDmQKmuXGL+ZiJJjoEy1AhVjuXjABXuleDFwRaB7b4B+KiSonp
         bnCfkfZMnUnflFntVYqwJmja/b+stVasnycTXxFy0fXfK/HCu6TarB8pr1Y3/RoYK2VB
         4YDCr5HB+aypxEJgLjYdP16oP2rcOUQzKh9Ed69mlVpS9sGO/nnlG11kOyDnMfWIaxkr
         +QAYG3/driXeLjHtjWBxisuhB/sEVciFUCBr1jXUao8RBhhslnYua5gkQkMBcSXZ3bR0
         wF7t/a/Q7ZUYfvx3x5EeCr4PqBCP0JAzYqj7Prl93a+93bUZWTRvvbiVdVdJVRRKqIAo
         woBA==
X-Gm-Message-State: AOAM532VJxdqfDKPuKrQie6F2ifCHxjJh/hnL7u2IIjaUpX65r58xGxj
        6kd7t10JFiEvsmp6Z5OWpi67funi57ZvERijEPUpjw==
X-Google-Smtp-Source: ABdhPJxnvRuAM7u4ej4H8i/UnTcYekXKkcAUFyy9rn3ApxSLFAp/Wb5qXGtnMFV/hiewsNMPOeQvdI0XagDPBEoM/tw=
X-Received: by 2002:a05:6402:2059:: with SMTP id bc25mr1429498edb.13.1605042245675;
 Tue, 10 Nov 2020 13:04:05 -0800 (PST)
MIME-Version: 1.0
References: <20201102190551.1223389-1-adrian.ratiu@collabora.com>
In-Reply-To: <20201102190551.1223389-1-adrian.ratiu@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 10 Nov 2020 18:03:54 -0300
Message-ID: <CAAEAJfA1N1k9Vho4weZ9VnM_v6K4RXdmERyrWcWPCj64NMzDoQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] media: rkvdec: Add a VP9 backend
To:     Adrian Ratiu <adrian.ratiu@collabora.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2 Nov 2020 at 16:04, Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> Dear all,
>
> This is v5 of the series adding VP9 profile 0 decoding to rkvdec.
>
> All feedback from v4 should be addressed, there's just one thing I did
> not address: ref_frame_sign_biases in the uAPI. The userspace tool I'm

I believe that Hantro G2 VP9 needs ref_frame_sign_biases.

I think that it's also needed for the MTK decoder.
Might be worth checking that as well, if the code is publicly
available somewhere.

Coming to think about it, I think we are really close to having
this uAPI directly upstream.

Let's take a step back on why we have these uAPIs in the staging
area. Couple years ago, there were some doubts in the media community
about these uAPIs, and we wanted to wait a bit for more users
before moving to public land.

The uAPIs were meant to be in staging until enough users
appeared and we were confident enough to move to stable.

For VP9, given the feedback received through the year was already
addressed, I think all that's left is to check the interface and make sure
it can support Rockchip (RK3399, RK3326, etc), Hantro G2 and Mediatek,

We will be very close to having a public API, and we could even merge it
directly there.

Thanks,
Ezequiel

> using [1] apparently doesn't need it or the default hwreg value for it
> is capable of decoding the bitstreams I used on the driver, so I don't
> really have a use-case to change and test that. :)
>
> Considering the uAPI is a work in progress and expected to be modified,
> ref_frame_sign_biases can be added later with others which might be
> required to enable more functionality (for eg profiles >= 1).
>
> Series tested on rk3399 and applies on next-20201030.
>
> [1] https://github.com/Kwiboo/FFmpeg/tree/v4l2-request-hwaccel-4.2.2-rkvdec
>
> Changelog
> ---------
>
> v5:
>
> * Drop unnecessary OUTPUT buffer payload set in .buf_prepare.
> * Drop obsolete .per_request ctrl flag
> * Added new vp9 ctrls to v4l2_ctrl_ptr
> * Fix pahole detected padding issues
> * Send userspace an error if it tries to reconfigure decode resolution
>   as v4l2 or rkvdec-vp9 backend do not support dynamic res changes yet
> * Allow frame ctx probability tables to be non-mandatory so users can
>   set them directly during frame decoding in cases where no defaults
>   have been set previously (eg. ffmpeg vp9 backend)
> * Some comments and documentation clarifications
> * Minor checkpatch fixes
>
> v4:
>
> * Drop color_space field from the VP9 interface.
>   V4L2 API should be used for it.
> * Clarified Segment-ID comments.
> * Moved motion vector probabilities to a separate
>   struct.
>
> v3:
>
> * Fix documentation issues found by Hans.
> * Fix smatch detected issues as pointed out by Hans.
> * Added patch to fix wrong bytesused set on .buf_prepare.
>
> v2:
>
> * Documentation style issues pointed out by Nicolas internally.
> * s/VP9_PROFILE_MAX/V4L2_VP9_PROFILE_MAX/
> * Fix wrong kfree(ctx).
> * constify a couple structs on rkvdec-vp9.c
>
>
> Boris Brezillon (2):
>   media: uapi: Add VP9 stateless decoder controls
>   media: rkvdec: Add the VP9 backend
>
> Ezequiel Garcia (1):
>   media: rkvdec: Fix .buf_prepare
>
>  .../userspace-api/media/v4l/biblio.rst        |   10 +
>  .../media/v4l/ext-ctrls-codec.rst             |  550 ++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  239 +++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>  drivers/staging/media/rkvdec/Makefile         |    2 +-
>  drivers/staging/media/rkvdec/rkvdec-vp9.c     | 1577 +++++++++++++++++
>  drivers/staging/media/rkvdec/rkvdec.c         |   72 +-
>  drivers/staging/media/rkvdec/rkvdec.h         |    6 +
>  include/media/v4l2-ctrls.h                    |    5 +
>  include/media/vp9-ctrls.h                     |  486 +++++
>  10 files changed, 2942 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c
>  create mode 100644 include/media/vp9-ctrls.h
>
> --
> 2.29.0
>
