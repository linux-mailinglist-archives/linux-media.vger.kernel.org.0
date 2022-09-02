Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5A535AAC0A
	for <lists+linux-media@lfdr.de>; Fri,  2 Sep 2022 12:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232878AbiIBKH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 06:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235844AbiIBKHZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 06:07:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 452EA9F1B4
        for <linux-media@vger.kernel.org>; Fri,  2 Sep 2022 03:07:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 618934A8;
        Fri,  2 Sep 2022 12:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662113241;
        bh=0s6hXaaMR3nFS1KsG9idWtYzbofRcsnb0Rh6EL3VXDw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lEjLTShXJ9nIhjbWXMt6DYUAT7qTK7V7nR4YNe97Dbsl7ZVLH6x2Fu/D9aL3nhFaa
         qPNDgj3WaQs6DgGj/5j+HFDumRJ/GGjMM+xd02LWbx+pEWlaWn0Ix75SpC7BALeHMH
         VxbyHgwrFgXXZWXYGebGBDxTivVmEOx3COutbA1A=
Date:   Fri, 2 Sep 2022 13:07:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH 0/5] media: rkisp1: Fix LSC initial configuration on
 i.MX8MP
Message-ID: <YxHVzTIIiTZ80/xl@pendragon.ideasonboard.com>
References: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
 <20220902090704.crddbkvmguvezyiy@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220902090704.crddbkvmguvezyiy@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Fri, Sep 02, 2022 at 12:07:04PM +0300, Dafna Hirschfeld wrote:
> On 17.08.2022 05:18, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series fixes the Lens Shading Correction initial
> > configuration on the i.MX8MP.
> > 
> > The i.MX8MP integrates an ISP8000Nano v18.02, which unlike other
> > versions currently supported by the driver, gates access to the LSC RAM
> > with the ISP_CTRL.ISP_ENABLE bit. The initial LSC configuration being
> > performed before the ISP gets enabled, the writes to the RAM are
> > ignored, leading to incorrect results.
> > 
> > The series starts with four small drive-by cleanups of the LSC code, and
> > patch 5/5 then fixes the issue. I'm not totally thrilled by the code
> > architecture, but I'm not sure why, and I have a feeling doing better
> > would require a large refactoring of the ISP parameters handling. If
> > anyone sees an option for a better implementation, please say so.
> > 
> > The series is based on top of "[PATCH 0/7] media: rkisp1: Fix and
> > improve color space support" ([1]). Reviews for that base series would
> > thus be appreciated too.
> > 
> > [1] https://lore.kernel.org/linux-media/20220815065235.23797-1-laurent.pinchart@ideasonboard.com
> 
> Hi, I see that the series is also based on "[PATCH v2 00/55] media: rkisp1: Cleanups and add support"
> right? I could not apply patch 5/5 because it seems to sit on top of
> '[PATCH v2 49/55] media: rkisp1: Configure gasket on i.MX8MP'
> Do you have a branch you can share with all the sets?

Sure. You can find all pending patches for the rkisp1 at
https://gitlab.com/ideasonboard/nxp/linux/-/tree/pinchartl/v6.0/isp.
Commits up to and including "media: rkisp1: Zero v4l2_subdev_format
fields in when validating links" are candidates for v6.1, commits
starting at "dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible"
need some more work.

> > Laurent Pinchart (5):
> >   media: rkisp1: Clean up LSC configuration code
> >   media: rkisp1: Store LSC register values in u32 variables
> >   media: rkisp1: Simplify LSC x/y size and grad register macros
> >   media: rkisp1: Use RKISP1_CIF_ISP_LSC_GRAD_SIZE() for gradient
> >     registers
> >   media: rkisp1: Configure LSC after enabling the ISP
> > 
> >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  29 +-
> >  .../platform/rockchip/rkisp1/rkisp1-isp.c     |   9 +-
> >  .../platform/rockchip/rkisp1/rkisp1-params.c  | 378 ++++++++++--------
> >  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  20 +-
> >  4 files changed, 239 insertions(+), 197 deletions(-)

-- 
Regards,

Laurent Pinchart
