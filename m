Return-Path: <linux-media+bounces-19143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF49992821
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 11:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B27B1C225EC
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 09:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAB518E365;
	Mon,  7 Oct 2024 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFs5ZLVV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A918E18BC17
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728293447; cv=none; b=ZCF5txCpnWW2s8g5py7fJKZitTQnP/K/XOOLD6furWzsCme0lgRtAUkgB+vKVwVIVONF8/U4UoNip+R80NRzhB63BLCN+QbSxAVNEUxnUy/ej3sSpEiFMo2U51pGzHHk/LGzonj+ST1W8+pCs6AxrSpOviB2hCSVorueUo6NtgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728293447; c=relaxed/simple;
	bh=9GjSQK2GNPPTTeNO4zyUbh8XPVDttD4yuJgPXToFLqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=CgrG6i1CbH2vyF/8CC8mV+dqlmJ5gFvAQB9o5lmr6882OpvhRha19SvuffUoaWzqJOXJ0NzwiRUz42qFZONazp1BktfgZ+nxrjuSQMYrLMR7o0mWvTMiM0TSvr0Kjusr4W42S2xDW0rGev89HOlil8kYod0eFZGxadD0UPQqe7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFs5ZLVV; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fac5eb10ceso38188761fa.1
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2024 02:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728293443; x=1728898243; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GjSQK2GNPPTTeNO4zyUbh8XPVDttD4yuJgPXToFLqw=;
        b=VFs5ZLVVuUlScBgmbKH1168N56XnqhcZapQOEonhdLF8ovnmeXR0peFEgN9H85W+EK
         lGsFGjoPyM4m3bzwqsnH1we0k1PMqhu50pJrXXB3X5FZfI5p6VZl3JEejNF+qtBAz2a5
         vzSYoPqizd5pt/O/8jNqhXMTx+iWQh8r1RCV2wDIHRpJs7gvesgGZvg92/YOjS9AJjaR
         bYJx5HgV47SdqAgqrgnllqaF4ZRrbjSL7Pc8EWrRVh01hx+ag/KypauW7V5KbVGyGjoI
         5EIN29tkZMWznMKITk8JUA9UM9gXUVKwtNQbX71rMavA2ovXLG4JEEuCHO5cXhOKIBiM
         egdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728293443; x=1728898243;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GjSQK2GNPPTTeNO4zyUbh8XPVDttD4yuJgPXToFLqw=;
        b=guX2y2FpI2zgNsF4n58KC1FRQrgh66dauL4ZeH9rWRDvHmOEmHkxDhEz0ovMrhxASn
         4gulNWAIjzN1LcqM2ShUu6VHO1OyNRKVzBI4abtQDEYujIzMTggo2IT7O+JmbyEvbIP/
         2MN6lsmAGANM2tLgUbhv3OJuqcwQrG4C60AjErINnw0nb8ahENsMrbxbg8riGtHc0+lV
         9F9qylfZQ2u2g+UrYRhIrS9IskF1tTL6v4flyU/Isb4t8bYtzfahcP05GRjNnLENzalX
         d5QfxzxoFTi9Fm13gpbqi7eElFbQJ3YkNIETio6kI3GRapUuaOanMLjLTuCnlYM4jGqt
         g7Mg==
X-Gm-Message-State: AOJu0Yw/7NEJl/4nJfEXql7TqH33TbrCgfh14JfHsvKXEJGY6fsJoVtg
	dMmV3MibV+Xs60uxIUCKU08hiH18x09XaavrdXmfxDDY6yatzcjMQW1VLhKtGKZeP4dZy/eRN8Z
	ZZ2F0og8U0Y/A6vqBx5krDDI5IZ51wpfKRn7cfg==
X-Google-Smtp-Source: AGHT+IGZhqIeTqHhNWaFPyuSD2BAuNwPNQ0DznzNkfPoQsiK6ghOFONGBMTnMsf8ltpb3kQRRvtCVHiS2GL+KKyc61U=
X-Received: by 2002:a2e:bc19:0:b0:2fa:c685:404a with SMTP id
 38308e7fff4ca-2faf39147fcmr36117891fa.4.1728293442919; Mon, 07 Oct 2024
 02:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007083921.47525-1-ubizjak@gmail.com> <6703a806.050a0220.38e060.1cc4@mx.google.com>
In-Reply-To: <6703a806.050a0220.38e060.1cc4@mx.google.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 7 Oct 2024 11:30:31 +0200
Message-ID: <CAFULd4YSjynY6VuvvZWvOq08g5=GR9ed39auvQF9gU+Tbtk=kQ@mail.gmail.com>
Subject: Re: dma-buf: Use atomic64_inc_return() in dma_buf_getfile()
To: Linux-Media ML <linux-media@vger.kernel.org>, 
	Patchwork Integration <patchwork@media-ci.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 11:21=E2=80=AFAM Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Uros Bizjak:
>
> The unreliable Media-CI system has found some issues with your series.
> Check the report at: https://linux-media.pages.freedesktop.org/-/users/pa=
tchwork/-/jobs/64723788/artifacts/report.htm
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> If you believe that the CI is wrong, kindly reply-all to this email.

I don't think CI is correct in my case, the failure log says that I
should prefix my patch with "media:":

WARNING: ./0001-dma-buf-Use-atomic64_inc_return-in-dma_buf_getfile.patch:
Missing 'media:' prefix in Subject

But the patch is not specific to media, it is specific to dma-buf.

Best regards,
Uros.

