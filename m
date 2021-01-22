Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64E43003E0
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 14:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbhAVNL7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 08:11:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbhAVNLp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 08:11:45 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BA8C06174A
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:11:05 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id m4so5030906wrx.9
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DlbQDTL9lgcBTkGtGPLxxHcpZqtYZlnjZgESPzNd3dk=;
        b=cvMBoOPbyHYvHuRZJUbkoYI6wQr+uFNzsP8Byd3bREwnZWQckWn9O3O9z4rbqAAxCG
         DG3FeAiintfRZo3klDvSndwOAEafZQxbQ6F7WTtmJLwIjp23HpS2osdES8yLkzS7vjV6
         UFHfZEM1Tl/ujKCCd90L4Fvd8mcPz+6eD9YuVeQeeyy5kKVDD5s9ci+fdJWlKEnj3xZT
         +DIpvikohimdbEO+qam8p2fIhaYzFI74vUqDLd6LPr+MTmSUopRwDXWhCG9LGLIXMe0h
         c87V5IsAQiLZ3HVsOMhJD/IRXutd5+uq5eEb87yD52RiAU+XGsa7yCtbSSCADFUNHOg2
         7HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DlbQDTL9lgcBTkGtGPLxxHcpZqtYZlnjZgESPzNd3dk=;
        b=WYh0iqoFlRlBn0BMDQ9KNlckN/SYkvAoGBa/xV/cX98dyqKvo+/xwcfuH6Ht2Pvjpw
         rO+0424Nazj4lwRThB0q5TURMVbdBXJdMqndGaMDQxua7nFpgrNs7BQOxMcDeRKVR3QG
         vDwpC7mWWLkhs79ts/MvG62z8MbtJApLY8F6gzlbwUzLiWmqwEpcCXtEBbyCw7k42ngA
         uwvcPmXjBFsL1+A653X6pwYxC6nP4LYZbY80prD62e8et50kS+MV54TfVYbY0ZzpsrzR
         8iZiAZORuWtz8Ydiqrgmw5FeneM34GbhpjkAuuKCmrUYOMbSsrI+EqQYJPwS52ocKZyq
         RgqA==
X-Gm-Message-State: AOAM533J1X+KfEhY0j+uv31Ck+H0kGyazzy46SHw9TfQb0/54pY5iCPE
        oWNKLq4rTttN1uHWhC/XW0Tola5vorcOWEuXOPKQxw==
X-Google-Smtp-Source: ABdhPJzM9x7gbuptc/+Kd7a/slbXsAMEIvUb+yNdZCSX3L+dSiV9l/Kk/Q81u61D3jOMDh403qjkCGqTrzJC12ovbLY=
X-Received: by 2002:a05:6000:1082:: with SMTP id y2mr4331942wrw.27.1611321064346;
 Fri, 22 Jan 2021 05:11:04 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech> <20210111142309.193441-11-maxime@cerno.tech>
In-Reply-To: <20210111142309.193441-11-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 22 Jan 2021 13:10:49 +0000
Message-ID: <CAPY8ntCdxn3=A19VVsxnrPppk0O7eyzxa3bwFWQj1QEXnQ_GWA@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] drm/vc4: hdmi: Support BCM2711 CEC interrupt setup
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime

On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HDMI controller found in the BCM2711 has an external interrupt
> controller for the CEC and hotplug interrupt shared between the two
> instances.
>
> Let's add a variant flag to register a single interrupt handler and
> deals with the interrupt handler setup, or two interrupt handlers
> relying on an external irqchip.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Looks good

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 42 ++++++++++++++++++++++++++--------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 ++++++
>  2 files changed, 39 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 12ca5f3084af..d116ecfd8cf7 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1605,9 +1605,11 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
>                            ((3600 / usecs) << VC4_HDMI_CEC_CNT_TO_3600_US_SHIFT) |
>                            ((3500 / usecs) << VC4_HDMI_CEC_CNT_TO_3500_US_SHIFT));
>
> -               HDMI_WRITE(HDMI_CEC_CPU_MASK_CLEAR, VC4_HDMI_CPU_CEC);
> +               if (!vc4_hdmi->variant->external_irq_controller)
> +                       HDMI_WRITE(HDMI_CEC_CPU_MASK_CLEAR, VC4_HDMI_CPU_CEC);
>         } else {
> -               HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, VC4_HDMI_CPU_CEC);
> +               if (!vc4_hdmi->variant->external_irq_controller)
> +                       HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, VC4_HDMI_CPU_CEC);
>                 HDMI_WRITE(HDMI_CEC_CNTRL_5, val |
>                            VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET);
>         }
> @@ -1682,8 +1684,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>         cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
>         cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
>
> -       HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
> -
>         value = HDMI_READ(HDMI_CEC_CNTRL_1);
>         /* Set the logical address to Unregistered */
>         value |= VC4_HDMI_CEC_ADDR_MASK;
> @@ -1691,12 +1691,32 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>
>         vc4_hdmi_cec_update_clk_div(vc4_hdmi);
>
> -       ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
> -                                       vc4_cec_irq_handler,
> -                                       vc4_cec_irq_handler_thread, 0,
> -                                       "vc4 hdmi cec", vc4_hdmi);
> -       if (ret)
> -               goto err_delete_cec_adap;
> +       if (vc4_hdmi->variant->external_irq_controller) {
> +               ret = devm_request_threaded_irq(&pdev->dev,
> +                                               platform_get_irq_byname(pdev, "cec-rx"),
> +                                               vc4_cec_irq_handler_rx_bare,
> +                                               vc4_cec_irq_handler_rx_thread, 0,
> +                                               "vc4 hdmi cec rx", vc4_hdmi);
> +               if (ret)
> +                       goto err_delete_cec_adap;
> +
> +               ret = devm_request_threaded_irq(&pdev->dev,
> +                                               platform_get_irq_byname(pdev, "cec-tx"),
> +                                               vc4_cec_irq_handler_tx_bare,
> +                                               vc4_cec_irq_handler_tx_thread, 0,
> +                                               "vc4 hdmi cec tx", vc4_hdmi);
> +               if (ret)
> +                       goto err_delete_cec_adap;
> +       } else {
> +               HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
> +
> +               ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
> +                                               vc4_cec_irq_handler,
> +                                               vc4_cec_irq_handler_thread, 0,
> +                                               "vc4 hdmi cec", vc4_hdmi);
> +               if (ret)
> +                       goto err_delete_cec_adap;
> +       }
>
>         ret = cec_register_adapter(vc4_hdmi->cec_adap, &pdev->dev);
>         if (ret < 0)
> @@ -2095,6 +2115,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
>                 PHY_LANE_CK,
>         },
>         .unsupported_odd_h_timings      = true,
> +       .external_irq_controller        = true,
>
>         .init_resources         = vc5_hdmi_init_resources,
>         .csc_setup              = vc5_hdmi_csc_setup,
> @@ -2121,6 +2142,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
>                 PHY_LANE_2,
>         },
>         .unsupported_odd_h_timings      = true,
> +       .external_irq_controller        = true,
>
>         .init_resources         = vc5_hdmi_init_resources,
>         .csc_setup              = vc5_hdmi_csc_setup,
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 6966db1a0957..d71f6ed321bf 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -64,6 +64,13 @@ struct vc4_hdmi_variant {
>         /* The BCM2711 cannot deal with odd horizontal pixel timings */
>         bool unsupported_odd_h_timings;
>
> +       /*
> +        * The BCM2711 CEC/hotplug IRQ controller is shared between the
> +        * two HDMI controllers, and we have a proper irqchip driver for
> +        * it.
> +        */
> +       bool external_irq_controller;
> +
>         /* Callback to get the resources (memory region, interrupts,
>          * clocks, etc) for that variant.
>          */
> --
> 2.29.2
>
