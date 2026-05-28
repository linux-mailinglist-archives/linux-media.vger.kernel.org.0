Return-Path: <linux-media+bounces-62964-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PHPIb9YGGoQjQgAu9opvQ
	(envelope-from <linux-media+bounces-62964-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 17:01:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 204DB5F4128
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 17:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4A363057895
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 14:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD864B8DED;
	Thu, 28 May 2026 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DKXluEVU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A6E3F8EB2
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980054; cv=pass; b=u75PjEDhGnCt5oK6AQgy0MgUuoxpPCEy/Pz3K6FG6c1CwsxaNtqPQgK74uHmAvO4LU74nf8M1XZeG56Evb2kv5+tgCMl0OYN+acho2Yj4mbNks42TfvAQ1fUMK4TcghVrm0YQs92+CZ8mxPZxuzrdtw6UHVv5IMTe7BbD7+6dLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980054; c=relaxed/simple;
	bh=BnmP4dPy4FDVByFtz0lAGPhCBqLsWkN0Jv1LQoJfels=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/3+v2JMin8SG5rAbzVItyfYfa0JuUOSEgjKM+3V/SkuJ2rwkrXHxPn2/ImcPB/Osq1tQ2CfBvkZbILdu4myhPtEC+Pd2rv4d4BcrWYY7OtijdmUL4luMgKp+wjbRJZsLzCJXaN1PfbelkLOR4Sr6zYTtzebTlEvM4/u+ampJZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DKXluEVU; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bdd1986cc86so1022331166b.2
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 07:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779980048; cv=none;
        d=google.com; s=arc-20240605;
        b=P7MSc87TW40QXNljjlv+Tvy6sfKQtlCYS5s8yGbNscF8L6GXLm6+Oq+mnwifhIkO4t
         T/Xv2Ie844YOQ2vz5Lj47MdhI2hcWm7HoDDgHNRgiO86DAjfVbB6gs9r3vyKWsFW/ojU
         kLEwOoVUfFEOq1iZvmS/oMzG02bkd/uBx27/3rpRmC3o+EFOjxv+YxOIUN8td7c98ay8
         QIF74qnw99a1WjiAl2zrQ7pnzDTGccO6zjax2RJM/oiA7MfiATrqJ2ZQ++YXHzoFhex8
         JcPW/UfK5yaMPeznhLIOXHLTHqeptXX5FRyLC6Qbrowv1vPcGc8E0M8wLw4/sADXMENN
         qzAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9OXz/l5MhiOrtGyFdSgSY2UmTjKKZnnagh0u7LsCdfw=;
        fh=b4+JO0Pgh0DUAtdUgMl2P9mktkgI0j5coW/Lm7FYOsc=;
        b=ALvdoFAD73XmVom3N0OUHzo9valA0DL86YswoltoOirp8sue+4DAZ1TvPOmbWUxoT8
         bnSlWcuQHqWgfQDZ4v5MIz0ZZSU545L2M8Z5AFR2EDwMlm9IHs5yZlcRf0J1D9W7KOFe
         g3QiCBBaCrWGgJFL32PwEWxEQljNkLAF8prx81K2p2+xPLUnEem3M4j2865bglIc8gfY
         jdW41xmSEMv1+Gc9XHJRlDjxcoNnW/3mz/9L+DsrGQ7oZv3tNVAEwmmEK7LO3TqhWtJ6
         0iZ9a/yDthqVmWiZMEUOaS0JhRB5X0Jd00gl2MdqeW+ma3I2ZUy4ZIZRCnR/bcyJpv8o
         nObw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779980048; x=1780584848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OXz/l5MhiOrtGyFdSgSY2UmTjKKZnnagh0u7LsCdfw=;
        b=DKXluEVU2BkFOC8xGrZ55LgCv54YARMWCPmGaXEHvx6/VqPxH15uNPr+ePOcntXtiO
         /OwXIyqM517513rCSgRFYhdHTnuWopY14uqJLHePM2AOVLRLHsOSKHF4XYmEcGIWnVmP
         I0fe7iDXJRInKlhTHAG3iYUO/xTl5UWZwlWaKQzm0MvnDdR/ojpVhm8GHL4aIARG3Oho
         FnKuqlMdlRQZHqeuz98Dj6Pzv838ZDvFMiciO83e2XhwIIe92bgPEbV1G+upfY8VrNdc
         ngeonglUM1S1f8FpsGztnJo7Di8NLFODVvDc/wYQPz7gMuzQg6FRZJZwkjgtX75yE699
         RAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980048; x=1780584848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9OXz/l5MhiOrtGyFdSgSY2UmTjKKZnnagh0u7LsCdfw=;
        b=TOoRgw+E5J2FN7o32TvMQ5HnXbf3wfuAaAPzjtjlko9M4goAtjjBjyk5vlaYGJ2xRq
         NVZwaLIZa3Gm2jsrUPuOGMwdc0tweTDqQDcaxNPvIXacHaAVNzpsYbrZb/T2pkyPKg3i
         DkaH4t06ukC0sxPfqBVX4lXhO3GhwAH0SL2J5977/VckE9U24gvL4e/CrPQBXjSxbKTm
         THPJb313UgFif3XFhe5gQPRAgJe7w/I/VmIxylGvvUzWvCp7gTyMlABTWZP71pqWFyo6
         RTl33IUEguw6cHBkPh6kXcReIpWg4aAJ+Tqz9VwrbFg5MW5ciQKMsb/RyXjW0QKJqcos
         hdgw==
X-Forwarded-Encrypted: i=1; AFNElJ+JjHPXNp4TYd55kP/1FyBAOvIFNGQYH8pK/5ItWdaZn8Spu6YTpjnkJiNV4ImBPl2Yp7/aV9R0fmLADQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgJJRap0sm4KdKwgply5K0DLEH/EOXVRH1bywYvr7P8ZoP17gu
	4++NwYZNC3OVaf4/oclBaNr0/+77XGdscXN/0F9WDCx8ogte3hrbbZeYE8Txk4POS+y5HYWjvY7
	5F1pixVZvqS1VDkx7PlexnuLrpouzpO5ZwwY4FPbjQg==
X-Gm-Gg: Acq92OGT/m2+5dtWv5IVRK9rzBMmZlKFAXDLB7dQvyw0mgNUcgel1ngC/kNyi+wRKCU
	mRZ77zTc0qYL2sWLNIaRh3tMa4p7z7foSzoIC10E4KauDOGMBnogH3kCLj85S5IO52Gv9vvqC0j
	Yg2rI8Waj6ifx/oT1lT9F4PyxG5aIRXS4GNWU1MJTdhMASVBSvnf7UxKjACCFKS03mXVkHfZXBf
	pKUko77Pu0WRiIc9y4K0sygb7mtdc5lDB3IGj4mpJNbiILP1f8GuELXJnSVvU8ppSxWSlSErJ3H
	LNIVn89/bbnT9TfRMCHHjl5Vwt/ePcrmh8pF89SLCTfjMrln
X-Received: by 2002:a17:907:75d9:b0:bbe:37ee:8a2b with SMTP id
 a640c23a62f3a-bdd279ce23fmr1206290366b.33.1779980047494; Thu, 28 May 2026
 07:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523181446.69525-1-devnexen@gmail.com> <ae16f5c2-c6d9-4274-9a27-f87bfe931b1f@amd.com>
In-Reply-To: <ae16f5c2-c6d9-4274-9a27-f87bfe931b1f@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 28 May 2026 20:23:52 +0530
X-Gm-Features: AVHnY4LutoQ-7Ka86XumSZSoxXa9nFy3SHyGiarPBSsSmWM-nR_geKS3HNuAjkA
Message-ID: <CAO_48GFOZESPnm5iLa0D+4itq7hjc9EyRUjMY4QwN5EsLn97SQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix UAF in dma_buf_fd() tracepoint
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Carlier <devnexen@gmail.com>, gaoxiang17@xiaomi.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+7f4987d0afb97dd090cb@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62964-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RSPAMD_URIBL_FAIL(0.00)[appspotmail.com:query timed out];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,syzkaller.appspotmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[christian.koenig.amd.com:query timed out,stable.vger.kernel.org:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,7f4987d0afb97dd090cb];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,appspotmail.com:email,linaro.org:dkim,syzkaller.appspot.com:url,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 204DB5F4128
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David,

On Tue, 26 May 2026 at 00:25, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 5/23/26 20:14, David Carlier wrote:
> > Once FD_ADD() returns, the fd is live in the file descriptor table
> > and a thread sharing that table can close() it before DMA_BUF_TRACE()
> > runs. The close drops the last reference, __fput() frees the dma_buf,
> > and the tracepoint then dereferences dmabuf to take dmabuf->name_lock
> > -- slab-use-after-free.
> >
> > Split FD_ADD() back into get_unused_fd_flags() + fd_install() and
> > emit the tracepoint between them. While the fdtable slot is reserved
> > with a NULL file pointer, a racing close() returns -EBADF without
> > entering __fput(), so the dma_buf stays alive across the trace. Same
> > approach as commit 2d76319c4cbb ("dma-buf: fix UAF in dma_buf_put()
> > tracepoint").
> >
> > This undoes the FD_ADD() conversion done in commit 34dfce523c90
> > ("dma: convert dma_buf_fd() to FD_ADD()"); FD_ADD() has no place to
> > hook the tracepoint safely.
> >
> > Reported-by: syzbot+7f4987d0afb97dd090cb@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D7f4987d0afb97dd090cb
> > Fixes: 281a22631423 ("dma-buf: add some tracepoints to debug.")
> > Cc: stable@vger.kernel.org # 7.0.x
> > Signed-off-by: David Carlier <devnexen@gmail.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thanks very much for the patch; applied to drm-misc-fixes.
>
> > ---
> >  drivers/dma-buf/dma-buf.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 71f37544a5c6..d504c636dc29 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -792,9 +792,13 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
> >         if (!dmabuf || !dmabuf->file)
> >                 return -EINVAL;
> >
> > -       fd =3D FD_ADD(flags, dmabuf->file);
> > +       fd =3D get_unused_fd_flags(flags);
> > +       if (fd < 0)
> > +               return fd;
> > +
> >         DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
> >
> > +       fd_install(fd, dmabuf->file);
> >         return fd;
> >  }
> >  EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
> > --
> > 2.53.0
> >
>

Best,
Sumit.

