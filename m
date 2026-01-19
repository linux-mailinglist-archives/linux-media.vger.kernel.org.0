Return-Path: <linux-media+bounces-51076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D674D3B34B
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 18:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2BBC30895D5
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 17:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03D931B114;
	Mon, 19 Jan 2026 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="njIjwbMY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2DA24BBF4
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768842216; cv=none; b=VhONC0fkAlNMzwwWJO+xNXtqdFGMbN7rLLZ2xTvHQTdH+y1oiwbefIeDUueThuSvPUjY5D5xzxfND7rxocDuDi+KLrg/pphCnnZuiYO9C9qIekg96COnEk8YI3N91h83v9IVamr9I5FUpT0M99srAIXsHzSEO+oK+gs/YNtgzQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768842216; c=relaxed/simple;
	bh=rf6zLo4HMSx3jjTOpNOmyUHF2Og5rRAkebiZTxcDcUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHC8cEyOj1S8hwziAEQGFwd6cUSpR+O69kScrBBp3++5QTXrIitgFPigHYdBT9hsNoRXBz2OjnVhTInLM3lL3mPxBsEHIAtjMdk+C3oNLdANoljqc4bb45fEaa77FDex5VT9ttW7EwgHiDnQFhWdwtoofe3RIF/SAaB+RoL7HPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=njIjwbMY; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-93f5761e09aso2732389241.1
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 09:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768842214; x=1769447014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xPF37M4OZRPT3BtJHYXM5EEOm0b3fHdtNnzMGWb7xcQ=;
        b=njIjwbMYYxpN/nZjTfqw0ZlvGqNzdiD7cVaRqtfNiIwzowDBE111KsGg/eJ979Nj1E
         cBb6K0t6GSbh/cKrI78GNEE+cil+xIFTz6Bogo42/gfzuuiNyCHyIcCmrjadpmPZAWIm
         kwDUJwv5qC0xfLWc6zjCmoumBSj/GAsFWJkJ3nFyyPXbmM7lRx8U1iLnxC1vOn5pBruQ
         5o4ghFmRoZHj9vmtufocfIY6JuWdIKBlDW8L/DdizF/Jtand/HzZprHoECeqnzmfxd+Q
         zP0eMBCvnqeeSZZcx2prjHK3OoqUDn4pDSL4rj1kPkbUcteYON83SDaBxaqLpwWkzxUD
         Qqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842214; x=1769447014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPF37M4OZRPT3BtJHYXM5EEOm0b3fHdtNnzMGWb7xcQ=;
        b=ni7kdOa0D5Eu1G2+sTtgv1+0Ps1VKwp1CJiXH3P7hcw6o1zJIIOYZx7VLD7JM9EDi1
         2ko2t9AC8Az5MIxIyNfD8EqYC+ZnrvsgjDvi9vUFVLZw8MvX4K9WK1+gdb6llVYy6p7j
         12SdgK7k/vnw3ZQsgElQ3TDGoXg5SRtdu1YUAFlDEP9x8R3x9gXdpIAI1FPsybMqM4ZC
         VGMoms46U0ZrI8vKgAVJXvpMwv4Z6Ah1RopH4wLO+YFY1K5YM6SI4cyLtY7ZOYrmtrMW
         +Gs6M91Elr5XF5F6xHpsAsWmcjCOVA/NSfWRgeaq5yuBJNL5X074iMk/NvEk4o2//6I9
         xZDg==
X-Forwarded-Encrypted: i=1; AJvYcCVNHLWFrc0JvPc9XGjzVufx+MGN6Z6fqBzK9TMpAVLIzHyaOPWfRQhHnMrBnC+AW5mbAJBzutK6KR49Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUgmx4lFz93ES/1Lf25yaJmKKf5tvcjHsU9XbuuPbI29z3h4tZ
	IhFXuJLBtmuh2OS6/u9VTGrxOeJpz9+9C8NC9uKWXGtBSqtLdyENipG2iRKiyr4L3nw=
X-Gm-Gg: AY/fxX7hL4a8EHfR7U0vFSEi41tOuifgMOQsHMmOCWDPx0YLUc0sgq3XDzLGHDGB8nC
	I/RQvuILPJ2GudM7ZEZCDwchqp41BAeinJSqzdSe+oSCALM7IXIjGxkuD3DyYZwdqhtx90tR1pW
	ZBQPjrx3lk9ByHh7Ez5NTMvV6EYveUMnaU7Qm0bKwQmV4AEVtWzvQ2k2EmdoJB+7ecDJPiFxarW
	TM4PkA94sahqN8U+IRwEb4CFQyRV2ZbrnPBrIjh/4JqMkTh2Uu5CJskCj+W6629SnX6dduIZ1pO
	+3G2U+a94xdvFVb8+X35CpVmZCFQqgzlvM1324lPtoWv1iOzV3f2qZC/KE0GXDAdyg2njEp/MT1
	AyVWQKC4OViSps/fPCXsr4EegW5JdGiiKXBl6WZdJ4OT1pE0kT+x9HnH3jDgBxbxmiDX0hhz9UB
	xJ4yVxZE8K0xzYjqc9AHJEvkG7zdz55K4w0mn+UqQK4bKvvJtjc8Kvo1OP2JPeC2Nnvu8=
X-Received: by 2002:a05:6102:2ac9:b0:5db:d07c:218f with SMTP id ada2fe7eead31-5f1a55dacc2mr3505780137.40.1768842212920;
        Mon, 19 Jan 2026 09:03:32 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6027c9sm90833946d6.13.2026.01.19.09.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:03:32 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vhsf5-00000005ITl-3vB3;
	Mon, 19 Jan 2026 13:03:31 -0400
Date: Mon, 19 Jan 2026 13:03:31 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] vfio: Add pinned interface to perform revoke
 semantics
Message-ID: <20260119170331.GJ961572@ziepe.ca>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-4-a03bb27c0875@nvidia.com>
 <bd37adf0-afd0-49c4-b608-7f9aa5994f7b@amd.com>
 <20260119130244.GN13201@unreal>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119130244.GN13201@unreal>

On Mon, Jan 19, 2026 at 03:02:44PM +0200, Leon Romanovsky wrote:

> We (VFIO and IOMMUFD) followed the same pattern used in  
> amdgpu_bo_move_notify(), which also does not wait.

You have to be really careful copying anything from the GPU drivers as
they have these waits hidden and batched in other parts of their
operations..

Jason

