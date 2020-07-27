Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F7F22F45A
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 18:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgG0QJl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 12:09:41 -0400
Received: from smtprelay0194.hostedemail.com ([216.40.44.194]:55062 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727862AbgG0QJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 12:09:40 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id BD4BF182251C0;
        Mon, 27 Jul 2020 16:09:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3867:3868:3871:4250:4321:5007:8603:8660:10004:10400:10848:11026:11232:11657:11658:11914:12043:12048:12296:12297:12740:12760:12895:13069:13148:13230:13311:13357:13439:14659:14721:21080:21451:21627:21939:21990:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: stem58_2a1235a26f62
X-Filterd-Recvd-Size: 1602
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Mon, 27 Jul 2020 16:09:37 +0000 (UTC)
Message-ID: <0897d9bec8865859694c917f3f72ab8fd12321ff.camel@perches.com>
Subject: Re: [PATCH 2/2] media: bt8xx: avoid a useless memset
From:   Joe Perches <joe@perches.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        mchehab@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Mon, 27 Jul 2020 09:09:34 -0700
In-Reply-To: <20200727135151.54757-1-christophe.jaillet@wanadoo.fr>
References: <20200727135151.54757-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-07-27 at 15:51 +0200, Christophe JAILLET wrote:
> Avoid a memset after a call to 'dma_alloc_coherent()'.
> This is useless since
> commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")
[]
> diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
[]
> @@ -73,7 +73,6 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
>  		dprintk("btcx: riscmem alloc [%d] dma=%lx cpu=%p size=%d\n",
>  			memcnt, (unsigned long)dma, cpu, size);
>  	}
> -	memset(risc->cpu,0,risc->size);
>  	return 0;
>  }

Likely NAK.

This is not useless as risc->cpu may be reused
and the alloc may not have been done.


