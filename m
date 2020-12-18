Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAB12DE1E9
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 12:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733204AbgLRLW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 06:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgLRLW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 06:22:26 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CBFC0617A7
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 03:21:46 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id r7so1746148wrc.5
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 03:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0NUjTMUcVO0qCGXSkD6m+wQ/vz/jVZRScuhTw7dmgyQ=;
        b=WDbuL0avnM8ZM5Ifop4nzsFT0UVBrCayTg2OQ/wcpBNbBsg2t1J4wfT+Xt1526aGMd
         lgR/Y2+eHn7iv2bKf37gYC0pfYeJPdICkURqEx1GeTmhvwvzpw9NyB4oLYf+0yWp7vyt
         awyyW4QxHEW7Cj3xRoH6zNAR8yP0XvIYU0fkgiRPQiXr7mlPh5ka9AbBFqodzi4s6wac
         nKx6MJlFJqETKBgl4BjEfl/ms6kpyG6J7D+P6qTZrORgKL3Bz14Rf2HGSjX4jAMUO5/t
         XZ5OTEz5Os+3OKO8pV/btHE0n9NBwMYefYyi6yombnfCrRHH69odnu3DXFz+s/TyBMd5
         OTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0NUjTMUcVO0qCGXSkD6m+wQ/vz/jVZRScuhTw7dmgyQ=;
        b=EX1xZSNnmx3euyNZHn9GSQn0hMowIUFuOTbTT3+2Fh7LKgPoYm6p4gfmty5DL9yqXO
         WV1A9baLXelKAGedRQY83wtqVzp9WUo5ynmp/HcN+dm1HQXCc7GpjbjPaya2M14diqWf
         fz74hmC1PF0nQQ6gSKA4QeOXkseKGCqmWEhLXE+sKp3uPIWWFHaELcOemof1KN72W/ci
         1w27pCsE0o2UDeC/C3Yi4zTQtGm9Hti9AIhZJeWy6td6WQPCeSLaiORNk/6ERtMQTBJD
         G+btc3dtbk7o+B7uK55dHIAMLVnPW6VBYWT2kYzttSpPn+TcwIIbPOTYDmw1fne9Dj+/
         3L7g==
X-Gm-Message-State: AOAM533/rBFswjAQOsIQHEF3BIpmAzy969KYu6GinDkZHmwx7c7xm7J2
        rhdZK6IM6Axedvo1ptyaAGgml8i5CMCmibDBCvjUEg==
X-Google-Smtp-Source: ABdhPJybkChIZsOPvxtUy5vzSoQk4jpCJqUZ7nImjtynHuGJ03k9ybgEfmROhIcueQfPsaFyVblhAdNV8cHWX2SdHy8=
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr3952897wrw.42.1608290505273;
 Fri, 18 Dec 2020 03:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech> <20201210134648.272857-5-maxime@cerno.tech>
In-Reply-To: <20201210134648.272857-5-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 18 Dec 2020 11:21:28 +0000
Message-ID: <CAPY8ntC+SFwJNKQB==xSee_zc5UUKJSczsmy7U6gATsN8Xrvmw@mail.gmail.com>
Subject: Re: [PATCH 04/15] drm/vc4: hdmi: Fix up CEC registers
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
        DRI Development <dri-devel@lists.freedesktop.org>,
        Dom Cobley <popcornmix@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime & Dom

On Thu, 10 Dec 2020 at 13:46, Maxime Ripard <maxime@cerno.tech> wrote:
>
> From: Dom Cobley <popcornmix@gmail.com>
>
> The commit 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout
> abstraction") forgot one CEC register, and made a copy and paste mistake
> for another one. Fix those mistakes.
>
> Fixes: 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout abstraction")
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> index 013fd57febd8..20a1438a72cb 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> @@ -29,6 +29,7 @@ enum vc4_hdmi_field {
>         HDMI_CEC_CPU_MASK_SET,
>         HDMI_CEC_CPU_MASK_STATUS,
>         HDMI_CEC_CPU_STATUS,
> +       HDMI_CEC_CPU_SET,
>
>         /*
>          * Transmit data, first byte is low byte of the 32-bit reg.
> @@ -199,9 +200,10 @@ static const struct vc4_hdmi_register vc4_hdmi_fields[] = {
>         VC4_HDMI_REG(HDMI_TX_PHY_RESET_CTL, 0x02c0),
>         VC4_HDMI_REG(HDMI_TX_PHY_CTL_0, 0x02c4),
>         VC4_HDMI_REG(HDMI_CEC_CPU_STATUS, 0x0340),
> +       VC4_HDMI_REG(HDMI_CEC_CPU_SET, 0x0344),
>         VC4_HDMI_REG(HDMI_CEC_CPU_CLEAR, 0x0348),
>         VC4_HDMI_REG(HDMI_CEC_CPU_MASK_STATUS, 0x034c),
> -       VC4_HDMI_REG(HDMI_CEC_CPU_MASK_SET, 0x034c),
> +       VC4_HDMI_REG(HDMI_CEC_CPU_MASK_SET, 0x0350),
>         VC4_HDMI_REG(HDMI_CEC_CPU_MASK_CLEAR, 0x0354),
>         VC4_HDMI_REG(HDMI_RAM_PACKET_START, 0x0400),
>  };
> --
> 2.28.0
>
