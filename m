Return-Path: <linux-media+bounces-56897-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPVqNejLwmkBmQQAu9opvQ
	(envelope-from <linux-media+bounces-56897-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:37:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C87031A242
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 863C83034335
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4658840759E;
	Tue, 24 Mar 2026 17:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hScnfrxT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B8E3EFD3D
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373797; cv=pass; b=rI4iAWIl4SxDmWwue5au1OpV7fJ+1VXKGiyCg/K3iT1gv+QgFEWKjwSaDg1SCbIlmAF2rK7aYkk7ePfUWkF9y3S5dt8ycK/mSJgih31qifd4X8us9+J279Gio2WBIftC5018OTp90XQFNyVgneiW8N7XHqgxIbPEyxkohU+R0fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373797; c=relaxed/simple;
	bh=QKH3FIlHUJB8Q1byrwVmEses+K6AxcmCpK6mo9PTNmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Okj0d0uzW+ZRfjK0rcOcpuccAB5kcapJwqiKcfAxSjebTaRyiWUfKBwNc56X/KjZb7oL25MFMQzDtNf4SrB+YbbcxDMg99qldUPj24C/YcNtgBp22TkxQ3uQgaDWPb2W4+v51m5lcMyA76V4dnQ2BkwcOBbOZZX7qbPxWJxLkiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hScnfrxT; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-509062d829dso40071cf.1
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 10:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774373795; cv=none;
        d=google.com; s=arc-20240605;
        b=UGkxwvcddKq9u16a1LnEqG9HwPCkBHdWEBLwVkteu/TIWVgwziSuLvZH8wUAX8Z04x
         4ilX3fcpyfqgGIG/mdRDKhAnDBkFEPqCnE/wCCDLwwg/DiiqSJr3cpFpj7SYxyhbiBB1
         ABLm21ENdzAGXTTffwFks3HRioRW0xRZmqLfM86VovJ9H2FdYcFdOUe4+kbFPwvcVNTQ
         J/Sma+B2EZmX6d31IM1dTxyMHueOedxLrlSNtvxuRq71ucEsopXcy1hBgW4HmGuhY+o9
         rxyclwS2szliS+TxO03M0l2YuKj8GwAfxsqCeT0Hzl6sJMnuUFW9PLMd9bYOX4j9hbLd
         DnNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T7cRZZnHlvElmV5E4d+ARimoSvXKMR3JQuoEi7NRgdM=;
        fh=oPk4t9pHE//8AsevybvppsybTx7wv9UaNXtSSV+Q/jU=;
        b=KA6qzVDoOg3W/WdflyOEG2GeE0SHgXI43GWlBTH0vc0X4tmH2V1lhVSoInu5Euql0p
         jgHtZaxj8muxGkRU/ghKvTf1AktTLS3NUVg+4grTFyqSH9t+0Kf6PaJFz5BAcoFre3qu
         rP7lnDSHCjLMRnI74GgaYKCczJB4Mv2HO3lPtPW8rHxClG5ZiyfHNM6YnchCmY1gbbT3
         REvvmB9GvdNcjQXD9QTAwqvd8L9rhL9vQTCmOxsg2JaxwJ0bSnPVFoiJh1Md2NYO/ZJC
         178PkXg+l2siaDnXRZLo5rFsEferldmeCTYw4cAfs2VShlWR6CFTY9ItaaiCHpIjZerf
         xrOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774373795; x=1774978595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7cRZZnHlvElmV5E4d+ARimoSvXKMR3JQuoEi7NRgdM=;
        b=hScnfrxT/jb9z1gVu1B21oYuKEyoz09bvLfEgCOUhdcK0s5M8YY4Eg3hphA2+0StuF
         6wSwDAEKfNYS4U1AJZNL+SE22/Qws2nHtByfTNH9tZSVUe2VJwYsUP1hULWS+uKhHHXy
         HdCiW+hAbC2n02TaCte6kaY6u2vIyHMtRRoHVA9AriHb3dgANFWT8dO1kqz1pqh9Yreo
         EgSvUZlTVEnnxdsR/nyxC0vbVN0ACi6Fd8c01CrrmyTQN6vbTPQjYfLQCWR92SwQyJ6H
         nXoFnPCu+u9u1Y6Ejb/2l4YA5y0iLC4LQFhscPCKEBLfRalog8Urx6wtHVgonk926y81
         Ifjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774373795; x=1774978595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T7cRZZnHlvElmV5E4d+ARimoSvXKMR3JQuoEi7NRgdM=;
        b=DhPDtDtnwYzsssO1LGJSNBBEKyEA3bWux8wbXqP34OZXstXP9BdHl7ZZPnTnTqMwiz
         HaU10CgBFHMH9MZFkZl6ZenUNd4jO0evN9eKiokf1IvCOjonPFfaoRG7QU4vVNDtddew
         vOW5EGj0EvMdJGp7AkJTDN4YBzsCywIKnRZ2IQVc33ha6turufQQL+AqC3TQgF9JQlHQ
         q1tBV4yy4yA2vjb+ilRgevaXcpCJ3vzGGFjpvRKUE6HwUABUbcUexAovGYWBE/aowg5V
         aDxXhCXkTdu5ceFRCsHajqsD7NlpQD1c9RvdjiRU469FYSJJZJrYE7g+inXsRrnSLo7K
         0JiA==
X-Forwarded-Encrypted: i=1; AJvYcCXDJZB13aIZ0jk6JnSXlCoJXBBQLTCKhIZ8KTtBAeTtH4x11WueMR8G9hqzUGtrhdzma4fIcFPR6wR6zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeigcKOHeDX6g6KBswzk8xSXV08yn50v5tW/tLF07bu8qO041z
	ecf2usWH82C/gZYRIXIb2S5UkDDsVZJdpKkvDm4GH5tKN9RX39PwEVnCe3MCYW9Hd/wvAYxA7fX
	nU0F75Le4d9wzNe7tNTu8a6oiC2g2XIN6AU5C0dhz
X-Gm-Gg: ATEYQzwNDv90mMUNnJdhfBwZ/6H8RRdPW06vHdxqc18Id4O7tynFf6nAP7QnXMNm/V6
	WVN18Lh3HBdpVSEfiKtTm66z4s+q6k8JQa4e6NTRpdnGQMmU4DC1LRu6Z8qMipZqntZiMMeGVt8
	qUx/IOCWl8IM/E3dg3HIN7zFezYVJLHe6QgLljADKizK4GBlffLl99ncTHFcHtp3hJhddOhQO7Y
	n+1me/JtVUQh1NFbFCQw4A7yAAF4+5bkV+R5aimrvK2fNd4fD1Q//PyV8JFSvTilsOqreafR7yM
	6ESyEwEM8OVGDylFRKkYAqrFO01eSRFoZKv7gW4=
X-Received: by 2002:ac8:5a41:0:b0:508:fd42:fd05 with SMTP id
 d75a77b69052e-50b823fa2ddmr354431cf.15.1774373794536; Tue, 24 Mar 2026
 10:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305123641.164164-1-jiri@resnulli.us> <ablV_f_l7wD2m63E@google.com>
 <20260324120057.GC8437@ziepe.ca> <CAFgf54qoFhvVR2yfROGaTJmLcjuLACswVFv=trqgJwGb_DB3zA@mail.gmail.com>
 <20260324122416.GD8437@ziepe.ca>
In-Reply-To: <20260324122416.GD8437@ziepe.ca>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 24 Mar 2026 17:36:23 +0000
X-Gm-Features: AaiRm51PAsNGUjv3vtee5YHklYnd6tfPfqFJtrYrMATN4cWFgoB-kqA4e1zQENQ
Message-ID: <CAFgf54qwA2D1Xa4rnruJ4Nfp5BsB=T_pB3hzz9HBjh22TL17uA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev, 
	ptesarik@suse.com, catalin.marinas@arm.com, aneesh.kumar@kernel.org, 
	suzuki.poulose@arm.com, steven.price@arm.com, thomas.lendacky@amd.com, 
	john.allen@amd.com, ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56897-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[smostafa@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4C87031A242
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 12:24=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
>
> On Tue, Mar 24, 2026 at 12:14:36PM +0000, Mostafa Saleh wrote:
> > On Tue, Mar 24, 2026 at 12:01=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca>=
 wrote:
> > >
> > > On Tue, Mar 17, 2026 at 01:24:13PM +0000, Mostafa Saleh wrote:
> > >
> > > > On the other hand, for restricted-dma, the memory decryption is dee=
p
> > > > in the DMA direct memory allocation and the DMA API callers (for ex
> > > > virtio drivers) are clueless about it and can=E2=80=99t pass any at=
trs.
> > > > My proposal was specific to restricted-dma and won=E2=80=99t work f=
or your case.
> > >
> > > How is this any different from CC?
> > >
> > > If the device cannot dma to "encrypted" memory, whatever that means
> > > for you, then the DMA API:
> > >  - Makes dma alloc coherent return "decrypted" memory, and the built
> > >    in mapping of coherent memory knows about this
> > >  - Makes dma_map_xxx use SWIOTLB to bounce to decrypted memory
> > >
> > > There is no need for something like virtio drivers to be aware of
> > > any of this.
> > >
> > > On the other hand if the driver deliberately allocates decrypted
> > > memory without using DMA API alloc coherent then it knows it did it
> > > and can pass the flag to map it.
> > >
> >
> > The problem is that the DMA API currently gets confused by this; it
> > can end up double decrypting the memory or using the wrong functions
> > as mentioned in [1]
>
> I fully belive there are bugs, but the API design is sound. If you use
> the coherent allocations from the DMA API then it knows decryption has
> happened when it generates a dma_addr_t and there should be no issue.
>
> Now, if drivers are using the DMA API wrong, like trying to double map
> coherent allocations then they are broken. I also would not be
> surprised to find cases like this.
>

But it's not about drivers in that case, it's about many places
(SWIOTLB and DMA-direct) calling set_memory_decrypted() without clear
ownership so in some cases they step on each other's toes, and I don't
think that will get simpler with yet another caller in this series

I am fine with the API design you mentioned, but I believe that it
needs clear documentation specifying who is responsible for
decryption. The code should provide wrappers checking for these cases
instead of having is_swiotlb_for_alloc() and force_dma_unencrypted()
everywhere in DMA-direct.

Thanks,
Mostafa

> Jason

