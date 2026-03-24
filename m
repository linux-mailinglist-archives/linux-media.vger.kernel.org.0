Return-Path: <linux-media+bounces-56909-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM9PNkXkwmm/nAQAu9opvQ
	(envelope-from <linux-media+bounces-56909-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 20:21:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DC331B695
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 20:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EC0631D3D1D
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B7F3BED0E;
	Tue, 24 Mar 2026 19:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="cBA2hdo9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855563D3D1F
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 19:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774379509; cv=none; b=VPBje3f1IZ9uNBf29OP3LoNU+esTlJFardJ71WkXc8TR5cVw7jfq41CyZFy0ps+36SNA3hSPDX9Pa95w4Iu+0T7GL6EsGfW9OF6ODrCpwKx6wZU2iOm9U50+sWfHSeWy7XwZwaaEpC6tX0iP+BiXX/v40LxhPBAgE9M607657D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774379509; c=relaxed/simple;
	bh=DdHohqsrtbIkU1aFssJcCqXYWFKSTBkMjOlKSANv6rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BR3VpJkF24iulrzcUL87a94ja9qkWHebR9RnQeaduzSiZJhLdsGkUmViPsBR/9TmNax4aM/W8VSfwr74/xBZTbdhhzZClltBfw7d+vTrwHOsUKTTEVz7+A5PNgvsSEMkYwyr1D5Txb2QFu43IsCI4TbLf2qArdbNUgzoZ+j7Pmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=cBA2hdo9; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cd8a189f44so577487885a.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 12:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1774379505; x=1774984305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GgkzaFQD+hUjoaCAACM9eToN2Ozqi3oZGhlYET6dGi8=;
        b=cBA2hdo9Fvyw/OtOQid1fVSO2hdDh6923X2gKU4jWhsQRyLOVBHomkg57gQisyVhDn
         AMV9KSZlOe/JXYjdRgBwBoc1z1KQ3NEqGYn3suiE92qcTcBr/gY5Ei5vgEOX7KoAbAkH
         go/waGjBqxw1rCVPb2g22hxMw7MPUGvpj0A911EcW7uIZkppm03dlxWPls/ktZVA/anw
         eoseaitUoyQ1ii/uhgzEeIaerjffHrZue60l52G1ANw9uF/G7YP5sNwrPYv/WkncnQdD
         eu0v4oz2u0eev/KEfmwC4w5giQ/mvimtYDrPsIhX7KuPlpe+Rj4a400qhAgLO6SVuHOn
         jZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774379505; x=1774984305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgkzaFQD+hUjoaCAACM9eToN2Ozqi3oZGhlYET6dGi8=;
        b=EeK/WWd2Fim8toNCuC4WdSCzdG3Fqb8ZF3WBbL035MQtkhpElyHtdvldiC5PnS+MRf
         Daw/Iw3GEwlYq66SfnyP4Iq1FSSj5AE9yBLbg2v1pbJZmL9O9PBUHqkeF7/fPEtkY+GH
         ddoHjLQHxqR1fS3kr95WH/jTCKYq4FtCdpYYClcNw21f7nyT2aOqKm0HwnbYYleTShQv
         XRFyQOaQB7twcqylM8p/Mr/MIgA1j+UKvSk6HnLsFel4+ua+72KBwmsGKQOtmQOZlTKu
         qGqommjzWnvm/ggEhDPkk2Q0D0jPP9C4wM/2vtx1aaoyM/D6h5RlpnzCtzHnDpTxT3fv
         DwdA==
X-Forwarded-Encrypted: i=1; AJvYcCUXzRJErG0j9c9LaF8WICPjBWE13FbUsnKdaqZ4ImU2dKV+/y0aVo/32m5YokxA9vd8AbWTiD5gjDYj/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzubt+t1ElFjcaSFiHR/QlYepV54a0/WULaj/67Iq+ktV2E5dK
	wWyM53Df3ryJ6/4j6aJuQFv6NrhoHd7I7j8fT3/JihQ7AD2sKwtARwzHAo7aVOhEzIE=
X-Gm-Gg: ATEYQzxE699JZPDAlcrgp8Q302Dbgc5XE+Hk2udjQP8qcZKrxEgLDaXqbgsegftSXTf
	B5KSXUQMIURETw4K8gC7Ogr1DLLMYUq4FXJszDrsnkpaQCiRhEZxxhlxozvtflSwDyAWmQ+Odhq
	3GWbAqqcK68jhsKnflk+5S5Uu7QyvYapvOiVSA1cdjboXW7Fl/s3ZfY3TLIQ4R8Xyo2hp/qwGd0
	PQEiao5boimyo1J5+BWHbIqdD+2QGDwKbixECUnn42wRHtDjFDn/VjFFt2U0MuKVGH0UydCqLBx
	YFcV6y7atE9oX0D/05NoqNGxrP09jdE4c53CULoJsEcuWk0wGs11OXScTzUTc7GV3qp97HDe2WO
	qZBVgJEL5jSn9eq9ShOWZ9B1IvfBznOZynRJzXi6zBRcMKgeg2lGRZgfEUP9w3gVrB9PX2cGwI0
	4Y+jt/SY45hqoBBrhtlFHC7P1y1rW4pVLsIumE1AIl/EOyG5Pg4j0V4p/2VADEl4viIkYzOA==
X-Received: by 2002:a05:620a:17a7:b0:8cd:7fc0:ee1c with SMTP id af79cd13be357-8d0010038c4mr104803685a.22.1774379505164;
        Tue, 24 Mar 2026 12:11:45 -0700 (PDT)
Received: from ziepe.ca (mctnnbsa70w-159-2-73-22.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.73.22])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f91d32sm1083581885a.14.2026.03.24.12.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:11:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w57AF-00000000JZi-3000;
	Tue, 24 Mar 2026 16:11:43 -0300
Date: Tue, 24 Mar 2026 16:11:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, leon@kernel.org, sean.anderson@linux.dev,
	ptesarik@suse.com, catalin.marinas@arm.com, aneesh.kumar@kernel.org,
	suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v4 1/2] dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for
 pre-decrypted memory
Message-ID: <20260324191143.GF8437@ziepe.ca>
References: <20260316125857.617836-1-jiri@resnulli.us>
 <20260316125857.617836-2-jiri@resnulli.us>
 <15fcfa5e-c4b9-4b56-8f84-20dd5f66d643@arm.com>
 <lufy3ppgiy7637iravgzabajj67chmqvg22qc3fd2yqe2p33ws@b54vibhehth2>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lufy3ppgiy7637iravgzabajj67chmqvg22qc3fd2yqe2p33ws@b54vibhehth2>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56909-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:dkim,ziepe.ca:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 36DC331B695
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 09:26:21AM +0100, Jiri Pirko wrote:
> >...although, why *shouldn't* this be allowed with a vIOMMU? (Especially given
> >that a vIOMMU for untrusted devices can be emulated by the host VMM without
> >the CoCo hypervisor having to care at all - again, at least on Arm and other
> >architectures where IOMMUs are regular driver model devices)
> 
> Well, when iommu path is able to consume the attr, this restriction
> should be lifted. This is basically a sanity check for the
> dma_map_phys() caller.

Right we eventually need a matching IOMMU_DECRYPTED.

It needs to mirror how the CPUs work - any place that would use
pgprot_decrypted to create a PTE should use IOMMU_PROT_DECRYPTED to
create an iommu mapping.

The current hack in AMD assumes IOMMU_DECRYPTED behavior for
IOMMU_MMIO, but that isn't general enough..

There is some maze to get there but for the moment I think it is fine
to just not support vIOMMU, it isn't like any vIOMMU drivers even
exist for CC VMs right now.

Jason

