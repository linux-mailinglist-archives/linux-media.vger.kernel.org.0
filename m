Return-Path: <linux-media+bounces-19063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BF598F468
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 18:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 432B428215D
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 16:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD0D1A704D;
	Thu,  3 Oct 2024 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXMzyV1m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6331527B4;
	Thu,  3 Oct 2024 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727974058; cv=none; b=FXXx/+XyUaY+JZuOeGhFyKEnGLJhm7ItWiR1E7JxFhgIMw1HlqG70gm21bVBZyiTnXB8bUo2EdZkj3uG9cGUjiHXY2GfoCsHBeM+e6mwMRarYMeA8XEOWYUkWAj4cQXjijC2qGm7c00EeXDiVJOOVSzG4jpRqkQgRXa8DKDg8Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727974058; c=relaxed/simple;
	bh=SQdnVgiNWl8DyoVYZQVhOY68PuDDCJZ7vrWQquscuk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olVG0Dk7YobAC83Jzx0qafuTb94Dxwje3h4rpi9Yxsh9ZrgHXpviXp4YutrGaGJTsv8jJhig8OopBuZ3l8rjAzWCCfogNV7R7QWSv8D50jnLK2Y7plGFJVLl2Zgs1OqnbRtciB+iudP11HEbXSxgeLPd36qsGKN+L01+h5RSArs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXMzyV1m; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fad6de2590so21174021fa.0;
        Thu, 03 Oct 2024 09:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727974055; x=1728578855; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=psqXgVYQxh+Nqc0Py7UigoY7uptpL1QNQzj4fqHhGjU=;
        b=KXMzyV1mrMXXNeK0nZAr+ZLifPPuqjlDLA9+wNeEZRpGhSAnnTS6Vs9NsI/C9+FEQp
         PYKKhPihrOtrn8SIEHgLl3Fi1FYYDZaOu/KcOz5b93L7do3UbUpNgixeVozCWHtSHGd5
         p26loWOx/1IOjRCvLRjI/V/67LXSL+2k8OHFtt4V7xWUEMYNQq8oLw84zZG/wszU6iyc
         yLDh8T32nH+nLVvN+/ddYIpQr+Im0J8PMnvi8sGrEmPP0YMvC5L8EW3xTbP+/PfDbp+D
         7brFjyIMFvuZoofVs0t/DVSWgxZNokYPc2CrKrxfZY9ruNIc15aSGZ/OFkAh/mVBlsAp
         5aAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727974055; x=1728578855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psqXgVYQxh+Nqc0Py7UigoY7uptpL1QNQzj4fqHhGjU=;
        b=IBdpZZDg+l+C8lRbqKXgg1QQY/jls2TQ1CdVCz0ae8OYNpXB6JscD4MYivj2ddcr4T
         MMhU9BlrfM/9EmopkiiJjlwOGPbpmWXrbmtoIjvSIjBn8riZCBB2DB9a5iM50zwoNZFy
         cJR43GgII5bTdFEWCy0xruZqZ+hD/FjuMkd66S23shH3E6u3lRLc56oDWV8+q5EFpE9h
         Rknb4bkRapkhROoXeDGM+owZob/vcJgFYOdp65wmqF56eIcMhZl120iea1KBX+S9wuLI
         AFjMIbo3Ca4xICJQsY3oCNgprDPBC82ZhI/C4oNQU1a5vbyThnUSqlKzOP7rXpb9Iwib
         c41g==
X-Forwarded-Encrypted: i=1; AJvYcCVjAn0MZ5h/D/TlWokkIkcP7i56dPVlF+HkwPBeyV8mzLaOt05A0UbaVc0jmGhFK2ie6a7CxQmmQFkAV40=@vger.kernel.org, AJvYcCWeVKY5rEgcQTRKGzX3nRpOg4Ys6bsnarbLgl9z/NqHrinKMpoCqo5TOyrIsMovXd1mj2zuIDLfFP3WhiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLgsMQJasJCeh/BmHv1j+utJau/u0jP8dNq1m1BP7Zf8Yv4qWE
	ZEhP/ogrc2JYmWpntxPNKFXsBlz2tcVMRF3/PJdCky7T5msf5oYaG6574g2vttq/agLU8+Bcrrc
	QHYvQAt1xtn/aEa5NeJqMsPhMrek=
X-Google-Smtp-Source: AGHT+IGPSZ3E9O5gAxhRq5O9LqntfK9B6JDHzw+kooRnu6f4cg5nHyGVMnGw5PmESsxX1yJS8iK6tHj52Q6zsyKi2nE=
X-Received: by 2002:a2e:b8c1:0:b0:2fa:c455:23c with SMTP id
 38308e7fff4ca-2fae10b4c0emr73735201fa.42.1727974054298; Thu, 03 Oct 2024
 09:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001174611.12155-1-quic_pintu@quicinc.com> <CAO_48GFPg=R4JaSZtgTKjh0TLKTrw24AF0nRMvFRXxwYCP28fg@mail.gmail.com>
In-Reply-To: <CAO_48GFPg=R4JaSZtgTKjh0TLKTrw24AF0nRMvFRXxwYCP28fg@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 3 Oct 2024 22:17:22 +0530
Message-ID: <CAOuPNLg1=YCUFXW-76A_gZm_PE1MFSugNvg3dEdkfujXV_5Zfw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dma-buf: replace symbolic permission S_IRUGO with
 octal 0444
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Pintu Kumar <quic_pintu@quicinc.com>, christian.koenig@amd.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, joe@perches.com, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi Sumit,

On Thu, 3 Oct 2024 at 12:27, Sumit Semwal <sumit.semwal@linaro.org> wrote:
>
> Hello Pintu,
>
> On Tue, 1 Oct 2024 at 23:16, Pintu Kumar <quic_pintu@quicinc.com> wrote:
> >
> > Symbolic permissions are not preferred, instead use the octal.
> > Also, fix other warnings/errors as well for cleanup.
> >
> > WARNING: Block comments use * on subsequent lines
> > +       /* only support discovering the end of the buffer,
> > +          but also allow SEEK_SET to maintain the idiomatic
> >
> > WARNING: Block comments use a trailing */ on a separate line
> > +          SEEK_END(0), SEEK_CUR(0) pattern */
> >
> > WARNING: Block comments use a trailing */ on a separate line
> > +        * before passing the sgt back to the exporter. */
> >
> > ERROR: "foo * bar" should be "foo *bar"
> > +static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
> >
> > WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> > +       d = debugfs_create_file("bufinfo", S_IRUGO, dma_buf_debugfs_dir,
> >
> > total: 1 errors, 4 warnings, 1746 lines checked
> >
> > Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>
>
> Thanks for this patch - could you please also mention in the commit
> log how did you find this? It looks like you ran checkpatch, but it's
> not clear from the commit log.
>
Thanks for your review.
Sure. Yes, it was found while using the checkpatch.
I tried to put "checkpatch fixes" in the commit header but the tool
did not allow me.
So, I removed it.
But I think I can add that in the commit log.

> Since this patch does multiple things related to checkpatch warnings
> (change S_IRUGO to 0444, comments correction, function declaration
> correction), can I please ask you to change the commit title to also
> reflect that?
>
ok sure. Last time I tried to mention "fix checkpatch warnings" in a
general way,
but the tool itself catches it and throws another warning.
So, I chose the major fix as the commit header and combined others, instead
of raising 3 different patches.
Let me try to put the same as you mentioned above.

I will correct these and send v2 in a different mail.

Thanks.

