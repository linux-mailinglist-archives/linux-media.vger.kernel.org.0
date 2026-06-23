Return-Path: <linux-media+bounces-65488-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aFAzDZQOO2ohPggAu9opvQ
	(envelope-from <linux-media+bounces-65488-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 00:54:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F93B6BA838
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 00:54:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=inllvPRh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65488-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65488-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FA9C301CD27
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 22:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1599337B003;
	Tue, 23 Jun 2026 22:54:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156EA377000
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 22:53:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782255239; cv=none; b=HtW2eyK2B6LAwYbg32SIbNv72ShbsETcuDbALIfriaxI6XHrdNeroXkim/veZ9JadGHrE7AHHkZBw+GcKUg3gaeQPBIfFjxWTx631XbifLK2VSsZKObb8k2l+vkFYrDvtgJk12TQTf3lZWvR6QikSvtybqiK8gxg0up+bAqQKqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782255239; c=relaxed/simple;
	bh=l5xGEwOU5Sa74WwoX1gAb4cWW9N59zGi3t963nAFy/s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aRQ2dtimlLglrgrVJkk9yF2oEZjsY1DUKlb442iv8hQ8MuDDZ7FfDkZm6d+BhdHeksld6GaeJerlZSvTJD8VBufe4ZrX8/b2rZ9xyeNUrdaUHPpgt9P0XFlBcL6eAnZS1JZ/GlNwVRyMQB3FPOm3kL5MEhnoo3DZD3WMPDEmNL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inllvPRh; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49222b6e871so2387865e9.3
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 15:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782255236; x=1782860036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kl7+6G6mEg9f9+ckJBvnEW32MGFOl9Otf3/P0x9y5MY=;
        b=inllvPRhJqUn/IoxNENrnSTU2xOUduZ7qb97qZD5ie5oQhfvsbdtzHYDVxm0gYwgvb
         VYR0RgYB+bqEQVJhs8OFjRXVbnqzp3wO4dpEtYGtLwzAk0M8vqflLh1uvHYTm0f6eFUH
         +3mOugLCHu4x4Eh9S/kF8eaA2hNkRxvF6LpyYI8DHUCOyCMCKmZ2TifU4Ob+ovVKmbB+
         N19XNAl3xfclJ/DZjrNHLzIP/hAKEg955O3AfhvvvAlh5UrkC6FXkghdZFTMicrYFbMv
         wnyeNuC9tWxFiK0J2DGQL4H0+g0XmVQNBrMaEdVsfFbim8Fd1SJ5oRR0FIhqc+EP07Xh
         cOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782255236; x=1782860036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kl7+6G6mEg9f9+ckJBvnEW32MGFOl9Otf3/P0x9y5MY=;
        b=GGfJSVnTwhQGptMjpjBjX8NPERxQUdU3VpnGbvTiGbKq8EknBm007zxiVATfy6MllW
         oJSKva4py/gJjP2uWwJ/4WlD2XeJHne/EAMs9ILYsEaUjDMVKeBc19A64gkkwrL0wdJj
         AsCoADgVJWYq0mAPzPytmab+r1QgPwAmPym+4ALWoqHmXKNaoELb4cT4T3ZTIedpAutR
         rSVDiKP9JRJ7o7YRHdX0oqqMhs7me9MoWQSHEepC9F/OP7MgenY0hyckZwgUd01Eppz/
         ucW+nPt5zysoksVct1C7Gj2BDkButo4c5ELqUcU0a4zCVAI7pj3FOISyOdca/+A2ua+F
         tTMg==
X-Forwarded-Encrypted: i=1; AFNElJ9wrhCFo3857zP0Nel/SZ6LWQ/5e8NH+DZ+UNqR+1d6W6wDuizwapedQ8KXJ1fUgDhWLetb1KIHWWOuqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRjVR1rqcFwp7aegm6mmwYXd3wdk6CWWNPdyefQpnRTJXnkhIX
	jZemJwNrYIOv4L61mZoMJ950vCzeGaY6s4fPgep1JL1QreOTAZ1OkoXY
X-Gm-Gg: AfdE7clWUI54Y84p2rJ+KbjNrPR41sYjGB/hqkHtTJ1ESK+S2CmdhFfRifRtGmTitGK
	KXoaArUZ2VF2ihAg3U5dUuHZHCahkUJi9AFhWisCbvJHy0mJuVx341l1gAw1jy+oHVvWX2kvO9A
	FCWC0SQ1OdfZj/X79OtE8/RLRIj/H3Fz5LovGu7eHsuC43eoSf+fhRjp+D4mzZAjelPV9PN6hF9
	+wZ6S35EnnOURlC/ccvcNW8rmaWUXfCk5AsemtsdIQmJpyii544rIT8TcTKGx1Oz6n+ASguVPP3
	mPVuOx3MdU5ozUaH46952LgzqEZF7cRIYTPtwWIfdt2E5nVvQB6XQNX6QPoMcZRBEg2HlbkTgOl
	uxP6hkRwQ9NeSVufj2sH6ie0gBgFi8fz/MjfThEMpZAph8DnWh02kRxvwJGPjl4S/a1O29Ywl41
	CjIGxkW4jZwdyzHw46jD/5q/WmmqV7wOLUzjiLuLPKMwRTWWBC1w==
X-Received: by 2002:a05:600c:699b:b0:492:6113:d4fc with SMTP id 5b1f17b1804b1-4926113d5camr183865e9.17.1782255236221;
        Tue, 23 Jun 2026 15:53:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249207dabsm583674705e9.0.2026.06.23.15.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:53:54 -0700 (PDT)
Date: Tue, 23 Jun 2026 23:53:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: David Hu <xuehaohu@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal
 <ankita@nvidia.com>, Alex Williamson <alex@shazbot.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, jmoroni@google.com, kpberry@google.com,
 chriscli@google.com, sashiko-bot@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] dma-buf: Split sgl into page-aligned 2G chunks
Message-ID: <20260623235350.6540eaa2@pumpkin>
In-Reply-To: <ajryxMaT5evDUxaq@google.com>
References: <20260621222130.1667453-1-xuehaohu@google.com>
	<20260623015459.1153884-1-xuehaohu@google.com>
	<20260623094446.4a8fc2ed@pumpkin>
	<ajryxMaT5evDUxaq@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:praan@google.com,m:xuehaohu@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:kpberry@google.com,m:chriscli@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65488-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,widen.net:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,bootlin.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F93B6BA838

On Tue, 23 Jun 2026 20:55:32 +0000
Pranjal Shrivastava <praan@google.com> wrote:

> On Tue, Jun 23, 2026 at 09:44:46AM +0100, David Laight wrote:
> 
> Hi David,
> 
> > On Tue, 23 Jun 2026 01:54:59 +0000
> > David Hu <xuehaohu@google.com> wrote:
> >   
> > > Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
> > > This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
> > > first entry, resulting in non-page-aligned DMA addresses for all
> > > subsequent entries.  
> > 
> > There is a separate issue of whether this code is even needed at all.
> > Where can transfers over 2G (never mind 4G) actually come from.
> > 
> > The read, write and similar system calls limit transfers to INT_MAX
> > (even on 64bit) and a lot of driver code will need fixing it longer
> > lengths are allowed though.
> > io_uring better enforce the same limits.
> > So the transfers can come directly from userspace.
> > 
> > Not only that but you also need a single physically contiguous buffer.
> > Good luck allocating that!
> > 
> > Now maybe there are some peer-to-peer places where the large buffer
> > is device memory, but they will be unusual and probably need
> > special treatment anyway.
> >   
> 
> I agree that traditional VFS read/write face the MAX_RW_COUNT limit 
> (~2GB), and io_uring has its limits, but I'm a little confused by the
> push to enforce these limits here in the SGL code?
> 
> File I/O seems to be only one side of the picture. In my view, this fix
> is necessary and certainly has a use-case:
> 
> For example, the RDMA subsystem has the capability to import dmabufs [1],
> which gives rise to use cases for dmabuf beyond standard file ops 
> (via VFS/io_uring). 
> 
> In these scenarios, GPU HBM can be exported as dmabufs. With recent GPUs,
> HBM capacity can be in the order of hundreds of GBs [2]. RDMA can employ
> infrastructure like the vfio-dmabuf-exporter [3] or similar dmabuf 
> exporters to frequently move huge blocks of data via P2PDMA.

Ok, that explains where big buffers can come from.
I just wasn't sure.

> If we restrict incoming dmabuf transfers to fit within VFS-centric 
> limits (2GB), we impose unnecessary overhead on the RDMA stack, forcing
> it to manage a significantly higher number of memory registrations. By 
> cleanly splitting these massive contiguous device buffers into 
> page-aligned SGL entries, we directly improve the efficiency of P2P 
> transfers and memory registration.

But a divide by '4G - PAGE_SIZE' is also non-trivial and (I think affects
a lot of io) when the quotient is always 1.
Splitting into 2G chunks is a lot cheaper.

> Since this change doesn't seem to have a negative impact on standard file
> I/O or break existing VFS constraints, I'm curious why we shouldn't 
> support splitting these >4GB P2P transfers? Am I missing something?

I was only wondering whether it was needed...
It does bring up the question of why the >4GB transfers even need splitting.
But that is another question.

If you want to split large transfers into 4G-PAGE_SIZE blocks
it is probably worth having a quick test that returns 1 for 'small' buffers.

	David

> 
> Thanks,
> Praan
> 
> [1] https://elixir.bootlin.com/linux/v7.1.1/source/drivers/infiniband/core/umem_dmabuf.c#L174 
> [2] https://nvdam.widen.net/s/fdvdqvfvj2/hopper-h200-nvl-product-brief (Table 2-2)
> [3] https://elixir.bootlin.com/linux/v7.1.1/source/drivers/vfio/pci/vfio_pci_dmabuf.c#L297
> 


