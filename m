Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAF7A9748C
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 10:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbfHUIRx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 04:17:53 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:39848 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfHUIRx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 04:17:53 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 085DB25B7C3;
        Wed, 21 Aug 2019 18:17:51 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B6EA49405AE; Wed, 21 Aug 2019 10:17:48 +0200 (CEST)
Date:   Wed, 21 Aug 2019 10:17:48 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sh-mobile-ceu: Rename bindings
 documentation file
Message-ID: <20190821081746.lt6n4nhqnpyowzmi@verge.net.au>
References: <20190819140544.19294-1-horms+renesas@verge.net.au>
 <20190820095205.xnthl7d7cpy7myq2@uno.localdomain>
 <20190820151930.pwi42cewslkchssf@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820151930.pwi42cewslkchssf@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 20, 2019 at 05:19:30PM +0200, Simon Horman wrote:
> On Tue, Aug 20, 2019 at 11:52:05AM +0200, Jacopo Mondi wrote:
> > Hi Simon,
> > 
> > On Mon, Aug 19, 2019 at 04:05:44PM +0200, Simon Horman wrote:
> > > Renesas media binding documentation files uses a naming schema of
> > > 'renesas,<module>.txt'. Rename the SH Mobile CEU file to match this pattern.
> > >
> > 
> > The old soc-camera based sh-mobile-ceu driver has been removed one
> > year ago and replaced by driver/media/platform/renesas-ceu.c whose
> > bindings are described at
> > Documentation/devicetree/bindings/media/renesas,ceu.txt
> > 
> > Should this file be removed instead of renamed?
> 
> Thanks,
> 
> I thought I had checked that but clearly I did not.
> I agree the file should be removed and I'll send a revised patch
> accordingly.

The one lingering reference to renesas,sh-mobile-ceu I can see
in the tree is its use in an example of two data pipelines in
Documentation/devicetree/bindings/media/video-interfaces.txt

Could you suggest an alternative example?
