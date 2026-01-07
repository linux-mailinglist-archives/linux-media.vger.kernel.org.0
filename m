Return-Path: <linux-media+bounces-50148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0198CCFEB63
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 16:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C46453065E28
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 15:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC838334692;
	Wed,  7 Jan 2026 14:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BZtTwTaC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B024A332ED1
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795730; cv=none; b=TALMXCeTCby2Sm+//d+Bwbd/KvOiLgumpQGJjPlq6mBFBaC09kMBmNuK9LFWK6HpIT76EeCZX1yxiwzGHOc9BECssjIlz5Dwt6USf1B2F5Qzv4JshjiA4G1NzWKNppjKPCfNOnD0cA+yAkktOa5EWsKRdv7a4AHYQ6ZM0zZPJ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795730; c=relaxed/simple;
	bh=0U9koCOJzgH9JvfmV6YnkoehTxq2ubIy486JlKUz+Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8MEuiyC0MiM5GPfT+TOxcBOqZjcEm5NWH9TTY7gaAIFhP2PLzTAKMjg3PoO79dTW07mc2I47yWyIRH2W9XPl4ZnRKQtnGoVhk4GMtBOzHs6UQg4lnOyegI/KPVOhfiBGsDeAli42pz6TueZ1Pdy5EzSrdU/3Iq2Rus0u0M94uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BZtTwTaC; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-432777da980so1144291f8f.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 06:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767795727; x=1768400527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOW2y+VKVeFQcfSJXk3+EmObS/JtRwV2ILjhb679FFA=;
        b=BZtTwTaCPYKN4U1ENrTg4NY7bqn4GtsEg59zPMvRl88uj+UDjB4cukY8HoOvcttVdi
         rDn+TAbKVcmdp+bm23AoqHSC9j9EDsTSmfSHKqnaDKzp1ennDNux6SDOQ9EDlXQS3k+i
         3sSTdu7pONZ7AtA+MCks4m+d40YPl7jI7vr3EAeGgulCOa264tHaxaOYb2971CZX/g3Z
         djQdb3KqljT3iSP9VxeVfummGeOpzZBx8cjcH794WmUQtcjIWHhmPOhvXaFOfhbhjvCY
         9dg1U/XrXTbgO0DCm/onRieAUGHp/oKqXrx1sEITkkuFCbUKndWz361facKz6a3HC5rw
         evrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795727; x=1768400527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOW2y+VKVeFQcfSJXk3+EmObS/JtRwV2ILjhb679FFA=;
        b=Te4jF91F8CseEasVo7rAajbkuaYgYorD7bwqV32bka0tNOLBkRaab5pVvmjU4AkJT3
         gXy1xDQ5eh4A4YmoNOqnzPLa4nqGPJlcSdQ1/84NYwLhv6vK1SWntqSiCE7l+QkbPT0i
         zYmaTSyvKA5AxKXEqWhkBtbBA+YHtLP1apF3DhDPOvnK6UuOuVFb21Z7rTjBBFjeJFK1
         aq5mnJa30RAYY2IFV/TSkHDh+hRoM3NwnY+vquGlaT9pe/YstomjbHSC49DIHXTu+MEQ
         zRSq7eQ4J9mX8wl//kNlT7bye4Kds4awzOXk1bcLgTXGo/aSeVLvgGITSz+6J3HP/hdi
         XQCg==
X-Forwarded-Encrypted: i=1; AJvYcCX1kw9Zpxdl9rP7Cxq/gJs9Jl+jl071fx/FCjoIjThmOzb224j8/EQlMi/I6ftyMuwPhj/8HP+pTSv1Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQkBv3+X0oNFEMrGh2awzj+DXVUp2PCn3iG+sjmaeWgLwns7L/
	iBYP6jQofdCOo6ltvLrYjwUni+C2MCdgjvic02xBNC9/7kwrc2QIAY5fcgO/ZQl7DDs=
X-Gm-Gg: AY/fxX67gCJaOwL1C50H/ut1UiWx+Ndoy6QFq3zPIztkzr4p2TC+FFHVx/6UjWFQZMf
	dwU69uyKwzC1Zv0Vo8SBwEM20sFijtRBnBe+hzF+awSMwtAKPEnP8ep2Z94Oy0uslnK0Gth8R32
	BW2aRssFu2YcX16QDPCkvAx89/kJLqoGSoAXvkkrtomGRaT+JAOt4uHPm17fHm2RxCMCh8ficZ4
	7mLy2bsorzTPKNX9cnxNcsm8bf1M1OM6ctCW6uD86YJgfL8tyMG3Na46Qp66R2t5I9lMNhPmyM1
	n8QaHzCZgCtPfSMNvD3VQjsOyeHH0uhD4oyoTs+ZSpuosLhDvT77ylj/TkroMFxiKmUhTrUPWXY
	8nnNHu/26CtXVS9ZcznnenSEAFhMJ67pMO0H/fsEYgrZPKNCJ7n9kXeKl+T2Hi4nxUDKqrpWTmD
	4j/agRWYJhCY90gLHf
X-Google-Smtp-Source: AGHT+IFJwknu9uPiQ2jlGnRv7HuAdmdncQ8NphWGfQ7jlTeHbYr70BvYEzG8mcTbKTU43DrbU8ZoXw==
X-Received: by 2002:a05:6000:2204:b0:430:ff41:5c87 with SMTP id ffacd0b85a97d-432c3775a44mr3337365f8f.60.1767795726838;
        Wed, 07 Jan 2026 06:22:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dad8bsm10912638f8f.8.2026.01.07.06.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:22:06 -0800 (PST)
Date: Wed, 7 Jan 2026 17:22:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikey D Kadati <karthikey3608@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 0/3] media: atomisp: refactoring and fixes for
 V4L2 compliance
Message-ID: <aV5sC_udoJ3qdjBD@stanley.mountain>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260107134844.68074-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107134844.68074-1-karthikey3608@gmail.com>

When you're sending v2, it's better to just start a new thread.  We stopped
sending them as a reply years ago.  It makes threads too confusing.

On Wed, Jan 07, 2026 at 07:18:41PM +0530, Karthikey D Kadati wrote:
> This patch series addresses maintainer feedback and fixes build errors
> in the atomisp driver.
> 
> Patch 1: Standardizes the 'Bridge' structs significantly by using v4l2_rect instead of custom shadow structs and aligning ia_css_region members with V4L2 conventions.
> Patch 2: Introduces a helper function for statistics buffer allocation to reduce code duplication and centralize error handling logic.
> Patch 3: Adds missing error propagation for IRQ enable and XNR configuration to improve robustness.
> 

Please line wrap your emails at 72 characters.

regards,
dan carpenter


