Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B022CABB4A
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 16:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394546AbfIFOqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 10:46:01 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45594 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728066AbfIFOqB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 10:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=qdE/A5E3itAYmXEYNe4hji8cSWMQ2krYgI7nm7rwFLE=; b=UzI3yrhFY1MFysDBeXC57GWG0
        HheMLnHjfzNw58QOczGMWnnxFZ1ZPI+9wvxr85pe22tPeoiXmXiMhhccD/6BHUKs8dwtvjR+kUtpZ
        KBeQ64cjoVh/Dkt4/aN6aUiwfibYjWnqdbgahuzesxFcigt/07L6mS3aOcc7/itF7MQ2FCusD/bgj
        jermPUt3afpdxTxhwNhsbReeBE+QOgWQM09A2DrX3TLsWtYn3ouYM5u9zV4SPDETxsh6tU+7y2s0g
        VwnxQFc4T39lRH2BKDh8KZ+Gv96Av2Iifvs8Cs4HK9m5pPMQ6ceAV+/E/iOA4JILdU1AkglfU6ST6
        pScQlGuKg==;
Received: from [177.159.253.249] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i6FUs-0005rl-9e; Fri, 06 Sep 2019 14:45:58 +0000
Date:   Fri, 6 Sep 2019 11:45:52 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Joe Perches <joe@perches.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jessica Yu <jeyu@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: license-rules.txt: cover SPDX headers on Python
 scripts
Message-ID: <20190906114552.524d0d50@coco.lan>
In-Reply-To: <a610efdd3bf488d407dc1130fa8ed090019ccffd.camel@perches.com>
References: <20190905055614.7958918b@coco.lan>
        <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
        <20190905092703.GA30899@kroah.com>
        <20190905090701.37dcf75e@coco.lan>
        <b32c2e46b91e7bcda2a9bd140673f06d71b2487a.camel@perches.com>
        <20190906083457.7e7934ec@coco.lan>
        <a610efdd3bf488d407dc1130fa8ed090019ccffd.camel@perches.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 06 Sep 2019 05:20:30 -0700
Joe Perches <joe@perches.com> escreveu:

> On Fri, 2019-09-06 at 08:34 -0300, Mauro Carvalho Chehab wrote:
> > I did some changes on it, plus one change at the pedantic mode of
> > scripts/spdxcheck.py, and placed the corresponding patches at:
> > 
> > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=spdx_pedantic  
> 
> Overall seems very nice, thanks.
> 
> Couple nits.
> 
> Some of the scripts and py files move the author
> block into a description or add unnecessary blank
> comments.  These may use some manual fixups.

True. I noticed that too. I suspect that fixing this automatically would 
make the script too complex.

Anyway, the point is: who will apply it? Linus? Each maintainer?

I can apply it to the media subsystem (after applying the patches I have 
already doing the same), but I don't intend myself to apply it to the other
subsystems.

> > what's the "very first line" where a
> > SPDX header tag should be on a man page?  
> 
> Beats me.
> This says man pages are documents,
> https://spdx.org/rdf/ontology/spdx-2-0-rev-7/individuals/usageType_document___85292652.html
> 
> 

Yes. I mean, I suspect that a troff file should have a ".TH" at its
first line. So, SPDX header should start at the second line.



Thanks,
Mauro
