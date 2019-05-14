Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C08E1CDCD
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 19:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfENRSp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 13:18:45 -0400
Received: from casper.infradead.org ([85.118.1.10]:41632 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfENRSo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 13:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=y1jt1vGYA3mBOQ/J2XJeuj9h+9xt/WgbyMVwztThSVQ=; b=sh7Mu5FxviOYnNnBztWbxc8j99
        wRRyT86DWHAjfiCF6a59D1/7MH6MdrmwRPTgG7KW/DkBJ0nY1souFG/s7CQnRhK28w77tEsUfJ5SS
        Yelf+jP4gl7sHFSiN4wHRy6co+V0iTpIwc76lKRmjpg1r51w+crVLjoPvpSatDyY/QX4OBFxAXSZW
        UliRbMV2MTEJzf4LcNeEa1azm4Mwympu2HPW15PwN9aPyLM/V9TcCLGMI1vS+6IBA4GK2/TpHD/7N
        xwdTIomf4CSP2fDM/645+B2d3QzNNoaO1mY7ZI423OdpWjNlXRMBGS7mH4zREaM0NZ/evUQXomdFY
        8Dgu6xiA==;
Received: from [179.179.44.200] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hQb4Q-0000u5-4h; Tue, 14 May 2019 17:18:30 +0000
Date:   Tue, 14 May 2019 14:18:24 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v6 00/13] TVP5150 new features
Message-ID: <20190514141824.5bd41389@coco.lan>
In-Reply-To: <20190506054713.crxc5pw6j5suvvq7@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
        <20190506054713.crxc5pw6j5suvvq7@pengutronix.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 6 May 2019 07:47:13 +0200
Marco Felsch <m.felsch@pengutronix.de> escreveu:

> Hi Mauro,
> 
> I know you are busy but can you have a look on it?

You should really trust on the sub-maintainers for such kind of
reviews :-)

I'll take a look today.

> 
> Regards,
>   Marco
> 
> On 19-04-15 14:44, Marco Felsch wrote:
> > Hi,
> > 
> > many thanks to Hans and Jacopo for the feedack :) this v6 address the
> > comments both made on my v5 [1].
> > 
> > In short this is round fixes just some minor issues rather than major
> > ones so the diff to the v5 is really small. The changed patches contain
> > the changelog so I omit it here.
> > 
> > I've tested it on a custom hardware but I can't test the em28xx usb
> > use-case since I haven't such a device. So other testers are welcome :)
> > 
> > Looking forward for your feedack,
> > 
> > 	Marco
> > 
> > [1] https://patchwork.kernel.org/cover/10886903/
> > 
> > Javier Martinez Canillas (1):
> >   partial revert of "[media] tvp5150: add HW input connectors support"
> > 
> > Marco Felsch (11):
> >   dt-bindings: connector: analog: add tv norms property
> >   media: v4l2-fwnode: add v4l2_fwnode_connector
> >   media: v4l2-fwnode: add initial connector parsing support
> >   media: tvp5150: add input source selection of_graph support
> >   media: dt-bindings: tvp5150: Add input port connectors DT bindings
> >   media: tvp5150: add FORMAT_TRY support for get/set selection handlers
> >   media: tvp5150: add s_power callback
> >   media: dt-bindings: tvp5150: cleanup bindings stlye
> >   media: dt-bindings: tvp5150: add optional tvnorms documentation
> >   media: tvp5150: add support to limit tv norms on connector
> >   media: tvp5150: make debug output more readable
> > 
> > Michael Tretter (1):
> >   media: tvp5150: initialize subdev before parsing device tree
> > 
> >  .../display/connector/analog-tv-connector.txt |   4 +
> >  .../devicetree/bindings/media/i2c/tvp5150.txt | 125 +++-
> >  drivers/media/i2c/tvp5150.c                   | 672 +++++++++++++-----
> >  drivers/media/v4l2-core/v4l2-fwnode.c         | 111 +++
> >  include/dt-bindings/media/tvnorms.h           |  56 ++
> >  include/dt-bindings/media/tvp5150.h           |   2 -
> >  include/media/v4l2-connector.h                |  30 +
> >  include/media/v4l2-fwnode.h                   |  49 ++
> >  8 files changed, 859 insertions(+), 190 deletions(-)
> >  create mode 100644 include/dt-bindings/media/tvnorms.h
> >  create mode 100644 include/media/v4l2-connector.h
> > 
> > -- 
> > 2.20.1
> > 
> > 
> >   
> 



Thanks,
Mauro
