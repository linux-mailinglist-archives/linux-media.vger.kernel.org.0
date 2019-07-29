Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6C8878688
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 09:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfG2HoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 03:44:00 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33356 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbfG2HoA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 03:44:00 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0F8FF25AEB1;
        Mon, 29 Jul 2019 17:43:58 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E33799403F0; Mon, 29 Jul 2019 09:43:55 +0200 (CEST)
Date:   Mon, 29 Jul 2019 09:43:55 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2] dt-bindings: rcar-{csi2,vin}: Rename bindings
 documentation files
Message-ID: <20190729074355.urlf77ihukgnk6ov@verge.net.au>
References: <20190612211241.1455-1-niklas.soderlund+renesas@ragnatech.se>
 <20190712071703.GE9317@wyvern>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190712071703.GE9317@wyvern>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 12, 2019 at 04:17:03PM +0900, Niklas Söderlund wrote:
> Hi,
> 
> A gentle ping on this patch. I assume if it could get a ack from Rob it 
> could be taken in thru the media-tree?

Given the lack of interest I think it could also be taken through
Geert's tree.

> 
> On 2019-06-12 23:12:41 +0200, Niklas Söderlund wrote:
> > Renesas media binding documentation files uses a naming schema of
> > 'renesas,<module>.txt'. Rename VIN and CSI-2 files to match this
> > pattern.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > ---
> >  .../media/{renesas,rcar-csi2.txt => renesas,csi2.txt}         | 0
> >  .../bindings/media/{rcar_vin.txt => renesas,vin.txt}          | 0
> >  MAINTAINERS                                                   | 4 ++--
> >  3 files changed, 2 insertions(+), 2 deletions(-)
> >  rename Documentation/devicetree/bindings/media/{renesas,rcar-csi2.txt => renesas,csi2.txt} (100%)
> >  rename Documentation/devicetree/bindings/media/{rcar_vin.txt => renesas,vin.txt} (100%)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,csi2.txt
> > similarity index 100%
> > rename from Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> > rename to Documentation/devicetree/bindings/media/renesas,csi2.txt
> > diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
> > similarity index 100%
> > rename from Documentation/devicetree/bindings/media/rcar_vin.txt
> > rename to Documentation/devicetree/bindings/media/renesas,vin.txt
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6a3bac28ebb47830..a0d21ff13c8e8989 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -9807,8 +9807,8 @@ L:	linux-media@vger.kernel.org
> >  L:	linux-renesas-soc@vger.kernel.org
> >  T:	git git://linuxtv.org/media_tree.git
> >  S:	Supported
> > -F:	Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> > -F:	Documentation/devicetree/bindings/media/rcar_vin.txt
> > +F:	Documentation/devicetree/bindings/media/renesas,csi2.txt
> > +F:	Documentation/devicetree/bindings/media/renesas,vin.txt
> >  F:	drivers/media/platform/rcar-vin/
> >  
> >  MEDIA DRIVERS FOR RENESAS - VSP1
> > -- 
> > 2.21.0
> > 
> 
> -- 
> Regards,
> Niklas Söderlund
> 
