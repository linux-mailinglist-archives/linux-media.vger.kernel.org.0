Return-Path: <linux-media+bounces-26513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4CFA3E240
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 18:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC658704B61
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 17:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9561215067;
	Thu, 20 Feb 2025 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MLGiFGfv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97512135B1
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 17:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740071704; cv=none; b=kmRFDWobTbtQJd1iEksk4uGIRGGh7ET5gB47JAGLfEboYRjlIImgTASoiWWZH+fSIeP3tZUS78Xj7s4BjSJAULCOtxhKQ1g7c2f5OZIRt6sy7fjMuj0T13gnEBetjowYclkfRXOTWLAAG/FsupWLerpSYj73yVQZhv0gbLfSzMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740071704; c=relaxed/simple;
	bh=QDzvTG6s8X3v7JBFs6BYnTXCw/eUqyjWci0yVfOV4Vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ua4fdOa53T1Un51jihHTXADk0zbUeOh42/uTGmM1KbHJ/vYdrhJm9VlsgXJVkQBL5/cjFElEd0Ve3sgC5hbID4cyUYSHMYb52f7E4EWg4XsPK5nAuuzampL3DkQ/YNb0tGJMByTPwBdEADEjFBirCO/Q4OyFMIJkNY/c36mdp8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MLGiFGfv; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f754678c29so10485637b3.0
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 09:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740071700; x=1740676500; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwq4WmBNfvZIFl95mQweHpQSFemw3YwiC0sTz3/2Y5I=;
        b=MLGiFGfvUOXisQEdl5IaKupUBH92wcfmswLy55IghtEIqtMohZbFDN4NXNhG3oj14t
         DEvqBvieVxklJz2OlsFGl/zf9gIMpBQumfaO9JgiSUBVj+zETLx8vOV//424M6jdft9x
         VAu17OgfzIJYNwYrkUfFwqu45ap4YxO6GqXTgRHzzIqawGAoCXqOEYHJhGlxX656dndi
         Mo+0aYmp/hth53dsLn991+rbHWR5Vd1UnOupARV3XZJLTxYmIfEd3zifNF278NuehEIg
         R2I3tRSR1IARK48KMWOHVttX+ISGwDz+9pcsKv4EwOjvxYYmJqaDw84bvuwa9yCYwpRe
         x41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740071700; x=1740676500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dwq4WmBNfvZIFl95mQweHpQSFemw3YwiC0sTz3/2Y5I=;
        b=n4epWqjW7FxJnnAZVKE6uXyevTXiHI8EU8d4kqdS/j2DOSiTWnilcFl8btatr8eSnJ
         iUayJ/FNxBeV8ENe7MGEtxYeYbqdN1+2F3KhRxh5PTGf2Ljj1YUOXQX7jsakG36MiNrG
         W41yPY2rmJ+fK86SSBqGky/xoPKQClt+w233OV+oeGNqmlMAFWYSdVCjmlW5SyyU69sN
         37gyw590xzINcvoDoyER7uZYnD7Medf+fgrNJ2t69i4HqpxfQeinhzX86uyn3OCD0GPI
         l+FrnsczGAQYDu594Y11CnXUxo2zRCvXweVxD3BLhaXVHvbtI+uonvpzipY3cjrBc0Hg
         fjNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxo6xVbNQbVm1P6dQBAO2cElkf7kWmLA3XFVnvvjvb/efz9N8ONBxu/OOTKFA8ZFU4ILJ79oKCQ2HArA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGyApO9ujoyu8jV63lPPmEk+t9LJOPegrumTPzpbU+XXpJSuJ
	jQA6DBl3OamnqkL7FFR907GbVeKVg94j7/U/S+Py2KviD0CJLCeqbpEUghtbvIy2qrppih0GIId
	h9Dr3F7zLGQa5GHUKU51xAoypvmLyxF3E9qrqUg==
X-Gm-Gg: ASbGncu7Y2pm/qRdl6s3cdAGxIbf9RHrjmdj4VxOx7cGJPwT6JY9w3Yp9fEbR3js1+E
	7y+Sse89+os0Qyc5s2RaIMmvPKC1s8XdIOtCz64B+Aje0Pnf8UunYLM8qsmTvGNQJbVBDf/NA5J
	WC0J4yik5R+MbJW7h2f3m1QMrOq/4j
X-Google-Smtp-Source: AGHT+IFO49Zspuw3Y4wLu3ybRNvKs4qpn85CyMjYcPYJhNXmmry9pN/CTOklRPcKwt06H80cWgbXBccGMGOIS9WbEwE=
X-Received: by 2002:a05:690c:480a:b0:6f7:ae31:fdf with SMTP id
 00721157ae682-6fb58293a79mr195681887b3.12.1740071699101; Thu, 20 Feb 2025
 09:14:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220140636.146506-1-demonsingur@gmail.com>
In-Reply-To: <20250220140636.146506-1-demonsingur@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 20 Feb 2025 17:14:40 +0000
X-Gm-Features: AWEUYZkEoEHAzoYp6ApjAyCcr86g2Xt6MXZfxRvrXit0l0TR_2CU3wyUn3r-_Ks
Message-ID: <CAPY8ntBNtz__=otVz_7b4cWBiHCoimBwij0EUUad8EXvTJ+8hQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: remove context around case
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin

Thanks for the patch.

On Thu, 20 Feb 2025 at 14:06, Cosmin Tanislav <demonsingur@gmail.com> wrote:
>
> There are no longer variable declarations here, the context is useless.
>
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f662c9d755114..fcd98ee54768e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -947,10 +947,9 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>                                 struct v4l2_subdev_selection *sel)
>  {
>         switch (sel->target) {
> -       case V4L2_SEL_TGT_CROP: {
> +       case V4L2_SEL_TGT_CROP:
>                 sel->r = *v4l2_subdev_state_get_crop(state, 0);
>                 return 0;
> -       }
>
>         case V4L2_SEL_TGT_NATIVE_SIZE:
>                 sel->r.top = 0;
> --
> 2.48.1
>

