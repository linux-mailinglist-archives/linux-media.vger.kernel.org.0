Return-Path: <linux-media+bounces-54966-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLQlDrDmrmlRKAIAu9opvQ
	(envelope-from <linux-media+bounces-54966-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:26:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C561523B9EB
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E760304A89B
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2574E3D9032;
	Mon,  9 Mar 2026 15:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="V7UGQ45N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD53D4137
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069540; cv=none; b=L7cBt8mvTThUevIc0k/VSojM/20OdTVXC4Woapul+fczSkT/jd6LyYCn3UTGyb9wbFOd5rILeHo/JN7qvLz6tsPbhO+KR0sypNMu6RkYyEqVYYBopJx1WvV/ASmTodBWr5pUgvJupy6f9keMgG7wIhcRTMqZcJ6JU6pECo2uMqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069540; c=relaxed/simple;
	bh=aW+gGf7B0n0oHC/qjuzmk77UUBB/ftL/cO6l96herO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSYpUQlrW0FgE7uLVsvn5ewFVBhqXbShIH7471KR+KK3CLva0yx5AA3Zxhv8ld1lXMWVJGbbjSncWClTkKVaAOCyLwM+/3/89L9BSgxKh8YUaTKjm9OJu7mnvLPq3BwBK7fv5pZa/IF61ZD39vIRt5YPNhNRmDExHKBNPMBZL1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=V7UGQ45N; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-899fc265126so109286726d6.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773069538; x=1773674338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oQoTcBcgSknYFDDhFBTqv/EpNp1AB8jH1zi0Ovpsfro=;
        b=V7UGQ45NHC7nkE7XjQwZYZ2b/zFYtemE44WTKxxCh/gh47CH4mpZTZ2QnFJxelZxbR
         O0KAYF0IFHuX8ALhpM+9RmmQHzrQoFTNgtRB/DVOhPGg9BxShiMjyxtv2tCk/al47Jo4
         uWLudo/1MWVPQII7OqCsds5znzMHepq8dAuPx9tgdgPDhaJk+fMGlwu3mRGT1Bg4UkBV
         sFFAyPQkUAYCFFRsfraE2X26A4KbTO0TRveOUYLm7V5eV13POKtzZgyCaGpASNLAN5/H
         MwTguAbS2/jfynpabW+YFSIRuUUhlYqZIUEdEunINqAY5E3eAMIpQxL9y31pkyBPAxDF
         qvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069538; x=1773674338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQoTcBcgSknYFDDhFBTqv/EpNp1AB8jH1zi0Ovpsfro=;
        b=n0eiS8lpDA9aq8JPPRYPeaVdnO4l4bczV8xpZPvMQgmm44asA9SvNy15i7Ne4ceLP0
         0dZ9X68AVziZYXfT0JsKfkF36tdFZ9K4iNWxolLYtaKx/bl7Sac+U5UFgambaCkoEsGd
         ONTK7FGnQ7nRi+DDSjZr5sHeJzAqkvDfPecg+V33VhePcgNL/A/t9sYg3FRtCFT6szfP
         wqoRE2FBR0jTnmHBYcQuPXjhjZTVxu5LVVCrY+b90B3bayADXzYkhjN27yiZvUk27J9x
         IU7mDwG792DIJDuVQNXa3e/O0gl+xD5cBXAfZFAo7KOMWucc5qVqQosc9DLMIkB9el2t
         0e6A==
X-Forwarded-Encrypted: i=1; AJvYcCU/3D1dTN74yygvOXOLl7KkGlN5ETjpqS5rZtjD8vL7Z2I1R+lWqw28r5dRLUdjqUcCTYJFliOQZshC4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOOVWdQzFHylOttHQK4ODe4RtCXRw8AUcUm7nTvi4+YTMCXHr2
	brRpUcSuhneRgGC4uQ3QqofKjuiDh6IYO//tkWghJWzkRWgd1JtCt2SrUXg/f5pXCtA=
X-Gm-Gg: ATEYQzzITYerpTf8fQwxlTRIwWwtwPqJTpVQ/hmjiBo/1ZPaHXms1fL2hSo7ks/Wyfl
	IHJHbMdflYpfXs5gj/EgOYr2wx17RPji6Qo/1sjMfKApg+W9JvsojVGKoCGSRRLuAuZjEuuUDxV
	SshfakNvyScY+ITxLYCjvgLwxynYCxTIIRG0gJWOyd3t7b8VCcNL0In8Ppmec3MCxHfTLFa8151
	0KEvUX70a0O0KDaNAsCHpIxPQ+0Cj/MQjQjJqCVcDm7txsBmJjw/muDCRwKLBrosCp3DOaPh5o8
	Ksk4mvc4SSZsSmlBkeDykXZ2TqakHUFW5Wlwm2hpdAURka4ZwDzWrAsXJRbH+ES4Hv8YDG/DwLu
	Rhd90fZ7xRz3NWDpuCt/rHlQZn679gKDze3l9n8RiB0P3EIgEKmhNAkcGPLPo3ZB7V4VVFZu5gb
	iyPUZhE8mk/dM51Ln2+upYxspmaso4DeaGVLJdm09y31RJLvQIyfvQw/MQv0z56fmLhdOxfCh/v
	Ww3NUyz
X-Received: by 2002:a05:6214:3019:b0:89a:502:6054 with SMTP id 6a1803df08f44-89a30a2b5c5mr162839796d6.8.1773069538417;
        Mon, 09 Mar 2026 08:18:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a316ec570sm80067436d6.39.2026.03.09.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:18:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vzcNl-0000000Giv6-151p;
	Mon, 09 Mar 2026 12:18:57 -0300
Date: Mon, 9 Mar 2026 12:18:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <20260309151857.GO1687929@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
 <20260309131530.GJ1687929@ziepe.ca>
 <20260309140233.GW12611@unreal>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309140233.GW12611@unreal>
X-Rspamd-Queue-Id: C561523B9EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54966-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.949];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ziepe.ca:dkim,ziepe.ca:mid]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 04:02:33PM +0200, Leon Romanovsky wrote:
> On Mon, Mar 09, 2026 at 10:15:30AM -0300, Jason Gunthorpe wrote:
> > On Sun, Mar 08, 2026 at 12:19:48PM +0200, Leon Romanovsky wrote:
> > 
> > > > +/*
> > > > + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
> > > > + * (shared) for confidential computing guests. The caller must have
> > > > + * called set_memory_decrypted(). A struct page is required.
> > > > + */
> > > > +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
> > > 
> > > While adding the new attribute is fine, I would expect additional checks in
> > > dma_map_phys() to ensure the attribute cannot be misused. For example,
> > > WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
> > > that we are taking the direct path only.
> > 
> > DECRYPYED and MMIO is something that needs to work, VFIO (inside a
> > TVM) should be using that combination.
> 
> So this sentence "A struct page is required" from the comment above is
> not accurate.

It would be clearer to say "Unless DMA_ATTR_MMIO is provided a struct
page is required"

We need to audit if that works properly, IIRC it does, but I don't
remember.. Jiri?

Jason

