Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBCC410012
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 21:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344703AbhIQTxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 15:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344584AbhIQTxj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 15:53:39 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9ACDC0617BD
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 12:51:14 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id d18so1270462iof.13
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 12:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AO8stvH6wLQIPUW7jVtw5X0QFxjdUv6SibSuWzk36Rk=;
        b=VdePcfsHpNUgpbkw8TARXrR7jC9aG7x/7YmP5iPfWGD+cqXy5vsT4cDu7rBnNIcEY2
         yD1T4FDdiBbNu07dGt+Oo3Pl1m8rZFXCp+kenOQL8Rh0DIeOT2An+WrcS2OP1CWRny+j
         kNopwuwAZdjru1KuowyYEC1EjO5qwmF9ztCrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AO8stvH6wLQIPUW7jVtw5X0QFxjdUv6SibSuWzk36Rk=;
        b=46YxoE2VJQ8tIV+SOYzfg9DXY+lD4XyKmVeK1WBmfYp2UaYc+0befx8NH00G4Dv+R/
         KVQ2M0QCKkedLPcE9+2aDuMv8HpHNOh764DYCYHd5Zwk+yz/w2XrAoy0QD0gJXaaa6vd
         BCE1JtqnTKEQZicDyx8npvdLHHc60Xk3wfgIULaYVvQRkRB1KGMv7G6bseEFgeIfHLqz
         M2PCd9Dp1Ca7JzvehAXXFYrVxxKtzqNtDB3oT6dGJoN9mdHhik95PF/rb8e/ESuU6USg
         y/ShE4vSm4LGGxdi9TR2RUVziYQaWB2vqpQfK8CDSpa32eJmBgJmGrZp20QDTTz7jmWp
         dW6A==
X-Gm-Message-State: AOAM532OI6nyHohIIhBona06j4A8LoD/z0oh4IZ3qUiWvjvvntMUWH2/
        Oe/MMwh8UCHWo190tTRglbF/XYEd3OuOgg==
X-Google-Smtp-Source: ABdhPJypIvBmRXsQ2y9NQaGnYcNuyhzbBL7rSSYxvo9eVMhkWI9253tonPczHHveM+wuhHArlYBu9A==
X-Received: by 2002:a02:6a2e:: with SMTP id l46mr10189096jac.73.1631908274020;
        Fri, 17 Sep 2021 12:51:14 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id c11sm4104473ile.22.2021.09.17.12.51.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 12:51:13 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id q14so11498703ils.5
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 12:51:12 -0700 (PDT)
X-Received: by 2002:a05:6e02:2141:: with SMTP id d1mr5491891ilv.242.1631908271903;
 Fri, 17 Sep 2021 12:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210917114930.47261-1-colin.king@canonical.com>
In-Reply-To: <20210917114930.47261-1-colin.king@canonical.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 17 Sep 2021 21:51:01 +0200
X-Gmail-Original-Message-ID: <CANiDSCv7okdqtfMpjPB9Gg+RvUSqsondN_-jo3xCNn7bRAaq0Q@mail.gmail.com>
Message-ID: <CANiDSCv7okdqtfMpjPB9Gg+RvUSqsondN_-jo3xCNn7bRAaq0Q@mail.gmail.com>
Subject: Re: [PATCH][next] media: uvcvideo: Fix memory leak of object map on
 error exit path
To:     Colin King <colin.king@canonical.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Collin

Thanks for catching it up.

On Fri, 17 Sept 2021 at 13:49, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently when the allocation of map->name fails the error exit path
> does not kfree the previously allocated object map. Fix this by
> setting ret to -ENOMEM and taking the free_map exit error path to
> ensure map is kfree'd.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 07adedb5c606 ("media: uvcvideo: Use control names from framework")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index f4e4aff8ddf7..711556d13d03 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -44,8 +44,10 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>         if (v4l2_ctrl_get_name(map->id) == NULL) {
>                 map->name = kmemdup(xmap->name, sizeof(xmap->name),
>                                     GFP_KERNEL);
> -               if (!map->name)
> -                       return -ENOMEM;
> +               if (!map->name) {
> +                       ret = -ENOMEM;
> +                       goto free_map;
> +               }
>         }
>         memcpy(map->entity, xmap->entity, sizeof(map->entity));
>         map->selector = xmap->selector;
> --
> 2.32.0
>


--
Ricardo Ribalda
