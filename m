Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE03426A469
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 13:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgIOLvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 07:51:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:52570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbgIOLt2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 07:49:28 -0400
Received: from coco.lan (ip5f5ad5a5.dynamic.kabel-deutschland.de [95.90.213.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B683120732;
        Tue, 15 Sep 2020 11:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600170567;
        bh=iFfL19rgJxrWSGlMzNKS3xGMGw/adMkm9oDIVhpXLh8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Rc8KkBEBeA+6Gw3xlipEwz9GlAgOcjryIcCl4mOPcT34FIhJrlNBeVboZEX7OJhqY
         aE3T1DzkI5xTRlDh3iEk8J8zRffJZUXu7egy+JD+u1zlqdMBFftIz5Rm+D28csBTK+
         XsK3u07PDPvd90qt/rIHEojFSVVkYYMRif7vuSh0=
Date:   Tue, 15 Sep 2020 13:49:23 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH RFC 06/11] media: vidtv: get rid of some endiannes
 nonsense
Message-ID: <20200915134923.4794f704@coco.lan>
In-Reply-To: <68DDA2DD-4341-45A9-99CF-BF41573C9AED@getmailspring.com>
References: <47ccbcbd23e44159bbb11274b540d7c2bb66be7c.1600073975.git.mchehab+huawei@kernel.org>
        <68DDA2DD-4341-45A9-99CF-BF41573C9AED@getmailspring.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Em Mon, 14 Sep 2020 12:14:38 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> Hi Mauro,
> 
> > Genmask is always highest order to low order. It doesn't make
> > any sense to make it depends on endiannes.
> >   
> 
> I added these #ifdefs due to this:
> 
> https://lwn.net/Articles/741762/
> 
> i.e.
> 
> Fields to access are specified as GENMASK() values - an N-bit field
> starting at bit #M is encoded as GENMASK(M + N - 1, N).  Note that
> bit numbers refer to endianness of the object we are working with -
> e.g. GENMASK(11, 0) in __be16 refers to the second byte and the lower
> 4 bits of the first byte.  In __le16 it would refer to the first byte
> and the lower 4 bits of the second byte, etc.
> 
> I am not 100% sure, but maybe we actually need them? 

By looking at the changes you did with regards to bitfields,
it sounds that you didn't quite get how BE/LE works.

Basically, if the CPU needs to store a value (like 0x8001) on some 
place, it will store two values: 0x80 and 0x01. Depending on the
endiannes, either 0x80 or 0x01 will be stored first. See:

	https://en.wikipedia.org/wiki/Endianness

In any case, when you do something like:

	mask = GENMASK(11, 0);
	ret = be16_to_cpu(s->bitfield) & mask;

The be16_to_cpu() will ensure that the bits will be at the
position expected by the CPU endiannes. So, no need to check
for __BIG_ENDIAN or __LITTLE_ENDIAN when be*_to_cpu() macros 
are used.

Please also notice that, when there's just one byte to be
stored (e. g. 8 bits), the endiannes won't matter, as the bits 
will still be stored at the same way. that's why there's no
be8_to_cpu() or cpu_to_be8() macros.

Thanks,
Mauro
