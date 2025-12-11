Return-Path: <linux-media+bounces-48618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BEDCB519C
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 09:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C15F530019EF
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 08:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE9F29AAF8;
	Thu, 11 Dec 2025 08:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eAt4k5n+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5021E9B0B
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 08:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765441740; cv=none; b=c5N86ZgKYNmZVi9mbwD1OJjIYuA81x8YRaiwkHem6Xy6USXANEHA8RWShFmocDddfQDtqeyeHIhBka4fDxVfpUFUVzstWQr3KUavPjd6iFtzSZYIgisBtOopDHFNCe8ek0tViux5uQqKd+WQdAU+rSmrhhwqzuU6nEz7m0WmGuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765441740; c=relaxed/simple;
	bh=djjr9+IAia3N6sWGx6zJjpQoQTmY5N42PCLnoR0yZyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jc9Xr/lhnAP0O8XX1yoQgaHzR5G61Z7P5pJcUfu83Z/T8RUk5KNEu4wLWAdjrEFGoowVPjQsVGAUELyWFZbhCyXVhxUEwqrCfBfefLqawzkhnQ9qZA19HRHCUcWsakg4/tgfWvcqzNk5vCcjVs+Fhm/36mmimktBOWQ8Jt88DQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eAt4k5n+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42f9ece6387so234109f8f.0
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 00:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765441737; x=1766046537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yhOVP0Qk4QJBwZMBL87OrBgZcGud1+QQm5cvOUQeo/M=;
        b=eAt4k5n+JRFJwicM+0Uo0KHutKyRY0bQJjO05nR/ESPLuWWFqbkc0hUWLV3zQ+5qAr
         2TFUzA6fVtW9aI95GWe3BtMRSZRgNBYSujxuoy7B8C3+sSzS8ztL0DoM9kFyo0PAr5R/
         88ex/FKdoaAr/cSz0dyPBE9g27mKszTX15Xdl9pQKWA8Mg4Sn9GwWR/WS9MLFfzpSYi2
         hC4vC7iY8gxQhPmUuomMTbMPv/naRJKbelNVtVf1ymvKTAt9I3doic4yihYRmJe8BSKa
         PKccPg3o/5rhA8zmzLwZnmcWANb38sesxBaJkBN+XLK1h34HjOtlMFVkcJT4AU/2j0oF
         fSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765441737; x=1766046537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhOVP0Qk4QJBwZMBL87OrBgZcGud1+QQm5cvOUQeo/M=;
        b=khvAuS2/zZ+JIuMSJ0c3l8TIaaDjhKl+zUVcxVSsoSJAFgsS5aJP5/oAD+c8vj41+Z
         XsInoEGhUO8art66U99cNm1uN3VyXZeZOWkhtG8AdQraO5YAUVBzwyXReiPW80vAJT3p
         oeGNu9jnK9+JMZIkMfSVkyYSoZefBlDFGtZ6h4FN+sjRYvAw0QwRobjRfWYtHxKx46at
         smzQTAOhdIdCf/CAuXnThlcevXIZ8Yx7N44wcc4DKKtsXEN4JTVTja0yTik8effNtr9e
         V7fQ3VQ+RmgrYwwX8xIvLdL2ByDFCpDzsrhgm0Jp8x9nuPaxy07+IgK33Jcv4DhtfS5I
         8J3A==
X-Forwarded-Encrypted: i=1; AJvYcCWeE9wAs7qHDZpUk1t2cuG1ErvGp2hSsCz0H5uo0IUqjIMBFWbosQS1AYF+2tC50DkdfqGgsaxhdfroew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoqwQ9cvCuJ30BGMmxPxyTt0bA46P0q0yfLj9G7BlOCx412jC7
	dkXgCsNTLB54WNfpk2f6u4UvPfWdnU3hc8PfMZWye5e0WrwLvbyKL/YIWRCIRrKT/Ss=
X-Gm-Gg: AY/fxX7ObAXhF4pgqcZmtm10EvCedr7LJ56hL8i+IweQtjfI9tPEpMpBrspbpgfe1wn
	jA4BIa2M1QLw5xUm9YqsrYCNhFHM0pMyjWnOLkHagz04PBnqrDUL3nal8X3fYkIE72fw7GEEx3Y
	+jTb/HD2JjUi1twX6isEhU3WAYBKCESQfRw6cixH0B7DfSBPSK5gEAaHGlIWP2ueJAWa4zUNCTw
	LlWI2Zc3SGwqVtnIdAiMvOBnHyk5P5JNqfJYgz303o69XEZiyAKlP3B4E1kGQfJMH1Acf9qCeLS
	OaYDSQAHR4nw/GDYmGP5Z8O8iAJsKiG+zJfw5yRZ+Pky2/w6foJvECmoY+2s97Zbu7Psd1Wno4h
	JA1MvwLF4kWxSghGDwG11laLavz9ybI43rZFdG21m+Jt1ByilyM5EIJDokOHLDuD/1VKptIf+7Z
	CjX5TYd31YfpfuA+o5
X-Google-Smtp-Source: AGHT+IFgxdBy65p84fy65/fyiYE3miPmWBnt1+Te9NK6eCwaQurMoPZNR3/Cq1AwdP418CtOTItATQ==
X-Received: by 2002:a05:6000:2309:b0:429:c711:22d8 with SMTP id ffacd0b85a97d-42fa39d2ef1mr5723924f8f.15.1765441737154;
        Thu, 11 Dec 2025 00:28:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b9b1f1sm4079889f8f.39.2025.12.11.00.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:28:56 -0800 (PST)
Date: Thu, 11 Dec 2025 11:28:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Chris Li <sparse@chrisli.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, Kees Cook <kees@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <aTqAxfiVCR2ch4I5@stanley.mountain>
References: <20251008033844.work.801-kees@kernel.org>
 <20251008035938.838263-3-kees@kernel.org>
 <aTc9s210am0YqMV4@agluck-desk3>
 <20251209001139.GA7982@quark>
 <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org>
 <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aThSGiKwJRYOB6kx@agluck-desk3>
 <aThqcq0iGge1pQCr@agluck-desk3>
 <20251210010020.GA2522829@google.com>
 <aTn0WdVv-S_EpQmS@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTn0WdVv-S_EpQmS@agluck-desk3>

On Wed, Dec 10, 2025 at 02:29:45PM -0800, Luck, Tony wrote:
> > diff --git a/expand.c b/expand.c
> > index f14e7181..71221d35 100644
> > --- a/expand.c
> > +++ b/expand.c
> > @@ -535,6 +535,8 @@ static int expand_compare(struct expression *expr)
> >  			expr->taint = 0;
> >  			return 0;
> >  		}
> > +		if (left->flags & CEF_ICE && right->flags & CEF_ICE)
> > +			expr->flags |= CEF_SET_ICE;
> >  		if (simplify_cmp_binop(expr, left->ctype))
> >  			return 0;
> >  		if (simplify_float_cmp(expr, left->ctype))

I'm not an expert in the C standard, but this feels correct to me.

regards,
dan carpenter

