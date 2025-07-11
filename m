Return-Path: <linux-media+bounces-37458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5975B015D8
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 10:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86E9A1C8747E
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 08:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2AA1214A94;
	Fri, 11 Jul 2025 08:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3SLzdk1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C74621127D;
	Fri, 11 Jul 2025 08:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222232; cv=none; b=tKMmJsVi0xYhVXi9zXcoP6U9BKPJUuFmsPAX1J+GIfr+kXPZWk3S+VuCQsl+Ok09KIsdnrQU2IOGjsQNvLPekiBh2F8dVKFgXhmzkx21JD/GZH8+J4ofNiehaflBPo9oNNaLRDeLd3lZTRE6j13matDt9PtmFJf+t4ibUaLfC9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222232; c=relaxed/simple;
	bh=b9d30X6AC2Mh3W35ZDDPDH18rY2ay2okI4QB1jFKHdk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vc4Fr6rGgRTaMxo6JwZR8whaAnzZ2E8P0URoushWaDfgvWK7i/nAI8bJyjX67fEw8rj+YFWq5vtdxUVaRRhc1gl7CJKzxkfOpelYUyqV+4mVq8riDENlsoadZZ4pt9Wu5dXY0gwmAC5CwoJmwgVKoYbwWGPAJj2rkroFKftbRfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3SLzdk1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so808125e9.3;
        Fri, 11 Jul 2025 01:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752222228; x=1752827028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOPImjUv0NDEdWmQs1u+PH6j3hgf9YuU1oi+RRGD16g=;
        b=Y3SLzdk1LGj7kILH7WVJFIFmXcbDaYkdzMn6EYnfHyFtn11Es6eUO8vZ7m/d7F6Yuv
         K1cZ3fFvPa/402WYUvZI0Yb9+VYTNry9i5TYMzi3P2uYu2m6HnwjERW+kMw0Kpys1vwV
         XnD0oVLW/4EbBERX92cRHAtoAa8BcBd9NkCPmqIieWNJhMcVrSga0hy1Ta+CqgNwdBuK
         6IVrsRB0g1jzf0Va2VeCi27zrjDc2zOFMzHAAV8oYgz8RcOvldrJiDwOcwK30tBifBt+
         AMJdtnop8FrK5cwsjnBS2M/M7Eq+JiRCrPwMtUlL7OHLKdS+lVtE4loL7pF/M9iR1bHT
         qm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752222228; x=1752827028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOPImjUv0NDEdWmQs1u+PH6j3hgf9YuU1oi+RRGD16g=;
        b=jjXV8C08zKzfMu4LIWBTz5CaiFFOpgqIO9k8v0P9E4zavc3fnU1d+Aoz3cu2st2txC
         KjXbCQWwPjuig4JvmbV9CPDpaSSvXCIvLQ/rsWbMcH8YmrR5n+AaACb4xCHziN9j3gC6
         +TuyqEX+XtK2Kf+QSjMsY0uxxqCmccESW78MCk25kj3V/Cwv3k3kla0AzJ2xFeYUGUII
         zz6Bh6Hqda8bXDFreT/MsFtp5k3AwGbql0k732MIQ09YUgmNC1IXvA5MHZAS5Kx7xUdD
         ORtiDkWqbMKWZi7UR1VuKXXAyg8O3d+xSr60cIYPnQjJG2RW2qpEDd4WB/z92UzZeAVv
         J+bg==
X-Forwarded-Encrypted: i=1; AJvYcCUjyqC7cMsyPo2LkR/nBPlVyqykWhWXvEyfs3emNGN1ZygHFe0NEQCTJloR8C9olc9243oXH89FEAJoh2Y=@vger.kernel.org, AJvYcCUqVzf/ccK6mjUfM38DBXewxd9gZkOzhXX6OU2x67WxWQboyKQI7E0YcMC0H2ADjhY3dZPsmXqnSlTl3JA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhP7BDxsfB3JO6tFWYwh9zdkmX0Vcaq/MNnTNfBn9FBtK4s4/J
	BL9MdMW8SqBXV1i+JhiLQvVA22ICgeOXTJKNSxC74EQexXwvkOenHDS3
X-Gm-Gg: ASbGnctamX1O/UXdhiA1m+45BOoSb7/uCNB1aVTSYbjQ2NH3hvm8b6EVPPOcDYh2H5l
	iyIUYZ/yyCQR7/mmSX4qNLjryXjCDmKfhMuCfZKbIkqCf0OG0K7ZOMQICD4PlIH6gVEhlAmt9+w
	cRzyhTrqNxK0IS+2Xzrjk2saoqfhxV7drNb58clLqvQ2tTR5UKpebZCmkZgcghVW/UmtehMbiTK
	EJjVZWgfinDsA4orqPs80BP18dINttzeZz1LPD9yBkM13gSgp/PFFRwlo3suqnnp/Pfjyf3cp7m
	eQKqsGsU/3gHVXzaQr/9BHmaBiIFNPrXuwn2CLPDy/U97dw22BH2qPactGN4litF/kMhT5lzCCf
	pAij1zjPsZ8L4+Q0GDdmFkcYEcHh8KFqg+h0LoDl3ou0JXEAkfKI8ug==
X-Google-Smtp-Source: AGHT+IHr0DTxguxEgcI5wlEVMqeoTEaGB3CfaOWnNYJU9nFgV5lDHABmZQi3Ev7VdxsvlmVZMsSSGw==
X-Received: by 2002:a05:600c:138d:b0:453:697:6f08 with SMTP id 5b1f17b1804b1-45565edcb1emr11723075e9.26.1752222228404;
        Fri, 11 Jul 2025 01:23:48 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d612429csm73543555e9.23.2025.07.11.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 01:23:48 -0700 (PDT)
Date: Fri, 11 Jul 2025 09:23:29 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bingbu Cao <bingbu.cao@intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, Arnd
 Bergmann <arnd@arndb.de>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: avoid division by 64-bit value
Message-ID: <20250711092329.74e52573@pumpkin>
In-Reply-To: <20250709145710.102669-1-arnd@kernel.org>
References: <20250709145710.102669-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Jul 2025 16:56:56 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> On 32-bit targets, this causes a link failure:
> 
> x86_64-linux-ld: drivers/staging/media/ipu7/ipu7-isys-csi-phy.o: in function `ipu7_isys_phy_config':
> ipu7-isys-csi-phy.c:(.text+0x1509): undefined reference to `__udivdi3'
> 
> Note that this does not divide a 64-bit number by a 32-bit one as usual,
> but the other way round, which is something that the compiler should
> really be able to figure out but does not (as of gcc-15).
> 
> A few lines higher, a similar division is done using the incorrect div_u64()
> that truncates the 64-bit divisor to 32 bits.
> 
> Change both to use the safe but slow div64_u64() helper.
> 
> Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> index 4407750c7f40..b8c5db7ae300 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> @@ -734,6 +734,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  	u16 reg;
>  	u16 val;
>  	u32 i;
> +	u64 r64;
>  	u32 r;
>  
>  	if (is_ipu7p5(isys->adev->isp->hw_ver))
> @@ -806,8 +807,8 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  		dwc_phy_write_mask(isys, id, reg, 2, 0, 2);
>  	}
>  
> -	deass_thresh = (u16)div_u64_rem(7 * 1000 * 6, mbps * 5U, &r) + 1;
> -	if (r != 0)
> +	deass_thresh = (u16)div64_u64_rem(7 * 1000 * 6, mbps * 5U, &r64) + 1;
> +	if (r64 != 0)
>  		deass_thresh++;

While 'mbps' is presumably u64, it can't be big.
So this can just be:
	deass_threas = roundup(7 * 1000 * 6 / 5, (u32)mbps) + 1;


>  
>  	reg = CORE_DIG_RW_TRIO0_2;
> @@ -815,8 +816,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
>  				   deass_thresh, 0, 7);
>  
> -	delay_thresh =
> -		((224U - (9U * 7U)) * 1000U) / (5U * mbps) - 7U;
> +	delay_thresh = div64_u64((224U - (9U * 7U)) * 1000U, 5U * mbps) - 7u;

That one just needs a (u32) cast, although the 5 can be moved.

	David

>  
>  	if (delay_thresh < 1)
>  		delay_thresh = 1;


