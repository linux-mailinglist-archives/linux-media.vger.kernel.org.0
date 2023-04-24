Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34F6E6ED563
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 21:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbjDXTdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 15:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231937AbjDXTdN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 15:33:13 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F859E55
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 12:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682364792; x=1713900792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FZIJChs0f+L1u3nuLpV9kZ0EpvxdUBq8sFjjoHmf5Os=;
  b=JGcN+LySqW4cFG/dOdnZb+FN2luG81z/lAkHVyepmuPeeR0nkthcAVle
   2NA59YRmQ3j6/7ah0+jTwALdGd6Y+z6N/HwIAQ1H+NPBK5qa9wAQel9r6
   4She1tP5RMsBctvdwZDZKPPb6avDwa98Ly4PiwU0SQG0UBwwBD6WWKQVJ
   Q1x6udeyWqUI+rdnK9pqXL2L3iXwzT+/Zph2A4z/+ehpjVDP6+/OUCEMW
   ZzLfcQIg65DeTwIbeVbpmNbooaPfwbcfeNyNIdZ76S5jGdSW3VgBaMhv+
   r9mRgzHUjZnSXhElpW0x/ZfY7NvZNVo2DanBiHILQRGMXPg11E++0X8Ey
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="326153019"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="326153019"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 12:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="804755764"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="804755764"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 12:33:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1203B11FAD0;
        Mon, 24 Apr 2023 22:33:06 +0300 (EEST)
Date:   Mon, 24 Apr 2023 22:33:06 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 03/18] media: v4l: async: Simplify async sub-device
 fwnode matching
Message-ID: <ZEbZcvaAp7ExU7KA@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-4-sakari.ailus@linux.intel.com>
 <dpw2fvycehgud3ijdzppy24bep2a54ceceksmifetczikdmgeq@ok4vru42ocvy>
 <ZDkz/DcjzayyokAQ@kekkonen.localdomain>
 <ZEbWdoATJN2JoK9B@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZEbWdoATJN2JoK9B@oden.dyn.berto.se>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Mon, Apr 24, 2023 at 09:20:22PM +0200, Niklas Söderlund wrote:
> Hi Sakari,
> 
> On 2023-04-14 14:07:40 +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> > 
> > On Thu, Apr 13, 2023 at 06:50:04PM +0200, Jacopo Mondi wrote:
> > > Hi Sakari
> > > 
> > > On Thu, Mar 30, 2023 at 02:58:38PM +0300, Sakari Ailus wrote:
> > > > V4L2 async sub-device matching originally used the device nodes only.
> > > > Endpoint nodes were taken into use instead as using the device nodes was
> > > > problematic for it was in some cases ambiguous which link might have been
> > > > in question.
> > > >
> > > > There is however no need to use endpoint nodes on both sides, as the async
> > > > sub-device's fwnode can always be trivially obtained using
> > > > fwnode_graph_get_remote_endpoint() when needed while what counts is
> > > > whether or not the link is between two device nodes, i.e. the device nodes
> > > > match.
> > > >
> > > 
> > > As you know I'm a bit debated.
> > > 
> > > Strict endpoint-matching requires one subdev to be registed per each
> > > endpoint, and this is tedious for drivers that have to register a
> > > subdev for each of its endpoints
> > > 
> > > Allowing a subdev to be matched multiple times on different endpoints
> > > gives a way for lazy drivers to take a shortcut and simplify their
> > > topologies to a single subdev, when they would actually need more.
> > 
> > I'd say this is really about interface design, not being "lazy". It depends
> > on the sub-device. Ideally the framework should be also as easy for drivers
> > drivers to use as possible.
> > 
> > What is not supported, though, is multiple sub-devices with a single device
> > node. Do we need that? At least I don't think I came across a driver that
> > would.
> 
> If I understand you correctly about multiple sub-device from a single 
> device node, this exists today. The ADV748x driver have a single device 
> node in DT and register multiple sub-devices, one for each source 
> endpoint.
> 
> The ADV748x have two CSI-2 transmitters, one 4-lane and one 1-lane as 
> well as two different video capture "ports" one HDMI and one CVBS. Both 
> capture ports can be active at the same time and routed internally 
> inside the ADV748x to the two different CSI-2 transmitters.
> 
> In order todo this the ADV748x register multiple subdevices and modifies 
> the fwnode to be the endpoint instead of the device node. So the change 
> in this patch for ADV748x driver would break that driver.

Ah, indeed. I guess I'll need to support that case as well then. It doesn't
seem to be troublesome to implement, but I'm tempted making it a special
case: every other driver would apparently be fine matching with device
fwnode whereas doing endpoint-to-endpoint matching adds complexity to the
drivers. This patch removes about 100 lines of rather ugly code largely
from v4l2-async.

There are other issues in the set with connection-subdev relations, I'll
post v2 to address those as well.

-- 
Kind regards,

Sakari Ailus
