Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E675B76EC
	for <lists+linux-media@lfdr.de>; Tue, 13 Sep 2022 18:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbiIMQzq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Sep 2022 12:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbiIMQzW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Sep 2022 12:55:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1DF10AC
        for <linux-media@vger.kernel.org>; Tue, 13 Sep 2022 08:47:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [89.101.193.73])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23F5C104C;
        Tue, 13 Sep 2022 17:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663082783;
        bh=mYj0f5/M/JnHdMHw2QKx3DnGSPo21g1ySTAw9LcQINc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WQn1tLctGPG5V1WAcNvFXwJSwUJ4jqKBYcWZrbtwcKX9EgJz8SS911y4GO1+b3y81
         HJCke8jynawW9CZt2OazaTkvcBgPRr1TQufJA3xzSNmP9mnJk2FPpwEwYLwI5OjfY3
         s08rIaZbud7KOoyYyUGBxbZIZw13e0kC/ZBo0Jqs=
Date:   Tue, 13 Sep 2022 18:26:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH 1/6] media: imx: Decouple imx8mq-mipi-csi2 from
 imx7-media-csi
Message-ID: <YyChEb5jevzr73C2@pendragon.ideasonboard.com>
References: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
 <20220907200424.32136-2-laurent.pinchart@ideasonboard.com>
 <YxuETLufyEzXWiRu@pendragon.ideasonboard.com>
 <c61ad1e9c2ab54d7416bd4efbb9d92924530ab11.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c61ad1e9c2ab54d7416bd4efbb9d92924530ab11.camel@puri.sm>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Tue, Sep 13, 2022 at 05:10:12PM +0200, Martin Kepplinger wrote:
> Am Freitag, dem 09.09.2022 um 21:22 +0300 schrieb Laurent Pinchart:
> > Hi Martin,
> > 
> > It seems I forgot to CC you on this patch, sorry about that. Could you
> > give it a look ? I'd like to send a pull request for the series next week.
> 
> hi Laurent,
> 
> this change should be ok. thanks for the config-change warning. I'm
> very much looking forward to seeing some of these drivers moved to
> drivers/media.
> 
> Depeding on how that goes I'll follow with the imx8mq-mipi-csi2 driver
> (if you don't want to do it).

I don't have plans to address that driver, so I'll be happy to let you
handle it :-)

> thanks again,
>                           martin
> 
> > On Wed, Sep 07, 2022 at 11:04:19PM +0300, Laurent Pinchart wrote:
> > > The imx8mq-mipi-csi2 driver targets SoCs that also run the
> > > imx7-media-csi driver, but they are distinct. Decouple them in
> > > Kconfig
> > > to prepare for destaging of the imx7-media-csi driver.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/staging/media/imx/Kconfig  | 10 ++++++++++
> > >  drivers/staging/media/imx/Makefile |  2 +-
> > >  2 files changed, 11 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/media/imx/Kconfig
> > > b/drivers/staging/media/imx/Kconfig
> > > index 0bacac302d7e..bfb849701489 100644
> > > --- a/drivers/staging/media/imx/Kconfig
> > > +++ b/drivers/staging/media/imx/Kconfig
> > > @@ -32,3 +32,13 @@ config VIDEO_IMX7_CSI
> > >           i.MX6UL/L, i.MX7 or i.MX8M.
> > >  endmenu
> > >  endif
> > > +
> > > +config VIDEO_IMX8MQ_MIPI_CSI2
> > > +       tristate "NXP i.MX8MQ MIPI CSI-2 receiver"
> > > +       depends on ARCH_MXC || COMPILE_TEST
> > > +       depends on VIDEO_DEV
> > > +       select MEDIA_CONTROLLER
> > > +       select V4L2_FWNODE
> > > +       select VIDEO_V4L2_SUBDEV_API
> > > +       help
> > > +         V4L2 driver for the MIPI CSI-2 receiver found in the
> > > i.MX8MQ SoC.
> > > diff --git a/drivers/staging/media/imx/Makefile
> > > b/drivers/staging/media/imx/Makefile
> > > index d82be898145b..cef9f30eb401 100644
> > > --- a/drivers/staging/media/imx/Makefile
> > > +++ b/drivers/staging/media/imx/Makefile
> > > @@ -15,4 +15,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
> > >  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
> > >  
> > >  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> > > -obj-$(CONFIG_VIDEO_IMX7_CSI) += imx8mq-mipi-csi2.o
> > > +obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o

-- 
Regards,

Laurent Pinchart
