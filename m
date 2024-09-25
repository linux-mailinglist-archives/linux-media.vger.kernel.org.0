Return-Path: <linux-media+bounces-18551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D317098606D
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 16:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A4B71F26B2F
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 14:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5D31A4AAA;
	Wed, 25 Sep 2024 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qp/KWDBs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44998155753
	for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268910; cv=none; b=DaB/pnxKxi733o3YCl3lijHiadBJUIzqGlHm4RXywUOml9nWdO7kDLdwQwECVOQz2+lbyOHm34diKWD6+QmQYtd1MnmDD8m0ysGuXZi6kPLrxaKThbuMbWlPso6YySoJLF1fgbzpX4xMG948DPW8NH1YJjp7QFOuYOOz3tYVIr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268910; c=relaxed/simple;
	bh=q+75GZfgqCTSngT1o86/FOgcbVTQ54B8Ve4TR4ZuSP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s//S9oEOyKyew7DQJrbX0kFeZhVmZ98TC5Duvlk7VlJB5zyvJJqJf6DeFxx8sTkxDagtQmLhkhFhqGJvEaO6Bo10bfGZmdpMS+DwZAb0WXFg+A1gYw38won4HqTJE3PT52CjyLPwW/YhQb869v5guaDuoZcdx/VZfBE4Qa9rOz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qp/KWDBs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cae102702so55126095e9.0
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 05:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727268907; x=1727873707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+75GZfgqCTSngT1o86/FOgcbVTQ54B8Ve4TR4ZuSP0=;
        b=qp/KWDBs2cOmpiIYFuBidTKN5NNnWxhY3PdmfShvPQ+qXMQYMpYhDxR4DL1rLBdzk7
         WfoJ9ji7uqHVMC2KK3J/ertgcgO3LrGHTKtDMyxWGnAQLZNrtZ+p8Ujpoim/vW2aYhbT
         SCj41pP3Pd1JWEfuCaPGEgn/SVc5ake7GQ30TPyk6I7U0FeNp7tljtpsmxW0nYivKQYK
         L+dgg6Mmhr0aE+csVg78Ra51WGy30X/bcb6TCmGuULXuFXMZQ/q0s2GlXbL8JSeoz96r
         PZQJ6zJKWzDQMH89a+Yn5uRgLg8T4hjHw933qX4cv7bz7YMuSnxPJtlzKTgyWu4jBuXE
         j8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727268907; x=1727873707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+75GZfgqCTSngT1o86/FOgcbVTQ54B8Ve4TR4ZuSP0=;
        b=UsHO6Tmx8M+cfBOVhx/07SP7bKXIGPXi2TCwb6EpxmL8T7/rBSTw54aBP0P3Gbin8B
         apIVKThGbpRAah2XSdPx4PjyQ0jo/mN7C6l+0J5dIo7gCjbq9Vh2j8jAQdQJ2ZGkGwR4
         kFYgpt/hKAZsfbhfXrjDei1Fc8tqfApzBgwZEe5nojH4lCFaib72o3bOPMzoFPqp0Pw3
         Ij4NLr7c+PnWfZevBLJpfobULeL4qR+J2mWBesaJsCVUuj8x5Nd3Yj3lN8cEwSntPrSq
         z9hijtjIynFleXM1/WUySIU/ZouLq0x+/kzIB9y9MLxK4yiU04R2h3X6fk8xOw+a4UAL
         pgJg==
X-Forwarded-Encrypted: i=1; AJvYcCU3+M6fYAQ4IiFmTbjrJW4Hs5vSLDoHBTfl/DUILrFLMiyQVerQd+oL4gtek2m3zvkvMK1l28i1Kp5j2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaM+38Zd7tGzcMiIUjntT0unfKVrhCQUeZnd8upyvjUlYujv9A
	sgZLoLkThSbx8yAxV7xUtYlr1xXcCg3WZEelOa5t2PUiVXvAJ+2hKwK8g09Yfks=
X-Google-Smtp-Source: AGHT+IEM7lvuJYo2POgpko0eNfYw3ydlD44EH8OZRmciXwckV0VJOwVx+RrAiTfSKQE2gsGVX2bLVQ==
X-Received: by 2002:a5d:5508:0:b0:374:baeb:2fb with SMTP id ffacd0b85a97d-37cc248542cmr1519632f8f.35.1727268907458;
        Wed, 25 Sep 2024 05:55:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc31f77esm3972482f8f.108.2024.09.25.05.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 05:55:06 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:55:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [rft, PATCH v1 1/1] media: atomisp: Replace macros from
 math_support.h
Message-ID: <67964712-81ec-4ce8-b5c1-1f050c7502fc@stanley.mountain>
References: <20240923085652.3457117-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923085652.3457117-1-andriy.shevchenko@linux.intel.com>

LGTM.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

