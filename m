Return-Path: <linux-media+bounces-50160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AFFCFF31B
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 18:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ED4434B0620
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 16:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCB035A937;
	Wed,  7 Jan 2026 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OV/11OTo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8411A35A92B
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 14:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797779; cv=none; b=fc9AkzM7oqwsKificAyZm4Ez+/uKYOxx95uyhHpVsBQXR1fV3W1esVAPm98gFN01ovN2PXbHLrJrQujwlF18CIaeZyZNzTIOJWUDBngUtAHA7r/4dd6wUG+rQ/K2QIZ9vwMIVNllKpK48uqvPnjI1KMlJlfdGCcH841XX7OkmIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797779; c=relaxed/simple;
	bh=6MeCMaVVMx1KZl/yJ4KYosMuuEBGYNEAE/7dkmKTwdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vj/AXSPAh1j2KKaT3UuaU/j2/nTnkaJ1wIqeeXldbUHq2jqj4yVqqIMe7Ezyj6YwRg29ZkvWH51lCW6pP7V0slhNlk9srKLBVA7WahP69zSFZ0DLPlZImUPI749xTDIyuF3Wut8N7W5hLo1ZVrQCao0I+VBeGRHsujgGKrjYGlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OV/11OTo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbc305914so1480166f8f.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 06:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767797776; x=1768402576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6LhQhFurZpdgl7/b1kEWXbKN3m0snq1TE0Eb864rsD0=;
        b=OV/11OToYO9/4O7LEWhasFOtPp6LsFmY9xWTCv0eohXotERyBQqiNPA4GXxVbMtFJp
         2zTehMIuh8C1CwKKTXZbLtzr3vvsltV2B5MabaesYkbEW5TonevhxW2Xs8bZtklJmY0z
         R4UQkTD+cHHp/k6zWvQ+m3M0D4IEYvpyf788+rcvr41QStbC8pT3nICVsot/9J9n1guw
         T3TnC1Y2Cv325qARapPVO3WcIaMVmCocWcOliih+k9ppuEK/SlrgGkygm5BYh1q47UKY
         RN9plnqgN1KUaLL9hsu5qumC+oGnBxhPkxBb+in3FaMvwZB7OJR8St4G1xcsfbzaWlgc
         /oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767797776; x=1768402576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LhQhFurZpdgl7/b1kEWXbKN3m0snq1TE0Eb864rsD0=;
        b=d2K7Sb2LJ05aKHW7C3/3BENKIvRAachagyWn4twBhN2IDiD0auUzCh2mZZAffzDOMP
         WE8wQWCkBDCEIvV7YhLahIKJCteAq8cl7dVN2HFKUw1mhapQcn2onaVJbSkf9A8lKwhI
         OcNJN9eKviK6weGIRAGFbMUIEyLDnUiiZYJVw0tZWnzv4XOHEC7ae79K8yoWe5tb6DzJ
         5zj9X57SedJt14OU4PXDeNLXYcwNuFai1Q+54qu485LJUfCCJEjzdL4RqiElzMbex7OO
         gvlbcRWQFZP+bx9u3FZzbccUVGv1T8ITYDTEZVR7R2E4zO8DYElN3eahgdULnb8Ufayv
         IaLg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ93Arc8kDRb1nPJjtVkKXMEZeNoLwGNln2BCkQ3T7vqfHUSh/YDAD6aL9cXN9SFmkigo/stAstrAvBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxxvCxmjkqF/0mS0oMmJ2gG8Q/23e+QAXEvyNncif6xONRtAOh
	FCEKOGmjJeIWaS0ZFQH0lKPOYPES/klEerG+q2VQA4HS+FYIZDf02rLMhgsCPaSM5iI=
X-Gm-Gg: AY/fxX4shU20R+qg/LnFzU9lqK1HoekWCPVyNE64iu22ENhRORLV4AF918OKQ3ayrS4
	Cq7wWOaChHuJ10GxtDMGfYSQedk5rbrzJlgY9tGtZEjuKLMKJalZhIQvWDNiyES8bdMYpGFVej4
	3am1vymfg409u6+zwvQO2O0+9RJCHHOm9RENJkWxHBWJGd+X4P5qsBrniumhnvRJgv9T9ExDRRz
	EJGgXNk1v2gWBfUwJnv7yP1b39SW5wsJPE6kW2acee/oDVPTMN/VN5Gj12c4DrQZOPjHCitrher
	9bJvfct1DkcR9BcJYItQZiozHOHAZM2x8MOMHqun6QhEFAqUmvZavi9Vkp5bcpQuzUESRZYX71v
	NTeqfCzJzytnLBHXnBPm4cqzmSo1O1WuIoI6NXRIHDrEvG5Mz3beTgv9BBe183TLks7d2J0COst
	i8G1eOxEVuXB2unwOf4akaY0T+nbg=
X-Google-Smtp-Source: AGHT+IGzAiw5qZR+q9p4Fy6uJSg+53+pgybvwLfo0UUZlMsIyM2yRGUDdFyGy0Ml7AxMIPDauhXBXg==
X-Received: by 2002:a05:6000:2304:b0:430:fdb8:8516 with SMTP id ffacd0b85a97d-432c37983camr3732326f8f.35.1767797775753;
        Wed, 07 Jan 2026 06:56:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dadcfsm10817190f8f.3.2026.01.07.06.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:56:15 -0800 (PST)
Date: Wed, 7 Jan 2026 17:56:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikey D Kadati <karthikey3608@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] media: atomisp: refactoring and fixes for V4L2
 compliance
Message-ID: <aV50DGDcPPXUXsqU@stanley.mountain>
References: <20260107144252.74666-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107144252.74666-1-karthikey3608@gmail.com>

On Wed, Jan 07, 2026 at 08:12:49PM +0530, Karthikey D Kadati wrote:
> This patch series addresses maintainer feedback and fixes build errors
> in the atomisp driver.
> 
> Patch 1: Standardizes the 'Bridge' structs significantly by using
> v4l2_rect instead of custom shadow structs and aligning ia_css_region
> members with V4L2 conventions.
> Patch 2: Introduces a helper function for statistics buffer allocation
> to reduce code duplication and centralize error handling logic.
> Patch 3: Adds missing error propagation for IRQ enable and XNR
> configuration to improve robustness.
> 
> Changes in v3:
> - Fix extra new lines in commit messages (Dan Carpenter).

The new lines are still there.

> - Remove unnecessary s32/u32 casts in atomisp_cmd.c, keeping only the
>   (long long) casts to prevent overflow (Dan Carpenter).

If this is a real issue, then shouldn't it be in a commit by itself
with a Fixes tag?

regards,
dan carpenter


