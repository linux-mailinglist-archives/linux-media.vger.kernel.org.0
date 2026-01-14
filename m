Return-Path: <linux-media+bounces-50720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9692CD20BD4
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 19:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D790F302BD0A
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 18:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726E6331A5D;
	Wed, 14 Jan 2026 18:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHI7KfR2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4204633122F
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 18:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414495; cv=none; b=dh64lVBZp4s3+4cdCzpjlMVSE9vqoYu1Ct5wD3JNY0k6BhJL6jDO1OrUBVfrEfrpewssdxZPwP/tbNCFeWzGACDJ0CLPgVEIxXUBvGo85wJBy6d0kwbmwJIvJlbpOSH1G1OWotCYH6Y+kpKBr2FR47P1l7Sxl3fZ2mRai0j70n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414495; c=relaxed/simple;
	bh=2TMISfcCRH4RqSp/8q/QKrB1RBHPgX0yGcVvka779JU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enuHd6jnO9N2NyvMe8y7l2U2GfLcQ5ISNaNsLKIiNEhxOJuCVaAOJnTrKEbmb6KvQasoghAytEfZ0mEOQvWvCBNFLMw+O9eKyvh2V750F5BQlfVnxH05Rb0a4Vb4GYMeKI3c4T3XqC/B9NcjY5AvvjgyBrwwP2jMti1VmcqLdU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHI7KfR2; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7927261a3acso481317b3.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 10:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768414493; x=1769019293; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ft4iuhqn/cPSFAeuprUPgPrV/TeO1+yAqgQXKgkSaUU=;
        b=SHI7KfR2zfJLN5XrS5ZXzNGVh4qof+u+P4NudHKI3wV8fbr8CsDjNxJ1CxiEzaMGMg
         Q5+k2964kb1hl34DxJoyEez8UPjynGKBvg+MVeBKSLm3HsKG1MPB+ZOYcDiGqKUSak+f
         xdu6IJwvW+joe3UQ2YlJxmEhqVWpI0V4mx+dZ+laNJAQfcdvuxrgbyf9ZmlKOgrUmiBP
         7pF3Xf+RGbMDwbB+D+iQfCFdyFPglvyOZH04BlweIb/R7pIdHfBtpWVG2AAxF7kLMWbe
         KaXXtZx3bnLGGY5HAUPJIKzJZ18u4dZfcgIU3DMRARD4rXTYzgJkWdYghbgH8YUOasvw
         SyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768414493; x=1769019293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ft4iuhqn/cPSFAeuprUPgPrV/TeO1+yAqgQXKgkSaUU=;
        b=GMNeaVJFh5EzoIiu71eGk2nnE+jyphdYImrZ7mNbUo9+mS4wUUwoh0hS60K/ovIW07
         GAKs2UjvueHGKUBwvZIhuKyYyzMYBju7Flp+DQ2FitwNDoyvJLFBH685fuKx/PMSVA2w
         q+NNqKbvdGQglCr5keLnVoRVAzzKzy1flHEEr/KvmrVAfARBOuaFTJPnSDUxSqtJDjeb
         nGwmhejNxIzQZmBk9iwVc9bqM2miCyuyjX/5hxotYH9PIPN7FTVXXkbrZz4uaHhIgHIb
         2mLRkQrrJ+hct5WwWA3mdQRuowUHUHPpM1NGAtE4E9dIk+ySjYghmvCvAoLfPXwHwpx1
         oeqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQmJQoBi+WFY2djRTIGTzPNftNj/oFJ0pzz9/CxrMsVsWH3Uq5CfUCau7n29Hw7KwCAp+4S3VFG7S+0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlGLCRtRneGMxRiXbfaWuvdvSQ/fFsFCAbdFTnwTrfmZuFhdY4
	u8a4IIOwPDBRVhGI/TOZv3bZoSjnZGPzBl6i1P/M9+IbJ9pBwcJlY6kIFstxt3QlcfmRcmkhJkt
	uJBfNb///iwdDI7NPO6/9lx6cP7HLY2I=
X-Gm-Gg: AY/fxX5czmbp+Qpl0VsA1QeiTzSucEruxMXgv2GGwII95w1lryzRW0j08H2AeXJ2Skl
	1eYQZkTqiYmXG7QWiiVLQxX+aD4fpYl+9/mC2kndz8UuZ5AmNrUXXAAX2b4rTsTmm/FpOfYU7In
	8PmERjjSsIoF8l6HhqDsiwdKiJSR8l+1l+oUFAn2RBxbIbpsnORe7JPnIlEBZ5JSVACI0oBrRS3
	wKOVOm4Ymm2VxgUGQrA6KMesbUCwZjeGqS31zfJxc7FBBSbtZsGOCJBLemfKCBxZjO6N4FiiQ==
X-Received: by 2002:a05:690e:190a:b0:640:c9c1:a347 with SMTP id
 956f58d0204a3-64901aacd0amr2970919d50.7.1768414493113; Wed, 14 Jan 2026
 10:14:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112102518.19926-1-karthikey3608@gmail.com> <aWTWBksLJcxg4W6f@smile.fi.intel.com>
In-Reply-To: <aWTWBksLJcxg4W6f@smile.fi.intel.com>
From: Karthikey Kadati <karthikey3608@gmail.com>
Date: Wed, 14 Jan 2026 23:44:40 +0530
X-Gm-Features: AZwV_Qjo0gCAQlj4LEUhW11V6aB_3EPi0y7yGWVHYAPMp8dViiOwVUZkv7-SHgI
Message-ID: <CAPsOcum0R6VrZc3W+TNQr6A9bnmwb0Xya719Mf_i07nBL+fz+w@mail.gmail.com>
Subject: Re: [PATCH 4/4] staging: atomisp: Replace ia_css_region with v4l2_rect
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, Unix Antigravity <unix.antigravity@test.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

I checked the code as you suggested regarding the signedness change.

The 'left' and 'top' members remain signed (s32) in v4l2_rect, so
there is no change there.

For 'width' and 'height' (which became u32), I audited the usage:
1. In atomisp_cmd.c, the multiplications fit safely within integer limits.
2. In sh_css_params.c, the logic assigns these to 'unsigned int'. The
existing bounds checks (e.g., x0 > x1) correctly handle any edge
cases.

I verified this by compiling the driver, and the v2 patch I just sent
reflects this.

Thanks,
Karthikey


On Mon, 12 Jan 2026 at 16:37, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Jan 12, 2026 at 03:55:18PM +0530, Karthikey Kadati wrote:
> > Replace custom struct ia_css_region with standard struct v4l2_rect
> >
> > to align with V4L2 API.
>
> ...
>
> > -struct ia_css_region {
> > -     s32 left; /** Starting point coordinates for the region */
> > -     s32 top;
>
> > -     s32 width; /** Region resolution */
> > -     s32 height;
>
> This is not equivalent change as the last two members are unsigned in
> the generic data structure. Have you been able to test this on real HW?
> Independently, you can audit the code for the multiplications and
> divisions when the result put in these fields or the values from this
> fields are in the calculations for others.
>
> > -};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

