Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8505F241FC0
	for <lists+linux-media@lfdr.de>; Tue, 11 Aug 2020 20:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgHKSeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Aug 2020 14:34:14 -0400
Received: from smtprelay0060.hostedemail.com ([216.40.44.60]:34422 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725901AbgHKSeM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Aug 2020 14:34:12 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 5EE6A8378A85;
        Tue, 11 Aug 2020 18:34:11 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:967:973:988:989:1260:1263:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2559:2562:2682:2685:2828:2859:2898:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3865:3867:3871:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:7514:7576:7875:7974:9025:9388:9592:10004:10049:10226:10400:10848:10967:11026:11232:11473:11657:11658:11914:12043:12295:12296:12297:12438:12555:12740:12760:12895:13069:13311:13357:13439:14093:14097:14181:14659:14721:14849:21080:21451:21627:30054:30056:30070:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: stamp43_0b0be8426fe5
X-Filterd-Recvd-Size: 2715
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Tue, 11 Aug 2020 18:34:10 +0000 (UTC)
Message-ID: <5dd3d10088dbc8a126bc788237f5206130a090ae.camel@perches.com>
Subject: Re: [PATCH 19/20] media: platform: vpdma.c: fix comparison to bool
From:   Joe Perches <joe@perches.com>
To:     Benoit Parrot <bparrot@ti.com>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     skhan@linuxfoundation.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 11 Aug 2020 11:34:09 -0700
In-Reply-To: <20200811125748.s3pdpwjmqmd5bffb@ti.com>
References: <20200807083548.204360-19-dwlsalmeida@gmail.com>
         <20200811125748.s3pdpwjmqmd5bffb@ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-08-11 at 07:57 -0500, Benoit Parrot wrote:
> Daniel W. S. Almeida <dwlsalmeida@gmail.com> wrote on Fri [2020-Aug-07 05:35:46 -0300]:
> > From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> > 
> > Fix the following coccinelle report:
> > 
> > drivers/media/platform/ti-vpe/vpdma.c:946:5-26: WARNING:
> > Comparison to bool
> > 
> > Found using - Coccinelle (http://coccinelle.lip6.fr)
[]
> > diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
[]
> > @@ -943,7 +943,7 @@ int vpdma_hwlist_alloc(struct vpdma_data *vpdma, void *priv)
> >  
> >  	spin_lock_irqsave(&vpdma->lock, flags);
> >  	for (i = 0; i < VPDMA_MAX_NUM_LIST &&
> > -	    vpdma->hwlist_used[i] == true; i++)
> > +	    vpdma->hwlist_used[i]; i++)
> >  		;


A more typical way to write this loop is
not testing i < VPDMA_MAX_NUM_LIST multiple
times like the below:
---
 drivers/media/platform/ti-vpe/vpdma.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
index 2e5148ae7a0f..5893917ce50d 100644
--- a/drivers/media/platform/ti-vpe/vpdma.c
+++ b/drivers/media/platform/ti-vpe/vpdma.c
@@ -942,14 +942,13 @@ int vpdma_hwlist_alloc(struct vpdma_data *vpdma, void *priv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&vpdma->lock, flags);
-	for (i = 0; i < VPDMA_MAX_NUM_LIST &&
-	    vpdma->hwlist_used[i] == true; i++)
-		;
-
-	if (i < VPDMA_MAX_NUM_LIST) {
+	for (i = 0; i < VPDMA_MAX_NUM_LIST; i++) {
+		if (vpdma->hwlist_used[i])
+			continue;
 		list_num = i;
 		vpdma->hwlist_used[i] = true;
 		vpdma->hwlist_priv[i] = priv;
+		break;
 	}
 	spin_unlock_irqrestore(&vpdma->lock, flags);
 


