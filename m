Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 833F4182EC0
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 12:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgCLLPA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 07:15:00 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45115 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgCLLPA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 07:15:00 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCLnh-0000ai-SG; Thu, 12 Mar 2020 12:14:53 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCLnf-0005LE-Uz; Thu, 12 Mar 2020 12:14:51 +0100
Date:   Thu, 12 Mar 2020 12:14:51 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v13 04/21] media: v4l2-fwnode: fix v4l2_fwnode_parse_link
 handling
Message-ID: <20200312111451.fg7t7qflnxq4ka6u@pengutronix.de>
References: <20200312103156.3178-1-m.felsch@pengutronix.de>
 <20200312103156.3178-5-m.felsch@pengutronix.de>
 <20200312104222.GN5379@paasikivi.fi.intel.com>
 <20200312104312.GO5379@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312104312.GO5379@paasikivi.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:12:17 up 118 days,  2:30, 135 users,  load average: 0.03, 0.11,
 0.14
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

On 20-03-12 12:43, Sakari Ailus wrote:
> On Thu, Mar 12, 2020 at 12:42:22PM +0200, Sakari Ailus wrote:
> > On Thu, Mar 12, 2020 at 11:31:39AM +0100, Marco Felsch wrote:
> > > Currently the driver differentiate the port number property handling for
> > > ACPI and DT. This is wrong as because ACPI should use the "reg" val too
> > > [1].
> > > 
> > > [1] https://patchwork.kernel.org/patch/11421985/
> > > 
> > > Fixes: ca50c197bd96 ("[media] v4l: fwnode: Support generic fwnode for parsing standardised properties")
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > 
> > Oh well, I guess this is OK; I noticed the next patch that depends on this
> > one. But it should be merged with the next patch so that it won't be
> > accidentally backported alone.
> > 
> > Then, please add:
> > 
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Forgot that no ACPI driver uses it. So _no_ changes are needed to this, and
> you can add the ack.
> 
> Thanks.

I thought about it too and in the end I splitted the patche for possible
backport reasons. Squashing shouldn't be a problem for Hans?

Regards,
  Marco
