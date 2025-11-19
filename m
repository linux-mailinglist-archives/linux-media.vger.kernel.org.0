Return-Path: <linux-media+bounces-47409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4414AC70E2E
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 20:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 75BD434CBBF
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 19:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEDF36655B;
	Wed, 19 Nov 2025 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="L4UMvPAP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391A37030C
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 19:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581514; cv=none; b=E/I5eggA8KIoElxCB7d8QeScgSRRBaKEQanWJZjbnbTvx8grVpYUJNQ1x2rFgicoH5yTKsUzJcgioaunxJ8/oPVzaJ7mvRRVzDhaFIpVd8nI5XV2ffuOTStBWKizae/nRIHCwKEN8lNYBVU3NE/1U4oLgz8TLN1LGQXHzVps2p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581514; c=relaxed/simple;
	bh=ez/Kk64Qkn4faxtP6x8udD23BDfPOJ9+UM/Y/c2urgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nO3udr41vnR2tYjwy97IlGFq5k2ns41+/7vOBOVn0llikLujlMce0LhVEa3e2w/txi15fFcmO6/fBD+JXHmggEVPD+RrFMzF0puwQ8GYrDoD06SEd1R5qk6RZ5wt7gUyJtElV7ZC2cL2yg/RuxYrdj+CEIop48rUo95CVL+NXdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=L4UMvPAP; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b21fc25ae1so11335185a.1
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 11:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763581508; x=1764186308; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ngigizqFoW1/n7l/UtYTJcb/TxX1OBEkHcoOUDKA/VA=;
        b=L4UMvPAPhzDYWioXgmQd8KhZiNE1H6762XCtFNAqx3wKKkmE3xDSf3bYqxSobinIuO
         ffuwmZf4NzL4SQmiwAjzsu/ZOlG/SbwHH1tHGDRnLj1H1TlRcyZMIZC/BRgq4dfjlO3U
         ESSlmjSDSIMhj9vvFDraaZfgHrBPSBuhAP5sEf0rU9NEWTaa/MMIeM9OGXcBCaJR6aCu
         5/d2TA8eKJeVFBWRihAEOITWaxSWulToVPH//ismSQUnwpXZ6weHPTMfogbiigG9Rd9l
         3feBMqmQlMibdreY9QRmN8pwc1fk5yAOrG6R8cYPL9V3odhMjgag3rVKkdIy2DY7Ob+f
         Ki9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763581508; x=1764186308;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngigizqFoW1/n7l/UtYTJcb/TxX1OBEkHcoOUDKA/VA=;
        b=M/T9XlYTkJGq0cW4z2c1rjNRdB5/C9CIMfHvIAyWNcXKu2JEQkbaV2QzPg9l6rUU5J
         Tdz6kRSvhNqbLpFiPrf1AErkDAxz1QHMQNBG6eVzJHb82Y44ujVV1BGca6zhl+ujFX5J
         6RQcdbgwZ5g6fDQXxTibGjZg0k9aUJTS7IYnredbecOWPyK0GKX0x/MlRptiVGn7nq1O
         IYS8g9S4heJjSZEEuQky0BMFXcIjF9VM5RWk1Bk9B+4FpiliQxCv+992Bh04+Cdz2UPx
         H6KBwBmZkjBP1NHX5TAi4XrA7pxuux8DXuelhC9yx6nBnGyFjs5e4c58oEohgTHJxyb4
         +ZYw==
X-Forwarded-Encrypted: i=1; AJvYcCX7MfIOG87Rjupq9KfaOgv/X+rV/YOEbCbkEPyn9cVurS92W2iJDhySVCcXGFAHtBm9J79K74ezfRegng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6uNyS8pyTpdF0Fc1YpP/97jfb4E8tH42o0yasFxOu6jUBxr/q
	0KoXRD9p+fjen3VIWDxhXn9cKQZoGHuiazNM0DEb9H2Lc5Nm0ysKsw4HcNs44RfrF4w=
X-Gm-Gg: ASbGncvIYx9kO6yHsqjP7cRHpkImxMhaZFk0S+UEX+FmsoDQFxGPJe0vUxDccHEggRW
	dHKrdZfM2i0v69K/n9a45Sn5WSLXA6iHfRqAYMsaUT7UR6jqD1+wma9e+C5qYL76ELiUF5Tb3XN
	JSjdmN5qyVKAZ3s3kiRc4+s0qmSliGuy9UPyZEYoD873zcXD4FjUHApM3EqU1RIPiUXnDJegqC8
	kgJatZKbJkUCdpMOFUbyQx0653UeKho3b78K++2BovHXjQ1kkN7YK6r7qxnVF63Lj48dlpQntqG
	sV1rCW6jQ7ThxpRjKKiTA6NNMLjo+gNGwht8XtOoON2x0p6F3IQBw5LB7fwlJqQxJc0/eJUoiIY
	CAW/bM7KM7DxcvQJFlswX9F2T7oUrdbyvj5W3e7m97DSCO5NQo/p+06gELE3cZjw9U6c7Y6ly55
	a+NpNDsyTFhJjf56yeJLQJ+2SW9q+KsMu3DLXhIg3ClGeB7i6TZdnhUF0f
X-Google-Smtp-Source: AGHT+IHM2All3T5KCtKB0YCjHC7VAw8938Pjcsqc0YyXScERh5oSqA8kZNdUfx1RTYUHZ+fIhtYAoA==
X-Received: by 2002:a05:620a:44d4:b0:893:31da:1028 with SMTP id af79cd13be357-8b3274b5313mr86654885a.90.1763581507903;
        Wed, 19 Nov 2025 11:45:07 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e447272sm1944186d6.5.2025.11.19.11.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:45:07 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vLo70-00000000bcb-3TE0;
	Wed, 19 Nov 2025 15:45:06 -0400
Date: Wed, 19 Nov 2025 15:45:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>,
	Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v8 05/11] PCI/P2PDMA: Document DMABUF model
Message-ID: <20251119194506.GS17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-5-fd9aa5df478f@nvidia.com>
 <9798b34c-618b-4e89-82b0-803bc655c82b@amd.com>
 <20251119133529.GL17968@ziepe.ca>
 <ad36ef4e-a485-4bbf-aaa9-67cd517ca018@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad36ef4e-a485-4bbf-aaa9-67cd517ca018@amd.com>

On Wed, Nov 19, 2025 at 03:06:18PM +0100, Christian König wrote:
> On 11/19/25 14:35, Jason Gunthorpe wrote:
> > On Wed, Nov 19, 2025 at 10:18:08AM +0100, Christian König wrote:
> >>> +As this is not well-defined or well-supported in real HW the kernel defaults to
> >>> +blocking such routing. There is an allow list to allow detecting known-good HW,
> >>> +in which case P2P between any two PCIe devices will be permitted.
> >>
> >> That section sounds not correct to me. 
> > 
> > It is correct in that it describes what the kernel does right now.
> > 
> > See calc_map_type_and_dist(), host_bridge_whitelist(), cpu_supports_p2pdma().
> 
> Well I'm the one who originally suggested that whitelist and the description still doesn't sound correct to me.
> 
> I would write something like "The PCIe specification doesn't define the forwarding of transactions between hierarchy domains...."

Ok

> The previous text was actually much better than this summary since
> now it leaves out the important information where all of this is
> comes from.

Well, IMHO, it doesn't "come from" anywhere, this is all
implementation specific behaviors..

> > ARM SOCs are frequently not supporting even on server CPUs.
>
> IIRC ARM actually has a validation program for this, but I've forgotten the name of it again.

I suspect you mean SBSA, and I know at least one new SBSA approved
chip that doesn't have working P2P through the host bridge.. :(
 
> Randy should know the name of it and I think mentioning the status
> of the vendors here would be a good idea.

I think refer to the kernel code is best for what is currently permitted..

> The documentation makes it sound like DMA-buf is limited to not
> using struct pages and direct I/O, but that is not true.

Okay, I see what you mean, the intention was to be very strong and say
if you are not using struct pages then you must using DMABUF or
something like it to control lifetime. Not to say that was the only
way how DMABUF can be used.

Leon let's try to clarify that a bit more

Jason

