Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1412714CE
	for <lists+linux-media@lfdr.de>; Sun, 20 Sep 2020 16:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgITOIB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Sep 2020 10:08:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:34010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726290AbgITOIA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Sep 2020 10:08:00 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C05FC21531;
        Sun, 20 Sep 2020 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600610879;
        bh=5Nu/Q5V28hWJU3Crt7+FLHDN+lSqZIJn2t8MycJ4Kfc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=my7AamuI0IRhPPpTH8LoiNnx+5ToKW4tisR+RYX62c0lCpubPnNVu35GdWXBc2RqE
         BncX3ahljtB9G9+fJyoK6vnft7jC2L8PKTHeIHBUJ0hLizAQty/w7wk5tOL0RQd562
         xvfzpRl+X/f0CbrhiyMVi/j5k1OB0ObMhpYkNLEE=
Date:   Sun, 20 Sep 2020 16:08:24 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-ide@vger.kernel.org,
        dmaengine <dmaengine@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        alsa-devel <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 07/20] dt-bindings: usb: renesas,usb3-peri: Document
 r8a774e1 support
Message-ID: <20200920140824.GA2915460@kroah.com>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vJ2n3KEL8P+XmVob2zjoWaX+s4a6c1TV_WoPFkwdkZmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8vJ2n3KEL8P+XmVob2zjoWaX+s4a6c1TV_WoPFkwdkZmA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 19, 2020 at 11:50:07AM +0100, Lad, Prabhakar wrote:
> Hi Greg,
> 
> On Thu, Jul 16, 2020 at 6:19 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > Document RZ/G2H (R8A774E1) SoC bindings.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> Could you please pick this patch.

Don't DT patches have to be acked by a DT maintainer first?

thanks,

greg k-h
