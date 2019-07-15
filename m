Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D4C688B9
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 14:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729978AbfGOMMs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 08:12:48 -0400
Received: from gofer.mess.org ([88.97.38.141]:43089 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729827AbfGOMMs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 08:12:48 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 3D79460523; Mon, 15 Jul 2019 13:12:45 +0100 (BST)
Date:   Mon, 15 Jul 2019 13:12:45 +0100
From:   Sean Young <sean@mess.org>
To:     =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 04/13] media: rc: sunxi: Add RXSTA bits definition
Message-ID: <20190715121244.2vrsw6qa4fgp72fn@gofer.mess.org>
References: <20190607231100.5894-1-peron.clem@gmail.com>
 <20190607231100.5894-5-peron.clem@gmail.com>
 <20190610095243.7xwp4xhauds22qzw@flea>
 <CAJiuCcfyjGTBbsjZQYj2p3KD6O-WaXhFe5NZrnKQwJYACmatUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJiuCcfyjGTBbsjZQYj2p3KD6O-WaXhFe5NZrnKQwJYACmatUw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jul 14, 2019 at 04:32:22PM +0200, Clément Péron wrote:
> Hi Sean,
> 
> You acked the whole v3 series but this patch has been introduced in v5
> could you ack this one too?

Acked-by: Sean Young <sean@mess.org>

Thanks

Sean

> 
> Thanks,
> Clément
> 
> 
> 
> 
> On Mon, 10 Jun 2019 at 11:52, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Sat, Jun 08, 2019 at 01:10:51AM +0200, Clément Péron wrote:
> > > We are using RXINT bits definition when looking at RXSTA register.
> > >
> > > These bits are equal but it's not really proper.
> > >
> > > Introduce the RXSTA bits and use them to have coherency.
> > >
> > > Signed-off-by: Clément Péron <peron.clem@gmail.com>
> >
> > Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > Maxime
> >
> > --
> > Maxime Ripard, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
