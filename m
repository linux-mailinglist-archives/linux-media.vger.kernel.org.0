Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1A0B3D8ECD
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 15:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235260AbhG1NSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 09:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234771AbhG1NSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 09:18:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B66BAC061757
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 06:18:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3641D3F;
        Wed, 28 Jul 2021 15:18:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627478320;
        bh=GwfvPbffeEFA1GNHNdiFSa9Gx9MqIo3jVY76syuYezA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bD7RiNYiSJEYiEyDwhK2si8F0/qMjO/1L6BeHU1tBdp+dyYwAVM7ztJHk4gkZ9Fon
         FlPzBdvcTIouHlyrBvlHm1xyhsxkkWp2nOrfMMi8rlDwEtlHvZKup3xBGMiTPQ62MY
         fzSMfswUbMKsic6NPVtkNc7Iz4124pX0tfcuUC3M=
Date:   Wed, 28 Jul 2021 16:18:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH] media: imx: imx7-media-csi: Fix buffer return upon
 stream start failure
Message-ID: <YQFZKtF/JUm0ay+9@pendragon.ideasonboard.com>
References: <20210519005834.8690-1-laurent.pinchart@ideasonboard.com>
 <09087c452885b0da779258b4962a349dbde1aec7.camel@puri.sm>
 <CD4NTXN3E6YR.2T29V4FEH13PB@arch-thunder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CD4NTXN3E6YR.2T29V4FEH13PB@arch-thunder>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, Jul 28, 2021 at 10:19:36AM +0100, Rui Miguel Silva wrote:
> On Wed Jul 28, 2021 at 9:50 AM WEST, Martin Kepplinger wrote:
> > Am Mittwoch, dem 19.05.2021 um 03:58 +0300 schrieb Laurent Pinchart:
> > > When the stream fails to start, the first two buffers in the queue
> > > have
> > > been moved to the active_vb2_buf array and are returned to vb2 by
> > > imx7_csi_dma_unsetup_vb2_buf(). The function is called with the
> > > buffer
> > > state set to VB2_BUF_STATE_ERROR unconditionally, which is correct
> > > when
> > > stopping the stream, but not when the start operation fails. In that
> > > case, the state should be set to VB2_BUF_STATE_QUEUED. Fix it.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++------
> 
> <snip>
> 
> > > +               imx7_csi_deinit(csi, VB2_BUF_STATE_ERROR);
> > >         }
> > >  
> > >         csi->is_streaming = !!enable;
> >
> >
> > This patch has not yet been accepted. Any specific reason? I need it.
> 
> Good question, I gave my reviewed in May [0], maybe got lost in the
> merge process somewhere. Mauro?

I've just sent a pull request with all the pending i.MX8 patches,
including Martin's i.MX8MQ CSI-2 receiver driver.

https://lore.kernel.org/linux-media/YQFY5FS8v3Y3KkEA@pendragon.ideasonboard.com/T/#u

> [0]: https://lore.kernel.org/linux-media/CBHA8BLTAJM1.1DIYC729ZMAYY@arch-thunder/
> 
> >
> > Tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> >
> > thank you very much

-- 
Regards,

Laurent Pinchart
