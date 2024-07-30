Return-Path: <linux-media+bounces-15577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D17B941492
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 16:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCB16284315
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 14:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A171A257B;
	Tue, 30 Jul 2024 14:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sE8Z1CiU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF6319DF41
	for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 14:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722350598; cv=none; b=WAI6xkgKdEg9+aFxo9I3BUwMxnsQxZRo/ZknNnOBDa0V1b97P6DkGX4wrVOLG1ItxXKu6Ep60lgPPfzsaqw0PZjeF3XbcFCdCUVu7eL+Kk5tMzlJ/b4WclD08xKzLkITQLIlV7ERzciY6GKZRuY6T+/oU9PG7r89cqHBr7IIGPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722350598; c=relaxed/simple;
	bh=Om4ERC7VqqlNP0k+2cruuobLicBrUelIiNGiFuwCyTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeGnlqyVuJIT//aMqvFCbPBahk/FJ+frx8I60T4YhxexT2tVh7HJ/Yvu6lN9L4tsg9DPd6XTRrsmiK2dF19rox1fv+ZyIWbFsu2lqgm45IViotMg+LsQjuLZt4iJDWTMx6UGg1WMAwJ89UJF5lDKe+HXASNXfhMa1pCwfI0htjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sE8Z1CiU; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3db16129143so2701218b6e.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 07:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722350595; x=1722955395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NYaUiMVR737+a9vHy0nK52dupPoGOgPRjQey1WHJB1Q=;
        b=sE8Z1CiUHRLgAk7Z7ZsQAm5++lc8vBaUdfHZGTogWiW9031y/c0Awdt4vrI+O4tXul
         dSSamMU5HVUwGplA99IPnfEMotceRj2QfHOS8LwTf2gzW/fwwj5kSY0mXQ8A0qezNDq9
         qaPnoF6546ypFzkEY8eQ7u10pxZR7cUKC+ceZXQy+l4RxyYOC4/jDwZU0j1tLZL/CA/A
         rEuwIKDAvq28pkzjpUmhOpHghMDTADyezOhQgq8w8boz5vzWcegTBOKLBS/0fsaaehBj
         t5xJ3kl+goLGdALsv603wEDVbfwjw7sz1rZ1/OLqXDorPHTVDWvHzCJ6y87/xqq0TI09
         o+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722350595; x=1722955395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYaUiMVR737+a9vHy0nK52dupPoGOgPRjQey1WHJB1Q=;
        b=QWjkqB9A9i/Y9vVh2grWFPYzgIy62nGgTFS4GDOT0m5W2As3sORh3+f9SpybzTAqXy
         TgGitcJm0XVOp903YHDid7vmXEzLLK9A45cZCutPaI50vXJ7LoTlgn7Z8m11RISPngbB
         niadjdeXtA+HMm+OnwirVcMnBlwd2xf9KNI/FTbmdDigGku7ZnaiujnT0yJOFv4wEWOC
         fQ/DFFZzCf5Kyp7FkntonVSJJISlhGsGwaqVdPjq066uz5xjWaYdR7I/v/SXbxFkOkpy
         TrXDQc03kAJHxPbgywcIiUFEvBgbrOciwwGG+e399dHI4X8OfZ0QbvQzdyQWOAEPLS1y
         /JWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuzsymI32m7TJCnyuBxEvT4kGFGvZHP7O5l37ZaGEcXv8Ky0l3wrbqVWxVjsr/b1fdPhFSZzxyI2TmLO4rpkfJ9Qr2TDay/4G0sos=
X-Gm-Message-State: AOJu0YyvoAt8Ffb1o5548mWEU3KAvA6DBkcxkoxMuxJH91/KyCqTbeEm
	u/iDsFRGE3719cvw9pVz7gyatSWMMf+ziAHXxHKaMxrxhINneCaNFwOXcEdYK8k=
X-Google-Smtp-Source: AGHT+IGuXBra4zsWnYNWnRqLnedt26KvTmSvT/pDGfaLXeIuq/5uIHAg5xLd8VXHkdc4QWOhhHUs2Q==
X-Received: by 2002:a05:6808:1289:b0:3d5:4256:26d4 with SMTP id 5614622812f47-3db2389c6ffmr17162599b6e.7.1722350594816;
        Tue, 30 Jul 2024 07:43:14 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db417ed7e2sm303408b6e.8.2024.07.30.07.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 07:43:14 -0700 (PDT)
Date: Tue, 30 Jul 2024 09:43:12 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Whitton <spwhitton@spwhitton.name>
Cc: ~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Add parentheses around macro
 definitions
Message-ID: <f702d0b7-e316-4190-876c-1398f0ddcd6a@suswa.mountain>
References: <20240730062348.46205-2-spwhitton@spwhitton.name>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730062348.46205-2-spwhitton@spwhitton.name>

On Tue, Jul 30, 2024 at 03:23:45PM +0900, Sean Whitton wrote:
> Fix checkpatch error
> "ERROR: Macros with complex values should be enclosed in parentheses"
> at hive_isp_css_include/sp.h:41, hive_isp_css_include/sp.h:42.
> 
> Signed-off-by: Sean Whitton <spwhitton@spwhitton.name>
> ---
>  drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> This is my first Linux kernel patch, from Helen Koike's DebConf24 workshop.
> Thanks!
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h
> index a7d00c7bb8bc..128109afe842 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h
> @@ -38,8 +38,8 @@
>  #define STORAGE_CLASS_SP_C
>  #include "sp_public.h"
>  #else  /* __INLINE_SP__ */
> -#define STORAGE_CLASS_SP_H static inline
> -#define STORAGE_CLASS_SP_C static inline
> +#define STORAGE_CLASS_SP_H (static inline)
> +#define STORAGE_CLASS_SP_C (static inline)

This must be dead code, otherwise it would break the build.  I'm not
sure what's going on with this header file.  Anyway this patch isn't
correct.

regards,
dan carpenter


