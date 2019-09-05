Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E988AABF5
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 21:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388311AbfIET2R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 15:28:17 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53140 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbfIET2Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 15:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=t1YcN3+xCiz85eBAEfj1FyAohnsFYzHvEYbyJqPQyIM=; b=FR+n5e6W5gAAqw6FLtvlHnO8I
        DAO1WnOgf6bCa8BdoE8oC3frfV8mIxyk6aoGSSkoPiocwBedukffIe4a/UpxP8Grh/JR6ltPh4IjY
        TfS+jCTZLqJWUgHDwnDvGPCn2NLvn2iOpmd6h8XD1SE8n3OAbYTrZmVJbnQFIHux2Qub3Y88izqNt
        G4UvtPFAWEhZ/OQjSy5J41PIoI5NyvKYNWNcNImVocCD8cQlLFNb4HHrE8lmquZnftchqnWY/vnzW
        LapmaQbSLFvZUnLv6hU8TzQRjP2mMacHCB9gSjVMQABoWuGrjeCFxq1t3Qnc6+oAfwaWIXrRQPww0
        H/27M46Cw==;
Received: from [177.159.253.249] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5xQV-0007Yf-EO; Thu, 05 Sep 2019 19:28:15 +0000
Date:   Thu, 5 Sep 2019 16:28:10 -0300
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
Message-ID: <20190905162810.2388d532@coco.lan>
In-Reply-To: <20190905065701.4744e66a@lwn.net>
References: <20190905055614.7958918b@coco.lan>
        <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
        <20190905065701.4744e66a@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 5 Sep 2019 06:57:01 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Thu,  5 Sep 2019 06:23:13 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > Python's PEP-263 [1] dictates that an script that needs to default to
> > UTF-8 encoding has to follow this rule:
> > 
> > 	'Python will default to ASCII as standard encoding if no other
> > 	 encoding hints are given.
> > 
> > 	 To define a source code encoding, a magic comment must be placed
> > 	 into the source files either as first or second line in the file'  
> 
> So this is only Python 2, right?  Python 3 is UTF8 by default.  Given that
> Python 2 is EOL in January, is this something we should be concerned
> about?  Or should we instead be making sure that all the Python we have
> in-tree works properly with Python 3 and be done with it?

I don't think we can count that python 3 uses utf-8 per default.

I strongly suspect that, if one uses a Python3 version < 3.7, it will
still default to ASCII.

On a quick look, the new UTF-8 mode was added on PEP-540:

	https://www.python.org/dev/peps/pep-0540/

Such change happened at Python 3.7. 

Yet, according with PEP, it defaults to off, unless when using POSIX 
locale.

Thanks,
Mauro
