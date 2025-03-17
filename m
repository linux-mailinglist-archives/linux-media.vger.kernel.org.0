Return-Path: <linux-media+bounces-28362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98766A64E4A
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 13:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 432357A744C
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1695F23E346;
	Mon, 17 Mar 2025 12:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ND4sN0Kv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB93A239082
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213331; cv=none; b=PUG4dcuaeUudhPjQsFlxtCIAo06z4nQa7TR+7OXe2Nso3J+ARmOTft8tubwTLbc5Mz4W7v59GCL++GWEj2u5jrBmpvdI+wGbtaqbrR9Gtrz5k4lgko4FUBZFAQpJ0IOdYzYvUY0s/SpYn4Xzq5apoab0gzRYq6wxZYgAAF7m1Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213331; c=relaxed/simple;
	bh=9iXfixuSBDIc78RgUMbLHrK4yHUAjQR8XzDPw1h7zFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMH7O74OKkM2eRjNPklJ17IbomNtXtQVqhFXM5VbreMmKu5cxZpeLx3+i5qpqirb2Z8ERFXFyZ4V3DJbgyZQZLGtohgKSO81UbJgAK3O7U3JK3LAHZlBMwaZlAKxgiDzKnazrNUECUzrlcHd7YyLjDU5IQrCQ/K5AdVaZb8FvOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ND4sN0Kv; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5439a6179a7so4847163e87.1
        for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 05:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742213327; x=1742818127; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U/ODjBc7H+F36djhBChv/kX744H5zY7HbwroUiftCms=;
        b=ND4sN0KvKt2NO7Udv7yulD0U9AgN6fTlKE6En/a7iQaif0YTVlApTxTTzsI4K5SALc
         sz1xkLrhqh6F9TOhqXD5as5m3h0A7m42G2bqVY5vuMU9FltSJzCrpL/dLx/DYg9Ls1W4
         QCgkduJoH9RnmEZJKiDl6AfMiv6cKMr8D6/nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213327; x=1742818127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/ODjBc7H+F36djhBChv/kX744H5zY7HbwroUiftCms=;
        b=BCP2laSZK7UBQU80d5cKKIyty7O978pBba94tJyNVdGf26VFJa1Vv4iJg36ROiwa3Z
         DZROgoAHXH3GlKm/f9aOGmuNZk3IIm55pGBfEQEroxNmHWXoub8fRyBjkfgwKnDfnhoU
         POkgsgo4aYWVub0DhWtCXY25Ci1isDVqxMKPcdnlq52Fh2MdFPH/EI6PtTwBhLlGKqpQ
         /lWo7NMvUodcXxbCNAAtCFNVVYYDNVi2lsqz2bZT6ufzARDsLJRIvvZxnqz+t2cox/ps
         HdZzgvY7TtHETn16e5WMSO9Hx/jEu3s4EBS+BrSGS3JQ6c6QH4XYoIevzECMvW7mkIOG
         pWGw==
X-Forwarded-Encrypted: i=1; AJvYcCXHNbHKVTcLKBvdYNTXBW8M330clsFDElLUIJ6TiIyv1Byc36KJ3L1VQGSbFRMZ8Mvy1ibUGmxyvwZQPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7s5HVnf9GuEkUy3nAuU9wHvdI7GYTC0Ha1d9/oRwZqXT00mmF
	ZhJSJHsuZr31cJ36QV+i5xR/dpDcRRXJD2WlwcISgWtbCgiUQGpk3tKQejp/NVrvEVNGwWcd/AU
	=
X-Gm-Gg: ASbGncs1SgdQvgPuvZv7/L645SIuwVosQ4fbWCDQS+oQ6RaU2q6X4fi1n0pGVX0GYM5
	m4aNQlOa+rS05/p7N2v60HTJaaB4tXC1UTrzunnmU3aHG2WhevEaNsZwt0yQgkbtfjzs86ojHKt
	HSi0lV2i222sHdf2o6w3r5zww5769IYrCV7AR7+kDJ9cyo1NhBfLzW7y//fac1dc4lgrgC8FU90
	vjJXEfwtYaQC6GAp3fAxbMak2/I0/gnyvfrTLT5EX+5Qw9+yw6/R2QdHNIYphH257csMWbCRitA
	bxRj7QyrX4Vpg6CJKIY/rrsV0T/mfgK5OPhHbYy1AO0IwcqXZQpMzwq9KoKq6vnEttzJhy7Uz8d
	m/quCQ5k=
X-Google-Smtp-Source: AGHT+IEqfV+hZbCTvIoHhBLFAfPlK8dMNhCfp8cUVXh/mheyzorGY3iAsIBtq4OqtUH+pG7a4LAtjw==
X-Received: by 2002:a05:6512:4007:b0:549:5dcf:a5b with SMTP id 2adb3069b0e04-549ba3b41a6mr7490362e87.4.1742213327489;
        Mon, 17 Mar 2025 05:08:47 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f20a5cbsm15398161fa.114.2025.03.17.05.08.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:08:47 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5499da759e8so6051526e87.0
        for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 05:08:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9LIUh4BCHx7hb4tGMNB2CnXw55Mb2WKZN5VUijObrEHA2bbQWhiCfby83D8HVt68dgm6DncGa9UxMfw==@vger.kernel.org
X-Received: by 2002:a05:6512:6ca:b0:549:74a7:12ce with SMTP id
 2adb3069b0e04-549ba3ef133mr7614324e87.14.1742213325707; Mon, 17 Mar 2025
 05:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314213859.3543936-1-arnd@kernel.org>
In-Reply-To: <20250314213859.3543936-1-arnd@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 17 Mar 2025 13:08:33 +0100
X-Gmail-Original-Message-ID: <CANiDSCuqdy2UrhZ8_erFO4kjXwt_bvQgmrqmPZmrw4xaRwJBrA@mail.gmail.com>
X-Gm-Features: AQ5f1JoUk-w0vqc9PkqG9r76DrJtcTvoYlEAHfsnxS0XUCOOMftIXJoRmJY_6vM
Message-ID: <CANiDSCuqdy2UrhZ8_erFO4kjXwt_bvQgmrqmPZmrw4xaRwJBrA@mail.gmail.com>
Subject: Re: [PATCH] media: vivid: fix FB dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Slawomir Rosek <srosek@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the patch!

Just out of curiosity, how did you found this? make randconfig?

Best regards!

On Fri, 14 Mar 2025 at 22:39, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> It's not enough to have a dependency on CONFIG_FB, as that can be in
> a loadable module when vivid itself is builtin:
>
> drivers/media/test-drivers/vivid/vivid-osd.o: in function `vivid_fb_init':
> vivid-osd.c:(.text+0xdc0): undefined reference to `fb_alloc_cmap'
> vivid-osd.c:(.text+0xe26): undefined reference to `register_framebuffer'
>
> Change the dependency to only allow configurations that can be built,
> but change the FB to FB_CORE so this is also possible when using
> DRM with FB compatibility rather than full fbdev.
>
> Fixes: 20889ddede38 ("media: vivid: Introduce VIDEO_VIVID_OSD")
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/test-drivers/vivid/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/test-drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
> index e95edc0f22bf..cc470070a7a5 100644
> --- a/drivers/media/test-drivers/vivid/Kconfig
> +++ b/drivers/media/test-drivers/vivid/Kconfig
> @@ -32,7 +32,8 @@ config VIDEO_VIVID_CEC
>
>  config VIDEO_VIVID_OSD
>         bool "Enable Framebuffer for testing Output Overlay"
> -       depends on VIDEO_VIVID && FB
> +       depends on VIDEO_VIVID && FB_CORE
> +       depends on VIDEO_VIVID=m || FB_CORE=y
>         default y
>         select FB_IOMEM_HELPERS
>         help
> --
> 2.39.5
>


-- 
Ricardo Ribalda

