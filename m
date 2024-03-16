Return-Path: <linux-media+bounces-7171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6333B87D9AD
	for <lists+linux-media@lfdr.de>; Sat, 16 Mar 2024 10:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEA17B20E43
	for <lists+linux-media@lfdr.de>; Sat, 16 Mar 2024 09:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C3717984;
	Sat, 16 Mar 2024 09:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XO0kuuAW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A42314290
	for <linux-media@vger.kernel.org>; Sat, 16 Mar 2024 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710582418; cv=none; b=Y7b8gCrbcegy4GRHpXBndD9TDU64tMKOjQYGgFGa1HiWZkZ39Jnm4ZIGgNNHP5Q01kY5fPmx8d9uCwHzvpicd2fjhWWISMvMOtiP0iAH6Mn0XQW2+crVl5llXgIr8F6TEGrDdP3yj8tks1uxe8LLGKnD4v9vJayG6q02UVK1I8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710582418; c=relaxed/simple;
	bh=DMtx0/3geiYhVdzSo4B/B12kXf6OyeqliMzNBLNMbFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhpeiXlR4irmmQgkiAmpc3YrWUC6LewF1MZtSSYqvKgV0A4ti31GNd5MsydwTCO/il+srKlujUwnzeJ6BkQy1x7uTzRZ8a6uqjri+SGiaIKH6HFlchoeiLwIpJTFvoy0lTYHpVX6nz3aHGgwrFxGXQuEOlRbOVuqomFJYlyPc2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XO0kuuAW; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d49ca33dcaso755561fa.3
        for <linux-media@vger.kernel.org>; Sat, 16 Mar 2024 02:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1710582414; x=1711187214; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fUW/FIbXtZhpkOcYQxCVkz21OR+E2wEaVF3lBWv8kQM=;
        b=XO0kuuAWVGXCHp3fBjnEyHI4y5M/FWfeRaQfsebasvPkOSqgc+ysKHwFuqvoLiKNv7
         +vZAGYRFQoxVNccE517ZYtEyNrDOKyo4tfTzr/TT48xXKspdub2fFo2OPrboxx1jpBbs
         xC3KuHO0/5FAmElYt3foCnetcTFgV18IOdMxj93145Jj1Wd48R5YvR03EXWuiMWQL49I
         G56mAKnD6dvHxLw6i5L40G4WYrzwiBtEIxPkX2fRIoOiHhxtBCzfKFKLogqPwIYrNtej
         w4iNIAk57yxvtZGju5y5oEpkK4klCozTuoQkcLo2CowFeAOGC8p8vMbjvdJhKxj50eRa
         /0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710582414; x=1711187214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUW/FIbXtZhpkOcYQxCVkz21OR+E2wEaVF3lBWv8kQM=;
        b=e6Csb4irvMruFdhjXGqaNYa8jLU0dHRvB5CFyJTsSYZIsBJQ1W++pp1dDCbVcAvZP6
         AV8vHgJDqP+aSwSr5zTUGnFvxGUxwWazTKe/vIqkOtepjRLvfJKuL9lJCo3CZnPpgq81
         5i0gQQH3ENaPPgUHhDSmcr39fc/j0AIQxfIy3NVGOceksBS7wxgpBhjX9yGbh72jl8Tl
         1pdZld4AOzIcP8rvxLp1Nm+GLEcZBKn1xEjSR0H/mz/N6HTJn+PTBrj9euQJ2Ol0jBnb
         8NGZjR/7Z+W9BocgxYAa7Z4RV9aX5t4wyxOcFO6ZTl306WqBRnVTjTgi/9DkTt9Dqv8C
         XZww==
X-Forwarded-Encrypted: i=1; AJvYcCX+JWcMh77deMqts6LUB3ovYSgtnj0k54qL9DI0tFpI/Q0KWGzyPRJMW6iBZ1KleC6S6/54kvkfYUCCAofWQ+XBGt+QX7V84GM5sIM=
X-Gm-Message-State: AOJu0YxP+WX3e2C165J17cs5/i4ORJMEaR0wSPIx4uZXuQgPZyKW0qAi
	C8bcptxNFMAv9bxVB9FoJMiH6t4izSstj/mUBUgjd1xZ/9R0m5medfBWX5uX7pU=
X-Google-Smtp-Source: AGHT+IEDsDdll7w3geO/Tp+xb2ClYrnmkqXOFWJIa3xlfSDYbiyEsikoRMXqjej+3H6Huqwl5UJ7qA==
X-Received: by 2002:a19:ca51:0:b0:513:b061:1815 with SMTP id h17-20020a19ca51000000b00513b0611815mr4296285lfj.18.1710582414145;
        Sat, 16 Mar 2024 02:46:54 -0700 (PDT)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id u19-20020ac25193000000b00513a76b310esm921223lfi.60.2024.03.16.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 02:46:53 -0700 (PDT)
Date: Sat, 16 Mar 2024 10:46:52 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: rcar-csi2: Use common error handling code in
 rcsi2_parse_dt()
Message-ID: <20240316094652.GC2092253@ragnatech.se>
References: <8b4203dc-bc0a-4c00-8862-e2d0ed6e346b@web.de>
 <CAMuHMdWwegdks3eEviEsBJE3AvUVKbZqHduYdhuwz=8xTMDs5g@mail.gmail.com>
 <260d82b6-e7fc-40c3-b414-50a883709fd7@moroto.mountain>
 <ZeWnD9YrXLWJYmhT@kekkonen.localdomain>
 <cc121bef-8bca-44e6-81aa-bf8e682bdaf5@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc121bef-8bca-44e6-81aa-bf8e682bdaf5@moroto.mountain>

Hi Dan,

On 2024-03-04 14:16:56 +0300, Dan Carpenter wrote:
> On Mon, Mar 04, 2024 at 10:48:47AM +0000, Sakari Ailus wrote:
> > Hi Dan,
> > 
> > On Fri, Mar 01, 2024 at 04:42:01PM +0300, Dan Carpenter wrote:
> > > Sakari Ailus pointed out in another thread that we could use __free()
> > > instead.  Something like this:
> > > 
> > 
> > Looks good to me.
> 
> Thanks for checking!  I've never used these before.
> 
> > 
> > We could merge this with your SoB (pending Niklas's review). :-) The driver
> > has been since moved under drivers/media/platform/renesas/rcar-vin/ .
> 
> Alright.  I can resend this as a proper patch.

Please do.

I do find the idea of scoped operations and the syntax

    struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;

a bit foreign in a C context. But I think the intention is clear and it 
allows us to avoid having the remember to free the fwnode in error paths 
which is a nice thing.

> 
> regards,
> dan carpenter
> 

-- 
Kind Regards,
Niklas Söderlund

