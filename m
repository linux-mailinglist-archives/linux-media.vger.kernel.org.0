Return-Path: <linux-media+bounces-6228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3FE86E02C
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 12:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AAB21C20E27
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 11:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5DA6CDC3;
	Fri,  1 Mar 2024 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gcH5T3Ft"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C3F6BB4E
	for <linux-media@vger.kernel.org>; Fri,  1 Mar 2024 11:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709292396; cv=none; b=UbDrCB7NY5O7sMjLTulgdyrfkpcVjtbH/qXMUqd29M98Dkt0Mn7MrUqVh1O3eZN4M2v06Tw113JnRZLunLSi9/OCy5dYU2KBIw6xrtBAoDcDozdGVC42uBYqUPLA+hWclh94NZJTnzQdo2ArYY3ZzmsSc5T9g5IIiIL8IrgqAow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709292396; c=relaxed/simple;
	bh=v9Mw67zmZwjTVLvu50BgA9qZZ4KidgCacU0eeQ7KFx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqkXYWILC51wMuN1mUK1iE0fK17KJvlWjMxfctGUbJAOIiKidnaHFf572qx8A6wwOqEQdtOSFVEdD3nCYR8naVGJGuB2zDmBSATvKx/nyjyTP1DWxMeSFGO8bkH0iA9NQv8ioXUn8/+xowxMzcwUE3jZ0B3LNSmx4dgFtjmrafk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gcH5T3Ft; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709292393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjYgI2KsgeWuP3sAlk9TqZqYfNa6GCpmBp03vZLpou0=;
	b=gcH5T3FtW6MbAToCPV2dEUlSCR7RcfH9J283CNGNhQTqQDLvn8ZDOO0Fs+B8HM++9HrSsz
	2A76yDXFffZjVWc+ahMECdyvh76Oywu965TH0P6QZmio8uXZVXKsnDrDTBf0rszAa77wpB
	IbENwTrhkzEGf+ikhQpdfQDQwYSPlF0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-zgGo3XXlNTyYv-i-CQ4jjg-1; Fri, 01 Mar 2024 06:26:31 -0500
X-MC-Unique: zgGo3XXlNTyYv-i-CQ4jjg-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2d2fe83c377so11199531fa.0
        for <linux-media@vger.kernel.org>; Fri, 01 Mar 2024 03:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709292390; x=1709897190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjYgI2KsgeWuP3sAlk9TqZqYfNa6GCpmBp03vZLpou0=;
        b=U1FCg5pX+YRdAllyRILzUebuMP1gWg1jg+ByPDrFS546joOWSxGVtCngB/GrkYjM/a
         jj+IBtBqrJlhBJiWJ1EZMwEmK0BAWb0C02wdA4PnWvel+pQ0W/dNJ0L/D2ZJzukAdyEQ
         v0TKgBcJZZtwHEABPnIKQ4wx1qeGFJNzOPTdDeWhDDpzSl5m1iZVgQ2qEOY54KEp7Vma
         cp1W2cbFsByD02ioWPVD2XgBtKYyz+gel7QcrgOcN22UzigboN5wSj55LvZwKpNTLpUD
         QLA3msTFJbh1WNR74VAvjgHoFbePuX4PNNgfHLtICjAQY4xqN3LT+ppNYffr2kZ3cbku
         Z7SA==
X-Forwarded-Encrypted: i=1; AJvYcCVQTjDkVpAIOo7biKeoozHCcXF/fHH5NGC9vQOX23Ph/JhNnGNEszkn2tGa1OBd076cJBwk1lpYKk4BELS1ENYs92BOc6MDnLAdoIc=
X-Gm-Message-State: AOJu0YxJqyJ3XhfOUnlp4I/iy0tKMb/60v+FOr3Q/06eV6u1HSRa73nB
	rNkADlAKBazN2S8S0KfadeIqStM4+lupDnay8q0h2Pg+e8QsnTpEKuTmuFuUvE4FEDEJcPaBu2j
	WoJ9OAXqUh/w5KTlBwt5qsWmJJAVPI+HwsfML3A1YDvHNvUN6mceGrBZVdB2u
X-Received: by 2002:a2e:95d5:0:b0:2d2:5668:3a40 with SMTP id y21-20020a2e95d5000000b002d256683a40mr942903ljh.4.1709292390405;
        Fri, 01 Mar 2024 03:26:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUMPEadXUnHsh8Ae/1Y5RYwcaIFHHrv+QbMlgbuWWzQO///QbdhSklfmNGWU04m0Hw1ckfSQ==
X-Received: by 2002:a2e:95d5:0:b0:2d2:5668:3a40 with SMTP id y21-20020a2e95d5000000b002d256683a40mr942879ljh.4.1709292389946;
        Fri, 01 Mar 2024 03:26:29 -0800 (PST)
Received: from toolbox ([2001:9e8:89a0:c500:c65:1f3a:8c08:2a1d])
        by smtp.gmail.com with ESMTPSA id y16-20020a05600c365000b00412656ba919sm8004431wmq.20.2024.03.01.03.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 03:26:29 -0800 (PST)
Date: Fri, 1 Mar 2024 12:26:27 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v7 21/36] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240301112627.GD166694@toolbox>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>
 <20240229194726.GB166694@toolbox>
 <5a8366aa-34b9-4f80-9b14-d92e99873349@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a8366aa-34b9-4f80-9b14-d92e99873349@xs4all.nl>

On Fri, Mar 01, 2024 at 09:29:17AM +0100, Hans Verkuil wrote:
> On 29/02/2024 20:47, Sebastian Wick wrote:
> > On Thu, Feb 22, 2024 at 07:14:07PM +0100, Maxime Ripard wrote:
> >> The i915 driver has a property to force the RGB range of an HDMI output.
> >> The vc4 driver then implemented the same property with the same
> >> semantics. KWin has support for it, and a PR for mutter is also there to
> >> support it.
> >>
> >> Both drivers implementing the same property with the same semantics,
> >> plus the userspace having support for it, is proof enough that it's
> >> pretty much a de-facto standard now and we can provide helpers for it.
> >>
> >> Let's plumb it into the newly created HDMI connector.
> >>
> >> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> >> ---
> >>  Documentation/gpu/kms-properties.csv      |  1 -
> >>  drivers/gpu/drm/drm_atomic.c              |  2 +
> >>  drivers/gpu/drm/drm_atomic_state_helper.c |  4 +-
> >>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
> >>  drivers/gpu/drm/drm_connector.c           | 89 +++++++++++++++++++++++++++++++
> >>  include/drm/drm_connector.h               | 36 +++++++++++++
> >>  6 files changed, 134 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
> >> index 0f9590834829..caef14c532d4 100644
> >> --- a/Documentation/gpu/kms-properties.csv
> >> +++ b/Documentation/gpu/kms-properties.csv
> >> @@ -17,7 +17,6 @@ Owner Module/Drivers,Group,Property Name,Type,Property Values,Object attached,De
> >>  ,Virtual GPU,“suggested X”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an X offset for a connector
> >>  ,,“suggested Y”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an Y offset for a connector
> >>  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Connector,TDB
> >> -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Limited 16:235"" }",Connector,"When this property is set to Limited 16:235 and CTM is set, the hardware will be programmed with the result of the multiplication of CTM by the limited range matrix to ensure the pixels normally in the range 0..1.0 are remapped to the range 16/255..235/255."
> >>  ,,“audio”,ENUM,"{ ""force-dvi"", ""off"", ""auto"", ""on"" }",Connector,TBD
> >>  ,SDVO-TV,“mode”,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC_443"", ""PAL_B"" } etc.",Connector,TBD
> >>  ,,"""left_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
> >> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> >> index 26f9e525c0a0..3e57d98d8418 100644
> >> --- a/drivers/gpu/drm/drm_atomic.c
> >> +++ b/drivers/gpu/drm/drm_atomic.c
> >> @@ -1145,6 +1145,8 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
> >>  
> >>  	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> >>  	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
> >> +		drm_printf(p, "\tbroadcast_rgb=%s\n",
> >> +			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
> >>  		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
> >>  		drm_printf(p, "\toutput_format=%s\n",
> >>  			   drm_hdmi_connector_get_output_format_name(state->hdmi.output_format));
> >> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> >> index 9f517599f117..0e8fb653965a 100644
> >> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> >> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> >> @@ -589,6 +589,7 @@ void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
> >>  
> >>  	new_state->max_bpc = max_bpc;
> >>  	new_state->max_requested_bpc = max_bpc;
> >> +	new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
> >>  }
> >>  EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
> >>  
> >> @@ -913,7 +914,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> -	if (old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
> >> +	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
> >> +	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
> >>  	    old_state->hdmi.output_format != new_state->hdmi.output_format) {
> >>  		struct drm_crtc *crtc = new_state->crtc;
> >>  		struct drm_crtc_state *crtc_state;
> >> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> >> index 29d4940188d4..2b415b4ed506 100644
> >> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> >> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> >> @@ -776,6 +776,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
> >>  		state->max_requested_bpc = val;
> >>  	} else if (property == connector->privacy_screen_sw_state_property) {
> >>  		state->privacy_screen_sw_state = val;
> >> +	} else if (property == connector->broadcast_rgb_property) {
> >> +		state->hdmi.broadcast_rgb = val;
> >>  	} else if (connector->funcs->atomic_set_property) {
> >>  		return connector->funcs->atomic_set_property(connector,
> >>  				state, property, val);
> >> @@ -859,6 +861,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
> >>  		*val = state->max_requested_bpc;
> >>  	} else if (property == connector->privacy_screen_sw_state_property) {
> >>  		*val = state->privacy_screen_sw_state;
> >> +	} else if (property == connector->broadcast_rgb_property) {
> >> +		*val = state->hdmi.broadcast_rgb;
> >>  	} else if (connector->funcs->atomic_get_property) {
> >>  		return connector->funcs->atomic_get_property(connector,
> >>  				state, property, val);
> >> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> >> index 591d2d500f61..6ffe59d01698 100644
> >> --- a/drivers/gpu/drm/drm_connector.c
> >> +++ b/drivers/gpu/drm/drm_connector.c
> >> @@ -1212,6 +1212,29 @@ static const u32 dp_colorspaces =
> >>  	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
> >>  	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
> >>  
> >> +static const struct drm_prop_enum_list broadcast_rgb_names[] = {
> >> +	{ DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
> >> +	{ DRM_HDMI_BROADCAST_RGB_FULL, "Full" },
> >> +	{ DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
> >> +};
> >> +
> >> +/*
> >> + * drm_hdmi_connector_get_broadcast_rgb_name - Return a string for HDMI connector RGB broadcast selection
> >> + * @broadcast_rgb: Broadcast RGB selection to compute name of
> >> + *
> >> + * Returns: the name of the Broadcast RGB selection, or NULL if the type
> >> + * is not valid.
> >> + */
> >> +const char *
> >> +drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb)
> >> +{
> >> +	if (broadcast_rgb > DRM_HDMI_BROADCAST_RGB_LIMITED)
> >> +		return NULL;
> >> +
> >> +	return broadcast_rgb_names[broadcast_rgb].name;
> >> +}
> >> +EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
> >> +
> >>  static const char * const output_format_str[] = {
> >>  	[HDMI_COLORSPACE_RGB]		= "RGB",
> >>  	[HDMI_COLORSPACE_YUV420]	= "YUV 4:2:0",
> >> @@ -1708,6 +1731,39 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
> >>  /**
> >>   * DOC: HDMI connector properties
> >>   *
> >> + * Broadcast RGB (HDMI specific)
> >> + *      Indicates the Quantization Range (Full vs Limited) used. The color
> >> + *      processing pipeline will be adjusted to match the value of the
> >> + *      property, and the Infoframes will be generated and sent accordingly.
> >> + *
> >> + *      This property is only relevant if the HDMI output format is RGB. If
> >> + *      it's one of the YCbCr variant, it will be ignored and the output will
> >> + *      use a limited quantization range.
> > 
> > Uh, maybe just say that the quantization range is selected automatically
> > in case a YCbCr output format is in use. I'm not sure every YCbCr
> > variant requires limited and even if it does, new formats could change
> > this.
> 
> For HDMI every YCbCr output format is limited range by default. It is
> highly unlikely that future YCbCr formats would ever use full range by
> default.

CTA-861-I, Table 4 - Default Quantization Ranges:

Colorimetry: sYCC601
CE Video Format: Limited
IT Video Format: Full

And also this isn't just about the default behavior. Drivers could also
just choose full range for YCbCr formats via InfoFrames.

The Broadcast RGB property should simply not affect any of those
decisions. Intel chose to always use limited range apparently but this
property shouldn't force this behavior.

> So I am fine with the current text since it is actually correct and it
> explicitly states which quantization range will be used.
> 
> Regards,
> 
> 	Hans
> 
> > 
> > With this changed, this patch is
> > 
> > Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
> > 
> >> + *
> >> + *      The CRTC attached to the connector must be configured by user-space to
> >> + *      always produce full-range pixels.
> >> + *
> >> + *      The value of this property can be one of the following:
> >> + *
> >> + *      Automatic:
> >> + *              The quantization range is selected automatically based on the
> >> + *              mode according to the HDMI specifications (HDMI 1.4b - Section
> >> + *              6.6 - Video Quantization Ranges).
> >> + *
> >> + *      Full:
> >> + *              Full quantization range is forced.
> >> + *
> >> + *      Limited 16:235:
> >> + *              Limited quantization range is forced. Unlike the name suggests,
> >> + *              this works for any number of bits-per-component.
> >> + *
> >> + *      Property values other than Automatic can result in colors being off (if
> >> + *      limited is selected but the display expects full), or a black screen
> >> + *      (if full is selected but the display expects limited).
> >> + *
> >> + *      Drivers can set up this property by calling
> >> + *      drm_connector_attach_broadcast_rgb_property().
> >> + *
> >>   * content type (HDMI specific):
> >>   *	Indicates content type setting to be used in HDMI infoframes to indicate
> >>   *	content type for the external device, so that it adjusts its display
> >> @@ -2570,6 +2626,39 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
> >>  }
> >>  EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
> >>  
> >> +/**
> >> + * drm_connector_attach_broadcast_rgb_property - attach "Broadcast RGB" property
> >> + * @connector: connector to attach the property on.
> >> + *
> >> + * This is used to add support for forcing the RGB range on a connector
> >> + *
> >> + * Returns:
> >> + * Zero on success, negative errno on failure.
> >> + */
> >> +int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector)
> >> +{
> >> +	struct drm_device *dev = connector->dev;
> >> +	struct drm_property *prop;
> >> +
> >> +	prop = connector->broadcast_rgb_property;
> >> +	if (!prop) {
> >> +		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
> >> +						"Broadcast RGB",
> >> +						broadcast_rgb_names,
> >> +						ARRAY_SIZE(broadcast_rgb_names));
> >> +		if (!prop)
> >> +			return -EINVAL;
> >> +
> >> +		connector->broadcast_rgb_property = prop;
> >> +	}
> >> +
> >> +	drm_object_attach_property(&connector->base, prop,
> >> +				   DRM_HDMI_BROADCAST_RGB_AUTO);
> >> +
> >> +	return 0;
> >> +}
> >> +EXPORT_SYMBOL(drm_connector_attach_broadcast_rgb_property);
> >> +
> >>  /**
> >>   * drm_connector_attach_colorspace_property - attach "Colorspace" property
> >>   * @connector: connector to attach the property on.
> >> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> >> index 8cda902934cd..bb6b6a36ade3 100644
> >> --- a/include/drm/drm_connector.h
> >> +++ b/include/drm/drm_connector.h
> >> @@ -369,6 +369,29 @@ enum drm_panel_orientation {
> >>  	DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
> >>  };
> >>  
> >> +/**
> >> + * enum drm_hdmi_broadcast_rgb - Broadcast RGB Selection for an HDMI @drm_connector
> >> + */
> >> +enum drm_hdmi_broadcast_rgb {
> >> +	/**
> >> +	 * @DRM_HDMI_BROADCAST_RGB_AUTO: The RGB range is selected
> >> +	 * automatically based on the mode.
> >> +	 */
> >> +	DRM_HDMI_BROADCAST_RGB_AUTO,
> >> +
> >> +	/**
> >> +	 * @DRM_HDMI_BROADCAST_RGB_FULL: Full range RGB is forced.
> >> +	 */
> >> +	DRM_HDMI_BROADCAST_RGB_FULL,
> >> +
> >> +	/**
> >> +	 * @DRM_HDMI_BROADCAST_RGB_LIMITED: Limited range RGB is forced.
> >> +	 */
> >> +	DRM_HDMI_BROADCAST_RGB_LIMITED,
> >> +};
> >> +
> >> +const char *
> >> +drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb);
> >>  const char *
> >>  drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt);
> >>  
> >> @@ -1041,6 +1064,12 @@ struct drm_connector_state {
> >>  	 * @drm_atomic_helper_connector_hdmi_check().
> >>  	 */
> >>  	struct {
> >> +		/**
> >> +		 * @broadcast_rgb: Connector property to pass the
> >> +		 * Broadcast RGB selection value.
> >> +		 */
> >> +		enum drm_hdmi_broadcast_rgb broadcast_rgb;
> >> +
> >>  		/**
> >>  		 * @output_bpc: Bits per color channel to output.
> >>  		 */
> >> @@ -1753,6 +1782,12 @@ struct drm_connector {
> >>  	 */
> >>  	struct drm_property *privacy_screen_hw_state_property;
> >>  
> >> +	/**
> >> +	 * @broadcast_rgb_property: Connector property to set the
> >> +	 * Broadcast RGB selection to output with.
> >> +	 */
> >> +	struct drm_property *broadcast_rgb_property;
> >> +
> >>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
> >>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
> >>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> >> @@ -2092,6 +2127,7 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
> >>  					       u32 scaling_mode_mask);
> >>  int drm_connector_attach_vrr_capable_property(
> >>  		struct drm_connector *connector);
> >> +int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector);
> >>  int drm_connector_attach_colorspace_property(struct drm_connector *connector);
> >>  int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
> >>  bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
> >>
> >> -- 
> >> 2.43.2
> >>
> > 
> 


