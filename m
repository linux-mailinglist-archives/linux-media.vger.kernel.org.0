Return-Path: <linux-media+bounces-26959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4EFA44291
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 15:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F3FE188607A
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 14:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA9326770B;
	Tue, 25 Feb 2025 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="EsNU/CKb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DE442A97
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740493172; cv=none; b=AeZQVqGMVwHRbm0mwkSw9PX/yONqcA8Tng+rm4Y2Hu41d8AnKE4O85pPwF8LNLUbwsysJbHpz0mZnuRDzWK8lAH4oGLNThKawwu2TyrMrVpPG4jFv4/5vUG+d03/OY1e7CnFr7Z7Xb+M02JXRm0J16m/j28+YhKhFzmjm0gX1Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740493172; c=relaxed/simple;
	bh=YfaowTrjdM+Bd8R3YzDrhq7lbCbVr2H6FlNDkDda0Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZ3/YAgd8U/2YcaLPI1rjM06IbxqXB+RhIZcpWKxBYtPZvCAdVxxO2TvrU3jJn1hkyhEfX2YaisfKU5zz1YydHCJh+1ENCrpGfj0G1ow+dKQDfrSWB6Kh0BTpjRjnBJ+bgG20nVviS2myVVVvNG8RHfKnct5HhPkDfKaDPVPnuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=EsNU/CKb; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e53a91756e5so4761082276.1
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 06:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740493170; x=1741097970; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G3qJd2sc6L4K5ZD860Vogae0xgCZ9+DNu5FmGC60GsY=;
        b=EsNU/CKb5oyJt9xAs0uaXVTY6MiyWQQDF6jV763+vIQeAw47hAAkKOPhfhk+e2X9Ol
         moGl60vTRG9ZmEbXbQBRldAgvppP9b9hQ7U0HP/k2yfvwOBnRSX+8atlMmEkTUZwytTC
         d3jLeG8hb+tYjm7TzqcWHwVQPM0+OIXnIa8wOYEaiQMfOKulQGXYOueZufwm+Ur3EY8v
         lJc79ODu1tidw7/C21gvFdBxPvdzrW38ufEqS/IPT359RModCa1fc5RZpHtiXqmE7B7J
         Twjh7mxRgTruDvDZD5MTg6tbTUnd44nMqmioVk8OAC9Od8TD3BlLtYqYVpqHNpcfIvdb
         0Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493170; x=1741097970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3qJd2sc6L4K5ZD860Vogae0xgCZ9+DNu5FmGC60GsY=;
        b=A4II5a1IVg43N4Z34K7rvHZmTNLOq/GTgZe8o/LKmh7eoUX8qK7J2e+YD6FfOo+izi
         k9UciHLCgSy36D+BXBuJWjIlnQMbdz9HFavUkORQtZlHgk7LKUURunMtX5BPCNKLwU2b
         jAvquMBO+iSKSDLK+zV5+W0A9pATX6Itnj/Nc4c+ZetL9iEfx+HeuaXwc8kMyAx0wvFu
         EArFhAAzekdN59Ze0Azx17mJTVQ+acAYM+2n/4tbEcpFK7RQ+BeaYOuYBvEd1iqCsM9u
         ZboKxcGlLwVp8OBAV6sI+7coTdk7vHkvQh0AfP3/0rt9dZDGrqhsPLHNz9suVA92Nt5/
         k+sw==
X-Forwarded-Encrypted: i=1; AJvYcCXzLAs0L4HwewuvCzDRF2QeQTr0rPy4kn+O0u7ZhDM6kE5pnod0slZ4sIacuBhLraPRMQ9O4RQk3zJ+VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsmfby/bZliSUX/8VHgu9Ofw7IehxK7f8Ddk+q4R1EFbk3GTbk
	1ni5PRPJWN485XeAM5jt2tVIzf0W9zrzX7X6hCA2Zbhbqof1qExVchGqzYQSg3fa6qlTXtC0IAG
	afGKI0qkpjXJ77jMyaGOJoCvsqLXzJm4WAVGxvQZlX1poqskn
X-Gm-Gg: ASbGncuZC4jUvqIxYnbXPDilgLeBFgRgtpjyrRUrx45T6zibTjIGti9jrYB9n1iSHND
	wFrztpUwdlMRsqAL00WiuWcnA6q3Up30Z+jtGJzLLll7pi9JZwoFPsLhr8N3HR9bWQM6z5VHmqV
	5o/aXj/5CT6gsdus3u7v0aRRxHCZfyYp/aXXWI+wM=
X-Google-Smtp-Source: AGHT+IEC4qfF8/eiKYWC6b87/URt2aZmRGTvr02EO+vykpkfp0nILc5ac/dlwepmQfxWmjI9CHtInw3sHU4Kc94JtHc=
X-Received: by 2002:a05:6902:2085:b0:e5b:34cb:ebb2 with SMTP id
 3f1490d57ef6-e5e245efd0bmr13195185276.19.1740493170016; Tue, 25 Feb 2025
 06:19:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev> <20250225-b4-ov9282-gain-v1-1-a24af2820dde@linux.dev>
In-Reply-To: <20250225-b4-ov9282-gain-v1-1-a24af2820dde@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 25 Feb 2025 14:19:14 +0000
X-Gm-Features: AQ5f1Jro6d8OWU49F-6F1vKdHETRh6QOCZRuMfdR_PmC7PcRjIrOpwo4uPciv6I
Message-ID: <CAPY8ntDYYPs90JVCLiZGqQAak=WOga90hgCns_TRWTxdrROPiw@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: i2c: ov9282: use register definitions
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard

Thanks for the patch

On Tue, 25 Feb 2025 at 13:09, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> For better readability use already available register definitions in
> hard-coded common and mode register structs.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 87e5d7ce5a47ee23a721ea39c0ab314c6fca6007..c926842257893c4da3319b847fab9908b5bdaec6 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -296,8 +296,8 @@ static const struct ov9282_reg mode_1280x800_regs[] = {
>         {0x3813, 0x08},
>         {0x3814, 0x11},
>         {0x3815, 0x11},
> -       {0x3820, 0x40},
> -       {0x3821, 0x00},
> +       {OV9282_REG_TIMING_FORMAT_1, 0x40},
> +       {OV9282_REG_TIMING_FORMAT_2, 0x00},
>         {0x4003, 0x40},
>         {0x4008, 0x04},
>         {0x4009, 0x0b},
> @@ -327,8 +327,8 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
>         {0x3813, 0x08},
>         {0x3814, 0x11},
>         {0x3815, 0x11},
> -       {0x3820, 0x3c},
> -       {0x3821, 0x84},
> +       {OV9282_REG_TIMING_FORMAT_1, 0x3c},
> +       {OV9282_REG_TIMING_FORMAT_2, 0x84},
>         {0x4003, 0x40},
>         {0x4008, 0x02},
>         {0x4009, 0x05},
> @@ -358,8 +358,8 @@ static const struct ov9282_reg mode_640x400_regs[] = {
>         {0x3813, 0x04},
>         {0x3814, 0x31},
>         {0x3815, 0x22},
> -       {0x3820, 0x60},
> -       {0x3821, 0x01},
> +       {OV9282_REG_TIMING_FORMAT_1, 0x60},
> +       {OV9282_REG_TIMING_FORMAT_2, 0x01},
>         {0x4008, 0x02},
>         {0x4009, 0x05},
>         {0x400c, 0x00},
>
> --
> 2.47.2
>
>

