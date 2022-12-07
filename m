Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCC3645C1C
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 15:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbiLGOJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 09:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiLGOJJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 09:09:09 -0500
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B8E1083;
        Wed,  7 Dec 2022 06:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0WMHjQ8OUTUtSzI4ki2yUUYwQdi5nABHeNZIFMpDS3U=; b=P434w6RBO/fQBVDlLt+cjPFNy7
        o+x5WThjV8L+DM2YJtkdZ8lyxpkQuV+QY1NJ7lI1f6It7QoD+lCGFyh8i8ox6CaPZ8jvWpGylbgce
        epXVjOEwNqdTqirbdQjleyGq7EIWogOn24nqMVHI865VoB3JvSmLDSQ5FKz/pFf40bN1d3mSXCzzM
        m7AiuF51PP5rVCuXEDQqbMS7srV7X20tjZQaq/0zG9/Pi6WR2sDEaNPHVVilPaYxsJNK0F3N3WFIc
        pZUR94FyUnhbXzDE0jSDaypNugafj1tFPTWe6SMKSQMpTy7j5lbKkW0CuRT5TfPOvLdXZUPQaMkeZ
        KZXZAeTg==;
Received: from [143.107.182.242] (helo=[10.41.75.14])
        by fanzine2.igalia.com with esmtpsa 
        (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
        id 1p2v6R-00Gc2e-6j; Wed, 07 Dec 2022 15:08:51 +0100
Message-ID: <216b9df5-d4e0-af24-2df9-c374728118a2@igalia.com>
Date:   Wed, 7 Dec 2022 11:08:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 17/20] drm/vc4: tests: Introduce a mocking
 infrastructure
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>,
        Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>
Cc:     David Gow <davidgow@google.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Brendan Higgins <brendan.higgins@linux.dev>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
        linux-media@vger.kernel.org
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
 <20221123-rpi-kunit-tests-v3-17-4615a663a84a@cerno.tech>
From:   =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221123-rpi-kunit-tests-v3-17-4615a663a84a@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/1/22 12:11, Maxime Ripard wrote:
> In order to test the current atomic_check hooks we need to have a DRM
> device that has roughly the same capabilities and layout that the actual
> hardware. We'll also need a bunch of functions to create arbitrary
> atomic states.
> 
> Let's create some helpers to create a device that behaves like the real
> one, and some helpers to maintain the atomic state we want to check.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

But it would be nice if you could fix the checkpatch problems in the 
vc4/tests folder.

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/vc4/Kconfig                 |  16 +++
>   drivers/gpu/drm/vc4/Makefile                |   6 +
>   drivers/gpu/drm/vc4/tests/.kunitconfig      |  13 ++
>   drivers/gpu/drm/vc4/tests/vc4_mock.c        | 200 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/vc4/tests/vc4_mock.h        |  60 +++++++++
>   drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c   |  41 ++++++
>   drivers/gpu/drm/vc4/tests/vc4_mock_output.c |  99 ++++++++++++++
>   drivers/gpu/drm/vc4/tests/vc4_mock_plane.c  |  47 +++++++
>   drivers/gpu/drm/vc4/vc4_crtc.c              |  20 +--
>   drivers/gpu/drm/vc4/vc4_drv.c               |   4 +-
>   drivers/gpu/drm/vc4/vc4_drv.h               |  16 +++
>   drivers/gpu/drm/vc4/vc4_txp.c               |   2 +-
>   12 files changed, 511 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
> index 246305d17a52..f423941c028d 100644
> --- a/drivers/gpu/drm/vc4/Kconfig
> +++ b/drivers/gpu/drm/vc4/Kconfig
> @@ -34,3 +34,19 @@ config DRM_VC4_HDMI_CEC
>   	help
>   	  Choose this option if you have a Broadcom VC4 GPU
>   	  and want to use CEC.
> +
> +config DRM_VC4_KUNIT_TEST
> +	bool "KUnit tests for VC4" if !KUNIT_ALL_TESTS
> +	depends on DRM_VC4 && KUNIT
> +	select DRM_KUNIT_TEST_HELPERS
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds unit tests for the VC4 DRM/KMS driver. This option is
> +	  not useful for distributions or general kernels, but only for kernel
> +	  developers working on the VC4 driver.
> +
> +	  For more information on KUnit and unit tests in general,
> +	  please refer to the KUnit documentation in
> +	  Documentation/dev-tools/kunit/.
> +
> +	  If in doubt, say "N".
> diff --git a/drivers/gpu/drm/vc4/Makefile b/drivers/gpu/drm/vc4/Makefile
> index d0163e18e9ca..f974a8c80e2f 100644
> --- a/drivers/gpu/drm/vc4/Makefile
> +++ b/drivers/gpu/drm/vc4/Makefile
> @@ -25,6 +25,12 @@ vc4-y := \
>   	vc4_validate.o \
>   	vc4_validate_shaders.o
>   
> +vc4-$(CONFIG_DRM_VC4_KUNIT_TEST) += \
> +	tests/vc4_mock.o \
> +	tests/vc4_mock_crtc.o \
> +	tests/vc4_mock_output.o \
> +	tests/vc4_mock_plane.o
> +
>   vc4-$(CONFIG_DEBUG_FS) += vc4_debugfs.o
>   
>   obj-$(CONFIG_DRM_VC4)  += vc4.o
> diff --git a/drivers/gpu/drm/vc4/tests/.kunitconfig b/drivers/gpu/drm/vc4/tests/.kunitconfig
> new file mode 100644
> index 000000000000..b503e9036c7f
> --- /dev/null
> +++ b/drivers/gpu/drm/vc4/tests/.kunitconfig
> @@ -0,0 +1,13 @@
> +CONFIG_ARCH_BCM=y
> +CONFIG_ARCH_BCM2835=y
> +CONFIG_BCM2835_MBOX=y
> +CONFIG_KUNIT=y
> +CONFIG_DRM=y
> +CONFIG_DRM_VC4=y
> +CONFIG_DRM_VC4_KUNIT_TEST=y
> +CONFIG_MAILBOX=y
> +CONFIG_RASPBERRYPI_FIRMWARE=y
> +CONFIG_SND=y
> +CONFIG_SND_SOC=y
> +CONFIG_SOUND=y
> +CONFIG_COMMON_CLK=y
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
> new file mode 100644
> index 000000000000..a4bed26af32f
> --- /dev/null
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_kunit_helpers.h>
> +
> +#include <kunit/test.h>
> +
> +#include "vc4_mock.h"
> +
> +struct vc4_mock_output_desc {
> +	enum vc4_encoder_type	vc4_encoder_type;
> +	unsigned int		encoder_type;
> +	unsigned int		connector_type;
> +};
> +
> +#define VC4_MOCK_OUTPUT_DESC(_vc4_type, _etype, _ctype)					\
> +	{										\
> +		.vc4_encoder_type = _vc4_type,						\
> +		.encoder_type = _etype,							\
> +		.connector_type = _ctype,						\
> +	}
> +
> +struct vc4_mock_pipe_desc {
> +	const struct vc4_crtc_data *data;
> +	const struct vc4_mock_output_desc *outputs;
> +	unsigned int noutputs;
> +};
> +
> +#define VC4_MOCK_CRTC_DESC(_data, ...)							\
> +	{										\
> +		.data = _data,								\
> +		.outputs = (struct vc4_mock_output_desc[]) { __VA_ARGS__ },		\
> +		.noutputs = sizeof((struct vc4_mock_output_desc[]) { __VA_ARGS__ }) /	\
> +			     sizeof(struct vc4_mock_output_desc),			\
> +	}
> +
> +#define VC4_MOCK_PIXELVALVE_DESC(_data, ...)						\
> +	VC4_MOCK_CRTC_DESC(&(_data)->base, __VA_ARGS__)
> +
> +struct vc4_mock_desc {
> +	const struct vc4_mock_pipe_desc *pipes;
> +	unsigned int npipes;
> +};
> +
> +#define VC4_MOCK_DESC(...)								\
> +	{										\
> +		.pipes = (struct vc4_mock_pipe_desc[]) { __VA_ARGS__ },			\
> +		.npipes = sizeof((struct vc4_mock_pipe_desc[]) { __VA_ARGS__ }) /	\
> +			     sizeof(struct vc4_mock_pipe_desc),				\
> +	}
> +
> +static const struct vc4_mock_desc vc4_mock =
> +	VC4_MOCK_DESC(
> +		VC4_MOCK_CRTC_DESC(&vc4_txp_crtc_data,
> +				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
> +							DRM_MODE_ENCODER_VIRTUAL,
> +							DRM_MODE_CONNECTOR_WRITEBACK)),
> +		VC4_MOCK_PIXELVALVE_DESC(&bcm2835_pv0_data,
> +					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_DSI0,
> +							      DRM_MODE_ENCODER_DSI,
> +							      DRM_MODE_CONNECTOR_DSI),
> +					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_DPI,
> +							      DRM_MODE_ENCODER_DPI,
> +							      DRM_MODE_CONNECTOR_DPI)),
> +		VC4_MOCK_PIXELVALVE_DESC(&bcm2835_pv1_data,
> +					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_DSI1,
> +							      DRM_MODE_ENCODER_DSI,
> +							      DRM_MODE_CONNECTOR_DSI)),
> +		VC4_MOCK_PIXELVALVE_DESC(&bcm2835_pv2_data,
> +					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_HDMI0,
> +							      DRM_MODE_ENCODER_TMDS,
> +							      DRM_MODE_CONNECTOR_HDMIA),
> +					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_VEC,
> +							      DRM_MODE_ENCODER_TVDAC,
> +							      DRM_MODE_CONNECTOR_Composite)),
> +);
> +
> +static const struct vc4_mock_desc vc5_mock =
> +	VC4_MOCK_DESC(
> +		VC4_MOCK_CRTC_DESC(&vc4_txp_crtc_data,
> +				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
> +							DRM_MODE_ENCODER_VIRTUAL,
> +							DRM_MODE_CONNECTOR_WRITEBACK)),
> +		VC4_MOCK_PIXELVALVE_DESC(&bcm2711_pv0_data,
> +					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_DSI0,
> +							      DRM_MODE_ENCODER_DSI,
> +							      DRM_MODE_CONNECTOR_DSI),
> +					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_DPI,
> +							      DRM_MODE_ENCODER_DPI,
> +							      DRM_MODE_CONNECTOR_DPI)),
> +		VC4_MOCK_PIXELVALVE_DESC(&bcm2711_pv1_data,
> +					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_DSI1,
> +							      DRM_MODE_ENCODER_DSI,
> +							      DRM_MODE_CONNECTOR_DSI)),
> +		VC4_MOCK_PIXELVALVE_DESC(&bcm2711_pv2_data,
> +					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_HDMI0,
> +							      DRM_MODE_ENCODER_TMDS,
> +							      DRM_MODE_CONNECTOR_HDMIA)),
> +		VC4_MOCK_PIXELVALVE_DESC(&bcm2711_pv3_data,
> +					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_VEC,
> +							      DRM_MODE_ENCODER_TVDAC,
> +							      DRM_MODE_CONNECTOR_Composite)),
> +		VC4_MOCK_PIXELVALVE_DESC(&bcm2711_pv4_data,
> +					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_HDMI1,
> +							      DRM_MODE_ENCODER_TMDS,
> +							      DRM_MODE_CONNECTOR_HDMIA)),
> +);
> +
> +static int __build_one_pipe(struct kunit *test, struct drm_device *drm,
> +			    const struct vc4_mock_pipe_desc *pipe)
> +{
> +	struct vc4_dummy_plane *dummy_plane;
> +	struct drm_plane *plane;
> +	struct vc4_dummy_crtc *dummy_crtc;
> +	struct drm_crtc *crtc;
> +	unsigned int i;
> +
> +	dummy_plane = vc4_dummy_plane(test, drm, DRM_PLANE_TYPE_PRIMARY);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_plane);
> +
> +	plane = &dummy_plane->plane.base;
> +	dummy_crtc = vc4_mock_pv(test, drm, plane, pipe->data);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_crtc);
> +
> +	crtc = &dummy_crtc->crtc.base;
> +	for (i = 0; i < pipe->noutputs; i++) {
> +		const struct vc4_mock_output_desc *mock_output = &pipe->outputs[i];
> +		struct vc4_dummy_output *dummy_output;
> +
> +		dummy_output = vc4_dummy_output(test, drm, crtc,
> +						mock_output->vc4_encoder_type,
> +						mock_output->encoder_type,
> +						mock_output->connector_type);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_output);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __build_mock(struct kunit *test, struct drm_device *drm,
> +			const struct vc4_mock_desc *mock)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < mock->npipes; i++) {
> +		const struct vc4_mock_pipe_desc *pipe = &mock->pipes[i];
> +		int ret;
> +
> +		ret = __build_one_pipe(test, drm, pipe);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct vc4_dev *__mock_device(struct kunit *test, bool is_vc5)
> +{
> +	struct drm_device *drm;
> +	const struct drm_driver *drv = is_vc5 ? &vc5_drm_driver : &vc4_drm_driver;
> +	const struct vc4_mock_desc *desc = is_vc5 ? &vc5_mock : &vc4_mock;
> +	struct vc4_dev *vc4;
> +	struct device *dev;
> +	int ret;
> +
> +	dev = drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	vc4 = drm_kunit_helper_alloc_drm_device_with_driver(test, dev,
> +							    struct vc4_dev, base,
> +							    drv);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
> +
> +	vc4->dev = dev;
> +	vc4->is_vc5 = is_vc5;
> +
> +	vc4->hvs = __vc4_hvs_alloc(vc4, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4->hvs);
> +
> +	drm = &vc4->base;
> +	ret = __build_mock(test, drm, desc);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = vc4_kms_load(drm);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = drm_dev_register(drm, 0);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	return vc4;
> +}
> +
> +struct vc4_dev *vc4_mock_device(struct kunit *test)
> +{
> +	return __mock_device(test, false);
> +}
> +
> +struct vc4_dev *vc5_mock_device(struct kunit *test)
> +{
> +	return __mock_device(test, true);
> +}
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.h b/drivers/gpu/drm/vc4/tests/vc4_mock.h
> new file mode 100644
> index 000000000000..ace5b2e00f4a
> --- /dev/null
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef VC4_MOCK_H_
> +#define VC4_MOCK_H_
> +
> +#include "../vc4_drv.h"
> +
> +static inline
> +struct drm_crtc *vc4_find_crtc_for_encoder(struct kunit *test,
> +					   struct drm_device *drm,
> +					   struct drm_encoder *encoder)
> +{
> +	struct drm_crtc *crtc;
> +
> +	KUNIT_ASSERT_EQ(test, hweight32(encoder->possible_crtcs), 1);
> +
> +	drm_for_each_crtc(crtc, drm)
> +		if (encoder->possible_crtcs & drm_crtc_mask(crtc))
> +			return crtc;
> +
> +	return NULL;
> +}
> +
> +struct vc4_dummy_plane {
> +	struct vc4_plane plane;
> +};
> +
> +struct vc4_dummy_plane *vc4_dummy_plane(struct kunit *test,
> +					struct drm_device *drm,
> +					enum drm_plane_type type);
> +
> +struct vc4_dummy_crtc {
> +	struct vc4_crtc crtc;
> +};
> +
> +struct vc4_dummy_crtc *vc4_mock_pv(struct kunit *test,
> +				   struct drm_device *drm,
> +				   struct drm_plane *plane,
> +				   const struct vc4_crtc_data *data);
> +
> +struct vc4_dummy_output {
> +	struct vc4_encoder encoder;
> +	struct drm_connector connector;
> +};
> +
> +struct vc4_dummy_output *vc4_dummy_output(struct kunit *test,
> +					  struct drm_device *drm,
> +					  struct drm_crtc *crtc,
> +					  enum vc4_encoder_type vc4_encoder_type,
> +					  unsigned int kms_encoder_type,
> +					  unsigned int connector_type);
> +
> +struct vc4_dev *vc4_mock_device(struct kunit *test);
> +struct vc4_dev *vc5_mock_device(struct kunit *test);
> +
> +int vc4_mock_atomic_add_output(struct kunit *test, struct drm_device *drm,
> +			       enum vc4_encoder_type type,
> +			       struct drm_atomic_state *state);
> +
> +#endif // VC4_MOCK_H_
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c b/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
> new file mode 100644
> index 000000000000..5d12d7beef0e
> --- /dev/null
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +
> +#include <kunit/test.h>
> +
> +#include "vc4_mock.h"
> +
> +static const struct drm_crtc_helper_funcs vc4_dummy_crtc_helper_funcs = {
> +	.atomic_check	= vc4_crtc_atomic_check,
> +};
> +
> +static const struct drm_crtc_funcs vc4_dummy_crtc_funcs = {
> +	.atomic_destroy_state	= vc4_crtc_destroy_state,
> +	.atomic_duplicate_state	= vc4_crtc_duplicate_state,
> +	.reset			= vc4_crtc_reset,
> +};
> +
> +struct vc4_dummy_crtc *vc4_mock_pv(struct kunit *test,
> +				   struct drm_device *drm,
> +				   struct drm_plane *plane,
> +				   const struct vc4_crtc_data *data)
> +{
> +	struct vc4_dummy_crtc *dummy_crtc;
> +	struct vc4_crtc *vc4_crtc;
> +	int ret;
> +
> +	dummy_crtc = kunit_kzalloc(test, sizeof(*dummy_crtc), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, dummy_crtc);
> +
> +	vc4_crtc = &dummy_crtc->crtc;
> +	ret = __vc4_crtc_init(drm, NULL,
> +			      vc4_crtc, data, plane,
> +			      &vc4_dummy_crtc_funcs,
> +			      &vc4_dummy_crtc_helper_funcs,
> +			      false);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	return dummy_crtc;
> +}
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> new file mode 100644
> index 000000000000..cb16ab4451f7
> --- /dev/null
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +
> +#include <kunit/test.h>
> +
> +#include "vc4_mock.h"
> +
> +static const struct drm_connector_helper_funcs vc4_dummy_connector_helper_funcs = {
> +};
> +
> +static const struct drm_connector_funcs vc4_dummy_connector_funcs = {
> +	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> +	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
> +	.reset			= drm_atomic_helper_connector_reset,
> +};
> +
> +struct vc4_dummy_output *vc4_dummy_output(struct kunit *test,
> +					  struct drm_device *drm,
> +					  struct drm_crtc *crtc,
> +					  enum vc4_encoder_type vc4_encoder_type,
> +					  unsigned int kms_encoder_type,
> +					  unsigned int connector_type)
> +{
> +	struct vc4_dummy_output *dummy_output;
> +	struct drm_connector *conn;
> +	struct drm_encoder *enc;
> +	int ret;
> +
> +	dummy_output = kunit_kzalloc(test, sizeof(*dummy_output), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_output);
> +	dummy_output->encoder.type = vc4_encoder_type;
> +
> +	enc = &dummy_output->encoder.base;
> +	ret = drmm_encoder_init(drm, enc,
> +				NULL,
> +				kms_encoder_type,
> +				NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	enc->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	conn = &dummy_output->connector;
> +	ret = drmm_connector_init(drm, conn,
> +				  &vc4_dummy_connector_funcs,
> +				  connector_type,
> +				  NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drm_connector_helper_add(conn, &vc4_dummy_connector_helper_funcs);
> +	drm_connector_attach_encoder(conn, enc);
> +
> +	return dummy_output;
> +}
> +
> +static const struct drm_display_mode default_mode = {
> +	DRM_SIMPLE_MODE(640, 480, 64, 48)
> +};
> +
> +int vc4_mock_atomic_add_output(struct kunit *test, struct drm_device *drm,
> +			       enum vc4_encoder_type type,
> +			       struct drm_atomic_state *state)
> +{
> +	struct vc4_dummy_output *output;
> +	struct drm_connector *conn;
> +	struct drm_connector_state *conn_state;
> +	struct drm_encoder *encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *crtc_state;
> +	int ret;
> +
> +	encoder = vc4_find_encoder_by_type(drm, type);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder);
> +
> +	crtc = vc4_find_crtc_for_encoder(test, drm, encoder);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
> +
> +	output = container_of(encoder, struct vc4_dummy_output, encoder.base);
> +	conn = &output->connector;
> +	conn_state = drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +
> +	ret = drm_atomic_set_mode_for_crtc(crtc_state, &default_mode);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	crtc_state->active = true;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
> new file mode 100644
> index 000000000000..62b18f5f41db
> --- /dev/null
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_plane.h>
> +
> +#include <kunit/test.h>
> +
> +#include "vc4_mock.h"
> +
> +static const struct drm_plane_helper_funcs vc4_dummy_plane_helper_funcs = {
> +};
> +
> +static const struct drm_plane_funcs vc4_dummy_plane_funcs = {
> +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> +	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> +	.reset			= drm_atomic_helper_plane_reset,
> +};
> +
> +static const uint32_t vc4_dummy_plane_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +struct vc4_dummy_plane *vc4_dummy_plane(struct kunit *test,
> +					struct drm_device *drm,
> +					enum drm_plane_type type)
> +{
> +	struct vc4_dummy_plane *dummy_plane;
> +	struct drm_plane *plane;
> +
> +	dummy_plane = drmm_universal_plane_alloc(drm,
> +						 struct vc4_dummy_plane, plane.base,
> +						 0,
> +						 &vc4_dummy_plane_funcs,
> +						 vc4_dummy_plane_formats,
> +						 ARRAY_SIZE(vc4_dummy_plane_formats),
> +						 NULL,
> +						 DRM_PLANE_TYPE_PRIMARY,
> +						 NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_plane);
> +
> +	plane = &dummy_plane->plane.base;
> +	drm_plane_helper_add(plane, &vc4_dummy_plane_helper_funcs);
> +
> +	return dummy_plane;
> +}
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 195d2b61839d..7d1a696477ce 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -675,8 +675,8 @@ void vc4_crtc_get_margins(struct drm_crtc_state *state,
>   	}
>   }
>   
> -static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
> -				 struct drm_atomic_state *state)
> +int vc4_crtc_atomic_check(struct drm_crtc *crtc,
> +			  struct drm_atomic_state *state)
>   {
>   	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
>   									  crtc);
> @@ -1116,7 +1116,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
>   	.get_scanout_position = vc4_crtc_get_scanout_position,
>   };
>   
> -static const struct vc4_pv_data bcm2835_pv0_data = {
> +const struct vc4_pv_data bcm2835_pv0_data = {
>   	.base = {
>   		.name = "pixelvalve-0",
>   		.debugfs_name = "crtc0_regs",
> @@ -1131,7 +1131,7 @@ static const struct vc4_pv_data bcm2835_pv0_data = {
>   	},
>   };
>   
> -static const struct vc4_pv_data bcm2835_pv1_data = {
> +const struct vc4_pv_data bcm2835_pv1_data = {
>   	.base = {
>   		.name = "pixelvalve-1",
>   		.debugfs_name = "crtc1_regs",
> @@ -1146,7 +1146,7 @@ static const struct vc4_pv_data bcm2835_pv1_data = {
>   	},
>   };
>   
> -static const struct vc4_pv_data bcm2835_pv2_data = {
> +const struct vc4_pv_data bcm2835_pv2_data = {
>   	.base = {
>   		.name = "pixelvalve-2",
>   		.debugfs_name = "crtc2_regs",
> @@ -1161,7 +1161,7 @@ static const struct vc4_pv_data bcm2835_pv2_data = {
>   	},
>   };
>   
> -static const struct vc4_pv_data bcm2711_pv0_data = {
> +const struct vc4_pv_data bcm2711_pv0_data = {
>   	.base = {
>   		.name = "pixelvalve-0",
>   		.debugfs_name = "crtc0_regs",
> @@ -1176,7 +1176,7 @@ static const struct vc4_pv_data bcm2711_pv0_data = {
>   	},
>   };
>   
> -static const struct vc4_pv_data bcm2711_pv1_data = {
> +const struct vc4_pv_data bcm2711_pv1_data = {
>   	.base = {
>   		.name = "pixelvalve-1",
>   		.debugfs_name = "crtc1_regs",
> @@ -1191,7 +1191,7 @@ static const struct vc4_pv_data bcm2711_pv1_data = {
>   	},
>   };
>   
> -static const struct vc4_pv_data bcm2711_pv2_data = {
> +const struct vc4_pv_data bcm2711_pv2_data = {
>   	.base = {
>   		.name = "pixelvalve-2",
>   		.debugfs_name = "crtc2_regs",
> @@ -1205,7 +1205,7 @@ static const struct vc4_pv_data bcm2711_pv2_data = {
>   	},
>   };
>   
> -static const struct vc4_pv_data bcm2711_pv3_data = {
> +const struct vc4_pv_data bcm2711_pv3_data = {
>   	.base = {
>   		.name = "pixelvalve-3",
>   		.debugfs_name = "crtc3_regs",
> @@ -1219,7 +1219,7 @@ static const struct vc4_pv_data bcm2711_pv3_data = {
>   	},
>   };
>   
> -static const struct vc4_pv_data bcm2711_pv4_data = {
> +const struct vc4_pv_data bcm2711_pv4_data = {
>   	.base = {
>   		.name = "pixelvalve-4",
>   		.debugfs_name = "crtc4_regs",
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 5990d8f8c363..3b0ae2c3e33c 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -196,7 +196,7 @@ static const struct drm_ioctl_desc vc4_drm_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(VC4_PERFMON_GET_VALUES, vc4_perfmon_get_values_ioctl, DRM_RENDER_ALLOW),
>   };
>   
> -static const struct drm_driver vc4_drm_driver = {
> +const struct drm_driver vc4_drm_driver = {
>   	.driver_features = (DRIVER_MODESET |
>   			    DRIVER_ATOMIC |
>   			    DRIVER_GEM |
> @@ -225,7 +225,7 @@ static const struct drm_driver vc4_drm_driver = {
>   	.patchlevel = DRIVER_PATCHLEVEL,
>   };
>   
> -static const struct drm_driver vc5_drm_driver = {
> +const struct drm_driver vc5_drm_driver = {
>   	.driver_features = (DRIVER_MODESET |
>   			    DRIVER_ATOMIC |
>   			    DRIVER_GEM),
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index e0be7a81a24a..418f4f308e36 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -24,6 +24,9 @@
>   struct drm_device;
>   struct drm_gem_object;
>   
> +extern const struct drm_driver vc4_drm_driver;
> +extern const struct drm_driver vc5_drm_driver;
> +
>   /* Don't forget to update vc4_bo.c: bo_type_names[] when adding to
>    * this.
>    */
> @@ -523,6 +526,8 @@ struct vc4_crtc_data {
>   	int hvs_output;
>   };
>   
> +extern const struct vc4_crtc_data vc4_txp_crtc_data;
> +
>   struct vc4_pv_data {
>   	struct vc4_crtc_data	base;
>   
> @@ -535,6 +540,15 @@ struct vc4_pv_data {
>   	enum vc4_encoder_type encoder_types[4];
>   };
>   
> +extern const struct vc4_pv_data bcm2835_pv0_data;
> +extern const struct vc4_pv_data bcm2835_pv1_data;
> +extern const struct vc4_pv_data bcm2835_pv2_data;
> +extern const struct vc4_pv_data bcm2711_pv0_data;
> +extern const struct vc4_pv_data bcm2711_pv1_data;
> +extern const struct vc4_pv_data bcm2711_pv2_data;
> +extern const struct vc4_pv_data bcm2711_pv3_data;
> +extern const struct vc4_pv_data bcm2711_pv4_data;
> +
>   struct vc4_crtc {
>   	struct drm_crtc base;
>   	struct platform_device *pdev;
> @@ -920,6 +934,8 @@ int vc4_page_flip(struct drm_crtc *crtc,
>   		  struct drm_pending_vblank_event *event,
>   		  uint32_t flags,
>   		  struct drm_modeset_acquire_ctx *ctx);
> +int vc4_crtc_atomic_check(struct drm_crtc *crtc,
> +			  struct drm_atomic_state *state);
>   struct drm_crtc_state *vc4_crtc_duplicate_state(struct drm_crtc *crtc);
>   void vc4_crtc_destroy_state(struct drm_crtc *crtc,
>   			    struct drm_crtc_state *state);
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 4f7ce5d3e8ad..2b69454b8534 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -479,7 +479,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
>   	return IRQ_HANDLED;
>   }
>   
> -static const struct vc4_crtc_data vc4_txp_crtc_data = {
> +const struct vc4_crtc_data vc4_txp_crtc_data = {
>   	.name = "txp",
>   	.debugfs_name = "txp_regs",
>   	.hvs_available_channels = BIT(2),
> 
