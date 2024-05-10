Return-Path: <linux-media+bounces-11333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C8E8C27BD
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AC5F1C21D01
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93492171E57;
	Fri, 10 May 2024 15:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="faBOMB8o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A2171E45
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715354864; cv=none; b=OhlWYnVNM1uDISf2UoBeKlKQFHoNQCnFjg/l4IwzvbRR4t4Q06Gzu8AoemzJtdM4IJcLBYlAkRTLrZaLlOJvtuEzqf8l9zVKxQISWoVBYTPR0XlpizHFnw0yauXv9B3+UAParS5qM1lvSXZvyqMIVm4MbbVgDAsE5PSy2Rs8i8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715354864; c=relaxed/simple;
	bh=Jzdc2H2hNULa1a9dJybZhyaGjAWp+NC8/yUTJ8Z3H5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAZflcr487HSxwP3FfAuNkdGeZXksVCDA0RD2tgrEPSOFUCOZnl8bDpetxaYWO5jK2tCIV9nbh94pbqLgInQpD+Bn88u0ZxOoZz7EraoBIELYIYPhKTGnfLIbpywUZB/P/ceUdUS+tMjZUbeENsRuTfWFW5/cH3SxLYzjRcyg78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=faBOMB8o; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51fb14816f6so2688762e87.0
        for <linux-media@vger.kernel.org>; Fri, 10 May 2024 08:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715354854; x=1715959654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a5FOttH9EQLp2QP0x59iAJre7V/D35J8XRWRgV60AP8=;
        b=faBOMB8o6QE81pOcKmx0/FRnSBMxxpDIhA0Wq/pd5m8P6lNAVaMjIL6AD0jAFA6FHS
         hiP6IcpyjBUdLL0qg6Bd3liXJ8yZrUpQba38xyf3jXZ15YWgtjH35imQPJJOItmXXb88
         UHW5TRX0b3HtZPDNBIcn5GKMYC01FUfXdpKdZ4qRMR7yrH93LALT369PYJF4nvsSvatX
         mvt2bCzP6Td172qdgBNG1Q92K0Di4rORIWuCi0Ea2ox4iXhJJhT7NmIVEAWkcGDOoa7P
         Rr1t5ObpwJ/egOVxY2cVbQU8510scxMk1xS+MRY60A1u4EJaYp48+v/Y0WJCG3DpgWGi
         HoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715354854; x=1715959654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5FOttH9EQLp2QP0x59iAJre7V/D35J8XRWRgV60AP8=;
        b=LJDGpy0dLqi1BLZ5Z+JcaXbbac3sfZeBKG81rG+1T/S4F0U8K8CmrE25dUa9Cqha8Q
         0CWMus8PYLQhchXOTOlvj20WVnRZ71tqPWFmYIousti8jqYncu6fjyCxv7KEwNtSjn8E
         wjiFJ8krw6Ng8NsbbchhMDVGZF5GrS6g6DYcKLeo1PTFi3Gf/OyX9DjPN5qHp3N6+W0d
         ofh+OQlf4Gq5+rD1ruZ4/RabC5q8wYF2xVv7wvjTsBLSb7BJcmgIrnU5gZwZsEwuY1hx
         53mjwR3bSshcOhLJHQXzYgf+e1cWo61XeA9Dnfb72tXVAQvM+eHtf5/rhhHW37snbXZz
         OPFw==
X-Forwarded-Encrypted: i=1; AJvYcCVUp8GhpIOwJk3FzOV3tQDfG9Dmcl0lSzxjhIN3FacYSV8XAXfT99AILnt1FwEW8OwncUBWC9NqE+iUP9jKO7sn0ZKbewiJ+NjpCiE=
X-Gm-Message-State: AOJu0YzHP6CsQzdXrlQbtDD1uHVSMkxfA97YJ+oEMAwg0OUX99GEFrf+
	au+Xl84n/9/PpyI8fz8HZ0TFN8t9IPJCJuQ+kTjYr3ehQf9wwqJQ1Nyv6hNbhQM=
X-Google-Smtp-Source: AGHT+IEMgujKR3JXFlI9/r1eu8jHtRxxNrK/qiE+3cimxYuBLDPv4NYPwk0taMgIyW3VjMHaTPlVFA==
X-Received: by 2002:a19:a40f:0:b0:522:f6:9268 with SMTP id 2adb3069b0e04-5220fc7eed8mr1735865e87.31.1715354853669;
        Fri, 10 May 2024 08:27:33 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d553sm195973166b.43.2024.05.10.08.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 08:27:33 -0700 (PDT)
Date: Fri, 10 May 2024 18:27:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: fix error code in ipu_bridge_init()
Message-ID: <4ade89f8-cbd3-4dbf-81fb-0e9a4269dc0f@moroto.mountain>
References: <71dad56e-0e2f-48ba-90bc-75096112a1ba@moroto.mountain>
 <Zj46vpwTbfde4YX2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zj46vpwTbfde4YX2@smile.fi.intel.com>

On Fri, May 10, 2024 at 06:18:22PM +0300, Andy Shevchenko wrote:
> On Fri, May 10, 2024 at 06:10:37PM +0300, Dan Carpenter wrote:
> > Return -EINVAL if "bridge->n_sensors == 0".  Don't return success.
> 
> ...
> 
> >  	ret = ipu_bridge_connect_sensors(bridge);
> > -	if (ret || bridge->n_sensors == 0)
> > +	if (ret || bridge->n_sensors == 0) {
> > +		ret = ret ?: -EINVAL;
> >  		goto err_unregister_ipu;
> > +	}
> 
> I would split:
> 
> 	ret = ipu_bridge_connect_sensors(bridge);
> 	if (ret)
> 		goto err_unregister_ipu;
> 
> 	if (bridge->n_sensors == 0) {
> 		ret = -EINVAL;
> 		goto err_unregister_ipu;
> 	}

It's always hard to know which way to go on these...  I wrote it that
way in my first draft.  It's my prefered way as well but not everyone
agrees.  I'll resend.

regards,
dan carpenter


