Return-Path: <linux-media+bounces-11439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC75B8C57AA
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 16:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2609C2850FC
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 14:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BEB145323;
	Tue, 14 May 2024 14:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uEA0aqYI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB111448ED
	for <linux-media@vger.kernel.org>; Tue, 14 May 2024 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715695605; cv=none; b=FAzgm36U0zfDCEV6PMBoGjPqfrGo2+hs4gLskSSJ0/3PxPsyzGQZpQqAq5dFe3H62ePosoqdi5QZjCCvfiJ86a/ttgcjmBDJJ1SSuMi70/Eqd0CnFf++q2uANvJIQ8u9KIlkcj5GNyxKASGLEbkGi7x/fHdu5GMyAP9iz31AAeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715695605; c=relaxed/simple;
	bh=ipgBCoIZ4VHKNdttClEwK2tJlFePH+T2J5hrqU9VRPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nv8rnuSG/F7oDxMc5NL8DRh8f4Tdhl1HShjwCboCkNj8LoGKaScTQWoHk1NQqWKxTQOH8bn/I+mQOxu8c2raE4GUzkKa8Kcb67o1S0GtW9wWqAMWanpHRO84furEaOCBvWWiX66cRrTne7Mf4qbPZ/lvo9r1GTYsScb1YgZXCYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uEA0aqYI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41fc2f7fbb5so31182115e9.1
        for <linux-media@vger.kernel.org>; Tue, 14 May 2024 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715695602; x=1716300402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MGdJzkhuCxnkLBMNdqLMl/fKj8tcfr0PaXQonc/7x3M=;
        b=uEA0aqYIH+51tviYPb126rJyno0ZsFEXuc2YtRlPC59KNWsC0OFlFRFt5BZrGtmDN3
         7NAWUDp2wvpXeukK/HGKTIs7xgatnXSFUkCGGyB5gpvAE7ugkGCe92atnsWM4jOCgQD4
         oqe/yuuMzGBewwwYDy/SE1Vbu70hkfBuMIF0nhVh6Q771/gG0PtnhjesQie80/fA1x0v
         3DcD6ONxRwvFkYilQxflVZkZA1DFNGSuLr474dkm7noT3ndz811bYVrNBPx2WAPFfoR1
         jKACFdvjDzqcx6L2mk4Y445Yom4kRklpFevjd7xwLZGXPhoi+C5YKsjqTdgnBH6yO03n
         34kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715695602; x=1716300402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGdJzkhuCxnkLBMNdqLMl/fKj8tcfr0PaXQonc/7x3M=;
        b=Qxb0nMQ+tvEEM8V83bnFYy0IkOjM9/AVBgMsGOebpq0XAQ9EbCZ+yf/Drcv1iygM6/
         eHxtkX66nN7XmUZ4uXk2+SWSn8syA1TFlqGWQFWPsIKCTTU5ky7vX+56WQDyDNL3WAZS
         nI0kinqFVs6XWcH/L2Kerhu/C8ThWzvTsGNo480zLS/ewF4082kGKylZUyOO5XOFnNqi
         P1/kpRZiwUHOlbmM3lwWLhmXNIWUI4BfVYuMppJQewUx7yOgsrVtSSIpnSc4YDrkxpCY
         1ycLQGktP175qLTw5q6pkT/vYEfPO8Sj/mNZgz53cdBnyKM+IkQEXubyY1wqtSXbIgLT
         2tRg==
X-Forwarded-Encrypted: i=1; AJvYcCV7QUl9llVCgP3zrclXik6FZwm5lrZ+V+KZ7cEsjWBNVI32j/sP1jRv8vmzdTE/FNBCuoAtw7H+RYRqhGGx5lKMpgBUVBs4qxR6Nao=
X-Gm-Message-State: AOJu0YxqdfjbLn9YYINBgJIGi/2ls/8MZEaPvbM7bpIDVCiXC3MYrChp
	GUsuBd2BGZvFh9XFjyYtX67Z8QXmlX48npFhTgtao5p9gdLNrCFyRf+4c+6OM3w=
X-Google-Smtp-Source: AGHT+IFdM+bIIzdQSAfqavfhkAiU6DzqxmhjbqKW6BG0kor875tzdpAVmwACrmN8wRYC/fihwO1zgw==
X-Received: by 2002:adf:e6c3:0:b0:34d:9478:7d35 with SMTP id ffacd0b85a97d-35018293049mr13764831f8f.21.1715695602040;
        Tue, 14 May 2024 07:06:42 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fe1ab43casm97730945e9.1.2024.05.14.07.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 07:06:41 -0700 (PDT)
Date: Tue, 14 May 2024 16:06:39 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] media: ipu-bridge: fix error code in ipu_bridge_init()
Message-ID: <f2d48c85-9cfe-41af-ac43-d61bb1be4dc3@suswa.mountain>
References: <f468c4ac-0629-41b5-b5d1-e26f70e44800@moroto.mountain>
 <Zj5DZ4ORVfeCZSsV@smile.fi.intel.com>
 <3ba30852-cb50-497e-8968-a29d0b9a1986@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ba30852-cb50-497e-8968-a29d0b9a1986@ideasonboard.com>

On Tue, May 14, 2024 at 11:14:18AM +0100, Dan Scally wrote:
> Hello
> 
> On 10/05/2024 16:55, Andy Shevchenko wrote:
> > On Fri, May 10, 2024 at 06:43:31PM +0300, Dan Carpenter wrote:
> > > Return -EINVAL if "bridge->n_sensors == 0".  Don't return success.
> > LGTM, but I leave the main Q "Is it really the error case?" to the maintainers.
> > I would imagine the use case where either from the following may happen:
> > 1) the sensors are all new and not listed as supported;
> > 2) there no sensors connected for real.
> > 
> > In both cases I don't see this as a critical error that we can't enumerate
> > the bridge itself.
> > 
> I have no strong feelings on this really. The CIO2 driver, before the bridge
> was a thing, didn't treat a lack of connected endpoints as an error case and
> still completed probe if the cio2_parse_firmware() function doesn't find any
> connected endpoints...but perhaps it should have behaved this way all along.
> Is there value in having the cio2 device probed, but useless? I can't think
> of any at the moment.
> 
> 
> The patch contents themselves look good to me.

Let's just leave it as-is if everyone is happy with the current
behavior.  When someone complains, we'll fix it.

regards,
dan carpenter

