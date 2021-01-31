Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2384D309EB5
	for <lists+linux-media@lfdr.de>; Sun, 31 Jan 2021 21:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbhAaULT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Jan 2021 15:11:19 -0500
Received: from smtprelay0146.hostedemail.com ([216.40.44.146]:54868 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231764AbhAaUJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Jan 2021 15:09:12 -0500
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 18F5A181CB158;
        Sun, 31 Jan 2021 17:39:54 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id D3FA018006AE7;
        Sun, 31 Jan 2021 17:39:53 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3867:3868:3873:4321:5007:7652:10004:10400:10848:11026:11232:11473:11658:11783:11914:12043:12297:12438:12555:12740:12895:12986:13069:13311:13357:13439:13894:14181:14659:14721:21080:21451:21611:21627:30054:30064:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: box41_5e0a4fe275bb
X-Filterd-Recvd-Size: 2345
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf13.hostedemail.com (Postfix) with ESMTPA;
        Sun, 31 Jan 2021 17:39:52 +0000 (UTC)
Message-ID: <004fa2c0c74bb26d6144198552c8bae33a57be2e.camel@perches.com>
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
From:   Joe Perches <joe@perches.com>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Jiri Kosina <trivial@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Date:   Sun, 31 Jan 2021 09:39:51 -0800
In-Reply-To: <4d5891b7-ea87-974e-d260-f78c3af326bc@amd.com>
References: <cover.1598331148.git.joe@perches.com>
         <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
         <a87b95d11c22d997ebc423bba71cabef15ca0bac.camel@perches.com>
         <4d5891b7-ea87-974e-d260-f78c3af326bc@amd.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-02-03 at 14:26 +0100, Christian König wrote:
> Am 30.01.21 um 19:47 schrieb Joe Perches:
> > On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
> > > Use semicolons and braces.
> > Ping?
> > > Signed-off-by: Joe Perches <joe@perches.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Do you have commit rights to drm-misc-next?

No.

> > > ---
> > >   drivers/dma-buf/st-dma-fence.c | 7 +++++--
> > >   1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> > > index e593064341c8..c8a12d7ad71a 100644
> > > --- a/drivers/dma-buf/st-dma-fence.c
> > > +++ b/drivers/dma-buf/st-dma-fence.c
> > > @@ -471,8 +471,11 @@ static int thread_signal_callback(void *arg)
> > >   			dma_fence_signal(f1);
> > > 
> > >   		smp_store_mb(cb.seen, false);
> > > -		if (!f2 || dma_fence_add_callback(f2, &cb.cb, simple_callback))
> > > -			miss++, cb.seen = true;
> > > +		if (!f2 ||
> > > +		    dma_fence_add_callback(f2, &cb.cb, simple_callback)) {
> > > +			miss++;
> > > +			cb.seen = true;
> > > +		}
> > > 
> > >   		if (!t->before)
> > >   			dma_fence_signal(f1);
> > 
> 


