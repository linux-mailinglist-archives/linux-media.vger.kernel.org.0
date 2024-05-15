Return-Path: <linux-media+bounces-11495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0D38C6C50
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 20:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FFA21F233D5
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 18:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A544815B0FE;
	Wed, 15 May 2024 18:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dWzrHj4Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675EB158DDE
	for <linux-media@vger.kernel.org>; Wed, 15 May 2024 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715798595; cv=none; b=Mw41vcmV3qy9T5mMX2VOU8jZaMhOFPjWClx/oicZkLME8JFhZowJ+V7Jw6RphZdX2BpR0O8Q2KyWVgt1NTtJSuQ7QVTSLhZCJ/7Fo31JHU5E864KhIcTaFk1+9QKUZBuUC0tUWlOnsqDQfVv9dsYvL9QX6C/CXk7YraI7VhpYH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715798595; c=relaxed/simple;
	bh=EYw08SuW0XGtCkslQ7Pr4vhaF6oLwiqfmnivOAxBqiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaCdPDjq6lyJ0D+O7PrrCmG8+hRUnCp5Ue/CeJTuiXn4HVaJSd9dn5YCbcbLc2MVXWFPjv2z5GGQmDnnl04lKG5HeQrHMuagMS6PM57k/aF8K8k2zwNovUbdyrZK6uBO45c+dqfQI7WX2eJeQgp9GTed8HD8KTujegAiKpwWHVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dWzrHj4Y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42012c85e61so302205e9.0
        for <linux-media@vger.kernel.org>; Wed, 15 May 2024 11:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715798592; x=1716403392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYw08SuW0XGtCkslQ7Pr4vhaF6oLwiqfmnivOAxBqiQ=;
        b=dWzrHj4Y2991PncIntwkhPkWMMhAAX1lIgfjy2o2MPKqAMuU6XgQe+uwR6Gufu6T/+
         yPGKhhTdYS/bGf1nsgdSvoINikyJDO0IvyattNTKKyt/Q4G6oixneiz4d9APMG/zqpTl
         1f5AcNxGdRuDtRyzqVAxwy8fUnXmcnHSVUYLlXMslxUjEMm6XgorI/CwXdkirbFZdsSX
         +wYBIU/OxfEyFJ840NfymnSS84X/fyEFtUOnxUAIyvL4dYqhDs0Y0iSc+Q6t3Mxu56mh
         S4PzeD9Xy88eAsolnO1+ZSd+RN04vexRrRcBV5hyTqtijFFyq28zH/RTcxEOsy556Vkq
         bi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715798592; x=1716403392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYw08SuW0XGtCkslQ7Pr4vhaF6oLwiqfmnivOAxBqiQ=;
        b=WOlUdgtfiWYuhpwTnjew+xx5x7CcZxyt1NH92f8cceumIDBe9X8ez36G9S8EjqWk6Z
         ZsQqelC6gPvGomE1gY3//seC2kyt6SJ1KwvEM5S5r7N4dnB56GbuL9/vbwcYkzOtj5sx
         oEVRs+2sa1Ugfa04NYVoCLdSE0bPj5oxpVCmfa25la1/EE1BqN+ZdZDCylXPQSQMez8n
         of+e6jSA/8fk87y94Q3TWh0C6TN6NTBX7hjKOc7T3xzVQDMHWugMrxhG4i1wqbbMzkJ9
         LNRMoEFJaJZQG6BHdq7YJAMtccUwHkK2feCKiExEGjCQ+4unW7AvIX5mq0hEL+doMyml
         X20w==
X-Forwarded-Encrypted: i=1; AJvYcCUR3PYc6dc/N6HtQg4feuMWe4davTlEWJXGW1nixQ7qyt+cd5yLptg0CWFG0OJL18h1AXFuk26xYJkEx8N6tI6JNOUmYi0E+lQcqK8=
X-Gm-Message-State: AOJu0Yyrz3klY/uhmL0Au959ORmBBimfA/Xc/rnvAS9rDj8lpay2qzgO
	9kJBH/h0vGNp1P87uEQAfFB676sxE7GQI09wsyKdcBqOKV2LJljHuIGtfMARHq3bEu7ooEM/n3f
	B9Mck+7AQKt78VQNIJkJqs7U4HDfCn1fTbKE=
X-Google-Smtp-Source: AGHT+IFXSyoRhWYZAyF4PDyMeovRDQKPGnBFuRGgfH4SBcREIVqL7zoHTwvnfnjWyp/GpdS9YamBKyr7G4+ZcxRuOuI=
X-Received: by 2002:a05:600c:3d9a:b0:41f:a15d:2228 with SMTP id
 5b1f17b1804b1-4200ebea389mr9541355e9.0.1715798591515; Wed, 15 May 2024
 11:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
In-Reply-To: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
From: John Stultz <jstultz@google.com>
Date: Wed, 15 May 2024 11:42:58 -0700
Message-ID: <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC related-flags
To: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 6:57=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> This series is the follow-up of the discussion that John and I had a few
> months ago here:
>
> https://lore.kernel.org/all/CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqy=
rroCMQ@mail.gmail.com/
>
> The initial problem we were discussing was that I'm currently working on
> a platform which has a memory layout with ECC enabled. However, enabling
> the ECC has a number of drawbacks on that platform: lower performance,
> increased memory usage, etc. So for things like framebuffers, the
> trade-off isn't great and thus there's a memory region with ECC disabled
> to allocate from for such use cases.
>
> After a suggestion from John, I chose to start using heap allocations
> flags to allow for userspace to ask for a particular ECC setup. This is
> then backed by a new heap type that runs from reserved memory chunks
> flagged as such, and the existing DT properties to specify the ECC
> properties.
>
> We could also easily extend this mechanism to support more flags, or
> through a new ioctl to discover which flags a given heap supports.

Hey! Thanks for sending this along! I'm eager to see more heap related
work being done upstream.

The only thing that makes me a bit hesitant, is the introduction of
allocation flags (as opposed to a uniquely specified/named "ecc"
heap).

We did talk about this earlier, and my earlier press that only if the
ECC flag was general enough to apply to the majority of heaps then it
makes sense as a flag, and your patch here does apply it to all the
heaps. So I don't have an objection.

But it makes me a little nervous to add a new generic allocation flag
for a feature most hardware doesn't support (yet, at least). So it's
hard to weigh how common the actual usage will be across all the
heaps.

I apologize as my worry is mostly born out of seeing vendors really
push opaque feature flags in their old ion heaps, so in providing a
flags argument, it was mostly intended as an escape hatch for
obviously common attributes. So having the first be something that
seems reasonable, but isn't actually that common makes me fret some.

So again, not an objection, just something for folks to stew on to
make sure this is really the right approach.

Another thing to discuss, that I didn't see in your mail: Do we have
an open-source user of this new flag?

thanks
-john

