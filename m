Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A7630008A
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 11:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbhAVKfw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 05:35:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727918AbhAVKcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 05:32:51 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D81EC061786
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 02:32:10 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id c128so3877917wme.2
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 02:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zqPi5MJbj1ms2b0Q8q7oOCrglElwMPk+QoWvn6qZ8Lg=;
        b=H6BDzO8wt0zPd6IO4WofunMxSNshx5vl4o49LxSFogf+BCn/vCC98TIqePtTm+5h1x
         yDVKOa6am8btjgY6xmYocEO3sKTXo/j5sGlKyPVb01mODw69yYenSPEmmJqreultpMc+
         pPoqPqSNIGNzoVdenVvvuZ2hF9qZQLTgm5B9ViaW6zn75oXHq5/w0AF8gehobqmXsQD9
         d/r5mCeBkE1m63az/u6sD2pg7hYzXSmMERBgwYc1aIKdD8UDD+NS9zjberNwTsJ5m3ba
         idj1NpnscvnWVUtl9Fn6mpJi5BMN+96RRV0QvmGGIo1iUMwCjFb7RRJ3fgJKdgPwTUz0
         h6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zqPi5MJbj1ms2b0Q8q7oOCrglElwMPk+QoWvn6qZ8Lg=;
        b=eL8hDrfAfZu35od/hZc4X4BwRWs7OP48kPAnhcZNo9WX9zZoTRq3oVCn89H5ME8w0E
         F9FmPO5FjwEDMN0UBkLnjsa6jJhA0JGaV368Nxd8QIPj9XdsEc/535zWX9+s6X9vQW3g
         RvLCm9eALEhYcV15o7TtZ8TZaIQw3yir3GZ1sbiwwXQAiG6MWu3XHjt6vaj/Ugg12A5z
         ZuSO9EvyGlVW4UT6QonpdAJbrgRhcX2tKSk/RxVvDSodyzgonU/7mI54RhEdkHCwIkUm
         rZtiHYBu7A0vPvQpWaUzITIm6vlZbsAWpG2kTDUzh5yPYxcvR85kC2mqWFKcmtydVwE5
         b1bQ==
X-Gm-Message-State: AOAM533QE7o+gK5hwGfw1B4KeMus/Tknye+9s606IH/aRWgMQxZGJMR0
        ZrYZxEeKC9cW8CejQxjnDctx9riPWnRkw/rPgp1fJw==
X-Google-Smtp-Source: ABdhPJz76UhEva/JXNulXxfAlQoMv3hOfREdUPUZ/oJbYQoDfEa5wiLS2sBJAZNWLdnfrtRz6I0qapY32xXzEYiN/Xo=
X-Received: by 2002:a1c:f201:: with SMTP id s1mr3237293wmc.158.1611311528710;
 Fri, 22 Jan 2021 02:32:08 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech> <20210111142309.193441-6-maxime@cerno.tech>
In-Reply-To: <20210111142309.193441-6-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 22 Jan 2021 10:31:53 +0000
Message-ID: <CAPY8ntD=52HEwc6-3XggH4_CErjc2q9aBUc_c29L13UGuJcvqQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] drm/vc4: hdmi: Restore cec physical address on reconnect
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
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dom Cobley <popcornmix@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime

Sorry for the slow reply on these patches.

On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>
> From: Dom Cobley <popcornmix@gmail.com>
>
> Currently we call cec_phys_addr_invalidate on a hotplug deassert.
> That may be due to a TV power cycling, or an AVR being switched
> on (and switching edid).
>
> This makes CEC unusable since our controller wouldn't have a physical
> address anymore.
>
> Set it back up again on the hotplug assert.
>
> Fixes: 15b4511a4af6 ("drm/vc4: add HDMI CEC support")
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I follow the logic, and trust Dom that it works, but I don't know if
that is the correct thing within CEC.
Ideally Hans will comment as the original author of the CEC code - I
believe he's testing the series anyway.

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 7945dbcee78c..c3a301396aad 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -136,20 +136,32 @@ static enum drm_connector_status
>  vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
>         struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> +       bool connected = false;
>
>         if (vc4_hdmi->hpd_gpio) {
>                 if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
>                     vc4_hdmi->hpd_active_low)
> -                       return connector_status_connected;
> -               cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
> -               return connector_status_disconnected;
> +                       connected = true;
> +       } else if (drm_probe_ddc(vc4_hdmi->ddc)) {
> +               connected = true;
> +       } else if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED) {
> +               connected = true;
>         }
>
> -       if (drm_probe_ddc(vc4_hdmi->ddc))
> -               return connector_status_connected;
> +       if (connected) {
> +               if (connector->status != connector_status_connected) {
> +                       struct edid *edid = drm_get_edid(connector, vc4_hdmi->ddc);
> +
> +                       if (edid) {
> +                               cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
> +                               vc4_hdmi->encoder.hdmi_monitor = drm_detect_hdmi_monitor(edid);
> +                               kfree(edid);
> +                       }
> +               }
>
> -       if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED)
>                 return connector_status_connected;
> +       }
> +
>         cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
>         return connector_status_disconnected;
>  }
> --
> 2.29.2
>
