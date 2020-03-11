Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21093181387
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 09:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgCKIoH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 04:44:07 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51125 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728146AbgCKIoG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 04:44:06 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBwy5-0006ae-OG; Wed, 11 Mar 2020 09:43:57 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBwy5-0002zo-9A; Wed, 11 Mar 2020 09:43:57 +0100
Date:   Wed, 11 Mar 2020 09:43:57 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v12 06/19] media: v4l2-fwnode: add initial connector
 parsing support
Message-ID: <20200311084357.jodtsrcfaeanv7hz@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
 <20200309101428.15267-7-m.felsch@pengutronix.de>
 <20200311081703.GF5379@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311081703.GF5379@paasikivi.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:40:08 up 116 days, 23:58, 136 users,  load average: 0.11, 0.10,
 0.09
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

On 20-03-11 10:17, Sakari Ailus wrote:
> Hi Marco,
> 
> On Mon, Mar 09, 2020 at 11:14:15AM +0100, Marco Felsch wrote:
> ...
> > +void v4l2_fwnode_connector_free(struct v4l2_fwnode_connector *connector)
> > +{
> > +	struct v4l2_connector_link *link, *tmp;
> > +
> > +	if (IS_ERR_OR_NULL(connector) ||
> > +	    connector->type == V4L2_CONN_UNKNOWN)
> > +		return;
> > +
> > +	list_for_each_entry_safe(link, tmp, &connector->links, head) {
> > +		v4l2_fwnode_put_link(&link->fwnode_link);
> > +		list_del(&link->head);
> > +		kfree(link);
> > +	}
> > +
> > +	kfree(connector->label);
> > +	connector->label = NULL;
> > +	connector = NULL;
> 
> No need to set connector NULL here.

My intention was to make it safe e.g. if a caller calls this twice for
the same connector.

Regards,
  Marco

> > +}
> 
> -- 
> Sakari Ailus
