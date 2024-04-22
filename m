Return-Path: <linux-media+bounces-9882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D598AD4D0
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 21:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 832261F2415B
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 19:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFB915532B;
	Mon, 22 Apr 2024 19:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lCQwCuLa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5CA154432
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 19:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713813967; cv=none; b=I61Qlnb7dABWA89NMjdocMzdg3vHdHfSuhq0lUC5GODoU7gzh39rTP5UFsQEo6C0B9isTIz7JGIc2d3KVCuj1Zbtyt132JkgVDEXngnS/Lo/QgwGWSnsx2uCrV/+N3Y4ji9hZawTrGsFIfoeZ6hjzZwaL3I5RwaEbJs7xzxwg10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713813967; c=relaxed/simple;
	bh=mqHcqubpcdGYAMy1VnzK8VjEKBwDIL3z9gbkSQbzIqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkQJ71q2y6E/mph3Z1Xk3opc6p3Y53ve8ovnEA4sB4eLFNBopGGT9mZjWZCZ9wx5aoCKMq2bKAGCTHBhwhrkIM3M58fFsddPkUNLlMgsEaIGRw5PGe7aQkE1SwYX/AOgsnI/184FzKY+Kw+BYshg0IutE1f5RasTbk8n+epYnB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lCQwCuLa; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-618874234c9so52458257b3.0
        for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 12:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713813962; x=1714418762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqHcqubpcdGYAMy1VnzK8VjEKBwDIL3z9gbkSQbzIqc=;
        b=lCQwCuLaJRSxcrlYbvgjpQw1Y5dS554VjejVHMndHKOuhZLI3Xa+rCh0Vsy1uED/+F
         C4IKEbkdc/dAJZfz6cbsGvc+Tm5H0SvHQUkpAgdmQmTtBedE0D0nY7zagkiakuYBdKx6
         LuEdSwCdtl4G0pArofh7t1ueXIvzPRgCysVZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713813962; x=1714418762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqHcqubpcdGYAMy1VnzK8VjEKBwDIL3z9gbkSQbzIqc=;
        b=hbUIcrwv+tatCQG+rgzmbtkngTR7Cv8+nmY3l9gd9tDr9RTlutzKYi9K0urZCrWett
         7p3YvZSF/Zlzrv1o7rXxSCq4YPFR+FKrS734X+elxxxqtABuvEzAJyxlvvUyEytx2rix
         ACvmfB/zeDt5fxGdpwtqclTG4lcGilG7GQ04faAGlN8TD91lS8tCc88pGd3CX8LhnrkJ
         i6OZtZRWPfI86L0rMn/EaVtKpmatV4ccoqudQssrsUEQk4SQyly3zz3RrKGoBL1/e3TY
         Bin+FDC5pfJ7GpXVrSWoLeUZdvABLBe0vMuEBUWIKicThfQ5R0DSJMEh4iEEr6X3Pl3j
         dh9w==
X-Forwarded-Encrypted: i=1; AJvYcCWdekK7hnEh6Z7o9V25zj7pSxFeFENj0tTYVs+54gH7WJemdrTWw+SHHcuatY+hyjV8lxVCykCQRXrlXzO/Rf2MV9HMMWEKOXcGSqk=
X-Gm-Message-State: AOJu0YzSSnptPYCFj2v/tKiG+YmDx9EuKI6KT3+Uae0fWouxEFNq/fKk
	gBUeSIwWTJEXEKNBBqT12VkPhwGkm5R6M/aYGemNMKAckrUWkFO23ZsP4+tkfBgMTgbrLrFWdho
	=
X-Google-Smtp-Source: AGHT+IHqbjUsHfw1pU/lXMOCD9i0MLaM8W3pYRwfH84eNrfnNKP7bg+caZFCZ/Wy+0NY3lqWbmcPZQ==
X-Received: by 2002:a05:690c:64c5:b0:615:39fb:ec with SMTP id ht5-20020a05690c64c500b0061539fb00ecmr11021280ywb.50.1713813961853;
        Mon, 22 Apr 2024 12:26:01 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id c3-20020ac85183000000b00436e193f408sm4496155qtn.28.2024.04.22.12.26.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 12:26:01 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-43989e6ca42so68091cf.0
        for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 12:26:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAyYifF5+PWvAQdj11t6mN6X+s+l4d9BnBMIXV4kk18vr0sQeAOsXK8qNxcUc5gIr6Kn6IbyWddGDlmYbFNepGumZ+H1qIzmZyPBo=
X-Received: by 2002:ac8:4dca:0:b0:438:d778:5b17 with SMTP id
 g10-20020ac84dca000000b00438d7785b17mr47685qtw.12.1713813960387; Mon, 22 Apr
 2024 12:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240422100354.1.I58b4456c014a4d678455a4ec09b908b1c71c3017@changeid>
 <022936a6704d08fbed22e7f241810d857eecaeda.camel@collabora.com>
In-Reply-To: <022936a6704d08fbed22e7f241810d857eecaeda.camel@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Apr 2024 12:25:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XSyLJiTCHYF7UaLersix0zP-q-MybW+nOR3A2WfccQcg@mail.gmail.com>
Message-ID: <CAD=FV=XSyLJiTCHYF7UaLersix0zP-q-MybW+nOR3A2WfccQcg@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Alloc DMA memory with DMA_ATTR_ALLOC_SINGLE_PAGES
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei-Shun Chang <weishunc@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 22, 2024 at 11:27=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi,
>
> Le lundi 22 avril 2024 =C3=A0 10:03 -0700, Douglas Anderson a =C3=A9crit =
:
> > As talked about in commit 14d3ae2efeed ("ARM: 8507/1: dma-mapping: Use
> > DMA_ATTR_ALLOC_SINGLE_PAGES hint to optimize alloc"), it doesn't
> > really make sense to try to allocate contiguous chunks of memory for
> > video encoding/decoding. Let's switch the Mediatek vcodec driver to
> > pass DMA_ATTR_ALLOC_SINGLE_PAGES and take some of the stress off the
> > memory subsystem.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > NOTE: I haven't personally done massive amounts of testing with this
> > change, but I originally added the DMA_ATTR_ALLOC_SINGLE_PAGES flag
> > specifically for the video encoding / decoding cases and I know it
> > helped avoid memory problems in the past on other systems. Colleagues
> > of mine have told me that with this change memory problems are harder
> > to reproduce, so it seems like we should consider doing it.
>
> One thing to improve in your patch submission is to avoid abstracting the
> problems. Patch review and pulling is based on a technical rational and v=
ery
> rarely on the trust that it helps someone somewhere in some unknown conte=
xt.
> What kind of memory issues are you facing ? What is the technical advanta=
ge of
> using DMA_ATTR_ALLOC_SINGLE_PAGES over the current approach that helps fi=
xing
> the issue? I do expect this to be documented in the commit message itself=
=C3=A9.

Right. The problem here is that I'm not _directly_ facing any problems
here and I also haven't done massive amounts of analysis of the
Mediatek video codec. I know that some of my colleagues have run into
issues on Mediatek devices where the system starts getting
unresponsive when lots of videos are decoded in parallel. That
reminded me of the old problem I debugged in 2015 on Rockchip
platforms and is talked about a bunch in the referenced commit
14d3ae2efeed ("ARM: 8507/1: dma-mapping: Use
DMA_ATTR_ALLOC_SINGLE_PAGES hint to optimize alloc") so I wrote up
this patch. The referenced commit contains quite a bit of details
about the problems faced back in 2015.

When I asked, my colleagues said that my patch seemed to help, though
it was more of a qualitative statement than a quantitative one.

I wasn't 100% sure if it was worth sending the patch up at this point,
but logically, I think it makes sense. There aren't great reasons to
hog all the large chunks of memory for video decoding.

-Doug

