Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3558D67FC65
	for <lists+linux-media@lfdr.de>; Sun, 29 Jan 2023 03:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjA2Cfx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 21:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjA2Cfv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 21:35:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 923EC22DFF
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 18:35:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13EE1327;
        Sun, 29 Jan 2023 03:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674959748;
        bh=6bJ+vJEC/12j0FIh1kY2kOSN9n/DvM/wfhxzaB9a9/g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eZowadvVQiZSuykMVaWPoYPAGXj+lqIx7VSRhU/dFPi5Bs+dCtwTUS6hAmQ2czQlJ
         Hi/EvadMJA+yHsc2mKhvoBZxLUwwvesVhExFrREB33cXt7iHKFO0d4USkjcQTh22Hl
         g1C0Cu8XgnV69kdEbq5EBJBWASUX3pFwPzRxxpEE=
Date:   Sun, 29 Jan 2023 04:35:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH v1 0/6] media: nxp: imx7-media-csi: Move to subdev active
 state
Message-ID: <Y9XbgD6hKHY75S69@pendragon.ideasonboard.com>
References: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
 <c38b1842a6e3042c66ab885ea8e46d832d238ce4.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c38b1842a6e3042c66ab885ea8e46d832d238ce4.camel@puri.sm>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Fri, Jan 27, 2023 at 12:41:26PM +0100, Martin Kepplinger wrote:
> Am Freitag, dem 27.01.2023 um 04:27 +0200 schrieb Laurent Pinchart:
> > Hello,
> > 
> > This small series moves the imx7-mipi-csi driver to use the subdev
> > active state. Patches 1/6 to 5/6 are small preparatory cleanups, with
> > the main change in 6/6.
> > 
> > I haven't tested the series yet as I need to dig up the hardware first.
> > Adam, you offered to test the similar imx-mipi-csis series I've sent
> > recently on the i.MX8MM, would you be able to test this one at the same
> > time ?
> 
> a first test of streaming frames on imx8mq with these patches + your
> inline fix works fine. just so you know. I can keep testing possible
> future revisions. thanks a lot!

Thank you for testing. I've just sent v2 and CC'ed you, could you please
test it too ? If it works, a Tested-by tag would be nice :-)

> ps. I know something similar needs to be done for the imx8mq mipi csi
> driver.

That would be nice. I won't have time to do so myself I'm afraid.

> > Laurent Pinchart (6):
> >   media: imx: imx7-media-csi: Drop imx7_csi.cc field
> >   media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()
> >   media: imx: imx7-media-csi: Drop unneeded check when starting
> >     streaming
> >   media: imx: imx7-media-csi: Drop unneeded src_sd check
> >   media: imx: imx7-media-csi: Drop unneeded pad checks
> >   media: imx: imx7-media-csi: Use V4L2 subdev active state
> > 
> >  drivers/media/platform/nxp/imx7-media-csi.c | 208 ++++++------------
> > --
> >  1 file changed, 58 insertions(+), 150 deletions(-)
> > 
> > 
> > base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2

-- 
Regards,

Laurent Pinchart
