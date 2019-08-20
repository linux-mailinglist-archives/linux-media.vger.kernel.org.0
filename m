Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC03296632
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 18:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729991AbfHTQWT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 12:22:19 -0400
Received: from gofer.mess.org ([88.97.38.141]:50407 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726742AbfHTQWT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 12:22:19 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AA2A961074; Tue, 20 Aug 2019 17:22:16 +0100 (BST)
Date:   Tue, 20 Aug 2019 17:22:16 +0100
From:   Sean Young <sean@mess.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: Add YAML schemas for the
 generic RC bindings
Message-ID: <20190820162216.7uol2jy5i3swhxi5@gofer.mess.org>
References: <20190819182619.29065-1-mripard@kernel.org>
 <20190820081525.celdosrgcvwoq6e7@gofer.mess.org>
 <20190820095028.l74sfvipwjjla6kq@flea>
 <CAL_JsqJaH5wWCHScNZwN4jxqY5Q_UDZLnq+fghecBgYY752Lnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJaH5wWCHScNZwN4jxqY5Q_UDZLnq+fghecBgYY752Lnw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 20, 2019 at 10:52:29AM -0500, Rob Herring wrote:
> On Tue, Aug 20, 2019 at 4:50 AM Maxime Ripard <mripard@kernel.org> wrote:
> > On Tue, Aug 20, 2019 at 09:15:26AM +0100, Sean Young wrote:
> > > On Mon, Aug 19, 2019 at 08:26:18PM +0200, Maxime Ripard wrote:
> > > > From: Maxime Ripard <maxime.ripard@bootlin.com>
> > > >
> > > > The RC controllers have a bunch of generic properties that are needed in a
> > > > device tree. Add a YAML schemas for those.
> > > >
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > >
> > > For the series (both 1/2 and 2.2):
> > >
> > > Reviewed-by: Sean Young <sean@mess.org>
> > >
> > > How's tree should this go through?
> >
> > Either yours or Rob's, I guess?
> 
> Sean's because there are other changes to
> Documentation/devicetree/bindings/media/sunxi-ir.txt in -next.

Good point, I'll take them.

Thanks
Sean
