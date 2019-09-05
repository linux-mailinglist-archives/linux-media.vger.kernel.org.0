Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C805A9A43
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 07:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbfIEFye (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 01:54:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:35182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725786AbfIEFye (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 01:54:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9108B2173B;
        Thu,  5 Sep 2019 05:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567662873;
        bh=Uf9AKCBn5jziRHZNbyaOFQh+/kEEr43vpEAZ+ka1xfY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2Z+aMos2+zBypg8rclvYgrozqQ/h7Fmi1k4rSSb+/VNt5cMXKM7MPs2VseLXbqLSw
         4Ejxag8xVok55PlZGXHJWwqz6Ite5WJXw0f9vk3Kvt4ikh1NhzkX//OC7mWsTPmRHU
         dvpcO1XmHnADUSAk1p1d9RjvQWEoF/alEWI6PuM8=
Date:   Thu, 5 Sep 2019 07:54:30 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Nishad Kamdar <nishadkamdar@gmail.com>,
        Joe Perches <joe@perches.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: siano: Use the correct style for SPDX License
 Identifier
Message-ID: <20190905055430.GA23826@kroah.com>
References: <20190831151147.GA7082@nishad>
 <20190904153432.7fb54f02@coco.lan>
 <20190904183608.GA495@kroah.com>
 <20190904160010.4532c3f5@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904160010.4532c3f5@coco.lan>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 04, 2019 at 04:00:10PM -0300, Mauro Carvalho Chehab wrote:
> Em Wed, 4 Sep 2019 20:36:08 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:
> 
> > On Wed, Sep 04, 2019 at 03:34:32PM -0300, Mauro Carvalho Chehab wrote:
> > > Em Sat, 31 Aug 2019 20:41:51 +0530
> > > Nishad Kamdar <nishadkamdar@gmail.com> escreveu:
> > >   
> > > > This patch corrects the SPDX License Identifier style
> > > > in header file related to Siano Mobile Silicon Digital TV.
> > > > For C header files Documentation/process/license-rules.rst
> > > > mandates C-like comments (opposed to C source files where
> > > > C++ style should be used)
> > > > 
> > > > Changes made by using a script provided by Joe Perches here:
> > > > https://lkml.org/lkml/2019/2/7/46
> > > > 
> > > > Suggested-by: Joe Perches <joe@perches.com>
> > > > Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
> > > > ---
> > > >  drivers/media/common/siano/smsir.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/media/common/siano/smsir.h b/drivers/media/common/siano/smsir.h
> > > > index b2c54c256e86..ada41d5c4e83 100644
> > > > --- a/drivers/media/common/siano/smsir.h
> > > > +++ b/drivers/media/common/siano/smsir.h
> > > > @@ -1,5 +1,5 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > >  /*
> > > > - * SPDX-License-Identifier: GPL-2.0+
> > > >   *
> > > >   * Siano Mobile Silicon, Inc.
> > > >   * MDTV receiver kernel modules.  
> > > 
> > > What's wrong with that? The above is a perfectly fine SPDX header.  
> > 
> > It is not the first line of the file :(
> > 
> 
> A requirement for having it at the first line is not realistic.

But it is "the rule" as Joe points out.

> I'd say more: some script that would check for SPDX only at the 
> first line won't work.
> 
> The reason is simple: we have some scripts at the Kernel tree.

This is not a script, for those, it is fine to use the second line,
again, this is documented.

This isn't new at all, been that way since December of 2017, see commit
aa19a176df95 ("Documentation: Add license-rules.rst to describe how to
properly identify file licenses")

thanks,

greg k-h
