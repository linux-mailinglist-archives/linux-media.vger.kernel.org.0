Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C56C42DE207
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 12:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgLRLb0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 06:31:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgLRLb0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 06:31:26 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C2FC0617B0
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 03:30:45 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id i9so1779728wrc.4
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 03:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=llHW0DBcsKI4xlBf5BlOjoI6hCuZnmrZ4dlRgFFGbPI=;
        b=hn0pAdnsaIXVrnwj/Tky6J7bEbs1Dk4WuING5W/EnDn+19RWSVIF2VylblcK6A5SUx
         w2gKVOsEDpjx1+iVK6Y8sBIOzqvDfWr7sljsMVxXUvKogzbJ6gye93m3jRjP5zi9EVyF
         kH9Ymlf2/OPpwFI647e+04mUG1zeLr+xGdls6EmLnB3rpgYjhSyajYgc/JDXXORyqRJw
         xkSkNXd99kDxZrmjnDTNRGDpXYSbXN9bzUb8rIGILCk5rDSYojiihMu2BXLq4nVvGdlG
         8kbaEWh0pZrf34hY1r6ivf/HDX8Qz0YrardDH9Sap1PR7mk6WIgkOBH6fDzlCxI0850L
         axEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=llHW0DBcsKI4xlBf5BlOjoI6hCuZnmrZ4dlRgFFGbPI=;
        b=s4VJOMHHc0nqWRjE0LpU+ZPJaNw8Z7n84TYA/TbnOGgnlhZE6nV87myURuVFsEBe3M
         ynRQp0rz8j77gP7Dm3LIY8GoraFgkDBZ6xgA6dHeiNe66YW3984pnz/XYifOqAjl08zR
         rmoSR78XJmwNCwcgXQ7IxUSYDNH2KGdTGz/wOu/i/bnaH3275ycHyoTShTOPgZASzE1r
         NDtEjHzw8fr0UXVU7A1QG0LfA7krZ3J57K1GZZMsj+Ciru1+RX5dknrzU0pBjJLdaBBO
         crlXE7K6oZihDeY8kyUUEOC4LebKK85ZicWuqofBlzX4kabYlTYIzatn4+DxWPUnnVgs
         t37A==
X-Gm-Message-State: AOAM531v68Qj4wSnxNzd9aVn6zekcWmUV1euhkkf8JTQzJ1CepYgz5tr
        nv+Ked/fQwEgnenfgyhy27frfGt6FQzAhfvqi+DRgQ==
X-Google-Smtp-Source: ABdhPJxZF8SJF7CsKrXSTDuPSneEb5qdd88m5GlPMZHcvG8QdlWyN9NbnpjKwA6hdXbEcaT5QG19TjRA6QE8HXzoxGk=
X-Received: by 2002:adf:d18a:: with SMTP id v10mr3865608wrc.273.1608291044405;
 Fri, 18 Dec 2020 03:30:44 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech> <20201210134648.272857-7-maxime@cerno.tech>
In-Reply-To: <20201210134648.272857-7-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 18 Dec 2020 11:30:27 +0000
Message-ID: <CAPY8ntBySziAsVk+UDP9myF-zA5bUmWcYVUGir3e=_o_DhQsjg@mail.gmail.com>
Subject: Re: [PATCH 06/15] drm/vc4: hdmi: Compute the CEC clock divider from
 the clock rate
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Jason Cooper <jason@lakedaemon.net>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-rpi-kernel@lists.infradead.org,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime

On Thu, 10 Dec 2020 at 13:47, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The CEC clock divider needs to output a frequency of 40kHz from the HSM
> rate on the BCM2835. The driver used to have a fixed frequency for it,
> but that changed and we now need to compute it dynamically to maintain
> the proper rate.
>
> Fixes: cd4cb49dc5bb ("drm/vc4: hdmi: Adjust HSM clock rate depending on pixel rate")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

(To be a total pedant it's still a fixed frequency on vc4, but it's
configurable via the variant entry).

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index eff3bac562c6..0c53d7427d15 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1586,6 +1586,7 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>  {
>         struct cec_connector_info conn_info;
>         struct platform_device *pdev = vc4_hdmi->pdev;
> +       u16 clk_cnt;
>         u32 value;
>         int ret;
>
> @@ -1611,8 +1612,9 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>          * divider: the hsm_clock rate and this divider setting will
>          * give a 40 kHz CEC clock.
>          */
> +       clk_cnt = clk_get_rate(vc4_hdmi->hsm_clock) / CEC_CLOCK_FREQ;
>         value |= VC4_HDMI_CEC_ADDR_MASK |
> -                (4091 << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
> +                (clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
>         HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
>         ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
>                                         vc4_cec_irq_handler,
> --
> 2.28.0
>
