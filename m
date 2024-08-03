Return-Path: <linux-media+bounces-15738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8053194676C
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 06:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C1A91F213DE
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 04:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E12770F5;
	Sat,  3 Aug 2024 04:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXMBpSqG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD894AD4B
	for <linux-media@vger.kernel.org>; Sat,  3 Aug 2024 04:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722659328; cv=none; b=sHLM97Hg8m8BpPd6GFBFpXZ8nBjPN/SNWH9LwiHuSaZiJLzlL75YS7b/dRVob9W6JgymcSONtIsGlkMSzypHPnnRs2ATtDJQ0JiPgzkMzv0YHG77/vZ7kDaWHAE62I7UJa4NEtvi81+2g/kz4jU9LyfEpeny6jeeXbFAqIwsTwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722659328; c=relaxed/simple;
	bh=A0FigfRcdI5TmtnLIowXNHNmseW9E6VQpT3GSq9/Ec4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHRxGHrxGJF8A75xhuB4Ujm3Tt4AApqwKaazWm1H/GMoYlvdghLwxyLQwaxnCu53kNVJkr6yQJz7WZpvlaNxirx8E6Hlx/xmPeyhQ0KMHq8S64vkiptsfOUT5B1NU83VOG+rUv3IcpLx/91547LqMAMQXJfjI9w0kdIkyu+ydjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXMBpSqG; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-260e1b5576aso5569561fac.1
        for <linux-media@vger.kernel.org>; Fri, 02 Aug 2024 21:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722659326; x=1723264126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rzn92C1AHPPlWzjTKcidqRR6Rxvggoz6sIIwczUKFlg=;
        b=zXMBpSqG3EtonY7DXYXLqGTPmU1d8C3PBmSdRNu43BSuunbKc2VdNnARnkMhibigYh
         HPNQiQxbN3VR9zutxDq2gTh3Nqlh1UGkr485JmTzc2FO4Ngaod07IzQ9f8i09D7WhGav
         AF+vfoVQdXEwGVU7YTyHVXg+1LwOro4a5DhTFF3H2YtvEX4Wb3RsJDFdEFnQ28IetKeT
         wn6DdyklbZSA4a8WuPtHrFdagZKJDmpMI+DUoAHa8gNkiqy8nG+8HoKIp36OyD8Z52Pj
         6JF9TlN82dnJ4bfOxAVA7WIfl7rEr4PJLOBsbbVGc15jjocvAXSkI0qAtuKi/fdOAkmm
         6YGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722659326; x=1723264126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rzn92C1AHPPlWzjTKcidqRR6Rxvggoz6sIIwczUKFlg=;
        b=c6D4IHRAPcAkqHgcNQ6OFOlD9/zRObl9lnN5/KiUVFwd5S5jYeMsfYXEgIGmAVZTvm
         /LvGmuDLtHVgnip53/PY+3PF91vBbTzSmxhwm+EetV3HTkFcqWo6eEeJ8QDVtLLLGQHe
         PFnlmIg2fMlCr1zzugzA5/04ximeu7GZWLebTs8u6BBtKn5GBJuDSXcqXmH5cBZU+niJ
         VtOl4RD5iKq2w2blPC4BxT8X5LGQASXNNeetuKlY6o08ocWpRTCx1WtO8BO5zel8ixIK
         I/43GtGf/LMX604JkrX3XxQEVorz+ueWINU5kIHjuEjU81BQPodgA6fJIxLoVw0AmHNv
         eL2A==
X-Forwarded-Encrypted: i=1; AJvYcCX5PkVhl+r94w9KfgnmEf66wyN3bEuBuuiVLXNYfWIdqnqYxRp5faavC2o4ojFFUm9OcuP3Ewf7c29eQg4+uTWdCSRKJJS5ZrXQ80Y=
X-Gm-Message-State: AOJu0YxtUegSHAXft1tY6l+GrYLatOiBG3X+SUL3KJJgFLEmmICuIyOy
	2Pm7oACYAd1KnpF6pGcSqg78z+J1xG4JlMtFMsZVnvCxVeeTPRx0ynlO5S785Og=
X-Google-Smtp-Source: AGHT+IHxWS3iNqvAAzqLqQWuBAFRbxKqLawxiRW8lxpchWWctf2N+xj8WDxTH2k/CshLA+HBc83npQ==
X-Received: by 2002:a05:6870:3314:b0:260:f054:7774 with SMTP id 586e51a60fabf-26891d3cb1dmr7021954fac.13.1722659325803;
        Fri, 02 Aug 2024 21:28:45 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2689a2a826asm790540fac.8.2024.08.02.21.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 21:28:45 -0700 (PDT)
Date: Fri, 2 Aug 2024 23:28:43 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Whitton <spwhitton@spwhitton.name>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Add parentheses around macro
 definitions
Message-ID: <8d383b9d-d029-4706-91c5-9623fddf5df3@suswa.mountain>
References: <20240730062348.46205-2-spwhitton@spwhitton.name>
 <2024073020-reload-vanquish-f937@gregkh>
 <87v80i475p.fsf@melete.silentflame.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v80i475p.fsf@melete.silentflame.com>

On Sat, Aug 03, 2024 at 11:28:02AM +0800, Sean Whitton wrote:
> Hello,
> 
> On Tue 30 Jul 2024 at 08:38am +02, Greg Kroah-Hartman wrote:
> 
> > This isn't a "complex values", and really should just be removed
> > entirely and use the correct "static inline" properly.
> 
> I found that there are several headers in
> atomisp/pci/hive_isp_css_include which have this pattern of defining an
> _INLINE_*_ preprocessor constant, and using it to choose between
> 'extern' and 'static inline' in each file where the header is included.
> 
> I don't know what the author's intention was.  Are you saying that you
> think this preprocessor mechanism should just be replaced with
> hardcoding 'extern' or 'static inline' in each file which includes one
> of these headers?

*You* need to figure out what the proper thing is.  Not us.  That's the
difficult part of writing a patch.  Once you know what the correct thing
is, then the rest is just typing.

That business of defining STORAGE_CLASS_SP_C is weird.  Figure out the
authors intention and find a better way to do it.

Figure out why your code compiled as well because putting parentheses
around (static inline) is a syntax error.

regards,
dan carpenter


