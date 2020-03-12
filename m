Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2D5A1835AF
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 17:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbgCLQBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 12:01:30 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39271 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727372AbgCLQBa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 12:01:30 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCQH0-0007Zw-3n; Thu, 12 Mar 2020 17:01:26 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCQGz-0007Cj-L3; Thu, 12 Mar 2020 17:01:25 +0100
Date:   Thu, 12 Mar 2020 17:01:25 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL FOR v5.7] TVP5150 Features and Fixes
Message-ID: <20200312160125.sapxf2qzw7durb3c@pengutronix.de>
References: <76233d4e-2085-1a1a-86ad-0799292b419f@xs4all.nl>
 <20200312164530.101bd31c@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312164530.101bd31c@coco.lan>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:59:30 up 118 days,  7:18, 143 users,  load average: 0.10, 0.12,
 0.06
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20-03-12 16:45, Mauro Carvalho Chehab wrote:
> Em Thu, 12 Mar 2020 12:29:07 +0100
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
> > This finally landed!
> 
> Congrats!
> 
> This was waiting for a really long time to be matured. So, I went ahead and
> reviewed/applied the patches today.

Thanks =)

> PS.: I'm currently unable to test it with my tvp5150 devices.

Could you pls test it? It shouldn't break something but I can't verify
that..

> One minor issue: the DT bindings are still using the .txt format. 
> 
> Marco,
> 
> Could you please send us a followup patch converting it to the new
> yaml format?

Of course I will convert it.

Regards,
  Marco

> Thanks,
> Mauro
> 
> > 
> > Regards,
> > 
> > 	Hans
> > 
> > The following changes since commit eceeea5481d4eeb6073e8ccb2f229bb0dd14a44d:
> > 
> >   media: lmedm04: remove redundant assignment to variable gate (2020-03-12 09:47:33 +0100)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7g
> > 
> > for you to fetch changes up to 16ea6c19e137314b760241625437bafb97fb31e4:
> > 
> >   media: tvp5150: make debug output more readable (2020-03-12 11:55:00 +0100)
> > 
> > ----------------------------------------------------------------
> > Tag branch
> > 
> > ----------------------------------------------------------------
> > Javier Martinez Canillas (1):
> >       partial revert of "[media] tvp5150: add HW input connectors support"
> > 
> > Marco Felsch (19):
> >       dt-bindings: connector: analog: add sdtv standards property
> >       dt-bindings: display: add sdtv-standards defines
> >       media: v4l: link dt-bindings and uapi
> >       media: v4l2-fwnode: fix v4l2_fwnode_parse_link handling
> >       media: v4l2-fwnode: simplify v4l2_fwnode_parse_link
> >       media: v4l2-fwnode: add endpoint id field to v4l2_fwnode_link
> >       media: v4l2-fwnode: add v4l2_fwnode_connector
> >       media: v4l2-fwnode: add initial connector parsing support
> >       media: tvp5150: add input source selection of_graph support
> >       media: dt-bindings: tvp5150: Add input port connectors DT bindings
> >       media: tvp5150: fix set_selection rectangle handling
> >       media: tvp5150: add FORMAT_TRY support for get/set selection handlers
> >       media: tvp5150: move irq en-/disable into runtime-pm ops
> >       media: tvp5150: add v4l2-event support
> >       media: tvp5150: add subdev open/close callbacks
> >       media: dt-bindings: tvp5150: cleanup bindings stlye
> >       media: dt-bindings: tvp5150: add optional sdtv standards documentation
> >       media: tvp5150: add support to limit sdtv standards
> >       media: tvp5150: make debug output more readable
> > 
> > Michael Tretter (1):
> >       media: tvp5150: initialize subdev before parsing device tree
> > 
> >  Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt |   6 +
> >  Documentation/devicetree/bindings/media/i2c/tvp5150.txt                     | 146 ++++++++--
> >  drivers/media/i2c/tvp5150.c                                                 | 802 +++++++++++++++++++++++++++++++++++++++++------------
> >  drivers/media/v4l2-core/v4l2-fwnode.c                                       | 192 +++++++++++--
> >  include/dt-bindings/display/sdtv-standards.h                                |  76 +++++
> >  include/dt-bindings/media/tvp5150.h                                         |   2 -
> >  include/media/v4l2-fwnode.h                                                 | 143 ++++++++++
> >  include/uapi/linux/videodev2.h                                              |   4 +
> >  8 files changed, 1156 insertions(+), 215 deletions(-)
> >  create mode 100644 include/dt-bindings/display/sdtv-standards.h
> 
> 
> 
> Thanks,
> Mauro
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
