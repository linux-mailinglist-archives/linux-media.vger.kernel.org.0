Return-Path: <linux-media+bounces-31506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA353AA5FED
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 16:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CFFA17FA77
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 14:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7D61F1537;
	Thu,  1 May 2025 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KVLc3t/0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ECC29CE6
	for <linux-media@vger.kernel.org>; Thu,  1 May 2025 14:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109533; cv=none; b=mbtII42T5TDbpwjwrKXJHiMc05HrREfmzZT08Crxh3vN3tO0og2ydtfEi7lgyajDG6yJtNbJmRGQhgrKcinfiS/aOsju/EdWpvE9upw16tqpNO/J+avYUf2dJCElPwkrLADDoq7Ny5MYbVB2lxD1ZRNKR9bNQDmU266gzM6pXrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109533; c=relaxed/simple;
	bh=ZaaWgkWXce8T9tVQMbapNMFtMkyWrYYf/9cM5Iyn7Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zgdrqeq63ydvbHFpY1rRBBKxTWd5dahr9v4i4jC3TZByLlKmwkc1NuWi+xay3KWNirMGIEdps5fv06q0armreWUDLCmzZlIVR3U7mk8F+CWUbQTiWHq1IB0RYOHBwnFPY4Fq3NCJj7ts4fBK5BRP4uz9Nlt15pekRJP17TfTXsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KVLc3t/0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746109530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T7hSRqAP1Fg1wCFdTgE8ocU6mTNtXn6dUYcVzII9Q10=;
	b=KVLc3t/0qpCDXB3/rASl58A6D+0tiook9nKCcUykCL+jexY6R/dOA1yLgvCbx+Wzfww78q
	dYy1Q17fx9kZ16NszBkd5JDoo6TkKqS52uTBgjNkv5hImlBJy61zB2AY/jYlcrNO9D0mq5
	eb+SYbjFCherUmoPKKEaQPMVlli+b34=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-Zd8WVzNkNrWOT2k4LwXDtg-1; Thu, 01 May 2025 10:25:29 -0400
X-MC-Unique: Zd8WVzNkNrWOT2k4LwXDtg-1
X-Mimecast-MFC-AGG-ID: Zd8WVzNkNrWOT2k4LwXDtg_1746109528
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ab68fbe53a4so148701466b.2
        for <linux-media@vger.kernel.org>; Thu, 01 May 2025 07:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746109528; x=1746714328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7hSRqAP1Fg1wCFdTgE8ocU6mTNtXn6dUYcVzII9Q10=;
        b=somsBaFMQ0GFpMlPoi9+EB7NL9dZj2xD2jI6Xef53r001b5vwIuKVitAvLDsSt30dn
         uluySbSygHJtR1kNvgfUoEORHTogD06U9R+Q8jdtk3ocTQHnUJDe4R5jQsVxQIaGfy7r
         /XbbyUJwkvH0qSLPt11KGtseTElZh09YYPYwilCLq0SAZ7kCnqDtekSknTfInW+wEpLY
         NhVnXHexdPWI7rcSwJCA/R04EUAG3UF2y8X6HCKkTxgcZE26zJjcikbZcYiE5YDpAMoo
         d8uIY7vXqWdnSnRVYib+QoRPpG/N3CKAHhjFh+cIub1JermGtiXCAskMVPOPUKiQIRHS
         nfUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw+sMxooxBPOPo6+yOO0CZXngfTkLdMl6JWk1pJKB+CrMMdUmhQEY4+3B1QWF1UnOaxLPJLTA4iQ9JEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy+KFnG5Vw/JQC7IxVal/XmpVfI8tHtP9iSN/9NrN8dVGXBhZd
	QtlQMG4ei7DexGRVW2q4LXwy+zbjvVgki1a2uo8Oos+54VnXMZQ46wD/MLLC3oZKr+TF3JVznUv
	pM+X8pIkENJXxotU8suqnraghjP1d/LxWMhGhxTH9Gip1/j83rD9/HNszteTI
X-Gm-Gg: ASbGncujdS/WTg002mse64cfCDIpbgkelftFIwBrm3RdA3nc2XyU97SU1vHKfy0cZ03
	BpyMYJxRF/H+3kZNsVv/8J33BbEQI1Ood+zyHvbD1t9q+L6lxJyQrkEeCd3TG55R5ZloMNy43ox
	3lm6Pq9uGh3m6JH2yQNBB8ECVDJi3YatxJml0k3J4rDakgfPBL4Emg4BEYrpWMavV8Aqyoak6mw
	Yg7PKY7khsJb2HV0ikspuvbX8F/vmXUbqHUdAaCvYAGIspfqdebnPwSOXUJ3G3V7+Ljh4yCQ5py
	tMGeZ70lwJKiRA5QFzAeQfg0jix+0lF61USDdzOPQHYKcyLMFuGfSbfaxZ+ocDgFNgujSJEC1KC
	MkgsevzocxIuM1edR0lOVibGwoSCiZn/dtoJ7xZWG3UWNsjCtyBKhxCnQh9mHKA==
X-Received: by 2002:a17:907:9605:b0:aca:d66d:cd0d with SMTP id a640c23a62f3a-acee21e3c93mr656898166b.30.1746109527759;
        Thu, 01 May 2025 07:25:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9YYO47mq6LqU+7Kc8NH7smgHaecmNL5rRMLWzv644U6bxHcnBw7Xs+GscIamaA2bLEaHOUg==
X-Received: by 2002:a17:907:9605:b0:aca:d66d:cd0d with SMTP id a640c23a62f3a-acee21e3c93mr656896266b.30.1746109527242;
        Thu, 01 May 2025 07:25:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0c70f0972sm47851566b.67.2025.05.01.07.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:25:26 -0700 (PDT)
Message-ID: <d28b0f51-994e-4ff1-ac40-1d32a38c6f6d@redhat.com>
Date: Thu, 1 May 2025 16:25:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: atomisp: Remove compat ioctl32 header file
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 andy@kernel.org, sakari.ailus@linux.intel.com,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250421052804.11721-1-hardevsinh.palaniya@siliconsignals.io>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250421052804.11721-1-hardevsinh.palaniya@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 21-Apr-25 7:27 AM, Hardevsinh Palaniya wrote:
> Arnd's patch [1] removed the compat ioctl32 code, so this
> header file is no longer needed.
> 
> Additionally, the definition of atomisp_compat_ioctl32()
> was deleted in Arnd's patch [1], making its declaration
> unused as well.
> 
> Moreover, there are no references to this header file or
> the function(atomisp_compat_ioctl32) in the atomisp codebase.
> 
> Link URL[1]: https://lore.kernel.org/linux-media/20210614103409.3154127-7-arnd@kernel.org/
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

with the commit message modified per Dan Carpenter's
suggestion in the v1 thread.

This patch will be included in my next pull-request to Mauro
(the media subsystem maintainer).

Regards,

Hans



> ---
>  .../atomisp/pci/atomisp_compat_ioctl32.h      | 244 ------------------
>  .../staging/media/atomisp/pci/atomisp_ioctl.h |   4 -
>  2 files changed, 248 deletions(-)
>  delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
> deleted file mode 100644
> index 23d798f3085c..000000000000
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
> +++ /dev/null
> @@ -1,244 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Support for Intel Camera Imaging ISP subsystem.
> - *
> - * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
> - */
> -#ifndef __ATOMISP_COMPAT_IOCTL32_H__
> -#define __ATOMISP_COMPAT_IOCTL32_H__
> -
> -#include <linux/compat.h>
> -#include <linux/videodev2.h>
> -
> -#include "atomisp_compat.h"
> -
> -struct atomisp_histogram32 {
> -	unsigned int num_elements;
> -	compat_uptr_t data;
> -};
> -
> -struct atomisp_dvs2_stat_types32 {
> -	compat_uptr_t odd_real; /** real part of the odd statistics*/
> -	compat_uptr_t odd_imag; /** imaginary part of the odd statistics*/
> -	compat_uptr_t even_real;/** real part of the even statistics*/
> -	compat_uptr_t even_imag;/** imaginary part of the even statistics*/
> -};
> -
> -struct atomisp_dvs2_coef_types32 {
> -	compat_uptr_t odd_real; /** real part of the odd coefficients*/
> -	compat_uptr_t odd_imag; /** imaginary part of the odd coefficients*/
> -	compat_uptr_t even_real;/** real part of the even coefficients*/
> -	compat_uptr_t even_imag;/** imaginary part of the even coefficients*/
> -};
> -
> -struct atomisp_dvs2_statistics32 {
> -	struct atomisp_dvs_grid_info grid_info;
> -	struct atomisp_dvs2_stat_types32 hor_prod;
> -	struct atomisp_dvs2_stat_types32 ver_prod;
> -};
> -
> -struct atomisp_dis_statistics32 {
> -	struct atomisp_dvs2_statistics32 dvs2_stat;
> -	u32 exp_id;
> -};
> -
> -struct atomisp_dis_coefficients32 {
> -	struct atomisp_dvs_grid_info grid_info;
> -	struct atomisp_dvs2_coef_types32 hor_coefs;
> -	struct atomisp_dvs2_coef_types32 ver_coefs;
> -};
> -
> -struct atomisp_3a_statistics32 {
> -	struct atomisp_grid_info  grid_info;
> -	compat_uptr_t data;
> -	compat_uptr_t rgby_data;
> -	u32 exp_id;
> -	u32 isp_config_id;
> -};
> -
> -struct atomisp_morph_table32 {
> -	unsigned int enabled;
> -	unsigned int height;
> -	unsigned int width;	/* number of valid elements per line */
> -	compat_uptr_t coordinates_x[ATOMISP_MORPH_TABLE_NUM_PLANES];
> -	compat_uptr_t coordinates_y[ATOMISP_MORPH_TABLE_NUM_PLANES];
> -};
> -
> -struct v4l2_framebuffer32 {
> -	__u32			capability;
> -	__u32			flags;
> -	compat_uptr_t		base;
> -	struct v4l2_pix_format	fmt;
> -};
> -
> -struct atomisp_overlay32 {
> -	/* the frame containing the overlay data The overlay frame width should
> -	 * be the multiples of 2*ISP_VEC_NELEMS. The overlay frame height
> -	 * should be the multiples of 2.
> -	 */
> -	compat_uptr_t frame;
> -	/* Y value of overlay background */
> -	unsigned char bg_y;
> -	/* U value of overlay background */
> -	char bg_u;
> -	/* V value of overlay background */
> -	char bg_v;
> -	/* the blending percent of input data for Y subpixels */
> -	unsigned char blend_input_perc_y;
> -	/* the blending percent of input data for U subpixels */
> -	unsigned char blend_input_perc_u;
> -	/* the blending percent of input data for V subpixels */
> -	unsigned char blend_input_perc_v;
> -	/* the blending percent of overlay data for Y subpixels */
> -	unsigned char blend_overlay_perc_y;
> -	/* the blending percent of overlay data for U subpixels */
> -	unsigned char blend_overlay_perc_u;
> -	/* the blending percent of overlay data for V subpixels */
> -	unsigned char blend_overlay_perc_v;
> -	/* the overlay start x pixel position on output frame It should be the
> -	   multiples of 2*ISP_VEC_NELEMS. */
> -	unsigned int overlay_start_x;
> -	/* the overlay start y pixel position on output frame It should be the
> -	   multiples of 2. */
> -	unsigned int overlay_start_y;
> -};
> -
> -struct atomisp_shading_table32 {
> -	__u32 enable;
> -	__u32 sensor_width;
> -	__u32 sensor_height;
> -	__u32 width;
> -	__u32 height;
> -	__u32 fraction_bits;
> -
> -	compat_uptr_t data[ATOMISP_NUM_SC_COLORS];
> -};
> -
> -struct atomisp_parameters32 {
> -	compat_uptr_t wb_config;  /* White Balance config */
> -	compat_uptr_t cc_config;  /* Color Correction config */
> -	compat_uptr_t tnr_config; /* Temporal Noise Reduction */
> -	compat_uptr_t ecd_config; /* Eigen Color Demosaicing */
> -	compat_uptr_t ynr_config; /* Y(Luma) Noise Reduction */
> -	compat_uptr_t fc_config;  /* Fringe Control */
> -	compat_uptr_t formats_config;  /* Formats Control */
> -	compat_uptr_t cnr_config; /* Chroma Noise Reduction */
> -	compat_uptr_t macc_config;  /* MACC */
> -	compat_uptr_t ctc_config; /* Chroma Tone Control */
> -	compat_uptr_t aa_config;  /* Anti-Aliasing */
> -	compat_uptr_t baa_config;  /* Anti-Aliasing */
> -	compat_uptr_t ce_config;
> -	compat_uptr_t dvs_6axis_config;
> -	compat_uptr_t ob_config;  /* Objective Black config */
> -	compat_uptr_t dp_config;  /* Dead Pixel config */
> -	compat_uptr_t nr_config;  /* Noise Reduction config */
> -	compat_uptr_t ee_config;  /* Edge Enhancement config */
> -	compat_uptr_t de_config;  /* Demosaic config */
> -	compat_uptr_t gc_config;  /* Gamma Correction config */
> -	compat_uptr_t anr_config; /* Advanced Noise Reduction */
> -	compat_uptr_t a3a_config; /* 3A Statistics config */
> -	compat_uptr_t xnr_config; /* eXtra Noise Reduction */
> -	compat_uptr_t dz_config;  /* Digital Zoom */
> -	compat_uptr_t yuv2rgb_cc_config; /* Color
> -							Correction config */
> -	compat_uptr_t rgb2yuv_cc_config; /* Color
> -							Correction config */
> -	compat_uptr_t macc_table;
> -	compat_uptr_t gamma_table;
> -	compat_uptr_t ctc_table;
> -	compat_uptr_t xnr_table;
> -	compat_uptr_t r_gamma_table;
> -	compat_uptr_t g_gamma_table;
> -	compat_uptr_t b_gamma_table;
> -	compat_uptr_t motion_vector; /* For 2-axis DVS */
> -	compat_uptr_t shading_table;
> -	compat_uptr_t morph_table;
> -	compat_uptr_t dvs_coefs; /* DVS 1.0 coefficients */
> -	compat_uptr_t dvs2_coefs; /* DVS 2.0 coefficients */
> -	compat_uptr_t capture_config;
> -	compat_uptr_t anr_thres;
> -
> -	compat_uptr_t	lin_2500_config;       /* Skylake: Linearization config */
> -	compat_uptr_t	obgrid_2500_config;    /* Skylake: OBGRID config */
> -	compat_uptr_t	bnr_2500_config;       /* Skylake: bayer denoise config */
> -	compat_uptr_t	shd_2500_config;       /* Skylake: shading config */
> -	compat_uptr_t	dm_2500_config;        /* Skylake: demosaic config */
> -	compat_uptr_t	rgbpp_2500_config;     /* Skylake: RGBPP config */
> -	compat_uptr_t	dvs_stat_2500_config;  /* Skylake: DVS STAT config */
> -	compat_uptr_t	lace_stat_2500_config; /* Skylake: LACE STAT config */
> -	compat_uptr_t	yuvp1_2500_config;     /* Skylake: yuvp1 config */
> -	compat_uptr_t	yuvp2_2500_config;     /* Skylake: yuvp2 config */
> -	compat_uptr_t	tnr_2500_config;       /* Skylake: TNR config */
> -	compat_uptr_t	dpc_2500_config;       /* Skylake: DPC config */
> -	compat_uptr_t	awb_2500_config;       /* Skylake: auto white balance config */
> -	compat_uptr_t
> -	awb_fr_2500_config;    /* Skylake: auto white balance filter response config */
> -	compat_uptr_t	anr_2500_config;       /* Skylake: ANR config */
> -	compat_uptr_t	af_2500_config;        /* Skylake: auto focus config */
> -	compat_uptr_t	ae_2500_config;        /* Skylake: auto exposure config */
> -	compat_uptr_t	bds_2500_config;       /* Skylake: bayer downscaler config */
> -	compat_uptr_t
> -	dvs_2500_config;       /* Skylake: digital video stabilization config */
> -	compat_uptr_t	res_mgr_2500_config;
> -
> -	/*
> -	 * Output frame pointer the config is to be applied to (optional),
> -	 * set to NULL to make this config is applied as global.
> -	 */
> -	compat_uptr_t	output_frame;
> -	/*
> -	 * Unique ID to track which config was actually applied to a particular
> -	 * frame, driver will send this id back with output frame together.
> -	 */
> -	u32	isp_config_id;
> -	u32	per_frame_setting;
> -};
> -
> -struct atomisp_dvs_6axis_config32 {
> -	u32 exp_id;
> -	u32 width_y;
> -	u32 height_y;
> -	u32 width_uv;
> -	u32 height_uv;
> -	compat_uptr_t xcoords_y;
> -	compat_uptr_t ycoords_y;
> -	compat_uptr_t xcoords_uv;
> -	compat_uptr_t ycoords_uv;
> -};
> -
> -#define ATOMISP_IOC_G_HISTOGRAM32 \
> -	_IOWR('v', BASE_VIDIOC_PRIVATE + 3, struct atomisp_histogram32)
> -#define ATOMISP_IOC_S_HISTOGRAM32 \
> -	_IOW('v', BASE_VIDIOC_PRIVATE + 3, struct atomisp_histogram32)
> -
> -#define ATOMISP_IOC_G_DIS_STAT32 \
> -	_IOWR('v', BASE_VIDIOC_PRIVATE + 6, struct atomisp_dis_statistics32)
> -#define ATOMISP_IOC_S_DIS_COEFS32 \
> -	_IOW('v', BASE_VIDIOC_PRIVATE + 6, struct atomisp_dis_coefficients32)
> -
> -#define ATOMISP_IOC_S_DIS_VECTOR32 \
> -	_IOW('v', BASE_VIDIOC_PRIVATE + 6, struct atomisp_dvs_6axis_config32)
> -
> -#define ATOMISP_IOC_G_3A_STAT32 \
> -	_IOWR('v', BASE_VIDIOC_PRIVATE + 7, struct atomisp_3a_statistics32)
> -
> -#define ATOMISP_IOC_G_ISP_GDC_TAB32 \
> -	_IOR('v', BASE_VIDIOC_PRIVATE + 10, struct atomisp_morph_table32)
> -#define ATOMISP_IOC_S_ISP_GDC_TAB32 \
> -	_IOW('v', BASE_VIDIOC_PRIVATE + 10, struct atomisp_morph_table32)
> -
> -#define ATOMISP_IOC_S_ISP_FPN_TABLE32 \
> -	_IOW('v', BASE_VIDIOC_PRIVATE + 17, struct v4l2_framebuffer32)
> -
> -#define ATOMISP_IOC_G_ISP_OVERLAY32 \
> -	_IOWR('v', BASE_VIDIOC_PRIVATE + 18, struct atomisp_overlay32)
> -#define ATOMISP_IOC_S_ISP_OVERLAY32 \
> -	_IOW('v', BASE_VIDIOC_PRIVATE + 18, struct atomisp_overlay32)
> -
> -#define ATOMISP_IOC_S_ISP_SHD_TAB32 \
> -	_IOWR('v', BASE_VIDIOC_PRIVATE + 27, struct atomisp_shading_table32)
> -
> -#define ATOMISP_IOC_S_PARAMETERS32 \
> -	_IOW('v', BASE_VIDIOC_PRIVATE + 32, struct atomisp_parameters32)
> -
> -#endif /* __ATOMISP_COMPAT_IOCTL32_H__ */
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
> index 4feaa0338cb4..57f608f9db56 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
> @@ -33,8 +33,4 @@ void atomisp_stop_streaming(struct vb2_queue *vq);
>  
>  extern const struct v4l2_ioctl_ops atomisp_ioctl_ops;
>  
> -/* compat_ioctl for 32bit userland app and 64bit kernel */
> -long atomisp_compat_ioctl32(struct file *file,
> -			    unsigned int cmd, unsigned long arg);
> -
>  #endif /* __ATOMISP_IOCTL_H__ */


