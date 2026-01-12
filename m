Return-Path: <linux-media+bounces-50435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C39F0D11E87
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 025E730704F5
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DD330C602;
	Mon, 12 Jan 2026 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsKERS3g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D082D0C9A
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213950; cv=none; b=Hy5SMtpJxR707CSPtlrw0YmFr4sc8Ae2JZ5K9s/lPqfGZmjsQgPK641sZmI0q/7rLprUhoSlR4OfVdnpaSZrTAhyeIY60TDXu2dmxothD8QoGFp7IB36Yc90Mhi7e63YXixM9/36M/MKCH8yjEfJZ7syM13QjBi1yd5CWObXXNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213950; c=relaxed/simple;
	bh=vkqDBG0ihkiTbUWD/DISQfGHk5GEv1NJ57XjpTmuJhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ww5rL4ZXBerOolb3R7rfy+Lc6mjL+CWsV3crJFJzd0GMrlZTexPGHm0PN/Xxc265dgw2ulIi9temdApGLubvIsZSeEDPetfccrHeGlvBHbPTcLoXtg7k0VveKQQ9yaUUcA4d1gBYZ9Urma79bwmo4o+ggc+DNCTsXqsB51FKYhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZsKERS3g; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso66900675e9.0
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 02:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768213947; x=1768818747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ND7UT8mjVsvfRhYfSb3VaxYMO5zbkjKvUW+07bOk4gg=;
        b=ZsKERS3gJN/r+pcRD0aZakdEmxCK6alCQGJ4JQ7W7JkinNbz/ZvswkZ95eX/t58p6R
         hEL5Fr6/Q4UX0chACNfOgZgjKU7/ap4CHAdaQ+SXKAAY7TriWRtMa9tyitcoNRSU006v
         RTRv2x+yIvPUkBj/3MD5FJE061bROFQYv//99ioKyFvwl29ZYV7yBH1HSXsokp1FfoX5
         FLnGfTKnEb5BKlq6+qN58GA6Vt9qgDpGCGw8Ss0Wr2Btb9g1WifS/eNNovJGVKWDyerT
         CQJ0VzkYnlOaDe9OEoFb/bKR7gpUuuFE26l8JqLrsZuIgG0i9mIN/BKd+43/jTsvpc1D
         rUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213947; x=1768818747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ND7UT8mjVsvfRhYfSb3VaxYMO5zbkjKvUW+07bOk4gg=;
        b=A8co+w5c4ZLgra6B1wo2hHbdzqij3r3O9LFIvqf3mdWaZjnkNoGHRGSYLQC/dbq5TC
         VJb0mPlLQC4R7i8w5tCpMdaRYdYsh6omnGIsrT4S6L7sGUY4EaDlngvHHDuNNPrZP65n
         aCn0o8V1o0UOc8gskk2b69/pftBPLkT34dOH03K4rlvByPoINWRgOnhlHg7n4ebE291I
         ejfEqV/UAcsOxXJK7L2fA3V8qV39w60ywPJcszWn6LTBlgvfc5PYdau7mZfYEx71uDgb
         MSUhRXtUYY9cQD5o1he+HqFuJwkUQg3gfG6Dd+2ablQjDegdPYGQ9ZFzVKkdEf9dIZkP
         EQVg==
X-Forwarded-Encrypted: i=1; AJvYcCVap45JR6ybzQHCKbpYU57e58zw7aIKfgX1lMs8jVumcyowDwC2VZVVGqqU3onvvT8wO4Pvjk6PIwFXqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF1Vnfzg/g7O3orZ2svo24ghjxBNem6/nxmZRg0BLeVbAJjYXD
	I/t4doq+TeFhh+Gwg23HPDrio8QmxGwRmtbKo1IcdYl6QUCW2jVw0NmZ2vdvPICrKZQ=
X-Gm-Gg: AY/fxX7E0LNySjWqqymIKTkYXdnpzcwI2bSQSzosG0R4IyKc5ThHgTVwV0hbh0OAHK9
	PD58nZjQnM5eAsKx74/ffn2QBpD0MJWmgFxXC+gKHpOVQfNPKNqoAKfaVz1Juk8BBOeh89CMyGj
	s7gdlWK5N4VtTbGbGxuJGEvRkYH29ficYbcd0/uS4X8T+9juxx1hz9Pz+ua2pVfcTlp/HDuUF+R
	qpnY2vKUY8m8x0Wrk+Wq0kc30rSzU3xvC2yvl2HHzyL6+m2BGIT5qhW9iDdEauneq0P+/Iq4u9h
	NM71zM4ipRy/Anmmk814Evud2kOFbTTdEAZ3ibu6XiRxo5vJjhoQrX7+XXj+Yv/C0KHpjxAPXwL
	uuQzSDeLgo+jwxOHiJ+l+EXcViHpzKtgXm/YetHsKk5yLcdNnYnsQQ7DD2+IRegKCrNMXV4VKSl
	pp7mWT2NI8/xkXjt29
X-Google-Smtp-Source: AGHT+IGXGqMdmtBuUfz+mO91zCjBq2LCWCtHIbyiQZ6QFW2ziTLXJLlEWXm3Qr/qW8eCOHoXM3SFbw==
X-Received: by 2002:a05:600c:4747:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-47d84b18a7dmr242891425e9.16.1768213947168;
        Mon, 12 Jan 2026 02:32:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6f0e15sm345236075e9.10.2026.01.12.02.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:32:26 -0800 (PST)
Date: Mon, 12 Jan 2026 13:32:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikey Kadati <karthikey3608@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	Unix Antigravity <unix.antigravity@test.com>
Subject: Re: [PATCH 4/4] staging: atomisp: Replace ia_css_region with
 v4l2_rect
Message-ID: <aWTNt4XLhM22Ki-x@stanley.mountain>
References: <20260112102518.19926-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112102518.19926-1-karthikey3608@gmail.com>

On Mon, Jan 12, 2026 at 03:55:18PM +0530, Karthikey Kadati wrote:
> Replace custom struct ia_css_region with standard struct v4l2_rect
> 
> to align with V4L2 API.
> 
> Signed-off-by: Unix Antigravity <unix.antigravity@test.com>
> Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/ia_css_types.h | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
> index 5c21a5415..7cfb355c8 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_types.h
> +++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
> @@ -18,6 +18,7 @@
>  #include <type_support.h>
>  
>  #include "ia_css_frac.h"
> +#include <linux/videodev2.h>
>  
>  #include "isp/kernels/aa/aa_2/ia_css_aa2_types.h"
>  #include "isp/kernels/anr/anr_1.0/ia_css_anr_types.h"
> @@ -430,12 +431,10 @@ struct ia_css_point {
>  /**
>   * This specifies the region
>   */
> -struct ia_css_region {
> -	s32 left; /** Starting point coordinates for the region */
> -	s32 top;
> -	s32 width; /** Region resolution */
> -	s32 height;
> -};
> +/**
> + * This specifies the region
> + */
> +/* struct v4l2_rect has been replaced by struct v4l2_rect */

This historical artifact should be in the commit message instead of in
the code.  In other words, delete both comments.

regards,
dan carpenter


