Return-Path: <linux-media+bounces-9952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1976B8AF4C7
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 19:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9AAE281647
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 17:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4630213D8B2;
	Tue, 23 Apr 2024 17:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2EjxUol1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3EE13D638
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 17:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713891666; cv=none; b=ras64h6245lnxFMIarU6EspxWhFlC+ZQPyOHgMTYT0kkshnb3cqQpPOXN4TCCVa5Crk+mSSaYULRUQOA6Hhnr6SLLeRoyKHAdAgBUy6Hu/PAt9hlgc0h+Dqq3fkqpP6GG0gzrGiXUGJMehYzAb3O/00wDPcYFQbCK9TNKtqpzRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713891666; c=relaxed/simple;
	bh=aswP9hdxKwb+09GNXGRaPB0IEecRqGKQdL5a6+WxhGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYhaIhlMf8hUO7GvXrXKrOnltVXRKcybQCyW24ECMZzBKXVJHRTf6tnqEm1uU1DnMjTBblOwBv6njzvVRm0yHS2LozOnPSaap2BZJ0dDyyN96ItEW7Hv1qPJKeZT1Ruqmb8iTq4hjtEHwX8/AMk6vdUjQHihY+drqI3u/OtDIFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2EjxUol1; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7da68b46b0dso171149339f.1
        for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 10:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713891664; x=1714496464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLMRks9PdH+g104L81D287ju8A0NrozcbxbmvZl/Zoo=;
        b=2EjxUol1sf/a+UBLSAipJ30Dd/j+tsWIwtoBEMBjsNjmKVCCpZ/V59XqTWUOF1l2iF
         JcNE8xxtY46hamhC06kO168CU5bkn2RfehiPVmStYpAs1+mtWgFIXjtted0vcl3SHyo1
         /JxgdyVikMPwAnuBFqB8zFzM9yit0VnfSD4y8Vkyd3YAaZqsj26H4Y6cxAdAEkg/kYDP
         OdsqQP2dpeoegaOfs9hTWZ6BPXtSsfc/H689masPI3IuYufjp/3wvMyTXXat18cYkBe5
         xJ+74HmMMHXmmHYN/tnaSO+yIvw6CLmz82BWgkVtflJXg9Eo6Ca4BiiXkKgAA2P3nLm3
         n9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891664; x=1714496464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLMRks9PdH+g104L81D287ju8A0NrozcbxbmvZl/Zoo=;
        b=Nxnqqrc6VGgSnzhDgGvj1iDe9Z0yCpuoX3fY6POb4bTeZ7vN7k7LbPwNu7KzfTAuD/
         cAg/WNGEdqxQddLB0mA3AQ8tD/gLRL2g3Or2rS+c7XVyzqglRGCOhxbbp9UeIuecefAV
         Uk7oW6JPk4m4V7vLTAxY7466fNS1bNAa4Vd5+vOrjLih9uZJmQpv/5b/SzetJPPu5Gep
         DzIyq+OUf8+t45Cq0EM/YDkt8zAavWU2QVWxXEbCulfvqmZbQooJQQIQ0WF7etpmCdUA
         PP/zyLEhiKzCm0fAgESTNQ9RkxXqV9dZk87+Ijar+UmVYu6wKfE7w1Rj50rlREQEtNXX
         Qyog==
X-Forwarded-Encrypted: i=1; AJvYcCU1n54eFkSvy4q8OvK8SSTZq4xveQVxgOHsJpqTQD1QpMaAj/yRsO6qbugHYyeuaqCKC+bQDD0aV660qCb3nlJ9LuUKkgMqBQ0ZScE=
X-Gm-Message-State: AOJu0Yy0MnVpz0420/h6Bd4Q0lKAYNwgyRWiIt77iGurJUgBqhHJiMuj
	GBplhOVL/+TVJEIHQR15hQ0426tsGfeR81k6xKGdqXaNYSv0wwfpEY8G2x07cbuQ2xBTz5e7Hx4
	AS7s6wI2yVY6pnSl8zc5iL0viQstz7SZh8+Pj
X-Google-Smtp-Source: AGHT+IGcw1mE7GQw0RFfG3rYNhp3N2M96TVgZiM44ui1PYuC2rOp0yhfUgHlgGhehZWYsoHgBqII2uXkVaAYJ4TGtYU=
X-Received: by 2002:a05:6602:6b12:b0:7d5:de78:1d8 with SMTP id
 ih18-20020a0566026b1200b007d5de7801d8mr21123669iob.18.1713891664253; Tue, 23
 Apr 2024 10:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com> <20240221160215.484151-8-panikiel@google.com>
 <09579b62-77fe-4ba4-b3a1-e3b17dff0188@linaro.org>
In-Reply-To: <09579b62-77fe-4ba4-b3a1-e3b17dff0188@linaro.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Tue, 23 Apr 2024 19:00:53 +0200
Message-ID: <CAM5zL5q7LJC8AmrtM7fH03zyvQug8k4WN4t2=Q-6jQBZAtYYEg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] media: dt-bindings: Add Chameleon v3 framebuffer
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
	tzimmermann@suse.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	ribalda@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, sorry for the long delay

On Mon, Feb 26, 2024 at 10:10=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/02/2024 17:02, Pawe=C5=82 Anikiel wrote:
> > The Chameleon v3 uses the framebuffer IP core to take the video signal
> > from different sources and directly write frames into memory.
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
>
> ...
>
> > +
> > +  reg:
> > +    items:
> > +      - description: core registers
> > +      - description: irq registers
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  google,legacy-format:
> > +    type: boolean
> > +    description: The incoming video stream is in 32-bit padded mode.
>
> Why is this a property of board DTS? Can't the input streams change
> depending on the usage? Who defines the incoming stream format?

The input streams are defined by this hardware module - there are
specific input lines for red, green, blue channels, h/v sync, etc.
However, there are two variants of this module which behave
differently - one has 60 input lines and outputs BGRX32, and the other
one has 192 input lines and outputs RGB24.

The "incoming 32-bit padded mode" referred to an internal bus inside
of the module, which I realize isn't very meaningful. Instead, I think
it would be better to have two compatibles, one for each variant of
the module.

