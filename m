Return-Path: <linux-media+bounces-4566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F10845BA2
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 16:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A87B1F2C1C2
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 15:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DCC626A6;
	Thu,  1 Feb 2024 15:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="UORXgYaD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3D66215B
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706801624; cv=none; b=F1uzWk1Sf/ZfXScNgW1fU5VcTM1Eq4y1tcsKpLMynLgpQGPgdMJ0CrzDvZ/FUOhVdObXy3yWtdLjaRRcwRyRnDEWXn/Mu6ZLqOIB/l2d2KvcXy+wpR6dKPiGpBkU8De5JTiK/SUnTswPatbGYZfrjPjiUsLVSs393NJgI5r0EWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706801624; c=relaxed/simple;
	bh=4Sy3fZOhEVHDOtZKqTI3KgHxNg/w+742xJD2OXVh4lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6Wu9R4DnyTb9x2mKZm/pv/ceochrqXJABjC8brJq4RYy510X1kiLqRWH/72VdXKlRItChmk7brzUtdP6rOEVJfZWyNjPhxcisaNkNdCnZCepiBFDgi3c7Ga0IUod0T7eBCBHXiWs+O384c5wetZI3SJbrA2b0BKhgsEL8BKilw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=UORXgYaD; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6040a879e1eso11605017b3.3
        for <linux-media@vger.kernel.org>; Thu, 01 Feb 2024 07:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1706801620; x=1707406420; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9g5X/MoP2CIyVb1m6cPTMy+MK/TlLDYbdppGeENsUGg=;
        b=UORXgYaDt8BjF6EQuXAM1GRtJ6celug4q6aPMwVLt0cHJMnmSEyz9n3jzkHjFsChZ/
         4b3iOf9gTxxBhsufERiQOSXuxNr4VKNWp3zT6B3vs2qKHeyAPeE4VI9AkpdfrRpFW5qo
         MIIaVZFaftM4trd+VoBzMAtbJP6rH7c5GyAl89StO4HbqmOGiB1X3HDb+Ndg+i5Ocmf2
         sAHvxjrOxjOxMhLx+zbxFAGSWCqxi3k/sEVsTjXd8OSxuN+/LxbHARsnZJcvQTrpiPmL
         7OXqbt9EqIUXXFEn7dktsSkwdhtzN6Ae9h6NF+arpsTI3Y8VEXvow7CDuXVBGotbNGv7
         ozlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706801620; x=1707406420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9g5X/MoP2CIyVb1m6cPTMy+MK/TlLDYbdppGeENsUGg=;
        b=FJt6Gb0t1SPWPcyEuHrWJO1WYUys8Gd1vQoHk082ftgpOoXbVtpQwmr4qascjs1hY9
         M43ZJswJ4PShqVFf6k2JobzfHCkCa3RjZR/NAC4c16IGtVL2ckvEJIIrOrzUzLiGoQCT
         fc7cWxkavcZX65y7IwA3z8BgDvT05+RErhw26RiY2sO0Nm8aKPgBw+KDKP3btYzK8G/J
         ANEjL+PiliZkwZUPoMiisUAgOzx6RRRO33WDZMSe0VXL7SHlua2887isBd8onVF9w3Np
         zv+uANksfRwAilOibX2KJAVV63KXtCaRCIE7KxHf15GlJo29sltx6Mf0x0PS2PLxuwz4
         vXEg==
X-Gm-Message-State: AOJu0YyUNLuqTEFVW+/6gztUazUm2dfJABQKxxnuMKIqxZOo3s4Y1TNp
	IRu6LLxoS8X/NOoFNiZdfHgEIrrltOiUJ32W9d7tg/HnGYENg1xkdmihvcgrCIpeZ2EWg6ewV86
	tt7ORitR6b4GFpyc3K37+N1gXezVE/kPOkavf0A==
X-Google-Smtp-Source: AGHT+IHqiUtD2JG/xh5leeuuBCGEniE23V5uMzmzrjcmuonFmYWAx3gVWyr/EdUEfJ0Ft8FL9Z4hkCYQ/v1fUQD2kCs=
X-Received: by 2002:a81:b608:0:b0:5ff:b07b:fb0b with SMTP id
 u8-20020a81b608000000b005ffb07bfb0bmr5193403ywh.49.1706801620096; Thu, 01 Feb
 2024 07:33:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-15-6538e19d634d@kernel.org>
 <CAPY8ntBQ+qY9441-rMzq_JAoYAaY_r+E-ADv7Wry0tJNTzKpwg@mail.gmail.com> <jlkoofv7nszj2uqmo2672yo4wjd3yjqarge2l2hxofixcchu6a@j72pa4iybitd>
In-Reply-To: <jlkoofv7nszj2uqmo2672yo4wjd3yjqarge2l2hxofixcchu6a@j72pa4iybitd>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Feb 2024 15:33:24 +0000
Message-ID: <CAPY8ntAmXyKtebMeM7rLtgRR+QwL1H+UCwSO=bLBQN4TsgwsDg@mail.gmail.com>
Subject: Re: Re: [PATCH v5 15/44] drm/connector: hdmi: Compute bpc and format automatically
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxime

On Thu, 1 Feb 2024 at 12:51, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Thu, Dec 14, 2023 at 03:10:43PM +0000, Dave Stevenson wrote:
> > > +static bool
> > > +sink_supports_format_bpc(const struct drm_connector *connector,
> > > +                        const struct drm_display_info *info,
> > > +                        const struct drm_display_mode *mode,
> > > +                        unsigned int format, unsigned int bpc)
> > > +{
> > > +       struct drm_device *dev = connector->dev;
> > > +       u8 vic = drm_match_cea_mode(mode);
> > > +
> > > +       if (vic == 1 && bpc != 8) {
> > > +               drm_dbg(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);
> > > +               return false;
> > > +       }
> > > +
> > > +       if (!info->is_hdmi &&
> > > +           (format != HDMI_COLORSPACE_RGB || bpc != 8)) {
> > > +               drm_dbg(dev, "DVI Monitors require an RGB output at 8 bpc\n");
> > > +               return false;
> > > +       }
> > > +
> > > +       if (!(connector->hdmi.supported_formats & BIT(format))) {
> > > +               drm_dbg(dev, "%s format unsupported by the connector.\n",
> > > +                       drm_hdmi_connector_get_output_format_name(format));
> > > +               return false;
> > > +       }
> > > +
> > > +       switch (format) {
> > > +       case HDMI_COLORSPACE_RGB:
> > > +               drm_dbg(dev, "RGB Format, checking the constraints.\n");
> > > +
> > > +               if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
> > > +                       return false;
> >
> > We've dropped this check from vc4 in our downstream kernel as it stops
> > you using the prebaked EDIDs (eg drm.edid_firmware=edid/1024x768.bin),
> > or any other EDID that is defined as an analog monitor.
> > The EDID parsing bombs out at [1], so info->color_formats gets left at 0.
>
> Right, but it only does so if the display isn't defined as a digital display...
>
> > RGB is mandatory for both DVI and HDMI, so rejecting it seems overly fussy.
>
> ... which is required for both DVI and HDMI.
>
> And sure enough, if we decode that EDID:
>
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 31 d8 00 00 00 00 00 00
> 05 16 01 03 6d 23 1a 78 ea 5e c0 a4 59 4a 98 25
> 20 50 54 00 08 00 61 40 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 64 19 00 40 41 00 26 30 08 90
> 36 00 63 0a 11 00 00 18 00 00 00 ff 00 4c 69 6e
> 75 78 20 23 30 0a 20 20 20 20 00 00 00 fd 00 3b
> 3d 2f 31 07 00 0a 20 20 20 20 20 20 00 00 00 fc
> 00 4c 69 6e 75 78 20 58 47 41 0a 20 20 20 00 55
>
> ----------------
>
> Block 0, Base EDID:
>   EDID Structure Version & Revision: 1.3
>   Vendor & Product Identification:
>     Manufacturer: LNX
>     Model: 0
>     Made in: week 5 of 2012
>   Basic Display Parameters & Features:
>     Analog display
>     Signal Level Standard: 0.700 : 0.000 : 0.700 V p-p
>     Blank level equals black level
>     Sync: Separate Composite Serration
>     Maximum image size: 35 cm x 26 cm
>     Gamma: 2.20
>     DPMS levels: Standby Suspend Off
>     RGB color display
>     First detailed timing is the preferred timing
>   Color Characteristics:
>     Red  : 0.6416, 0.3486
>     Green: 0.2919, 0.5957
>     Blue : 0.1474, 0.1250
>     White: 0.3125, 0.3281
>   Established Timings I & II:
>     DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz
>   Standard Timings:
>     DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz
>   Detailed Timing Descriptors:
>     DTD 1:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz (355 mm x 266 mm)
>                  Hfront    8 Hsync 144 Hback  168 Hpol N
>                  Vfront    3 Vsync   6 Vback   29 Vpol N
>     Display Product Serial Number: 'Linux #0'
>     Display Range Limits:
>       Monitor ranges (GTF): 59-61 Hz V, 47-49 kHz H, max dotclock 70 MHz
>     Display Product Name: 'Linux XGA'
> Checksum: 0x55
>
> ----------------
>
> Warnings:
>
> Block 0, Base EDID:
>   Detailed Timing Descriptor #1: DTD is similar but not identical to DMT 0x10.
>
> EDID conformity: PASS
>
> So, if anything, it's the EDID that needs to be updated, not the code there.

So are these EDIDs only valid for VGA outputs and another set needs to
be added for HDMI monitors?

Having drm.edid_firmware=edid/1024x768.bin works on an HDMI connector
prior to this patch, so presumably drm_edid_loader needs to
automatically switch between the existing (analog) and new (digital)
EDIDs based on the connector type? Or are you requiring users to
change the strings they use?

Cheers.
  Dave

