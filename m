Return-Path: <linux-media+bounces-24941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D129A16AEB
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A3611886874
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 10:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E991B4F15;
	Mon, 20 Jan 2025 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="CAa5JwZi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EC21B87CE
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737369561; cv=none; b=uyPH/9t2xfhGKgYO9KUDVsLVO1mKs9pK2sBJUw69+XEjFzS/6aKIr9nBnRz5Ti8b9HQlD+yjNj3BqPudMlk5D7kQt8UfI7Cznn5Bk9PnFimGHHEYOh12/tCyTeX6VepFBgl4M15qPB4fopApyC1mllNjdGBFQ9HTS+b7LzgbGio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737369561; c=relaxed/simple;
	bh=2dnkfBVtzCkeEGQxzw3I/RarnlzWiUjZC2sCiuLY73U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9/xBJP9sdnaMdJnDY4TW4uplqJy4ZnhHmV3YmDFpWqZwwpw4+n6QCDFS2XKolz07tcp7CWSgFbnuNLSTzXsJIkdJZfDC1iidZt5l7P6FVEBCksRc4IezaNmjbBhQeg5kXrcTpBTqnsDm0X5/py9khWJmOL2xn6boMJAU68+keI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=CAa5JwZi; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e46ebe19368so6202020276.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 02:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737369558; x=1737974358; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kGd14gDnNee0TZ3EfihAD8aG2IEjW9nWf1PpGJigRr4=;
        b=CAa5JwZisbcIJHJzte60OzBORxMANj5P5UmfK8ZDiLXe+NSnE37RyRBTWOfWi6UdFz
         jFjSHSENStF8EZKK9TplF/K1qnmF2RnUxocNGRU93B8nSFoskJExKKVPnsR7Fsg9FZVO
         J1rapW709Exy50ejVOsIXSQ8FMPW9u4NkVmv85h+YqXFLxBz0oDTuvG2uScv5JAii8qW
         2CUDWrWEgOrsfl9U5xIpVESeCcpTJm1ITQR7EYKhDGrnBJ9t6eA0hbc+Ww5I/NBqJ0ab
         ND7/TZNNoo/ijMzBDcCGkHvU9mhwIMNLCq9gM8qJv+9mCqOATRtY8C6Z93Wc/qsj3HLH
         G2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737369558; x=1737974358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGd14gDnNee0TZ3EfihAD8aG2IEjW9nWf1PpGJigRr4=;
        b=oVhYta1Qa5iqd6JoTJ/+t41+J/1qPCZQQxPe5Ei3xt/lQakcZm6rZGqWn/bfHolbDF
         QfPbjZj6S/XjsappLfZNwrI/RFzYvb6EY7qp6an03kh/vOG0HkJOr9libUR5Eesw93uF
         zwwiUs51Ub1XvGovdQFMYzWuUKpETZBIJ20L1yHBrUWk8ipNlTI57nhbP1M2Gw32b6Uw
         XWPtuQMjX9dYzZjsKNgcHv5Q2nGQ0RaPwtkB89s4rkvce+SKKylWRfvk4WBZNUewthay
         wQm32fC3IYLBr0Gx3O2EsWdYdjwXAxGueCbms2yn1/AtBRqtWkx9XhLAxFF+VrvpkxzR
         MkOQ==
X-Gm-Message-State: AOJu0Yz4sMrQDJpyCxtdwhv8o/PgGvZyRfI8Vv0KzC4Pq/c2i6R4R8TB
	QWhRg6Cr1+NLs9iB/PtCP5hUie5Nu3E4x0tvhD+yyLePg4s8ljPRPPtSKDP7Jgdd+7MFain/QHW
	cuJi5m7z/y28yfYQRfnyIQrWHImErO+OaK9fWjA==
X-Gm-Gg: ASbGncv29rVT9cEW5PpqPIVo+J9yANsNtirMWEwfVfOyFwUy8q8z/6maV5NFjve4mdc
	F5loNimrEqHvF0EX7Vjl4o3SSRLxzf6lt2KY+Mr4wq1rxcqPTv9c=
X-Google-Smtp-Source: AGHT+IHWPXBwLhyrvuaeiW0RnBONM/yMdB3z73g/oOd8IeCsSgXyCkK4yHTu3wyr7dcjbUerNehWOpPdjZGSEXqo9UA=
X-Received: by 2002:a05:6902:2488:b0:e49:5f2d:e742 with SMTP id
 3f1490d57ef6-e57b103028amr8802490276.6.1737369557903; Mon, 20 Jan 2025
 02:39:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120101123.148482-1-sakari.ailus@linux.intel.com> <20250120101123.148482-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20250120101123.148482-2-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 20 Jan 2025 10:39:01 +0000
X-Gm-Features: AbW1kvYftu-lbKyivLhJo0FU8Zz9C52QZMdTVy7Bx2JBN2F99IbmvqCywYOM5zw
Message-ID: <CAPY8ntDat7SCXisA_bKq6=NrpQpysS3Q-bGhEre8KjH9imFHWg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: ov7251: Introduce 1 ms delay between
 regulators and en GPIO
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Daniel Scally <djrscally@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jan 2025 at 10:11, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Lift the xshutdown (enable) GPIO 1 ms after enabling the regulators, as
> required by the sensor's power-up sequence.
>
> Fixes: d30bb512da3d ("media: Add a driver for the ov7251 camera sensor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov7251.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index f3e2d26bb840..3226888d77e9 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -922,6 +922,8 @@ static int ov7251_set_power_on(struct device *dev)
>                 return ret;
>         }
>
> +       usleep_range(1000, 1100);
> +
>         gpiod_set_value_cansleep(ov7251->enable_gpio, 1);
>
>         /* wait at least 65536 external clock cycles */
> --
> 2.39.5
>
>

