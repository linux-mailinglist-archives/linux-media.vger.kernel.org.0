Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E45C714447
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 07:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbfEFFr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 01:47:26 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51673 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfEFFr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 01:47:26 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hNWT6-0003V2-80; Mon, 06 May 2019 07:47:16 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hNWT3-0000cb-CZ; Mon, 06 May 2019 07:47:13 +0200
Date:   Mon, 6 May 2019 07:47:13 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v6 00/13] TVP5150 new features
Message-ID: <20190506054713.crxc5pw6j5suvvq7@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190415124413.18456-1-m.felsch@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:46:25 up 107 days, 10:28, 77 users,  load average: 0.07, 0.06,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

I know you are busy but can you have a look on it?

Regards,
  Marco

On 19-04-15 14:44, Marco Felsch wrote:
> Hi,
> 
> many thanks to Hans and Jacopo for the feedack :) this v6 address the
> comments both made on my v5 [1].
> 
> In short this is round fixes just some minor issues rather than major
> ones so the diff to the v5 is really small. The changed patches contain
> the changelog so I omit it here.
> 
> I've tested it on a custom hardware but I can't test the em28xx usb
> use-case since I haven't such a device. So other testers are welcome :)
> 
> Looking forward for your feedack,
> 
> 	Marco
> 
> [1] https://patchwork.kernel.org/cover/10886903/
> 
> Javier Martinez Canillas (1):
>   partial revert of "[media] tvp5150: add HW input connectors support"
> 
> Marco Felsch (11):
>   dt-bindings: connector: analog: add tv norms property
>   media: v4l2-fwnode: add v4l2_fwnode_connector
>   media: v4l2-fwnode: add initial connector parsing support
>   media: tvp5150: add input source selection of_graph support
>   media: dt-bindings: tvp5150: Add input port connectors DT bindings
>   media: tvp5150: add FORMAT_TRY support for get/set selection handlers
>   media: tvp5150: add s_power callback
>   media: dt-bindings: tvp5150: cleanup bindings stlye
>   media: dt-bindings: tvp5150: add optional tvnorms documentation
>   media: tvp5150: add support to limit tv norms on connector
>   media: tvp5150: make debug output more readable
> 
> Michael Tretter (1):
>   media: tvp5150: initialize subdev before parsing device tree
> 
>  .../display/connector/analog-tv-connector.txt |   4 +
>  .../devicetree/bindings/media/i2c/tvp5150.txt | 125 +++-
>  drivers/media/i2c/tvp5150.c                   | 672 +++++++++++++-----
>  drivers/media/v4l2-core/v4l2-fwnode.c         | 111 +++
>  include/dt-bindings/media/tvnorms.h           |  56 ++
>  include/dt-bindings/media/tvp5150.h           |   2 -
>  include/media/v4l2-connector.h                |  30 +
>  include/media/v4l2-fwnode.h                   |  49 ++
>  8 files changed, 859 insertions(+), 190 deletions(-)
>  create mode 100644 include/dt-bindings/media/tvnorms.h
>  create mode 100644 include/media/v4l2-connector.h
> 
> -- 
> 2.20.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
