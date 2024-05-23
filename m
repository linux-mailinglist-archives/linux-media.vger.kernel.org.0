Return-Path: <linux-media+bounces-11778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2855B8CCEE1
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3A3B1F21F9D
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 09:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3884813D292;
	Thu, 23 May 2024 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="duIunlHh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992ED13C914
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716455905; cv=none; b=pu+7bjf4Q0XSDRa1zUKHF29wKeO4M+/qpvYwi3euu2X+kKxgtxEEkalw1IpRsKwsFKIirVb21UAHmlQkbQVTZTsHhQCPpgH6XXBjuq0Nk5GPE25AQAkOiplOtDVHERkXi63Dzj8X45ovgWDjBNdRKsCB+Hlgc3oRqD+vJbymFn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716455905; c=relaxed/simple;
	bh=RGxM2jOVFTwquoP32KsAE1HBbRxX9MhiaEXuZQ252p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbpQllgsuZUQtjZMS0ZemnzOqS5PPRdxa9pnlf6q7UDHlZHPrOhg+pN1e+U7hK8gmLdPavF+rFdLSmi8XwylqzMbAhbOsRyV8Mgu0pgmJbg/eS89zpkjjHE44UnpVybMTA+I88VZQ2wkgxNjClo7lLJLyx2jEwoJj8mpG1NQ1F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=duIunlHh; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e724bc466fso57112211fa.3
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 02:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716455901; x=1717060701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hq01rfxiJkhZS3QzRfqemO50XhU1PhV9rUGPBC31chs=;
        b=duIunlHhbEkvY9GRSWx0dzNEMcEoEb4mv5KxsGMvI/ybm8E2dXOgTTEKyFdvM48nnM
         pIKTbk9SCPTESHlRvV1SVCRF3kwfqs2FakFwIwrKWZ5wnHK8wYYKxlFxGmBGxLQ1opye
         Wt/W6Cx6AllnosgtjEiWfkWEELISXjB1uJY5SJmYSdFSbUpYbMJdloAywFgVkK6T+Zfb
         womBoap+dfgKvrUDqqWgHYvU1sdw+s4GcDEBIf7NGKyjIDDppTgh4tNhTzaFWvTX40e6
         hqyhjY2IyV/PsmHzi2GCKHYPeW2z8yOjat3JB6deo9ea/buc98AHPh5DIsdhpr9w33v4
         ruYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716455901; x=1717060701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hq01rfxiJkhZS3QzRfqemO50XhU1PhV9rUGPBC31chs=;
        b=coHATdeZ8lFi0SFqwp4+LeL3oQmsp6Llj9BdE7AN7nf8BXSrg8j2xM4835m7BgH9S2
         rw31y5p49JJj0rZG7zsntFeY7rvqN1+NKgtOggEnMRk6B20eITS0M9WGkCLTY8/HPi69
         6Cuvn7KUvbjGdmIpg5Llg8kF/fObweRuhbISAkdjQT6lScA4tpLjRrIc163a+rohYO/p
         u+Y9+fXk25uvUB0K7HiASSbHaghZGWMlsOktEhcj7390q+kim5rGom3Uf+NqoxmlwIJ2
         YGExVK2YIWA0YjgyOQidow/9zOUZBNnyJW91LtBYFbzuiCAo+EDFzYZtOE+eEc2V0z1s
         6Mfg==
X-Forwarded-Encrypted: i=1; AJvYcCUFkmWyeCnTn+oWbtbsXsmiGUQlgajaMdzhxUhaaiLDV8wVeoWxr4KMrp2GP1yz9f44l46sV8CVo3xHKtCpgES3cThLXznvskPyfJI=
X-Gm-Message-State: AOJu0YwkqZ/qGOa5QdJf59HlC7pmMWZiGvyNDk/7rFY2y7yd7VINhYi9
	ikVQOKlJ7ZUx19TtfAdDZNNpZYEZQJC/F0IesWlRYaH/MIUvVmgKclDESclnHWk=
X-Google-Smtp-Source: AGHT+IHtkzdUfQObjmEVprHkzFN8zKAN9fTh1YCm+Kcmac6VM9gqN/CwHy0s14ABNvz7H4Poi3qpvg==
X-Received: by 2002:a2e:a792:0:b0:2e9:564a:db29 with SMTP id 38308e7fff4ca-2e9564ade37mr5621401fa.29.1716455900802;
        Thu, 23 May 2024 02:18:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e5686b802asm36602901fa.95.2024.05.23.02.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:18:20 -0700 (PDT)
Date: Thu, 23 May 2024 12:18:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 08/28] drm/tests: Add output formats tests
Message-ID: <h4t3rsxz6yez5fosi6lyvob5mbngkjb7ad5e4euddhokcjimn6@dif2qzr2xjhc>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-8-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-8-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:41PM +0200, Maxime Ripard wrote:
> Now that we track the HDMI output format as part of the connector state,
> let's add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c         | 99 +++++++++++++++++++++-
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 32 +++++++
>  2 files changed, 130 insertions(+), 1 deletion(-)
> 
> +
> +KUNIT_ARRAY_PARAM(drm_hdmi_connector_get_output_format_name_valid,
> +		  drm_hdmi_connector_get_output_format_name_valid_tests,
> +		  drm_hdmi_connector_get_output_format_name_valid_desc);
> +
> +static void drm_test_drm_hdmi_connector_get_output_format_name_invalid(struct kunit *test)
> +{
> +	KUNIT_EXPECT_NULL(test, drm_hdmi_connector_get_output_format_name(4));

Nit: it might be better to use a bigger value here. It's easier to miss
this if other formats get added for whatever reason.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +};
> +
> +static struct kunit_case drm_hdmi_connector_get_output_format_name_tests[] = {
> +	KUNIT_CASE_PARAM(drm_test_drm_hdmi_connector_get_output_format_name,
> +			 drm_hdmi_connector_get_output_format_name_valid_gen_params),
> +	KUNIT_CASE(drm_test_drm_hdmi_connector_get_output_format_name_invalid),
> +	{ }
> +};
> +

-- 
With best wishes
Dmitry

