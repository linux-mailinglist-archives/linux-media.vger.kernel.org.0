Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0490B9FA1
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2019 21:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfIUTpR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Sep 2019 15:45:17 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34238 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfIUTpR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Sep 2019 15:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=zVemiHyFftuWLyJCi32mOapZtlhRvSsGykZ2Z/1kXzs=; b=IXIiEj+rZR00eqhwUMnToxBSN
        Tu/E0LEIqM9AGqEv9vyADQhcvKvYPpqCfxv9zh90QHQRt5Ueg8NSPPnSt/XkOuPXr9KhQV+yynYCA
        InBy+eWhNTtqv481wEeo8NJVIk3PND940oSyFfOxAMIN8rIUSYTWM+uf0EfCBzf9fLx5Mujmh4SAc
        BH5xaQadn70LSx+gENl+qxCwl+iYpKh8d3TXPBy+ziSiQy1rJ7bEFHqEE4eioIIBh8UyMoSI5LWkw
        tRmpp03CCpx44THBBJJ53YPf8Nw4VNKUrvFWFDMZG2IXvOEcWkSLzKVyZPTsNcfaeW6JVscKdBiLR
        HQ+H62Vrg==;
Received: from 177.206.132.221.dynamic.adsl.gvt.net.br ([177.206.132.221] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iBlJi-0003Vw-5h; Sat, 21 Sep 2019 19:45:14 +0000
Date:   Sat, 21 Sep 2019 16:45:10 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        ksummit-discuss@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Ksummit-discuss] single maintainer profile directory (was Re:
 [PATCH] media: add a subsystem profile documentation)
Message-ID: <20190921164510.3e52af21@coco.lan>
In-Reply-To: <20190921131307.77d01ebb@lwn.net>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
        <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
        <201909162032.F4462D3@keescook>
        <20190917102817.263517b5@coco.lan>
        <201909170930.B8AD840@keescook>
        <20190918082326.49a19a24@coco.lan>
        <20190921131307.77d01ebb@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 21 Sep 2019 13:13:07 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Wed, 18 Sep 2019 08:23:26 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > A simple/lazy solution would be to apply the enclosed patch - or a
> > variant of it that would place the contents of MAINTAINERS outside
> > process/index.html, and add instructions about how to use
> > get_maintainers.pl.
> > 
> > Jon,
> > 
> > Please let me know if you're willing to accept something like that.  
> 
> [Sorry for the slowness, I'm kind of tuned out this week]
> 
> I guess we could do that as a short-term thing.
> 
> In truth, though, this thing is a database; printing it out linearly is
> perhaps not the best thing we could do.  There should be better ways we
> could provide access to it.

Yeah, as this is a database, instead of just outputting it on a
formatted way, it is possible to generate other types of output.

We could, for example, have an extension with would implement something like:

	.. maintainers:: <subdir>

Which would call get-maintainers in order to parse a subsystem-specific
set of entries and printing the maintainership details.

This could be added at the subsystem-specific profile, for the subsystems
that have it.

> 
> Also, that file is nearly 18K lines long.  If some unsuspecting person
> generates a PDF and prints it, they're going to get something along the
> lines of 300 pages of MAINTAINERS, which may not quite be what they had
> in mind.  It costs (almost) nothing to put that into HTML output, but
> other formats could be painful.

Even if we go for adding a Sphinx tag that would produce a parsed
output for a system-specific profile, we'll still have several other
subsystems that won't have a profile for a while, so I would still 
consider having somewhere an output with its contents. Yeah, someone
might be tempted to print it, but we could place it on a separate PDF,
in order to minimize the risks of someone printing the 300+ pages.

> 
> So I dunno, we need to think this through a bit...


> 
> jon



Thanks,
Mauro
