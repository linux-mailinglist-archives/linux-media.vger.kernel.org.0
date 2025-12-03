Return-Path: <linux-media+bounces-48197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54786CA1B5E
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 22:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C510F300AB28
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 21:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB2D2566E9;
	Wed,  3 Dec 2025 21:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJXNXZJf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F762BDC00
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798393; cv=none; b=UyAuu3+H0oulxRwY5uAUusQBsT7Hp9d4jOl4PhxshsvPhCRAwp74+2iFxMoYATcIYuIpM5s1s2DxgmX2cACVqwCKquKdTCEGD8Jy3PmO42gVccp9XBNlYEdOwAMbH3uMlmya7Hy+x+Sot5SAQIQx/G+8HBp42omuJNbzUFyLLVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798393; c=relaxed/simple;
	bh=LW4lF+HH7tPDvaO0olYxEhH3URnBMluWxNHc4QvhG8A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=jdMDrFXNvioWaY2tAOXDs3ZK6dYgclihjZsJ6DpaYGjeyDhcB5yAP+S6koPZJ8YyE+ubr8XqM3/LZR1OVmBGqIB9uiseOa8ty3kCEHaxIln+E4MzVsQGojvOP7OxFe7wVz4Q6Yk4A5Ppm6RxmpZzzQ9K0uf0ZXIEf7XIPvcFBtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJXNXZJf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso1234635e9.1
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 13:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764798390; x=1765403190; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ml6i+iixnqZ1+myXTzc7GR7t48tkR/Xa8KrRUoyFSXM=;
        b=XJXNXZJfHi/Wg8IbjztJ2lxUAXJYV1FUyZdrIIvsh9CxbNIdVWBaL+aaW8KxGOdIvP
         JHLl1S0N4tdO6Wrt9cxU+tADz5Wy1Dkuv0mKchq6cOUj0yaIq6kdkQb3G49LDY3O8rKQ
         KQfp/r4ov1bUCxF2xjvEQVLPnDgEknoHwZczfCnaq0VQt2wW5eSkvtMj9zI0+kSBma+e
         jWYKw96ki5O8ROzA9llgIpCJg8HePdVd3bhFPt+z+viULhltv0dFrAP9GC+0qdwYBBc7
         vvKcwSTTXiTdiQ89j6CeH0T85mqr10TLiBZ9sgG02G1po6ARa/4BWkXBT1RA9Dd+QuF4
         26Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764798390; x=1765403190;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ml6i+iixnqZ1+myXTzc7GR7t48tkR/Xa8KrRUoyFSXM=;
        b=nVXkx6v9GjsiQd5Db9FRv6z74vje1IrOdFhAC8eXhgIVeD+urXzNh7P7rBQjkLF51F
         FtBYxv9h59wmtGO9wjPeds3hIdkBZ1ev8qjhYnEC/IabAQlmPOXGUgiuJoows0TXTHNm
         q8UqqF3Rsc1g0L0nHzDAhyHQg/WTy5k2vJ+Kbtb/L4LrBjGpZDNbFj14ElN3jW+GY1wV
         nFRUtrXrfVUakt9jl8QCwjjc1o3gEAkXq+N3fJRIsJtkSrtTDvloWK8VsdIDAFj6aAKH
         /TEb2buSo+IDA3+H83QPW80gy7eWLSFjKY0zxL1nSnHXPI5lPvT1bREXxFB/Xvep5u71
         2hZw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7ZxdAalBiGJT2Wkb7WKl1s9XUEZaREUHM9mJUWsa7mPyTCphwPZ1AiTv1nhN/SqugI8G0O9OUAu4QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvkQWJTd4vR612Osx5Lg+rWRFsgkTS9NeUbmEGlCLIvQgGj1UQ
	+X4Brpgw0uOLN9/806Lhp6vlkt4Vm5Z1Frkjrm2Gt7MVieyGUk5gXJJ8
X-Gm-Gg: ASbGncuOB/ggQrpCtTsrFOvCtCIqtbGI4bipU56PfGTgNC3b7XEgIo1k81AVAH6Psq8
	SZuzwMBvEgBZNQGZv/YiLxKruSRskIffzrIsnEVX4V1AbdWD1HS2lhlJyA8e2akS9xL3DXTm2Sp
	93rp4l1J3ddBlgOduZASlG34/V8Ofn1MSAgmbitjSI7elEMRYXvmdYaBHrKaD80QTYllBdqka3M
	ZSWTS2Pjx9wXUUHnJ03ekBIJ4APlY5ee2VXv+bihDXv1OEmPUa7b69gEsUstJ+4kgMkuR6jKvTC
	o2Z2jKmD90o7xbKcDPNSVJb1JWJw/3u8Iz9gPUW8RvAnf06FA1Ja78i98ASEAstww9quHN3aQXC
	nfUzlxBDhbHiIxUcTQXwjVNCwuzpenQ4TGHvMFPkC3WP/UqAJXiDseSLFYKOqc+ThYbdlKg==
X-Google-Smtp-Source: AGHT+IEwjZ0JPXBovvmIeAz1rFRWiLXUiZvR3mpMDAoWQKC9a0d3PqIr2JyudmYb/szjyUbanTeZYg==
X-Received: by 2002:a05:600c:4693:b0:477:8a2a:1244 with SMTP id 5b1f17b1804b1-4792aee38c7mr38832705e9.11.1764798389787;
        Wed, 03 Dec 2025 13:46:29 -0800 (PST)
Received: from localhost (a109-48-201-233.cpe.netcabo.pt. [109.48.201.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b61bceasm26934465e9.2.2025.12.03.13.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:46:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 21:46:27 +0000
Message-Id: <DEOWTEQ7X9OX.2CNNQEE5IOLSB@gmail.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Promote Frank Li as i.MX7/8 media
 maintainer
From: "Rui Miguel Silva" <rmfrfs@gmail.com>
To: "Frank Li" <Frank.Li@nxp.com>, <mchehab@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <hverkuil@kernel.org>,
 <nicolas.dufresne@collabora.com>, <guoniu.zhou@nxp.com>,
 <ming.qian@oss.nxp.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rui.silva@linaro.org>
References: <20251203212205.1320623-1-Frank.Li@nxp.com>
In-Reply-To: <20251203212205.1320623-1-Frank.Li@nxp.com>

Hey Frank,
Thanks a lot. And sorry for keep you waiting.

On Wed Dec 3, 2025 at 9:22 PM WET, Frank Li wrote:

> Move Rui Miguel Silva to reviewer since he does not have sufficient time =
to
> maintain i.MX7/8 media drivers. Frank Li has the hardware, complete
> documentation, and has participated actively in patch review. Promote him
> as the i.MX7/8 media drivers maintainer.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

> ---
> According to discussion at
> https://lore.kernel.org/linux-media/DEOKQZMPDTLY.3H4NBUEC3LNHE@linaro.com=
/,
> Rui agrees that Frank Li will maintain i.MX7/8 media drivers, and moves
> himself to reviewer due to workload. Thanks to Rui for his contributions
> and maintenance of these drivers in the past
Agree and good luck

Cheers,
    Rui
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 48810529994a5..900d5237f3ff2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15704,11 +15704,11 @@ F:	include/linux/imx-media.h
>  F:	include/media/imx.h
> =20
>  MEDIA DRIVERS FOR FREESCALE IMX7/8
> -M:	Rui Miguel Silva <rmfrfs@gmail.com>
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +M:	Frank Li <Frank.Li@nxp.com>
>  M:	Martin Kepplinger-Novakovic <martink@posteo.de>
> +R:	Rui Miguel Silva <rmfrfs@gmail.com>
>  R:	Purism Kernel Team <kernel@puri.sm>
> -R:	Frank Li <Frank.Li@nxp.com>
>  L:	imx@lists.linux.dev
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> --=20
> 2.34.1




