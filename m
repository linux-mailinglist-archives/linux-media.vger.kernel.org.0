Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89A8C9ACFE
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 12:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390026AbfHWKUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 06:20:13 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:32880 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389165AbfHWKUM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 06:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=urZOyMTijUB26f0is3C9mcTCw63Nh/JDAZh1/VkDIlA=; b=TZomOmmqMs5K5UMH6GbPDpnEZ
        B/cDqpkbI7zfzAao4hkSgjKTsfp/3MwyGKNs34m+WRzc3jtDJCDqc5tjIsywk8U5XEapPPbuM9b3u
        fEwuRzhWxy8HfozCEbSKL+zXuieFEwuc52s5JFgVa3T8XoKSH8T7+menYVPjSNR/Q5DKsy/HqEWf6
        QRVW+YAVHXyyfWZwDVbmoiE2cBq3SY5axPf89sOJcQmEBFzdMr5gId0h+rMASZOxio356hr8nDwKX
        xIgZIRPtzNcF38iDJ85xVPma1WFa3HNuzx4Poql3fsskhTz/FutmjsvZLHBqEWiaYif3MDKIcUpvr
        BCw/9PBVA==;
Received: from [177.133.63.56] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i16g0-0006B9-03; Fri, 23 Aug 2019 10:20:12 +0000
Date:   Fri, 23 Aug 2019 07:20:08 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH 6/7] media: don't do an unsigned int with a 31 bit shift
Message-ID: <20190823072008.5ab02f4b@coco.lan>
In-Reply-To: <82b06099-f652-47e9-99b9-3bd3ec197a4e@free.fr>
References: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
        <1a78a757b37d2628312e1d56d7a741ba89d42a91.1566502743.git.mchehab+samsung@kernel.org>
        <82b06099-f652-47e9-99b9-3bd3ec197a4e@free.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 23 Aug 2019 11:08:15 +0200
Marc Gonzalez <marc.w.gonzalez@free.fr> escreveu:

> On 22/08/2019 21:39, Mauro Carvalho Chehab wrote:
> 
> > [PATCH 6/7] media: don't do an unsigned int with a 31 bit shift  
> 
> s/unsigned int/signed int  ?
> 
> (See below as well.)
> 
> > Doing something like:
> > 
> > 	i32 foo = 1, bar;
> > 
> > 	bar = foo << 31;  
> 
> For my information, why did you split the expression over two lines,
> instead of just using 1 << 31 in the example above?
> (Most of the cases fixed involve a literal 1)
> 
> I.e. why didn't you just say "1 << 31 has undefined behavior" ?
> 
> Maybe patch subject can also be changed to "Don't use 1 << foo" ?
> 
> > has an undefined behavior in C, as warned by cppcheck, as we're
> > shifting a signed integer.  
> 
> Not quite right. Shifting a signed integer is well-defined in some cases.
> See paragraph 4 below. For example, 1 << 8 always resolves to 256.

I meant to say that, on a 32-bits arch, where a signed integer has
31 bits and we do a 31 bit shift, it will end touching the 32th bit,
with is an undefined behavior.

I'm changing the description to:

	media: don't do a 31 bit shift on a signed int

	On 32-bits archs, a signed integer has 31 bits plus on extra
	bit for	signal.	Due to that, touching the 32th bit with something 
	like:

	        int bar = 1 << 31;

	has an undefined behavior in C on 32 bit architectures, as it
	touches	the signal bit.	This is warned by cppcheck.

	Instead, force the numbers to be unsigned, in order to solve this
	issue.

I guess this makes it clearer.


> 
>     6.5.7 Bitwise shift operators
> 
> 1   Syntax
>              shift-expression:
>                      additive-expression
>                      shift-expression << additive-expression
>                      shift-expression >> additive-expression
> 
> 2   Constraints
>     Each of the operands shall have integer type.
> 
> 3   Semantics
>     The integer promotions are performed on each of the operands. The type of the result is
>     that of the promoted left operand. If the value of the right operand is negative or is
>     greater than or equal to the width of the promoted left operand, the behavior is undefined.

The problem is here: "greater than or equal to the width of the promoted left operand".
A 31 bit shift on a 31 bits value is undefined.

In the past, we got real issues like that at the code: gcc on x86 does the shift as
expected, so:

	u32 a = 1 << 32;

it results in:

	on i386:  a = 0
	on arm:   a = 1

I've no idea how LLVM/clang implements this.

> 
> 4   The result of E1 << E2 is E1 left-shifted E2 bit positions; vacated bits are filled with
>     zeros. If E1 has an unsigned type, the value of the result is E1 x 2^E2 , reduced modulo
>     one more than the maximum value representable in the result type. If E1 has a signed
>     type and non-negative value, and E1 x 2^E2 is representable in the result type, then that is
>     the resulting value; otherwise, the behavior is undefined.
> 
> 5   The result of E1 >> E2 is E1 right-shifted E2 bit positions. If E1 has an unsigned type
>     or if E1 has a signed type and a non-negative value, the value of the result is the integral
>     part of the quotient of E1 / 2^E2 . If E1 has a signed type and a negative value, the
>     resulting value is implementation-defined.
> 
> 
> > Instead, force the numbers to be unsigned, in order to solve this
> > issue.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >  drivers/media/dvb-frontends/cx24123.c           |  2 +-
> >  drivers/media/pci/bt8xx/bttv-input.c            |  4 ++--
> >  drivers/media/pci/cx18/cx18-ioctl.c             |  2 +-
> >  drivers/media/pci/ivtv/ivtv-driver.c            |  2 +-
> >  drivers/media/pci/ivtv/ivtv-ioctl.c             |  4 ++--
> >  drivers/media/pci/solo6x10/solo6x10-gpio.c      |  6 +++---
> >  drivers/media/platform/exynos4-is/mipi-csis.c   |  6 +++---
> >  drivers/media/platform/fsl-viu.c                |  2 +-
> >  drivers/media/platform/mx2_emmaprp.c            |  2 +-
> >  drivers/media/platform/pxa_camera.c             |  4 ++--
> >  drivers/media/platform/qcom/venus/core.c        |  2 +-
> >  drivers/media/platform/s5p-jpeg/jpeg-regs.h     | 10 +++++-----
> >  drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c |  4 ++--
> >  drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c |  2 +-
> >  drivers/media/radio/radio-gemtek.c              |  2 +-
> >  drivers/media/usb/dvb-usb-v2/gl861.c            |  2 +-
> >  drivers/media/usb/pvrusb2/pvrusb2-hdw.c         | 14 +++++++-------
> >  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c        |  4 ++--
> >  drivers/media/v4l2-core/v4l2-ioctl.c            |  2 +-
> >  19 files changed, 38 insertions(+), 38 deletions(-)
> > 
> > diff --git a/drivers/media/dvb-frontends/cx24123.c b/drivers/media/dvb-frontends/cx24123.c
> > index ac519c3eff18..3d84ee17e54c 100644
> > --- a/drivers/media/dvb-frontends/cx24123.c
> > +++ b/drivers/media/dvb-frontends/cx24123.c
> > @@ -431,7 +431,7 @@ static u32 cx24123_int_log2(u32 a, u32 b)
> >  	u32 div = a / b;
> >  	if (a % b >= b / 2)
> >  		++div;
> > -	if (div < (1 << 31)) {
> > +	if (div < (1UL << 31)) {
> >  		for (exp = 1; div > exp; nearest++)
> >  			exp += exp;
> >  	}  
> 
> Did you pick unsigned long (rather than unsigned) because that's what is used
> in the BIT macro? 

Yes.

> My concern is that UL is 64-bit wide on some platforms, and
> when used in arithmetic expressions, compiler might generate worse code.

On Linux, long size is equal to integer size, so I don't think
that this is actually a problem.

Thanks,
Mauro
