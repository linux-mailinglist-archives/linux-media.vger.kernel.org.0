Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E993230680
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 11:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgG1JZv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 05:25:51 -0400
Received: from smtprelay0154.hostedemail.com ([216.40.44.154]:43324 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728101AbgG1JZv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 05:25:51 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 36325180A815F;
        Tue, 28 Jul 2020 09:25:50 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:69:355:379:599:960:966:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2553:2559:2562:2693:2828:3138:3139:3140:3141:3142:3355:3622:3865:3867:3868:3871:3872:3873:3874:4250:4321:4385:4605:5007:8603:8660:10004:10400:10848:11026:11232:11657:11658:11914:12043:12048:12296:12297:12438:12555:12740:12895:12986:13148:13230:13439:13894:14659:14721:21080:21451:21627:21939:21990:30054:30070:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: bath95_350867a26f68
X-Filterd-Recvd-Size: 3880
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf11.hostedemail.com (Postfix) with ESMTPA;
        Tue, 28 Jul 2020 09:25:48 +0000 (UTC)
Message-ID: <2480b12b85f9560060cd155de222d42d40150ae7.camel@perches.com>
Subject: Re: [PATCH 2/2] media: bt8xx: avoid a useless memset
From:   Joe Perches <joe@perches.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        mchehab@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Tue, 28 Jul 2020 02:25:47 -0700
In-Reply-To: <d5759bd3-5e8a-a557-cd3e-0a2ae4d124e9@wanadoo.fr>
References: <20200727135151.54757-1-christophe.jaillet@wanadoo.fr>
         <0897d9bec8865859694c917f3f72ab8fd12321ff.camel@perches.com>
         <30618c986727e5f8a9806f663b4e6f4aa80065ae.camel@perches.com>
         <d5759bd3-5e8a-a557-cd3e-0a2ae4d124e9@wanadoo.fr>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-07-28 at 10:05 +0200, Christophe JAILLET wrote:
> Le 27/07/2020 à 18:16, Joe Perches a écrit :
> > On Mon, 2020-07-27 at 09:09 -0700, Joe Perches wrote:
> > > On Mon, 2020-07-27 at 15:51 +0200, Christophe JAILLET wrote:
> > > > Avoid a memset after a call to 'dma_alloc_coherent()'.
> > > > This is useless since
> > > > commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")
> > > []
> > > > diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
> > > []
> > > > @@ -73,7 +73,6 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
> > > >   		dprintk("btcx: riscmem alloc [%d] dma=%lx cpu=%p size=%d\n",
> > > >   			memcnt, (unsigned long)dma, cpu, size);
> > > >   	}
> > > > -	memset(risc->cpu,0,risc->size);
> > > >   	return 0;
> > > >   }
> > > 
> > > Likely NAK.
> > > 
> > > This is not useless as risc->cpu may be reused
> > > and the alloc may not have been done.
> > 
> > Perhaps a little rewrite for clarity:
> > ---
> >   drivers/media/pci/bt8xx/btcx-risc.c | 24 +++++++++++++-----------
> >   1 file changed, 13 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
> > index 51257980f539..311f4ca2a108 100644
> > --- a/drivers/media/pci/bt8xx/btcx-risc.c
> > +++ b/drivers/media/pci/bt8xx/btcx-risc.c
> > @@ -56,24 +56,26 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
> >   		       struct btcx_riscmem *risc,
> >   		       unsigned int size)
> >   {
> > -	__le32 *cpu;
> > -	dma_addr_t dma = 0;
> > -
> > -	if (NULL != risc->cpu && risc->size < size)
> > -		btcx_riscmem_free(pci,risc);
> > -	if (NULL == risc->cpu) {
> > -		cpu = pci_alloc_consistent(pci, size, &dma);
> > -		if (NULL == cpu)
> > +	if (risc->cpu && risc->size < size)
> > +		btcx_riscmem_free(pci, risc);
> > +
> > +	if (risc->cpu) {
> > +		memset(risc->cpu, 0, risc->size);
> > +	} else {
> > +		dma_addr_t dma = 0;
> > +
> > +		risc->cpu = pci_alloc_consistent(pci, size, &dma);
> > +		if (!risc->cpu)
> >   			return -ENOMEM;
> > -		risc->cpu  = cpu;
> > +
> >   		risc->dma  = dma;
> >   		risc->size = size;
> >   
> >   		memcnt++;
> >   		dprintk("btcx: riscmem alloc [%d] dma=%lx cpu=%p size=%d\n",
> > -			memcnt, (unsigned long)dma, cpu, size);
> > +			memcnt, (unsigned long)dma, risc->cpu, size);
> >   	}
> > -	memset(risc->cpu,0,risc->size);
> > +
> >   	return 0;
> >   }
> >   
> > 
> > 
> Looks good to me.
> 
> Just note, that this will not apply after patch 1/2 is applied, because 
> it turns pci_alloc_consistent() into dma_alloc_coherent().

Just a suggestion.

As it's dependent on your first patch, perhaps
you could make the appropriate change.


