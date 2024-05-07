Return-Path: <linux-media+bounces-10960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D563C8BDAC7
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 07:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 873B02835B5
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 05:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDE76BFAA;
	Tue,  7 May 2024 05:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a+Nmix+m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BFC6BB20
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 05:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715060941; cv=none; b=j8mOLa5OTxUYwuPjSjcZdxp4NdDlaoSB9/rK71gDnTeUTiJJ/52lS+nEkAVwZkSoQ1Kqg1QraMHGDzBoU2Vn86o2nixpuCJjqw8XqxGrm0Mra6SFRBQiK+wpMaXIbyFAxyxwQF66MMNYjGomUum+rm6nnT4K+JVAhTIHpXnZW6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715060941; c=relaxed/simple;
	bh=t9dlTbe/g3KLA1ET9Kw6/A9Q290HN8s2xc765G74PTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgjer4gtOcjrTEoAQJ2vjyyQ99hKpmr3hoOL0rgZzbbs2SIOL4/e9EeBa1DDBOHkZ0WSgT1cnI6UQ1oJd44+NDsXH1ALRJWAdSNCFNkWDmWD71t/GBFjY0YmHt9aHvNxwenojMZvTHzCxJSW6sf1HXwnLtd2m6dp+AGbkv/eJoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a+Nmix+m; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-434c695ec3dso9750261cf.0
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 22:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715060938; x=1715665738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScA+j2xCyUKjc8/wOZ7cPsy5eXfk/e1HUYeZcCY1FUM=;
        b=a+Nmix+mB3kC04Tj5kGDoeSW8n8re8zXuZmab+zkpdR5FxWknZTOZQNR2hm6UFUhpi
         WqfOXoiXNcJgzsA/KMacW06/BFKDev3kspOFwoQWId0PAi/OPvbqpo4K4RRQGFGB7+AW
         AAIU/BUbSjIXlZHvUui1jggZkkD6xrBQgUaas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715060938; x=1715665738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScA+j2xCyUKjc8/wOZ7cPsy5eXfk/e1HUYeZcCY1FUM=;
        b=Gr8uc7f96AfFxCiKh/N35+DNjXUnDqgFIBqpjmgK1jLBYJotCZnMYFdxlUNpXbEpz1
         U32+ZEq+h6elYvvkjWS6ukI85IYE9ELdWvZzhjcO61YZn7y/vl4CcLOBdifDLB7odWlt
         OTW52dXQ5QPghM3IIon/YGYGorTSpE+HG8RErTzFip5AHHa72P/mE9YKkzxAsoge0Txa
         dWSH11B7WzEtKI2MB0jlp84nRy0jXyDg1/X8+nqYSJFKy6iyVg/iKijUupFTT91ZNlvY
         uW0tQQ0L1CDP0iuMieVYjOfIO+9JdQ5mUZ+ASGWx5+ITAFw6JPWiex3axSLEIBeyMBd7
         hjgQ==
X-Gm-Message-State: AOJu0YxsJmY4JgiF2/Os7vg4oTSms6/z4lnpljMqVWs/RNh+DDhhe6L1
	aUVNbTfmK4FkYFaTaNO9cwxYRuR8HgsqL84Ygj0smvU/xJMza/UNL5vmCBaAn09oRKqUNiOkaMU
	=
X-Google-Smtp-Source: AGHT+IGRA0UftC9APlWeQRQa+ODWD0jX46RoI14lu1QeGZjDEndl3EuNb9WucQzuqR+5w9ISD2FzNA==
X-Received: by 2002:a05:622a:4cf:b0:43a:c4e8:cb8c with SMTP id q15-20020a05622a04cf00b0043ac4e8cb8cmr13275069qtx.64.1715060938412;
        Mon, 06 May 2024 22:48:58 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id gd23-20020a05622a5c1700b004365ab2894asm6055128qtb.51.2024.05.06.22.48.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 22:48:58 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6a0f889877cso10480466d6.1
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 22:48:57 -0700 (PDT)
X-Received: by 2002:a05:6214:21c1:b0:6a0:d312:2c75 with SMTP id
 d1-20020a05621421c100b006a0d3122c75mr12869939qvh.64.1715060937316; Mon, 06
 May 2024 22:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240505174033.9163-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20240505174033.9163-1-laurent.pinchart+renesas@ideasonboard.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 7 May 2024 14:48:40 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DUKXMkHfGYT-VVfXtFRH42BxwOzKnTBDFaGU7syeRAxA@mail.gmail.com>
Message-ID: <CAAFQd5DUKXMkHfGYT-VVfXtFRH42BxwOzKnTBDFaGU7syeRAxA@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: core: Drop unneeded forward declaration
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 2:40=E2=80=AFAM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The static __enqueue_in_driver() function is forward-declared
> needlessly, as it isn't called before its definition. Drop the forward
> declaration.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 1 -
>  1 file changed, 1 deletion(-)
>

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best,
Tomasz

> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index 358f1fe42975..0217392fcc0d 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -199,7 +199,6 @@ module_param(debug, int, 0644);
>  })
>
>  static void __vb2_queue_cancel(struct vb2_queue *q);
> -static void __enqueue_in_driver(struct vb2_buffer *vb);
>
>  static const char *vb2_state_name(enum vb2_buffer_state s)
>  {
>
> base-commit: e695668af8523b059127dfa8b261c76e7c9cde10
> --
> Regards,
>
> Laurent Pinchart
>

