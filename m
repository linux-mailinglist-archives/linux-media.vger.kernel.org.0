Return-Path: <linux-media+bounces-9721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 169C38AA0F0
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 19:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A89001F22682
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 17:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE84175552;
	Thu, 18 Apr 2024 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLy+4Lpt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F628171E6C
	for <linux-media@vger.kernel.org>; Thu, 18 Apr 2024 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713460761; cv=none; b=JLF470Wx4r/8dyLk34V8M50t9tOEOZZzxLoZ4GcSfUoFD3rXMsinbbx4T96YX/WLq/KH1B6s6v0uLLn/oJpamhO+haJ6R3JR3U2z8n4C32L24Lb7HcWcJF9d1AJSbU59VP8Bn6gVMMLZQ9MEz2CDyjKRKGX6gJxiiTs2DMSO1UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713460761; c=relaxed/simple;
	bh=yROCoENx2b9yAJSMGatAYPh1hwYf8DqL0GPMYtwTMVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQdHQSQiWXX78ezRy3oFwveSH+AC2a+HUcCsSr7Vwr4LobMD9ZoBhmdhT6QT3W+v7WqH4c6IHVhOB2d2fUQWQ4B4RUbPMJ4c4sWYJBS9RyN8xtMzj3PBvNgLZA9zigR8CMrWH9lkyZ7bs5HNp9c4zRbLQSuL0Ooz8UzIDErbICk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NLy+4Lpt; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a51aac16b6eso47369666b.1
        for <linux-media@vger.kernel.org>; Thu, 18 Apr 2024 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713460758; x=1714065558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fXGa0pEP8iUBNqIHW4VCl1wGNComHip6UrWPNRc9bPA=;
        b=NLy+4LptwTJ+sVVrAsl7QDaAMMCIkfZNfPnlZ3AI8aHeahkSb7f2UpAeCkxts8RiK+
         GxxBNrPYYlGKIBRjnnfJSsRHi7S2ljRDJTFWbl0HawdXLRixFLqKYC5L9yynSsvR26IT
         yR87XL/niiHEhGGnzj+K0TRT5LrzccSb3JxHZTlMIHu1EQH3jTNe163YJYwXyI9a8kJ9
         1NqApXiH4doMCSphcDVj+vd8OQkcjz/od/4kgjIzBXNyZe1GoJ4l2j/7MfORvagFaRkg
         XEUuJVi23TJT0fzp6/f5rXD/RvVZ74DYqTyOWeZCKh3lECgSM8vu4pzV+ZBhpU4W6DDk
         j7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713460758; x=1714065558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXGa0pEP8iUBNqIHW4VCl1wGNComHip6UrWPNRc9bPA=;
        b=rWpY24JmGVel4eoPUCjPNBGop+0fCzzcQORoWuvXkzxMRQiVTjI2KDfXkXkf5o+miG
         yvI0W6p+4YUP5yIeaFPxnaWzQoWY2Jcn7loUiUYquZA7bH4/SQe+ZR5GHIgNf8BfZb1s
         3X6tE52yJb6EPYsL6C8LSvBEOgonyfLjPdxWZ/rffxikYFO/6u2P5oI4qalOCmA84Lh5
         MgJ+6FWX/tJZbfae7F+lGBlZYY4gJd0vQNcnEwggYkHoBVQieAYp4I9ANh12J1MV9xT1
         2VyZGSApjNqPm6A4scO20wqoNVsuBcD/ZvSq500V7S4xn2oi4dKxLe8zlSPD6kPs94ff
         S+ow==
X-Forwarded-Encrypted: i=1; AJvYcCW7dIaKnrxxMEgH0NCWR7BgYiS46oBPrj44EFht+QhAv1O3JMOplwFqOshxrW/2CjlExmekQpKQFWkUrsd+bynFZAYnXOVGTL216m0=
X-Gm-Message-State: AOJu0YzCjHBaBUakQwu3XDPz9RQzMTLybAhKGDEv+Sn8ZTzAsMBRVq6U
	OXzvP8RGtOi82EIC/PMl8pu9VFoGKGBQzsTZzC5gMjuA50FNoT25NI8jZiWCJJcEvdE0QYIFEOB
	T
X-Google-Smtp-Source: AGHT+IEwc41StGMMjA7NT/EcMHzsdl7Ubbyp3HEt0hPwzN/ol9BuHMjJLxAT3hzrUe7Xf/hT6lTnuQ==
X-Received: by 2002:a50:875d:0:b0:56b:829a:38e3 with SMTP id 29-20020a50875d000000b0056b829a38e3mr2946788edv.16.1713460758239;
        Thu, 18 Apr 2024 10:19:18 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id e19-20020a056402089300b0057016d010f9sm1101811edy.16.2024.04.18.10.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 10:19:17 -0700 (PDT)
Date: Thu, 18 Apr 2024 20:19:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbdjFdIHN0YWdpbmc=?= =?utf-8?Q?=3A?= media:
 starfive: Clean pad selection in isp_try_format()
Message-ID: <ea244234-38f0-4381-9c9a-b6c6076e7dcb@moroto.mountain>
References: <20240312024520.11022-1-changhuang.liang@starfivetech.com>
 <SHXPR01MB06710239B9F69E2F0EC0CB01F20EA@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SHXPR01MB06710239B9F69E2F0EC0CB01F20EA@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>

On Thu, Apr 18, 2024 at 01:27:04AM +0000, Changhuang Liang wrote:
> Hi, Hans
> 
> > The code to select isp_dev->formats[] is overly complicated.  We can just use
> > the "pad" as the index.  This will making adding new pads easier in future
> > patches.  No functional change.
> > 
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> 
> Could you please help to review this patch, thanks for your time.

Linux-media uses patchwork, so probably it was missed because it didn't
have a [PATCH] in the subject.  Just resend.

regards,
dan carpenter


