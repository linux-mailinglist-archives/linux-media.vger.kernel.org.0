Return-Path: <linux-media+bounces-29728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7359A821CB
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 12:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06B9119E4F8E
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 10:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0EE25D54A;
	Wed,  9 Apr 2025 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdCD8Yje"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBCE25D210
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193457; cv=none; b=qDbnC3glgBNy83plZWbKb8mlxrbINWh1knbqyjlDhzF/4ok0CGppIWU7BadA88v+VGbEHs0jAWHb3Mh7KZbzm4otQRmNwN9VKPjb34k4wQAPcXOzGozOTCsZiFGMqMF7O5Tt3j/wOdFZdLlA4Nt35TmWfvpCwm3Eh7+mV/l2I4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193457; c=relaxed/simple;
	bh=ydJiOQNmUVVsu+RJhdp6g9LD5gTO54+zKzKIoZmfDnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=XCeAyh4VZdknIYWIIZ/5mnKJ+ssIGfGrrO+1QCyY3wVZg8Uvcex6Z7p2CMc73KLoxtaxWYFoCtcCW0MzRq2eYi3AJ9ZHKJVNjzRvU/b1HejKIHzsJcKdmIZ6zb18h1x+oc0RHrfEJRorJBOh6FXyJOx6sZ5Ut7CcAAT+aPeuEbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdCD8Yje; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-523f1b31cf8so2740411e0c.0
        for <linux-media@vger.kernel.org>; Wed, 09 Apr 2025 03:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744193454; x=1744798254; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydJiOQNmUVVsu+RJhdp6g9LD5gTO54+zKzKIoZmfDnA=;
        b=AdCD8YjeKW/39VK57UeSLwxGBU4Qb3s7E5L1g35JUXDlSp85x6yA87upq644R3BFxf
         a7ZWJvSZn4Mr54zKPCrA1SNeICSi36XzCDNZjw5PceJDvderI14IU6EMUJORTV4R4Dnt
         1DtqdM6y25Mird8EWZk7imnkOc3jPdudWbN3pPufry3mYBaD3iS8OQ9MjJieHz1x8PbO
         YrJG1RmT527NwDF/KFbe83z4bXz41u73qvpMapujqszJ6Q6+z1mRPBPybGKWoRugZ5ph
         E2w1yuN5v69GRwMQkhczzrMqLSvtkPXxe1iQ43Wfa9oRPdWEWgIeozDUsCZdQz+UGISR
         GhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744193454; x=1744798254;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydJiOQNmUVVsu+RJhdp6g9LD5gTO54+zKzKIoZmfDnA=;
        b=l4uRmlM6kueXNAt5g41kUwpQ3Ugq/uAjokO7GZCEJLBXiXgie+Me7P64ioogSSVWPC
         PhoNnQQqPTAkesR0aSbSdAfog6cmG+NGYQA8YSFHiuQb2YoUciPTEgyINlLrkD3Z90nD
         CpvYLsUQLOoi4MKvmCP3m/bhng1DJX9xj3Ja7RzGkqEdt0Z22vjexSS7qnyw1f+UVspM
         qKYcJheFXXTp3CNK7PcrmU0XiQcNFarg/bOrnzvpf+O4y7RbsGFDDMBYQ7m+GJZQIccK
         BRnoESpLWpeQ1ZFP7INAURcdx+4cWZm+dxHyXz2LtdC8LbUvU90jMRWBzt2UvRJVwh6A
         nI2w==
X-Gm-Message-State: AOJu0Yw9wiMvJF0yUsHJls4noXroZOpbSvKawlc/UXk7MoQbthHOhtFc
	7kwuyB5wcs+M6dSLOh20KVKRE3LFURy24UP0LCJI9oBaOISpMvn/fdjX8h0ZHvyPP4HrRdoBxfz
	+d5e6eKVi3ccSohyRWoRshHDfuXz69ubH2lQ=
X-Gm-Gg: ASbGnctZvD8DYi6sEANnaJPIn5y+Ce/jZSXTazDkXpjIYpRAsk7EITIL5KKE1oG2Pqc
	XVUuMzA84hz1sWwWBsyFY3BfxXokcr1XTRSPC8UdXuCG7AlVbHjZl7qR3Vfd3b8mcNYyWYbMzJE
	/TvRQ8l+Tf2NGD8a6IVBrfJw==
X-Google-Smtp-Source: AGHT+IFRich9kED1HWBO5bNIsKBjV5oO7/cXF8YIZgz0M6oVFTBVp1UMC+7uGG819AV/GqAnD5t2PfQ098HhaHm0jP8=
X-Received: by 2002:a05:6122:2207:b0:520:42d3:91c1 with SMTP id
 71dfb90a1353d-527a92773cemr965361e0c.10.1744193453700; Wed, 09 Apr 2025
 03:10:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408193158.80936-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <67f58996.050a0220.81e18.0f33@mx.google.com>
In-Reply-To: <67f58996.050a0220.81e18.0f33@mx.google.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 9 Apr 2025 11:10:27 +0100
X-Gm-Features: ATxdqUH_aEdB7XEE7gK6N8gVm8VKEVSmndRNclUKWgyPsRdSukaM2YIevXpgJdo
Message-ID: <CA+V-a8uUzg=JUoQdqrBKbL2GvcosNCRXDXuyC2Vhd0mcvW7nGw@mail.gmail.com>
Subject: Re: [v2,0/2] media: dt-bindings: Document VSP and FCP for RZ/V2H(P) SoC
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 8, 2025 at 9:39=E2=80=AFPM Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Prabhakar:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/742401=
85/artifacts/report.htm .
>
All the errors reported here seem to be due to server issues and not
relating to the patches. Can you please confirm.

error: RPC failed; curl 92 HTTP/2 stream 5 was not closed cleanly:
PROTOCOL_ERROR (err 1)
17fatal: error processing shallow info: 4

Cheers,
Prabhakar

