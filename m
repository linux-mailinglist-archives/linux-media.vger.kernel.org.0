Return-Path: <linux-media+bounces-19708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D53D99FE0B
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 03:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5B12288B08
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 01:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA538158522;
	Wed, 16 Oct 2024 01:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BmYHzsKv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C3160B8A
	for <linux-media@vger.kernel.org>; Wed, 16 Oct 2024 01:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729040701; cv=none; b=WVtC47hAQVWJJMtZxYbCiO5mjo5Xdyt+Mw2qaWQnDRnYOHn9Jjcl4ccXnJ5lZ2JhdI9bQucyvTmh9/2xnfzaZuZ3AT0ztBEILy9VcBjMUDbe5NyAIOvhebeyNjFsTIxmFe06PMWEo8mjPKkbNPKxdD171AZefLKl+eDKYenhuow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729040701; c=relaxed/simple;
	bh=YcMv+IbUzZ8xF8/n43trH0IGv11Ap4f9Y1sIjSLZSNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prWBzbWeLUXOVCpG2PIYKMffhSF6GYJAnmHYdm7J/EfPjuXZIjxFQ4bmf9l4Q4mvbRc7+mCZXjcLwSjwfc70KZ6nWM4Xp/19fFvk+7XVhHsXI5repf9x4pL+wTYBmH2q5AxbSSKPiaSI+y26Zn9GN4KI1AwgHe8Udow8IIy4AZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BmYHzsKv; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20cdbe608b3so23864885ad.1
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 18:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729040698; x=1729645498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcMv+IbUzZ8xF8/n43trH0IGv11Ap4f9Y1sIjSLZSNw=;
        b=BmYHzsKvmyUc0xEOvU/XH2I3qNsxv2tG11UALViTT7WiiuBNMiCN3PLdq7MWENra9o
         t79fuRFfqGAgc+Ct4mugAX9nB27arqBhwsKUSwcNPaia44aneUtklsjOPkawUUVckvyH
         UROaJUiTAzF5wIw375HZyYnbnDggp75XCvrp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729040698; x=1729645498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcMv+IbUzZ8xF8/n43trH0IGv11Ap4f9Y1sIjSLZSNw=;
        b=WlY3PlRRuq8Cr75Q67DjlslrmlYmRpWy5vE/A6H4HtYH9l33aPAHedmJ20wWiwinfO
         EjBI6+R2MjvUqkC0MxNL8SQYT8Y5duOzYy4qGahfbN4UfjuWr6sCyLgN8C4yY38faopE
         joVcWzhE8vuu/pXoCM7DiiJ3Jtvq7lxmriBZOTcK0//qABDO2UNF6D1Z4WhPLijKP6Sc
         m/0FojeE8vHUdBCramKn5rjxkV5lvS8WFlllYWxXpSoLywG9zAXpkpGNbdw4y55DAq1c
         PecNmZx0kTjnwgmHAFvUFxUtLch/VA2t0MYyV9tUSqM74fpB54e3GBYnb8xz/+wFVl54
         dWMA==
X-Gm-Message-State: AOJu0YwBMpXVOlbJYlbs7anVLqFJzgE0mPwRyN3PjbYrzfqLVJUGqTZv
	r7eihD58+0srEisEJxxvj0uALg0PFQ0b0No5L9Xmr6ZQaJDGtFzDfMVwlwA5lxDRxVPEDk3Biv0
	=
X-Google-Smtp-Source: AGHT+IH4wJAKQ8vx8YmM+88Afsmuxxx9UcNgdLFLcaPd2CA2w0m9pwy+HzlOBzIdTLbhtSFkSk+6Aw==
X-Received: by 2002:a17:902:d483:b0:20c:a8cf:fa25 with SMTP id d9443c01a7336-20ca8cffc9cmr163056785ad.46.1729040698602;
        Tue, 15 Oct 2024 18:04:58 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1806b5ebsm18376915ad.293.2024.10.15.18.04.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 18:04:58 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2dcf4b153so4019692a91.1
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 18:04:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1d8e:b0:2e0:80e8:a31a with SMTP id
 98e67ed59e1d1-2e2f0d9a498mr19085956a91.35.1729040697141; Tue, 15 Oct 2024
 18:04:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007083921.47525-1-ubizjak@gmail.com> <6703a806.050a0220.38e060.1cc4@mx.google.com>
 <CAFULd4YSjynY6VuvvZWvOq08g5=GR9ed39auvQF9gU+Tbtk=kQ@mail.gmail.com>
In-Reply-To: <CAFULd4YSjynY6VuvvZWvOq08g5=GR9ed39auvQF9gU+Tbtk=kQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 16 Oct 2024 10:04:40 +0900
X-Gmail-Original-Message-ID: <CANiDSCu8JUUafP7gmekVmeG=-s9vLGXmQ3FjzDKaY=-tatwhpg@mail.gmail.com>
Message-ID: <CANiDSCu8JUUafP7gmekVmeG=-s9vLGXmQ3FjzDKaY=-tatwhpg@mail.gmail.com>
Subject: Re: dma-buf: Use atomic64_inc_return() in dma_buf_getfile()
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Linux-Media ML <linux-media@vger.kernel.org>, 
	Patchwork Integration <patchwork@media-ci.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uros

Thanks for the email! We have fixed it in the latest version

Regards!

On Mon, 7 Oct 2024 at 18:30, Uros Bizjak <ubizjak@gmail.com> wrote:
>
> On Mon, Oct 7, 2024 at 11:21=E2=80=AFAM Patchwork Integration
> <patchwork@media-ci.org> wrote:
> >
> > Dear Uros Bizjak:
> >
> > The unreliable Media-CI system has found some issues with your series.
> > Check the report at: https://linux-media.pages.freedesktop.org/-/users/=
patchwork/-/jobs/64723788/artifacts/report.htm
> >
> > Please fix your series, and upload a new version. If you have a patchwo=
rk
> > account, do not forget to mark the current series as Superseded.
> >
> > If you believe that the CI is wrong, kindly reply-all to this email.
>
> I don't think CI is correct in my case, the failure log says that I
> should prefix my patch with "media:":
>
> WARNING: ./0001-dma-buf-Use-atomic64_inc_return-in-dma_buf_getfile.patch:
> Missing 'media:' prefix in Subject
>
> But the patch is not specific to media, it is specific to dma-buf.
>
> Best regards,
> Uros.



--=20
Ricardo Ribalda

