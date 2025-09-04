Return-Path: <linux-media+bounces-41752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7367B432A7
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 08:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F9105822A9
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 06:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCED2797AE;
	Thu,  4 Sep 2025 06:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GC1+UfNx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2A3277026
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756968011; cv=none; b=PmSnujOkLC/Li1Zm/Pyn/nEvyDlynHpz3CO2j4Iypvs/N3z6IrXHfvhtLOcODayzsRpwhdSPzTKl2irVXPo4EqW5rPTaPF3igUBz2ihHtcvuWcJxJnwIXHV4/9IwKaHUDRwFY1GfLcZdWcpsj6d3PV53dSIbsboqUxTQ1Ywf6ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756968011; c=relaxed/simple;
	bh=IglsR+oUgnc5OGxBKrJvs30oGCTNsAedJE467XKBqjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W17H19EmzD5NEAqyuoUtoougA5LgmtTzcb9WCMgaeUF61my146E1fk4X1VB7e1EaDd6ovqs/Yg7mq0jEirU0UzIiY0WYW3sCXfj2IbWkMr0X5TvhpzNRF+XaOO734qeXfbE33n5+9W12d0r3IWyhtqP1t39iRfGDoSK4guef4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GC1+UfNx; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7f74b42ec59so47868885a.2
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 23:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756968009; x=1757572809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IglsR+oUgnc5OGxBKrJvs30oGCTNsAedJE467XKBqjg=;
        b=GC1+UfNxrolXuyRndDfY/aQPcVLgf1dwRqz72wr11SJiswETEOLYB6NRVSQyixN8lZ
         f7erbyUbELNBD3q96tTQS+VJxHVCdV4iJiTlnQfHA9Hs1ffGxpRgUeMUkHYF4KqX8B1G
         lcYdG7wSQU5RVJCe9oPEDzv00FMcoP6e35bzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756968009; x=1757572809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IglsR+oUgnc5OGxBKrJvs30oGCTNsAedJE467XKBqjg=;
        b=XFud3MySFL9W8OZ+T4/fHL9Oy5olaRZpjCoEZ3IKjafB3f2fdsZSIbm09FWHWmSlWC
         CCjkPPKGG5X1PUkKGQmrHzJDHEkWUjiGMo933/FDrt7PWPKHRdCC+s59r07OXrL2zc9l
         xIWjMc8wcI25nHaFzkpA5RcjLN9zfdFkhNXL3WMoWyHxK3uple+cD/CIwrqNuBBI1Nd0
         O4VYqvuRWHFArGEMKIMuEHJwea9dhwaBVhJahiF6ts7rd6dPaqmclSVkO3Otva18rw3V
         if3fHKKrNDulIzGqPQ+QOw1RCpznT0DGmlaIz8Kq5/ynhd3kdcOkxd+GBtYZvwH8/i0I
         LEqA==
X-Forwarded-Encrypted: i=1; AJvYcCVj/1rJkXX/jMD10Ug5/keFo8kR0ZPtU2mqbYO3qbrg/6IhjnjZoqn5pgcbg8G9w5l6HR0nOkK7Zmti+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEqIJlkBsWCm6gx4T/GvzfZi8TbS70AlK/R2nv2erbtXNKo90M
	/sE1Jozs3lPI66RCe3f8+Q53eHTd+X6ru6XLBqr8ycJQO/wDk7J6wlRhjXMw9OMkTXxK7IA6JGD
	KwzqOKQ==
X-Gm-Gg: ASbGncv23OaeTIGaClm6aofIB3Y8ZzW4Xtub21pSDrpMVHElBBCEAGKNhwIlP5Wp4fg
	/E7NxrSvnctQIFV8hcFyj6VhK2A+AHIKZNfqtpE52bAv5rTSXVBjdyl18Q4x9tFo+Hx760rcEqu
	8xtOkpTsPUC1GxVPWTml1g/CwOgLWQhx1RKRi7YoBz6/sW5N9mphORUlFy9zXzJZeTjh5oRSTk4
	/Ne1O0bpypB2Ypw4FTr+FdGaQpPB545MR2Ncw9tsHSg98TUsI6/Um6gkBUXAaknz4xYrTllCukK
	WO5ho5Ukx/cJI1meXn6wpFOeiXMhpnoP61HzkLmzgDN/Ca1J8I79XcfsGZtcByF2aH8PtERoAW8
	zzBy9+MZMutqfuic+19yDM0H3UXjJCe0cqDNU4LNHmSfWeyDNocvyU4juHNLNIyPhwqnF2gIh
X-Google-Smtp-Source: AGHT+IFWrybyaiG66BYTwbGX475XHcUofqEGco0jWLIRzOWr8yKqE7U1WL79FU/7YAk1q7QaiMnSzw==
X-Received: by 2002:a05:6214:411a:b0:728:a449:219e with SMTP id 6a1803df08f44-728a4492317mr14439006d6.37.1756968007227;
        Wed, 03 Sep 2025 23:40:07 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16e418sm42482746d6.4.2025.09.03.23.40.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 23:40:06 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b5d6ce4ed7so183291cf.0
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 23:40:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrnXQcNfWyNZqvW9cvlMs17+FH+dlEVHPR2N90rFn5wcUok2zklkLouEa1BHeJ/sL1dejYvpLU74q5Hg==@vger.kernel.org
X-Received: by 2002:ac8:7c56:0:b0:4b4:9863:5d76 with SMTP id
 d75a77b69052e-4b5d909e59dmr2246271cf.8.1756968006022; Wed, 03 Sep 2025
 23:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820075405.1041838-1-wenst@chromium.org> <CAC=S1njQ5z2Ezz2OXDJ6Pk_9EEPgG3gu=Os7uFv6Lmdq0X77og@mail.gmail.com>
 <CAGXv+5GgGs5LEGJV4fpUpxOXC=_Fvo3CA4S10zZGxes9C2HrEQ@mail.gmail.com>
In-Reply-To: <CAGXv+5GgGs5LEGJV4fpUpxOXC=_Fvo3CA4S10zZGxes9C2HrEQ@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 4 Sep 2025 15:39:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B=0Zyyi2yJ5xD41LDBVYvAWoLu-oM_2XQORWgTDWo3uA@mail.gmail.com>
X-Gm-Features: Ac12FXywePb9g-RtWrinDg2p3M3RDgvhb_q591PKRsUpniRhwiiIjF_U8raEZa4
Message-ID: <CAAFQd5B=0Zyyi2yJ5xD41LDBVYvAWoLu-oM_2XQORWgTDWo3uA@mail.gmail.com>
Subject: Re: [PATCH v2] media: mediatek: vcodec: Use spinlock for context list
 protection lock
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Fei Shao <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 3:18=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> Ping?
>
> On Wed, Aug 20, 2025 at 6:37=E2=80=AFPM Fei Shao <fshao@chromium.org> wro=
te:
> >
> > On Wed, Aug 20, 2025 at 3:54=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> > >
> > > Previously a mutex was added to protect the encoder and decoder conte=
xt
> > > lists from unexpected changes originating from the SCP IP block, caus=
ing
> > > the context pointer to go invalid, resulting in a NULL pointer
> > > dereference in the IPI handler.
> > >
> > > Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
> > > context. This causes a big warning from the scheduler. This was first
> > > reported downstream on the ChromeOS kernels, but is also reproducible
> > > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even thou=
gh
> > > the actual capture format is not supported, the affected code paths
> > > are triggered.
> > >
>
> We really should get this in as this triggers a very large and scary
> warning every time the encoder or decoder is used.

Just to clarify, it does actually cause BUG_ON() panics, so if the
original change is already present in a stable kernel, this fix should
be merged to stable as well.

Best,
Tomasz

