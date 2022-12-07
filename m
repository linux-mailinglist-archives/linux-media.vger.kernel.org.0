Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C4C645C72
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 15:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiLGOZq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 09:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiLGOZj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 09:25:39 -0500
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725931E3EE;
        Wed,  7 Dec 2022 06:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=f4+lI+Jb8mEDUM9sMfsSlnpKgZIXVSHgOsdNrxeDvII=; b=Fqqsn8eHXWgY17QRXzob3taMSR
        63Jd0q/66RPhg0iYNJ3lialMIO5M21/P5Kjj6SoiWb9GsThM2KcIthyzxwdBbK2l6AVvVaBPlA8H6
        OLjowOTwAuAy5FoLKz6rqF9wKbpNndwxIHdyYY10oBCdR4u9WMGtRiqNk0w8H+u9lasLH/O8JQVG8
        PAJZxDPyBIKp0QH3ZJlzq5MlA1UjxCIgP9rMU23NbKfJ39m8TNio4lDVDEc6OOb4xaKm9xWpgxqBM
        tk7ISOico4YRJVjcvqCCBA9e4UMLIh2z8DSv10LRglLd2wzxJ3ZyH7Ovqp8zsMvGkbW8g0eRCU2C5
        HWQxn7WQ==;
Received: from [143.107.182.242] (helo=[10.41.75.14])
        by fanzine2.igalia.com with esmtpsa 
        (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
        id 1p2vLh-00GcJC-Sn; Wed, 07 Dec 2022 15:24:38 +0100
Message-ID: <c48dca3b-87a6-8813-2410-49951c7313f9@igalia.com>
Date:   Wed, 7 Dec 2022 11:24:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 19/20] drm/vc4: tests: Add unit test suite for the PV
 muxing
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
 <20221123-rpi-kunit-tests-v3-19-4615a663a84a@cerno.tech>
From:   =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221123-rpi-kunit-tests-v3-19-4615a663a84a@cerno.tech>
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
> The HVS to PixelValve muxing code is fairly error prone and has a bunch
> of arbitrary constraints due to the hardware setup.
> 
> Let's create a test suite that makes sure that the possible combinations
> work and the invalid ones don't.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/vc4/Makefile                   |    3 +-
>   drivers/gpu/drm/vc4/tests/vc4_mock.h           |    9 +-
>   drivers/gpu/drm/vc4/tests/vc4_mock_output.c    |   49 +-
>   drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 1039 ++++++++++++++++++++++++
>   4 files changed, 1091 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/Makefile b/drivers/gpu/drm/vc4/Makefile
> index f974a8c80e2f..c41f89a15a55 100644
> --- a/drivers/gpu/drm/vc4/Makefile
> +++ b/drivers/gpu/drm/vc4/Makefile
> @@ -29,7 +29,8 @@ vc4-$(CONFIG_DRM_VC4_KUNIT_TEST) += \
>   	tests/vc4_mock.o \
>   	tests/vc4_mock_crtc.o \
>   	tests/vc4_mock_output.o \
> -	tests/vc4_mock_plane.o
> +	tests/vc4_mock_plane.o \
> +	tests/vc4_test_pv_muxing.o
>   
>   vc4-$(CONFIG_DEBUG_FS) += vc4_debugfs.o
>   
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.h b/drivers/gpu/drm/vc4/tests/vc4_mock.h
> index ace5b2e00f4a..db8e9a141ef8 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_mock.h
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock.h
> @@ -53,8 +53,11 @@ struct vc4_dummy_output *vc4_dummy_output(struct kunit *test,
>   struct vc4_dev *vc4_mock_device(struct kunit *test);
>   struct vc4_dev *vc5_mock_device(struct kunit *test);
>   
> -int vc4_mock_atomic_add_output(struct kunit *test, struct drm_device *drm,
> -			       enum vc4_encoder_type type,
> -			       struct drm_atomic_state *state);
> +int vc4_mock_atomic_add_output(struct kunit *test,
> +			       struct drm_atomic_state *state,
> +			       enum vc4_encoder_type type);
> +int vc4_mock_atomic_del_output(struct kunit *test,
> +			       struct drm_atomic_state *state,
> +			       enum vc4_encoder_type type);
>   
>   #endif // VC4_MOCK_H_
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> index cb16ab4451f7..8d33be828d9a 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> @@ -61,16 +61,17 @@ static const struct drm_display_mode default_mode = {
>   	DRM_SIMPLE_MODE(640, 480, 64, 48)
>   };
>   
> -int vc4_mock_atomic_add_output(struct kunit *test, struct drm_device *drm,
> -			       enum vc4_encoder_type type,
> -			       struct drm_atomic_state *state)
> +int vc4_mock_atomic_add_output(struct kunit *test,
> +			       struct drm_atomic_state *state,
> +			       enum vc4_encoder_type type)
>   {
> +	struct drm_device *drm = state->dev;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
>   	struct vc4_dummy_output *output;
>   	struct drm_connector *conn;
> -	struct drm_connector_state *conn_state;
>   	struct drm_encoder *encoder;
>   	struct drm_crtc *crtc;
> -	struct drm_crtc_state *crtc_state;
>   	int ret;
>   
>   	encoder = vc4_find_encoder_by_type(drm, type);
> @@ -97,3 +98,41 @@ int vc4_mock_atomic_add_output(struct kunit *test, struct drm_device *drm,
>   
>   	return 0;
>   }
> +
> +int vc4_mock_atomic_del_output(struct kunit *test,
> +			       struct drm_atomic_state *state,
> +			       enum vc4_encoder_type type)
> +{
> +	struct drm_device *drm = state->dev;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct vc4_dummy_output *output;
> +	struct drm_connector *conn;
> +	struct drm_encoder *encoder;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	encoder = vc4_find_encoder_by_type(drm, type);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder);
> +
> +	crtc = vc4_find_crtc_for_encoder(test, drm, encoder);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
> +
> +	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +
> +	crtc_state->active = false;
> +
> +	ret = drm_atomic_set_mode_for_crtc(crtc_state, NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	output = container_of(encoder, struct vc4_dummy_output, encoder.base);
> +	conn = &output->connector;
> +	conn_state = drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +	ret = drm_atomic_set_crtc_for_connector(conn_state, NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> new file mode 100644
> index 000000000000..ae0bd0f81698
> --- /dev/null
> +++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> @@ -0,0 +1,1039 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_kunit_helpers.h>
> +#include <drm/drm_mode.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_plane.h>
> +
> +#include <kunit/test.h>
> +
> +#include "../vc4_drv.h"
> +
> +#include "vc4_mock.h"
> +
> +struct pv_muxing_priv {
> +	struct vc4_dev *vc4;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_state *state;
> +};
> +
> +static bool check_fifo_conflict(struct kunit *test,
> +				const struct drm_atomic_state *state)
> +{
> +	struct vc4_hvs_state *hvs_state;
> +	unsigned int used_fifos = 0;
> +	unsigned int i;
> +
> +	hvs_state = vc4_hvs_get_new_global_state(state);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hvs_state);
> +
> +	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
> +		if (!hvs_state->fifo_state[i].in_use)
> +			continue;
> +
> +		KUNIT_EXPECT_FALSE(test, used_fifos & BIT(i));
> +		used_fifos |= BIT(i);
> +	}
> +
> +	return true;
> +}
> +
> +struct encoder_constraint {
> +	enum vc4_encoder_type type;
> +	unsigned int *channels;
> +	size_t nchannels;
> +};
> +
> +#define ENCODER_CONSTRAINT(_type, ...)					\
> +	{								\
> +		.type = _type,						\
> +		.channels = (unsigned int[]) { __VA_ARGS__ },		\
> +		.nchannels = sizeof((unsigned int[]) { __VA_ARGS__ }) /	\
> +			     sizeof(unsigned int),			\
> +	}
> +
> +static bool __check_encoder_constraints(const struct encoder_constraint *constraints,
> +					size_t nconstraints,
> +					enum vc4_encoder_type type,
> +					unsigned int channel)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nconstraints; i++) {
> +		const struct encoder_constraint *constraint = &constraints[i];
> +		unsigned int j;
> +
> +		if (constraint->type != type)
> +			continue;
> +
> +		for (j = 0; j < constraint->nchannels; j++) {
> +			unsigned int _channel = constraint->channels[j];
> +
> +			if (channel != _channel)
> +				continue;
> +
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static const struct encoder_constraint vc4_encoder_constraints[] = {
> +	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DPI, 0),
> +	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI0, 0),
> +	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_HDMI0, 1),
> +	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_VEC, 1),
> +	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_TXP, 2),
> +	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI1, 2),
> +};
> +
> +static const struct encoder_constraint vc5_encoder_constraints[] = {
> +	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DPI, 0),
> +	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI0, 0),
> +	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_VEC, 1),
> +	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_TXP, 0, 2),
> +	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI1, 0, 1, 2),
> +	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_HDMI0, 0, 1, 2),
> +	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_HDMI1, 0, 1, 2),
> +};
> +
> +static bool check_vc4_encoder_constraints(enum vc4_encoder_type type, unsigned int channel)
> +{
> +	return __check_encoder_constraints(vc4_encoder_constraints,
> +					   ARRAY_SIZE(vc4_encoder_constraints),
> +					   type, channel);
> +}
> +
> +static bool check_vc5_encoder_constraints(enum vc4_encoder_type type, unsigned int channel)
> +{
> +	return __check_encoder_constraints(vc5_encoder_constraints,
> +					   ARRAY_SIZE(vc5_encoder_constraints),
> +					   type, channel);
> +}
> +
> +static struct vc4_crtc_state *
> +get_vc4_crtc_state_for_encoder(struct kunit *test,
> +			       const struct drm_atomic_state *state,
> +			       enum vc4_encoder_type type)
> +{
> +	struct drm_device *drm = state->dev;
> +	struct drm_crtc_state *new_crtc_state;
> +	struct drm_encoder *encoder;
> +	struct drm_crtc *crtc;
> +
> +	encoder = vc4_find_encoder_by_type(drm, type);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder);
> +
> +	crtc = vc4_find_crtc_for_encoder(test, drm, encoder);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	if (!new_crtc_state)
> +		return NULL;
> +
> +	return to_vc4_crtc_state(new_crtc_state);
> +}
> +
> +static bool check_channel_for_encoder(struct kunit *test,
> +				      const struct drm_atomic_state *state,
> +				      enum vc4_encoder_type type,
> +				      bool (*check_fn)(enum vc4_encoder_type type, unsigned int channel))
> +{
> +	struct vc4_crtc_state *new_vc4_crtc_state;
> +	struct vc4_hvs_state *new_hvs_state;
> +	unsigned int channel;
> +
> +	new_hvs_state = vc4_hvs_get_new_global_state(state);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
> +
> +	new_vc4_crtc_state = get_vc4_crtc_state_for_encoder(test, state, type);
> +	KUNIT_ASSERT_NOT_NULL(test, new_vc4_crtc_state);
> +
> +	channel = new_vc4_crtc_state->assigned_channel;
> +	KUNIT_EXPECT_NE(test, channel, VC4_HVS_CHANNEL_DISABLED);
> +
> +	KUNIT_EXPECT_TRUE(test, new_hvs_state->fifo_state[channel].in_use);
> +
> +	KUNIT_EXPECT_TRUE(test, check_fn(type, channel));
> +
> +	return true;
> +}
> +
> +struct pv_muxing_param {
> +	const char *name;
> +	struct vc4_dev *(*mock_fn)(struct kunit *test);
> +	bool (*check_fn)(enum vc4_encoder_type type, unsigned int channel);
> +	enum vc4_encoder_type *encoders;
> +	size_t nencoders;
> +};
> +
> +static void vc4_test_pv_muxing_desc(const struct pv_muxing_param *t, char *desc)
> +{
> +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +#define PV_MUXING_TEST(_name, _mock_fn, _check_fn, ...)					\
> +	{										\
> +		.name = _name,								\
> +		.mock_fn = &_mock_fn,							\
> +		.check_fn = &_check_fn,							\
> +		.encoders = (enum vc4_encoder_type[]) { __VA_ARGS__ },			\
> +		.nencoders = sizeof((enum vc4_encoder_type[]) { __VA_ARGS__ }) /	\
> +			     sizeof(enum vc4_encoder_type),				\
> +	}
> +
> +#define VC4_PV_MUXING_TEST(_name, ...)		\
> +	PV_MUXING_TEST(_name, vc4_mock_device, check_vc4_encoder_constraints, __VA_ARGS__)
> +
> +#define VC5_PV_MUXING_TEST(_name, ...)		\
> +	PV_MUXING_TEST(_name, vc5_mock_device, check_vc5_encoder_constraints, __VA_ARGS__)
> +
> +static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
> +	VC4_PV_MUXING_TEST("1 output: DSI0",
> +			   VC4_ENCODER_TYPE_DSI0),
> +	VC4_PV_MUXING_TEST("1 output: DPI",
> +			   VC4_ENCODER_TYPE_DPI),
> +	VC4_PV_MUXING_TEST("1 output: HDMI0",
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC4_PV_MUXING_TEST("1 output: VEC",
> +			   VC4_ENCODER_TYPE_VEC),
> +	VC4_PV_MUXING_TEST("1 output: DSI1",
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC4_PV_MUXING_TEST("1 output: TXP",
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC4_PV_MUXING_TEST("2 outputs: DSI0, HDMI0",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC4_PV_MUXING_TEST("2 outputs: DSI0, VEC",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC),
> +	VC4_PV_MUXING_TEST("2 outputs: DSI0, DSI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC4_PV_MUXING_TEST("2 outputs: DSI0, TXP",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC4_PV_MUXING_TEST("2 outputs: DPI, HDMI0",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC4_PV_MUXING_TEST("2 outputs: DPI, VEC",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC),
> +	VC4_PV_MUXING_TEST("2 outputs: DPI, DSI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC4_PV_MUXING_TEST("2 outputs: DPI, TXP",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC4_PV_MUXING_TEST("2 outputs: HDMI0, DSI1",
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC4_PV_MUXING_TEST("2 outputs: HDMI0, TXP",
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC4_PV_MUXING_TEST("2 outputs: VEC, DSI1",
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC4_PV_MUXING_TEST("2 outputs: VEC, TXP",
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC4_PV_MUXING_TEST("3 outputs: DSI0, HDMI0, DSI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC4_PV_MUXING_TEST("3 outputs: DSI0, HDMI0, TXP",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC4_PV_MUXING_TEST("3 outputs: DSI0, VEC, DSI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC4_PV_MUXING_TEST("3 outputs: DSI0, VEC, TXP",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC4_PV_MUXING_TEST("3 outputs: DPI, HDMI0, DSI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC4_PV_MUXING_TEST("3 outputs: DPI, HDMI0, TXP",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC4_PV_MUXING_TEST("3 outputs: DPI, VEC, DSI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC4_PV_MUXING_TEST("3 outputs: DPI, VEC, TXP",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP),
> +};
> +
> +KUNIT_ARRAY_PARAM(vc4_test_pv_muxing,
> +		  vc4_test_pv_muxing_params,
> +		  vc4_test_pv_muxing_desc);
> +
> +static const struct pv_muxing_param vc4_test_pv_muxing_invalid_params[] = {
> +	VC4_PV_MUXING_TEST("DPI/DSI0 Conflict",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_DSI0),
> +	VC4_PV_MUXING_TEST("TXP/DSI1 Conflict",
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC4_PV_MUXING_TEST("HDMI0/VEC Conflict",
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_VEC),
> +	VC4_PV_MUXING_TEST("More than 3 outputs: DSI0, HDMI0, DSI1, TXP",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC4_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, DSI1, TXP",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC4_PV_MUXING_TEST("More than 3 outputs: DPI, HDMI0, DSI1, TXP",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC4_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, DSI1, TXP",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_TXP),
> +};
> +
> +KUNIT_ARRAY_PARAM(vc4_test_pv_muxing_invalid,
> +		  vc4_test_pv_muxing_invalid_params,
> +		  vc4_test_pv_muxing_desc);
> +
> +static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
> +	VC5_PV_MUXING_TEST("1 output: DPI",
> +			   VC4_ENCODER_TYPE_DPI),
> +	VC5_PV_MUXING_TEST("1 output: DSI0",
> +			   VC4_ENCODER_TYPE_DSI0),
> +	VC5_PV_MUXING_TEST("1 output: DSI1",
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC5_PV_MUXING_TEST("1 output: HDMI0",
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("1 output: HDMI1",
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("1 output: VEC",
> +			   VC4_ENCODER_TYPE_VEC),
> +	VC5_PV_MUXING_TEST("2 outputs: DPI, DSI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC5_PV_MUXING_TEST("2 outputs: DPI, HDMI0",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("2 outputs: DPI, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("2 outputs: DPI, TXP",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC5_PV_MUXING_TEST("2 outputs: DPI, VEC",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC),
> +	VC5_PV_MUXING_TEST("2 outputs: DPI, DSI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC5_PV_MUXING_TEST("2 outputs: DSI0, DSI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC5_PV_MUXING_TEST("2 outputs: DSI0, HDMI0",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("2 outputs: DSI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("2 outputs: DSI0, TXP",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC5_PV_MUXING_TEST("2 outputs: DSI0, VEC",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC),
> +	VC5_PV_MUXING_TEST("2 outputs: DSI0, DSI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC5_PV_MUXING_TEST("2 outputs: DSI1, VEC",
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_VEC),
> +	VC5_PV_MUXING_TEST("2 outputs: DSI1, TXP",
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC5_PV_MUXING_TEST("2 outputs: DSI1, HDMI0",
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("2 outputs: DSI1, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("2 outputs: HDMI0, VEC",
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_VEC),
> +	VC5_PV_MUXING_TEST("2 outputs: HDMI0, TXP",
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC5_PV_MUXING_TEST("2 outputs: HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("2 outputs: HDMI1, VEC",
> +			   VC4_ENCODER_TYPE_HDMI1,
> +			   VC4_ENCODER_TYPE_VEC),
> +	VC5_PV_MUXING_TEST("2 outputs: HDMI1, TXP",
> +			   VC4_ENCODER_TYPE_HDMI1,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC5_PV_MUXING_TEST("2 outputs: TXP, VEC",
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_VEC),
> +	VC5_PV_MUXING_TEST("3 outputs: DPI, VEC, TXP",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC5_PV_MUXING_TEST("3 outputs: DPI, VEC, DSI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC5_PV_MUXING_TEST("3 outputs: DPI, VEC, HDMI0",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("3 outputs: DPI, VEC, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("3 outputs: DPI, TXP, DSI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC5_PV_MUXING_TEST("3 outputs: DPI, TXP, HDMI0",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("3 outputs: DPI, TXP, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("3 outputs: DPI, DSI1, HDMI0",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("3 outputs: DPI, DSI1, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("3 outputs: DPI, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("3 outputs: DSI0, VEC, TXP",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP),
> +	VC5_PV_MUXING_TEST("3 outputs: DSI0, VEC, DSI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC5_PV_MUXING_TEST("3 outputs: DSI0, VEC, HDMI0",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("3 outputs: DSI0, VEC, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("3 outputs: DSI0, TXP, DSI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC5_PV_MUXING_TEST("3 outputs: DSI0, TXP, HDMI0",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("3 outputs: DSI0, TXP, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("3 outputs: DSI0, DSI1, HDMI0",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("3 outputs: DSI0, DSI1, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("3 outputs: DSI0, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +};
> +
> +KUNIT_ARRAY_PARAM(vc5_test_pv_muxing,
> +		  vc5_test_pv_muxing_params,
> +		  vc4_test_pv_muxing_desc);
> +
> +static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
> +	VC5_PV_MUXING_TEST("DPI/DSI0 Conflict",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_DSI0),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, DSI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, HDMI0",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, DSI1, HDMI0",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, DSI1, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, TXP, DSI1, HDMI0",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, TXP, DSI1, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, TXP, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, DSI1, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, DSI1, HDMI0",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, DSI1, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, DSI1, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, TXP, DSI1, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, DSI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, HDMI0",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, DSI1, HDMI0",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, DSI1, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, TXP, DSI1, HDMI0",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, TXP, DSI1, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, TXP, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, DSI1, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, DSI1, HDMI0",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, DSI1, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, DSI1, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, TXP, DSI1, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: VEC, TXP, DSI1, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, DSI1, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DPI,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, DSI1, HDMI0, HDMI1",
> +			   VC4_ENCODER_TYPE_DSI0,
> +			   VC4_ENCODER_TYPE_VEC,
> +			   VC4_ENCODER_TYPE_TXP,
> +			   VC4_ENCODER_TYPE_DSI1,
> +			   VC4_ENCODER_TYPE_HDMI0,
> +			   VC4_ENCODER_TYPE_HDMI1),
> +};
> +
> +KUNIT_ARRAY_PARAM(vc5_test_pv_muxing_invalid,
> +		  vc5_test_pv_muxing_invalid_params,
> +		  vc4_test_pv_muxing_desc);
> +
> +static void drm_vc4_test_pv_muxing(struct kunit *test)
> +{
> +	const struct pv_muxing_param *params = test->param_value;
> +	const struct pv_muxing_priv *priv = test->priv;
> +	struct drm_atomic_state *state = priv->state;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < params->nencoders; i++) {
> +		enum vc4_encoder_type enc_type = params->encoders[i];
> +
> +		ret = vc4_mock_atomic_add_output(test, state, enc_type);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +	}
> +
> +	ret = drm_atomic_check_only(state);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	KUNIT_EXPECT_TRUE(test,
> +			  check_fifo_conflict(test, state));
> +
> +	for (i = 0; i < params->nencoders; i++) {
> +		enum vc4_encoder_type enc_type = params->encoders[i];
> +
> +		KUNIT_EXPECT_TRUE(test, check_channel_for_encoder(test, state, enc_type,
> +								  params->check_fn));
> +	}
> +}
> +
> +static void drm_vc4_test_pv_muxing_invalid(struct kunit *test)
> +{
> +	const struct pv_muxing_param *params = test->param_value;
> +	const struct pv_muxing_priv *priv = test->priv;
> +	struct drm_atomic_state *state = priv->state;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < params->nencoders; i++) {
> +		enum vc4_encoder_type enc_type = params->encoders[i];
> +
> +		ret = vc4_mock_atomic_add_output(test, state, enc_type);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +	}
> +
> +	ret = drm_atomic_check_only(state);
> +	KUNIT_EXPECT_LT(test, ret, 0);
> +}
> +
> +static int vc4_pv_muxing_test_init(struct kunit *test)
> +{
> +	const struct pv_muxing_param *params = test->param_value;
> +	struct drm_atomic_state *state;
> +	struct pv_muxing_priv *priv;
> +	struct drm_device *drm;
> +	struct vc4_dev *vc4;
> +
> +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +	test->priv = priv;
> +
> +	vc4 = params->mock_fn(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
> +	priv->vc4 = vc4;
> +
> +	drm_modeset_acquire_init(&priv->ctx, 0);
> +
> +	drm = &vc4->base;
> +	state = drm_atomic_state_alloc(drm);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	state->acquire_ctx = &priv->ctx;
> +
> +	priv->state = state;
> +
> +	return 0;
> +}
> +
> +static void vc4_pv_muxing_test_exit(struct kunit *test)
> +{
> +	struct pv_muxing_priv *priv = test->priv;
> +	struct vc4_dev *vc4 = priv->vc4;
> +	struct drm_device *drm = &vc4->base;
> +	struct drm_atomic_state *state = priv->state;
> +
> +	drm_atomic_state_put(state);
> +	drm_modeset_drop_locks(&priv->ctx);
> +	drm_modeset_acquire_fini(&priv->ctx);
> +	drm_dev_unregister(drm);
> +	drm_kunit_helper_free_device(test, vc4->dev);
> +}
> +
> +static struct kunit_case vc4_pv_muxing_tests[] = {
> +	KUNIT_CASE_PARAM(drm_vc4_test_pv_muxing,
> +			 vc4_test_pv_muxing_gen_params),
> +	KUNIT_CASE_PARAM(drm_vc4_test_pv_muxing_invalid,
> +			 vc4_test_pv_muxing_invalid_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite vc4_pv_muxing_test_suite = {
> +	.name = "vc4-pv-muxing-combinations",
> +	.init = vc4_pv_muxing_test_init,
> +	.exit = vc4_pv_muxing_test_exit,
> +	.test_cases = vc4_pv_muxing_tests,
> +};
> +
> +static struct kunit_case vc5_pv_muxing_tests[] = {
> +	KUNIT_CASE_PARAM(drm_vc4_test_pv_muxing,
> +			 vc5_test_pv_muxing_gen_params),
> +	KUNIT_CASE_PARAM(drm_vc4_test_pv_muxing_invalid,
> +			 vc5_test_pv_muxing_invalid_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite vc5_pv_muxing_test_suite = {
> +	.name = "vc5-pv-muxing-combinations",
> +	.init = vc4_pv_muxing_test_init,
> +	.exit = vc4_pv_muxing_test_exit,
> +	.test_cases = vc5_pv_muxing_tests,
> +};
> +
> +/* See
> + * https://lore.kernel.org/all/3e113525-aa89-b1e2-56b7-ca55bd41d057@samsung.com/
> + * and
> + * https://lore.kernel.org/dri-devel/20200917121623.42023-1-maxime@cerno.tech/
> + */
> +static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *test)
> +{
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_state *state;
> +	struct vc4_crtc_state *new_vc4_crtc_state;
> +	struct vc4_hvs_state *new_hvs_state;
> +	unsigned int hdmi0_channel;
> +	unsigned int hdmi1_channel;
> +	struct drm_device *drm;
> +	struct vc4_dev *vc4;
> +	int ret;
> +
> +	vc4 = vc5_mock_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	drm = &vc4->base;
> +	state = drm_atomic_state_alloc(drm);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	state->acquire_ctx = &ctx;
> +
> +	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	new_hvs_state = vc4_hvs_get_new_global_state(state);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
> +
> +	new_vc4_crtc_state = get_vc4_crtc_state_for_encoder(test, state,
> +							    VC4_ENCODER_TYPE_HDMI0);
> +	KUNIT_ASSERT_NOT_NULL(test, new_vc4_crtc_state);
> +
> +	hdmi0_channel = new_vc4_crtc_state->assigned_channel;
> +	KUNIT_ASSERT_NE(test, hdmi0_channel, VC4_HVS_CHANNEL_DISABLED);
> +	KUNIT_ASSERT_TRUE(test, new_hvs_state->fifo_state[hdmi0_channel].in_use);
> +
> +	ret = drm_atomic_helper_swap_state(state, false);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drm_atomic_state_put(state);
> +
> +	state = drm_atomic_state_alloc(drm);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	state->acquire_ctx = &ctx;
> +
> +	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	new_hvs_state = vc4_hvs_get_new_global_state(state);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
> +
> +	new_vc4_crtc_state = get_vc4_crtc_state_for_encoder(test, state,
> +							    VC4_ENCODER_TYPE_HDMI1);
> +	KUNIT_ASSERT_NOT_NULL(test, new_vc4_crtc_state);
> +
> +	hdmi1_channel = new_vc4_crtc_state->assigned_channel;
> +	KUNIT_ASSERT_NE(test, hdmi1_channel, VC4_HVS_CHANNEL_DISABLED);
> +	KUNIT_ASSERT_TRUE(test, new_hvs_state->fifo_state[hdmi1_channel].in_use);
> +
> +	KUNIT_EXPECT_NE(test, hdmi0_channel, hdmi1_channel);
> +
> +	drm_atomic_state_put(state);
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +	drm_dev_unregister(drm);
> +	drm_kunit_helper_free_device(test, vc4->dev);
> +}
> +
> +static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
> +{
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_state *state;
> +	struct vc4_crtc_state *new_vc4_crtc_state;
> +	struct vc4_hvs_state *new_hvs_state;
> +	unsigned int old_hdmi0_channel;
> +	unsigned int old_hdmi1_channel;
> +	struct drm_device *drm;
> +	struct vc4_dev *vc4;
> +	int ret;
> +
> +	vc4 = vc5_mock_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	drm = &vc4->base;
> +	state = drm_atomic_state_alloc(drm);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	state->acquire_ctx = &ctx;
> +
> +	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	new_hvs_state = vc4_hvs_get_new_global_state(state);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
> +
> +	new_vc4_crtc_state = get_vc4_crtc_state_for_encoder(test, state,
> +							    VC4_ENCODER_TYPE_HDMI0);
> +	KUNIT_ASSERT_NOT_NULL(test, new_vc4_crtc_state);
> +
> +	old_hdmi0_channel = new_vc4_crtc_state->assigned_channel;
> +	KUNIT_ASSERT_NE(test, old_hdmi0_channel, VC4_HVS_CHANNEL_DISABLED);
> +	KUNIT_ASSERT_TRUE(test, new_hvs_state->fifo_state[old_hdmi0_channel].in_use);
> +
> +	new_vc4_crtc_state = get_vc4_crtc_state_for_encoder(test, state,
> +							    VC4_ENCODER_TYPE_HDMI1);
> +	KUNIT_ASSERT_NOT_NULL(test, new_vc4_crtc_state);
> +
> +	old_hdmi1_channel = new_vc4_crtc_state->assigned_channel;
> +	KUNIT_ASSERT_NE(test, old_hdmi1_channel, VC4_HVS_CHANNEL_DISABLED);
> +	KUNIT_ASSERT_TRUE(test, new_hvs_state->fifo_state[old_hdmi1_channel].in_use);
> +
> +	ret = drm_atomic_helper_swap_state(state, false);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drm_atomic_state_put(state);
> +
> +	state = drm_atomic_state_alloc(drm);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	state->acquire_ctx = &ctx;
> +
> +	ret = vc4_mock_atomic_del_output(test, state, VC4_ENCODER_TYPE_HDMI0);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	new_hvs_state = vc4_hvs_get_new_global_state(state);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
> +
> +	new_vc4_crtc_state = get_vc4_crtc_state_for_encoder(test, state,
> +							    VC4_ENCODER_TYPE_HDMI1);
> +
> +	if (new_vc4_crtc_state) {
> +		unsigned int hdmi1_channel;
> +
> +		hdmi1_channel = new_vc4_crtc_state->assigned_channel;
> +		KUNIT_ASSERT_NE(test, hdmi1_channel, VC4_HVS_CHANNEL_DISABLED);
> +		KUNIT_ASSERT_TRUE(test, new_hvs_state->fifo_state[hdmi1_channel].in_use);
> +
> +		KUNIT_EXPECT_EQ(test, old_hdmi1_channel, hdmi1_channel);
> +	}
> +
> +	drm_atomic_state_put(state);
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +	drm_dev_unregister(drm);
> +	drm_kunit_helper_free_device(test, vc4->dev);
> +}
> +
> +static void
> +drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct kunit *test)
> +{
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_state *state;
> +	struct vc4_crtc_state *new_vc4_crtc_state;
> +	struct drm_device *drm;
> +	struct vc4_dev *vc4;
> +	int ret;
> +
> +	vc4 = vc5_mock_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	drm = &vc4->base;
> +	state = drm_atomic_state_alloc(drm);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	state->acquire_ctx = &ctx;
> +
> +	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = drm_atomic_helper_swap_state(state, false);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drm_atomic_state_put(state);
> +
> +	state = drm_atomic_state_alloc(drm);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	state->acquire_ctx = &ctx;
> +
> +	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	new_vc4_crtc_state = get_vc4_crtc_state_for_encoder(test, state,
> +							    VC4_ENCODER_TYPE_HDMI0);
> +	KUNIT_EXPECT_NULL(test, new_vc4_crtc_state);
> +
> +	drm_atomic_state_put(state);
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +	drm_dev_unregister(drm);
> +	drm_kunit_helper_free_device(test, vc4->dev);
> +}
> +
> +static struct kunit_case vc5_pv_muxing_bugs_tests[] = {
> +	KUNIT_CASE(drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable),
> +	KUNIT_CASE(drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state),
> +	KUNIT_CASE(drm_test_vc5_pv_muxing_bugs_stable_fifo),
> +	{}
> +};
> +
> +static struct kunit_suite vc5_pv_muxing_bugs_test_suite = {
> +	.name = "vc5-pv-muxing-bugs",
> +	.test_cases = vc5_pv_muxing_bugs_tests,
> +};
> +
> +kunit_test_suites(
> +	&vc4_pv_muxing_test_suite,
> +	&vc5_pv_muxing_test_suite,
> +	&vc5_pv_muxing_bugs_test_suite
> +);
> 
