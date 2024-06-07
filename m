Return-Path: <linux-media+bounces-12712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 961E78FFFC6
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 11:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2165DB24DFC
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 09:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179D815B990;
	Fri,  7 Jun 2024 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Enp1QBhf"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4771CA85
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717753316; cv=none; b=GUX+7+5k5mTwi2i8f4IeP+sam2ubkfTZJTnEWjdKNSKre7Y+3tl82wehylfXNPxe4C6OYNj0vxaXpbXeWhS41f4CJFpbcjnLtUN7J5RnCABqzms+vRaayUAI9RHz274yNVHeMqH9eJz4OoK5gtRhw9TC8GxVYrY2efppi7pvHhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717753316; c=relaxed/simple;
	bh=MJz8M2ob481Dib8t/BMGrIwhPG4PX6TFwfsDhWGsU5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leDcFRoeCHghekxZDqHCiAGNw/JSvtlxRUPLKkULX5HMZmKBY3lBKay0+R3B/FbLtuRBEMO16H6m9hl6ThRgJaL75ZQp4z/ibDaFKGzCdSpX5rWkwj6c3UXLqFrD0Nee93XtXQ8Ij27Sc1GrUSGtJwnQOT/sm7twvAmz6fjiNRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Enp1QBhf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717753313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pL5L3Pv/nSIjK9K4Rb+X0AGzikPBKIJoA4e+Z7suRIQ=;
	b=Enp1QBhf6X41Ktgm6wdDovEaW/N6OF8soYyY+/u3wvM4Sn6nOeJkHeVewjMKZny+23XsOK
	m++4bukwpB30x5wfT93yqiOMOChj1sq3rm+gDLJ12L3ICcBM8MpBzaA090Mfuy/oUFCZQm
	dOWr4Oy6FWcdvSjlLMQfI9taUAB/Eds=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-TjKuxXRQOOGgs8Ae7gY1PQ-1; Fri, 07 Jun 2024 05:41:52 -0400
X-MC-Unique: TjKuxXRQOOGgs8Ae7gY1PQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a68e0faf1f6so115628566b.3
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2024 02:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717753311; x=1718358111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pL5L3Pv/nSIjK9K4Rb+X0AGzikPBKIJoA4e+Z7suRIQ=;
        b=Dtz1klfkK5wjnc4FoJ0acs2wrN3GrOnbj4VLfGQDeVqh+eRhC79T5exYAx4NnDWIuV
         rfGEl7iRENL+49+MgNk5/z/mU1G+zNYYb+Ao6rzNg4nufojQgIxHax+QhxL38ePA+kmF
         DvI6knPVPIk69shrOCDg56EvbqxplpdBSn9h0jBge9xKFY2j7A+eQU4NM80OTwfDP4zF
         K1rS/VQ/eM0u8GRHMsINJGboMuVfoIyPP4ERAtVM3JJrBXtZ3MrJEGTK2qU1FW1UmTco
         b+SX5d1+9Q3rW93QPCGdrvJy/QRhDYBTh0JhGNYm0yoPlTH+QGQ/ovmPVyRJPe4ikmLl
         et+A==
X-Forwarded-Encrypted: i=1; AJvYcCXooLN2/5MQBBfsgXMerh6Eg13iT5APbgNm2Uip4xrjvG8VA3zyPapaEhRcE5mvQliTnje0EcLRYP7dreTl0bbJRiQbHhlhGqW6/dk=
X-Gm-Message-State: AOJu0Yy38afH0aGpY9BnDzL6NxesDNjp2S6u8/SsdkFtPrUEA30UfoRs
	AXutNdG5uXNZqCYhLFchFbtq9ryX2/ZdiAXgsrl5v7eUEOoE2BaQfQkqzvCEMXrNtTFna2SV9v8
	lkH+ArgDa5pEHwLJidaECUuVqBmfWmuAZ3UlZ6ugH4LIEpObwn6FLiN6M9Kfy
X-Received: by 2002:a17:906:819:b0:a6e:f53c:8da1 with SMTP id a640c23a62f3a-a6ef53c9204mr13223066b.32.1717753311118;
        Fri, 07 Jun 2024 02:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4zQipaQH9CTHM9i7wTyKnldgRuuw1xPmH/WKSqTFjvFUwm/NBTJYVWcXx5pUHA1wv2kpKcQ==
X-Received: by 2002:a17:906:819:b0:a6e:f53c:8da1 with SMTP id a640c23a62f3a-a6ef53c9204mr13222066b.32.1717753310665;
        Fri, 07 Jun 2024 02:41:50 -0700 (PDT)
Received: from redhat.com ([2a02:14f:176:d5af:1ef7:424d:1c87:7d25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8072ae3esm219776966b.225.2024.06.07.02.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 02:41:50 -0700 (PDT)
Date: Fri, 7 Jun 2024 05:41:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-dev@lists.linux.dev, Matti.Moell@opensynergy.com,
	cohuck@redhat.com, acourbot@chromium.org,
	daniel.almeida@collabora.com, Alexander.Gordeev@opensynergy.com,
	changyeon@google.com, alex.bennee@linaro.org,
	gurchetansingh@google.com, ribalda@google.com,
	nicolas.dufresne@collabora.com, eballetb@redhat.com,
	linux-media@vger.kernel.org, virtio-comment@lists.oasis-open.org
Subject: Re: [PATCH v2 0/1] virtio-media: Add device specification
Message-ID: <20240607053839-mutt-send-email-mst@kernel.org>
References: <20240607080045.1337046-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607080045.1337046-1-aesteve@redhat.com>

On Fri, Jun 07, 2024 at 10:00:44AM +0200, Albert Esteve wrote:
> Hi,
> 
> This a formal attempt of including virtio-media
> device specification.

This was sent to a wrong mailing list.
Please repost to the correct list.

Albert, when you subscribed to virtio-dev you should
have received a message that read, in part:

When to use this list:
- questions and change proposals for Virtio drivers and devices
  implementing the specification.

When not to use this list:
- questions and change proposals for the Virtio specification,
  including the specification of basic functionality, transports and
  devices (please use the virtio-comment mailing list
  [mailto:virtio-comment@lists.linux.dev] for this).

To do:
- send email preferably in text format (best for archiving)

Not to do:
- copy both virtio-dev and virtio-comment mailing lists (instead, pick
  one)
- send full copies of the virtio spec (in any format)



So what made you send a specification change proposal to
virtio-dev, and also copy the defunct, non-functional
list at virtio-dev@lists.oasis-open.org ?


Was the message unclear? If yes I'd like to improve it.


-- 
MST


