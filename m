Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7A53655FB4
	for <lists+linux-media@lfdr.de>; Mon, 26 Dec 2022 05:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbiLZEUn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Dec 2022 23:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbiLZEUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Dec 2022 23:20:30 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACFF62BF2
        for <linux-media@vger.kernel.org>; Sun, 25 Dec 2022 20:20:17 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id c184so9461161vsc.3
        for <linux-media@vger.kernel.org>; Sun, 25 Dec 2022 20:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mKdVKOHSCEg+tKaaEFVYzv74u3/NaQee0qcBBxp1y3c=;
        b=aFgG6nmASzG1xxgP9VZZKgZTxzNtiuLqtZy64GsVdkkea82JlvSEt6VHz0xyW5aNuU
         lfv2MuGgBvqzq4j+ja7hvtHtJPk/5EvZ4JrveVSVm9CxAfWcGr9Nqp4czpkl3+pplHF5
         ba2VGJTNBHPJJxfi5qA6r5MogeqT4enzamPQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKdVKOHSCEg+tKaaEFVYzv74u3/NaQee0qcBBxp1y3c=;
        b=H1o28DUOChlmiNB9i3NAFGoBYSXxgFWppN0of3W6YuGDugkwefniHXKVsj0dMoj5hX
         kdzy4KMnyyytFbciRDDs86+Sln/NgA35Li9OLZVhplfehKWhDofkyNVvZcEf/rUcRVEQ
         eomTpF6+KrYTtVfHPKjdpVcm6O0Q8ZruAApUxGuJIs2bVrrI8H1jfOcPeYAFP+6mxonb
         MIELy4dyxxLzSoYX6ljCSwjtEk9n4fLVw3YZvO7gYDYFdbkIqw1ZQthhKvwVa3dE3i2U
         iF9vemmekMx38XzezMkTbUQQ6h8CSDZ1a/tdZJ+Vxr/+H3DLMzeab4HYTDWXsieG0SER
         bmLg==
X-Gm-Message-State: AFqh2kojxWXZwBZaZTZmlR/d+lGikDdPfeucd4injkUWqH3cXUCqJgcT
        xyA1Wpii41s5XJ1eJ+jmK6IFljxNLKl3qxhuE71iig==
X-Google-Smtp-Source: AMrXdXuFy44KoM6cgpPQl52rIv6gU3qO8FjXlmPeQk8z0054k+4akwc807GqP+U7OSaJKe6xzzq8k+x77+ocPSaPQYA=
X-Received: by 2002:a05:6102:4427:b0:3b0:6da7:39ba with SMTP id
 df39-20020a056102442700b003b06da739bamr2342093vsb.26.1672028416512; Sun, 25
 Dec 2022 20:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20221223193807.914935-1-nicolas.dufresne@collabora.com>
In-Reply-To: <20221223193807.914935-1-nicolas.dufresne@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Dec 2022 12:20:05 +0800
Message-ID: <CAGXv+5EAwVf2Tte5ErinAvE1xhTizBuQb5s5UY4BwipY5=nTFg@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] media: rkvdec: Fix H.264 error resilience
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Dec 24, 2022 at 3:38 AM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> This patch serie changes the decoding mode from "exit on error"
> to "keep decoding". Using this mode and re-enabling error detection
> allow getting error resilience without loosing the ability to report
> errors to userland. This have showed great results, but might be a
> little more risky since this is not the mode that the reference code
> uses and the documentation is very brief. With this in place,
> userspace can chose to skip or display corrupted frames depending
> on its application requirement. Previsouly, applicaiton would have
> had no choice but to present the corrupted frames.
>
> Changes since V1:
>         - Removed merged patch
>         - Changed usage of pr_debug into v4l2_dbg
>         - Fix typos in commit messages and comments
>
> Nicolas Dufresne (5):
>   media: rkvdec: Disable H.264 error detection
>   media: rkvdec: Add an ops to check for decode errors
>   media: rkvdec: Fix RKVDEC_ERR_PKT_NUM macro
>   media: rkvdec: Re-enable H.264 error detection
>   rkvdec: Improve error handling

Apart from the minor comments in patch 3, the series is

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Do we need to add the check_error_info op for VP9?

>  drivers/staging/media/rkvdec/rkvdec-h264.c | 23 +++++++++++++--
>  drivers/staging/media/rkvdec/rkvdec-regs.h |  2 +-
>  drivers/staging/media/rkvdec/rkvdec.c      | 34 ++++++++++++++++++----
>  drivers/staging/media/rkvdec/rkvdec.h      |  2 ++
>  4 files changed, 51 insertions(+), 10 deletions(-)
>
> --
> 2.38.1
>
