Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8524B6684
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 09:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234915AbiBOIsv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 03:48:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234876AbiBOIsu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 03:48:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6ACBD113AC1
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 00:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644914919;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cAghCw6nMXIP8DbPC2ZTmMjVdzgtfdV0Q4rDuIo9NkY=;
        b=DSqmbLSAwCAJVngxiscPK3AI83fBvtKyU1g0AilU1+5l1HWqSms+MFHSUGa0sZO/SfGwjz
        MTARKord6OnXu1SikYooOuoDXp45WeVwP+NSyH7Y/dELylzZWdS76PxZnMHKfa6/B5mtm0
        Kk9NNo2FFnT7z/6lrYWi3bCEQd9gsF4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-3qVRJi53MJe82FRlJfXUWA-1; Tue, 15 Feb 2022 03:48:36 -0500
X-MC-Unique: 3qVRJi53MJe82FRlJfXUWA-1
Received: by mail-pj1-f69.google.com with SMTP id q40-20020a17090a17ab00b001bafa89b70aso592965pja.2
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 00:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cAghCw6nMXIP8DbPC2ZTmMjVdzgtfdV0Q4rDuIo9NkY=;
        b=QX2ycoyc0BXo0AH4GoHz+POCqcQ/IEwzkvjHi5ZxegcTK/ONNOr4XzDg4s2wIpJL45
         fsbjGwRUGJ/drVaOQRKOpeAUOUgiaFS4606iz3SYnsoM4T17nK+7ASJyHAdeExxrpgAS
         sybm/nAvpFYGTqTZHvIo3lJYnNFI2ASsxJXo9t0gqx5YKeVgaKwy+UB3m0ObKscOAdSo
         6x4uLgYMJlDEc431T8yl+FdDyyv2vCv4rYYw6yWgdqjPRMQJPkJyWFRwaP6oAOZriWqb
         GFjJcDfp+2gukdNs9kTRgBjGjBj3G8r+0Sqm/uNTr7soTfGYsS5xOgCFZ/Kuj6Rcg60F
         ss2Q==
X-Gm-Message-State: AOAM533t4X1Fa6XEvLcREXVPBniV+XBofbpx+wnwP+U+6zQ5KgIn9JNq
        aUq0LlTOBMK+gsN7sB9fgZeCAVL/sInvJK1ImfILZjWqWfO9KOplBtolTeXxQSBs/IgkAvlryOA
        JS1EBvAstEugkw7y0/1M9ge9YTGwQTjE65lpo1h0=
X-Received: by 2002:a63:2bc5:: with SMTP id r188mr2644599pgr.363.1644914915604;
        Tue, 15 Feb 2022 00:48:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNykZwzg4bf+5n8EbXDkY7JRsdOTnLNDPgNJlOcTDejNQ8sWs8DiYpM4W3ztHYleOanIdgFMhO3Rj6Rj63QAs=
X-Received: by 2002:a63:2bc5:: with SMTP id r188mr2644575pgr.363.1644914915393;
 Tue, 15 Feb 2022 00:48:35 -0800 (PST)
MIME-Version: 1.0
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com> <1644890154-64915-7-git-send-email-wangqing@vivo.com>
In-Reply-To: <1644890154-64915-7-git-send-email-wangqing@vivo.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 15 Feb 2022 09:48:24 +0100
Message-ID: <CAO-hwJLwomyHyjza8x3cEhR97HkK7Z7yPWVXwA4-1jmM=WKqeQ@mail.gmail.com>
Subject: Re: [PATCH V3 6/13] input: serio: use time_is_before_jiffies()
 instead of open coding it
To:     Qing Wang <wangqing@vivo.com>
Cc:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 15, 2022 at 2:57 AM Qing Wang <wangqing@vivo.com> wrote:
>
> From: Wang Qing <wangqing@vivo.com>
>
> Use the helper function time_is_{before,after}_jiffies() to improve
> code readability.
>
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

>  drivers/input/serio/ps2-gpio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/serio/ps2-gpio.c b/drivers/input/serio/ps2-gpio.c
> index 8970b49..7834296
> --- a/drivers/input/serio/ps2-gpio.c
> +++ b/drivers/input/serio/ps2-gpio.c
> @@ -136,7 +136,7 @@ static irqreturn_t ps2_gpio_irq_rx(struct ps2_gpio_data *drvdata)
>         if (old_jiffies == 0)
>                 old_jiffies = jiffies;
>
> -       if ((jiffies - old_jiffies) > usecs_to_jiffies(100)) {
> +       if (time_is_before_jiffies(old_jiffies + usecs_to_jiffies(100))) {
>                 dev_err(drvdata->dev,
>                         "RX: timeout, probably we missed an interrupt\n");
>                 goto err;
> @@ -237,7 +237,7 @@ static irqreturn_t ps2_gpio_irq_tx(struct ps2_gpio_data *drvdata)
>         if (old_jiffies == 0)
>                 old_jiffies = jiffies;
>
> -       if ((jiffies - old_jiffies) > usecs_to_jiffies(100)) {
> +       if (time_is_before_jiffies(old_jiffies + usecs_to_jiffies(100))) {
>                 dev_err(drvdata->dev,
>                         "TX: timeout, probably we missed an interrupt\n");
>                 goto err;
> --
> 2.7.4
>

