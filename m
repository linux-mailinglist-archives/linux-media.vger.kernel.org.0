Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C302DE40D
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 15:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgLROaN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 09:30:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgLROaN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 09:30:13 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66F9C0617B0
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 06:29:32 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id e25so2790462wme.0
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 06:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fQcnaVeKn76lYRwiXKR4yvTyQ/9Lgo43QJdLzaw88No=;
        b=dPH2ZMGlXf7qxs4VLNk1sqQ6DOFTn3EJphiLC07Hd/sKNpQ9O+b48p1oN5bMMLsNcw
         hUCxxdBSaWxlRLCiL9I/Tfv7Ip15ldWsKrB+y0tzx17DQZbd5X0qybJL4dS6oezkjXuL
         1YSWS2M66tLqmHYc3wFa0FqObn3OYwwVpqrlVgWf01NBCJq8VBu1OVSdI4xzZvIqedxg
         0eUb8r35JQVUXYis0AZPc+9VNUaDtE9dWc6DIn2A/6aZsBXFJBtRfvgj9tL/HyxINwoa
         hYGargZwS5AyYExBC9Pyy1MRNHD2HRaJI2tnVrHRDiAkjnG+32WYgMNbODrH25LBY6hy
         w3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fQcnaVeKn76lYRwiXKR4yvTyQ/9Lgo43QJdLzaw88No=;
        b=GQYUGvYkE6mVTVNeSoZumwaMrI2qfswyDcC0em3cDz9WxabJrh3i88SYg840Vb410Q
         u3PCTrw6KcYN/8Q5BQAfEWj0GKyQT32jhJltfOVWqczSSrjUgnBuQoBmup33yoRdhi3e
         bB4GqluLxqqEUoIpL0wVNV0Lf5/+/ezbvhuXNn8cd7dgRLDtdcVbsOFzClV4FzwqveFC
         levMcdsK3XBXF8FA7N6ehxVdI8xEeRaDiBwK72XjnNGByC/IAY0wSHyAP3Q+y4N+9uKF
         URhd8kohp+vYg893VHagm75exW9NM9cY6NnVMAbQmJfv+jb5NAfKU1f4bfPVv9h4xtDF
         2m6Q==
X-Gm-Message-State: AOAM531/ApS3nFSitGb+RixNwMApwEhYRiEN92TsedSftQJR+6qbMyau
        tbhqiaythegfPbDV4/9utyjiZaYGui0bJu9lnTYj6Q==
X-Google-Smtp-Source: ABdhPJx1zfDnyXEmVWiw9EZm8yj56h7EPNv2EiQk8r5FgzIdRnBEqEC4Oc6xyUqbtGIHIlNzOeHBGh+HWy5KnmgE0kE=
X-Received: by 2002:a1c:bc88:: with SMTP id m130mr4645539wmf.82.1608301771650;
 Fri, 18 Dec 2020 06:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech> <20201210134648.272857-13-maxime@cerno.tech>
In-Reply-To: <20201210134648.272857-13-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 18 Dec 2020 14:29:14 +0000
Message-ID: <CAPY8ntCkFU47CJmDf_E1RVgprscq=BYj4o2=8ReTOfe8hd0d0Q@mail.gmail.com>
Subject: Re: [PATCH 12/15] drm/vc4: hdmi: Don't register the CEC adapter if
 there's no interrupts
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

On Thu, 10 Dec 2020 at 13:47, Maxime Ripard <maxime@cerno.tech> wrote:
>
> We introduced the BCM2711 support to the vc4 HDMI controller with 5.10,
> but this was lacking any of the interrupts of the CEC controller so we
> have to deal with the backward compatibility.
>
> Do so by simply ignoring the CEC setup if the DT doesn't have the
> interrupts property.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 327638d93032..69217c68d3a4 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1655,9 +1655,15 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>  {
>         struct cec_connector_info conn_info;
>         struct platform_device *pdev = vc4_hdmi->pdev;
> +       struct device *dev = &pdev->dev;
>         u32 value;
>         int ret;
>
> +       if (!of_find_property(dev->of_node, "interrupts", NULL)) {
> +               dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
> +               return 0;
> +       }
> +
>         vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
>                                                   vc4_hdmi, "vc4",
>                                                   CEC_CAP_DEFAULTS |
> --
> 2.28.0
>
