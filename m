Return-Path: <linux-media+bounces-12222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D8D8D457F
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 08:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A35B2839F6
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 06:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6FD21C172;
	Thu, 30 May 2024 06:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IA2M/gXk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00301CA40
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 06:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717051062; cv=none; b=moOOHN173YihMUFqwybrY4hqw8BtCd6iZW1dWU1cgsv6JO7FITGVRfJ/v4N8PT6gStqSbt5r47H6P2dn+a7JQkRZNaPQL4qnyv0Es8IvAUxxtPhZj4/bAkAi+UI6puojnsT2lA/rd+nqXpfH6Fk9P3d7OZ8bTRFppM2MaQtmow8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717051062; c=relaxed/simple;
	bh=XiJPjIhtnRRi9k4YOJ1yFXpTdkcwoF0URO6vqm11YzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLgkCNIvNbD6BqiJQcLaLoS3/raCkd8OiyiaAWAaip4G4QTo7/mXmbJDxoLR1KGnZUihPQ4oefZQjKaDUNyN66CwRk6a6yFOUEMrzBBeCE7wXEmxWebhjQfE8eINXPCCuKky8t+Y/tmnw8hOcr8LDA16Z+m2nHNu57whDVfrizk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IA2M/gXk; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57a033c2ec2so420528a12.2
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 23:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717051059; x=1717655859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kPh8VLFqGiI+tH1uAPQnmuZ7TXsqcVMc+OlD3shtzK0=;
        b=IA2M/gXkfAn5A2Og5sppkKe45IzgLvdzcFnt75iI+0R67t5lLTAwLnaE1CS7aHc/aT
         2WeflGsKx4fwbRcLvJybs8w4tPOq4o8Ugl8bqzHRplw7zDe/6LA2ofrPjDDGYIczyN5K
         IJk9n1qeeEzwCGy8IDSLvQoHvDg59kSmxWMHtWJnWWE884OWHN/VUnbfHcwpsfZms8M2
         siArbLwxEP6KTve08HgylwttIrX9GlqZSHp6KlnhN7z986e54v+vTfBH0n6NGWs7ptLr
         BOHY0wtEW41paq2zGm7uFUsKSg+lKW4RmfkP0KKa9XE7VPzWE/798iBeRoOe/v9P8PC1
         R1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717051059; x=1717655859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPh8VLFqGiI+tH1uAPQnmuZ7TXsqcVMc+OlD3shtzK0=;
        b=pF/OOt6z4Spwq1E25VyOW/ORs1n9ep11b0G+pnvDv54zXtj7BPsZ+SzRwCTPqsFjg8
         vu6zhO4lGRUsbms9x2N/B/+Mf72OS+WinD0TaRA+aeVFP6uKDjlRnj1xEu7uqSBp3WDD
         x95xlCfMJSWYEq7XGl2jUG7KAk/E20tdD89H+JiBlo3VHMuEsyZtxdjEcgG3PVCTSC9u
         UE1uZ2BphLo+BtlBXYAUIyIguyp19hlJU6OtYqnd1X4+455aJmgL9BP5GHP1SS5BOxc+
         kG8B+KfejPWS6SSkNCDFMP2gknOybrihlXC3OZuDfJKyzQW3FUKryWg6F/ewlpx2Ks+v
         RKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo/cVrpoODNk8ZJe4UrlJW3SXXi85Pyiwi1SM8osKMY5u4hRF5R0sHkcCVC4EgM98OixdqHLztO6Kqqt4nGPpSJPrjBuYX/q3zaLY=
X-Gm-Message-State: AOJu0YwvSavyJDiKjv5KdUyWJ+3GFdsgNCpXm6UoBVhPStr/04JN9JHo
	RL8p6wSfLLnacG7iMtNaoXeBaSmmWSox4gg0nDCGH+VfW0Te0UZJ0v3LMB9QyMs=
X-Google-Smtp-Source: AGHT+IG58ojdsX4BmxtP/Bpc7KHEVVJgxF4twZVOBR7WGhJA36YAA2YN/IutMaNtxo384yPdBxYKtw==
X-Received: by 2002:a17:906:6a1b:b0:a65:ab25:24da with SMTP id a640c23a62f3a-a65e8e4c925mr88419866b.22.1717051058980;
        Wed, 29 May 2024 23:37:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc5150fsm785325266b.102.2024.05.29.23.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 23:37:38 -0700 (PDT)
Date: Thu, 30 May 2024 09:37:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lad Prabhakar <prabhakar.csengg@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
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
Subject: Re: [PATCH v3 4/9] media: platform: microchip: use
 for_each_endpoint_of_node()
Message-ID: <330e0f46-567a-460c-ad88-1f6acb2c2fe4@moroto.mountain>
References: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
 <87fru0oxyq.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fru0oxyq.wl-kuninori.morimoto.gx@renesas.com>

On Thu, May 30, 2024 at 02:06:05AM +0000, Kuninori Morimoto wrote:
> diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> index 5ac149cf3647f..60b6d922d764e 100644
> --- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> @@ -353,33 +353,29 @@ static const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
>  static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  {
>  	struct device_node *np = dev->of_node;
> -	struct device_node *epn = NULL;
> +	struct device_node *epn;
>  	struct isc_subdev_entity *subdev_entity;
>  	unsigned int flags;
> -	int ret;
>  
>  	INIT_LIST_HEAD(&isc->subdev_entities);
>  
> -	while (1) {
> +	for_each_endpoint_of_node(np, epn) {
>  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
> -
> -		epn = of_graph_get_next_endpoint(np, epn);
> -		if (!epn)
> -			return 0;
> +		int ret;
>  
>  		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
>  						 &v4l2_epn);
>  		if (ret) {
> -			ret = -EINVAL;
> +			of_node_put(epn);
>  			dev_err(dev, "Could not parse the endpoint\n");
> -			break;
> +			return -EINVAL;
>  		}
>  
>  		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
>  					     GFP_KERNEL);
>  		if (!subdev_entity) {
> -			ret = -ENOMEM;
> -			break;
> +			of_node_put(epn);
> +			return -ENOMEM;
>  		}
>  		subdev_entity->epn = epn;

This code is an example of what Laurent was talking about.  We're taking
storing "subdev_entity->epn = epn" but then not incrementing the
refcount.  Perhaps it's not necessary?

The difference between this and _scoped() would be if we stored epn and
then returned.  I feel like that's less common.  We could detect that
sort of thing using static analysis if it turned out to be an issue.

regards,
dan carpenter


