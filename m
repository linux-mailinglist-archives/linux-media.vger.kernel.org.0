Return-Path: <linux-media+bounces-2418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0E8813389
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 15:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32307283200
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 14:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8641A5B20C;
	Thu, 14 Dec 2023 14:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="qP+z72M4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0F7116
	for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 06:49:01 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-db4422fff15so6919855276.1
        for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 06:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1702565341; x=1703170141; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G5JzwHRVEypCqvTdcDRtZJZR/2+LpfKoxII+LKxkCRY=;
        b=qP+z72M41runOlX+k3FzAK8KEalJdGhAJ+8Ld7Ol3sBMSn9dg6NHF6lYGZIUA7eP9x
         dYaqfxFItWdgf4Mnb0KP/klfx8iSl2tM8oShQQYg/KGVYhQ3LdJKdnsDdWMqQesgfCIG
         v2vqpjr//+xfEQatHMGs12XZbsVU9+HsDTSs8oMItl4esj9I7zQeyEOfM3p04LlHb3XI
         htqvA9uXi3QBb/QvyLqPs1rD6CfvLIw/WIJr7vKq6+dOH4jd4YvUMj4l9S9ZH4H++4JM
         zfsSoBAeYbRlZiLGoWGjgNBoyLTGp9ULpQ734q/xe8BAHvOqqiW1SDbjMwiFo/rD9669
         rBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702565341; x=1703170141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5JzwHRVEypCqvTdcDRtZJZR/2+LpfKoxII+LKxkCRY=;
        b=DMZWBaY7tKJ3fdtc3QPMsWTYD7RXeYIAanaXezhPHimzKP43o0oyG8tvF6f8Av5gLf
         3iHGPJedHdFzM25ro9O5cLChHZmicFz7R1BtU0FyKZtwlDh6iMDQoqml/J7pXtk3W+y0
         8PE9ZvAxfhUuFN0v7io9ST59qcr9Q7YE/5yqIs5CwM5DzLQyBWQIokzoqmhuh38IzuJQ
         e04pT25xk7ondrofC8MHeUuW1JXK+lA5c1rh9h5GqVVm0jwFfzMNunv6CuGVriKyAHbw
         19Yt3Zh13/z/hvB52iyvwQfrMJrVJW/9Re6nNQ2j88LBwvWL7pWnuEo/bE5IH1H98Koj
         USpA==
X-Gm-Message-State: AOJu0Yz4lNseI8Ol+j0u1kZeu16nO3RpJkLYAHYxHf/snQXF/vqw+uV8
	JmQeKcPzbTWX5GDDqBqNR5MOH5JcI5w/xDwXBZoOhA==
X-Google-Smtp-Source: AGHT+IHH+SR1mQPbzFJBeHQKxjMO3Uy92VyK4dUPGapoMPlIedQaWLbemaOr7ANUy5AbDSooNFpBCA9AUUSuRZ3Na5Y=
X-Received: by 2002:a25:8452:0:b0:dbc:d9a9:90cb with SMTP id
 r18-20020a258452000000b00dbcd9a990cbmr1383166ybm.125.1702565340852; Thu, 14
 Dec 2023 06:49:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org> <20231207-kms-hdmi-connector-state-v5-10-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-10-6538e19d634d@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Dec 2023 14:48:44 +0000
Message-ID: <CAPY8ntAZY1mULjd82694Qc868iLXOdopu2jf8VPyWnFe0=rK8w@mail.gmail.com>
Subject: Re: [PATCH v5 10/44] drm/connector: hdmi: Add output BPC to the
 connector state
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
> We'll add automatic selection of the output BPC in a following patch,
> but let's add it to the HDMI connector state already.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/drm_atomic.c                       |   1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c          |   7 +-
>  drivers/gpu/drm/drm_connector.c                    |  20 +-
>  .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 227 ++++++++++++++++++++-
>  drivers/gpu/drm/tests/drm_connector_test.c         | 153 +++++++++++++-
>  include/drm/drm_connector.h                        |  13 +-
>  6 files changed, 402 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index e4ad53e64e07..76c63ed04af4 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1147,6 +1147,7 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
>                 drm_printf(p, "\tbroadcast_rgb=%s\n",
>                            drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
>                 drm_printf(p, "\tis_full_range=%c\n", state->hdmi.is_full_range ? 'y' : 'n');
> +               drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
>         }
>
>         if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 4a7114978c47..883bdc0349c0 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -584,6 +584,10 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
>  void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
>                                               struct drm_connector_state *new_state)
>  {
> +       unsigned int max_bpc = connector->max_bpc;
> +
> +       new_state->max_bpc = max_bpc;
> +       new_state->max_requested_bpc = max_bpc;
>         new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
> @@ -700,7 +704,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>
>         new_state->hdmi.is_full_range = hdmi_is_full_range(connector, new_state);
>
> -       if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb) {
> +       if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
> +           old_state->hdmi.output_bpc != new_state->hdmi.output_bpc) {
>                 struct drm_crtc *crtc = new_state->crtc;
>                 struct drm_crtc_state *crtc_state;
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 929b0a911f62..139ac3d8160c 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -459,6 +459,7 @@ EXPORT_SYMBOL(drmm_connector_init);
>   * @funcs: callbacks for this connector
>   * @connector_type: user visible type of the connector
>   * @ddc: optional pointer to the associated ddc adapter
> + * @max_bpc: Maximum bits per char the HDMI connector supports
>   *
>   * Initialises a preallocated HDMI connector. Connectors can be
>   * subclassed as part of driver connector objects.
> @@ -475,7 +476,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>                              struct drm_connector *connector,
>                              const struct drm_connector_funcs *funcs,
>                              int connector_type,
> -                            struct i2c_adapter *ddc)
> +                            struct i2c_adapter *ddc,
> +                            unsigned int max_bpc)
>  {
>         int ret;
>
> @@ -483,10 +485,26 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>               connector_type == DRM_MODE_CONNECTOR_HDMIB))
>                 return -EINVAL;
>
> +       if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
> +               return -EINVAL;
> +
>         ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
>         if (ret)
>                 return ret;
>
> +       /*
> +        * drm_connector_attach_max_bpc_property() requires the
> +        * connector to have a state.
> +        */
> +       if (connector->funcs->reset)
> +               connector->funcs->reset(connector);
> +
> +       drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
> +       connector->max_bpc = max_bpc;
> +
> +       if (max_bpc > 8)
> +               drm_connector_attach_hdr_output_metadata_property(connector);
> +
>         return 0;
>  }
>  EXPORT_SYMBOL(drmm_connector_hdmi_init);
> diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> index 7750c3d214a4..a1b0e6914cf8 100644
> --- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> @@ -146,7 +146,8 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
>
>  static
>  struct drm_atomic_helper_connector_hdmi_priv *
> -drm_atomic_helper_connector_hdmi_init(struct kunit *test)
> +drm_atomic_helper_connector_hdmi_init(struct kunit *test,
> +                                     unsigned int max_bpc)
>  {
>         struct drm_atomic_helper_connector_hdmi_priv *priv;
>         struct drm_connector *conn;
> @@ -188,7 +189,8 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test)
>         ret = drmm_connector_hdmi_init(drm, conn,
>                                        &dummy_connector_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> -                                      NULL);
> +                                      NULL,
> +                                      max_bpc);
>         KUNIT_ASSERT_EQ(test, ret, 0);
>
>         drm_connector_helper_add(conn, &dummy_connector_helper_funcs);
> @@ -223,7 +225,7 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
>         struct drm_crtc *crtc;
>         int ret;
>
> -       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 8);
>         KUNIT_ASSERT_NOT_NULL(test, priv);
>
>         ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> @@ -284,7 +286,7 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
>         struct drm_crtc *crtc;
>         int ret;
>
> -       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 8);
>         KUNIT_ASSERT_NOT_NULL(test, priv);
>
>         ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> @@ -345,7 +347,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
>         struct drm_crtc *crtc;
>         int ret;
>
> -       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 8);
>         KUNIT_ASSERT_NOT_NULL(test, priv);
>
>         conn = &priv->connector;
> @@ -399,7 +401,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
>         struct drm_crtc *crtc;
>         int ret;
>
> -       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 8);
>         KUNIT_ASSERT_NOT_NULL(test, priv);
>
>         conn = &priv->connector;
> @@ -452,7 +454,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
>         struct drm_crtc *crtc;
>         int ret;
>
> -       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 8);
>         KUNIT_ASSERT_NOT_NULL(test, priv);
>
>         conn = &priv->connector;
> @@ -508,7 +510,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
>         struct drm_crtc *crtc;
>         int ret;
>
> -       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 8);
>         KUNIT_ASSERT_NOT_NULL(test, priv);
>
>         conn = &priv->connector;
> @@ -563,7 +565,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
>         struct drm_crtc *crtc;
>         int ret;
>
> -       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 8);
>         KUNIT_ASSERT_NOT_NULL(test, priv);
>
>         conn = &priv->connector;
> @@ -619,7 +621,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
>         struct drm_crtc *crtc;
>         int ret;
>
> -       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 8);
>         KUNIT_ASSERT_NOT_NULL(test, priv);
>
>         conn = &priv->connector;
> @@ -657,6 +659,138 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
>         KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
>  }
>
> +/*
> + * Test that if we change the maximum bpc property to a different value,
> + * we trigger a mode change on the connector's CRTC, which will in turn
> + * disable/enable the connector.
> + */
> +static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_modeset_acquire_ctx *ctx;
> +       struct drm_connector_state *old_conn_state;
> +       struct drm_connector_state *new_conn_state;
> +       struct drm_crtc_state *crtc_state;
> +       struct drm_atomic_state *state;
> +       struct drm_display_mode *preferred;
> +       struct drm_connector *conn;
> +       struct drm_device *drm;
> +       struct drm_crtc *crtc;
> +       int ret;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 10);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +       conn = &priv->connector;
> +       preferred = find_preferred_mode(conn);
> +       KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +       drm = &priv->drm;
> +       crtc = priv->crtc;
> +       ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +       new_conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +       old_conn_state = drm_atomic_get_old_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +       new_conn_state->hdmi.output_bpc = 8;
> +
> +       KUNIT_ASSERT_NE(test,
> +                       old_conn_state->hdmi.output_bpc,
> +                       new_conn_state->hdmi.output_bpc);
> +
> +       ret = drm_atomic_check_only(state);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       old_conn_state = drm_atomic_get_old_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +       new_conn_state = drm_atomic_get_new_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +       KUNIT_ASSERT_NE(test,
> +                       old_conn_state->hdmi.output_bpc,
> +                       new_conn_state->hdmi.output_bpc);
> +
> +       crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +       KUNIT_EXPECT_TRUE(test, crtc_state->mode_changed);
> +}
> +
> +/*
> + * Test that if we set the output bpc property to the same value, we
> + * don't trigger a mode change on the connector's CRTC and leave the
> + * connector unaffected.
> + */
> +static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_modeset_acquire_ctx *ctx;
> +       struct drm_connector_state *old_conn_state;
> +       struct drm_connector_state *new_conn_state;
> +       struct drm_crtc_state *crtc_state;
> +       struct drm_atomic_state *state;
> +       struct drm_display_mode *preferred;
> +       struct drm_connector *conn;
> +       struct drm_device *drm;
> +       struct drm_crtc *crtc;
> +       int ret;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 10);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +       conn = &priv->connector;
> +       preferred = find_preferred_mode(conn);
> +       KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +       drm = &priv->drm;
> +       crtc = priv->crtc;
> +       ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +       new_conn_state = drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +       old_conn_state = drm_atomic_get_old_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       new_conn_state->hdmi.output_bpc,
> +                       old_conn_state->hdmi.output_bpc);
> +
> +       ret = drm_atomic_check_only(state);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       old_conn_state = drm_atomic_get_old_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +       new_conn_state = drm_atomic_get_new_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +       KUNIT_EXPECT_EQ(test,
> +                       old_conn_state->hdmi.output_bpc,
> +                       new_conn_state->hdmi.output_bpc);
> +
> +       crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +       KUNIT_EXPECT_FALSE(test, crtc_state->mode_changed);
> +}
> +
>  static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
>         KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode),
>         KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode_vic_1),
> @@ -666,6 +800,8 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
>         KUNIT_CASE(drm_test_check_broadcast_rgb_limited_cea_mode_vic_1),
>         KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_changed),
>         KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
> +       KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
> +       KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
>         { }
>  };
>
> @@ -684,7 +820,7 @@ static void drm_test_check_broadcast_rgb_value(struct kunit *test)
>         struct drm_connector_state *conn_state;
>         struct drm_connector *conn;
>
> -       priv = drm_atomic_helper_connector_hdmi_init(test);
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 8);
>         KUNIT_ASSERT_NOT_NULL(test, priv);
>
>         conn = &priv->connector;
> @@ -692,8 +828,77 @@ static void drm_test_check_broadcast_rgb_value(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, conn_state->hdmi.broadcast_rgb, DRM_HDMI_BROADCAST_RGB_AUTO);
>  }
>
> +/*
> + * Test that if the connector was initialised with a maximum bpc of 8,
> + * the value of the max_bpc and max_requested_bpc properties out of
> + * reset are also set to 8, and output_bpc is set to 0 and will be
> + * filled at atomic_check time.
> + */
> +static void drm_test_check_bpc_8_value(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_connector_state *conn_state;
> +       struct drm_connector *conn;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 8);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn = &priv->connector;
> +       conn_state = conn->state;
> +       KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 8);
> +       KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 8);
> +       KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
> +}
> +
> +/*
> + * Test that if the connector was initialised with a maximum bpc of 10,
> + * the value of the max_bpc and max_requested_bpc properties out of
> + * reset are also set to 10, and output_bpc is set to 0 and will be
> + * filled at atomic_check time.
> + */
> +static void drm_test_check_bpc_10_value(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_connector_state *conn_state;
> +       struct drm_connector *conn;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 10);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn = &priv->connector;
> +       conn_state = conn->state;
> +       KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 10);
> +       KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 10);
> +       KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
> +}
> +
> +/*
> + * Test that if the connector was initialised with a maximum bpc of 12,
> + * the value of the max_bpc and max_requested_bpc properties out of
> + * reset are also set to 12, and output_bpc is set to 0 and will be
> + * filled at atomic_check time.
> + */
> +static void drm_test_check_bpc_12_value(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_connector_state *conn_state;
> +       struct drm_connector *conn;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test, 12);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn = &priv->connector;
> +       conn_state = conn->state;
> +       KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 12);
> +       KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 12);
> +       KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
> +}
> +
>  static struct kunit_case drm_atomic_helper_connector_hdmi_reset_tests[] = {
>         KUNIT_CASE(drm_test_check_broadcast_rgb_value),
> +       KUNIT_CASE(drm_test_check_bpc_8_value),
> +       KUNIT_CASE(drm_test_check_bpc_10_value),
> +       KUNIT_CASE(drm_test_check_bpc_12_value),
>         { }
>  };
>
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
> index 41d33dea30af..fef7d53d34d4 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -186,7 +186,8 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
>                                        &dummy_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> -                                      &priv->ddc);
> +                                      &priv->ddc,
> +                                      8);
>         KUNIT_EXPECT_EQ(test, ret, 0);
>  }
>
> @@ -202,10 +203,144 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
>                                        &dummy_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> -                                      NULL);
> +                                      NULL,
> +                                      8);
>         KUNIT_EXPECT_EQ(test, ret, 0);
>  }
>
> +/*
> + * Test that the registration of a connector with an invalid maximum bpc
> + * count fails.
> + */
> +static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       int ret;
> +
> +       ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      &dummy_funcs,
> +                                      DRM_MODE_CONNECTOR_HDMIA,
> +                                      &priv->ddc,
> +                                      9);
> +       KUNIT_EXPECT_LT(test, ret, 0);
> +}
> +
> +/*
> + * Test that the registration of a connector with a null maximum bpc
> + * count fails.
> + */
> +static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       int ret;
> +
> +       ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      &dummy_funcs,
> +                                      DRM_MODE_CONNECTOR_HDMIA,
> +                                      &priv->ddc,
> +                                      0);
> +       KUNIT_EXPECT_LT(test, ret, 0);
> +}
> +
> +/*
> + * Test that the registration of a connector with a maximum bpc count of
> + * 8 succeeds, registers the max bpc property, but doesn't register the
> + * HDR output metadata one.
> + */
> +static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       struct drm_connector *connector = &priv->connector;
> +       struct drm_property *prop;
> +       uint64_t val;
> +       int ret;
> +
> +       ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +                                      &dummy_funcs,
> +                                      DRM_MODE_CONNECTOR_HDMIA,
> +                                      &priv->ddc,
> +                                      8);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +       prop = connector->max_bpc_property;
> +       KUNIT_ASSERT_NOT_NULL(test, prop);
> +       KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +
> +       ret = drm_object_property_get_value(&connector->base, prop, &val);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +       KUNIT_EXPECT_EQ(test, val, 8);
> +
> +       prop = priv->drm.mode_config.hdr_output_metadata_property;
> +       KUNIT_ASSERT_NOT_NULL(test, prop);
> +       KUNIT_EXPECT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +}
> +
> +/*
> + * Test that the registration of a connector with a maximum bpc count of
> + * 10 succeeds and registers the max bpc and HDR output metadata
> + * properties.
> + */
> +static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       struct drm_connector *connector = &priv->connector;
> +       struct drm_property *prop;
> +       uint64_t val;
> +       int ret;
> +
> +       ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +                                      &dummy_funcs,
> +                                      DRM_MODE_CONNECTOR_HDMIA,
> +                                      &priv->ddc,
> +                                      10);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +       prop = connector->max_bpc_property;
> +       KUNIT_ASSERT_NOT_NULL(test, prop);
> +       KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +
> +       ret = drm_object_property_get_value(&connector->base, prop, &val);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +       KUNIT_EXPECT_EQ(test, val, 10);
> +
> +       prop = priv->drm.mode_config.hdr_output_metadata_property;
> +       KUNIT_ASSERT_NOT_NULL(test, prop);
> +       KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +}
> +
> +/*
> + * Test that the registration of a connector with a maximum bpc count of
> + * 12 succeeds and registers the max bpc and HDR output metadata
> + * properties.
> + */
> +static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       struct drm_connector *connector = &priv->connector;
> +       struct drm_property *prop;
> +       uint64_t val;
> +       int ret;
> +
> +       ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +                                      &dummy_funcs,
> +                                      DRM_MODE_CONNECTOR_HDMIA,
> +                                      &priv->ddc,
> +                                      12);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +       prop = connector->max_bpc_property;
> +       KUNIT_ASSERT_NOT_NULL(test, prop);
> +       KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +
> +       ret = drm_object_property_get_value(&connector->base, prop, &val);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +       KUNIT_EXPECT_EQ(test, val, 12);
> +
> +       prop = priv->drm.mode_config.hdr_output_metadata_property;
> +       KUNIT_ASSERT_NOT_NULL(test, prop);
> +       KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +}
> +
>  /*
>   * Test that the registration of an HDMI connector with an HDMI
>   * connector type succeeds.
> @@ -219,7 +354,8 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
>                                        &dummy_funcs,
>                                        connector_type,
> -                                      &priv->ddc);
> +                                      &priv->ddc,
> +                                      8);
>         KUNIT_EXPECT_EQ(test, ret, 0);
>  }
>
> @@ -250,7 +386,8 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
>                                        &dummy_funcs,
>                                        connector_type,
> -                                      &priv->ddc);
> +                                      &priv->ddc,
> +                                      8);
>         KUNIT_EXPECT_LT(test, ret, 0);
>  }
>
> @@ -282,6 +419,11 @@ KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_type_invalid,
>
>  static struct kunit_case drmm_connector_hdmi_init_tests[] = {
>         KUNIT_CASE(drm_test_connector_hdmi_init_valid),
> +       KUNIT_CASE(drm_test_connector_hdmi_init_bpc_8),
> +       KUNIT_CASE(drm_test_connector_hdmi_init_bpc_10),
> +       KUNIT_CASE(drm_test_connector_hdmi_init_bpc_12),
> +       KUNIT_CASE(drm_test_connector_hdmi_init_bpc_invalid),
> +       KUNIT_CASE(drm_test_connector_hdmi_init_bpc_null),
>         KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
>         KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_valid,
>                          drm_connector_hdmi_init_type_valid_gen_params),
> @@ -447,7 +589,8 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
>         ret = drmm_connector_hdmi_init(&priv->drm, connector,
>                                        &dummy_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> -                                      &priv->ddc);
> +                                      &priv->ddc,
> +                                      8);
>         KUNIT_EXPECT_EQ(test, ret, 0);
>
>         ret = drm_connector_attach_broadcast_rgb_property(connector);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 76eecd449fb8..1b1b6aed04ee 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1072,6 +1072,11 @@ struct drm_connector_state {
>                  * RGB Quantization Range or not?
>                  */
>                 bool is_full_range;
> +
> +               /**
> +                * @output_bpc: Bits per color channel to output.
> +                */
> +               unsigned int output_bpc;
>         } hdmi;
>  };
>
> @@ -1717,6 +1722,11 @@ struct drm_connector {
>          */
>         struct drm_property_blob *path_blob_ptr;
>
> +       /**
> +        * @max_bpc: Maximum bits per color channel the connector supports.
> +        */
> +       unsigned int max_bpc;
> +
>         /**
>          * @max_bpc_property: Default connector property for the max bpc to be
>          * driven out of the connector.
> @@ -1956,7 +1966,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>                              struct drm_connector *connector,
>                              const struct drm_connector_funcs *funcs,
>                              int connector_type,
> -                            struct i2c_adapter *ddc);
> +                            struct i2c_adapter *ddc,
> +                            unsigned int max_bpc);
>  void drm_connector_attach_edid_property(struct drm_connector *connector);
>  int drm_connector_register(struct drm_connector *connector);
>  void drm_connector_unregister(struct drm_connector *connector);
>
> --
> 2.43.0
>

