Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 570C52E077F
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 09:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgLVIyS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 03:54:18 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43867 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgLVIyR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 03:54:17 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9973BFF805;
        Tue, 22 Dec 2020 08:53:32 +0000 (UTC)
Date:   Tue, 22 Dec 2020 09:53:44 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v6 2/5] dt-bindings: media: max9286: Document
 'maxim,reverse-channel-microvolt'
Message-ID: <20201222085344.gb7nqhbenn65yaux@uno.localdomain>
References: <20201215170957.92761-1-jacopo+renesas@jmondi.org>
 <20201215170957.92761-3-jacopo+renesas@jmondi.org>
 <X9o+XT3z1sVlh73x@pendragon.ideasonboard.com>
 <X9pBEe+da/8Y34Qv@pendragon.ideasonboard.com>
 <20201221185827.GA359098@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201221185827.GA359098@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob, Laurent,

On Mon, Dec 21, 2020 at 11:58:27AM -0700, Rob Herring wrote:
> On Wed, Dec 16, 2020 at 07:17:05PM +0200, Laurent Pinchart wrote:
> > > > @@ -221,6 +241,7 @@ required:
> > > >    - ports
> > > >    - i2c-mux
> > > >    - gpio-controller
> > > > +  - maxim,reverse-channel-microvolt
> >
> > One comment though: You specify a default value above, which isn't very
> > useful when the property is required. Should we either drop the default
> > value, or make the property optional ?
>
> And generally added properties can't be required unless for some reason
> DT's without the property are broken.

My thinking was to make it required for new DTS and specify a default
for the old ones that do not have the property. I'll drop required and
keep the default value in next version.

Thanks
  j

>
> With required dropped,
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
> Rob
