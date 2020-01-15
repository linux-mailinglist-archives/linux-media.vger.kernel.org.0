Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2315313CA4C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 18:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbgAORGj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 12:06:39 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58071 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgAORGi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 12:06:38 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1irm7b-0000Jl-E9; Wed, 15 Jan 2020 18:06:23 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1irm7Z-0005PA-37; Wed, 15 Jan 2020 18:06:21 +0100
Date:   Wed, 15 Jan 2020 18:06:21 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v11 04/15] media: v4l2-fwnode: add initial connector
 parsing support
Message-ID: <20200115170621.jszy2p3e4w3b3hpn@pengutronix.de>
References: <20190930093900.16524-1-m.felsch@pengutronix.de>
 <20190930093900.16524-5-m.felsch@pengutronix.de>
 <20191115233439.GB2696@mara.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115233439.GB2696@mara.localdomain>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:35:42 up 61 days,  7:54, 54 users,  load average: 0.00, 0.01,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 19-11-16 01:34, Sakari Ailus wrote:
> Hi Marco,
> 
> On Mon, Sep 30, 2019 at 11:38:49AM +0200, Marco Felsch wrote:

...

Let me sum up our irc discussion about that kAPI.

Our starting point is a fwnode based subdev which has connectors in
front of there pins. Connectors are used to limit the subdev to some
device limits e.g. if the device support only PAL-Input streams and the
subdev has an buggy autodetect mechanism. In that case the connector can
be used by the subdev to set the possible TV-Norms to PAL. Currently the
tvp5150 is the only fwnode based subdev implementing connectors.

Connectors have common and connector specific properties. All current
provided connectors can be found here:
Documentation/devicetree/bindings/display/connector/ .

Parsing the properties is common to all _upcoming_ fwnode based subdevs
so this should be done within the core. So lets move on to the parsing
helper.

> > +int v4l2_fwnode_connector_alloc_parse(struct fwnode_handle *fwnode,
> > +				      struct v4l2_fwnode_connector *connector)
> > +{

This kAPI seems to fit all current use cases. The API is not responsible
to alloc the 'struct v4l2_fwnode_connector' instead it is only used to
fill this struct. The given 'struct fwnode_handle' should be the subdev
local ep-fwnode because the user already has a reference to this ep.

This helper has two use-cases:
  1) Parsing the connector properties and add the initial (1st) link.
  2) Add further n-links upon n-calls to an already parsed connector.

Going this way we need to ensure that the caller init the 'struct
v4l2_fwnode_connector' to '0' before call this helper. This can be
documented within the kAPI doc.

Regards,
  Marco
