Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B706F11DF
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 08:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345347AbjD1GoB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 02:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjD1Gn4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 02:43:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F3449D5
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 23:43:26 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53DBF9B9;
        Fri, 28 Apr 2023 08:43:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682664192;
        bh=fUyktgbfXs7RDhJ5BCNGcy3gP18pkJsAqGaBhmdQxDs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=epbJBfAg40wWePa2KIIsqzt2wmH6WMCm/SDDn5pfDzKnPQy44OGTOuZ1ITuV7MULu
         ulSYZQ0eZEV+gUWNNiBWpp7dNqe5SG2lpQFMXlZxfaFG2+2d0k6tR4pPUdoMdeYfDK
         NOiqxRJoaofMPWinOH1yMc9UCmB3lXingjbZ51dQ=
Date:   Fri, 28 Apr 2023 08:43:21 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: v4l2-async: regression due to endpoint matching
Message-ID: <3u5xed27to5bnwo3dksviydw6z2lga3udjkgvvzor4tlobjlxv@hsnam3wurgxc>
References: <8360125.31r3eYUQgx@steina-w>
 <5676976.irdbgypaU6@steina-w>
 <ob373sf6lmg6qfkdqy5ovxescw5gp7yedb2flk4ax762abo7b3@w33eqx3erdg7>
 <6415252.e9J7NaK4W3@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6415252.e9J7NaK4W3@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander

On Fri, Apr 28, 2023 at 08:33:30AM +0200, Alexander Stein wrote:
> Hi Jacopo,
>
> Am Freitag, 28. April 2023, 08:31:54 CEST schrieb Jacopo Mondi:
> > Hi Alexander
> >
> > On Fri, Apr 28, 2023 at 08:24:22AM +0200, Alexander Stein wrote:
> > > Hi Jacopo,
> > >
> > > Am Donnerstag, 27. April 2023, 18:01:38 CEST schrieb Jacopo Mondi:
> > > > Hi Alexander
> > > >
> > > > On Thu, Apr 27, 2023 at 04:40:46PM +0200, Alexander Stein wrote:
> > > > > Hi all,
> > > > >
> > > > > I have a setup on my TQMa6x (imx6q-mba6a.dts) with a tc358743 attached
> > > > > to
> > > > > the MIPI CSI input.
> > > > > I noticed that since commit 1f391df44607 ("media: v4l2-async: Use
> > > > > endpoints in __v4l2_async_nf_add_fwnode_remote()") the async subdevice
> > > > > probing does not work anymore. If I revert that, it is working again,
> > > > > even on next-20230425.
> > > >
> > > > A similar issue has been discussed at
> > > > https://www.spinics.net/lists/linux-media/msg223351.html
> > > >
> > > > Unfortunately there was no conclusion as far as I can tell if not that
> > > > imx6 is now broken
> > >
> > > Thanks for the link, seems like a non-trivial thing :(
> > >
> > > From a glimpse, this series seems to deal with multiple async subdevs:
> > > https://lore.kernel.org/all/20230330115853.1628216-1-sakari.ailus@linux.in
> > > tel.com/
> > >
> > > So imx-media-csi should be adjusted as well, no?
> >
> > It would really be helpful if you can give that series a spin on imx6
> > if you already have a test setup.
>
> I tried, but it failed to apply on my current development tree. What base does
> this series apply to? Is there also a repository available I can fetch from?
>

Sakari could tell, for me it applied on v6.3-rc2 but I recall I had to
manually fix a few things.


> Best regards,
> Alexander
>
> > > Best regards,
> > > Alexander
> > >
> > > > > $ cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
> > > > > imx-media:
> > > > > ipu2_csi1:
> > > > >
> > > > > ipu2_csi0:
> > > > >  [fwnode] dev=21dc000.mipi,
> > > > >  node=/soc/bus@2100000/mipi@21dc000/port@3/endpoint>
> > > > >
> > > > > ipu1_csi1:
> > > > >  [fwnode] dev=21dc000.mipi,
> > > > >  node=/soc/bus@2100000/mipi@21dc000/port@2/endpoint>
> > > > >
> > > > > ipu1_csi0:
> > > > > imx6-mipi-csi2:
> > > > > ipu2_csi1_mux:
> > > > >
> > > > > ipu1_csi0_mux:
> > > > >  [fwnode] dev=21dc000.mipi,
> > > > >  node=/soc/bus@2100000/mipi@21dc000/port@1/endpoint>
> > > > >
> > > > > With revert:
> > > > > $ cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
> > > > > imx-media:
> > > > > ipu2_csi1:
> > > > > ipu2_csi0:
> > > > > ipu1_csi1:
> > > > > ipu1_csi0:
> > > > > imx6-mipi-csi2:
> > > > > ipu2_csi1_mux:
> > > > > ipu1_csi0_mux:
> > > > >
> > > > > I also see these messages:
> > > > > > video-mux 20e0000.iomuxc-gpr:ipu2_csi1_mux: Consider updating driver
> > > > > > video-
> > > > >
> > > > > mux to match on endpoints
> > > > >
> > > > > > imx6-mipi-csi2 21dc000.mipi: Consider updating driver imx6-mipi-csi2
> > > > > > to
> > > > >
> > > > > match on endpoints
> > > > >
> > > > > > tc358743 0-000f: Consider updating driver tc358743 to match on
> > > > > > endpoints
> > > > > > video-mux 20e0000.iomuxc-gpr:ipu1_csi0_mux: Consider updating driver
> > > > > > video-
> > > > >
> > > > > mux to match on endpoints
> > > > >
> > > > > But I'm unsure if this is related. As far as I can see
> > > > > match_fwnode_one
> > > > > does match some nodes, but I do not know if they are the correct ones.
> > > > > Anyone has an idea what's wrong here?
> > > > >
> > > > > Best regards,
> > > > > Alexander
> > > > > --
> > > > > TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> > > > > Amtsgericht München, HRB 105018
> > > > > Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> > > > > http://www.tq-group.com/
> > >
> > > --
> > > TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> > > Amtsgericht München, HRB 105018
> > > Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> > > http://www.tq-group.com/
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
