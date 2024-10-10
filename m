Return-Path: <linux-media+bounces-19333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CB3997C72
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 07:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3E1B283C7B
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 05:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9304919DF9A;
	Thu, 10 Oct 2024 05:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZmiqHqw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508B33D66;
	Thu, 10 Oct 2024 05:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728538385; cv=none; b=I48qyW6UP2axLzhdyaGobspjLTPjCS8DNAWg0/mUrWFXrer2dMZ8Vo+vZsQU+XYrMWCCnqMqoEHFqNB01zvg8oByyGtNuN64ZFjMrjWBN8CuVrQd27mb3QKey8iyqmTiBwOm7Z274eE4A3cg6oy5taeGrqifVvCukyAx9R6cYtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728538385; c=relaxed/simple;
	bh=/mGP7sWCdaDR0hcYyVZKN+D98fVsJzKymVqUQgZhEho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jEUneObB8Oqqrt+0j50QhR1AQkyeqxqRRLFv4IAornnTNbAayY8/3jb2hPGUlXCgdJiBv7g+lfa3rT4Eh8LWLemfSOlKYTkb3/Lnd7QN2zDCXvc4rjMTUAC7M7dEIBfYfo9zPcSUXp+YroWMfmAWfN6agoSJIjKEFoX053nMJ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZmiqHqw; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c876ed9c93so568798a12.2;
        Wed, 09 Oct 2024 22:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728538382; x=1729143182; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QLeJpOVnaXgVOcwq4oaCZwxfF9fcKYWEKk+MpXHkeY8=;
        b=DZmiqHqwy5rtjuVrBRiH/NO52/ch2/JDmlrRg53tQfxrmfq5xaXEjRQk9V9lWJd4RP
         i0leQy7SyHZzHRuKXP/qtX92sqUgKqpI9+KJaBT67T1EF4tiSDx3yt4LMwgQsoeU6n4K
         TbmNltnF8NHu8ZCk0PTujoFrwQmRqYMOzl3qJWo1LtHvE30lj3+JZjVAi1tL+lkAabN5
         eD0Y+akgmqDORj/HRekwwYbF5Q0cDWVejYemwtLGKUowuxRFyyYOn/73DWdcz3gB5Zz0
         lQ5NZe8IJ8YsBkEABtvrV4ZQvD1pTjVQO5CvJ62doGy4kyORVWypyAMaffaqHwARrzh1
         tCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728538382; x=1729143182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLeJpOVnaXgVOcwq4oaCZwxfF9fcKYWEKk+MpXHkeY8=;
        b=i8ytj4+SyGBZ/UqstQOt860qUER7O88D+9rVBcVfqbo/8sHwThm6zAOaH1LquFX8zT
         AF0JMXJFiXcz5My3LCQuowjFAHpTZ+6bTTSD66MH3u6jtxvwz3bfn3mx6iV9ATXNyz8R
         rXwkW9x3r25Fqwa22Av2yS1rJU4Pi/UafWfDL+GK3yHifxN/gz57gzlV3SkyhyImtIAs
         QCvbqKJxrZ2jZ3xztKw4YqlNYLGtMtfUZyqrl/kD38QT7K+IPAIgy4iNy/qbnpmqLhQK
         IjqTIidgWIqhjnRgqQyHXm8ktkAkGyAAI5Fu2Tz4PIrEemqwiS55CVNqg7iwW9APrp3E
         OkdA==
X-Forwarded-Encrypted: i=1; AJvYcCUxm5zVjFEgytnPKM9ccPL+iAgPI7sKh4M35hVjwhuI30CCOhhD5pfgAon5U1XnGS4po0HZTpTWW34t1zI=@vger.kernel.org, AJvYcCWDScCaL3i21VsPFdcXD7LlahEbWuGD2mXOoIAnkw3t6hwiRRTT9kFVUzWOtlT13orVhJMTymOaCTjXLqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtkzt0L0KWBBQAouWo5+FJ7L19ywN4pcKjrORBkPaWEYZlhWhn
	I9ACSNS0Rt3/GE9uVL2M2B2i2P1oDsUrYVHcXyGm/Cq9FLwHjTcLX4pkuKXxUP+OxPFxM0YgFUt
	PAYW6gwVrOz/1zvZS9JisxrOSaag=
X-Google-Smtp-Source: AGHT+IFKUAguzyenCV4qtybKuD6WYqAQunGFYP7vn3PFEiqqB3Gh6EmfqyQza8duyB9kIZpAVqXRPE6V5VjbtN4Lhzo=
X-Received: by 2002:a05:6402:2116:b0:5c9:3451:498 with SMTP id
 4fb4d7f45d1cf-5c9345105b7mr1039423a12.25.1728538381414; Wed, 09 Oct 2024
 22:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005180955.6523-1-quic_pintu@quicinc.com>
In-Reply-To: <20241005180955.6523-1-quic_pintu@quicinc.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 10 Oct 2024 11:02:48 +0530
Message-ID: <CAOuPNLjO6Kz0=1Nnb3REsttH=3bQoUx7D1dRQX9fjTf15hLRdQ@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: fix S_IRUGO to 0444, block comments, func declaration
To: Pintu Kumar <quic_pintu@quicinc.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, joe@perches.com, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sat, 5 Oct 2024 at 23:40, Pintu Kumar <quic_pintu@quicinc.com> wrote:
>
> These warnings/errors are reported by checkpatch.
> Fix them with minor changes to make it clean.
> No other functional changes.
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
>
> ---
> Changes in V1 suggested by Sumit Semwal:
> Change commit title, and mention exact reason of fix in commit log.
> V1: https://lore.kernel.org/all/CAOuPNLg1=YCUFXW-76A_gZm_PE1MFSugNvg3dEdkfujXV_5Zfw@mail.gmail.com/
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

Pushed V2 here. Any further comment on this ?

Thanks,
Pintu

