Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 330B3AA9C1
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 19:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390949AbfIERKw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 13:10:52 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38202 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389559AbfIERKw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 13:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=MjKdVNiFjOdZvdwokVehwJ0c/QLPeMEzqUmQ6koohg0=; b=TP+HPDqbKM126/TJ1UiGl4y8r
        GpMofqJxAwlaV7rYqLqTqswSp0aCoyLge2iul1chQJTRNXmGlJfx/FV+9cNyV//XEELyYh/fZxki4
        BLR0FKBg8SAZkcbR6Sp/wBCHCLEWzUQXX+IBGlaEGm9QYPAu5oZgW+AkmZD16wyeYsnOyN2nvud0Q
        F7X3jrdIEsqNwvK/aTeBvWNJ7DyNjsgNJ1XpkD9+Z3hvwobjk2igzTXMvtHJ1kx+cDDI1V6kvW4h2
        bnmCVuO2YVn6ST/HzlSnGmOFhUMyWwTFzLXUmbJyQOW+PW/sunv2QxzN0ilG5yx2kxeLGg+htCZ4Z
        4b73YB87w==;
Received: from [177.159.253.249] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5vHW-0008Gt-I4; Thu, 05 Sep 2019 17:10:51 +0000
Date:   Thu, 5 Sep 2019 14:10:44 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jessica Yu <jeyu@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: license-rules.txt: cover SPDX headers on Python
 scripts
Message-ID: <20190905141044.4eb3a622@coco.lan>
In-Reply-To: <20190905141723.GB25790@kroah.com>
References: <20190905055614.7958918b@coco.lan>
        <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
        <20190905065701.4744e66a@lwn.net>
        <20190905141723.GB25790@kroah.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 5 Sep 2019 16:17:23 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:

> On Thu, Sep 05, 2019 at 06:57:01AM -0600, Jonathan Corbet wrote:
> > On Thu,  5 Sep 2019 06:23:13 -0300
> > Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> >   
> > > Python's PEP-263 [1] dictates that an script that needs to default to
> > > UTF-8 encoding has to follow this rule:
> > > 
> > > 	'Python will default to ASCII as standard encoding if no other
> > > 	 encoding hints are given.
> > > 
> > > 	 To define a source code encoding, a magic comment must be placed
> > > 	 into the source files either as first or second line in the file'  
> > 
> > So this is only Python 2, right? 

Well, Debian 10 (buster) was launched this year, and still comes with python2
(with is the default):

	$ ls -la /usr/bin/python
	lrwxrwxrwx 1 root root 7 Mar  4  2019 /usr/bin/python -> python2

I think Debian devs will keep it maintained for a while, as this is a LTS
distro.

> > Python 3 is UTF8 by default.  Given that
> > Python 2 is EOL in January, is this something we should be concerned
> > about?  Or should we instead be making sure that all the Python we have
> > in-tree works properly with Python 3 and be done with it?  
> 
> I recommend just using python 3 everywhere and be done with it as there
> are already many distros that default to that already.

Then we need to change the scripts, as they're currently pointing to
/usr/bin/python instead of /usr/bin/python3. At least on the distros I
use myself, this doesn't point to /etc/alternates. Instead, it is just
an alias to python2.

Thanks,
Mauro
