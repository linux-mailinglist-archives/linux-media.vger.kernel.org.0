Return-Path: <linux-media+bounces-20041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E2B9A9FC4
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 12:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 376DF1C20980
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 10:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D2E199938;
	Tue, 22 Oct 2024 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GlADng31"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408AD12D1EA
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729592213; cv=none; b=ixwva98/qbYfx12cAG0y3TG5bLyjSSOyzqNu2RPs2FjWvva91An3tuzwSVjMnSkDqOyrnZgpUqPTLUx+SRxMinMwk+CjdEhbnE27XvAalGsBV4vylIGyviEsXxqqCIBmy7p9cGmtZNJpazuDOuZUcSkO4widaDg4kzF74V8SuSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729592213; c=relaxed/simple;
	bh=5+T9sKhiPC31wrXFvuAykfhWIuRofahIOMT1fX7Eql8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjeheimMAEtRZAEl83AUJ5nfmZSo8+tjg5YpbqExqJpHyc6pYe+0CpuToXw2T/+bkshDfsxI/zQeYNgVB6jcwVqvFUDKZ4Jnr7UbeQMaM0B/UQe/VeLCsUeN/KELO/yaCkg9+p5gJBmuiHlZaadKFm5U0gh+nuolL1io7rNKFeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GlADng31; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so4146312a91.0
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729592211; x=1730197011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxbsV5OatFVKAj/cbzY/Z3z+++Rf+JtDnESZsiutVZI=;
        b=GlADng315+UQS62Cdexlx0qewwwi4VzoQbiCftuvr8JCe4VtkLt3GWxPW+C0xt8Pzk
         z75DVp5hPU8zhRvrx1tE1gkXPkMTJoSJPGJjP29FJHChF6EnXHkPqq0drMB4PnqRDnwu
         h27eQXUM/LqTCGPbdb/Jk4jKBIshRwEeKPaT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729592211; x=1730197011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxbsV5OatFVKAj/cbzY/Z3z+++Rf+JtDnESZsiutVZI=;
        b=QLlZlCny79jCR4XAdv1n8fQsqt1xcYgSaoPmb2XicsbOfgipObVTx8f+tXZoxVuxKS
         u1uhRNzS4RFIxl1HWnX+Q/iYmB4/d1La94Fnl/LDDnSRcjd3eiR/9UBFf2kJN5S38loI
         O15lFTOZ0W3fcOg0cOTH7GwqjuPCv8WzSHgcRAev/0yJkdkssnQnS02nBEygafN4stVK
         xKt61tAzdEsDaQNM/XGfybeviyYzf9lqGrvY3B/aOHK/M2cjJ8qDDgV+SCGxFVxwBfHD
         TTwoQb1lfBntQIil+h557caEofz4JYwBQ3nopxg7WT41JcU/zOrmK7e2CLwOglnlXO0f
         QRHg==
X-Forwarded-Encrypted: i=1; AJvYcCVxl9mUuUepAQ9u/4Zstw9wgvadPMd537+UrIMIcZNN6WxJUNgV/nm7Nn58eZ4y2tYXIugIPHnx89a6nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcarm65bnc4D6UVvqvlZX2N2j+Ul+2uQ3pcXxqNx5eEod0ory/
	SV1LtoLHDmDJmGvdgdOksLsQUde1AMdWm1VH9xljY3PNtHu9E5twBlqsHQa3DD1KAC25EL0dT0w
	=
X-Google-Smtp-Source: AGHT+IHSFRrQW8yv3nVYYgUp2yiAJwgPvIJIYglFw1iJECWKdR+0Q2RdNARR+6dmQC1kfZnDtDEfxg==
X-Received: by 2002:a17:90a:b97:b0:2e2:7f8f:3ad7 with SMTP id 98e67ed59e1d1-2e5ddb47dcdmr2307130a91.7.1729592211168;
        Tue, 22 Oct 2024 03:16:51 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com. [209.85.214.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad366d28sm5818980a91.18.2024.10.22.03.16.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 03:16:50 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c87b0332cso128715ad.1
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 03:16:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5shVMzXuIUuyoSKRC/fIRKt8rZkf/wlaoqDlQfQuXBhY4HGyPyULhDrGBNifigx/YhvcceoUous6KMw==@vger.kernel.org
X-Received: by 2002:a17:902:db0b:b0:20c:a97d:cc83 with SMTP id
 d9443c01a7336-20e97fd5e19mr2449955ad.16.1729592209876; Tue, 22 Oct 2024
 03:16:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022-vb2-comment-v1-1-8a755f3d98d3@chromium.org>
In-Reply-To: <20241022-vb2-comment-v1-1-8a755f3d98d3@chromium.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 22 Oct 2024 19:16:32 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dkrr-U5jgZb5vN8zw0-2cYBV+y2podSQO5zuEq761CBw@mail.gmail.com>
Message-ID: <CAAFQd5Dkrr-U5jgZb5vN8zw0-2cYBV+y2podSQO5zuEq761CBw@mail.gmail.com>
Subject: Re: [PATCH] media: vb2: Fix comment
To: Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Pawel Osciak <p.osciak@samsung.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 4:56=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> If V4L2_TYPE_IS_OUTPUT() the information has been initially provided by
> the user, not by the driver.
>
> Fixes: e23ccc0ad925 ("[media] v4l: add videobuf2 Video for Linux 2 driver=
 framework")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/me=
dia/common/videobuf2/videobuf2-v4l2.c
> index 293f3d5f1c4e..9201d854dbcc 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -231,7 +231,7 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer=
 *vb, struct v4l2_buffer *b
>                         break;
>                 }
>
> -               /* Fill in driver-provided information for OUTPUT types *=
/
> +               /* Fill in user-provided information for OUTPUT types */
>                 if (V4L2_TYPE_IS_OUTPUT(b->type)) {
>                         /*
>                          * Will have to go up to b->length when API start=
s
>
> ---
> base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
> change-id: 20241022-vb2-comment-f5e93ca193d1
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>
>

That's correct. It's not really a fix, but a clean-up, though, so the
Fixes: tag may be confusing. I'll leave it to Hans and Mauro, though.

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best,
Tomasz

