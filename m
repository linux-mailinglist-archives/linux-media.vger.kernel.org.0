Return-Path: <linux-media+bounces-18685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A6B98823E
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C77BD1F22C05
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A7C1BC9FE;
	Fri, 27 Sep 2024 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ki4iFt4Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450C61BC099;
	Fri, 27 Sep 2024 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431784; cv=none; b=Sy//2IS4TVMZetOSn/zL7xiLLMS5xiJ31hApEduLIEZl6TQVrX/8r5rpoyeON0pMxcATNB0PvEe7fuytUqp0hx+Ph6og3wvgupPRjuCXo7b/UnqiS7fnXGlWcZ09fZcU23eYx8YmUoYpRU7BZBTFN2fIrXxByYxyJKn8JTLPP60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431784; c=relaxed/simple;
	bh=u1HYuzt3VcJ0Ke4gqg4Bcs27HCUdrkVdFqLZtu1O5Y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvhwO+7Oswcuyi18cRv/O+wqpLSKtqlcEZfdkXYIRZdx+uFMrzfmqUooSWTFmENJDVPGgqzWLu4oZGA7ioPB2DnCZGWLwcuS+Gv3S8n2orN0ThdAXn/y0uSKTgiy0RhQHEqiXV1qtB+0UOBkY7FTMWWvfjSEkr0zjAyC7akJejA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ki4iFt4Y; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c881aa669fso1201584a12.0;
        Fri, 27 Sep 2024 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727431781; x=1728036581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1HYuzt3VcJ0Ke4gqg4Bcs27HCUdrkVdFqLZtu1O5Y0=;
        b=ki4iFt4YzpRFq82dTR4wIq9SycQjNqu9bvuoS4GK7hhW6ENptjpM9/MwPgUxgl+KSo
         i5BC5EbkUCZWX+f5K9y+vJvK4xycnWXUI13o+LYwfT+Nyq5F5cifJW6jwJHbc+Oryy/R
         +Kz7XAz9U4/MPnZ9ECKdaBJ1bS0GYei+T0JTjhX7tYY2GBXMkRfDXizdUzG22WVGHPz/
         phzw5DytmdrgaZxe+2zUrjGWLI8lQAd/mgTlAttQcfDtr5dNY43YKa5sLMm2j64h6FCR
         scxPbl7pjtumfZqvTpjELwwhiJ8MGSTAgaduVWGaOIBPg5VmnW40OgUqWEyjJVzLT8Dd
         +xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431781; x=1728036581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1HYuzt3VcJ0Ke4gqg4Bcs27HCUdrkVdFqLZtu1O5Y0=;
        b=LzK44xFcjgJ8B3iflHFoTroq6TbHBvs/0mNvKPYkm6h9CEICagw1rLtE6DEj/tXORS
         +19HVUXNj5hzGpvD+HC3/3hWhuX8BDgVdW93Nyb03x9TmGm1B/rtQ1toRXYcDpvmc0In
         8m+zc3AOsvK0pgdIvG1PV7t25DahHyRIRPEpvthAxz9z1LBinDs874KMo1Bp39goQoxc
         L79NYKI1eaXHue1gTH8Dm4PfGkDfeoesxcDdjWNwAJlUOM65NK3njQElV4q+lHIek3Ij
         4Ce1Q0xNWSTTLSghf0MZbr27wlSpVoVKzJ3+glh23XZBotwv19D2jHd7WRPfr4sP8gPt
         DNaA==
X-Forwarded-Encrypted: i=1; AJvYcCVDkbqkmlBqDyrY/DWz2Acz9amIj9XHsTQJALBbnagGham8oodzOlnnFnXyNF7ecLj5RxaaBBDWOYQ1kjM=@vger.kernel.org, AJvYcCXExImsJ5nG3SYBZb1/gf51hFEoOQCGTP/COTwJyNrZGXGYTCLKPzb3X98WF5F27FeLNkX/Dg9+et+A0QQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKvqVmQHfmLLtStpjx/uQ+Eg2xGp7PbF7jMQVn81YBgNrvplLQ
	I0jYZv2GVtvNfJU98sTuqHXG0hcvCR1iWrBVLH2t2OH8PjJ+2VZAJz8WSY+y0HxXPsWl+HkYZ9t
	ird4k07oDJwCEmJQaBJ5VARyVoac=
X-Google-Smtp-Source: AGHT+IFxKrVn+eN+8GsBOc9kEvDkWwEzAHy/d1V0TW1e6sbZfloJ1RQ+VeEYJjBsCrVj4lEvUHHOb0kRXZt1hATpgt0=
X-Received: by 2002:a17:907:3e1c:b0:a88:b93b:cdcb with SMTP id
 a640c23a62f3a-a93c4a68305mr210200466b.47.1727431781464; Fri, 27 Sep 2024
 03:09:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org> <20240927-cocci-6-12-v2-3-1c6ad931959b@chromium.org>
In-Reply-To: <20240927-cocci-6-12-v2-3-1c6ad931959b@chromium.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Sep 2024 13:09:05 +0300
Message-ID: <CAHp75VegFGC6DR0RJ5QPPOoTEvwDz08tJzWirOeJvzPWKxFE4w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: atomisp: Use max() macros
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 1:02=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> The max() macro produce nicer code

You forgot to update the commit message.

> and also fixes the following cocci
> errors:

> drivers/staging/media/atomisp/pci/sh_css_frac.h:40:17-18: WARNING opportu=
nity for max()
> drivers/staging/media/atomisp/pci/sh_css_frac.h:50:17-18: WARNING opportu=
nity for max()

--=20
With Best Regards,
Andy Shevchenko

