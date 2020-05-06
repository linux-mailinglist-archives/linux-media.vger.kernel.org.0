Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94AAE1C6C4C
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 10:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728715AbgEFI7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 04:59:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:39594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728474AbgEFI7b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 04:59:31 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF198206B8;
        Wed,  6 May 2020 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588755570;
        bh=BZXsrGPAq0ynniSVougrqqFVO9Q9Qs8HW3VY67EvUxU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=0d2LMF3dWC0+omwbsoSjSumt5lIAZWiaKCxqTMeQDHkSF0iSN1gV6SZFWqFf7mVko
         w/ITUeNWxJJMjZ9R4lvXJjCMTewj+wJHZ3RyHtfNWQ5dfapxd9NQ7B4kZ10Whw+voB
         b2gEcrMi22UeGSzjelMxolxYk+XHP/IWEzSNmQoI=
Date:   Wed, 6 May 2020 10:59:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     "sean@mess.org" <sean@mess.org>,
        "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
        "allison@lohutok.net" <allison@lohutok.net>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "linux-kernel-mentees@lists.linuxfoundation.org" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC, WIP, v4 09/11] media: vidtv: implement a PES packetizer
Message-ID: <20200506105925.0bff8984@coco.lan>
In-Reply-To: <40C2F764-6E43-418B-8904-952C5E99D9D9@getmailspring.com>
References: <20200503101621.50047b5c@coco.lan>
        <40C2F764-6E43-418B-8904-952C5E99D9D9@getmailspring.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 6 May 2020 03:55:48 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> Hi Mauro,
> 
> 
> > As commented, don't use WARN_ON(). At most, you could use WARN_ON_ONCE(),
> > as otherwise, you may end by causing serious performance issues if
> > the code starts to produce a flood of warnings at the dmesg.
> > 
> > I would use pr_warn_ratelimit() on all such cases.
> >   
> 
> OK.
> 
> 
> 
> 
> > I don't like the idea of changing the "from" buffer endiannes, copy
> > and then restore it back to the original state. Is this really needed?
> > 
> > I would, instead, define:
> > 
> > 	struct pes_header {
> > 	...
> > 		__be32 bitfield;
> > 		__be16 length;
> > 	...
> > 	};
> > 
> > Then wherever you would touch them:
> > 
> > 	u32 bitfield;
> > 	u16 len;
> > 
> > 	/* Write into BE fields */
> > 	pes_header.bitfield = cpu_to_be32(bitfield);
> > 	pes_header.length = cpu_to_be16(len);
> > 
> > 	/* Read from BE fields */
> > 	bitfield = be32_to_cpu(pes_header.bitfield);
> > 	len = be16_to_cpu(pes_header.length);
> > 
> > 
> > As a side effect, when you use "__be16" and "__be32" types, gcc
> > and smatch/sparse will warn you if you mess with endiannes.
> > 
> > Same applies to similar code elsewhere.
> >   
> 
> I don't like it either, it is error prone. I did not know about this
> other possibility. Does this work for _bitfields_ though?

See my comment below.

> I think the authors for libdvbv5 used unions precisely so bswap() could
> be called on a 'bitfield' member and from then on the bitfields could be
> accessed directly, e.g.:
> 
> 	union {
> 		u16 bitfield; <-- call bswap() on this
> 		struct {
>                         --> then use these directly:  
> 			u8  syntax:1;
> 			u8  zero:1;
> 			u8  one:2;
> 			u16 section_length:12;
> 		} __packed;
> 	} __packed
> 
> At least that's what I understood.

You should double-check the structs from the specs. If I'm not mistaken,
bytes were swapped on some places. As I commented for patch 08/11,
the focus there were to make life simpler for userspace, and not to
store a precise copy of the byte order.

> 
> I found this: 
> https://lwn.net/Articles/741762/
> 
> Maybe *_get_bits, *_replace_bits is the equivalent that I should use for bitfields?

I never used them, but, based on their definition:

static __always_inline base type##_get_bits(__##type v, base field)	\
{									\
	return (from(v) & field)/field_multiplier(field);		\
}

Calling be16_get_bits should do the right cast to the type.

I don't know what the "from()" and "to()" macros would do.

I guess you will need to do some tests to see if this works as
expected.

> 
> Because I'd rather not do this:
> 
> > 	u32 bitfield;
> > 	/* Write into BE fields */
> > 	pes_header.bitfield = cpu_to_be32(bitfield);  
> 
> Since I'd have to write the (many!) bitwise operations myself and I'm
> sure I will mess this up at _some_ point.

If you mess up, gcc (and/or smatch) will complain. I mean,

if bitfield is declared as __be32, if you do:

	u32 bitfield;
	pes_header.bitfield = bitfield;

this will produce warnings.

Thanks,
Mauro
