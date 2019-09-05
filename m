Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF00A9D97
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 10:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732628AbfIEI4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 04:56:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38722 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfIEI4X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 04:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=46bdmJAj05c8cmX9LGKLrze0o9OvutSp9qj+K6a1Is8=; b=YBLOP6upwBsfS581IJZRplqet
        7HQh4n/+Xd+BrX8l0K8FPvZd30p6WjpH7oEei4JoZx9UwScWdae0L8XHnbXFNixaRoMra69o/kESg
        q6kffmadlQADXTJNq+o5kq4H2eeLzpmFzGYMGuy1Z3DSyqEDqw/agXgFDQs5QmA+5oPyWcyup4ZOw
        a19ADBDn/CdB2QbYoshkAM+c3rVxynzq6oPcRy5lFhovAGTAQSnIwvC6ZAdUNfIp0THKQPBK+0lg6
        X/+8NlfJNyuZ3gf2DKcttOgA0rPiIE2PrkLK2Xbht3ZxaEgEQ9VwqhJ3PNBb3Xm6iG/cc29XzDqGA
        P8z3gRS/g==;
Received: from 177.17.137.173.dynamic.adsl.gvt.net.br ([177.17.137.173] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5nYx-0000nv-2V; Thu, 05 Sep 2019 08:56:19 +0000
Date:   Thu, 5 Sep 2019 05:56:14 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nishad Kamdar <nishadkamdar@gmail.com>,
        Joe Perches <joe@perches.com>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: siano: Use the correct style for SPDX License
 Identifier
Message-ID: <20190905055614.7958918b@coco.lan>
In-Reply-To: <20190905055430.GA23826@kroah.com>
References: <20190831151147.GA7082@nishad>
        <20190904153432.7fb54f02@coco.lan>
        <20190904183608.GA495@kroah.com>
        <20190904160010.4532c3f5@coco.lan>
        <20190905055430.GA23826@kroah.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 5 Sep 2019 07:54:30 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:

> On Wed, Sep 04, 2019 at 04:00:10PM -0300, Mauro Carvalho Chehab wrote:
> > Em Wed, 4 Sep 2019 20:36:08 +0200
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:
> >   
> > > On Wed, Sep 04, 2019 at 03:34:32PM -0300, Mauro Carvalho Chehab wrote:  
> > > > Em Sat, 31 Aug 2019 20:41:51 +0530
> > > > Nishad Kamdar <nishadkamdar@gmail.com> escreveu:
> > > >     
> > > > > This patch corrects the SPDX License Identifier style
> > > > > in header file related to Siano Mobile Silicon Digital TV.
> > > > > For C header files Documentation/process/license-rules.rst
> > > > > mandates C-like comments (opposed to C source files where
> > > > > C++ style should be used)
> > > > > 
> > > > > Changes made by using a script provided by Joe Perches here:
> > > > > https://lkml.org/lkml/2019/2/7/46
> > > > > 
> > > > > Suggested-by: Joe Perches <joe@perches.com>
> > > > > Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
> > > > > ---
> > > > >  drivers/media/common/siano/smsir.h | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/media/common/siano/smsir.h b/drivers/media/common/siano/smsir.h
> > > > > index b2c54c256e86..ada41d5c4e83 100644
> > > > > --- a/drivers/media/common/siano/smsir.h
> > > > > +++ b/drivers/media/common/siano/smsir.h
> > > > > @@ -1,5 +1,5 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > > >  /*
> > > > > - * SPDX-License-Identifier: GPL-2.0+
> > > > >   *
> > > > >   * Siano Mobile Silicon, Inc.
> > > > >   * MDTV receiver kernel modules.    
> > > > 
> > > > What's wrong with that? The above is a perfectly fine SPDX header.    
> > > 
> > > It is not the first line of the file :(
> > >   
> > 
> > A requirement for having it at the first line is not realistic.  
> 
> But it is "the rule" as Joe points out.
> 
> > I'd say more: some script that would check for SPDX only at the 
> > first line won't work.
> > 
> > The reason is simple: we have some scripts at the Kernel tree.  
> 
> This is not a script, for those, it is fine to use the second line,
> again, this is documented.
> 
> This isn't new at all, been that way since December of 2017, see commit
> aa19a176df95 ("Documentation: Add license-rules.rst to describe how to
> properly identify file licenses")

It sounds that I somehow misinterpreted this. Ok, be it. I'll accept
this patch and keep such rule in mind for next SPDX changes.

Anyway, with regards to script, we need to change the rules in order to
allow adding SPDX for python scripts, as otherwise the addition of SPDX
headers may cause regressions.

As mentioned on
	https://stackoverflow.com/questions/728891/correct-way-to-define-python-source-code-encoding
Python's PEP-263 [1] dictates that an script that needs to default to UTF-8 
encoding has to follow this rule:

	'Python will default to ASCII as standard encoding if no other
	 encoding hints are given.

	 To define a source code encoding, a magic comment must be placed
	 into the source files either as first or second line in the file'

And:
	'More precisely, the first or second line must match the following
	 regular expression:

	 ^[ \t\f]*#.*?coding[:=][ \t]*([-_.a-zA-Z0-9]+)'

[1] https://www.python.org/dev/peps/pep-0263/

If a script has both shebang and the charset encoding line, we can't place 
a SPDX tag without either violating license-rules.rst or breaking the script
by making it crash with non-ASCII characters.

I'll submit a separate patch in order to address such issue at
license-rules.txt.

Thanks,
Mauro
