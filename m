Return-Path: <linux-media+bounces-2421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F788133E4
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 16:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BFB3283378
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 15:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E30B5C065;
	Thu, 14 Dec 2023 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="B7uQVUeB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FA9115
	for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 07:04:49 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5e25d1d189eso6149697b3.0
        for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 07:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1702566289; x=1703171089; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VI7W+I4bCeydzlGgal0wC/cMuPfjmbIH2bu8bhl5ntM=;
        b=B7uQVUeBG+tace7v+DOtdsrFlwncvkogx406cKroP6VIEgCn6gqBs3MaUCu5pzMfz5
         5PoxJKZKIA/otE/HJmq4XKrlFk4TNW5xTSTmTp2kHHeugzJwtqF2U9R8q7hCeQhWqVSh
         k8Z+6pvbCBpy4JlWpkQGtzihw7zw6L+8Rd4QPTzC5WplKvFrflqNCc78WyxFiP+Arcvl
         Wf/h0vaSf7iT1bi0mo4O+Qpf1FmfAU1mAt4d7Wy8dLtHpY4xa68l3n/Mdf7XOsSLo07L
         sGW933xrRYAIv/8IaTedvvVQQkV+qJe2WYz+YCZyllK71K8EWP72+KemYUBFafgrlhWI
         aO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566289; x=1703171089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VI7W+I4bCeydzlGgal0wC/cMuPfjmbIH2bu8bhl5ntM=;
        b=WaN8lE5dGhD3Yqfo/TP5BvbtlL9/kurBJao3JDqPbyzrvsWQQSaesNQcCNvHqqTlFU
         uh74/BrwwFtBRHLp6poBEq7u+S7cwUFVGTuspsIy17gpWvEoWk3szc49gGRFzp6hXu4q
         8QNfxW3rUxYLC8koeMsXk7vg8NibECFHlRHyAsDJuy8vYftVx69WaJwC2e/Oe8XG+feu
         wP4ifhQGp7PTDRkuJtqj7SIzNrr+QAY67OVz5NLUpLAH/4FROo9DO4Ve2SQp6a1Y1XZt
         ocH8Th4crCsvdQXG9gFQjJ2WHDWPSoELYeEkPYsqhWn4s2O88GrI/Wu/1LbfS4bsl+i9
         NcXg==
X-Gm-Message-State: AOJu0Yx01pfZyUtdH2BaGQPDUUF2zN9x+ifMJptjs8ld8w3J1bDa88KB
	fW1yeFJeM6fal/Xg/StxRoGT3zlw09UhHBc1jdgGwQ==
X-Google-Smtp-Source: AGHT+IFMRkSZ4IqKlo5AZD0Dr2MFTPROkl/AUfAw0aINjSZF2m+ijvov/7DZQpSTN0qgNQXzAHLO2XwXbOcKanRwG4A=
X-Received: by 2002:a81:94c6:0:b0:5d7:1a33:5ad4 with SMTP id
 l189-20020a8194c6000000b005d71a335ad4mr8400993ywg.33.1702566288994; Thu, 14
 Dec 2023 07:04:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org> <20231207-kms-hdmi-connector-state-v5-13-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-13-6538e19d634d@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Dec 2023 15:04:32 +0000
Message-ID: <CAPY8ntDzcyLNp=DYesmLcGpaaPgbAhJHWTVsTabdKUARS3V5xA@mail.gmail.com>
Subject: Re: [PATCH v5 13/44] drm/connector: hdmi: Calculate TMDS character rate
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 15:50, Maxime Ripard <mripard@kernel.org> wrote:
>
> Most HDMI drivers have some code to calculate the TMDS character rate,
> usually to adjust an internal clock to match what the mode requires.
>
> Since the TMDS character rates mostly depends on the resolution, whether
> we need to repeat pixels or not, the bpc count and the format, we can
> now derive it from the HDMI connector state that stores all those infos
> and remove the duplication from drivers.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/drm_atomic.c                       |   1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c          |  44 +++++
>  .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 169 ++++++++++++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 216 +++++++++++++++++++++
>  include/drm/drm_connector.h                        |   5 +
>  5 files changed, 435 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 7aaa2a4d70d9..4f6493f91eed 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1150,6 +1150,7 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
>                 drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
>                 drm_printf(p, "\toutput_format=%s\n",
>                            drm_hdmi_connector_get_output_format_name(state->hdmi.output_format));
> +               drm_printf(p, "\ttmds_char_rate=%llu\n", state->hdmi.tmds_char_rate);
>         }
>
>         if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 92e1b087c3d0..74bc3cc53c2d 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -682,6 +682,41 @@ static bool hdmi_is_full_range(const struct drm_connector *connector,
>         return drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL ? true : false;
>  }
>
> +static enum drm_mode_status
> +hdmi_clock_valid(const struct drm_connector *connector,
> +                const struct drm_display_mode *mode,
> +                unsigned long long clock)
> +{
> +       const struct drm_display_info *info = &connector->display_info;
> +
> +       if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
> +static int
> +hdmi_compute_clock(const struct drm_connector *connector,
> +                  struct drm_connector_state *state,
> +                  const struct drm_display_mode *mode,
> +                  unsigned int bpc, enum hdmi_colorspace fmt)
> +{
> +       enum drm_mode_status status;
> +       unsigned long long clock;
> +
> +       clock = drm_connector_hdmi_compute_mode_clock(mode, bpc, fmt);
> +       if (!clock)
> +               return -EINVAL;
> +
> +       status = hdmi_clock_valid(connector, mode, clock);
> +       if (status != MODE_OK)
> +               return -EINVAL;
> +
> +       state->hdmi.tmds_char_rate = clock;
> +
> +       return 0;
> +}
> +
>  /**
>   * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
>   * @connector: DRM Connector
> @@ -701,9 +736,18 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>                 drm_atomic_get_old_connector_state(state, connector);
>         struct drm_connector_state *new_state =
>                 drm_atomic_get_new_connector_state(state, connector);
> +       const struct drm_display_mode *mode =
> +               connector_state_get_mode(new_state);
> +       int ret;
>
>         new_state->hdmi.is_full_range = hdmi_is_full_range(connector, new_state);
>
> +       ret = hdmi_compute_clock(connector, new_state, mode,
> +                                new_state->hdmi.output_bpc,
> +                                new_state->hdmi.output_format);
> +       if (ret)
> +               return ret;
> +
>         if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
>             old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
>             old_state->hdmi.output_format != new_state->hdmi.output_format) {
> diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> index 4e2ec436987b..d76fafb91025 100644
> --- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> @@ -70,6 +70,9 @@ static int light_up_connector(struct kunit *test,
>         conn_state = drm_atomic_get_connector_state(state, connector);
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
>
> +       conn_state->hdmi.output_bpc = connector->max_bpc;
> +       conn_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
> +
>         ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
>         KUNIT_EXPECT_EQ(test, ret, 0);
>
> @@ -813,6 +816,146 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
>         KUNIT_EXPECT_FALSE(test, crtc_state->mode_changed);
>  }
>
> +/*
> + * Test that when doing a commit which would use RGB 8bpc, the TMDS
> + * clock rate stored in the connector state is equal to the mode clock
> + */
> +static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_modeset_acquire_ctx *ctx;
> +       struct drm_connector_state *conn_state;
> +       struct drm_display_mode *preferred;
> +       struct drm_connector *conn;
> +       struct drm_device *drm;
> +       struct drm_crtc *crtc;
> +       int ret;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test,
> +                                                    BIT(HDMI_COLORSPACE_RGB),
> +                                                    8);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn = &priv->connector;
> +       ret = set_connector_edid(test, conn,
> +                                test_edid_hdmi_1080p_rgb_max_200mhz,
> +                                ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +       preferred = find_preferred_mode(conn);
> +       KUNIT_ASSERT_NOT_NULL(test, preferred);
> +       KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       drm = &priv->drm;
> +       crtc = priv->crtc;
> +       ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       conn_state = conn->state;
> +       KUNIT_ASSERT_NOT_NULL(test, conn_state);
> +
> +       KUNIT_ASSERT_EQ(test, conn_state->hdmi.output_bpc, 8);
> +       KUNIT_ASSERT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
> +       KUNIT_EXPECT_EQ(test, conn_state->hdmi.tmds_char_rate, preferred->clock * 1000);
> +}
> +
> +/*
> + * Test that when doing a commit which would use RGB 10bpc, the TMDS
> + * clock rate stored in the connector state is equal to 1.25 times the
> + * mode pixel clock
> + */
> +static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_modeset_acquire_ctx *ctx;
> +       struct drm_connector_state *conn_state;
> +       struct drm_display_mode *preferred;
> +       struct drm_connector *conn;
> +       struct drm_device *drm;
> +       struct drm_crtc *crtc;
> +       int ret;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test,
> +                                                    BIT(HDMI_COLORSPACE_RGB),
> +                                                    10);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn = &priv->connector;
> +       ret = set_connector_edid(test, conn,
> +                                test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
> +                                ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +       preferred = find_preferred_mode(conn);
> +       KUNIT_ASSERT_NOT_NULL(test, preferred);
> +       KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       drm = &priv->drm;
> +       crtc = priv->crtc;
> +       ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       conn_state = conn->state;
> +       KUNIT_ASSERT_NOT_NULL(test, conn_state);
> +
> +       KUNIT_ASSERT_EQ(test, conn_state->hdmi.output_bpc, 10);
> +       KUNIT_ASSERT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
> +       KUNIT_EXPECT_EQ(test, conn_state->hdmi.tmds_char_rate, preferred->clock * 1250);
> +}
> +
> +/*
> + * Test that when doing a commit which would use RGB 12bpc, the TMDS
> + * clock rate stored in the connector state is equal to 1.5 times the
> + * mode pixel clock
> + */
> +static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_modeset_acquire_ctx *ctx;
> +       struct drm_connector_state *conn_state;
> +       struct drm_display_mode *preferred;
> +       struct drm_connector *conn;
> +       struct drm_device *drm;
> +       struct drm_crtc *crtc;
> +       int ret;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test,
> +                                                    BIT(HDMI_COLORSPACE_RGB),
> +                                                    12);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn = &priv->connector;
> +       ret = set_connector_edid(test, conn,
> +                                test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
> +                                ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +       preferred = find_preferred_mode(conn);
> +       KUNIT_ASSERT_NOT_NULL(test, preferred);
> +       KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       drm = &priv->drm;
> +       crtc = priv->crtc;
> +       ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       conn_state = conn->state;
> +       KUNIT_ASSERT_NOT_NULL(test, conn_state);
> +
> +       KUNIT_ASSERT_EQ(test, conn_state->hdmi.output_bpc, 12);
> +       KUNIT_ASSERT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
> +       KUNIT_EXPECT_EQ(test, conn_state->hdmi.tmds_char_rate, preferred->clock * 1500);
> +}
> +
>  static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
>         KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode),
>         KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode_vic_1),
> @@ -824,6 +967,9 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
>         KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
>         KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
>         KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
> +       KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_8bpc),
> +       KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_10bpc),
> +       KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_12bpc),
>         /*
>          * TODO: We should have tests to check that a change in the
>          * format triggers a CRTC mode change just like we do for the
> @@ -955,12 +1101,35 @@ static void drm_test_check_format_value(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
>  }
>
> +/*
> + * Test that the value of the output format property out of reset is set
> + * to 0, and will be computed at atomic_check time.
> + */
> +static void drm_test_check_tmds_char_value(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_connector_state *conn_state;
> +       struct drm_connector *conn;
> +
> +       priv = drm_atomic_helper_connector_hdmi_init(test,
> +                                                    BIT(HDMI_COLORSPACE_RGB) |
> +                                                    BIT(HDMI_COLORSPACE_YUV422) |
> +                                                    BIT(HDMI_COLORSPACE_YUV444),
> +                                                    12);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn = &priv->connector;
> +       conn_state = conn->state;
> +       KUNIT_EXPECT_EQ(test, conn_state->hdmi.tmds_char_rate, 0);
> +}
> +
>  static struct kunit_case drm_atomic_helper_connector_hdmi_reset_tests[] = {
>         KUNIT_CASE(drm_test_check_broadcast_rgb_value),
>         KUNIT_CASE(drm_test_check_bpc_8_value),
>         KUNIT_CASE(drm_test_check_bpc_10_value),
>         KUNIT_CASE(drm_test_check_bpc_12_value),
>         KUNIT_CASE(drm_test_check_format_value),
> +       KUNIT_CASE(drm_test_check_tmds_char_value),
>         { }
>  };
>
> diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tests/drm_kunit_edid.h
> index 2bba316de064..24f3377ef0f0 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_edid.h
> +++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
> @@ -103,4 +103,220 @@ const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] = {
>    0x00, 0x00, 0x00, 0xd0
>  };
>
> +/*
> + * edid-decode (hex):
> + *
> + * 00 ff ff ff ff ff ff 00 31 d8 2a 00 00 00 00 00
> + * 00 21 01 03 81 a0 5a 78 1a 00 00 00 00 00 00 00
> + * 00 00 00 20 00 00 01 01 01 01 01 01 01 01 01 01
> + * 01 01 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
> + * 45 00 40 84 63 00 00 1e 00 00 00 fc 00 54 65 73
> + * 74 20 45 44 49 44 0a 20 20 20 00 00 00 fd 00 32
> + * 46 1e 46 0f 00 0a 20 20 20 20 20 20 00 00 00 10
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 7a
> + *
> + * 02 03 1b b1 e3 05 00 20 41 10 e2 00 ca 6d 03 0c
> + * 00 12 34 78 28 20 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 a8
> + *
> + * ----------------
> + *
> + * Block 0, Base EDID:
> + *   EDID Structure Version & Revision: 1.3
> + *   Vendor & Product Identification:
> + *     Manufacturer: LNX
> + *     Model: 42
> + *     Made in: 2023
> + *   Basic Display Parameters & Features:
> + *     Digital display
> + *     DFP 1.x compatible TMDS
> + *     Maximum image size: 160 cm x 90 cm
> + *     Gamma: 2.20
> + *     Undefined display color type
> + *     First detailed timing is the preferred timing
> + *   Color Characteristics:
> + *     Red  : 0.0000, 0.0000
> + *     Green: 0.0000, 0.0000
> + *     Blue : 0.0000, 0.0000
> + *     White: 0.0000, 0.0000
> + *   Established Timings I & II:
> + *     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
> + *   Standard Timings: none
> + *   Detailed Timing Descriptors:
> + *     DTD 1:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (1600 mm x 900 mm)
> + *                  Hfront   88 Hsync  44 Hback  148 Hpol P
> + *                  Vfront    4 Vsync   5 Vback   36 Vpol P
> + *     Display Product Name: 'Test EDID'
> + *     Display Range Limits:
> + *       Monitor ranges (GTF): 50-70 Hz V, 30-70 kHz H, max dotclock 150 MHz
> + *     Dummy Descriptor:
> + *   Extension blocks: 1
> + * Checksum: 0x7a
> + *
> + * ----------------
> + *
> + * Block 1, CTA-861 Extension Block:
> + *   Revision: 3
> + *   Underscans IT Video Formats by default
> + *   Supports YCbCr 4:4:4
> + *   Supports YCbCr 4:2:2
> + *   Native detailed modes: 1
> + *   Colorimetry Data Block:
> + *     sRGB
> + *   Video Data Block:
> + *     VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
> + *   Video Capability Data Block:
> + *     YCbCr quantization: Selectable (via AVI YQ)
> + *     RGB quantization: Selectable (via AVI Q)
> + *     PT scan behavior: No Data
> + *     IT scan behavior: Always Underscanned
> + *     CE scan behavior: Always Underscanned
> + *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
> + *     Source physical address: 1.2.3.4
> + *     DC_48bit
> + *     DC_36bit
> + *     DC_30bit
> + *     DC_Y444
> + *     Maximum TMDS clock: 200 MHz
> + *     Extended HDMI video details:
> + * Checksum: 0xa8  Unused space in Extension Block: 100 bytes
> + */
> +const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz[] = {
> +  0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
> +  0x1a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
> +  0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> +  0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a, 0x80, 0x18, 0x71, 0x38,
> +  0x2d, 0x40, 0x58, 0x2c, 0x45, 0x00, 0x40, 0x84, 0x63, 0x00, 0x00, 0x1e,
> +  0x00, 0x00, 0x00, 0xfc, 0x00, 0x54, 0x65, 0x73, 0x74, 0x20, 0x45, 0x44,
> +  0x49, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x32,
> +  0x46, 0x1e, 0x46, 0x0f, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +  0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x7a, 0x02, 0x03, 0x1b, 0xb1,
> +  0xe3, 0x05, 0x00, 0x20, 0x41, 0x10, 0xe2, 0x00, 0xca, 0x6d, 0x03, 0x0c,
> +  0x00, 0x12, 0x34, 0x78, 0x28, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0xa8
> +};
> +
> +/*
> + * edid-decode (hex):
> + *
> + * 00 ff ff ff ff ff ff 00 31 d8 2a 00 00 00 00 00
> + * 00 21 01 03 81 a0 5a 78 0a 00 00 00 00 00 00 00
> + * 00 00 00 20 00 00 01 01 01 01 01 01 01 01 01 01
> + * 01 01 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
> + * 45 00 40 84 63 00 00 1e 00 00 00 fc 00 54 65 73
> + * 74 20 45 44 49 44 0a 20 20 20 00 00 00 fd 00 32
> + * 46 1e 46 0f 00 0a 20 20 20 20 20 20 00 00 00 10
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 8a
> + *
> + * 02 03 1b b1 e3 05 00 20 41 10 e2 00 ca 6d 03 0c
> + * 00 12 34 78 44 20 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 8c
> + *
> + * ----------------
> + *
> + * Block 0, Base EDID:
> + *   EDID Structure Version & Revision: 1.3
> + *   Vendor & Product Identification:
> + *     Manufacturer: LNX
> + *     Model: 42
> + *     Made in: 2023
> + *   Basic Display Parameters & Features:
> + *     Digital display
> + *     DFP 1.x compatible TMDS
> + *     Maximum image size: 160 cm x 90 cm
> + *     Gamma: 2.20
> + *     RGB color display
> + *     First detailed timing is the preferred timing
> + *   Color Characteristics:
> + *     Red  : 0.0000, 0.0000
> + *     Green: 0.0000, 0.0000
> + *     Blue : 0.0000, 0.0000
> + *     White: 0.0000, 0.0000
> + *   Established Timings I & II:
> + *     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
> + *   Standard Timings: none
> + *   Detailed Timing Descriptors:
> + *     DTD 1:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (1600 mm x 900 mm)
> + *                  Hfront   88 Hsync  44 Hback  148 Hpol P
> + *                  Vfront    4 Vsync   5 Vback   36 Vpol P
> + *     Display Product Name: 'Test EDID'
> + *     Display Range Limits:
> + *       Monitor ranges (GTF): 50-70 Hz V, 30-70 kHz H, max dotclock 150 MHz
> + *     Dummy Descriptor:
> + *   Extension blocks: 1
> + * Checksum: 0x8a
> + *
> + * ----------------
> + *
> + * Block 1, CTA-861 Extension Block:
> + *   Revision: 3
> + *   Underscans IT Video Formats by default
> + *   Supports YCbCr 4:4:4
> + *   Supports YCbCr 4:2:2
> + *   Native detailed modes: 1
> + *   Colorimetry Data Block:
> + *     sRGB
> + *   Video Data Block:
> + *     VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
> + *   Video Capability Data Block:
> + *     YCbCr quantization: Selectable (via AVI YQ)
> + *     RGB quantization: Selectable (via AVI Q)
> + *     PT scan behavior: No Data
> + *     IT scan behavior: Always Underscanned
> + *     CE scan behavior: Always Underscanned
> + *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
> + *     Source physical address: 1.2.3.4
> + *     DC_48bit
> + *     DC_36bit
> + *     DC_30bit
> + *     DC_Y444
> + *     Maximum TMDS clock: 340 MHz
> + *     Extended HDMI video details:
> + * Checksum: 0x8c  Unused space in Extension Block: 100 bytes
> + */
> +const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz[] = {
> +  0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
> +  0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
> +  0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> +  0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a, 0x80, 0x18, 0x71, 0x38,
> +  0x2d, 0x40, 0x58, 0x2c, 0x45, 0x00, 0x40, 0x84, 0x63, 0x00, 0x00, 0x1e,
> +  0x00, 0x00, 0x00, 0xfc, 0x00, 0x54, 0x65, 0x73, 0x74, 0x20, 0x45, 0x44,
> +  0x49, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x32,
> +  0x46, 0x1e, 0x46, 0x0f, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +  0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x8a, 0x02, 0x03, 0x1b, 0xb1,
> +  0xe3, 0x05, 0x00, 0x20, 0x41, 0x10, 0xe2, 0x00, 0xca, 0x6d, 0x03, 0x0c,
> +  0x00, 0x12, 0x34, 0x78, 0x44, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x8c
> +};
> +
>  #endif // DRM_KUNIT_EDID_H_
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 0cc5a8732664..59016d9c17f5 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1085,6 +1085,11 @@ struct drm_connector_state {
>                  * @output_format: Pixel format to output in.
>                  */
>                 enum hdmi_colorspace output_format;
> +
> +               /**
> +                * @tmds_char_rate: TMDS Character Rate, in Hz.
> +                */
> +               unsigned long long tmds_char_rate;
>         } hdmi;
>  };
>
>
> --
> 2.43.0
>
>

