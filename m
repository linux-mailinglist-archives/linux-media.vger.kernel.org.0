Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A608A9221
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 21:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732810AbfIDTAS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 15:00:18 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40862 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730410AbfIDTAS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 15:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Sejf0oWfAeAKqRQ87axzuT3ob7JqA1ggbTpZQADCRRE=; b=Ina1+ncMJiIa2/Hv6tNTIad67
        vw9okY15X/BYQJI8+2B0fpmY5XX8onNDnYlwaP7gJ9aJ3/m6ZlCIYQOF48CdEUm/PBSSN1GOq/C7S
        s3iB/hy6/7caOPjSpOWZL+J4gmOlhLPq/b2RPZqPS4HocLbyo/LsrwqOJhJrTTLFUgJ2lpdEiKOkJ
        GNgKTF69Z2kr0W+Up8DsJSnQ7asO7fqpGxpK23YfzqixL7fF4LQlCSYidp3AdWmkRKAPmxyYMZSJM
        W2zm64H9AoaSrCLfk/8B5F+wVsqtoMP9B5m452svfvSVTdoLnpXaclGaV2Zo6O1sZVDyR48IiVdzz
        CKU61AR2A==;
Received: from 177.17.137.173.dynamic.adsl.gvt.net.br ([177.17.137.173] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5aVq-0000Tv-K2; Wed, 04 Sep 2019 19:00:15 +0000
Date:   Wed, 4 Sep 2019 16:00:10 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nishad Kamdar <nishadkamdar@gmail.com>,
        Joe Perches <joe@perches.com>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: siano: Use the correct style for SPDX License
 Identifier
Message-ID: <20190904160010.4532c3f5@coco.lan>
In-Reply-To: <20190904183608.GA495@kroah.com>
References: <20190831151147.GA7082@nishad>
        <20190904153432.7fb54f02@coco.lan>
        <20190904183608.GA495@kroah.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 4 Sep 2019 20:36:08 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:

> On Wed, Sep 04, 2019 at 03:34:32PM -0300, Mauro Carvalho Chehab wrote:
> > Em Sat, 31 Aug 2019 20:41:51 +0530
> > Nishad Kamdar <nishadkamdar@gmail.com> escreveu:
> >   
> > > This patch corrects the SPDX License Identifier style
> > > in header file related to Siano Mobile Silicon Digital TV.
> > > For C header files Documentation/process/license-rules.rst
> > > mandates C-like comments (opposed to C source files where
> > > C++ style should be used)
> > > 
> > > Changes made by using a script provided by Joe Perches here:
> > > https://lkml.org/lkml/2019/2/7/46
> > > 
> > > Suggested-by: Joe Perches <joe@perches.com>
> > > Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
> > > ---
> > >  drivers/media/common/siano/smsir.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/common/siano/smsir.h b/drivers/media/common/siano/smsir.h
> > > index b2c54c256e86..ada41d5c4e83 100644
> > > --- a/drivers/media/common/siano/smsir.h
> > > +++ b/drivers/media/common/siano/smsir.h
> > > @@ -1,5 +1,5 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > >  /*
> > > - * SPDX-License-Identifier: GPL-2.0+
> > >   *
> > >   * Siano Mobile Silicon, Inc.
> > >   * MDTV receiver kernel modules.  
> > 
> > What's wrong with that? The above is a perfectly fine SPDX header.  
> 
> It is not the first line of the file :(
> 

A requirement for having it at the first line is not realistic.
I'd say more: some script that would check for SPDX only at the 
first line won't work.

The reason is simple: we have some scripts at the Kernel tree.

Since ever, Unix shells use the first line to interpret what
program will handle it, e. g.:

	#! /usr/bin/perl

So, all perl/python scripts should reserve the first line for such
usage.

With Python, you can't even use the second line, as it is reserved
for charset encoding. 

So, realistically, the SPDX header could be up to the third line of
a given file.

Besides that, I vaguely remember some discussions we had, back on the
days SPDX was introduced, envolving Thomas, Linus and others. My 
understanding for such discussions is that something like this:

/*
 * SPDX-License-Identifier: GPL-2.0+
 *
 * some other notes about the file
 */

Would be acceptable, as the first line of the comment (with is at
the beginning of the file) is the SPDX tag.

Thanks,
Mauro
