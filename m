Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03DF95B7668
	for <lists+linux-media@lfdr.de>; Tue, 13 Sep 2022 18:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbiIMQZq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Sep 2022 12:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbiIMQZ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Sep 2022 12:25:26 -0400
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5EA0AA375
        for <linux-media@vger.kernel.org>; Tue, 13 Sep 2022 08:20:21 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 785C0DFBD8;
        Tue, 13 Sep 2022 08:10:19 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7-jvI4Id0nxG; Tue, 13 Sep 2022 08:10:18 -0700 (PDT)
Message-ID: <c61ad1e9c2ab54d7416bd4efbb9d92924530ab11.camel@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1663081818; bh=ZTjd0U1S71h4dIuldoIZaGapLzdXkQKdy5uRPaMP9lk=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=jlL6XRAjNVD83jUEo/Kv6HN7CEt070Ky1YmXa5Ao83YmD8Ozrl4ntQRndWdXfMAgm
         c7UguvnTC/qCiunpzVh1b5MbsTr25SLAJoRcMHDJCAaLhXNITMeJYfdGG2ZLnQ5Rbe
         r1pRJPJxvLyzKBTxFVSpZnpK+SzaVzsq/bK76gkoXxGn7TCLJ+rXRLmkm93SZY51Rd
         H1SnX3hsnjzjH8kYjjYV+McINylQN6tc4rT7lG8NPXtG+g/hyxSqMP9M1TKuGNNEJO
         LH1ZMkaeJ6BouNV0mQ/bbG0NwpknJNCOKCm5r/j3pkrG01HiWaC0GGQNf38cOY1fUM
         qYzs1qiBnSkJQ==
Subject: Re: [PATCH 1/6] media: imx: Decouple imx8mq-mipi-csi2 from
 imx7-media-csi
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Date:   Tue, 13 Sep 2022 17:10:12 +0200
In-Reply-To: <YxuETLufyEzXWiRu@pendragon.ideasonboard.com>
References: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
         <20220907200424.32136-2-laurent.pinchart@ideasonboard.com>
         <YxuETLufyEzXWiRu@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, dem 09.09.2022 um 21:22 +0300 schrieb Laurent Pinchart:
> Hi Martin,
> 
> It seems I forgot to CC you on this patch, sorry about that. Could
> you
> give it a look ? I'd like to send a pull request for the series next
> week.
> 

hi Laurent,

this change should be ok. thanks for the config-change warning. I'm
very much looking forward to seeing some of these drivers moved to
drivers/media.

Depeding on how that goes I'll follow with the imx8mq-mipi-csi2 driver
(if you don't want to do it).

thanks again,
                          martin


> On Wed, Sep 07, 2022 at 11:04:19PM +0300, Laurent Pinchart wrote:
> > The imx8mq-mipi-csi2 driver targets SoCs that also run the
> > imx7-media-csi driver, but they are distinct. Decouple them in
> > Kconfig
> > to prepare for destaging of the imx7-media-csi driver.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/staging/media/imx/Kconfig  | 10 ++++++++++
> >  drivers/staging/media/imx/Makefile |  2 +-
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/imx/Kconfig
> > b/drivers/staging/media/imx/Kconfig
> > index 0bacac302d7e..bfb849701489 100644
> > --- a/drivers/staging/media/imx/Kconfig
> > +++ b/drivers/staging/media/imx/Kconfig
> > @@ -32,3 +32,13 @@ config VIDEO_IMX7_CSI
> >           i.MX6UL/L, i.MX7 or i.MX8M.
> >  endmenu
> >  endif
> > +
> > +config VIDEO_IMX8MQ_MIPI_CSI2
> > +       tristate "NXP i.MX8MQ MIPI CSI-2 receiver"
> > +       depends on ARCH_MXC || COMPILE_TEST
> > +       depends on VIDEO_DEV
> > +       select MEDIA_CONTROLLER
> > +       select V4L2_FWNODE
> > +       select VIDEO_V4L2_SUBDEV_API
> > +       help
> > +         V4L2 driver for the MIPI CSI-2 receiver found in the
> > i.MX8MQ SoC.
> > diff --git a/drivers/staging/media/imx/Makefile
> > b/drivers/staging/media/imx/Makefile
> > index d82be898145b..cef9f30eb401 100644
> > --- a/drivers/staging/media/imx/Makefile
> > +++ b/drivers/staging/media/imx/Makefile
> > @@ -15,4 +15,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
> >  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
> >  
> >  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> > -obj-$(CONFIG_VIDEO_IMX7_CSI) += imx8mq-mipi-csi2.o
> > +obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
> 


