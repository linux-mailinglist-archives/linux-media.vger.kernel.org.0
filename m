Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3B663530B
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 09:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236633AbiKWIow (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 03:44:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236312AbiKWIou (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 03:44:50 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E27038F3E1
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 00:44:49 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id d12so247833ilv.4
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 00:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3lZfEI82UmUSMiDuvBd158Y70vafqY1tMfhM8D96RtI=;
        b=HBAIRoNWWQ9cExkfQ8sq0k283bcqZABHuJWJnKhqZlOxG64aVwVkOg4cCSijv7dnbc
         yD89wMwCSX51YB3lv6ZjYuzK4ERSAmZuGYmIG0rB9I717Y0GCbbrM9kktrdKJblYQjnN
         nTF4V6o1UVqirwksVoorAncCBskzjeppUX058=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lZfEI82UmUSMiDuvBd158Y70vafqY1tMfhM8D96RtI=;
        b=EPCCTcXWAjXDPku4pVyIEixYZtbTUaS9+LBHtfnqGGqQkmki5OX7AafmfGdDvXFeiy
         vM5VSBbhbQkO7YnyYFWHP2EnSRmCgHknfgUtWEAR6zj53sk6azORf9hmFzBPiGNoAAoR
         EhwOwC1IsJ2K1pBxyBWObyewMQCld+nCjmYZkcRnnUjG4uybXjKqfzS4zmvCavJbbAgs
         KQ2eNGWz6lwnMJZtleAg6mw6pvNe5TOtdWiuf2XuOR4jFZLYrIAFSHp6WWV49mWE7y+B
         xoFkX1Zs41PX2vqC3fbwh7r/9mYQCVziBoDWEJySmYFgEtddEwtdmXEjFqHmboT0IUFx
         RNKQ==
X-Gm-Message-State: ANoB5pkJ5w4eWrTDFmfDfX8kbw+x4NnJqs3S+sTvuuJyFDnMVXC9k7i/
        4mv6ZSxh+qlZuGeyKZGsW/BUFYv3ss2XgQ==
X-Google-Smtp-Source: AA0mqf5ge4NwNS1zq4X6gVIdYucb3ErXdwhq3ptvYnS3ZLbEIVNxLFBKNUJPyEdU3JdFogw2hk/J6g==
X-Received: by 2002:a92:c534:0:b0:302:ce48:27f0 with SMTP id m20-20020a92c534000000b00302ce4827f0mr4767628ili.54.1669193089110;
        Wed, 23 Nov 2022 00:44:49 -0800 (PST)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id e3-20020a028603000000b00363c4307bb2sm5875735jai.79.2022.11.23.00.44.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 00:44:47 -0800 (PST)
Received: by mail-io1-f46.google.com with SMTP id y6so12689438iof.9
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 00:44:47 -0800 (PST)
X-Received: by 2002:a02:c897:0:b0:374:100a:b0c7 with SMTP id
 m23-20020a02c897000000b00374100ab0c7mr3898004jao.185.1669193087058; Wed, 23
 Nov 2022 00:44:47 -0800 (PST)
MIME-Version: 1.0
References: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
In-Reply-To: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 23 Nov 2022 09:44:35 +0100
X-Gmail-Original-Message-ID: <CANiDSCvb_HXpx-a9ZmAJ-s23YvefPPJfUy5kHLcEzLUkaKFqnQ@mail.gmail.com>
Message-ID: <CANiDSCvb_HXpx-a9ZmAJ-s23YvefPPJfUy5kHLcEzLUkaKFqnQ@mail.gmail.com>
Subject: Re: [PATCH resend] media: staging: stkwebcam: Restore
 MEDIA_{USB,CAMERA}_SUPPORT dependencies
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 21 Nov 2022 at 16:58, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> By moving support for the USB Syntek DC1125 Camera to staging, the
> dependencies on MEDIA_USB_SUPPORT and MEDIA_CAMERA_SUPPORT were lost.
>
> Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/deprecated/stkwebcam/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/deprecated/stkwebcam/Kconfig b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> index 4450403dff41fb64..7234498e634ac61c 100644
> --- a/drivers/staging/media/deprecated/stkwebcam/Kconfig
> +++ b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> @@ -2,7 +2,7 @@
>  config VIDEO_STKWEBCAM
>         tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
>         depends on VIDEO_DEV
> -       depends on USB
> +       depends on MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
>         help
>           Say Y here if you want to use this type of camera.
>           Supported devices are typically found in some Asus laptops,
> --
> 2.25.1
>


-- 
Ricardo Ribalda
