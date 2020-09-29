Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86AE727DBE5
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 00:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729757AbgI2WWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 18:22:17 -0400
Received: from smtprelay0147.hostedemail.com ([216.40.44.147]:40100 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729143AbgI2WWC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 18:22:02 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id A21001730861;
        Tue, 29 Sep 2020 22:22:00 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:967:973:982:988:989:1260:1263:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1712:1730:1747:1777:1792:2393:2525:2553:2560:2563:2682:2685:2828:2859:2900:2904:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3354:3622:3865:3867:3868:3870:3871:3872:3873:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:5007:7653:7903:9025:9040:9388:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12297:12438:12555:12740:12895:13095:13255:13439:13894:14096:14097:14181:14659:14721:21080:21433:21451:21627:30012:30054:30075:30083:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: year47_3509c192718d
X-Filterd-Recvd-Size: 3389
Received: from XPS-9350 (047-006-102-041.res.spectrum.com [47.6.102.41])
        (Authenticated sender: joe@perches.com)
        by omf05.hostedemail.com (Postfix) with ESMTPA;
        Tue, 29 Sep 2020 22:21:58 +0000 (UTC)
Message-ID: <3b7457e4efd04865115152636ca65b5dc9cfe0e4.camel@perches.com>
Subject: Re: [PATCH 10/20] media: lmedm04: use semicolons rather than commas
 to separate statements
From:   Joe Perches <joe@perches.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 29 Sep 2020 15:21:57 -0700
In-Reply-To: <alpine.DEB.2.22.394.2009291843560.2808@hadrien>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
         <1601385283-26144-11-git-send-email-Julia.Lawall@inria.fr>
         <8d73748e-be82-4c30-4550-b5f4eecb3055@wanadoo.fr>
         <c79b36c12c978d38f3ad89b1c659871a@perches.com>
         <alpine.DEB.2.22.394.2009291843560.2808@hadrien>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-09-29 at 18:44 +0200, Julia Lawall wrote:
> On Tue, 29 Sep 2020, Joe Perches wrote:
> > On 2020-09-29 09:00, Christophe JAILLET wrote:
> > > Le 29/09/2020 à 15:14, Julia Lawall a écrit :
> > > > Replace commas with semicolons.  Commas introduce unnecessary
> > > > variability in the code structure and are hard to see.  What is done
> > > > is essentially described by the following Coccinelle semantic patch
> > > > (http://coccinelle.lip6.fr/):
> > > > 
> > > > // <smpl>
> > > > @@ expression e1,e2; @@
> > > > e1
> > > > -,
> > > > +;
> > > > e2
> > > > ... when any
> > > > // </smpl>
> > > > 
> > > > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> > > > 
> > > > ---
> > > >   drivers/media/usb/dvb-usb-v2/lmedm04.c |    2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > > > b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > > > index 5a7a9522d46d..9ddda8d68ee0 100644
> > > > --- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > > > +++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > > > @@ -391,7 +391,7 @@ static int lme2510_int_read(struct dvb_usb_adapter
> > > > *adap)
> > > >   	ep = usb_pipe_endpoint(d->udev, lme_int->lme_urb->pipe);
> > > >     	if (usb_endpoint_type(&ep->desc) == USB_ENDPOINT_XFER_BULK)
> > > > -		lme_int->lme_urb->pipe = usb_rcvbulkpipe(d->udev, 0xa),
> > > > +		lme_int->lme_urb->pipe = usb_rcvbulkpipe(d->udev, 0xa);
> > > >     	usb_submit_urb(lme_int->lme_urb, GFP_ATOMIC);
> > > >   	info("INT Interrupt Service Started");
> > > > 
> > > > 
> > > Ouch!
> > > 
> > > This one looks like a real issue!
> > 
> > Julia?  Did you do this one by hand?  This actually changes logic which I did
> > not expectthe cocci script to do.
> 
> No, I didn't do it by hand.  Did you already send this one?  Maybe I
> should resend it with a more informative log message.

I did not send a patch for this one.

Yes, I think you should say you are fixing
a likely defect here.


