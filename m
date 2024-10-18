Return-Path: <linux-media+bounces-19906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB25F9A448B
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 19:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83F2A284456
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AED2204019;
	Fri, 18 Oct 2024 17:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vz/RvmEf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C0814F136
	for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 17:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729272312; cv=none; b=ZJcDVOhaqWmzAC6G6KsHclNgKt6b0INRhCERsYTVdwcqSjCr6owWusg3uI7DZhbqITBCcdFM/naCijl3Dp2y3Ii+N824IR53xQvy749RKlatXmGcxQDRj1aJMmNbPJMhqZYNTvhocW2hfKXUPkOEHd+np7FOU3GDj/GxrODdejU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729272312; c=relaxed/simple;
	bh=BofhJRLLqqoA/HiauOqd3S6tPLQIhe7/vfSb0PvDjw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQyi4NR8SLpetARkpuhSDgU0w7D8q2K4Eh+wWPyU3jgQ92mF1QblPOxb5AGsu03qgQvtBJF/OQydxPy+N9CI8qZ2FPjckWNAwMKwfAqhXJlrCNCuBky4KOBRIC7BGzAuZQdIVFJLgpMWJ1RGnqP34QW+g8Pso/X1XWXz25Txhd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vz/RvmEf; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so3443424e87.1
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 10:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729272308; x=1729877108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mR6AJzh+4ECDONe7uh5yuWMwmQWLfNzaEttRjfHdXGs=;
        b=Vz/RvmEfmZ9OlM/yBngWJB2SgL9nMyeqeZGK00yTBomw13z7v4+HC9Oha1J+4XAc4O
         EjRS7JtvJun7ylCw/0UKCzr6+ssUnmyGCKk1jjtjIZrKbepxTr4jRZA54CB25ZENqx1e
         nZWGhKWdAg5OqS/drZb1RB3auoL1UXfak4EwOBUJfCMZVa/0/zw1d6LcENpvRb3gGN2l
         ECjVJQaD6FogCg5R7cX2mr8H1jxuPUcD4bQCMlnYGvNisHLVyEZG52b/HQGHa9iKU+R5
         qDhcizqcgXJn033pc/6WwNyC7QJnQkbBFNp8YTq7j00S3HjmPAaO9MNF4DJpKYKC7o21
         UScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272308; x=1729877108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mR6AJzh+4ECDONe7uh5yuWMwmQWLfNzaEttRjfHdXGs=;
        b=et0InHw3xzxTae5NfPLF5/DvfrwbmsA6sqLLw7/xOkmyz9QnhQtS3Irpip2GsIqUVX
         vB2G43T7SOYFGJ3kITKXLURVygP5KS1euo8LdzR1jXJSQJTOScS32CAXLw1bJS0+rjUV
         /mm9ZflVp3foMV5H4mtt+S7HCS1Svepuxkh2OOiq8ppDfYrQFOLu00RoHXRNQ3nyaAQy
         ++elyPITqDYP6LwIQXnKOZkWf+MflRL5CfaLDA+tcL9FelmLiu6lb6J9ij4fD/vzhsER
         YQf9Z2ydGl22wiEV7HSedAF+Z8fktnsrNaHgbGooFevEUGWmSzQ72A7qD0k055OKM2QM
         cgug==
X-Gm-Message-State: AOJu0Yz2EBDqLZdnUTngmwynfIomJvnoqIvTmn0hCFeqDYPCdqbeeIQo
	VqrAtU+rhw0vbtAqqCp6/lVfkopGxUdoAZDj60evr44mkZd46Zk94DphO3Xnh3kYVq+8ZfFEi4b
	cIWM+vqbjSXd+Q0S9lrs10Ez+LMM6VyRlwX4zdkLQTRuO5lR8
X-Google-Smtp-Source: AGHT+IFxnML51s+ed7zt8j70EWha17+f2f4YqKEnnNIBZ+/71O9KtkaJSj6Mh3GtISW9kA+GC/evY+hHAZw28CBVoeE=
X-Received: by 2002:a05:6512:4017:b0:539:f471:bcfa with SMTP id
 2adb3069b0e04-53a15218fddmr2430035e87.14.1729272307563; Fri, 18 Oct 2024
 10:25:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018131351.70563-1-brgl@bgdev.pl> <671279a4.020a0220.206dc9.0907@mx.google.com>
In-Reply-To: <671279a4.020a0220.206dc9.0907@mx.google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 18 Oct 2024 19:24:56 +0200
Message-ID: <CAMRc=McnFLVeBOV8rcfL+A2PsF_dY0C7OP8DOhqwwgU9OpoZBg@mail.gmail.com>
Subject: Re: media: v4l2-core: constify the class struct
To: linux-media@vger.kernel.org, patchwork@media-ci.org
Cc: patchwork@linuxtv.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 5:07=E2=80=AFPM Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Bartosz Golaszewski:
>
> The unreliable Media-CI system has found some issues with your series.
> Check the report at: https://linux-media.pages.freedesktop.org/-/users/pa=
tchwork/-/jobs/65292429/artifacts/report.htm
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> If you believe that the CI is wrong, kindly reply-all to this email.
>
> Check the latest rules for contributing your patches at Documentation/pro=
cess.
>
> Best regards, and Happy Hacking!
>
> # Broken Tests
> ## Test [static-upstream:test-coccinelle](https://gitlab.freedesktop.org/=
linux-media/users/patchwork/-/jobs/65292423)
>  - **[stderr](https://linux-media.pages.freedesktop.org/-/users/patchwork=
/-/jobs/65292423/artifacts/junit/test-coccinelle.err.txt):**
> ```
> drivers/media/platform/raspberrypi/rp1-cfe/cfe.c:2326:2-9: line 2326 is r=
edundant because platform_get_irq() already prints an error
> ```
>

I think this is a false positive.

Bart

