Return-Path: <linux-media+bounces-2414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37047813359
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 15:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 596811C214FC
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 14:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DABC5ABB1;
	Thu, 14 Dec 2023 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="e89WRZiq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA5510F
	for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 06:40:08 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-db4422fff15so6909309276.1
        for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 06:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1702564808; x=1703169608; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CVbbR720mxFQWZWSF5/+frzTWN+zosuo0CwTK2ojkMc=;
        b=e89WRZiqS/mxnnSFPbD1PbJq+rKp5JIFJEtgfw2p3Mgne+dA8Pxk8up9WpX/ESAczr
         kjOnObY0FYsI/ws7inCt+/wBO+07+hzG4gY+XgbYup/ctlY9Fz2JfnkiygvNkE4VuSss
         dTCQQ/zYpZ3vpj1ijBYyRuVbEjBXeusZkMBaB/NJHKRGGqDCqo8XCPX1thkRS/owESzx
         hqMcVN0BqBKIr9WfezWyYrr9zFN/7maPA+mtYQZtFfO+9mQPTouwPjUazoQw8JmgCcmj
         AQX31tu7XGhgf2JKQcKGsOqS823yOPwULq/Yb/Ba5PX4/YsykgTIFJhcFatr2Ubm4Zr2
         LpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702564808; x=1703169608;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVbbR720mxFQWZWSF5/+frzTWN+zosuo0CwTK2ojkMc=;
        b=W+8vFrYCBPzx+bjOizC0nwTODQIPypGE+wW5y1Xdl3B6LkpL2vu1eCdF532auYuJ+Y
         IpuAMcOyuiMlmnZQLSjv+X8NVwP23wnacrDQ9YKeoCzeq/+3fUHH7AfgRXSjJ86S1oyS
         jZvoL8VcQV0qXb4pCdyyXSnLMbg9X7myOR9N3aULdiDJBykaILZrM36RwosuRqciL06C
         1M+q2jG2U6649+NMR31ZZcZErMifHx7fBapLqkI48KJobPqQHhjX/qDX7SL/WTuetjtL
         EixxumPZ4BaS0CrJKO3rZhNIDOC2kQ44N2AlQnavP/96WF8AUexo81Yqpc3G0JZXuKZ5
         Fgbw==
X-Gm-Message-State: AOJu0YyQxQkstTEY86fj8mdYP8I4KKeUCnrqM0/p5AIlpuj7PFKqmvxF
	NgFWzzAAWmVObqaXsC+3+2Jg1Cs7fEfjTMB0OR1twA==
X-Google-Smtp-Source: AGHT+IE2fGQgctDfqw+SdyQcQrVtSDwfkDhdhufA57h07Dfv7cH935CDl5idwK5f/LKOwnfwTJf5aUvfXaezh/MpzdQ=
X-Received: by 2002:a05:6902:cc2:b0:da3:b466:1f73 with SMTP id
 cq2-20020a0569020cc200b00da3b4661f73mr7064045ybb.24.1702564807819; Thu, 14
 Dec 2023 06:40:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org> <20231207-kms-hdmi-connector-state-v5-6-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-6-6538e19d634d@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Dec 2023 14:39:51 +0000
Message-ID: <CAPY8ntCzdxJ5zyk4eeWV8D+WBdfri61ttoNxVtJUZSAKHoMpGQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/44] drm/connector: Introduce an HDMI connector
 initialization function
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

As requested, I'm just going through patches 6-16.
I will say that I've been less thorough in checking the kunit test
code in this series than the core code changes, and I'm trusting that
all the unit tests pass.

I get a build failure on the complete series for arm64 with the
standard defconfig
depmod: ERROR: Cycle detected: drm_display_helper -> drm_kms_helper ->
drm_display_helper
depmod: ERROR: Cycle detected: drm
depmod: ERROR: Found 2 modules in dependency cycles!

I haven't followed it through as to the reason, but obviously that
will need to be addressed.

  Dave

On Thu, 7 Dec 2023 at 15:49, Maxime Ripard <mripard@kernel.org> wrote:
>
> A lot of the various HDMI drivers duplicate some logic that depends on
> the HDMI spec itself and not really a particular hardware
> implementation.
>
> Output BPC or format selection, infoframe generation are good examples
> of such areas.
>
> This creates a lot of boilerplate, with a lot of variations, which makes
> it hard for userspace to rely on, and makes it difficult to get it right
> for drivers.
>
> In the next patches, we'll add a lot of infrastructure around the
> drm_connector and drm_connector_state structures, which will allow to
> abstract away the duplicated logic. This infrastructure comes with a few
> requirements though, and thus we need a new initialization function.
>
> Hopefully, this will make drivers simpler to handle, and their behaviour
> more consistent.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/drm_connector.c            |  39 +++++++++
>  drivers/gpu/drm/tests/drm_connector_test.c | 123 +++++++++++++++++++++++++++++
>  include/drm/drm_connector.h                |   5 ++
>  3 files changed, 167 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index b0516505f7ae..d9961cce8245 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -452,6 +452,45 @@ int drmm_connector_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drmm_connector_init);
>
> +/**
> + * drmm_connector_hdmi_init - Init a preallocated HDMI connector
> + * @dev: DRM device
> + * @connector: A pointer to the HDMI connector to init
> + * @funcs: callbacks for this connector
> + * @connector_type: user visible type of the connector
> + * @ddc: optional pointer to the associated ddc adapter
> + *
> + * Initialises a preallocated HDMI connector. Connectors can be
> + * subclassed as part of driver connector objects.
> + *
> + * Cleanup is automatically handled with a call to
> + * drm_connector_cleanup() in a DRM-managed action.
> + *
> + * The connector structure should be allocated with drmm_kzalloc().
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drmm_connector_hdmi_init(struct drm_device *dev,
> +                            struct drm_connector *connector,
> +                            const struct drm_connector_funcs *funcs,
> +                            int connector_type,
> +                            struct i2c_adapter *ddc)
> +{
> +       int ret;
> +
> +       if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +             connector_type == DRM_MODE_CONNECTOR_HDMIB))
> +               return -EINVAL;
> +
> +       ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drmm_connector_hdmi_init);
> +
>  /**
>   * drm_connector_attach_edid_property - attach edid property.
>   * @connector: the connector
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
> index a268847be8d1..8f070cacab3b 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -172,6 +172,128 @@ static struct kunit_suite drmm_connector_init_test_suite = {
>         .test_cases = drmm_connector_init_tests,
>  };
>
> +/*
> + * Test that the registration of a bog standard connector works as
> + * expected and doesn't report any error.
> + */
> +static void drm_test_connector_hdmi_init_valid(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       int ret;
> +
> +       ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      &dummy_funcs,
> +                                      DRM_MODE_CONNECTOR_HDMIA,
> +                                      &priv->ddc);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +/*
> + * Test that the registration of a connector without a DDC adapter
> + * doesn't report any error.
> + */
> +static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       int ret;
> +
> +       ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      &dummy_funcs,
> +                                      DRM_MODE_CONNECTOR_HDMIA,
> +                                      NULL);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +/*
> + * Test that the registration of an HDMI connector with an HDMI
> + * connector type succeeds.
> + */
> +static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       unsigned int connector_type = *(unsigned int *)test->param_value;
> +       int ret;
> +
> +       ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      &dummy_funcs,
> +                                      connector_type,
> +                                      &priv->ddc);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +static const unsigned int drm_connector_hdmi_init_type_valid_tests[] = {
> +       DRM_MODE_CONNECTOR_HDMIA,
> +       DRM_MODE_CONNECTOR_HDMIB,
> +};
> +
> +static void drm_connector_hdmi_init_type_desc(const unsigned int *type, char *desc)
> +{
> +       sprintf(desc, "%s", drm_get_connector_type_name(*type));
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_type_valid,
> +                 drm_connector_hdmi_init_type_valid_tests,
> +                 drm_connector_hdmi_init_type_desc);
> +
> +/*
> + * Test that the registration of an HDMI connector with an !HDMI
> + * connector type fails.
> + */
> +static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       unsigned int connector_type = *(unsigned int *)test->param_value;
> +       int ret;
> +
> +       ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      &dummy_funcs,
> +                                      connector_type,
> +                                      &priv->ddc);
> +       KUNIT_EXPECT_LT(test, ret, 0);
> +}
> +
> +static const unsigned int drm_connector_hdmi_init_type_invalid_tests[] = {
> +       DRM_MODE_CONNECTOR_Unknown,
> +       DRM_MODE_CONNECTOR_VGA,
> +       DRM_MODE_CONNECTOR_DVII,
> +       DRM_MODE_CONNECTOR_DVID,
> +       DRM_MODE_CONNECTOR_DVIA,
> +       DRM_MODE_CONNECTOR_Composite,
> +       DRM_MODE_CONNECTOR_SVIDEO,
> +       DRM_MODE_CONNECTOR_LVDS,
> +       DRM_MODE_CONNECTOR_Component,
> +       DRM_MODE_CONNECTOR_9PinDIN,
> +       DRM_MODE_CONNECTOR_DisplayPort,
> +       DRM_MODE_CONNECTOR_TV,
> +       DRM_MODE_CONNECTOR_eDP,
> +       DRM_MODE_CONNECTOR_VIRTUAL,
> +       DRM_MODE_CONNECTOR_DSI,
> +       DRM_MODE_CONNECTOR_DPI,
> +       DRM_MODE_CONNECTOR_WRITEBACK,
> +       DRM_MODE_CONNECTOR_SPI,
> +       DRM_MODE_CONNECTOR_USB,
> +};
> +
> +KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_type_invalid,
> +                 drm_connector_hdmi_init_type_invalid_tests,
> +                 drm_connector_hdmi_init_type_desc);
> +
> +static struct kunit_case drmm_connector_hdmi_init_tests[] = {
> +       KUNIT_CASE(drm_test_connector_hdmi_init_valid),
> +       KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
> +       KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_valid,
> +                        drm_connector_hdmi_init_type_valid_gen_params),
> +       KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_invalid,
> +                        drm_connector_hdmi_init_type_invalid_gen_params),
> +       { }
> +};
> +
> +static struct kunit_suite drmm_connector_hdmi_init_test_suite = {
> +       .name = "drmm_connector_hdmi_init",
> +       .init = drm_test_connector_init,
> +       .test_cases = drmm_connector_hdmi_init_tests,
> +};
> +
>  struct drm_get_tv_mode_from_name_test {
>         const char *name;
>         enum drm_connector_tv_mode expected_mode;
> @@ -236,6 +358,7 @@ static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
>  };
>
>  kunit_test_suites(
> +       &drmm_connector_hdmi_init_test_suite,
>         &drmm_connector_init_test_suite,
>         &drm_get_tv_mode_from_name_test_suite
>  );
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fe88d7fc6b8f..4491c4c2fb6e 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1904,6 +1904,11 @@ int drmm_connector_init(struct drm_device *dev,
>                         const struct drm_connector_funcs *funcs,
>                         int connector_type,
>                         struct i2c_adapter *ddc);
> +int drmm_connector_hdmi_init(struct drm_device *dev,
> +                            struct drm_connector *connector,
> +                            const struct drm_connector_funcs *funcs,
> +                            int connector_type,
> +                            struct i2c_adapter *ddc);
>  void drm_connector_attach_edid_property(struct drm_connector *connector);
>  int drm_connector_register(struct drm_connector *connector);
>  void drm_connector_unregister(struct drm_connector *connector);
>
> --
> 2.43.0
>

