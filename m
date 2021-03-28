Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1251434BA59
	for <lists+linux-media@lfdr.de>; Sun, 28 Mar 2021 03:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhC1BVc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 21:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbhC1BVD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 21:21:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B7FC0613B1;
        Sat, 27 Mar 2021 18:21:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77AD2527;
        Sun, 28 Mar 2021 03:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616894461;
        bh=n9NwDJVlinrOdOhKsB7+CQlEiwm+wESdwsQGjOFT46Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HdZEGaeCYEW6FSI8bHdJeeCGwSawdyZ4doI63txBw/jyzj38STemY/Ie7xom59msd
         /LtMBKvNs5qRHNXvO3tCxHux/p5g77S6C3jrN0xPle7eyDt5jy3e3NKmU3Lxet7iPY
         e/WQFlxP2pBCE1BYkB+an8A+nQKTQRYj+bKbfZQw=
Date:   Sun, 28 Mar 2021 04:20:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 0/5] Add r8a77965 DRIF support
Message-ID: <YF/Z0kyepzD2MUJ6@pendragon.ideasonboard.com>
References: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
 <20201021214319.GO3942@pendragon.ideasonboard.com>
 <90cb3777-377c-84d0-9b35-8c4b15084ebd@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90cb3777-377c-84d0-9b35-8c4b15084ebd@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sat, Mar 27, 2021 at 11:05:01AM +0100, Hans Verkuil wrote:
> On 21/10/2020 23:43, Laurent Pinchart wrote:
> > On Wed, Oct 21, 2020 at 02:53:27PM +0100, Fabrizio Castro wrote:
> >> Dear All,
> >>
> >> this series is to add DRIF support for the r8a77965
> >> (a.k.a. R-Car M3-N). Version 5 fixes a warning reported
> >> by 'make dt_binding_check', as reported by Rob.
> > 
> > Patch 1/5 to 4/5 taken in my tree, I'll send a pull request to
> > linux-media when the merge window closes. I expect Geert to handle 5/5.
> 
> Patch 5 has been merged, but patches 1-4 aren't. I don't think there
> was a PR for it. For some reason these patches are delegated to me in
> patchwork. I've now delegated them to you for further processing.

I've just sent a pull request, for these and other miscellaneous
changes.

> >> Fabrizio Castro (5):
> >>   MAINTAINERS: Update MAINTAINERS for Renesas DRIF driver
> >>   media: dt-bindings: media: renesas,drif: Convert to json-schema
> >>   media: dt-bindings: media: renesas,drif: Add r8a77990 support
> >>   media: dt-bindings: media: renesas,drif: Add r8a77965 support
> >>   arm64: dts: r8a77965: Add DRIF support
> >>
> >>  .../bindings/media/renesas,drif.txt           | 177 -----------
> >>  .../bindings/media/renesas,drif.yaml          | 279 ++++++++++++++++++
> >>  MAINTAINERS                                   |   4 +-
> >>  arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 120 ++++++++
> >>  4 files changed, 401 insertions(+), 179 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,drif.txt
> >>  create mode 100644 Documentation/devicetree/bindings/media/renesas,drif.yaml

-- 
Regards,

Laurent Pinchart
