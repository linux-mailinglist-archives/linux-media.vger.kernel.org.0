Return-Path: <linux-media+bounces-49933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB34BCF4CCA
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 17:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 679F1309C00B
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 16:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4B51EB5F8;
	Mon,  5 Jan 2026 16:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="In8NJnSd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7013221F39
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 16:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630539; cv=none; b=Ul49opDgo0/ohClI0jVnjErTitTxk7oGjRgoGaFsu6rmDeLkFN03pXVhYLZMC/b+2szhnlY/W9YyLEoVjGp2rIUFjdaL8DRlV2MonCNdVleqz6OXXyfGPrK1E+5+99olgDIscHwVTK6PaO1fsi8K7V+mpzHSoAxDWWupMIPUBJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630539; c=relaxed/simple;
	bh=ixDS0uJHIEZpnXzIJwu1TmWmbAeFWar+6Z9bi8tRyyg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZeP0dekaXtPsmndT4gtHqnD9OzcyGTFxpzIxa+poKWSZfmyC6kUCaBArprmSQpFSjy7lIu1io72Zvyr2x/R2g5R14TnK6TtkHOQSHxgmiRB3ta33DElBSxCZIxtNxtB8cW2oZFu+2EtPHgR8ThNncxqi1yh3AjbN6A/fVyNBsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=In8NJnSd; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b25acdffbso28242e87.2
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 08:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767630536; x=1768235336; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MhLaZEGztBaqdfRcf1ZLhhb1lILxqOMU/Yvm4+Hg7yU=;
        b=In8NJnSdNF59UzPjl5rLuL7B8jmLFbJjLIb5/RTPk2xCiiAQR0YTueNoxQgcwFkaZg
         e45Fw+OkXFad+cnyFeSbywUT0a1b10dLE5/uSl8gCe8N6P+kcnnJLSBQjLFs+gaKhRl2
         4YM3y1IvXbL7vTB5kBsvN4YZv6J5EANu9V9fBIKnWUXWf0vqAXFeyPYyr5p7IuYmZL4E
         k+4+hUZ+BeJF8/22JG8rGEB52Kq7o6HM8eTNPyM3JkDyQYsIsenqvMAHIhY1BF0q54EZ
         +zZQ/jW5FvaEqzkNHGS3fB4ObwUH1ChKyN0aDeGYro9YiaCP8Neo6mLuRIW296qnpM/k
         BH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767630536; x=1768235336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MhLaZEGztBaqdfRcf1ZLhhb1lILxqOMU/Yvm4+Hg7yU=;
        b=JcTDHqECvviHAUV+kkgPJnJMYX+lZBhkH9p5UpFPCbRonzlxENWrgFy2sCXjFbhtXo
         W8Eij9eofJM1rVzZvyPfwH3laQ3cFIN16UzGuS/8x4Ks6lPleBwSF7REnADrWP2/B3Hi
         0KcQOwc10HF4Ytrk/47FaytWbkgpzBUx5QWQAWlmSZWDx/y63UaUtFVWOwwhqR1Ofqsx
         PnPdNMbmJsBN5wUXNcZWwISQ65VvopLTwFrDoZM0R/C5LbeiDE92s8bTmLzNlviHqaF5
         FeXiuVkVsHokfrV1lu7GuL5r4uJG+cN+Fg2ZN7TnOoXwV7YfOOcm41FE1sARTWTzje36
         3/PA==
X-Forwarded-Encrypted: i=1; AJvYcCW2OppCO6uNBCfWd+C0a6R0OKvO5BntaDfY9JlfnkggT43CXFNpMn/BWa76ev30faMGzc+XGvNbDyhk6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyPNboVQ6H8mPzt0oVs/9Q/5OECfIBc9/2fTu+6BrTv4782zrg
	xHJsfbNTe/Napr8IREx/FU+j1xpmAgdOWsKrt8pCOG4NtmefRoDh9DYr
X-Gm-Gg: AY/fxX4Tp/nbv+0VoVUAf3LGRS6atKNcGesQRFDXLDq+iGfsIBo6xSr3e1EN6JEitzu
	mC23YUxxpvzCuW/zuttGQZpoPpxi7sHRpwcfD1j086Z88UFUuoOrUg/9Ho1zXypHnc9rbBK+d1i
	C1Qb1y6jZANT+TXYpR9grMH0LwDhDHetmrDPCJppbwAkc9yBc6cdl7lKMAzdDsaP5+fcFWWpaqG
	SuVGKoo3xK0XEm6DDBftacRbh9H//6WADU/07ldo0+gpQrwnRVXJ5IbY7dPhuoANMlROkfp+ZBU
	tFeOl03inhzuGE7rDbfif+fs5IcXPnX0IFzJUaETeQGKylEap1WkHf+j8JkouSiE1QjemgK4uja
	svpq3SHaiXyFyZ9zJ+OB4I0+Hs89+9J1BpDZC9iTSlzMf2yi1PElV
X-Google-Smtp-Source: AGHT+IEoZ87k72XOK4WRfNoEGxBoiDEdhg+qxrjQywDuv03+TjElLhMwviVR8rOvTsQRpLgtTWykmg==
X-Received: by 2002:ac2:4f0a:0:b0:59a:113a:f517 with SMTP id 2adb3069b0e04-59b6527a2afmr98478e87.7.1767630535563;
        Mon, 05 Jan 2026 08:28:55 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b655143b5sm5936e87.85.2026.01.05.08.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 08:28:54 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 5 Jan 2026 17:28:52 +0100
To: Barry Song <21cnbao@gmail.com>
Cc: urezki@gmail.com, akpm@linux-foundation.org, david@kernel.org,
	dri-devel@lists.freedesktop.org, jstultz@google.com,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org, mripard@kernel.org,
	sumit.semwal@linaro.org, v-songbaohua@oppo.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
Message-ID: <aVvmxGUp2l0Tavwb@milan>
References: <aUlC6N1jmDbMDPc5@milan>
 <20251223212336.36249-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251223212336.36249-1-21cnbao@gmail.com>

On Wed, Dec 24, 2025 at 10:23:34AM +1300, Barry Song wrote:
> > >  /*
> > >   * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
> > >   * flush caches.
> > > @@ -658,20 +672,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> > >
> > >       WARN_ON(page_shift < PAGE_SHIFT);
> > >
> > > +     /*
> > > +      * For vmap(), users may allocate pages from high orders down to
> > > +      * order 0, while always using PAGE_SHIFT as the page_shift.
> > > +      * We first check whether the initial page is a compound page. If so,
> > > +      * there may be an opportunity to batch multiple pages together.
> > > +      */
> > >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > > -                     page_shift == PAGE_SHIFT)
> > > +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
> > >               return vmap_small_pages_range_noflush(addr, end, prot, pages);
> > Hm.. If first few pages are order-0 and the rest are compound
> > then we do nothing.
> 
> Now the dma-buf is allocated in descending order. If page0
> is not huge, page1 will not be either. However, I agree that
> we may extend support for this case.
> 
> >
> > >
> > > -     for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> > > +     for (i = 0; i < nr; ) {
> > > +             unsigned int shift = page_shift;
> > >               int err;
> > >
> > > -             err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> > > +             /*
> > > +              * For vmap() cases, page_shift is always PAGE_SHIFT, even
> > > +              * if the pages are physically contiguous, they may still
> > > +              * be mapped in a batch.
> > > +              */
> > > +             if (page_shift == PAGE_SHIFT)
> > > +                     shift += get_vmap_batch_order(pages, nr - i, i);
> > > +             err = vmap_range_noflush(addr, addr + (1UL << shift),
> > >                                       page_to_phys(pages[i]), prot,
> > > -                                     page_shift);
> > > +                                     shift);
> > >               if (err)
> > >                       return err;
> > >
> > > -             addr += 1UL << page_shift;
> > > +             addr += 1UL  << shift;
> > > +             i += 1U << shift;
> > >       }
> > >
> > >       return 0;
> > >
> > > Does this look clearer?
> > >
I think so, at least the place:

<snip>
[    2.959030] Oops: Oops: 0000 [#66] SMP NOPTI
[    2.960004] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.18.0+ #220 PREEMPT(none)
[    2.961781] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    2.963870] BUG: unable to handle page fault for address: ffffffff3fd68118
[    2.965383] #PF: supervisor read access in kernel mode
[    2.966532] #PF: error_code(0x0000) - not-present page
[    2.967682] BAD
<snip>

but it is broken for sure:

i += 1U << shift - "i" is an index in the page array.
For example if order-0 you jump 4096 indices ahead.

Should be: i += 1U << (shift - PAGE_SHIFT)

vmap_page_range() does flushing and it has instrumented KMSAN inside.
We should follow same semantic. Also it uses ioremap_max_page_shift as
maximum page shift policy.

--
Uladzislau Rezki

