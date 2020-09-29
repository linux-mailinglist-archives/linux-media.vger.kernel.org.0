Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A61A27D3D5
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 18:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730051AbgI2QqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 12:46:09 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:1808 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728299AbgI2QqJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 12:46:09 -0400
X-IronPort-AV: E=Sophos;i="5.77,319,1596492000"; 
   d="scan'208";a="470117825"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 18:46:06 +0200
Date:   Tue, 29 Sep 2020 18:46:06 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/20] media: saa7134: use semicolons rather than commas
 to separate statements
In-Reply-To: <8a2e3c47-76d1-f959-fb7c-3a02641a57e2@wanadoo.fr>
Message-ID: <alpine.DEB.2.22.394.2009291845160.2808@hadrien>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr> <1601385283-26144-5-git-send-email-Julia.Lawall@inria.fr> <8a2e3c47-76d1-f959-fb7c-3a02641a57e2@wanadoo.fr>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-400160347-1601397967=:2808"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-400160347-1601397967=:2808
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Tue, 29 Sep 2020, Christophe JAILLET wrote:

> Le 29/09/2020 à 15:14, Julia Lawall a écrit :
> > Replace commas with semicolons.  Commas introduce unnecessary
> > variability in the code structure and are hard to see.  What is done
> > is essentially described by the following Coccinelle semantic patch
> > (http://coccinelle.lip6.fr/):
> >
> > // <smpl>
> > @@ expression e1,e2; @@
> > e1
> > -,
> > +;
> > e2
> > ... when any
> > // </smpl>
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> >
> > ---
> >   drivers/media/pci/saa7134/saa7134-video.c |    7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/pci/saa7134/saa7134-video.c
> > b/drivers/media/pci/saa7134/saa7134-video.c
> > index 9a6a6b68f8e3..2ca963b04b3f 100644
> > --- a/drivers/media/pci/saa7134/saa7134-video.c
> > +++ b/drivers/media/pci/saa7134/saa7134-video.c
> > @@ -868,8 +868,11 @@ static int buffer_activate(struct saa7134_dev *dev,
> >   		lines_uv = dev->height >> dev->fmt->vshift;
> >   		base2    = base + bpl * dev->height;
> >   		base3    = base2 + bpl_uv * lines_uv;
> > -		if (dev->fmt->uvswap)
> > -			tmp = base2, base2 = base3, base3 = tmp;
> > +		if (dev->fmt->uvswap) {
> > +			tmp = base2;
> > +			base2 = base3;
> > +			base3 = tmp;
> > +		}
> >   		video_dbg("uv: bpl=%ld lines=%ld base2/3=%ld/%ld\n",
> >   			bpl_uv,lines_uv,base2,base3);
> >   		if (V4L2_FIELD_HAS_BOTH(dev->field)) {
> >
> >
> Hi,
> this could be turned into a simpler:
>    swap(base2, base3);

Yes.  The conclusion is probably that it could be worth searching for swap
opportunities after this.  There are a lot of patches to send on these
commas, and I would rather not deviate to something else...

julia
--8323329-400160347-1601397967=:2808--
