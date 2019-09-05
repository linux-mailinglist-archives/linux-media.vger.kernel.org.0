Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62EE9AACBC
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 22:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732863AbfIEUHj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 16:07:39 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60896 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbfIEUHi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 16:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/RMKG1VmtC2gPGmK7VWh8EaeDGToHpuMmS1djuPjg9Y=; b=HzCrgT9ZhXEE69qWsnIA75rFg
        HxRqmevdQ9RBjSwPeI87YRf+S1bIDVVH5G0EfMlgu2VA1y5WfwjouHPvNEXRKeSUVOhwzqDXqmgCT
        yENCkE1gW9Np8oGYRMMN8EwCjOZfzjLEyBmOorojrxuVyCunW1dlaaW/iFBU4kaKvWy7sfYoQTqZQ
        Emo+v0sAFKOH/cOlD+I3bHDXb0y2QC2Ua4dsXJW2sAsQ1RQnWFJ05m6dhtBG2ieV5aWAjg0se3IUQ
        Rck8s0t0SOcN4UwdOM/FJ2kCLYsf5LiDMJDRp1r+pYH92BSJWhKqBblQB+30wDbY83pBTZqQ41rvi
        n9yBeNflg==;
Received: from [177.159.253.249] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5y2c-0003S4-Cm; Thu, 05 Sep 2019 20:07:38 +0000
Date:   Thu, 5 Sep 2019 17:07:33 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jessica Yu <jeyu@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: license-rules.txt: cover SPDX headers on Python
 scripts
Message-ID: <20190905170733.3a25dee8@coco.lan>
In-Reply-To: <20190905134008.57cd3e89@lwn.net>
References: <20190905055614.7958918b@coco.lan>
        <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
        <20190905065701.4744e66a@lwn.net>
        <20190905162810.2388d532@coco.lan>
        <20190905134008.57cd3e89@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 5 Sep 2019 13:40:08 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Thu, 5 Sep 2019 16:28:10 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > I don't think we can count that python 3 uses utf-8 per default.
> > 
> > I strongly suspect that, if one uses a Python3 version < 3.7, it will
> > still default to ASCII.
> > 
> > On a quick look, the new UTF-8 mode was added on PEP-540:
> > 
> > 	https://www.python.org/dev/peps/pep-0540/
> > 
> > Such change happened at Python 3.7.   
> 
> That PEP is to override the locale and use utf8 unconditionally.  It
> says, with regard to the pre-PEP state:
> 
> 	UTF-8 is also the default encoding of Python scripts, XML and JSON
> 	file formats.
> 
> Unicode was the reason for much of the Python 3 pain; it seems unlikely
> that many installations are defaulting to ASCII anyway...?

Yeah, but I remember that UTF-8 handling changed a few times during python 3
releases. I didn't really tracked what happened, as I don't usually program
in Python. So, I'm actually relying on what I can find about that.

Looking at Python 3.0 release[1], it says:

	"In many cases, but not all, the system default is UTF-8;
	 you should never count on this default."

[1] https://docs.python.org/3.0/whatsnew/3.0.html

So, at least on early Python 3 releases, the default may not be UTF-8.

I don't know about you, but, from time to time, people complain about
UTF-8 chars when I'm handling patches (last time was on a patch series
for Kernel 5.3 by a core dev in Australia, with was unable to apply a
patch from me with had some UTF-8 chars). 

So, I'm pretty sure that some devs don't set the locale to UTF8 even
those days.

Thanks,
Mauro
