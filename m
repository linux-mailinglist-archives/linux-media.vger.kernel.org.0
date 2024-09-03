Return-Path: <linux-media+bounces-17459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7B4969951
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 11:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B5C81F22A09
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 09:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3121A0BE4;
	Tue,  3 Sep 2024 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hh5kBEjO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352471A0BCE
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725356389; cv=none; b=nu6DexPjHJzOJ6gYO8SRVkp7NsJ9w2bAKSqkJHD07l7sAlKzFByM3EzYTqGT66Gbb21T7MtJ6KP+HJB6MMcNpCMSg57OhrMR84PdTH7UzBTlD5xvv1w6kR5gur9jCexXtsD5tqkompX3o7fk20geXycXA1eayJlJvcbQp+QUNMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725356389; c=relaxed/simple;
	bh=pE3Mr0PnS9xl+CUiCEH2hxI4fWM92/vwv+iNfIiq4l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kB+v8OrTtAWoJ/ZtShjTDy4IpV4XHqT3Vn/dnffk/oy+o34mTXK2bRH2mbTeNJwFPmPF9pEirZur//DagiDPciRkZQ18yfxOD2n3PcTCpdlRIAznIBMmlA0g3qhiLKjRVNqMuEeids8+wkhUcjel2nAYOvqufbojHUvVKJrIovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hh5kBEjO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725356387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cIxA/7+yR2jXA4ieeKPuD5EUL5lArHR8csGiCMl6eW4=;
	b=Hh5kBEjOrdKZk3kRJinPc6wdUa5u6DXLTuWECSxYMTKrHHUGqSFrQ2EZzMzn9n3jPjSkDp
	GC6ifzE63Y1thpL3mpxcPpx/fxnMhjD+tQ5mrxZr3Pk0X0fXkFZ29JbgHWf97tb3WJzpaF
	VBc2DqBSZXXc3dJ3AutwG9VxR12KmZ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-UrBlr12jMNSyStLa3aG35A-1; Tue, 03 Sep 2024 05:39:46 -0400
X-MC-Unique: UrBlr12jMNSyStLa3aG35A-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-428040f49f9so47754125e9.0
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2024 02:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725356385; x=1725961185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIxA/7+yR2jXA4ieeKPuD5EUL5lArHR8csGiCMl6eW4=;
        b=unqHdLUGfSsrenvGcrZGEPYyGFkCd4rdb0I2WW/GV2ITuvOAki3x6HE8KIpdt4LQoQ
         HjiLf4+n6B6aggz9jL8IcLEvP+R2fMTQwsWuBIW1hJQ3n2J0ZKTfbBfMb6sVHTSFOwaS
         Dw1JWFljsHvpSI7jW21Ve38hEngZioS2/kuh8jM8NZyQ6SoC3AZppnMQ8+UL2A48V76S
         FAQKG/9ve0rWfBE5DOfSNlQR80zzWI1tfUReXfrhTKRDEiDyv/L/TxwVFkBs3PB79r/e
         aq9PV1O8TFKrExuL0EgFb6LM1EBY+yf4xs5xaDBuBvimkoBnOLkPrO43Y9w4TtAJ9lIB
         K9GA==
X-Forwarded-Encrypted: i=1; AJvYcCWxtLAod6wdmvX+dahhQMWNxAGcU2F+j036nfZ2q9YXhunTZmMWImDgLtjGEzF0cT+1dprQw9clHtRkog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoKMWOABTxWNwnkEQ+kD/aG8g1qezT1Hxl4s9RK+21/YXfv7VO
	lN3kpb/18hTsSCYllI10F/8ZqQ439YZIWpDL3PLxQME6Aolq/Cvas7wvS4CnwyfoUHZj8SeSrcZ
	5laFbLl+4G5uV9wpL2y5dlqF4osaa/o+JOXf9VqW/Lo69E1RB2zxxePnV0uF5
X-Received: by 2002:a05:600c:1f90:b0:429:dc88:7e65 with SMTP id 5b1f17b1804b1-42bb02ecb7emr124596355e9.12.1725356385058;
        Tue, 03 Sep 2024 02:39:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx9ZT+cp/JOzMdJ0eMMwlRMn2QkU5Mi38V0c6sZIqJTMhc/MD50iSbcQF046e0ymvaKlJlng==
X-Received: by 2002:a05:600c:1f90:b0:429:dc88:7e65 with SMTP id 5b1f17b1804b1-42bb02ecb7emr124595995e9.12.1725356384137;
        Tue, 03 Sep 2024 02:39:44 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:95c6:9977:c577:f3d1:99e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0f41sm164222235e9.19.2024.09.03.02.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:39:43 -0700 (PDT)
Date: Tue, 3 Sep 2024 05:39:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, Jason Wang <jasowang@redhat.com>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-media@vger.kernel.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org
Subject: Re: clearly mark DMA_OPS support as an architecture feature v2
Message-ID: <20240903053917-mutt-send-email-mst@kernel.org>
References: <20240828061104.1925127-1-hch@lst.de>
 <20240903072744.GA2082@lst.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903072744.GA2082@lst.de>

On Tue, Sep 03, 2024 at 09:27:44AM +0200, Christoph Hellwig wrote:
> I've pulled this into the dma-mapping for-next tree, although I'd
> love to see one of the vdpa maintainers look over patch 1.  I'm
> pretty sure it's correct, but a confirmation would be good.

Missed patch 1, I was wondering why I'm CC'd. Looks good, thanks.


