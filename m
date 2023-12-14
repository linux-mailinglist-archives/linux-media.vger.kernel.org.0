Return-Path: <linux-media+bounces-2415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96699813360
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 15:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43EB5281D18
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 14:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32D85ABBF;
	Thu, 14 Dec 2023 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="mah02CWF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA651115
	for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 06:41:08 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3ba1be5ad0aso2368319b6e.0
        for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1702564868; x=1703169668; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JznIu9lNlIeiTo8wKTcxQuhhJ2zgIwL8Q7gBCogBxvY=;
        b=mah02CWFDHeTmiEaZX6G5xe/jDGu/dsI/U6/A/xk/U36+pHEnHJrq/yhw989lBYSPl
         RkE+ESJTpVpO2bz/X5Bjal+8ng2BhIO66S7B0msbnamgmJtPZDE4Tkvx7+E/AnrvnCGD
         Z2l+DX+xC3zOYP1VMoDjWUVPlmNuVrqlzT1bCvOj6YiS87OV3WpZIHJ+s1hCNEMLjT9j
         bBYRzKDsnZBjPUaegfekdAi3A9kqXzDon7+67x0rLmMWMxt5G/HCD/If6rQFz/+ZsSkh
         RhcW2ZeNDIRofdXiyJ1PTW9O0AIcE2DIgJ62X1FnMwwIscXJfMfALRyqwumtWFtEkbCG
         ZhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702564868; x=1703169668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JznIu9lNlIeiTo8wKTcxQuhhJ2zgIwL8Q7gBCogBxvY=;
        b=RQVxLWiuPgSetEZ/Kgzs3bBmUvVkSGRLwgPdKD0zSEpxy5u9/U7vIdKnUISpPDgQ6Q
         qLdmTT1gJJTc2zkmbBh4HfhJfDwhDW1RKz+YtxX7uaw6Ntfy+QN4j9t+pSllKceJDRbY
         g5QGALvd+PbdkaXm9TKm7DSyzGhN5eZCc4kt5GUHK8+/RcUCE17+xThJP8I7L8JQR+8b
         zEfAsxKLLy5k3WPtVz3TYtHuDoI60+MBX0B0xe5O7tCVAUYVwpktaa4o44jKnocCjBv3
         9WlSWDf9z0w2P3pW72vCDVt/KdZ5C7y7EmS/bQ5bjk7Rw+iQQpywa1bsHnrXQDgGXBZp
         M1Pw==
X-Gm-Message-State: AOJu0YznEQaTsVBHjo3JdrTTeWeuUDjaS1/IYCyOGvrF1BUyH3nfYysB
	9qcboByZlProUwGCn2aMwfSB9L+UiWUnhfI5ZAsAbw==
X-Google-Smtp-Source: AGHT+IH6Z7ttlPWqmsWbeFA/szWdyE6FZ1U9zu49mWSIzwza1ccFf3m2KxsdaL0W2oe0vmgh5g75w+m4VqHHxQxLixU=
X-Received: by 2002:a05:6808:140c:b0:3b9:ff46:fa9b with SMTP id
 w12-20020a056808140c00b003b9ff46fa9bmr12542705oiv.43.1702564868089; Thu, 14
 Dec 2023 06:41:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org> <20231207-kms-hdmi-connector-state-v5-7-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-7-6538e19d634d@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Dec 2023 14:40:52 +0000
Message-ID: <CAPY8ntDT1X-2y7P-FAdw1CsT3SQuxCbfuhG6kPGR=v2KCnoQ8g@mail.gmail.com>
Subject: Re: [PATCH v5 07/44] drm/connector: hdmi: Create an HDMI sub-state
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

On Thu, 7 Dec 2023 at 15:50, Maxime Ripard <mripard@kernel.org> wrote:
>
> The next features we will need to share across drivers will need to
> store some parameters for drivers to use, such as the selected output
> format.
>
> Let's create a new connector sub-state dedicated to HDMI controllers,
> that will eventually store everything we need.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 35 +++++++++++++++++++++++++++++++
>  include/drm/drm_atomic_state_helper.h     |  4 ++++
>  include/drm/drm_connector.h               |  7 +++++++
>  3 files changed, 46 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 54975de44a0e..e69c0cc1c6da 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -570,6 +570,22 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
>
> +/**
> + * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
> + * @connector: DRM connector
> + * @new_state: connector state to reset
> + *
> + * Initializes all HDMI resources from a @drm_connector_state without
> + * actually allocating it. This is useful for HDMI drivers, in
> + * combination with __drm_atomic_helper_connector_reset() or
> + * drm_atomic_helper_connector_reset().
> + */
> +void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
> +                                             struct drm_connector_state *new_state)
> +{
> +}
> +EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
> +
>  /**
>   * drm_atomic_helper_connector_tv_check - Validate an analog TV connector state
>   * @connector: DRM Connector
> @@ -619,6 +635,25 @@ int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
>
> +/**
> + * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
> + * @connector: DRM Connector
> + * @state: the DRM State object
> + *
> + * Provides a default connector state check handler for HDMI connectors.
> + * Checks that a desired connector update is valid, and updates various
> + * fields of derived state.
> + *
> + * RETURNS:
> + * Zero on success, or an errno code otherwise.
> + */
> +int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
> +                                          struct drm_atomic_state *state)
> +{
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
> +
>  /**
>   * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
>   * @connector: connector object
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index b9740edb2658..d59d2b3aef9a 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -71,7 +71,11 @@ void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_
>  void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
>                                          struct drm_connector_state *conn_state);
>  void drm_atomic_helper_connector_reset(struct drm_connector *connector);
> +void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
> +                                             struct drm_connector_state *new_state);
>  void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
> +int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
> +                                          struct drm_atomic_state *state);
>  int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
>                                          struct drm_atomic_state *state);
>  void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 4491c4c2fb6e..000a2a156619 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1031,6 +1031,13 @@ struct drm_connector_state {
>          * DRM blob property for HDR output metadata
>          */
>         struct drm_property_blob *hdr_output_metadata;
> +
> +       /**
> +        * @hdmi: HDMI-related variable and properties. Filled by
> +        * @drm_atomic_helper_connector_hdmi_check().
> +        */
> +       struct {
> +       } hdmi;
>  };
>
>  /**
>
> --
> 2.43.0
>

