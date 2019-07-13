Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBB267999
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2019 12:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbfGMKDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jul 2019 06:03:08 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51328 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbfGMKDI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jul 2019 06:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=kD2v2doj/MSy4rIsMW/AsXHEzihMEUmo0XWWNm5VWns=; b=bPfNYHh+FI47Ct/mVyg6Q4cNM
        Pzj7lea2J/E5sROuREXk6KzQE63C0EMuvJucfIr7h12J0rhQLriitphDLDC/n5VxFBB3HDxO8dp48
        dKIbdX2GEtF0PxE0bqnm/YUWV6fIuPfyQHdsrWKRtQwxoiBT7ryeL079syGzYU0avT2IEu5cf61tC
        YDnKlRYw8K91LSsAI+1YDudiQuHeY5ph3ZO/KWalvuPx6+JzEOhuHZ0z3mTMZqYik7RR6te6ISDki
        tNFSzgXuZ8Bt/u9GN5mmLkVqoDcBB5MuzyCWz89R15sslwy0LKeUE69B7WzcAyJgRCUu9PlirOot2
        GvOz0eO3A==;
Received: from 201.86.163.160.dynamic.adsl.gvt.net.br ([201.86.163.160] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hmErt-0004hn-M2; Sat, 13 Jul 2019 10:03:02 +0000
Date:   Sat, 13 Jul 2019 07:02:56 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Brad Love <brad@nextdimension.cc>, Antti Palosaari <crope@iki.fi>,
        Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3] media: si2168: Refactor command setup code
Message-ID: <20190713070256.3495de51@coco.lan>
In-Reply-To: <10f064c5-1634-c9f9-fcc9-6ab51b7f8f0b@free.fr>
References: <544859b5-108a-1909-d612-64f67a02aeec@free.fr>
        <bde6e367-61a4-7501-2459-eecad5db1d1b@nextdimension.cc>
        <20190712144537.2bad2482@coco.lan>
        <10f064c5-1634-c9f9-fcc9-6ab51b7f8f0b@free.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 13 Jul 2019 00:11:12 +0200
Marc Gonzalez <marc.w.gonzalez@free.fr> escreveu:

> On 12/07/2019 19:45, Mauro Carvalho Chehab wrote:
> 
> > Brad Love <brad@nextdimension.cc> escreveu:
> >   
> >> On 04/07/2019 05.33, Marc Gonzalez wrote:
> >>  
> >>> +#define CMD_SETUP(cmd, args, rlen) \
> >>> +	cmd_setup(cmd, args, sizeof(args) - 1, rlen)
> >>> +    
> >>
> >> This is only a valid helper if args is a null terminated string. It just
> >> so happens that every instance in this driver is, but that could be a
> >> silent pitfall if someone used a u8 array with this macro.  
> > 
> > Actually, it is uglier than that. If one writes something like:
> > 
> > 	char buf[20];
> > 
> > 	buf[0] = 0x20;
> > 	buf[1] = 0x03;
> > 
> > 	CMD_SETUP(cmd, buf, 0);
> > 
> > 	// some other init, up to 5 values, then another CMD_SETUP()  
> 
> I'm not sure what you mean in the // comment.
> What kind of init? Why up to 5 values? Why another CMD_SETUP?

I mean that the same buffer could be re-used to do something like:

 	char buf[20];
 
 	buf[0] = 0x20;
 	buf[1] = 0x03;
 
 	CMD_SETUP(cmd, buf, 0);   // write size here should be 2

	buf[2] = 0x04
	buf[3] = 0x00
	buf[4] = 0x05

	CMD_SETUP(cmd, buf, 0); // write size here should be 5

This kind of pattern happens on other drivers and someone may
end needing something like that at this driver on some future.

> > sizeof() will evaluate to 20, and not to 2, with would be the
> > expected buffer size, and it will pass 18 random values.
> > 
> > IMHO, using sizeof() here is a very bad idea.  
> 
> You may have a point...
> (Though I'm not proposing a kernel API function, merely code
> refactoring for a single file that's unlikely to change going
> forward.)

Yes, I know, but we had already some bugs due to the usage of
sizeof() on similar macros at drivers in the past.

> It's also bad form to repeat the cmd size (twice) when the compiler
> can figure it out automatically for string literals (which is 95%
> of the use-cases).
> 
> I can drop the macro, and just use the helper...

The helper function sounds fine.

> 
> Or maybe there's a GCC extension to test that an argument is a
> string literal...

If this could be evaluated by some advanced macro logic that
would work not only with gcc but also with clang, then a
macro that does what you proposed could be useful.

There are some ways to check the type of a macro argument, but I'm
not sure if are there any way for it to distinguish between a
string constant from a char * array.

Thanks,
Mauro
