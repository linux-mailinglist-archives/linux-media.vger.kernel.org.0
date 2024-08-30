Return-Path: <linux-media+bounces-17192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2807A965742
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9F6B2869F0
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872F915099A;
	Fri, 30 Aug 2024 06:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bluGi6Iz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0605D14D293
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 06:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724997710; cv=none; b=OV2YdJGFJjSelKsL5Q9sptqfLESP6d26d2q0hyw8YrFZl9VD/2kflLuSz3NXaT5g24gtf+pWM92cHQn5yxt5JbaZ4GYYHHULSI6LwaLcC2I7NSr7ATbTSnT7B6j/KrVFGKNgEtAo4CsqLut95q0Et8EG2OIjnHpE3FjeDoPDrNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724997710; c=relaxed/simple;
	bh=9DNY3ZFRE7CHnMwm1XSpzP3vVjD0l1buQ4MAKMyTHeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezoha+VPHrV8dxixV39ZZIdV3V7Lb3QLic5JrV0EC6g21GjiCDut2jdp+Y+HodsYqW2X/eCoGqqhvlIbLsMg+fRYf3DvW86TUFGTnGftUd/yo0aee6vaZty0T9w1B2UJ+bgs45G+K/59S8JaA5uzjlKHBVNyMhw6cAX534oJ67w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bluGi6Iz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so13063675e9.2
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 23:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724997706; x=1725602506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Warkqu/1C4P7VyOObJRODovHA5t9+AmBIFpWfc0vrEs=;
        b=bluGi6IzrPPs1kP9+S4ERYLCvqEE7kib/yjS15JPjlOhI13XW1IQuP18Qz4yNvFxfb
         KyzuVwXJYp4/G4ddP5iEFyQXAeAbpzCSGdUq/nSZZ74Ff6rOSxBeEWbTxk7ZbU5Mjh1p
         n/Axb9GTB/QMrJPds49soJg3nJGy2c42QXtlevUmNgQuuZQQWeKty9jKSmxTtEuZRP57
         O7E3RyGnxhmMUR0ip/0CMgsbHHID3usfJO/s9RS3FQpLJrIohDtUsOAF8H0nedwmz2E9
         XhHEkFykf1zTJuJqb2vlBdpwmE89EPiCwdH+D8mf0EgVKH9SC6X5sWHQJ40ZSnxCaTNY
         l+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724997706; x=1725602506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Warkqu/1C4P7VyOObJRODovHA5t9+AmBIFpWfc0vrEs=;
        b=YA+pFnhJWIxTv3Q0VG0xHceMAYrrtcgoCme6Fm0b6UhrC2lJ3Q/wFX6CLPYoEQhpX0
         xbBirwHVjp2bz1J35RHiI8sTmfrTzMZLGXGVxXo6WK4giTxqBkozWYcJY9K1ZqzD5tGA
         SDKqAzJAvNJVHeOvxNH6ziWnTfHn0/XJ/wf0a5gzi/dmyoV9hJoeMGJYoPv3Me3ccBK8
         /m4QLHtuWBu+FYIEkoFcaFfJwnSHreouJgH/IoTpsjKdDlf7mEMQvhTtjPsZ5YaMfV1U
         EpqJPBr/B/Y7WbyKEKai0UDoh7h+6Q2QQzMA87E//sGE3gUn8xAXvS4DXndDSnJrtBbi
         vAUg==
X-Forwarded-Encrypted: i=1; AJvYcCWZHUxjiDvCxBnGxZl3QvdE7trFvdQU++93suynm5NEywvd9ZPeC4C7/KbEIiCZUWMedbOLBPKAGZGdlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG6PigE2E1j0rjXc8/fJSR49EVtCUhoh8ed7+uS2pSIuunWpFP
	iI+nbQaCk2B/xpZKTq+hDBSUI3JN82cmgytIJNHu4L3ftUBcUvf6nSGBiuBQ8R0=
X-Google-Smtp-Source: AGHT+IEnYCMR+9YoUxCyT15AEnLKuXgg+ZtwpgefE7r0jjZu+IE1hb8+dWprd3QISNhgKpkxSgiOVA==
X-Received: by 2002:a05:600c:3c8e:b0:429:d0cb:950f with SMTP id 5b1f17b1804b1-42bb02c2031mr41008065e9.2.1724997706001;
        Thu, 29 Aug 2024 23:01:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6425a13sm70170665e9.42.2024.08.29.23.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 23:01:45 -0700 (PDT)
Date: Fri, 30 Aug 2024 09:01:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/5] media: staging: max96712: Add support for MAX96724
Message-ID: <affa5481-b858-4f7c-9325-3bb56de4f538@stanley.mountain>
References: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>

I don't feel qualified to review this, but it's a lot prettier than v2.  Thanks!

regards,
dan carpenter


