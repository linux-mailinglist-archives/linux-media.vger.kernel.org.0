Return-Path: <linux-media+bounces-57946-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM5kFYZbzmmgnAYAu9opvQ
	(envelope-from <linux-media+bounces-57946-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:05:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A2A388C83
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE19D301E5CA
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 12:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4051D3DFC85;
	Thu,  2 Apr 2026 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="GLQriUnx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3510E3DE427
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131380; cv=none; b=eQbez1qXh/CeQ92dMtKU2VLHNW6iLpZwUWhPJIiwj+mlsv13i4ykkZFYudKmV3BLVMnIe97VuFDGrKltSieGByHYo1KvQRMgwpJk7T1sXylJ2a8NwoX1pWFAaprXy8Wk4Cm+FbFVykyXO1LxoV+81mdprxn68pquEV/wMtHOe+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131380; c=relaxed/simple;
	bh=+KtTbuhHgiuHy+YXQS2vChspL032vn/9QRxOV9xDd6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lV2fP1ErLBoya1Wkw+ZTMKt14a/s30GRS5tOXgFsMop5zzsKM68hEERHT2YvidhO3u5nQkC+5S/lB/POTdElFasrOFgGFB8a5wBu04osKz+3PGz7gxiQN3yIbipwlf5I6mfrmRpTQ3bVTJE2Rn3DpMSfRrhTXVNkuqQ+m0iaTNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=GLQriUnx; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50904a8f421so7928121cf.2
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 05:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1775131377; x=1775736177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KtTbuhHgiuHy+YXQS2vChspL032vn/9QRxOV9xDd6Q=;
        b=GLQriUnxLHUBEdg/X+64eqwIhg6Kg1sybsC2v7ggFb8wkDL2/CBj/KkWlRCuPZdFGX
         09rYWvjDW0QCicD1VzUen7VEUDkhGaN3QJd3EHls5vsOAabtUiUNZnLBKLW967YDtLVD
         jH2wHU605ybpDP2DQXRvjy8ZIvg5lial1Ex4XsBKEHKWBe5bjjL56dRN/C/KcQUF7Bq2
         ilr/UGAJvOqKPG34WSL7BIJdYy/DaU99B+PerCRkKQESjYrBncBJRELislVoSsSd207k
         MTlZb1JlYWfr9ZJImps8aZP9F8F2pueBLkMXALJ2f/zMCuA19EEV3qWFxu6L0jOWa7rt
         uFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131377; x=1775736177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KtTbuhHgiuHy+YXQS2vChspL032vn/9QRxOV9xDd6Q=;
        b=eJjgk9oVRsTfBrZ4F/IcEpMjbfadPAPkUcSdqNKccOWRj6u+NEGh6im+j3rRo+VPTl
         MX6WONbRHIUAMtEsJ2DfKKUGF6ZSPzqk8rDya9NpkUX7DxhclPSbgUtDTpd3Y6zvBSH7
         4vXhaoavlQySMPOfHue9NcBfYlHvwPISVrD+rldi00Gq8NiQcY8dW4yNfmncS0KNQZbK
         He4Ug4y60cfPHXVrWem2NvRkgCcW3M89dwqOER4CxaEew442xPVflpREFqOCWooKsKi9
         zycJ9vwMyldLy43YEDYwk8mbtP77qTfhXMC0lSA36sQe72KXjDuJKac9Oj5RgZ5vjgvi
         jk2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWo/p61g7cp6IfoffvnXlSdeWvtXoaZpKBKNLOaA9QjvobXxpaGBcEJHIxhO+A3Z4e0unqb0X/yVyeeoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/bj9duSrLRyORMqYe2R7GiIMM9t0LT/jxuaXvFhvguoXJlWJ7
	8MxMC3d20uqwdBIJKdRg+birJhpaJVEGbg5/qt7BnXxraC2a6pgrwOPcXsAIwNh66VQ=
X-Gm-Gg: ATEYQzxnX0q7zVH1fNv6mIVmPdZnHAO7xRnC8SwrtTYPBZ3VYX80z0SUtfQPrUFjdzJ
	2CQHD1WoZJwovIM0HLmSasRPXZmzOKmipplu7Va+vsm4ZAyrk8hGp9BJn7s07kVaEKoZ8hCwDMh
	55H4vwq2PSJ9HX9DcWffZimvvuqxayfvzXhByABJyqQ3hTeCyvERReZOybppDGNUtnaGW/lwVPm
	X6XRfnql0GCXbXLyRQHsQ3JmneVievKr7uxZICANWXTpTbVkVGLesfAwo5TAFpK8Kzj4Oy1Meyt
	cVquRSZdSuGq6bIYB5gWD3KVqg0txxFwrejwiwjhETOpeYViWNYBgSIXB2yqeR8qc4oK6+uPa+E
	hHWh/pdcwog3jcCTUHBSMJDz+H5ou0akQg36YmnCuZXp2qB6k9IILHVER/oFE6caJu2ZFg6gbxB
	q2fNrx1AweZgbTyyOqEcWRKzTBJKatvKxGxqyAko1ubjOcf7de1aRi+cebjXKUO4hIGkspCw==
X-Received: by 2002:a05:622a:a18b:b0:50b:538e:93b1 with SMTP id d75a77b69052e-50d3bb64108mr80844141cf.5.1775131376396;
        Thu, 02 Apr 2026 05:02:56 -0700 (PDT)
Received: from ziepe.ca (mctnnbsa70w-159-2-73-22.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.73.22])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b8da5cbsm20265321cf.31.2026.04.02.05.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:02:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w8GlC-0000000Bm0s-1xCy;
	Thu, 02 Apr 2026 09:02:54 -0300
Date: Thu, 2 Apr 2026 09:02:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Brian Starkey <brian.starkey@arm.com>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, jstultz@google.com,
	tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev, nd@arm.com
Subject: Re: [PATCH v5 0/2] dma-buf: heaps: system: add an option to allocate
 explicitly shared/decrypted memory
Message-ID: <20260402120254.GB2551565@ziepe.ca>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <4s75rtsmdfrze4rscbqzyrjyrko7n6sehe7agrngqag2cna5bz@eflmf4kwjocj>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4s75rtsmdfrze4rscbqzyrjyrko7n6sehe7agrngqag2cna5bz@eflmf4kwjocj>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	TAGGED_FROM(0.00)[bounces-57946-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 09A2A388C83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 10:52:34AM +0100, Brian Starkey wrote:
> I'm not clear why the heap depends on !CONFIG_HIGHMEM, but I also
> don't know anything about SEV/TDX.

It is because the CC apis, set_memory_decrypted()/etc are slightly
mis-designed. They take in a vaddr to represent the address instead of
a phys_addr_t or a page *

This means the user has to use page_address() and then the whole thing
is incompatible with highmem.

Which is fine, highmem and CC are never turned on together.

Jason

