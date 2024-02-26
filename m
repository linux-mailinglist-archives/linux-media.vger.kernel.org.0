Return-Path: <linux-media+bounces-5922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB0F8674C5
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 13:25:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F23A21C214E3
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 12:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0841604D9;
	Mon, 26 Feb 2024 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ah5o+uWC"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FB7604CB;
	Mon, 26 Feb 2024 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950307; cv=none; b=TRPRMiMCy/4jQN6/eZjoo8kmfoLMkm0uES5Be0M6IBVVOX2qQcZEcJqVxloqA02LpObdJ6CSdprjtuQqLHwO2EVnuorktbLIYooVd4EKqK6yh5k55t69cZnFrKKbdRia45d3VuMo+VtO7klon/IrXIOqL09Sk7qtRpmIPJxfdmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950307; c=relaxed/simple;
	bh=2cO1H64a3bBmvh+eFgDuGs6z/0Yr3JnqaFC3hq5kXaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cLn7iFrhLEaXgk59cx9t1ZHWcapbrgBNdyVMvys1czy+xK6Xf7IuLZVFMu9789Uh5OLvbdCBlfcLAjQGqKYcKkkDfP69Ku1IGrxPFt566+2FqN9dkKEu4Fo4UOUkMYv4mG9jesE7T7/Tr3rQvetRZGx8DXEB09vB0u0s5B0f630=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ah5o+uWC; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0oZm3EOg1yNCpu65rB6gTP7q8rSBUzdq39Z9z79Zzt4=; b=ah5o+uWCOiKlW9NBqEsAXSneMW
	9TLSalXYWd6qKxynJUZZqZ0j3ZRcY3o8BX3/B8vr9FJZBm74UnYDR521b/7C4e/DHZxHO+Sxhx3sU
	zwlRAZR+ZqYRLknV1f9iwZEG34AlTIBTEVFL67Y9E3Hm08gocDElk/z0tc0eUpL5HA81Mu0LxhsBM
	GEeVnHQA7QfG/hbj0qhHgXBZ5kKCve8LlQnQYxy8dRdNvd8Zq9vTph13zl4S/bNf2R4JH2ECCymEF
	JZ55GgCMRt4L+0zk/3iVCsIiGHOf/8Vqj64s9D8a86balWxhh2MxMHlcb1dTsnEE1LT6kEzdvdEFh
	eW4sj5Og==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rea2G-003YfT-E8; Mon, 26 Feb 2024 13:24:44 +0100
Message-ID: <664d9eca-a3f2-4a87-9a50-9c415781cef9@igalia.com>
Date: Mon, 26 Feb 2024 09:24:38 -0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/36] drm/tests: Add helper to create mock plane
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-3-8f4af575fce2@kernel.org>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-3-8f4af575fce2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/22/24 15:13, Maxime Ripard wrote:
> We're going to need a full-blown, functional, KMS device to test more
> components of the atomic modesetting infrastructure.
> 
> Let's add a new helper to create a dumb, mocked, primary plane. By
> default, it will create a linear XRGB8888 plane, using the default
> helpers.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/tests/drm_kunit_helpers.c | 85 +++++++++++++++++++++++++++++++
>   include/drm/drm_kunit_helpers.h           | 11 ++++
>   2 files changed, 96 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index 4fb11b938bc1..32dc8354641a 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -3,6 +3,7 @@
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_drv.h>
> +#include <drm/drm_fourcc.h>
>   #include <drm/drm_kunit_helpers.h>
>   #include <drm/drm_managed.h>
>   
> @@ -164,5 +165,89 @@ drm_kunit_helper_atomic_state_alloc(struct kunit *test,
>   }
>   EXPORT_SYMBOL_GPL(drm_kunit_helper_atomic_state_alloc);
>   
> +static const uint32_t default_plane_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static const uint64_t default_plane_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +static const struct drm_plane_helper_funcs default_plane_helper_funcs = {
> +};
> +
> +static const struct drm_plane_funcs default_plane_funcs = {
> +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> +	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> +	.reset			= drm_atomic_helper_plane_reset,
> +};
> +
> +/**
> + * drm_kunit_helper_create_primary_plane - Creates a mock primary plane for a KUnit test
> + * @test: The test context object
> + * @drm: The device to alloc the plane for
> + * @funcs: Callbacks for the new plane. Optional.
> + * @helper_funcs: Helpers callbacks for the new plane. Optional.
> + * @formats: array of supported formats (DRM_FORMAT\_\*). Optional.
> + * @num_formats: number of elements in @formats
> + * @modifiers: array of struct drm_format modifiers terminated by
> + *             DRM_FORMAT_MOD_INVALID. Optional.
> + *
> + * This allocates and initializes a mock struct &drm_plane meant to be
> + * part of a mock device for a KUnit test.
> + *
> + * Resources will be cleaned up automatically.
> + *
> + * @funcs will default to the default helpers implementations.
> + * @helper_funcs will default to an empty implementation. @formats will
> + * default to XRGB8888 only. @modifiers will default to a linear
> + * modifier only.
> + *
> + * Returns:
> + * A pointer to the new plane, or an ERR_PTR() otherwise.
> + */
> +struct drm_plane *
> +drm_kunit_helper_create_primary_plane(struct kunit *test,
> +				      struct drm_device *drm,
> +				      const struct drm_plane_funcs *funcs,
> +				      const struct drm_plane_helper_funcs *helper_funcs,
> +				      const uint32_t *formats,
> +				      unsigned int num_formats,
> +				      const uint64_t *modifiers)
> +{
> +	struct drm_plane *plane;
> +
> +	if (!funcs)
> +		funcs = &default_plane_funcs;
> +
> +	if (!helper_funcs)
> +		helper_funcs = &default_plane_helper_funcs;
> +
> +	if (!formats || !num_formats) {
> +		formats = default_plane_formats;
> +		num_formats = ARRAY_SIZE(default_plane_formats);
> +	}
> +
> +	if (!modifiers)
> +		modifiers = default_plane_modifiers;
> +
> +	plane = __drmm_universal_plane_alloc(drm,
> +					     sizeof(struct drm_plane), 0,
> +					     0,
> +					     funcs,
> +					     formats,
> +					     num_formats,
> +					     default_plane_modifiers,
> +					     DRM_PLANE_TYPE_PRIMARY,
> +					     NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
> +
> +	drm_plane_helper_add(plane, helper_funcs);
> +
> +	return plane;
> +}
> +EXPORT_SYMBOL_GPL(drm_kunit_helper_create_primary_plane);
> +
>   MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
>   MODULE_LICENSE("GPL");
> diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
> index 3ae19892229d..38667d624aa8 100644
> --- a/include/drm/drm_kunit_helpers.h
> +++ b/include/drm/drm_kunit_helpers.h
> @@ -10,6 +10,8 @@
>   #include <kunit/test.h>
>   
>   struct drm_device;
> +struct drm_plane_funcs;
> +struct drm_plane_helper_funcs;
>   struct kunit;
>   
>   struct device *drm_kunit_helper_alloc_device(struct kunit *test);
> @@ -99,4 +101,13 @@ drm_kunit_helper_atomic_state_alloc(struct kunit *test,
>   				    struct drm_device *drm,
>   				    struct drm_modeset_acquire_ctx *ctx);
>   
> +struct drm_plane *
> +drm_kunit_helper_create_primary_plane(struct kunit *test,
> +				      struct drm_device *drm,
> +				      const struct drm_plane_funcs *funcs,
> +				      const struct drm_plane_helper_funcs *helper_funcs,
> +				      const uint32_t *formats,
> +				      unsigned int num_formats,
> +				      const uint64_t *modifiers);
> +
>   #endif // DRM_KUNIT_HELPERS_H_
> 

