Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB0D2DE516
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 15:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbgLROqx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 09:46:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbgLROqx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 09:46:53 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0ECC061282
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 06:46:12 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id y17so2433902wrr.10
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 06:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IOS7/z9Qy+orQvgN4m7ZcdCgVVfUTOFkUvXr8iUDtNQ=;
        b=jP4+qMylQ3mhIfQvzLOdmkmIohRItctCA1AYJFdDpD6neUt/k85ZMDI4i2OzBVHyT8
         9nZ8g3l6IpArhkwp9iYEmf9uY02iLC5C8AVgXOkEOt7FeJlJlwv9EeOc7LDDxCYqxLsR
         6nbfPcHjsDCI2lX6zoUbekAqhOBvcrCIGVw+gKlfwdYYe4LxGRM1OEJ5G6BWFiQMl/zr
         kTRisF/pNz/FW6A2LcC3KDrDDUM8wl+g8CFiZAjD0xC/vkgdkVrJq+Hxz1ZW/sTWIl9v
         lHLPbwplwfadoeKNL3pYmKNleHr7uoNPsZ5I2f+iiEwzOM8u96WE5ZpnZhcKRgMS3wKM
         QWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IOS7/z9Qy+orQvgN4m7ZcdCgVVfUTOFkUvXr8iUDtNQ=;
        b=k2G2C+Ybe0xa6+eVqk7q3cqrD2Ujxs4QZZaUhnE2zULw6n/nGLtiHtsi1Z7EFrwufN
         Kjs79QDP6OCdU10dyRF/bgey1ylLDEfKlHgEN5AynLuc0Amh/0nz+RwlpWMIbrEOI7Fp
         sNGYj/72k8thBmzvMLCJrZ+yaDdudhlu6iMEqKnj17PPt0Z09sF3lUtRrVB1owbCKEcY
         YnnKRgXE1in917ZJoGwUOlQb8/IcYN7moRb1O38usHcOVAWPgn7OoggKZH8Kco31W6Q2
         pNiRw/w0PzEOz2Cwsfy/Bv83Rk0GdPYyLSTh4m/C4aR/lBDG3AyXf7Ob58MkqzA2z8XG
         NAmw==
X-Gm-Message-State: AOAM532P0bzlYnX76PbEpAEzzEoQZdvApB7CCPOBIm26R9C5Swr0zacj
        JkGluVGmzUVSDSyB03QLq5eQ7nPgFFJh6ujFQMj7VA==
X-Google-Smtp-Source: ABdhPJwtPel488pKG+titVqvbHsJDbSA8DLgQ+5Gid39Aj6tn9e5V4SXOrJcLJdMUB9QQY12ijJ55Y7nrivzD5nE7ec=
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr4827679wrq.47.1608302771328;
 Fri, 18 Dec 2020 06:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech> <20201210134648.272857-6-maxime@cerno.tech>
 <CAPY8ntDXJWR-vssSLsRbh7RTd-40SQApOxWGwt2LkeoyxCdYMw@mail.gmail.com>
In-Reply-To: <CAPY8ntDXJWR-vssSLsRbh7RTd-40SQApOxWGwt2LkeoyxCdYMw@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 18 Dec 2020 14:45:54 +0000
Message-ID: <CAPY8ntAx56BhKLVGyNUjjOYSaaJ1H2wku=Co8oqb38bPDEvGKA@mail.gmail.com>
Subject: Re: [PATCH 05/15] drm/vc4: hdmi: Restore cec physical address on reconnect
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

On Fri, 18 Dec 2020 at 14:21, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi  Maxime & Dom
>
> On Thu, 10 Dec 2020 at 13:47, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > From: Dom Cobley <popcornmix@gmail.com>
> >
> > Currently we call cec_phys_addr_invalidate on a hotplug deassert.
> > That may be due to a TV power cycling, or an AVR being switched
> > on (and switching edid).
> >
> > This makes CEC unusable since our controller wouldn't have a physical
> > address anymore.
> >
> > Set it back up again on the hotplug assert.
> >
> > Fixes: 15b4511a4af6 ("drm/vc4: add HDMI CEC support")
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++--------
> >  1 file changed, 17 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index 28b78ea885ea..eff3bac562c6 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -136,20 +136,29 @@ static enum drm_connector_status
> >  vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
> >  {
> >         struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> > +       bool connected = false;
> >
> >         if (vc4_hdmi->hpd_gpio) {
> >                 if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
> >                     vc4_hdmi->hpd_active_low)
> > -                       return connector_status_connected;
> > -               cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
> > -               return connector_status_disconnected;
> > -       }
> > -
> > -       if (drm_probe_ddc(vc4_hdmi->ddc))
> > -               return connector_status_connected;
> > -
> > +                       connected = true;
> > +       } else if (drm_probe_ddc(vc4_hdmi->ddc))
> > +               connected = true;
> >         if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED)
>
> This needs to become an "else if(...".
> It used to be that all the other paths would return, so were mutually
> exclusive to this. Now they set a thing and keep going we need to
> avoid reading the register should there be a HPD gpio or the ddc probe
> succeeds.
> Memory says that otherwise Pi3 always reports connected.
>
> I fixed this in a downstream patch already -
> https://github.com/raspberrypi/linux/commit/d345caec1e9b2317b9cd7eb5b92ae453a0d3e98c
>
> Otherwise fine.
>
>   Dave
>
> > +               connected = true;
> > +       if (connected) {
> > +               if (connector->status != connector_status_connected) {
> > +                       struct edid *edid = drm_get_edid(connector, vc4_hdmi->ddc);
> > +
> > +                       if (edid) {
> > +                               cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
> > +                               vc4_hdmi->encoder.hdmi_monitor = drm_detect_hdmi_monitor(edid);
> > +                               drm_connector_update_edid_property(connector, edid);

Actually looking at this again in the context of the other changes, do
we need to call drm_connector_update_edid_property() here?

We've just called drm_get_edid() to get the edid, and that calls
drm_connector_update_edid_property() as well [1]
Updating vc4_hdmi->encoder.hdmi_monitor may be necessary. It's
otherwise done in vc4_hdmi_connector_get_modes, which I sort of expect
to be called almost immediately by the framework when connector_detect
returns "connected". I haven't checked if that is guaranteed though.

vc4_hdmi_connector_get_modes also includes a manual call to
drm_connector_update_edid_property after having just called
drm_get_edid, so that one feels redundant too.

  Dave

[1] https://elixir.bootlin.com/linux/v5.10/source/drivers/gpu/drm/drm_edid.c#L2059

> > +                               kfree(edid);
> > +                       }
> > +               }
> >                 return connector_status_connected;
> > +       }
> >         cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
> >         return connector_status_disconnected;
> >  }
> > --
> > 2.28.0
> >
