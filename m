Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5FDB6A88
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 20:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387799AbfIRSfZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 14:35:25 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45756 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387444AbfIRSfZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 14:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=RdxmcLkchYKSan2fgS0uWORFe3aJL1uqrqEQQxxKUNE=; b=XFXbth10rHsUSSTxGTSPB0vvv
        tJCdY01xJWOUNmyCauRXRIMeXSjgp/9yjkm+KmT70QAGOdkIK0RGZVpbTfqrV2N5fx6N5KP/aC1YO
        T4bnWHNT8wuNlzJiQVEaKLxaUmyTxyoCMPHZ9G1QC51Nq7MDDdIXJBRoqeaV5ozdzdsl2vPgvp8CD
        5N/ePOIDEmqtUAJdVkQgFkGySaH/EkW4Zy6TUJ5VCNDU61xDj6RNVERVTysjq1frtelomSIJ/qsVA
        AS+k4184r/kkJuPkbfu04zZeytUHGD5SLjez84afIBoPIHWh2KMn/p3kQxCd3Rzp3zr9Ad89X22lY
        kWEq1uU1w==;
Received: from 177.96.192.152.dynamic.adsl.gvt.net.br ([177.96.192.152] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iAenT-0000Cl-L4; Wed, 18 Sep 2019 18:35:23 +0000
Date:   Wed, 18 Sep 2019 15:35:19 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     ksummit-discuss@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [Ksummit-discuss] single maintainer profile directory (was Re:
 [PATCH] media: add a subsystem profile documentation)
Message-ID: <20190918153519.7806512f@coco.lan>
In-Reply-To: <201909181033.928B3F498D@keescook>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
        <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
        <201909162032.F4462D3@keescook>
        <20190917102817.263517b5@coco.lan>
        <201909170930.B8AD840@keescook>
        <20190918082326.49a19a24@coco.lan>
        <201909181033.928B3F498D@keescook>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 18 Sep 2019 10:39:32 -0700
Kees Cook <keescook@chromium.org> escreveu:

> On Wed, Sep 18, 2019 at 08:23:26AM -0300, Mauro Carvalho Chehab wrote:
> > You can't simply rename MAINTAINERS to .rst and let Sphinx handle it,  
> 
> Right! Sorry, I meant what you'd suggested earlier: having a script
> convert it at doc-build-time.
> 
> > The latest RFC about that with I sent was this one:
> > 
> > 	https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1238576.html  
> 
> Cool, I've found it on Lore now too:
> https://lore.kernel.org/lkml/20160923120733.546a4b7a@vento.lan/
> 
> I think having a script generate the entire thing might be better
> (instead of having duplicated instructions at the top of both files),
> which I see is what Joe suggested too.

Yes, I agree that having the instructions duplicated was not the best
idea :-)

I guess I did it, on that time, just to experiment with the approach,
but my plan were to avoid the duplication on some future patch.

The big issue, on that point, was the usage of the programoutput
extension. Some devs didn't like using it.


> 
> > +.. include:: ../../MAINTAINERS
> > +   :literal:  
> 
> Nah, let's do a full make target as you'd suggested back in that thread.
> 
> I'll give it a shot if you don't beat me to it. :)

Yeah, please give it a shot. Feel free to reuse anything from my past
approaches if needed. 

I suspect that, if we convert the first part of MAINTAINERS to ReST
syntax, we could add something similar to this to Documentation/Makefile:

$(BUILDDIR)/maintainers.rst:

	awk '{if (match($0,"----------")) exit; print}' MAINTAINERS >$(BUILDDIR)/maintainers.rst
	awk '/----------/{y=1;next}y' MAINTAINERS|sed -E 's,^(\w:),:\1,' >>$(BUILDDIR)/maintainers.rst


Thanks,
Mauro
