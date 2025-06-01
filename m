Return-Path: <linux-media+bounces-33739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CED91AC9E38
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 11:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EA7E177486
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 09:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB351A5B96;
	Sun,  1 Jun 2025 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxnsHh3E"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF6684D34;
	Sun,  1 Jun 2025 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748770486; cv=none; b=LV6JAdml2UPhBDj0tf/UXxRYB4EArJ22tZlBs561PWDZ68kSgHGYAK9LqaSXKJXHnbmSIeLOg0CZTKwKmu323X9ZXDi4fEIuxQMc0ht3jExsK6Dn0OpZTj9izc6S6qTKUqCfU+C3Vfp9d4c83+odWvhCynwA50UshBJfhgRk/l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748770486; c=relaxed/simple;
	bh=PANr7s73/zPOm8/gG8PUhwbjQwKY387Tz5rVkcAr3vA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gz6k2f5Y3OjlntFg+MzBpPgnxJ8/joJUGKswJBPB/HgWkCpXucCshO20odyjp50M4E5ojAjuFt0TOuBIG29JTM+82su0dzUowdSHS0t/J95AyX6kHyZUsQQ6x9Btd/k2fG5ZvIIbfqbvuI+nV3u/+gPVidX52LmTq4ofWQMUVHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxnsHh3E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024ACC4CEE7;
	Sun,  1 Jun 2025 09:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748770485;
	bh=PANr7s73/zPOm8/gG8PUhwbjQwKY387Tz5rVkcAr3vA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HxnsHh3EbRndyteVnA5F7ckUPN8zQ0aTaNqujSKEsZIrs9hgvcpdihXw7MDkYiMi0
	 h/+RLkGD5nG9oWxHaxlAtYISJRToI406YuwLloTXCz7xp70i0bIVLdCQwfJm3T50qD
	 dxBOduXotNTTU1mIkUGvD1MJxW2uLM4xYBB1qDKXWXyj9i2cK0N8pGeM+VlvOdme1k
	 BIqoGuKfpxsSym6RkyicU+XlvlKFcKzo/EAx/F45AYP0EeughVZF7em9YJN9+C7s0U
	 WO0ZcoaXtO9TVQx6g9mFNiGWU/59zSZ72k+iL5YKKqHqBu7fejwX0Altb7OZkctQRW
	 BS2UuWxcIG4Rg==
Date: Sun, 1 Jun 2025 11:34:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Albert Esteve
 <aesteve@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio
 =?UTF-8?B?UMOpcmV6?= <eperezma@redhat.com>, gurchetansingh@google.com,
 daniel.almeida@collabora.com, adelva@google.com, changyeon@google.com,
 nicolas.dufresne@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, virtualization@lists.linux.dev, Alexandre
 Courbot <acourbot@google.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
Message-ID: <20250601113425.4d5a3d89@foz.lan>
In-Reply-To: <CANiDSCsmbiveo4GHX54_q7-1CeKiDAVaGnb8+jsCybM+pyA7Fw@mail.gmail.com>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
	<CANiDSCsmbiveo4GHX54_q7-1CeKiDAVaGnb8+jsCybM+pyA7Fw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 28 May 2025 18:23:02 +0200
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> > +static int scatterlist_builder_add_userptr(struct scatterlist_builder *builder,
> > +                                          unsigned long userptr,
> > +                                          unsigned long length)
> > +{
> > +       int ret;
> > +       int nents;  
> Could you initialize nents and sg_list?
> old versions of gcc are a bit picky
> https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/77042562#L4381

Please don't. In this specific case, ret is always initialized:

> +       struct virtio_media_sg_entry *sg_list;
> +
> +       ret = __scatterlist_builder_add_userptr(builder, userptr, length,
> +                                               &sg_list, &nents);

nents and sg_list may or may not be initialized at the function,
but initializing it is wrong, as, when they are not initialized, the
ret code shall catch it (and if not, we *do* want gcc to warn).

So, if our CI is warning about that due to an old version, please upgrade 
the version at the CI runner.

Regards,
Mauro


Thanks,
Mauro

