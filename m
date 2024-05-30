Return-Path: <linux-media+bounces-12223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE598D458B
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 08:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7406D1F21D96
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 06:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591AF3DABED;
	Thu, 30 May 2024 06:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jdItoEE8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F787F
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717051212; cv=none; b=p0kontcp1wON2n4r1Hkx+JHAItUOrW18iZYoQvqXzqFR16vlixMM7TXHpeI4WkfwhOAG/ZVRnAflntwtjv1Gc4QSdbFFAAyl5HVXpGHlj0ipZLQuSFxLdi6VQC4pEujYC1hwc/Jqz14fRcOib+M10UjqENA72uFg5ipYbbGwiUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717051212; c=relaxed/simple;
	bh=ylScWtRnNsvzxfLN7SlSXfogkUEyR/tv1L2cL+EG+QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuqYVZQOAFF20zS+ZqHLii8u0DE4bpS5M5nrRHQaeYMaFyEjK7nATe8J1dCgb1HiNz5rCnzC5fHmXc4FlspmBT1U9oOVDmjBOL2GvtSAHj52hp/5vu8MiyjIS4JacxoMnKtXXvQ5d8CS3M14H7kO1MlRUM1l1oxfVruNFHsLUTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jdItoEE8; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57a196134d1so315853a12.2
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 23:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717051209; x=1717656009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hbYS8lpXExj7GV7sixwHtaV70JUaIYUrLKDua6V9Rwg=;
        b=jdItoEE8ukXj3bDxNj0BLRK+V5SxlP/UMUv4C7f4inSddLFjxjXJ3CUpH2Xj7S1y1A
         dmLygG6qgGwSDVDnVZPLUi6n0B+7CuCWRhsykN1AfxDXYyEnHamAtth6/VpwOgiEbGIg
         3trUkj4k2Isgp6xs12aSZo4hBZhXPgdGHhGGTnHj/4hPMqMv8NdmTZs32xSeSoeaf50a
         pM2ujgMul60x2hc4ljghwV/Og4YTnUDJAvbd/uGLIwPXW05lWgoezCD2l6ftyP/CGToD
         58sie2vvhDcav9Mz2JPpgy2D/v5aTaCuC8HWKkXmwe+XyvUtGw7CCO5tNo8nUruouqQO
         72PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717051209; x=1717656009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbYS8lpXExj7GV7sixwHtaV70JUaIYUrLKDua6V9Rwg=;
        b=Dn+Z7lX7TwonEmZ80zCnmP7K/ZjS1dNIHnPLS3NGNHD7+aGe8w/FPuK7Jx+2zPQU/W
         XL4r44EK04ibwVwmMzpGhdtSnCuoiNPg5iiDsxPQTfU+SJpKwA8YYPsx5h5SPibKixk9
         t+qnhvBwnI+deMMpCiEE0Mt9jYPBSyaZ2BoqQ0o+eIdLbSVZZBOP//gorlY7nJVY9x8H
         GPsfch91l/MzgiyLRyw6WrCPZXckomR0SS7zqfmhCUA2O1AYns9pqlv4ZnU8NABpc7T8
         ZnENQGZE3Tegshl6/DWYbGT2e/7zb3ACjlbqnGMQJtQUMnrNsNw6xUbLfUV9G6FWpXDZ
         kfvA==
X-Forwarded-Encrypted: i=1; AJvYcCV/DPTRtauqUyMsNFLxD5Hfkfft3X+yGsjBn1SU1jh2qvhK/Ye78K/1WW6nmq4lBcGJk0ZYvauufGjs29ZDo4DUxbNpid09/EdjC8I=
X-Gm-Message-State: AOJu0Yy9F+MPGzWJfBrrI3odfoOdo5MNhfgN5dH7W+ytZglJjLyO1SC6
	7ovUnIAonrNkQ98RBrIP4EPTHqjVttoGgfyaBmEvke9R+swPSu3m5POeIAgFj6M=
X-Google-Smtp-Source: AGHT+IE6/VTwKZTsEcVkjHDXiwR4jbhWUjQNX+Zpjmyoqeke5OVHzCiHycLfInR8VWcYgsER/P3wXg==
X-Received: by 2002:a50:9316:0:b0:579:c2fe:886 with SMTP id 4fb4d7f45d1cf-57a177b15b9mr645619a12.14.1717051209214;
        Wed, 29 May 2024 23:40:09 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579d69b49basm4770207a12.88.2024.05.29.23.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 23:40:08 -0700 (PDT)
Date: Thu, 30 May 2024 09:40:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lad Prabhakar <prabhakar.csengg@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 7/9] staging: media: atmel: use
 for_each_endpoint_of_node()
Message-ID: <f0f1b989-2166-44ad-ba70-caf56a4d93c4@moroto.mountain>
References: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
 <87bk4ooxya.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bk4ooxya.wl-kuninori.morimoto.gx@renesas.com>

On Thu, May 30, 2024 at 02:06:22AM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../staging/media/deprecated/atmel/atmel-sama5d2-isc.c    | 8 ++------
>  .../staging/media/deprecated/atmel/atmel-sama7g5-isc.c    | 8 ++------
>  2 files changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> index 31b2b48085c59..3b28a232418a9 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> @@ -333,20 +333,16 @@ static const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
>  static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  {
>  	struct device_node *np = dev->of_node;
> -	struct device_node *epn = NULL;
> +	struct device_node *epn;
>  	struct isc_subdev_entity *subdev_entity;
>  	unsigned int flags;
>  	int ret;
>  
>  	INIT_LIST_HEAD(&isc->subdev_entities);
>  
> -	while (1) {
> +	for_each_endpoint_of_node(np, epn) {
>  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
>  
> -		epn = of_graph_get_next_endpoint(np, epn);
> -		if (!epn)
> -			return 0;
> -
>  		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
>  						 &v4l2_epn);
>  		if (ret) {

This introduces a Smatch warning because now "ret" is uninitialized if
the for_each_endpoint_of_node() list is empty.  Is that something which
is possible?

I've been meaning to make a list of loops which always iterate at least
one time.  for_each_cpu() etc.

regards,
dan carpenter


