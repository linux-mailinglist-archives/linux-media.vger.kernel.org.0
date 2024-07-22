Return-Path: <linux-media+bounces-15272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE2A939381
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 20:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8B981C214AF
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 18:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2FF16F903;
	Mon, 22 Jul 2024 18:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VeqyTHd8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B3016DC0F
	for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 18:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721671589; cv=none; b=iLHdCVxgEXhCpvux167M09htMks1YpDax2Moes0pGtwju7VQ9x7tTUddAH8cfwqFeu7cTILfmpsV5MzdTp8pNBeG2VBfojmWhSgVLPNB7gfbuYxr/uB5E2/btCCQCsKaqxVnknIUiKPpcHshZhLVQxTcC7jt/Aa9yACkgHHIpGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721671589; c=relaxed/simple;
	bh=Zt7WzDZnQXrYtdWEYlZQriSe9XbJ8h+L/cXUgbvMZ+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEjrvnR8pgycPrFPuvuNzivxmFPrUltgefNeEfX9Fuso5XNZA72dXbdKJv0srDiFETJFPGUxrrrPZlVDCxkjHhGO5qGKkBx6MPoNnlfIJdkxAcxh6mRG3LyLl2AAQOEzkMiEWzzx6fWqDutB6va0ZRatpd8HE0GigE5YQVDDF+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VeqyTHd8; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5a28b61b880so1753a12.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721671585; x=1722276385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMK19Nn8t89hi1e3ly4VVQjOLnRO+D3abPmsW8/FOMM=;
        b=VeqyTHd8FRFazOplc3GxjzQh4J/1go9+FA8cFd8T6oM0D04CUGt0zOAVI/PzaZ1raN
         kwtLl+CkGF6SYlQozinznroQNmI3VnAvAVehM8z7tn+uViUQN0zBTEZpCgY76k8BVxzC
         s8OIlAnU4EjlCSw/a01FmzvasBND6+u8RlzAvYc5ZC5QNDws5l5kPnMUzRXfvgAm7Y2m
         FcVjjcEr+NTrp3zF5Wz4Fs54sPFSSaWZvAjOvm+6cR+HGz5QRKUFM/L7Od46GHFtie+W
         0tXF1QXVCthnnlTh2E9/uOvGzNjwe1RZ1v4GxPIEHyfdDUSPctovC6RG6MreQGepJlmG
         DiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721671585; x=1722276385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMK19Nn8t89hi1e3ly4VVQjOLnRO+D3abPmsW8/FOMM=;
        b=LUPwu30XNXdu/NxrDbGyW6uos/axmunDVbr5lqS5H39RbN2PI8sMix886paPRJwpZB
         rI9rnmWdCDW0n53V5RcfzW8j5T+HgTebPs/kwi84xEzTcyqMHJmKbjYtC4SydbEFY1pn
         2Rs1ctUheamoEMXRQtqhxYNKUmzPyWc2kVnI2RukLMGpXZJOpElrNHcQe3R7huBvPDHk
         eNWErt/oXOKlvW/SEDdEh2gmvaX0iBsHU+x36fYxYWccJ/4BrMys06nfjp8Yco8qVXR9
         zUE/3sd0QawwgITyRmikIJyPtddbVA7Ah2622GAn1AuJdx/8jbXG8GUsE8IeKtlajmaG
         czQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUJ9XMYhKWofSsq5dcqzSUCYiybhCi7iu0tp7pgeXCM64mEyb71zTTxV3X/gUPQ19N/FqO+Jpt9tCuPIwYxWiSwa61vt5XFKtNhbE=
X-Gm-Message-State: AOJu0YzsIEySyr2RfktMoFd3GcVbn8V4Zwz4owQpG4CY17o7PpE91U1E
	qqIpa9JftKf+Wr01AkYbsAN+hmQYeHdT38/ax2UlPTdvAA8Nu3tgvjzxlqMqsOf0O56nb7EBGVY
	TmOqEyXIj3X8eAwEnPUn+Vl6Rs5axTCkoRxY=
X-Google-Smtp-Source: AGHT+IEl8zQov63qHRZlZmLKjP+SxF+AuxkB9AjZcfeGtwHxHIcLoa1XC0lM9boUyhzudCkZuPPMVUrlf0ByNKNURws=
X-Received: by 2002:a05:6402:2747:b0:59e:9fb1:a0dc with SMTP id
 4fb4d7f45d1cf-5a456a628aemr396556a12.6.1721671584394; Mon, 22 Jul 2024
 11:06:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240720071606.27930-6-yunfei.dong@mediatek.com> <2f5e5e81-21e1-421d-94ac-e4507b323680@web.de>
In-Reply-To: <2f5e5e81-21e1-421d-94ac-e4507b323680@web.de>
From: John Stultz <jstultz@google.com>
Date: Mon, 22 Jul 2024 11:06:12 -0700
Message-ID: <CANDhNCqzme0q7vey1jc84T0HJPiOSQF2fkyBfBLntdiyafEzYA@mail.gmail.com>
Subject: Re: [PATCH v7 05/28] dma-heap: Add proper kref handling on dma-buf heaps
To: Markus Elfring <Markus.Elfring@web.de>
Cc: "T. J. Mercier" <tjmercier@google.com>, Yong Wu <yong.wu@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Jeffrey Kardatzke <jkardatzke@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nathan Hebert <nhebert@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, 
	LKML <linux-kernel@vger.kernel.org>, Brian Starkey <Brian.Starkey@arm.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?B?RnJpdHogS8O2bmln?= <frkoenig@chromium.org>, 
	Hsin-yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 20, 2024 at 8:13=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/drivers/dma-buf/dma-heap.c
> =E2=80=A6
> > +static void dma_heap_release(struct kref *ref)
> > +{
> =E2=80=A6
> > +     mutex_lock(&heap_list_lock);
> > +     list_del(&heap->list);
> > +     mutex_unlock(&heap_list_lock);
> =E2=80=A6
>
> Under which circumstances would you become interested to apply a statemen=
t
> like =E2=80=9Cguard(mutex)(&heap_list_lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v6.10/source/include/linux/mutex.h#L196

This strikes me as a strange place to apply it, as it seems like it
would grow the lock hold time to the entire scope of the function
unless one created a subscope for just the list_del, at which point
you're not saving much or really improving readability.  I definitely
think guard usage is very interesting in places where locks are
released in multiple exit paths, etc. but this is a very trivial and
straightforward lock/unlock usage, so I fret I don't quite understand
the suggestion.

thanks
-john

