Return-Path: <linux-media+bounces-57352-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPG3DgLexmkoPQUAu9opvQ
	(envelope-from <linux-media+bounces-57352-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:44:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AA334A550
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 403723035317
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8933876C8;
	Fri, 27 Mar 2026 19:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EW4a3e34"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D93C38CFF9
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 19:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640630; cv=pass; b=ar/ZTNiIo4A1I9/o9xKilsZijyJ3Sm4n3GBJ7Wa7bHHYa7EB3nwj8JMu2WAaJxOqDgDfPQ01zVSIPgQsgEeXReDejDmn2fuMvzEqznswinuXLvXxjihvow8iqUvondn72YiiBGqIms1X36AyLFMLgIvXvkSr1KAxMZtS6rDXP/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640630; c=relaxed/simple;
	bh=bp8Rzg51lEDwzJFZ6phUlxNkzebzC2DJpAPYxDIaxlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQezPEZMDIKUELm6w979P/3B0hgCPxq6q55GaZu69sTro20T2ReYhx8G+8ceuf1uIol4lQBQNp8cja1cYU/lNDGfSi1tKLcMhLQQcxMMxUoA7holLyhNd5Lu9pkfrwKNJAHNZbAFC55t45eVEcW4AEh3yue3rsacHkcYz6wAcuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EW4a3e34; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48569636800so17445e9.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 12:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774640621; cv=none;
        d=google.com; s=arc-20240605;
        b=eeB5drrMPPPAaCZ5w0NhqG2OWCaJ0exvl0WS0BG0WjoKVDLrNgRsLtC3X118Q/KZGf
         1PG80J3WHAzIuC7jEoQpRdqE1xHdtUiKFPMcIu+wbgaJj50Boz4GUkiMTovBhzBTOs3L
         nReQlUYgMNJ+cb9EJ1smX/95v74fLLqZsfwbM7w6UTiNyUYaBYr5mRcut8JqQxcjqDzo
         M4YtCPLPbtY+wQiXSWt5+hTEj17/VoXZOEzw47PNdYE5XZHLT3lgFYp6cAj88oBp6I/L
         EG9lF6Lw9pH0DyQE6F436l8w03cETHoIE7p7rxPNXGVpnhwqKjEMu6l4WBslhV5bvNtI
         zq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bp8Rzg51lEDwzJFZ6phUlxNkzebzC2DJpAPYxDIaxlM=;
        fh=TEGjzGrkUvdNBZLEFX/CAXBLH3Ln55uJNsNilPLVe1k=;
        b=EW0QhYRcEW0R7uG7z/zue5P4XVfseEeM5Ee/F8AcGSSV3Qv6jmzsjWc4X3t5cA+jG/
         A2wbZLnYQI66nwXn9JRw508qPFea/OE0PAEZl4zAYu5xZs+1mtWgRb0YIOKeGQOVWR/t
         8DoaPlwRevhq4XpY/RxDMivwSIm+/34vVNOSH0yrc2EWhLOcmFQ5N/rckCCdpktDj2VL
         UlSn/wh8C5WvVQ0TkSH7YH/moPFWFmLG1EXRxa/lR1tx2gksGPE/3OChTD6VHxdz97HX
         hBet7zmxGQQkPadO0fMLSYZBbb0W/jnKJD/x1xVXKVMijzYLqGUH0sE+c9ptcCBXG/7i
         kBNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774640621; x=1775245421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bp8Rzg51lEDwzJFZ6phUlxNkzebzC2DJpAPYxDIaxlM=;
        b=EW4a3e34qHveOgh35E/NMH8CouaVzG1XKCXLdcazqIfZYt8rA/GomA9b+VUzPriLEv
         BpfczJKrE4kddnaNCsOXVa00AilSREIFiB0F+a8bZBh9VVmk9eM6kJut9VMrXjeRGvUX
         mnM1gJVFl1SkWFnScVN7rvKxYOBvMgX5Qi4pWdMWtbZSRxuSxMyxp8yiFpWUMsRRaLT7
         W+8U/hXlS8nGqy1dM87jHrzuI2Vnm8WfDaTPQaigE0kGr4sILSuWCXWmlPVlCUmBFyCg
         0f0OKohMbCRnsO/ZMKOjlNU56tS+ReJHQIftZmoPsMnBKqKqK8eTbqbnMaGwUT/g1wAg
         CZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640621; x=1775245421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bp8Rzg51lEDwzJFZ6phUlxNkzebzC2DJpAPYxDIaxlM=;
        b=beFRMlpu/lI0nI9GpGNeswm1u/FlXlpMJPsh4kWrina+0Zt1hpR57GubnvbwrBQfG3
         WxrCHQ7FaYDDgyMscQWT2xJGB8gS34b6TKkXs0jVtXr06x2k1k0ak7NUlmQEYngtDUJ7
         lKEM26tLdLd5RS15Vbl+aHryscwX2WbOLYT5iUVsCMD9q93O4d7zk/4doyX8piQefL7z
         aYki16Yo+WlmXMgELlbpzEuy3nWLXlOswRjafvzzstz65PF5Fr9hwJFKbLrgd7GJmi1Y
         npyOlNqBe7Np31qXebhYwnojhmYr4ZnIb+hUyEZpHoQ8/36PzxiG0rJ3GMseEpd0J4OV
         yTrg==
X-Forwarded-Encrypted: i=1; AJvYcCVLkpp+NXHq74i/4WoxtT4+8ECYd8mzFCGBCgVkMufiiqUL7kH8vcKrXj2EahkmbzYQBOFlPqS44es3mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgaOPqrfmrQyibiT6CqP/NqssV6sQouwt1uRPsRnKXBtqIChif
	zIgA7DH9vNmRC29B1MwpApYtfnEuVSGzWy+p5pF8wvF06nscSOzaK5rPuDoMfnPX3RHdQEHYQ6q
	QnlaXyC63afPqJ0zcXzQKs0sL+ZmE11OlESaHDBtz
X-Gm-Gg: ATEYQzzB5pBeXod+DeG8vjG0WtMGUo8/5y/yII3yDrRaBPBViUH3kpdU0k9jfSJPK7O
	fhrTjOGhJHeWPmsRxm1qWkKP0lfdEf0ggI5gPrSwdgjbCuSmYYIb/MBXMn+UtRAIXsouQ8JBb/V
	lxaf//K6cS5eKJ/DQ+30w4eP3foAaEKkyy9sUTzuaG48z06NnUoFDZvhn/m5DcWYcOQZmi3dXae
	3k1W38IVaIlfDsZYZsXxist7+dcjhjahobq7kUPAYE4AXPRZZ0l+X3aEblt9vwFfH9kzK7p/H+3
	kHOgoJQUXyZqkJdr33uYV1zsrscU9dg3ILToHhhTCXguoBzH6ilchEk0KXpi7V7N/Gfq
X-Received: by 2002:a05:600c:474a:b0:47e:de1d:ce99 with SMTP id
 5b1f17b1804b1-4872fb2db92mr169905e9.12.1774640620548; Fri, 27 Mar 2026
 12:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260325192400eucas1p2ae38ff4c2b3ab35a7047cfd680d9fda3@eucas1p2.samsung.com>
 <20260325192352.437608-1-jiri@resnulli.us> <f2047cd7-91a8-4f6a-b6b9-0e4f143f6854@samsung.com>
 <20260327121021.GB246076@ziepe.ca>
In-Reply-To: <20260327121021.GB246076@ziepe.ca>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 27 Mar 2026 12:43:28 -0700
X-Gm-Features: AQROBzCEcKgPP9gV3lvkFItmqoWSRLzeH8nf-BLcIkZAnZ3bjMQA_OWXnQtSUH4
Message-ID: <CABdmKX0HYg_HQAb44QGcO-frCTu+0h=uqS70CTcYtRs-Y=y21g@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] dma-buf: heaps: system: add an option to allocate
 explicitly shared/decrypted memory
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Jiri Pirko <jiri@resnulli.us>, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	christian.koenig@amd.com, robin.murphy@arm.com, leon@kernel.org, 
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com, 
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57352-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,nvidia.com:email,ziepe.ca:email]
X-Rspamd-Queue-Id: 06AA334A550
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 5:10=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Mar 27, 2026 at 10:38:10AM +0100, Marek Szyprowski wrote:
> > On 25.03.2026 20:23, Jiri Pirko wrote:
> > > From: Jiri Pirko <jiri@nvidia.com>
> > >
> > > Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel T=
DX,
> > > run with private/encrypted memory which creates a challenge
> > > for devices that do not support DMA to it (no TDISP support).
> > >
> > > For kernel-only DMA operations, swiotlb bounce buffering provides a
> > > transparent solution by copying data through shared memory.
> > > However, the only way to get this memory into userspace is via the DM=
A
> > > API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
> > > the use of the memory to a single DMA device, and is incompatible wit=
h
> > > pin_user_pages().
> > >
> > > These limitations are particularly problematic for the RDMA subsystem
> > > which makes heavy use of pin_user_pages() and expects flexible memory
> > > usage between many different DMA devices.
> > >
> > > This patch series enables userspace to explicitly request shared
> > > (decrypted) memory allocations from new dma-buf system_cc_shared heap=
.
> > > Userspace can mmap this memory and pass the dma-buf fd to other
> > > existing importers such as RDMA or DRM devices to access the
> > > memory. The DMA API is improved to allow the dma heap exporter to DMA
> > > map the shared memory to each importing device.
> > >
> > > Based on dma-mapping-for-next e7442a68cd1ee797b585f045d348781e9c0dde0=
d
> >
> > I would like to merge this to dma-mapping-next, but I feel a bit
> > uncomfortable with my lack of knowledge about CoCo and friends. Could
> > those who know a bit more about it provide some Reviewed-by tags?
>
> I'm confident in the CC stuff, I was hoping to see someone from dmabuf
> heap land ack that the uAPI design is OK.. TJ?
>
> Jason

Hi, yes LGTM. From a uAPI perspective it's just another dma-buf heap.

