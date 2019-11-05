Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB540EF86B
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 10:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730574AbfKEJRm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 04:17:42 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59845 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbfKEJRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 04:17:42 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iRuy3-0002KF-P4; Tue, 05 Nov 2019 10:17:39 +0100
Message-ID: <78b6262cf5f6e9f60746559314fc9f1912365912.camel@pengutronix.de>
Subject: Re: Overlay support in the i.MX7 display
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Date:   Tue, 05 Nov 2019 10:17:38 +0100
In-Reply-To: <20191101084318.GA8428@pendragon.ideasonboard.com>
References: <20191101084318.GA8428@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, 2019-11-01 at 10:43 +0200, Laurent Pinchart wrote:
> Hello,
> 
> I'm looking at the available options to support overlays in the display
> pipeline of the i.MX7. The LCDIF itself unfortunaltey doesn't support
> overlays, the feature being implemented in the PXP. A driver for the PXP
> is available but only supports older SoCs whose PXP doesn't support
> overlays. This driver is implemented as a V4L2 mem2mem driver, which
> makes support of additional input channels impossible.
> 
> Here are the options I can envision:
> 
> - Extend the existing PXP driver to support multiple channels. This is
>   technically feasible, but will require moving away from the V4L2
>   mem2mem framework, which would break userspace. I don't think this
>   path could lead anywhere.

I may be biased, but please don't break the V4L2 mem2mem usecase :)

> - Write a new PXP driver for the i.MX7, still using V4L2, but with
>   multiple video nodes. This would allow blending multiple layers, but
>   would require writing the output to memory, while the PXP has support
>   for direct connections to the LCDIF (through small SRAM buffers).
>   Performances would thus be suboptimal. The API would also be awkward,
>   as using the PXP for display would require usage of V4L2 in
>   applications.

I'm not sure V4L2 is the best API for multi-pass 2D composition,
especially as the PXP is able to blit an overlay onto a background in
place.

> - Extend the mxsfb driver with PXP support, and expose the PXP inputs as
>   KMS planes. The PXP would only be used when available, and would be
>   transparent to applications. This would however prevent using it
>   separately from the display (to perform multi-pass alpha blending for
>   instance).

For the SRAM block row buffer path to the LCDIF, I think the KMS plane
abstraction is the way to go. The DRM and V4L2 drivers could be made to
use a shared backend, such that only one of plane composition and V4L2
scaling/CSC functions can work at the same time.

> What would be the best option going forward ? Would any of you, by any
> chance, have already started work in this area ?

I have not worked on this.

regards
Philipp

