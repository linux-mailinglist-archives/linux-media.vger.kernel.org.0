Return-Path: <linux-media+bounces-38420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBDEB1104E
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 19:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75AF8AE2A86
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 17:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE84D2EBBA8;
	Thu, 24 Jul 2025 17:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/gwTcWu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D5A1E5B6F;
	Thu, 24 Jul 2025 17:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753377847; cv=none; b=odL1O3z1g9ixN6v67dkE7zbMCaATu1H+VwG+C3gGbEUdbhIH1n0JSDX4acAGaIFLEPHJKP6Zp3rClP9DT+zfa84DCZS100tfAS0ZWi5qAfbhXUcAGZEK87nEuoes7yUqi1dtN11hEdwyvUe58LtMVSd18lw+Iuj5OP2L4C4Q9XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753377847; c=relaxed/simple;
	bh=NSPDTm3RpSgjTZrzLusFL5QBI95JaHmhAin4q3oEx3s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2f6MiUTLwwden+K2YVSFptMafr++qRBxh51buvfcOF2cxwaV06zFZEV9H+nDRJhMGHS7a/LIYVZ0oexQ0uaSdrFn4oXlEjWx9urWRDR2uY98VZA+GpI+LOu7806C/qPN/GKlKs7+SoUpUrEQgBQOvCLhAn/mJN8JSF6xk81YT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/gwTcWu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B27EC4CEF1;
	Thu, 24 Jul 2025 17:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753377846;
	bh=NSPDTm3RpSgjTZrzLusFL5QBI95JaHmhAin4q3oEx3s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z/gwTcWuN+DoliAeu/v98641wE29hhdgY1gEOj4PN3z/ZvVwFgmxNcy45TwtVfA9H
	 GDueToHR64nwd4XmOREBX8ozpp3E4dbk421fDykzUeZZNcYD8Ovbk+f55QOniMe2jW
	 Q+9jSl1/Eo1OFrYkF2azqNSnlXIuVUDuRQksad823aBzXQzi44Sgc0Je+nPrYdOVF5
	 +eAPase7hR9aMNtrHqp573OKDpSnwbLMpmeqgDeriZCUTvMzIT+lwwamgfSpIAUOnz
	 XD7qfzRsQpT4XGkuNIXj3oV8E5s6RSIE3mbgg+8bpXtbeQHbzTOQITkiNoEWMv8EPS
	 AP5v7Xh/k3yQA==
Date: Thu, 24 Jul 2025 19:24:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>, Alexandre Courbot
 <gnurou@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Albert Esteve <aesteve@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio
 =?UTF-8?B?UMOpcmV6?= <eperezma@redhat.com>, gurchetansingh@google.com,
 daniel.almeida@collabora.com, adelva@google.com, changyeon@google.com,
 nicolas.dufresne@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, virtualization@lists.linux.dev, Alexandre
 Courbot <acourbot@google.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
Message-ID: <20250724191833.253b8f40@foz.lan>
In-Reply-To: <CANiDSCt9nGP=r8VxkZH76a1i+xEd+RCJ71=6qx0_iPYdrn+GoQ@mail.gmail.com>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
	<CANiDSCsmbiveo4GHX54_q7-1CeKiDAVaGnb8+jsCybM+pyA7Fw@mail.gmail.com>
	<20250601113425.4d5a3d89@foz.lan>
	<CANiDSCt9nGP=r8VxkZH76a1i+xEd+RCJ71=6qx0_iPYdrn+GoQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 1 Jun 2025 12:01:22 +0200
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> Hi Mauro
> 
> On Sun, 1 Jun 2025 at 11:34, Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Wed, 28 May 2025 18:23:02 +0200
> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> >  
> > > > +static int scatterlist_builder_add_userptr(struct scatterlist_builder *builder,
> > > > +                                          unsigned long userptr,
> > > > +                                          unsigned long length)
> > > > +{
> > > > +       int ret;
> > > > +       int nents;  
> > > Could you initialize nents and sg_list?
> > > old versions of gcc are a bit picky
> > > https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/77042562#L4381  
> >
> > Please don't. In this specific case, ret is always initialized:
> >  
> > > +       struct virtio_media_sg_entry *sg_list;
> > > +
> > > +       ret = __scatterlist_builder_add_userptr(builder, userptr, length,
> > > +                                               &sg_list, &nents);  
> >
> > nents and sg_list may or may not be initialized at the function,
> > but initializing it is wrong, as, when they are not initialized, the
> > ret code shall catch it (and if not, we *do* want gcc to warn).
> >
> > So, if our CI is warning about that due to an old version, please upgrade
> > the version at the CI runner.  
> 
> The main version of gcc works fine. It is the minimal version (8.1) required by
> https://www.kernel.org/doc/html/next/process/changes.html
> that  complains.

Ricardo, 

gcc 8.1 was released in May 2, 2018. I don't think it makes sense to
address bogus warnings with that old gcc versions. I would just disable
WERROR for such versions on our CI tests.

---

Alexandre/Michael,

I need a couple of full days to properly review virtio-media. 
I was planning to do it during this Kernel cycle, but I ended
allocating too much time just to be able to create a crossvm
that would allow testing it. Afterwards, I got sidetracked with other 
issues. I won't be able to review it in time for this merge window.

I'm planning to do it at the beginning of the next merge cycle.

Thanks,
Mauro

