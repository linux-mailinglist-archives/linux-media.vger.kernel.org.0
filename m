Return-Path: <linux-media+bounces-2417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E49D0813379
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 15:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F5A71F2208F
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 14:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B775B1FB;
	Thu, 14 Dec 2023 14:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Wzb5eF/L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 892FE124
	for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 06:46:25 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dbcdfad714aso1059556276.3
        for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 06:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1702565184; x=1703169984; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9VwHjsjlvUQXnwJhjIDrFGK7V50fP2ma+YYeAWtq4OU=;
        b=Wzb5eF/Lrf/kLayWr1u6DICUH8TTO1FQsIM5olCniAZj3ODfBBlnYPUbEfNdmMFSPG
         H2R4QhtGWC2RTMTZukjbmwACVxeV0Fe8oCQv0x6nYjKlj541qS6L1XiSEk4M42onY329
         vNE2boEy7Er+F6hQbK/e5e7y+5h067JvEeszeD8oTzz+S5fUnQ+7i+W+kjZTFsERo2KK
         6ggseZ4qU3axGL5DQT5Ir2yV1hoCvd/0VFhGVcya3+4ZAJPxzUzOYM6JhX1V8f2suPEK
         daOCcHFLC3N+IKgkK1CORtAkII9Niim3yLvIkigxUBh9tVTXuQzULzLU8OuOQ2GHTAr0
         cVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702565184; x=1703169984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VwHjsjlvUQXnwJhjIDrFGK7V50fP2ma+YYeAWtq4OU=;
        b=u4V3fZCy4IKHMepcEjR68FAoZr5s0cStWOdkLx6MO4DLrFfIkwjUBvKU4ulM5+Ti4y
         YgULgyEuleFS/LgUs6P0zIsHL221zYZ+dTWJsYJdI/iiPOHdLU/x5qVrx9OJamq3nSFk
         pkZ7hDhB3oDWgkEy0yzHyTE/YT5jI6qLsqYlm1gK5kyyulz91dX2hDvdconf+JFe8w+z
         fulT9tttk23M/SQIYNDzxYriUyyCbtEL7CMYCz/w413Wy2jk98lOIwWUHfkKx2MwiNnD
         p8sz/uV5GPdniOhbDaH3mhulqG8FbS2xksbENqbCAEDB+FQ6O/d4ZCSuSj6UrfRjmsEK
         TmnQ==
X-Gm-Message-State: AOJu0YzWR7hon9C+f7114pB8Jt62fVCYJAgGb3KemRp17+qO/Ptbpcsb
	Q3iRQG/vmN4UQCJeQJxJ8/1o7RUKw4dPSpOXe61aDA==
X-Google-Smtp-Source: AGHT+IFA/dcZGp7Qy2sFstohELFqSy80J8twkZDTx1JUBVda7Hp1a5yF0ppAyDn5zugz9GBDneRp0g2c/uNwpRgynEo=
X-Received: by 2002:a05:6902:1369:b0:dbc:e9c7:9e44 with SMTP id
 bt9-20020a056902136900b00dbce9c79e44mr442261ybb.9.1702565184630; Thu, 14 Dec
 2023 06:46:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org> <20231207-kms-hdmi-connector-state-v5-9-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-9-6538e19d634d@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Dec 2023 14:46:08 +0000
Message-ID: <CAPY8ntDZ+M-5Ke4oHaM3gO2BrvUxDnne3ezV6AchxFJRQPd9Cw@mail.gmail.com>
Subject: Re: [PATCH v5 09/44] drm/connector: hdmi: Add RGB Quantization Range
 to the connector state
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
> HDMI controller drivers will need to figure out the RGB range they need
> to configure based on a mode and property values. Let's expose that in
> the HDMI connector state so drivers can just use that value.

Again a mention that we're also adding unit tests wouldn't be amiss.

> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/drm_atomic.c                       |   4 +-
>  drivers/gpu/drm/drm_atomic_state_helper.c          |  44 +++
>  .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 335 +++++++++++++++++++++
>  include/drm/drm_atomic_state_helper.h              |   1 +
>  include/drm/drm_connector.h                        |   6 +
>  5 files changed, 389 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 1465a7f09a0b..e4ad53e64e07 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1143,9 +1143,11 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
>         drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
>
>         if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> -           connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
> +           connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
>                 drm_printf(p, "\tbroadcast_rgb=%s\n",
>                            drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
> +               drm_printf(p, "\tis_full_range=%c\n", state->hdmi.is_full_range ? 'y' : 'n');
> +       }
>
>         if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
>                 if (state->writeback_job && state->writeback_job->fb)
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 10d98620a358..4a7114978c47 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -31,6 +31,7 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_plane.h>
>  #include <drm/drm_print.h>
> @@ -636,6 +637,47 @@ int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
>
> +static const struct drm_display_mode *
> +connector_state_get_mode(const struct drm_connector_state *conn_state)
> +{
> +       struct drm_atomic_state *state;
> +       struct drm_crtc_state *crtc_state;
> +       struct drm_crtc *crtc;
> +
> +       state = conn_state->state;
> +       if (!state)
> +               return NULL;
> +
> +       crtc = conn_state->crtc;
> +       if (!crtc)
> +               return NULL;
> +
> +       crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +       if (!crtc_state)
> +               return NULL;
> +
> +       return &crtc_state->mode;
> +}
> +
> +static bool hdmi_is_full_range(const struct drm_connector *connector,
> +                              const struct drm_connector_state *state)
> +{
> +       const struct drm_display_info *display = &connector->display_info;
> +       const struct drm_display_mode *mode =
> +               connector_state_get_mode(state);
> +
> +       if (state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_FULL)
> +               return true;
> +
> +       if (state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_LIMITED)
> +               return false;
> +
> +       if (!display->is_hdmi)
> +               return true;
> +
> +       return drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL ? true : false;
> +}
> +
>  /**
>   * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
>   * @connector: DRM Connector
> @@ -656,6 +698,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>         struct drm_connector_state *new_state =
>                 drm_atomic_get_new_connector_state(state, connector);
>
> +       new_state->hdmi.is_full_range = hdmi_is_full_range(connector, new_state);
> +
>         if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb) {
>                 struct drm_crtc *crtc = new_state->crtc;
>                 struct drm_crtc_state *crtc_state;
> diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> index 21e6f796ee13..7750c3d214a4 100644
> --- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> @@ -328,7 +328,342 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
>         KUNIT_EXPECT_FALSE(test, crtc_state->mode_changed);
>  }
>
> +/*
> + * Test that for an HDMI connector, with an HDMI monitor, if the
> + * Broadcast RGB property is set to auto with a mode that isn't the
> + * VIC-1 mode, we will get a limited RGB Quantization Range.
> + */
> +static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_modeset_acquire_ctx *ctx;
> +       struct drm_connector_state *conn_state;
> +       struct drm_atomic_state *state;
> +       struct drm_display_mode *preferred;
> +       struct drm_connector *conn;
> +       struct drm_device *drm;
> +       struct drm_crtc *crtc;
> +       int ret;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn = &priv->connector;
> +       KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
> +
> +       ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +       preferred = find_preferred_mode(conn);
> +       KUNIT_ASSERT_NOT_NULL(test, preferred);
> +       KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
> +
> +       drm = &priv->drm;
> +       crtc = priv->crtc;
> +       ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +       conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       conn_state->hdmi.broadcast_rgb,
> +                       DRM_HDMI_BROADCAST_RGB_AUTO);
> +
> +       ret = drm_atomic_check_only(state);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +       KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
> +}
> +
> +/*
> + * Test that for an HDMI connector, with an HDMI monitor, if the
> + * Broadcast RGB property is set to auto with a VIC-1 mode, we will get
> + * a full RGB Quantization Range.
> + */
> +static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_modeset_acquire_ctx *ctx;
> +       struct drm_connector_state *conn_state;
> +       struct drm_atomic_state *state;
> +       struct drm_display_mode *mode;
> +       struct drm_connector *conn;
> +       struct drm_device *drm;
> +       struct drm_crtc *crtc;
> +       int ret;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn = &priv->connector;
> +       KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
> +
> +       ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +       mode = drm_display_mode_from_cea_vic(drm, 1);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       drm = &priv->drm;
> +       crtc = priv->crtc;
> +       ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +       conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       conn_state->hdmi.broadcast_rgb,
> +                       DRM_HDMI_BROADCAST_RGB_AUTO);
> +
> +       ret = drm_atomic_check_only(state);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +       KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_full_range);
> +}
> +
> +/*
> + * Test that for an HDMI connector, with an HDMI monitor, if the
> + * Broadcast RGB property is set to full with a mode that isn't the
> + * VIC-1 mode, we will get a full RGB Quantization Range.
> + */
> +static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_modeset_acquire_ctx *ctx;
> +       struct drm_connector_state *conn_state;
> +       struct drm_atomic_state *state;
> +       struct drm_display_mode *preferred;
> +       struct drm_connector *conn;
> +       struct drm_device *drm;
> +       struct drm_crtc *crtc;
> +       int ret;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn = &priv->connector;
> +       KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
> +
> +       ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +       preferred = find_preferred_mode(conn);
> +       KUNIT_ASSERT_NOT_NULL(test, preferred);
> +       KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
> +
> +       drm = &priv->drm;
> +       crtc = priv->crtc;
> +       ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +       conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +       conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_FULL;
> +
> +       ret = drm_atomic_check_only(state);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       conn_state->hdmi.broadcast_rgb,
> +                       DRM_HDMI_BROADCAST_RGB_FULL);
> +
> +       KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_full_range);
> +}
> +
> +/*
> + * Test that for an HDMI connector, with an HDMI monitor, if the
> + * Broadcast RGB property is set to full with a VIC-1 mode, we will get
> + * a full RGB Quantization Range.
> + */
> +static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_modeset_acquire_ctx *ctx;
> +       struct drm_connector_state *conn_state;
> +       struct drm_atomic_state *state;
> +       struct drm_display_mode *mode;
> +       struct drm_connector *conn;
> +       struct drm_device *drm;
> +       struct drm_crtc *crtc;
> +       int ret;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn = &priv->connector;
> +       KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
> +
> +       ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +       mode = drm_display_mode_from_cea_vic(drm, 1);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       drm = &priv->drm;
> +       crtc = priv->crtc;
> +       ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +       conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +       conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_FULL;
> +
> +       ret = drm_atomic_check_only(state);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       conn_state->hdmi.broadcast_rgb,
> +                       DRM_HDMI_BROADCAST_RGB_FULL);
> +
> +       KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_full_range);
> +}
> +
> +/*
> + * Test that for an HDMI connector, with an HDMI monitor, if the
> + * Broadcast RGB property is set to limited with a mode that isn't the
> + * VIC-1 mode, we will get a limited RGB Quantization Range.
> + */
> +static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_modeset_acquire_ctx *ctx;
> +       struct drm_connector_state *conn_state;
> +       struct drm_atomic_state *state;
> +       struct drm_display_mode *preferred;
> +       struct drm_connector *conn;
> +       struct drm_device *drm;
> +       struct drm_crtc *crtc;
> +       int ret;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn = &priv->connector;
> +       KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
> +
> +       ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +       preferred = find_preferred_mode(conn);
> +       KUNIT_ASSERT_NOT_NULL(test, preferred);
> +       KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
> +
> +       drm = &priv->drm;
> +       crtc = priv->crtc;
> +       ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +       conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +       conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_LIMITED;
> +
> +       ret = drm_atomic_check_only(state);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       conn_state->hdmi.broadcast_rgb,
> +                       DRM_HDMI_BROADCAST_RGB_LIMITED);
> +
> +       KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
> +}
> +
> +/*
> + * Test that for an HDMI connector, with an HDMI monitor, if the
> + * Broadcast RGB property is set to limited with a VIC-1 mode, we will
> + * get a limited RGB Quantization Range.
> + */
> +static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_modeset_acquire_ctx *ctx;
> +       struct drm_connector_state *conn_state;
> +       struct drm_atomic_state *state;
> +       struct drm_display_mode *mode;
> +       struct drm_connector *conn;
> +       struct drm_device *drm;
> +       struct drm_crtc *crtc;
> +       int ret;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn = &priv->connector;
> +       KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
> +
> +       ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +       mode = drm_display_mode_from_cea_vic(drm, 1);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       drm = &priv->drm;
> +       crtc = priv->crtc;
> +       ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +       conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +       conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_LIMITED;
> +
> +       ret = drm_atomic_check_only(state);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       conn_state->hdmi.broadcast_rgb,
> +                       DRM_HDMI_BROADCAST_RGB_LIMITED);
> +
> +       KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
> +}
> +
>  static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
> +       KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode),
> +       KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode_vic_1),
> +       KUNIT_CASE(drm_test_check_broadcast_rgb_full_cea_mode),
> +       KUNIT_CASE(drm_test_check_broadcast_rgb_full_cea_mode_vic_1),
> +       KUNIT_CASE(drm_test_check_broadcast_rgb_limited_cea_mode),
> +       KUNIT_CASE(drm_test_check_broadcast_rgb_limited_cea_mode_vic_1),
>         KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_changed),
>         KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
>         { }
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index d59d2b3aef9a..8072ac18e536 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -88,6 +88,7 @@ void
>  __drm_atomic_helper_connector_destroy_state(struct drm_connector_state *state);
>  void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
>                                           struct drm_connector_state *state);
> +
>  void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj,
>                                                      struct drm_private_state *state);
>
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 3867a4c01b78..76eecd449fb8 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1066,6 +1066,12 @@ struct drm_connector_state {
>                  * Broadcast RGB selection value.
>                  */
>                 enum drm_hdmi_broadcast_rgb broadcast_rgb;
> +
> +               /**
> +                * @is_full_range: Is the output supposed to use a full
> +                * RGB Quantization Range or not?
> +                */
> +               bool is_full_range;
>         } hdmi;
>  };
>
>
> --
> 2.43.0
>

