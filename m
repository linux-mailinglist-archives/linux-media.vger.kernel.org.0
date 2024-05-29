Return-Path: <linux-media+bounces-12159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC36D8D396B
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 16:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 679E6289062
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 14:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE04615ADAB;
	Wed, 29 May 2024 14:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fdbn+eQu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BF515ADA6
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993291; cv=none; b=PcavGBQgxJvIgbXtSOD5CUaOVqGGX6syOFYDW+D91EqRErzk+b6PdLQeYXh27Pi3oRmU7+m6pKyqFEh69zJa0Cwv5BLKeM8Vz0XwNo3YFBvcmdDsBEj7NJvMsWvgwV0C1EWTxL+u9gpSamLTbdj20SQIoq1iRyM2WhvXAPMnqkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993291; c=relaxed/simple;
	bh=k7aaJ0aPxRXPQFxTOi8dMi8Z12jZrKn8v3x0yJrtjGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fALtaYSBjcwmPuHGjF7S/YvOMazN8vkCIuBmvWOuM3MxPTZv7lZDTM5lcKewULkq++XvRIXh17rtnIEVh4FDdHOlilTyWeWm5RrvMC37EVnum0wN8zptvenLg7Jo7sHwTOt5QR3cVLD1g/tcs7YN3qK/jc/oTi0zMwiv1/48UW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fdbn+eQu; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-529614b8c29so3482672e87.2
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993288; x=1717598088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8JbUSA/b9Yufp8s/14Kjq4lmABtbQeUkHaO5aqXlw+o=;
        b=Fdbn+eQuOeHEQWkgEoBNSnIyjsH8jo39iOSwMRGMv1NEmQXlzKz9uM6PbSocwdwylA
         9lJ3uSQVvYjJyvauMvK0IGlk6a5nLAp+cbNnfHD95szaFE8pp3d2TfXCweuxBfi9cyg5
         j/fooZgboN3LQzqWjHA3cpay63fn0Jfh/f+KNMG43AY+hVjD0/RLWZZrfrBi+hIewes3
         OzXFBfAQTmzOTH8DsTc/s8+MyR7G76k2L8R1RUPvsv4cLAIF7oYqDH7NsOSkoW8QljKe
         bHOxy+FWJPD8MtPsoXSlVU/3ZKFWFEwjjzl42kFhVjt2JHAxPSeLSQ8GOcTp1dEw8b7u
         ughQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993288; x=1717598088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JbUSA/b9Yufp8s/14Kjq4lmABtbQeUkHaO5aqXlw+o=;
        b=P6533Oa3pu81LZijUgZesE7bPsivnHfDbJTB1IxlFR1AY9Xx6drwy0AeGltTOt/WBI
         2EO4gH5GYenGocgiKA1rhqrYCZ8qcC7E0fsL2ZYRdrG0zPaUyr37qKTTF33pXmuSoxnW
         QYt4hk22G0WzjvDNq1V7pwB5HcJnRPJAi1Ikn8u9h24kxjlceTmCDoR2YELosFX21NBT
         EFlN3wDPM3l5Mn08qC72mpjY4RNbSnJ+TirUDo7BCoqOqLOnv34zKCycB1qCjq5sLLBI
         5Mf7pHO0W5483L+QzrjK/HaOBz1tw0Q9/5kn+zEaiUFfc+Ixy+os3oGq9zvoNuVa5AXH
         GE4w==
X-Forwarded-Encrypted: i=1; AJvYcCXnJZ7cPX90h7Spg1bt/SYCvI+GOQJdzVfxM510GstvWB3ftWAW/ec1yhjSOStwCwM7xhpz0i7TM3wRllRsD48Z1SVO+aBqXCxHwXk=
X-Gm-Message-State: AOJu0Yy6PWhhL51cGKlY/RDioHVTi+GIaWOK9/IJKP3i6b9VeG/whvMC
	oHsRrd3pIBXZdvsp7V3DplzzuBa3AxJEA5RMUqpLmMnvnWximCoiymkF7JUxhOw=
X-Google-Smtp-Source: AGHT+IG3K+ljsCGYaD/stGYSzU8eiALGsrunqkKd/2A+qzz3MjkiDrfMI9pSxgVRd/o4UWSEa9q4pQ==
X-Received: by 2002:a05:6512:527:b0:529:b691:e37e with SMTP id 2adb3069b0e04-529b691e9d2mr5105087e87.40.1716993287614;
        Wed, 29 May 2024 07:34:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a64a03e574dsm74882966b.14.2024.05.29.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:34:46 -0700 (PDT)
Date: Wed, 29 May 2024 17:34:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	prabhakar.csengg@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 2/8] hwtracing: use for_each_endpoint_of_node()
Message-ID: <7fbf421c-6477-4fc4-93a5-10e2788522c4@moroto.mountain>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87fru14hl7.wl-kuninori.morimoto.gx@renesas.com>
 <20240529004047.GB1436@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529004047.GB1436@pendragon.ideasonboard.com>

On Wed, May 29, 2024 at 03:40:47AM +0300, Laurent Pinchart wrote:
> > @@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
> >  	}
> >  
> >  	/* Iterate through each output port to discover topology */
> > -	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
> > +	for_each_endpoint_of_node(parent, ep) {
> >  		/*
> >  		 * Legacy binding mixes input/output ports under the
> >  		 * same parent. So, skip the input ports if we are dealing
> 
> I think there's a bug below. The loop contains
> 
> 		ret = of_coresight_parse_endpoint(dev, ep, pdata);
> 		if (ret)
> 			return ret;
> 
> which leaks the reference to ep. This is not introduced by this patch,

Someone should create for_each_endpoint_of_node_scoped().

#define for_each_endpoint_of_node_scoped(parent, child) \
        for (struct device_node *child __free(device_node) =           \
             of_graph_get_next_endpoint(parent, NULL); child != NULL;  \
             child = of_graph_get_next_endpoint(parent, child))

regards,
dan carpenter


