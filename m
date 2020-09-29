Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB6D27D404
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 18:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729699AbgI2Q5H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 12:57:07 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:42859 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728933AbgI2Q5H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 12:57:07 -0400
X-IronPort-AV: E=Sophos;i="5.77,319,1596492000"; 
   d="scan'208";a="470119051"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 18:56:50 +0200
Date:   Tue, 29 Sep 2020 18:56:49 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Joe Perches <joe@perches.com>
cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/20] media: lmedm04: use semicolons rather than commas
 to separate statements
In-Reply-To: <c79b36c12c978d38f3ad89b1c659871a@perches.com>
Message-ID: <alpine.DEB.2.22.394.2009291855580.2808@hadrien>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr> <1601385283-26144-11-git-send-email-Julia.Lawall@inria.fr> <8d73748e-be82-4c30-4550-b5f4eecb3055@wanadoo.fr> <c79b36c12c978d38f3ad89b1c659871a@perches.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1035064695-1601398610=:2808"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1035064695-1601398610=:2808
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 29 Sep 2020, Joe Perches wrote:

> On 2020-09-29 09:00, Christophe JAILLET wrote:
> > Le 29/09/2020 à 15:14, Julia Lawall a écrit :
> > > Replace commas with semicolons.  Commas introduce unnecessary
> > > variability in the code structure and are hard to see.  What is done
> > > is essentially described by the following Coccinelle semantic patch
> > > (http://coccinelle.lip6.fr/):
> > >
> > > // <smpl>
> > > @@ expression e1,e2; @@
> > > e1
> > > -,
> > > +;
> > > e2
> > > ... when any
> > > // </smpl>
> > >
> > > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> > >
> > > ---
> > >   drivers/media/usb/dvb-usb-v2/lmedm04.c |    2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > > b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > > index 5a7a9522d46d..9ddda8d68ee0 100644
> > > --- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > > +++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > > @@ -391,7 +391,7 @@ static int lme2510_int_read(struct dvb_usb_adapter
> > > *adap)
> > >   	ep = usb_pipe_endpoint(d->udev, lme_int->lme_urb->pipe);
> > >     	if (usb_endpoint_type(&ep->desc) == USB_ENDPOINT_XFER_BULK)
> > > -		lme_int->lme_urb->pipe = usb_rcvbulkpipe(d->udev, 0xa),
> > > +		lme_int->lme_urb->pipe = usb_rcvbulkpipe(d->udev, 0xa);
> > >     	usb_submit_urb(lme_int->lme_urb, GFP_ATOMIC);
> > >   	info("INT Interrupt Service Started");
> > >
> > >
> > Ouch!
> >
> > This one looks like a real issue!
>
>
> Julia?  Did you do this one by hand?  This actually changes logic which I did
> not expectthe cocci script to do.

Joe already submitted this patch so please ignore my version:

https://lkml.org/lkml/2020/8/23/178

julia
--8323329-1035064695-1601398610=:2808--
