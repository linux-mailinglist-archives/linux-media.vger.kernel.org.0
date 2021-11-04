Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA929445943
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 19:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232095AbhKDSHK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 14:07:10 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:46901 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhKDSHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 14:07:07 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id F1AD8200009;
        Thu,  4 Nov 2021 18:04:25 +0000 (UTC)
Date:   Thu, 4 Nov 2021 19:05:17 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] media: rcar-{csi2,vin}: Move to full Virtual Channel
 routing per CSI-2 IP
Message-ID: <20211104180517.e3o4wnifys4p6cv2@uno.localdomain>
References: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Wed, Oct 20, 2021 at 10:02:22PM +0200, Niklas Söderlund wrote:
> Hello,
>
> This series attempts to increase the flexibility of the R-Car VIN
> capture pipeline by allowing for free form Virtual Channel routing
> within the same CSI-2 IP block.
>
> When Gen3 support was first added to this R-Car VIN and CSI-2 driver the
> routing was centred around the CHSEL register which multiplex the
> different parallel buses that sits between the CSI-2 receivers source
> side and the VIN dma engines. This was a bad design as the multiplexing
> do allow for only a few combinations and do not play nice with many
> video streams in the system.
>
> For example it's only possible for CSI-2 Virtual Channels 0 and 1 of any
> given CSI-2 receiver to be used together with the scaler.
>
> Later datasheets have expanded the documentation and it is now possible
> to improve on this design by allowing any Virtual Channel to be routed
> to any R-Car VIN instance, provided that there exists a parallel bus
> between them. This increases the flexibility as all Virtual Channels can
> now be used together with the scaler for example.
>
> The redesign is not however perfect. While the new design allows for
> many more routes, two constrains limit a small portion of routes that
> was possible in the old design but are no more.
>
> - It is no longer possible to route the same CSI-2 and VC to more then
> one VIN at a time. This was theoretically possible before if the
> specific SoC allowed for the same CSI-2 and VC to be routed to two
> different VIN capture groups.
>
> - It is no longer possible to simultaneously mix links from two CSI-2 IP
> blocks to the same VIN capture group.
>
> For example if VIN2 is capturing from CSI40 then VIN{0,1,3} must also
> capture from CSI40. While VIN{4,5,6,7} is still free to capture from
> any other CSI-2 IP in the system. Once all VIN{0,1,2,3} links to CSI40
> are disabled that VIN capture group is free again to capture from any
> other CSI-2 IP it is connected to.
>
> At the core of the redesign is greater cooperator of the R-Car VIN and
> CSI-2 drivers in configuring the routing. The VIN driver is after this
> change only responsible to configure the full VIN capture groups
> parallel buses to be to a particular CSI-2 IP. While the configuration
> of which CSI-2 Virtual Channel is outputted on which of the R-Car CSI-2
> IP output ports is handled by the CSI-2 driver.
>
> Before this change the CSI-2 Virtual Channel to output port was static
> in the CSI-2 driver and the different links only manipulated the VIN
> capture groups CHSEL register. With this change both the CHSEl register
> and the CSI-2 routing VCDT registers are modified for greater
> flexibility.
>
> Patch 1/3 and 2/3 are cleanup patches moving code around preparing for
> the real work in 3/3. The work is based on the latest media-tree.

I have tested this series with the GMSL multiplexed support.
Test branch is available at
https://git.sr.ht/~jmondi_/linux/log/multistream/media-master/tomba-v9/niklas/gmsl-dev

Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>
> Kind Regards,
> Niklas Söderlund
>
> Niklas Söderlund (3):
>   media: rcar-vin: Refactor link notify
>   media: rcar-vin: Breakout media link creation
>   media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2
>     IP
>
>  drivers/media/platform/rcar-vin/rcar-core.c | 379 ++++++--------------
>  drivers/media/platform/rcar-vin/rcar-csi2.c |  58 ++-
>  drivers/media/platform/rcar-vin/rcar-dma.c  |   2 +-
>  drivers/media/platform/rcar-vin/rcar-vin.h  |  18 +-
>  4 files changed, 167 insertions(+), 290 deletions(-)
>
> --
> 2.33.1
>
