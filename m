Return-Path: <linux-media+bounces-522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A7A7EF78C
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 19:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9653E1C209C3
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 18:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCEE51EB24;
	Fri, 17 Nov 2023 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ox7GGa5l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E2890
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 10:50:34 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-da37522a363so2257944276.0
        for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 10:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700247034; x=1700851834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtpYAOIzka1JBZk8iAppwwSnkzFLFfJkyz+jdr3nWyE=;
        b=Ox7GGa5lvbFsB6OFCm0JduYejFsWng/7QAbNYILaxQzOXw5ryZ3gGXcohJnUYwqWxI
         M387O6Kg/0IfGXTIMDiHLv6FBYWoTfXXnYSLLxKIjBekczh0xAy9qzedb6iR70xIvWeJ
         pAjtmwMPBczU6mxPBXsiJKDby1FcPFTsMXWhiknnuUAzJ+FNNewzkdCPHhjlKJcramvU
         ek3c6QlXCPixHT6ke5QJ0DH1z9wLHRZ+A5dPVml1VeLhvxD+rzU5h48lTanmF4TWUP0+
         /Lfhe7st7tHvqGK2BHdOc3wZR4oigDrnGHJUUykNsNTokUmWl8eahgsj7Dhwm4MldZfx
         gXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700247034; x=1700851834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtpYAOIzka1JBZk8iAppwwSnkzFLFfJkyz+jdr3nWyE=;
        b=gAdfCdnzM7cHxjQhcS8G0SArp2guoQch8voOEUDebBxo2Wr6K9nDk/BIzM+Jg7O10x
         XG/lKwn9IcM/wugE//EkXLnXDrvTtg0SjhaNY4hF3hK8qKwdW2rP79YbxoB2QEJ1FPpK
         l8EXIU+ZiN08tstW8K4bksk3BnvO2sL0ItPxDaSRLJSkdCgLLaIJK6SfnvS39hj25kvr
         V3yfBTGEjyknHz1nNiPuKzDmprrq3Pbyo4k7Lr6gOYxJo9ApQPcTCNajmQhNNrunySoh
         cGmbfleJ9x5he/p57wqZ1XtibzhY5DGW9xaEg15Eo02IpovDXN/gdNVEblRKHO4j9A7k
         Trjg==
X-Gm-Message-State: AOJu0YxR9bWqTH1ygwB0/5RsTGawe0QKbMiHfyUMk/78SAS+YheK2SJ4
	zJ1BQLTjA1yiPPJ7Vo5SewiEZ513sJmanqINpwcwsA==
X-Google-Smtp-Source: AGHT+IFi5dwlJjXKeALdkQ3r7NL6Ns0Vqtg+0GbT2TnyYHl6vrk7ylgtgCrw4Xy73kvNJHON7kCIdI2uoaIh9nEMUls=
X-Received: by 2002:a05:6902:1508:b0:d91:c3fe:6144 with SMTP id
 q8-20020a056902150800b00d91c3fe6144mr286813ybu.3.1700247033764; Fri, 17 Nov
 2023 10:50:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231116191409.work.634-kees@kernel.org>
In-Reply-To: <20231116191409.work.634-kees@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 17 Nov 2023 10:50:21 -0800
Message-ID: <CABdmKX1oNw+quAd+ALcgGoz-PPsvy=O6YM4f2_SmP+dQBddzAA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Replace strlcpy() with strscpy()
To: Kees Cook <keescook@chromium.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Azeem Shaikh <azeemshaikh38@gmail.com>, 
	linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 11:14=E2=80=AFAM Kees Cook <keescook@chromium.org> =
wrote:
>
> strlcpy() reads the entire source buffer first. This read may exceed
> the destination size limit. This is both inefficient and can lead
> to linear read overflows if a source string is not NUL-terminated[1].
> Additionally, it returns the size of the source string, not the
> resulting size of the destination string. In an effort to remove strlcpy(=
)
> completely[2], replace strlcpy() here with strscpy().
>
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strl=
cpy [1]
> Link: https://github.com/KSPP/linux/issues/89 [2]
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Azeem Shaikh <azeemshaikh38@gmail.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

strscpy returns -E2BIG when it truncates / force null-terminates which
would provide the wrong argument for dynamic_dname, but
dma_buf_set_name{_user} makes sure we have a null-terminated string of
the appropriate maximum size in dmabuf->name.

