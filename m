Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1064C1116
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 12:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239788AbiBWLP5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 06:15:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239779AbiBWLP4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 06:15:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CCC348A321
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 03:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645614927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UzJJ6mljner/MBUQSdtls4XtlY3JNobyNXXaK/j+JUo=;
        b=boiQsZN09Ska3HbSOXB3V2m0iZ3HhNsjol0teokSKzA+o6fzf0poDs+MLKpvelWH6Bk0TU
        CcCEC0r16b94DS64j0RRthEU/XqOJrijG49yiyQI3XX7zDWWUwzpu9TYa1X/qYvkSK9Min
        ioRHYPGgMG4I01oJ0sUotfYkwFwvgj0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-IdlH2C_yMLGQpA2p0kLcvw-1; Wed, 23 Feb 2022 06:15:26 -0500
X-MC-Unique: IdlH2C_yMLGQpA2p0kLcvw-1
Received: by mail-lj1-f199.google.com with SMTP id x8-20020a2ea7c8000000b00246215e0fc3so7130118ljp.8
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 03:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UzJJ6mljner/MBUQSdtls4XtlY3JNobyNXXaK/j+JUo=;
        b=kayecp+8TdFczKg/Cpwp0Fl84GxcFx9JOQDM0YpiRu1XgrFpC8qR0wr8zYoBX6BCbo
         bFygXLhTut9JK7KmHwUiB45naFswrLS05W67RCbJLlaxiDEgKsyClPe0Y2s2Kyy/1nxk
         oJYjej5filKheO9Kf6Id/Gs5ZGb7ZCSaP27MoZcpHePgBdDNRfIaWOS2iSHXv4TNPFF3
         XQU+VS4ltKIRGCSQbNwpvMOsmWSu7bm8VzBMnBG8SSYmtG7A5AQT8m5H5gk6nfUJwITy
         939+Dd7XK0mNvfl3wCeoZGcVDY24khWQGf1FChzM5lUCkU9wfZjYiVTwawPeVAYndbL0
         ByLA==
X-Gm-Message-State: AOAM5339Ixx2SJAZ05RkhHjwX1kNrMnvZCKczZQmsn3TMi9FMT2Yf5IN
        8Vr9TBa7GW9nO+//qUZlSAXZ/mDwXLP7y7gSB61j5GMtmRfoAguZnlAyKazdiETCC//tczMDEh6
        6/RqlJY6L2OmYKWeGTmXV/5ihWus6QZ4lZUHaEqo=
X-Received: by 2002:a05:651c:1542:b0:246:36c:8d1f with SMTP id y2-20020a05651c154200b00246036c8d1fmr21400784ljp.311.1645614924930;
        Wed, 23 Feb 2022 03:15:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKCRtUYUVZDftHSAkNClaClo65AZ1dkZqXQjImzDVuPaD2hhoEuZQ1M6JV/CnN9ddStdHdmJToNTyLX7HTIEk=
X-Received: by 2002:a05:651c:1542:b0:246:36c:8d1f with SMTP id
 y2-20020a05651c154200b00246036c8d1fmr21400761ljp.311.1645614924659; Wed, 23
 Feb 2022 03:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20220223090648.41989-1-hpa@redhat.com> <20220223090648.41989-2-hpa@redhat.com>
In-Reply-To: <20220223090648.41989-2-hpa@redhat.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Wed, 23 Feb 2022 19:15:13 +0800
Message-ID: <CAEth8oHRidJ24Wp81vLQe_VO=ddw_yFMvhuNE1XS+ekwa4ZUJA@mail.gmail.com>
Subject: Re: [PATCH 1/1] staging: media: ipu3: Fix AF x_start position when
 rightmost stripe is used
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Hans De Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 23, 2022 at 5:07 PM Kate Hsuan <hpa@redhat.com> wrote:
>
> For the AF configuration, if the rightmost stripe is used, the AF scene
> will be at the incorrect location of the sensor.
>
> The AF coordinate may be set to the right part of the sensor. This
> configuration would lead to x_start being greater than the
> down_scaled_stripes offset and the leftmost stripe would be disabled
> and only the rightmost stripe is used to control the AF coordinate. If
> the x_start doesn't perform any adjustments, the AF coordinate will be
> at the wrong place of the sensor since down_scaled_stripes offset
> would be the new zero of the coordinate system.
>
> In this patch, if only the rightmost stripe is used, x_start should
> minus down_scaled_stripes offset to maintain its correctness of AF
> scene coordinate.
>
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css-params.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> index d9e3c3785075..efe4de8ef205 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> @@ -2556,6 +2556,14 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
>                 /* Enable only for rightmost stripe, disable left */
>                 acc->af.stripes[0].grid_cfg.y_start &=
>                         ~IPU3_UAPI_GRID_Y_START_EN;
> +               acc->af.stripes[0].grid_cfg.x_start -=
> +                       acc->stripe.down_scaled_stripes[1].offset;
> +               acc->af.stripes[0].grid_cfg.x_end -=
> +                       acc->stripe.down_scaled_stripes[1].offset;
> +               acc->af.stripes[1].grid_cfg.x_start -=
> +                       acc->stripe.down_scaled_stripes[1].offset;
> +               acc->af.stripes[1].grid_cfg.x_end -=
> +                       acc->stripe.down_scaled_stripes[1].offset;
>         } else if (acc->af.config.grid_cfg.x_end <=
>                    acc->stripe.bds_out_stripes[0].width - min_overlap) {
>                 /* Enable only for leftmost stripe, disable right */
> @@ -2563,7 +2571,6 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
>                         ~IPU3_UAPI_GRID_Y_START_EN;
>         } else {
>                 /* Enable for both stripes */
> -
>                 acc->af.stripes[0].grid_cfg.width =
>                         (acc->stripe.bds_out_stripes[0].width - min_overlap -
>                          acc->af.config.grid_cfg.x_start + 1) >>
> --
> 2.35.1
>

Sorry, I forget to loop Jean-Michel in. Resend the mail again.

Thank you.

-- 
BR,
Kate

