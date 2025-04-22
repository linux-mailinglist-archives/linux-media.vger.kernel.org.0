Return-Path: <linux-media+bounces-30682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4D1A96081
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 10:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0627B3B43E9
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 08:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532A92367D4;
	Tue, 22 Apr 2025 08:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RkC/CIuj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3291E7C32
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309060; cv=none; b=PHbWsogPiplhEPJDwDJ2Lfg+fMGvM5jdzer0aUn4w9+tepJovRcDZb4TIqWjs6CsBfM7NaH7hdtzGCj+WpNVnZI3uKEU4xvUE2lUudKYVTlywt9yZnc317oY1lO/ZuTlbB3P3mcvyEKVUj4nAJkv/BVk3v70Z98un1ZP3iwfN/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309060; c=relaxed/simple;
	bh=YJ5ust15cgiLPQ19Llb8Yxmg2OdhLgYoabERjHZpRUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAhfUUjRdllAQuzgcO1P9web6oTrDbrJBhxQe5qnVXdLpszKdQlGvYHajc4w39dhpoRObgkyCh3y6ZEMU0XicYqC9CV7V87DRg/CmjTmC/6u9YGosh9+gAUKf9EhRAkrQduj0vBhM3OnzyAQNvKrPjohBTEPEgQ4+P4cTXhKTdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RkC/CIuj; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ee651e419so2631351f8f.3
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745309057; x=1745913857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cIQ4PP9wG4Vz2xc0LFXVcoklKGB+kLgAg0ewlEvxW4M=;
        b=RkC/CIujYW4393EfnO3k55cJA5rUvl4/+MzteaxfWSuioObBRrb9q4C0UNMcbFxGp4
         ysC+Bty3n8U84UxlhJCNGZgMuR/J4kynaB9wWcGqYO2SkjsqPVJw11DKVtYAAU/jMGZW
         hj+apzwbOHeTkOMH6koTYoh3IuiuGZWWOXCbZ+WYkqz0nf3VN8m+4lw9rzA7e0hzwJ94
         RqVAjYJDv2FUfYQmOsTTNPVT8OZNBuFMg+OMHtZsI8SRcUOwJ8N7A1sduzd+QS6kACr4
         9vPcsUUucwGsHW4CnF2+IzEpjM8aReyI4zkDRPi4LqR07jXTF6uTG3/vYqvegGuyB3tO
         VDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745309057; x=1745913857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIQ4PP9wG4Vz2xc0LFXVcoklKGB+kLgAg0ewlEvxW4M=;
        b=POJE1/cttrRZi63hD/cbnGOyGCgtxbGYGtvamJcYRCxyGs7SiGEiuLHQvxLZ0GDliN
         thDROpZA7XRZDahfw20TVKXORl9PCAU7T9ikFxig454iIVCJc7SjjvnopG0VbaueWHiR
         H4l4rAjzlfGNU7DIU6vuvwKd2FNrIxrF+Rs2U2rvNGFvZ4uEth0a7X/HpHrVZHtavlct
         m0lzRTe3+kIUsUydy7a3Hnu7AEzGHlCaZmy6y6OTr7SHex+m2ManT1wbPP1nD+FgB0/X
         kqIawSpfMgLjn4zS87sPF9VQhS4xlWvwG7PcUqRI1Wib37W2K0pFDHXOzltzH7e7JHBa
         oFmw==
X-Forwarded-Encrypted: i=1; AJvYcCVjMuXOof5WuHX+DtvwIhm18DPvMa3hrGU7pMKu7AKdLeHQ51Oyi7f7BQod9JJvIK/5Eu4f+W5BSyOLJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWvwgWeCk73r7tA+buFiWceF95C7BMAdBc5dyesjYUnaoUWoDo
	NeEEjh6VGmqrZocm/akDIHFOtTA/ZKuHC/0qSQqj/qNIuBduRsOsvZvDIGoRogU=
X-Gm-Gg: ASbGncv/fCdooWta3rGz2T6luK1N+K1GJl8GwTHV+RAZWe3mVJ9339hEq/YtEFBcJaZ
	5bdFMqOFBQXIVa/kLR7gUa8PmOn0lsOq9MSnckGYMfGdVkl7foQPSru3t6bYBDANX9+7zMuyfiB
	wFWkM2g3pfJ3jn/k9U18AH24+MRLMAAR8r+gVdxFIDVYTC9QFgLhbtiq0d5RFPQM6FSmYD1Xt9S
	Amy6ZPa6KKJevDMs2O5b0YPh+1S6CesohnG9NwCZy5K0q0yEebouIvhcUKs26R/2G55xxSPaA2j
	Zzy3lg/UxOGyVaa4CdLPFev4IVF2z2alrDdnERGJ/ChputSooQZdSf7g
X-Google-Smtp-Source: AGHT+IHr33bB7haku99h9x2iuyH51ldW8W+dBOIW1fajfkUYidpN0vXAbVL+B51YDs7qeUHWyJNcQg==
X-Received: by 2002:a05:6000:188d:b0:390:ed04:a676 with SMTP id ffacd0b85a97d-39efba4b204mr10956448f8f.22.1745309057390;
        Tue, 22 Apr 2025 01:04:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43315esm14111416f8f.26.2025.04.22.01.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:04:16 -0700 (PDT)
Date: Tue, 22 Apr 2025 11:04:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: andy@kernel.org, sakari.ailus@linux.intel.com,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] media: atomisp: Remove unused
 atomisp_compat_ioctl32() declaration
Message-ID: <260a005d-a1bb-48d7-89ec-ed1b6b151b4a@stanley.mountain>
References: <20250418071823.8756-1-hardevsinh.palaniya@siliconsignals.io>
 <20250418071823.8756-2-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418071823.8756-2-hardevsinh.palaniya@siliconsignals.io>

On Fri, Apr 18, 2025 at 12:48:18PM +0530, Hardevsinh Palaniya wrote:
> Since its definition was deleted in a previous patch[1]
> and there are no remaining users of this function in
> the codebase.
> 
> Link[1]:https://lore.kernel.org/linux-media/20210614103409.3154127-7-arnd@kernel.org/

Instead of a link to lore it should be:

The atomisp_compat_ioctl32() function was deleted in commit b4c650f1af68
("media: atomisp: remove compat_ioctl32 code") so delete the declaration
from the header.

Please don't say "it's" to refer to something mentioned in the subject.
When people are writing commit messages they sometimes treat the subject
as the first sentence of the commit message but the subject and the body
of the commit message should make sense independently.  Look at the lore
link you posted above.  Can you even find the subject?  Most of the time
when people see a link to lore they'll just read the body of the email.

regards,
dan carpenter


