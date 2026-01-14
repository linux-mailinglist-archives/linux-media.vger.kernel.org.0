Return-Path: <linux-media+bounces-50707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F0D1FF18
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 16:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C44DA30119EA
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 15:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9443A0E85;
	Wed, 14 Jan 2026 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PeErgJ/t";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kd8juULJ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C5E3933FC
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405633; cv=none; b=LVQtRr69WNe34ZX7v4qsd3lS4EFZk/kqTf0B3AKPghLSMPxgmpjW8M9E7wfA2wQ06T5bpnpBWnfgy/3DrhiH8KmYfQgy72UDM5lCtNf+JNhTPHKz8pBfTwbniEnvlKAKBbafZW3zChgyuPLY+isYRCy2YjR7Rm5t6SVnO775sPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405633; c=relaxed/simple;
	bh=K1s+W2PBNWbWIAk+bTfzeJxxw5N1VfmQvbPX1yp29Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tn8rWOKhuiLdNH8FHynlhnrVJFeZA6nAeCw7EDWCwjvi86VZXIrvq3fLB+XUeNbVnY+IlIeCDKENiAFWi/oIYlxszYnS5EkOsiYP7qajp9auzCziz8nkl2T27ZjHN0jSr+TF72jCwaBpgN4xFS/AyXt6TW/+5sabNw5emQCdcaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PeErgJ/t; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kd8juULJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768405631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzUsW5No6dGH8ZciSrcNEaMmqaGyJ5Qr5Ou1SRqIt3k=;
	b=PeErgJ/tmV0XNSk70zoPZN7G7MFkKlkdRGHB6QgyWQ7WX6quAbctiiH6P5pVwjhrxU7OR0
	zGHmef8a9zi57wUL8tXCzVEFJg9GJxLcAGWZN2V6wV61cN1iZrHg3hjNfaP66nDe04Lwwm
	82v1KxsDalTkcOHfHWZo8//bat3waMg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-wLuxOZe1Pn6_r6iqeV00eg-1; Wed, 14 Jan 2026 10:47:10 -0500
X-MC-Unique: wLuxOZe1Pn6_r6iqeV00eg-1
X-Mimecast-MFC-AGG-ID: wLuxOZe1Pn6_r6iqeV00eg_1768405629
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a366fa140so286939706d6.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768405629; x=1769010429; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gzUsW5No6dGH8ZciSrcNEaMmqaGyJ5Qr5Ou1SRqIt3k=;
        b=kd8juULJsoISsEmc4AFDwTUqrFBOnRvbYuq30lWLOKyafUX/4Y36Pbw7k9p9lBV+0P
         y9YXZiSsnpR/qjCGFYfgsLW+n/70QTscnJ1Zce7wH5v6N2BR8OH4+QGf3U1GNt1ANL++
         cPl63GvIGPnD/V4IJgdYqMWcze2yLB0RqJVEj6IF3SFJXXby8XGJvYQNf/LqHp95dOlB
         BwYCoGOyvbJZz+aYKbBPG8Z3cPy07j0x1Mm9uA5HqixdUBNxGa/D1+mRQxnT3BeuwVDP
         ndGBU0IY5lFqL49GDh+2GbUsm/UhMbVCKkWYqgjK8kIAYgaCC/roSvJtmZs6M1EVHbxk
         as0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405629; x=1769010429;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzUsW5No6dGH8ZciSrcNEaMmqaGyJ5Qr5Ou1SRqIt3k=;
        b=BdDXAKeqNuSDUPgQ4D86sd86SteI48fdzaSPgSAcpj88qOpkVgY1/Spzl8fJw+4b4O
         dvoB6+n9tEJmggoRP+KZZQg5P5Vi7hEsyCMAy5ukZxhewnYSGZjoi6SipcYAj3dl3ouH
         lOX8k6EdgdZk1LXOyuq2tGK6rxA4pR68v6wsxwqDca4krgQtpjkIKj6fnRqqMvl+u8Ab
         5pGWMvS5/zKYEzE7G6FnN46ekYmlIg7E4Y731kxpacZB+juL9B3GgQdaDpPfrPmt6O/i
         bLxz7oeC8RvZ2URZCD97lQXtm2f5j48sprGfLXVCJ1lzPZ9o5IUTIdyE8DZB/eXtI8FT
         Eqlg==
X-Forwarded-Encrypted: i=1; AJvYcCXpp2rcuXDco9axKG+AUjkrpQVOs6AM7nMNMn2BXTjo5HHC5Kl6X4xUA9zJ6f1EhZfEYdn3Rp5Kv5JMQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPkbyYRMayU27nC2lV9ovco6uZIvpgbu3TF8la2lmubXOkCcVs
	V16BvMwpMN/lsMv1d+AK4jDoExTxgnN7z336D8ywDzBNtN+sS0Q5/AsCIiA2saGp3eUTo98C9Ti
	V3L1rsB2Brlc4jq98/sNIOBnCp5DAk1uqmktYEDpTKh4Atc213GcjCD7hQ9iyT6C7
X-Gm-Gg: AY/fxX4JVDjykPiSCg4ldpqWI8QSDAUkD4M28SKNXCUCJsFTRq6BRraBQn0NEp1D2bw
	B6IMOsTUE4u3/XjmFOglUp3FckV3YPfYSNKrj8kgq+pU5f28lLxFAkxN9/lNwQwELSLof9i9ISC
	mixlGK2ITO5P/FHv08DVw9rFTWnaIF+1NZNjUTWYmI8VDzJ3sLCwF8hmcmAJamjDO3o5JTJxkv+
	Is/BN2+fP2bMm29Qf9LdnR77zWt/veQCRVAmvfghrYyOmDVebgN83Q3Fng8d6P6YqzifnRxcAHd
	yILVNGP6tw4UXzSasMvHd7YJDzpA9fTU+F1NdHFwhvtQfXijQWuMB+C9eNtdDK/Vf1cEgsLiWKb
	U0lcv8yHOpfKpaS+Egg/9mP/yaFiA+hdVRVd+n13aAnBstj7RSTU=
X-Received: by 2002:a05:6214:1242:b0:889:7c5b:8134 with SMTP id 6a1803df08f44-89274367e44mr36520826d6.27.1768405629292;
        Wed, 14 Jan 2026 07:47:09 -0800 (PST)
X-Received: by 2002:a05:6214:1242:b0:889:7c5b:8134 with SMTP id 6a1803df08f44-89274367e44mr36520486d6.27.1768405628751;
        Wed, 14 Jan 2026 07:47:08 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net. [100.17.20.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772682besm179575456d6.50.2026.01.14.07.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:47:08 -0800 (PST)
Date: Wed, 14 Jan 2026 10:47:07 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Maxime Ripard <mripard@redhat.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dma-buf: system_heap: account for system heap
 allocation in memcg
Message-ID: <urjkdpeypk2uln6lkfi3fd54aqjlrirq23idl7wrnouuhox5rh@amxjnxrqs4lq>
References: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
 <20260113-dmabuf-heap-system-memcg-v2-2-e85722cc2f24@redhat.com>
 <7a0fcf24-09de-4f6e-8a0b-7b631b1315bb@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a0fcf24-09de-4f6e-8a0b-7b631b1315bb@amd.com>

On Wed, Jan 14, 2026 at 11:38:27AM +0100, Christian König wrote:
> On 1/13/26 22:32, Eric Chanudet wrote:
> > The system dma-buf heap lets userspace allocate buffers from the page
> > allocator. However, these allocations are not accounted for in memcg,
> > allowing processes to escape limits that may be configured.
> > 
> > Pass __GFP_ACCOUNT for system heap allocations, based on the
> > dma_heap.mem_accounting parameter, to use memcg and account for them.
> > 
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
> > ---
> >  drivers/dma-buf/heaps/system_heap.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> > index 4c782fe33fd497a74eb5065797259576f9b651b6..139b50df64ed4c4a6fdd69f25fe48324fbe2c481 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -52,6 +52,8 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
> >  static const unsigned int orders[] = {8, 4, 0};
> >  #define NUM_ORDERS ARRAY_SIZE(orders)
> >  
> > +extern bool mem_accounting;
> 
> Please define that in some header. Apart from that looks good technically.

Thank you for the review, I can move it to linux/dma-heap.h in a v3
since it's intended for other heaps as well.

> But after the discussion it sounds more and more like we don't want to account device driver allocated memory in memcg at all.

From the threads in v1 I thought adding the switch left open a
consideration to use memcg with driver allocated memory for userspace,
even with the known caveats that implies. Re-reading your last reply[1],
that's not quite the case it sounds like.

Best,

[1] https://lore.kernel.org/all/e38d87d3-a114-43f9-be93-03e9b9f40844@amd.com/

> 
> Regards,
> Christian.
> 
> 
> > +
> >  static int dup_sg_table(struct sg_table *from, struct sg_table *to)
> >  {
> >  	struct scatterlist *sg, *new_sg;
> > @@ -320,14 +322,17 @@ static struct page *alloc_largest_available(unsigned long size,
> >  {
> >  	struct page *page;
> >  	int i;
> > +	gfp_t flags;
> >  
> >  	for (i = 0; i < NUM_ORDERS; i++) {
> >  		if (size <  (PAGE_SIZE << orders[i]))
> >  			continue;
> >  		if (max_order < orders[i])
> >  			continue;
> > -
> > -		page = alloc_pages(order_flags[i], orders[i]);
> > +		flags = order_flags[i];
> > +		if (mem_accounting)
> > +			flags |= __GFP_ACCOUNT;
> > +		page = alloc_pages(flags, orders[i]);
> >  		if (!page)
> >  			continue;
> >  		return page;
> > 
> 

-- 
Eric Chanudet


