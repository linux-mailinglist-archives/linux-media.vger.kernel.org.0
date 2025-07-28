Return-Path: <linux-media+bounces-38556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A13B13A0E
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 13:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDD197AA8D1
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF15925F7A7;
	Mon, 28 Jul 2025 11:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7ZyfzAU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73E0748F;
	Mon, 28 Jul 2025 11:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753703518; cv=none; b=JWFDeb68dkMWhxYB7boFQ3K5p2yUhU3zqAi0Z3CY6ClK2Vr8+X7tH0kJetxmsfZhlBPMvRrJctfdBrmEUHkC1M1pbhTrm25lr6mVoouayXUV6Ml7NAV/dFdiO4ENCV8H716sGRzNku9HtyoJtOy/MwIKvuHi74BVmXAG50tJ6hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753703518; c=relaxed/simple;
	bh=765Zg2kvdW9MEMLHWxxka94UDM3iWDfdwAN2sOe8HSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tj52EH6tlA68PLdt7UAdjl3phqd6o9FNUQPX/SrChhByjpL3tcLP2gkXITyot5/Y6A9iwfBLImWU3Xj7OZoQPGHgloLcXKiC6I/Xvn/t5q/HB2cFaG5ZiWZSvTQEpPhZmVmsW2haoAklCjhtrmt8tnimQGgplhFjKvW/E5yUfb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7ZyfzAU; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4e8088896b7so3818192137.1;
        Mon, 28 Jul 2025 04:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753703515; x=1754308315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Likoa40Tg3Hu27n+cGt0OOu4O4FlIaVhlBXKe7cRGBI=;
        b=E7ZyfzAU93HoFBe6J0EiiyZ/q8gMb7qXfp/2xHEs7LLzVEsPN/jtKJW5e1TjR4nPMd
         z1+Y/Ha+VSr34weD+DluafPN/ePxALHR4rnep/Jkl1hBo8f0ZtnK7wZDlyEJo2dtyraY
         YU2uVnbPJTZ2NIlJW898MYu4Zlj070voOC7RCrjab+srI1qos8NMN2U5XBUfFttdPjaX
         Dw8fqElgL6c6kKDkvAkxhyDrufin+aX5lLwW6e4ai/xgzcWlpDrSxZEy6F8NFBZJFJMo
         dSmZ3s+5P0Z8l0MxQFTxl6jBLcq+PI3eUWDybG6DDYXoAUiMHEwYtXYDxlY97X51Cj5o
         E3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753703515; x=1754308315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Likoa40Tg3Hu27n+cGt0OOu4O4FlIaVhlBXKe7cRGBI=;
        b=n53I5slh3AZFNVTERwGg66Dg8aLkdYc7YwYJOAjPmdkgdY/9ULOtxUlta3Tzt5tum6
         y0vHsaWUfUmxv2RyhwqWXyYKd2qLlhqEP5mCYe4dijxvb+Cg7RCu4LyRZt73nTFp9FDc
         oF3Sl/lZl2F/QeyybLznXuuhThn8o6hgQ0jrs1ZOjo5dXEnKfvUOm3QNMCLFkZm6Cadq
         FkhkRkkJgnAPk+BspXPZ75xkI5g6TakKw7UaRDy/q59wzFFBaHpSlhNVli1FVbNhF94G
         0GcunD3FZeF4+deUckmqA1qSjY6wL3wtA3hrLu7ZwRVRNokr3Cb/CwbTb6mDAk5VXFYv
         HqDg==
X-Forwarded-Encrypted: i=1; AJvYcCWyt9yJC0/92tFvZI9blWog3RKX11D9ls/OiqeH242QY+gsYCw3zj+kdC91ZfQCcrIB95zMUIuTCo80EAw=@vger.kernel.org, AJvYcCX4Sl0oisCuWCR+bvDoY4xSLQHAKA6so1WgNBPuJJ8/vqLBCwBrWUSdG1huvDDlSg1Q152HJQ7CDJpCHRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdH3ey5tcpHDfsLcCSpsOUJ3mFveLOf4yyhRioRdAoX9qs1Kmm
	jNjjTUqfPHfBc+ZJZUgb1Q9UbbfsDHk/wMuMvAl//63TsmpJjrgnPzwLraMblpdbXc2u5fkCAyp
	UDOC4gxQP5CYyvVCqJ9Ihy4rlMSxLw0M=
X-Gm-Gg: ASbGncuIxIidLPkOcGXUBpo/6/wSCcgy2TIlwWloq0za/cuQsTkbjtdi+7y/5JAMhiL
	9SX9giVk7ETHrU/UPi0OeTTtZrOOJfcNsqxUMlpvmD105rkoNCMJeAcUExxUaTiIIJjXYzbo/JY
	eX+OFKu6NB8agg6vaMvj4VPRuQrSqmEH+OJtf69u81WtJr/cgRxTH2zY6e42yXKPLPcQcLCbczF
	AjHWc+7YempSVAM3lNoreExdERq13WENMsuByRNqSswO6qS
X-Google-Smtp-Source: AGHT+IHsqmvDN1OFlcp19Q+AvY6FXGJmsuYKzkKxh4r8EMVJpKypY+COSUIzdrhQaRKNH1fBxdx0oolMl9lsOpkidVQ=
X-Received: by 2002:a05:6102:548c:b0:4fa:3547:2d38 with SMTP id
 ada2fe7eead31-4fa3547343cmr5831280137.10.1753703515441; Mon, 28 Jul 2025
 04:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
 <CANiDSCsmbiveo4GHX54_q7-1CeKiDAVaGnb8+jsCybM+pyA7Fw@mail.gmail.com>
 <20250601113425.4d5a3d89@foz.lan> <CANiDSCt9nGP=r8VxkZH76a1i+xEd+RCJ71=6qx0_iPYdrn+GoQ@mail.gmail.com>
 <20250724191833.253b8f40@foz.lan>
In-Reply-To: <20250724191833.253b8f40@foz.lan>
From: Alexandre Courbot <gnurou@gmail.com>
Date: Mon, 28 Jul 2025 20:51:43 +0900
X-Gm-Features: Ac12FXzLrdinDNy_ff-eOZ_xxvjLB4Bph9uh3DCpSNYBsMQAHaG1vHziQkM_kmQ
Message-ID: <CAAVeFuLPAwMyq7cTDE4Fp3+i883RdDWkg=GOMGDzMxZz6rgSuw@mail.gmail.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Albert Esteve <aesteve@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	gurchetansingh@google.com, daniel.almeida@collabora.com, adelva@google.com, 
	changyeon@google.com, nicolas.dufresne@collabora.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	virtualization@lists.linux.dev, Alexandre Courbot <acourbot@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Fri, Jul 25, 2025 at 2:24=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Sun, 1 Jun 2025 12:01:22 +0200
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
>
> > Hi Mauro
> >
> > On Sun, 1 Jun 2025 at 11:34, Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > Em Wed, 28 May 2025 18:23:02 +0200
> > > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> > >
> > > > > +static int scatterlist_builder_add_userptr(struct scatterlist_bu=
ilder *builder,
> > > > > +                                          unsigned long userptr,
> > > > > +                                          unsigned long length)
> > > > > +{
> > > > > +       int ret;
> > > > > +       int nents;
> > > > Could you initialize nents and sg_list?
> > > > old versions of gcc are a bit picky
> > > > https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/770=
42562#L4381
> > >
> > > Please don't. In this specific case, ret is always initialized:
> > >
> > > > +       struct virtio_media_sg_entry *sg_list;
> > > > +
> > > > +       ret =3D __scatterlist_builder_add_userptr(builder, userptr,=
 length,
> > > > +                                               &sg_list, &nents);
> > >
> > > nents and sg_list may or may not be initialized at the function,
> > > but initializing it is wrong, as, when they are not initialized, the
> > > ret code shall catch it (and if not, we *do* want gcc to warn).
> > >
> > > So, if our CI is warning about that due to an old version, please upg=
rade
> > > the version at the CI runner.
> >
> > The main version of gcc works fine. It is the minimal version (8.1) req=
uired by
> > https://www.kernel.org/doc/html/next/process/changes.html
> > that  complains.
>
> Ricardo,
>
> gcc 8.1 was released in May 2, 2018. I don't think it makes sense to
> address bogus warnings with that old gcc versions. I would just disable
> WERROR for such versions on our CI tests.
>
> ---
>
> Alexandre/Michael,
>
> I need a couple of full days to properly review virtio-media.
> I was planning to do it during this Kernel cycle, but I ended
> allocating too much time just to be able to create a crossvm
> that would allow testing it. Afterwards, I got sidetracked with other
> issues. I won't be able to review it in time for this merge window.
>
> I'm planning to do it at the beginning of the next merge cycle.

Not a worry at all and I appreciate the time you are putting aside to
review this properly!

Thanks,
Alex.

