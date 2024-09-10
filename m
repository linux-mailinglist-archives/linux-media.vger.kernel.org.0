Return-Path: <linux-media+bounces-18080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 788169739A0
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 16:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0B82B2624A
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 14:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AE8198A07;
	Tue, 10 Sep 2024 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BtdVmvkA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7AD195FE5
	for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725977713; cv=none; b=F2zQXyJ/4pzWYOto+bk+PioUQkr46pEwQbKJQrM0EwNypd1LES9I2kl2eSL6eEwCEQK0RKjSxRIAHNa4Ro+LnYfBO6KZ7uDonCUi8jekuecsSvXeC4lARolIN5UCUVppfxuqcjqwauf6We+zcV6a9gDWQGnAfsTFb8x71xbrnSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725977713; c=relaxed/simple;
	bh=o12lXWffYA2duKfNkX3xBv+v9fkQ0G/xTm6g4Zkt/HY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PyYb1sZTit8HBGDiVT/ka8LSj804wDb9QhXLZf59XorGrUAIVFtOQlAyQxiv0gsi7m7Xil383mYMMOTO97GfuSYLy1l66L+qcwk+fFLURnsuRgXn0pT6rFqIUxsAfHvup7C6Ro7UjXdDgBMOratPRykPdANmPAiaGf5q7KZYOYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BtdVmvkA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c2561e8041so6495785a12.2
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725977710; x=1726582510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o12lXWffYA2duKfNkX3xBv+v9fkQ0G/xTm6g4Zkt/HY=;
        b=BtdVmvkArkf7hu636EeTaeUoFS/aHpaGBe2346q6wqinG1w9tytSmkumoSbITehion
         FVGreHAR5VwJlo9svxr74B8dzjH+rC6rKz5YJ9MaQdV6vh43G21V5ICKwUWirJAeL4NM
         zPN/ELX8Nn2lQxEF1+wSPHgIixDOy/fZNc+HyNbaIMuFXTBxuyAeTsfCu2m7AmxyOzYc
         egfm1nlU2GEDBbZp+oByhJsy+NpmOyoZnfBoeAYhYW5B5uvEdDtwZZYOSuQ/GjdzNQ0h
         bC9ZlBHRjlnCsBoJy9OxS3TV7yQSbzqRg68hswbhZaXD3I/UK5sJ4Uz1dQ/2cdc0YKXg
         Q6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725977710; x=1726582510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o12lXWffYA2duKfNkX3xBv+v9fkQ0G/xTm6g4Zkt/HY=;
        b=ZUJEXXHULQP4VjkEVw6hq0Ozmc5TspNKFsIYMf5N0BSV3zyYK5A59lWqhRVsVC7+Ds
         Hv2gwtGiPuhbxkogZ8oCRMdMMiJBhhULCFlOhLGivx96dmN6MgZnAnj2RcAFHpFH6TXf
         nw3BISqGT80ZEQHa4Y0vrUsLMz4E4aoJsNbrPgal+ROiDb+Jw9jJCHSxpW/O1u0+vZri
         KcZBEXWipNuBORbS5yw9x6LbAou4CzCxsBrU5Xdnhcbn9YrUIEdctCMfZ7u2FAxOHKK+
         xA0fta1XE87z1yPdlpVwJSdOMIHTWbmL6w4pPKAdNTAMVM06f/hZ2zL1RAl0ZjHGMaJL
         tWMA==
X-Forwarded-Encrypted: i=1; AJvYcCUqjOUc5UNv6e8QlytSsVBJuTCsTz1qq+zymaJbj34Vg+HzFe0DSS61hBZbX25ZNbSuVEk7EjGYLrpKhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF0GHudX1KM4J4rGLxde/4Ii/zJIWWxTdw0XcLhB7A6qg3qTGB
	mNbQiNzzyUKhotvGQVJc7GQzpmp9rn1OZlx8V53AmF6ZCu2RlPOPjqXJahe6bTDeiQ5yiIgJtbz
	g7YFJ0Lu/cOyx+Yr5F7pfw5954viYYUBJmAPfmQ==
X-Google-Smtp-Source: AGHT+IFNbnJcv991n6EaGeE+4q5VW27Y2Ncf5QyZ9FldTxQk0HrQFWE/YbOvJOp9f8ir/5TrCOSOe0F83sf2QNM8B9w=
X-Received: by 2002:a05:6402:5cd:b0:5c3:cc7d:c29d with SMTP id
 4fb4d7f45d1cf-5c3e95354abmr7741754a12.6.1725977709882; Tue, 10 Sep 2024
 07:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906000314.2368749-1-tjmercier@google.com> <CANDhNCqudbuWM-WG7jiY_KQfgOZ84nAwWUfUHNzgniBiSZzeyA@mail.gmail.com>
In-Reply-To: <CANDhNCqudbuWM-WG7jiY_KQfgOZ84nAwWUfUHNzgniBiSZzeyA@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 10 Sep 2024 19:44:58 +0530
Message-ID: <CAO_48GES8YytcVyTsm3a_eeL65B41bMnCj=q=e3F6GKg4V-Sew@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Add __init to CMA and system heap
 module_init functions
To: John Stultz <jstultz@google.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, 6 Sept 2024 at 05:47, John Stultz <jstultz@google.com> wrote:
>
> On Thu, Sep 5, 2024 at 5:03=E2=80=AFPM T.J. Mercier <tjmercier@google.com=
> wrote:
> >
> > Shrink the kernel .text a bit after successful initialization of the
> > heaps.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> Acked-by: John Stultz <jstultz@google.com>

Thanks for the patch; pushed to drm-misc-next.

Best,
Sumit.

