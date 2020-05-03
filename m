Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7431C2A75
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 09:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgECHGn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 03:06:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:44038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726937AbgECHGn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 03:06:43 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CDB2B2078E;
        Sun,  3 May 2020 07:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588489602;
        bh=/TuUmS/lUQz6LYPGZt4r8qNTCPIMydP+HbiwVJRqEwU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=V3K20RJQBclm2rGRYlqbbl+oI4pMRqrnprtrA6Lzsk+zeg3Pblf/zwoJy9LzLvjDV
         avaSDWTPt5ML4bIeWqyvWUtPBy65X7VAsnE4lPcPGZgVoCmfurzS18xa5bK9QNBcl2
         Ozix+BJU6JXbN1s9GV4CAvw9Y1wcaIoL5W0AS6To=
Date:   Sun, 3 May 2020 09:06:34 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     sean@mess.org, kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC, WIP, v4 06/11] media: vidtv: add wrappers for memcpy and
 memset
Message-ID: <20200503090634.1b7ae548@coco.lan>
In-Reply-To: <20200502084038.07c38c4b@coco.lan>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
        <20200502032216.197977-7-dwlsalmeida@gmail.com>
        <20200502084038.07c38c4b@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 2 May 2020 08:40:38 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Sat,  2 May 2020 00:22:11 -0300
> "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:
> 

> > +u32 vidtv_memcpy(void *to,
> > +		 const void *from,
> > +		 size_t len,
> > +		 u32 offset,
> > +		 u32 buf_sz)
> > +{
> > +	if (buf_sz && offset + len > buf_sz) {
> > +		pr_err("%s: overflow detected, skipping. Try increasing the buffer size",
> > +		       __func__);
> > +		return 0;  
> 
> shouldn't it return an error?
> 
> > +	}
> > +
> > +	memcpy(to, from, len);
> > +	return len;
> > +}

When trying to use your memset wrapper, I noticed a few issues there.

The first one is that you should not use __func__ directly at pr_* macros.

Instead, just ensure that you have a pr_fmt() macro that ill be adding
the driver's name and the function, e. g.:

	#define pr_fmt(fmt) KBUILD_MODNAME ":%s: " fmt, __func__

Besides that, the parameter order sounded weird:

> > +u32 vidtv_memcpy(void *to,
> > +		 const void *from,
> > +		 size_t len,
> > +		 u32 offset,
> > +		 u32 buf_sz)

The "to", "offset" and "buf_sz" arguments refer to the "to" buffer,
while "from" and "len" refers to what will be copied from the "from"
into the "to" buffer. Please re-order it, placing first the "to"
args, then "from" arg, and finally the argument that applies to both,
e. g.: 

	size_t vidtv_memcpy(void *to, size_t to_offset, size_t to_size,
			    const void *from, size_t len)

(you should notice that I'm using size_t for all args there).

The same is also valid for the memset.

Finally, the places where this function is used require to pass twice
the offset (from patch 08/11):

> +		nbytes += vidtv_memcpy(args.dest_buf +
> +				       args.dest_offset +
> +				       nbytes,
> +				       &ts_header,
> +				       sizeof(ts_header),
> +				       args.dest_offset + nbytes,
> +				       args.dest_buf_sz);

That doesn't make much sense. I mean, if the arguments are "buf + offset",
one would expect that the "buf" would be the head of a buffer, and the
function would be adding the offset internally.

So, the best would be to re-define it like:

	/**
	 * vidtv_memcpy() - wrapper routine to be used by MPEG-TS
	 *		    generator, in order to avoid going past the
	 *		    output buffer.
	 * @to:	Starting element to where a MPEG-TS packet will
	 *		be copied.
	 * @to_offset:	Starting position of the @to buffer to be filled.
	 * @to_size:	Size of the @to buffer.
	 * @from:	Starting element of the buffer to be copied.
	 * @ten:	Number of elements to be copy from @from buffer
	 *		into @to+ @to_offset buffer.
	 *
	 * Note:
	 *	Real digital TV demod drivers should not have memcpy
	 *	wrappers. We use it here just because emulating a MPEG-TS
	 *	generation at kernelspace require some extra care.
	 *
	 * Return:
	 *	Returns the number of bytes 
	 */
	size_t vidtv_memcpy(void *to, size_t to_offset, size_t to_size,
			    const void *from, size_t len)
	{
		if unlikely(to_offset + len > to_size) {
			pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size\n");
			return 0;
		}
		memcpy(to + to_offset, from, len);
		return len;
	}

Thanks,
Mauro
