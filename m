Return-Path: <linux-media+bounces-52524-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPs9Ca1Gi2kJTwAAu9opvQ
	(envelope-from <linux-media+bounces-52524-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 15:54:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BC811C248
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 15:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0107D301287E
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 14:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427AA3803D4;
	Tue, 10 Feb 2026 14:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="n031jfXH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF7D18FC80
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770735271; cv=none; b=hzLHPDJskVu7HofxM/GOCgdEzn1wv10HNiUW4wM19F1g51ZctcS5zujbemOrlG7lypwfb7+xuUV5f96JXkNEs1bT4hy6y41xI7hbgUiT3gnls/UQUQGh6VCmNFRfcVTGfUBdhjIM9MrXnae9ahfa+SvfFVijJmr6APzc+2n7gm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770735271; c=relaxed/simple;
	bh=0cPCA9Kv3jfRsyrFM9MyPi7hD3kaQlMf7gj3XZzuvQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvQ6zD9ZqZ7EMNm0GgDRhDLNpHsDudqZdh5CH8nmdtKuBN9mnTH4fqL0pDNPF0nfwqiAj40hPnKrKDSaiFQYR/mVuKuGiA24B66NaG984U8x7vLQwgzPvLejhSg1ykyHj4VPmJ2DA+HcfoPF+PsEhVMbjWypI+5283Ut7t/E8uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=n031jfXH; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c52f15c5b3so560866285a.3
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 06:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1770735269; x=1771340069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Agj0c4R15XGINXILYWi8Un1ej02BkfWDujptUtk/bVQ=;
        b=n031jfXHcwWuho1QKWiKDgozcqEOrJh2cZMzZ3wZQkBeC6vIt+Knj3mwGeQTIATqSr
         U47mWvrHblrylvWuNzdXriQOvcaYV+dpWsbf91kzhOCqt/Vlr4a6DW0nkFrdTqyraYHO
         Upy2Re74GM8COD4pa4251ZdJsWa/zgUbCIXlXY3gc5Ec1GE+MU16AIT1Tj40PmLbUd2W
         M+uUyUG7OqzCCVronYOzCZEJp/9kHF7ZERCq9rjstOLsX0bnnKdFFRYKP8BoFajerxvF
         jhDtQD9QyjVO8HA0ULXM/QDMbwTRyhdrAaJ3s+ervO9UGlWw5eFHWk3rSVviTfiXwt9a
         JxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770735269; x=1771340069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Agj0c4R15XGINXILYWi8Un1ej02BkfWDujptUtk/bVQ=;
        b=VlhktzFzGpURNv3+amYcSYmseJmW2TL7oQkFGXJ9+ubwq5fUFbK7x60WLgjXWN6USC
         yXjLQBDZ1r2cFyynXKLCgX1TpCX67phvGPYdb8pnwJWD7R33jxthIhOMAYGP1rr2DMsc
         afnfEFVAz3fq85o3cbDcQl1X4h9+Moy2X2R7ud81Uitk6foxbO/Zes0hoxfotfGNLSUn
         /sDO37WUTcF7ihyELZA2nvQDwYKz5uBom1z+tR8qSzUaJtgAOAq8pqi9L5bB1qSD8RBx
         fQrJs8BzaliJ+FOQu+drMpx5Iv9V4LfRzbhFtAb1DjxMqmxUeulFxxaHKwmu4RbkVXQu
         gsiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4S3mU/7GcIfX5DqOns28TIEB7c4HeJL5zzP7U5B76eLYaNJvgy8G86VIwvgHclO1Zbi6w1ugVrYciyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hobxgZgwom63gNg5blYVjpErRV5GNAIgRA0rY6SmDpTyELi1
	3/RI+Y1AyUTWczERYSwhRVIH3epXSz4RVPVphSU2MO5i96gWIZk1BSqmj0yeOrbLEPY=
X-Gm-Gg: AZuq6aJUO951gIKG51qzV6F2hJMeFssY8bNn8M2EFkDru8g5LHmXn2hH0AsLDqIgYjW
	dAJAs/tSvyfXqQ+PXg2GWDfYWG5EOcSpV1s5mfslmzT5ZjVoNcmGEEsP2ADvaTgkZ0/wYBw4/hC
	6708BIMmpUG1goXT3+P/jEHLI/G+YXsAMCLVRJVuG03Kx/Y/CAOspxQApoFEfIisyhsVVjsN9Ia
	2bzJmbLPl2oxvowTxmKd/8zqhetClo7m/OS3QHaT/yPiJhi6Sfirfdkh0iFkTRd5S+N3Mf5reqE
	8urje+OfjDzrKoZbqWcfmhljQwVLj1KKyFL/gVLRTB8zKkXUDwwlokN3toZjpQPmodT79FocZ3J
	TyQFHRsvmWfuUvvbQA1dkJcTMoICKFY16ZaRqkN/C4FYCEGBTKstYvHaVpX9gGCnCdgaWhggcDl
	c5y1PDyJt8FH1FapkO9uB959LHxCn+aLIqkSMrEdp5zSgh5y3kEHutKY0jAnL3/jXUEt+ZO2avo
	TgrC60=
X-Received: by 2002:a05:620a:2804:b0:8c5:2f89:6904 with SMTP id af79cd13be357-8caefeb4daemr2082380185a.45.1770735269414;
        Tue, 10 Feb 2026 06:54:29 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a157ddsm1121052485a.28.2026.02.10.06.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 06:54:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vpp8F-00000003mvN-47aU;
	Tue, 10 Feb 2026 10:54:27 -0400
Date: Tue, 10 Feb 2026 10:54:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap
 flags
Message-ID: <20260210145427.GA750753@ziepe.ca>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <20260210002927.GC943673@ziepe.ca>
 <tgvdjszwxggr53digbmddcbxvupzl4xcoprofkgrs2kgf6rknx@44ebljjpghjm>
 <20260210124357.GD943673@ziepe.ca>
 <y7gvezflidmma7odnut2rmlecsbxahrcwpmoevfnhzjveusuwj@6qxqogin45j3>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <y7gvezflidmma7odnut2rmlecsbxahrcwpmoevfnhzjveusuwj@6qxqogin45j3>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52524-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B2BC811C248
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 03:49:02PM +0100, Jiri Pirko wrote:
> Tue, Feb 10, 2026 at 01:43:57PM +0100, jgg@ziepe.ca wrote:
> >On Tue, Feb 10, 2026 at 10:14:08AM +0100, Jiri Pirko wrote:
> >
> >> >I'd advocate that the right design is for userspace to positively
> >> >signal via this flag that it wants/accepts shared memory and without
> >> >the flag shared memory should never be returned.
> >> 
> >> We can have the same behaviour with the separate heap, can't we?
> >> Userpace positively signals it wants/accepts the shared memory by
> >> choosing "system_cc_decrypted" heap name.
> >
> >So what do the other heap names do? Always private? Do you ever get
> >heaps that are unknowably private or shared (eg MMIO backed?)
> 
> If I understand the code correctly, you may get something like this:
> $ ls /dev/dma_heap/
> default_cma_region
> protected,secure-video
> protected,secure-video-record
> protected,trusted-ui
> system
> 
> The "protected*" ones are created by tee. I believe they handle
> memory that is inaccesible to CPU.

If that is the only list of options then maybe just the name will work
Ok.

I *think* CMA and system should be reliably CC private.

The protected ones seem to have their own internal definition, and
probably can't exist on CC VM systems..

Meaning we don't have any shared things leaking through which would be
the point.

Jason

