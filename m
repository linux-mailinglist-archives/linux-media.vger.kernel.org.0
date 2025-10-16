Return-Path: <linux-media+bounces-44693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D46BE226B
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 10:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C27B19A43D2
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 08:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93291306486;
	Thu, 16 Oct 2025 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ld5TFyr0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E44B3054E9
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760603371; cv=none; b=exut8XD0zizhLF8ehjvVqXJI31ecbW0sX93EX8xnGLDntzcLZ1UkZ5lP/NTNb2jcGnovGpirXmFA8tqd6MQqtZLcGOeBfhAkICTy8t7PxCeU+CitN2T/MYVHHKy3wN0ppoS6IE2F5ABDE8e3JBh4P/JoHZ4DLoc6TEbANhvXNMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760603371; c=relaxed/simple;
	bh=9JOoUMFhgNnGPedn7kv5aFcOGzX7s5ZjeQMGkOhttnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWuHWVA5cOVk/iPAgx0CTw+QHvjXN1EbARV5HEQfhCE0ZozW6sXYJwgfp7NSQnxgL/oJyyupgTPVGM8wjzjQ4EM7uvxZ+BacmAY348c+C6ygQkYIy8U/GTgqRiaQdFcFhYg4Ruezr78b9yOQ/rZza6C9lwdsm2+SaOhiWZP9KqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ld5TFyr0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47106fc51faso5086685e9.0
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 01:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760603367; x=1761208167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8kMfev7DDm4VOEq/jumgd6CmRXsR+Xm8T/KYoNhUiZQ=;
        b=Ld5TFyr0ByvrTPQIOgyw7dV+NvVt6INdhT961Alz43r50uxp1bC3wIYhXAE27fSJMq
         JgW5P83wOjB+ZbGiyhQWepM8wQd09k19rYmhFFxuvLsJTAeq+DK9PFZiMfLTD0e0sEp0
         P9T049fF7vFtohS9phvC/wNvb8FUtYZez8uoB7/6+RdSzxxMAsIrme7w+4JmcLtzwpth
         KgIZXmmO/aNuwRVTP9jFzxCkvUS0kbYYZsTHhKAcHmf+Du8ndv/cvP0LXQFYGPU9L75L
         5psQzIEZgQsfEHbvHv0tRJiNI+onrjrQ5vLaBdbSmgVHKHps9ZuQbYLjdQ+K072JNMuL
         nbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760603367; x=1761208167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kMfev7DDm4VOEq/jumgd6CmRXsR+Xm8T/KYoNhUiZQ=;
        b=pWfhV/3cqc0THzETzBxQd49ja63JEgQUqgcbNCQVOKEOE8ttz55KCHu3fJy34k/aSj
         LuP+XJghUgt4yltJ2a49ZyYp2t5UV7RMci93uSHr/U3/lgWxb5Uu1HeqbN7hgq67bFT4
         zBivEMbHcaOnBVeWK9MSbgozacMZWvsraHrqcnMnGBZRxVEC/aJiNJSZpaRNtRD5MGSz
         MSNvQU0aq/8ckAv+G5hN8iYhKPfb630JWosOai9Syt3uI5LhKRBmlwfaQHyM29l/wYaj
         H8EaL+OpeySD/j+5wr/iKeCFqabiwYJtRLPAFYRjmT7i/CSjje+sUHQIjjennNVpPHh9
         0J1A==
X-Forwarded-Encrypted: i=1; AJvYcCVxe3YXuQb4OpwuCMgkQ0zjlIqHfLt3oBWXvGBpeltVYTSMYQabhG8Hpyse2zOeGqybdsxyKpIArIW1Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyni/MDrQXaVMBsAtBw/XoLkUM0PNk/BAmM5BsTHovHLSmDfdGR
	zmh+VixgJ3yeXfSnaCOtKrzp3DYO6mPGuLnjyL6Uk/Fr6UE5uuQuFRPQ7EWGj8LjM1w=
X-Gm-Gg: ASbGnctTkQE0mOMFsdGeTmM5uBs1Pt+uGpQ0H9dGgIQFtJkWHquIC55Ko0+Z3EMbOsC
	AtT3wsKzB2XwLgD/luaIjGI9vd/b8wPCan2DKuV3g2QxXPPPw8RE21SUBP4B5CvvLLeuleLqJSe
	abIdAc7Ho+qDxqVOOhNUbpe8E1RE8zJTTXu0rlw4WeeeL+RwyP3H2PVMNvMzfCpFghtoigMqldo
	wKv7GxsiALi8UYkwFFZy9omdIHhL36LjESNysMjbYS8GI3srA7FA39YmKtwm/Hy92rFkC6yS6T8
	szgqSCOgavtXsVaX4wvcjsVclwdXgY4BsPUunuHHkpKOtyUB/PzGjmsFGLyV4B2sKYNBuaTFvT1
	joTtBSLc4A2M0JSSH+Xgc8QDajWuKbzlgieoJ3DCHkhvWU09EKyMGUUyCYjFCuWh8rHezqlZoYj
	nWGKuqxbiDow==
X-Google-Smtp-Source: AGHT+IGZjsa7dfp8e3lVecjUuNkxllCZC43VnIqLC6XRhXfFkJy9Blr/ePCheVa30hu5566PwlB3cw==
X-Received: by 2002:a05:600c:1990:b0:46e:1b89:77f1 with SMTP id 5b1f17b1804b1-46fa9aa1c74mr212566865e9.9.1760603367525;
        Thu, 16 Oct 2025 01:29:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4711441f6afsm12366285e9.1.2025.10.16.01.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:29:27 -0700 (PDT)
Date: Thu, 16 Oct 2025 11:29:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-sparse@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH] builtin: implement __builtin_strlen() for constants
Message-ID: <aPCs46Sno0a4dsyK@stanley.mountain>
References: <aO-cvXncl7dbnP_J@stanley.mountain>
 <CAHk-=wgKcf_dP0_7yTqL+JKc03mhFgqFHkN7jXLUrOy=WjWZUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgKcf_dP0_7yTqL+JKc03mhFgqFHkN7jXLUrOy=WjWZUA@mail.gmail.com>

On Wed, Oct 15, 2025 at 08:13:51AM -0700, Linus Torvalds wrote:
> So you should add a
> 
>     #include <string.h>
> 
> at the top, and do something like
> 
> -       expr->value = arg->string->length - 1;
> +       expr->value = strlen(arg->string->data);
> 
> in there instead, because constant strings can have embedded NUL characters.
> 
>            Linus

Ah.  Thanks.

regards,
dan carpenter

