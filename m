Return-Path: <linux-media+bounces-19018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6F498E9EC
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 08:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5C691C21E98
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 06:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C91824BB;
	Thu,  3 Oct 2024 06:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PETeABPv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F7A7F7DB
	for <linux-media@vger.kernel.org>; Thu,  3 Oct 2024 06:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727938669; cv=none; b=pojMaKvnL/Y8sg7NqlxdzEMOf6MbcSwkb7/s3St/ExpbG+W9gaCrBQwFz+A3EuXn0V2MVEN3QSB9kZshM2SCuXrfY9CEDLqS4L0azBnAi9hYPpHUTY2YIpiM0qnjuJ91cM+0oKeK0/yhogzWTpn6rpL4Qfy9rHTmcY6eoxQX/oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727938669; c=relaxed/simple;
	bh=oHxgNAg/d8qsRPxwf4s+VaLr3kQe3rroRD1BDVg+gM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcm7J9RysfH6m9NUlC6YO/N+OG8ZzIex+4FNGZV258g/8jfjm5c3v+ZUcAws0ACmnVrdOiddy9OISDUfw0VQOCw0Ddc8ZTjwUQlLoWDKegijuvyv+JJFWDfw5130d4k/d/kBeJc44NV/2wKJvu66mO2CHFRxBxvos6w4ToqLE7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PETeABPv; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c8967dd2c7so626586a12.1
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2024 23:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727938666; x=1728543466; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JGecQKR7ZoIYH4vaHNJNV/6/ajVJtBZfvfEOkIG81WE=;
        b=PETeABPvE02tj48SuqgWrYaiojzo1ZoaLLa8gUQmbyS++Ncc6XQTo5OxSBr1Wq0SIq
         3sDpIT8clE0/WTqGFmlvPAnNlwOMf4xT8alBV2HPXzk2SM8dGiw+18N8Qw+ABY0RNB4s
         3ZxsiUXS5LzN+kEG9B7trSuGosFg1XVKNYgoLKXs1H/01uD6ePF/2xeS/yCCcJbu4tOx
         C7xyp6HSzQ9FaJzcXG2js60v84ed3k7luEoGl8iq8CMtIZnL347GzYfmJHxHKD/rk7+k
         PK58/dMl/epdpv18BqrgMfUhLndx0UUXtjML/gZcxQYPjIww4BW60owM/ifDrLhTVSvZ
         3Y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727938666; x=1728543466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGecQKR7ZoIYH4vaHNJNV/6/ajVJtBZfvfEOkIG81WE=;
        b=r8mbcjcAF2ytTbKEdESOJu394cr90ccvduUh9/t6HOa6col94snI1THHgMJjn3NC7V
         iGZ2+/YQMeKmINfAcZIn8q1MokgG/YO7Wgww41zWAdyWYJnB9WtUMZb6OGmHcCWh8nz+
         +9uG4fN7zZ+sAJs/0FOOpjCD/rPUlMUoJPlLfAvbiNJZM/xdMqqE9KWLiZu/aLKQFdhQ
         aDEnMOzQqhLUDCKhIWW8huevANBQN583Y/wb7lfSYNOBrCK3DFMlyih6mj3dSd04Pian
         0J//dtHP0R1sCSE6nYxuyx1aaltB6ADh2SvMLeVChEYUBMCQ2j0LzzlLElGQXBqL84N2
         6BsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkBrBgXbzPSmG/IuU+v/DUeGDG5L2GVgI1GpMtX8Dppgwt2pg2SygkwoS1YKUGQE/Wq6etW//h2MoyNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDCFR1m6oGHHU3h0QqyWrYGYb6cp5AGCRtyVC6npTZmOnOJQ8b
	b1YHVaekFtK1qMdu5LCl4XvNgrldpwZ/eMtExcBexVyKzhTP5IDWWpNrolP+icGo7v3ylNAgzwJ
	gTuH6jlNpcyhNaon/ZB1YlkEcBbxKK2VtH39sFQ==
X-Google-Smtp-Source: AGHT+IH4QGNNGP1NJcTcHJDWHlXA92zW2AJIpIf/rMuRfbu+fTqO/rDiEJy3cDA2artuxJKreIShbOnY5J0XVGAbl6I=
X-Received: by 2002:a05:6402:5108:b0:5c2:4cbe:ac1c with SMTP id
 4fb4d7f45d1cf-5c8b18eed8fmr3645435a12.4.1727938665602; Wed, 02 Oct 2024
 23:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001174611.12155-1-quic_pintu@quicinc.com>
In-Reply-To: <20241001174611.12155-1-quic_pintu@quicinc.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 3 Oct 2024 12:27:34 +0530
Message-ID: <CAO_48GFPg=R4JaSZtgTKjh0TLKTrw24AF0nRMvFRXxwYCP28fg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dma-buf: replace symbolic permission S_IRUGO with
 octal 0444
To: Pintu Kumar <quic_pintu@quicinc.com>
Cc: christian.koenig@amd.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, joe@perches.com, skhan@linuxfoundation.org, 
	pintu.ping@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello Pintu,

On Tue, 1 Oct 2024 at 23:16, Pintu Kumar <quic_pintu@quicinc.com> wrote:
>
> Symbolic permissions are not preferred, instead use the octal.
> Also, fix other warnings/errors as well for cleanup.
>
> WARNING: Block comments use * on subsequent lines
> +       /* only support discovering the end of the buffer,
> +          but also allow SEEK_SET to maintain the idiomatic
>
> WARNING: Block comments use a trailing */ on a separate line
> +          SEEK_END(0), SEEK_CUR(0) pattern */
>
> WARNING: Block comments use a trailing */ on a separate line
> +        * before passing the sgt back to the exporter. */
>
> ERROR: "foo * bar" should be "foo *bar"
> +static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> +       d = debugfs_create_file("bufinfo", S_IRUGO, dma_buf_debugfs_dir,
>
> total: 1 errors, 4 warnings, 1746 lines checked
>
> Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>

Thanks for this patch - could you please also mention in the commit
log how did you find this? It looks like you ran checkpatch, but it's
not clear from the commit log.

Since this patch does multiple things related to checkpatch warnings
(change S_IRUGO to 0444, comments correction, function declaration
correction), can I please ask you to change the commit title to also
reflect that?
> ---
>  drivers/dma-buf/dma-buf.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 8892bc701a66..2e63d50e46d3 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -176,8 +176,9 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>         dmabuf = file->private_data;
>
>         /* only support discovering the end of the buffer,
> -          but also allow SEEK_SET to maintain the idiomatic
> -          SEEK_END(0), SEEK_CUR(0) pattern */
> +        * but also allow SEEK_SET to maintain the idiomatic
> +        * SEEK_END(0), SEEK_CUR(0) pattern.
> +        */
>         if (whence == SEEK_END)
>                 base = dmabuf->size;
>         else if (whence == SEEK_SET)
> @@ -782,13 +783,14 @@ static void mangle_sg_table(struct sg_table *sg_table)
>         /* To catch abuse of the underlying struct page by importers mix
>          * up the bits, but take care to preserve the low SG_ bits to
>          * not corrupt the sgt. The mixing is undone in __unmap_dma_buf
> -        * before passing the sgt back to the exporter. */
> +        * before passing the sgt back to the exporter.
> +        */
>         for_each_sgtable_sg(sg_table, sg, i)
>                 sg->page_link ^= ~0xffUL;
>  #endif
>
>  }
> -static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
> +static struct sg_table *__map_dma_buf(struct dma_buf_attachment *attach,
>                                        enum dma_data_direction direction)
>  {
>         struct sg_table *sg_table;
> @@ -1694,7 +1696,7 @@ static int dma_buf_init_debugfs(void)
>
>         dma_buf_debugfs_dir = d;
>
> -       d = debugfs_create_file("bufinfo", S_IRUGO, dma_buf_debugfs_dir,
> +       d = debugfs_create_file("bufinfo", 0444, dma_buf_debugfs_dir,
>                                 NULL, &dma_buf_debug_fops);
>         if (IS_ERR(d)) {
>                 pr_debug("dma_buf: debugfs: failed to create node bufinfo\n");
> --
> 2.17.1
>

Best,
Sumit.

