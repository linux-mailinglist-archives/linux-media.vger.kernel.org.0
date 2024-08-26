Return-Path: <linux-media+bounces-16758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1743695E8E5
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 08:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9057B22E96
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 06:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3735013C9A2;
	Mon, 26 Aug 2024 06:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bEohFgdH"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DA813B7A3
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 06:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724653667; cv=none; b=eARw7PND0HmzEO1zrYG8FaGuWdqznzyP+Mucps9EE3S3h6dTVaYNris74UoQTfjj56hgXvKwYsOV6VEkPRfFxEVN2nllJAcuV5wHGn6CinE1VizqNf0lS2Q1QbtctPz5Z2mqtERAZKee/2CJik5cBvE5VmTwlkPVmomrLE4iZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724653667; c=relaxed/simple;
	bh=9FdJ3ALSTNHxptv1eM+dVepm0TpConKuAyxPlsMtLjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkIFKS4G2ls7cn66+WOBFqqrfPeV6AVoFr8xfrwYtVOYeOe+4Y4YG/s4efR91qspETQXE/1hbEeH+CdHleB5eCn9z8CRji/vnvBEiscVGgK+LaFsNSPOj7B0VJVG8orSltROR0swiH6DyWRg/el8TNR3J3/q12YFddFqTYzc518=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bEohFgdH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724653665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rs8AUYhSmmGXuJkf0JZ3EFqr6hWEcb9C7Q1wG4ibjBY=;
	b=bEohFgdHhQBAPVmuuGfCpihV3vxrVAOWFHDFOozzI+DucARHj48LYfV7yN3x35HHEu7npt
	Dx1qG/204LkqrJIck+c6PrQFEgX4owPSpfCKwzLIsT/HAYUlShfVJS/iA6keuEAZAFALfS
	+s0Wy5tsVPVLmXA4CX8kWTTiS7lT72g=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-sX7sE96PONqLVUL_oi3PzA-1; Mon, 26 Aug 2024 02:27:40 -0400
X-MC-Unique: sX7sE96PONqLVUL_oi3PzA-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2d3c89669a3so4909720a91.3
        for <linux-media@vger.kernel.org>; Sun, 25 Aug 2024 23:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724653659; x=1725258459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs8AUYhSmmGXuJkf0JZ3EFqr6hWEcb9C7Q1wG4ibjBY=;
        b=AKmQ78Ln9DNzHGoiXNHzWqyeMUorptZfXn+Pb9GplCgy45/NIXMCwPzZjFppMtAx2l
         809mB33NzQ24jXHXowNXVdUlxqaMuCp7XpeBuCWuO3COygbQSmod40Wu8n5MPKw85Z0s
         uJ7NGCvvtlDlUkEWRMAHJEAPEg4tC2O+8taDRI1iyXjrPJXquM5dGwmC5CZRHDCObsV8
         dmR/eEZ0w5d6XmxFv7qXrj0G2L++83+aTKB6ae+LmelDgS6SAJSOG1u5bTBaKGOEipcg
         gXg8aa8doAPyq9VIeVdHEhT+S1sO6Raz8SbFkouQuYZUPteJZ0+fZ7VAioyWk7CC9TJm
         WcPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJHyauN7IX+sSrXe002gwUkmY8n8/rnE6dvGulhmCaUZcYmifkxaFc652jWGL8oraFqzx+ydhXJfnKGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIvvlwMwsVKCJB+obLaf7hwQoFy+kHuEdGYjC6JT25DWuc4pT9
	rVTskRzlzLPvUl94nvnX56Rb8VRSBpuzgIwGbbuUBaLI7wDxlXvA4c4qJ5ZZHr42a1Vap87OAJM
	F/yNzojCtXxJzS+A2a/H/GLcce+89XtTcR3lPovWfgsHz6q7hLrBNEs4DaDve0p9P6c0y+zBgIA
	oMhxOyJ+cw/C5/eDgiZwKBLYJquguqPZco6MM=
X-Received: by 2002:a17:90b:ecd:b0:2cd:619:6826 with SMTP id 98e67ed59e1d1-2d646d4dcfbmr11272924a91.34.1724653659611;
        Sun, 25 Aug 2024 23:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP3GZqzlMhqPuuYHeWu96SGn+Tu3LWd1hDEbxpGhfc1OXWvtkUWRElPm7DPTwJzR3LmdWyUKTz2DeMu9Do6/Q=
X-Received: by 2002:a17:90b:ecd:b0:2cd:619:6826 with SMTP id
 98e67ed59e1d1-2d646d4dcfbmr11272892a91.34.1724653659123; Sun, 25 Aug 2024
 23:27:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240824035817.1163502-1-hch@lst.de> <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com>
In-Reply-To: <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Aug 2024 14:27:27 +0800
Message-ID: <CACGkMEu83MjTpkSS1mX02ar8RNDc5T4bsd4kkGHYhkH7LZY-wA@mail.gmail.com>
Subject: Re: clearly mark DMA_OPS support as an architecture feasture
To: Christoph Hellwig <hch@lst.de>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 2:16=E2=80=AFPM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Sat, Aug 24, 2024 at 11:58=E2=80=AFAM Christoph Hellwig <hch@lst.de> w=
rote:
> >
> > Hi all,
> >
> > we've had a long standing problems where drivers try to hook into the
> > DMA_OPS mechanisms to override them for something that is not DMA, or
> > to introduce additional dispatching.
> >
> > Now that we are not using DMA_OPS support for dma-iommu and can build
> > kernels without DMA_OPS support on many common setups this becomes even
> > more problematic.
> >
> > This series renames the option to ARCH_DMA_OPS and adds very explicit
> > comment to not use it in drivers.  The ipu6 and vdpa_sim/user drivers
> > that abuse the mechanism are made to depend on the option instead of
> > selecting it with a big comment, but I expect this to be fixed rather
> > sooner than later (I know the ipu6 maintainers are on it based on a
> > previous discussion).
> >
>
> I will try to fix the simulator considering virtio has already had
> mapping ops now.

Actually I meant, we can extend the virtio_config_ops to allow mapping
ops there, then simulator and VDUSE can hook the map ops there.

Not sure if Michael is fine with this.

Thanks

>
> Thanks


