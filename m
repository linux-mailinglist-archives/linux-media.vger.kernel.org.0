Return-Path: <linux-media+bounces-36029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD20AEA4E4
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 20:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 725E5179988
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 18:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB942ECD3B;
	Thu, 26 Jun 2025 18:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="He6Wjpwj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBBB20F09A
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 18:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750961110; cv=none; b=tLMhots5ezGbi30mWiIRqN2FGzlBoRH1iY0m6THTJXZiyG+ST4a3eWh2ZNGTQMmtOKDZnlJzqFX/WFZWLNsb5F44oRxkLIQTINXlzAMVJTTLDmTjuLWxYpfYCSjSoOrHr2X8499BpRGjknG7me96Gk5TOEq0rleI6X/3x2ARv4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750961110; c=relaxed/simple;
	bh=KaT6NFipBaP+7uuCJdfAzl9+3V9on+Bs/E7nEI3V674=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6VzWrl8W/6jo5jpKJAGYJ02H8mGYYs44iPWGP7texZTw4UJSSBzNm5KxatU+fMLb4mIGy+A25I3iWrQN9+hsjFaMJJuWZFtl0KTKHEEilBZXXawE8KOviWyIZmkxiQKKJDU+jVOUfpyrcy9LrTPLSdAvJFlJVA3XwGIC+7Reck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=He6Wjpwj; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-40ad1f7c23bso892713b6e.2
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 11:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750961108; x=1751565908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2jdIp3t/JcnvNgV/EvawInKAMJ+vsXxeF/1Rq9fXb34=;
        b=He6WjpwjTmx2Wu6zSo+tO7GQ776ElNtRtih3OV2DqD3WUZjSXs3W4VNr0JUZiCiTF8
         8ZdYj9hGOxwtZ9PpFfZz0qkkQD63//CI9+7iTrjkT6plOf/rZVmu8TROHdoVSKPHn84i
         j+E++rV/7JFLMZCmMS4OW8B7aoFY79RQ27EedBBkJ4GGAHrq7ppe7a5trdC0oN8vZyY8
         BqvOXMR2YKTr1uHEJCu20XD6ukm4Z/nq1U3AuG4OiTtXF/tF8pLMGQRXsj4KhIjreXcu
         TrrlGFwQA7SDsE3dw2w2vcmvtIHAJupS+ot5VknBGgZ1eQi0g/P4OUp/4L1fVqf7fVlE
         c++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750961108; x=1751565908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jdIp3t/JcnvNgV/EvawInKAMJ+vsXxeF/1Rq9fXb34=;
        b=oJAlRTE+JizjNtA0MaaaXae2sIBuQjiSGUcv1FMTlye+wFqg8wGdXEd76cbuMLAbco
         aURr7CWCPdJrFl3E8rFimZvwgPCz6uydtiwugmlLM6IRMib5IDV2LpRjmC7A3m/Ffvnv
         93durgHSBfFQHusgxLBX7CVYHjuyqykhmm5gwVpcWOrlbqRtVWs1J5dTv24yuZ+qnBPe
         ylfMm+NZ3yeR9GnbpIlb6CEJ32seR7gxwMw2wOm3GdVPI1AbRGvOdYDOrbDYQsbM/j5X
         ZWDjUEt4+lGuvYLXvh3h5cjyGkUa+F4GZp/fzctEaw56hBkKsw7CX0tlcD+MPKEn4bri
         WDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpQk18YtXk2Df8ALuDnmWtLcENab6WqCS0eL88cC4StsbNMLEWJZxKCLtX/xF6UmLa7tflB0W0UnsVRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRJOtXD752ZlTmekyahdGgCzY32bzgDCXPQPX5pdu+6sdnfZ7H
	S8optxxmSBHgBETLZGahVBcJhZIKDqjad6pddfeCK6Y2lKjd42awPlNnOegoQcwYp1o=
X-Gm-Gg: ASbGncurKXPJnlYIvg0FLEu8zPLX/I1beBY8gj2U0ACDn/5m7Z3ns6EzaKstnNdfS5+
	4cnIjCyXYR/dtwM37FjoChZVhOWlEhBIF6iwqlejzQqEtWgVa7GnxSS+B2H1eqq4DAm8kL+gESZ
	sJYvq4ZtML8gP5208EySLtaDp8OhZUuEI39JqBlqXp/fD5HBftu7bd0F7Oak9qDAxNCLNKD626X
	VmbE/TTSgNxOaWmYx1OOCdlMvdzFovktNtfEqQQJ2+GQxaN8m22b/1zCA7y1Ho5kZJOFnjQmsG2
	+L+zmQL6oXs2LPDhTMLsxbdBGiG2rYzBIp8TLT5e74PJHp0sjNSHzvxknSNWP/emn4w3
X-Google-Smtp-Source: AGHT+IEL45qBZ2uXaEhapcM+NgWFI00UFnRWP4NW8+AeUpc2hiUpniAGVTq3f++FmGqy7GeXB2NfPQ==
X-Received: by 2002:a05:6808:17a4:b0:406:7186:5100 with SMTP id 5614622812f47-40b33e18292mr142490b6e.22.1750961108418;
        Thu, 26 Jun 2025 11:05:08 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32438b5bsm49071b6e.44.2025.06.26.11.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 11:05:08 -0700 (PDT)
Date: Thu, 26 Jun 2025 21:05:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pratibimba Khadka <pratibimbakhadka@gmail.com>
Cc: mchehab@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: av7110: Replace msleep() with usleep_range() in
 tuner function
Message-ID: <4520c798-9372-4aa8-b6cc-f919b0c2dc59@suswa.mountain>
References: <20250626160853.8772-1-pratibimbakhadka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626160853.8772-1-pratibimbakhadka@gmail.com>

On Thu, Jun 26, 2025 at 09:53:50PM +0545, Pratibimba Khadka wrote:
> Replace msleep(10) with usleep_range(10000, 12000) in the PLL lock
> waiting loop of nexusca_stv0297_tuner_set_params().
> 
> usleep_range() is preferred over msleep() for short delays (< 20ms) as
> it provides better accuracy and allows the scheduler flexibility for
> power management optimizations. The 10-12ms range maintains the same
> timing behavior while giving the kernel scheduler room to optimize.
> 
> This change improves timing precision during the PLL lock detection
> phase without affecting the overall functionality of the tuner
> configuration process.
> 
> Signed-off-by: Pratibimba Khadka <pratibimbakhadka@gmail.com>

Sorry, these msleep() need to be tested on real hardware for us to
accept them.

regards,
dan carpenter


