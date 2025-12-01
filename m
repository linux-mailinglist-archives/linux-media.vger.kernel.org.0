Return-Path: <linux-media+bounces-47921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEE1C961B8
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 09:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 07FD13421C1
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 08:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBB82EC0B0;
	Mon,  1 Dec 2025 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DNwABYXb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DC42C0F7B
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 08:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764577680; cv=none; b=oAFliq2Qp4yZY1JetvDRZsNw+440Rdj1mRNjQWKNOreHk90vH6+B8rwq3ZAXF/NDhwSUJuQxrLcxku41h5W1Uj+gzEaLX0NgWgWbGJ17bsuGOdLaqRbvznThBJBhFlMYeaoBGoFj/ikvD+zX10LbeNBK5RPBHjWKwA/4AElASmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764577680; c=relaxed/simple;
	bh=eEoSQ0b5NORRs6uPdVGQQrmSALQwqG3Y+GUxtmz9chI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B01uBxM8pQGKifBj9VgGiobNAZHK+Kowe7EsHGCWFjntGdE4PLni5G7MYzKrfMl649OKpyM1TTkKTzbYAJ0XROsFJW/sfIYgip8W8YKkDoG3dCTLkxylu58OXu0Yyp003aNbxO2iq9FBqIj4v7kz1dcQ+GaCjslaLgjup1zgqAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DNwABYXb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477563e28a3so25791095e9.1
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 00:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764577676; x=1765182476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+iv/uRpoYQ3jNb66g8IdDziqX74VNHPD/V1XeMoW6kM=;
        b=DNwABYXbKcyeGxHsZ+QxiFBg/vD7IW1vlNx49VB+YBCITytN7CB6/fQ+FyXMZ3xhWI
         QQH9Pe0SyNllHpVgsNhVbkDC1ieBUjC7WC79WbxB/WvdJ/gV2Yyn9oPu7eLFBZfP9gpO
         3NXXj85LbEOzdWMEgxFScIeYmrT9xEHZGvOLaHwIwqLn3xZM3SLYxSpV2To0k0eUGqS5
         4s1bKn/f3PN7/2hrDFiN0xNZb3wUNDIJvaYJhwB2oqL1O7QSu1PwxQ6ZJzvUcWnvXt8z
         /RoPUglvHSpxTW7nF8C943nZMGJ/IM4LDNpYGuGv3/JsXp0577HMUwMq1rg+aGwDJ7zv
         QzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764577676; x=1765182476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iv/uRpoYQ3jNb66g8IdDziqX74VNHPD/V1XeMoW6kM=;
        b=Djn72JdFOeI0jQxSeNJ7vCHMATatuoLpGkGJwDGctxI5EsChZ7+PJ3ip+owxPbsZpx
         GFHLZygruH8F3k9OZTC+kkG0Z1qB7ZSBfIRmoiRS9xaqn3LyDk0dcmHt2Z5lYhkJMuf9
         bxbDrsSzmiIJ3jjT0F2FknM9kNxWEzAKKKlBCikANOwLc9Wh6fqGZ2uYoZ4D1mNQkM+T
         BtkH0aKUbYomXTZkElx00CeD5kfnlfBMQ9/n0GRcnj+vwl+sqx05FwuoARo23wcUNEGk
         zx476aJs3b+O/dmZRHt9y76t7L02Y1OKRmpitDIm7E07SKWxY9cd2GlEmXLyfbFK0tj1
         K+vA==
X-Forwarded-Encrypted: i=1; AJvYcCUe6nuuLos0tCZr+KTITHOcx7uXO6vWjBJ4lRUL4I57+724go57x1RwdDUeOk4PrB2LY2gtwV+IzFmiyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHQu8TnGB0H3R/jsTNSJwHtGJqqGbPwUowWHj2YwYfZeqzUdgi
	nuwFr7Lsy45CvVdTOW6GZwrWAPJwoO95XDrELGsJGWx7Ad4ZaTWW4lilvdABvRY0yMY=
X-Gm-Gg: ASbGncviZKxF6nRbJ1rISHQ0+FP6Ij8X/0s26DsCMpMNFBO76TUryC3nzan/NCbu7IU
	+jTsy37awwolsXkzpUNBbRvzuJrS1N6sW8QzdJdT2CzMZaTz2yZmXbnxznqDKHu6PKN5x31iREo
	rPGSbAXMcrOwKdVyuHceuTzUOB0Z2eRq0+1zcV6V+eulY5ct4oIt3IbopWBVrwkCfnHdqp7JOx8
	etsT/0sp8f+XzosWTww6paUJ+p935KW17AFchiOyb1bCwAtqkjUZuSWDDt3JRz71pveRRpBP36G
	hcbqiRlL1hCdvHAucviDcSW7KQByOuZFfUkF79Xsl8dwSGJvl4B2ATZSqLEHaAkj3LNjMyAxpm0
	0F0n/pAfCtsNkfxy+O6gGRglAfzJbwaIr4YMnBJidJUI4f0tyFWozKVrSSIXSzmH2KkGw4ybCls
	QtMYLO5KJZ5lwoX4Rz
X-Google-Smtp-Source: AGHT+IHCEcneb6wrPByOAXguQtQiX6hdvT6IODI4Yv+qdHDOjDKNWh5+fiulBgY0bAjJg9dKf47UyQ==
X-Received: by 2002:a05:600c:4eca:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-477c0540a68mr417279155e9.16.1764577676131;
        Mon, 01 Dec 2025 00:27:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47905303963sm153680685e9.7.2025.12.01.00.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:27:55 -0800 (PST)
Date: Mon, 1 Dec 2025 11:27:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: Re: sparse: Lots of (erroneous?) "different address space" errrors
 in new version
Message-ID: <aS1RhxHtknHzZE3Z@stanley.mountain>
References: <CANiDSCuizbMt77XfrzGPMa3Biai5TF1vcs+C5qdhYoLrP=9b3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCuizbMt77XfrzGPMa3Biai5TF1vcs+C5qdhYoLrP=9b3g@mail.gmail.com>

On Mon, Nov 24, 2025 at 09:55:18AM +0100, Ricardo Ribalda wrote:
> Hi Dan
> 
> Every week we bump the smatch/sparse version used by Linux-media's CI.
> 
> We were almost error free, but the last version has introduced a huge
> amount of errors:
> https://linux-media.pages.freedesktop.org/-/users/ci/-/jobs/88441453/artifacts/junit/test-sparse.log.txt
> 
> (It is also reproducible with linus/master)
> 
> 
> I have bisected your tool and it seems like they were introduced by:
> commit e53027a4e816a772403baafa83c09e4a94c1cb8f (HEAD)
> Author: Dan Carpenter <dan.carpenter@linaro.org>
> Date:   Sat Oct 18 12:31:01 2025 +0300
> 
>     symbol: preserver address space qualifiers with typeof()
> 
>     When we're parsing typeof(var) we should preserve the address space
>     qualifiers as well.
> 
>     Reported-by: Uros Bizjak <ubizjak@gmail.com>
>     Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> 
> One example of the new error found is:
> 
> make -i W=1 C=1 CHECK="sparse" CF="-D__CHECK_ENDIAN__
> -fmemcpy-max-count=11000000" KCFLAGS="-Wmaybe-uninitialized"
> drivers/media/v4l2-core/v4l2-compat-ioctl32.o
> drivers/media/v4l2-core/v4l2-compat-ioctl32.c:763:13: warning:
> incorrect type in argument 2 (different address spaces)
> 09:08 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:763:13: expected
> void const *from
> 09:08 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:763:13: got
> unsigned int __user *
> 
> 
> static int put_v4l2_event32_time32(struct v4l2_event *p64,
>                                    struct v4l2_event32_time32 __user *p32)
> {
>         if (put_user(p64->type, &p32->type)
> 
> 
> Seems like if we would like to fix the error, put_user should be modified....
> 
> Maybe it would be better to revert `symbol: preserver address space
> qualifiers with typeof()` until the codebase is ready for it?

Huh.  Sorry, I don't know how I missed your email last week.

The do_put_user_call() is doing this:

	__typeof__(*(ptr)) __x = (x); /* eval x once */

And ptr is the __user pointer so Sparse is doing the correct thing.
We could change the __typeof__ to __typeof_unqual__.  It silences the
warning.  I'll rebuild the entire kernel to see if it causes any other
issues...

regards,
dan carpenter

