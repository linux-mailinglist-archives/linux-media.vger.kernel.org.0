Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5C4A6F0352
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 11:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243348AbjD0JXa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 05:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243312AbjD0JXP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 05:23:15 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 251FC2119
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682587392; x=1714123392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VH7l9ym6TVS6TnDV5MZawl2wGGHPy9IAQbQo7Z+7dWU=;
  b=iedT0i8EDD5lNArMfX3n1B7DogFbOUfXUcpl9sE2NX0mPMa0lVeQh1Nb
   vtvrEuBTCzSmQ6WPHUGvdvkBTX5igfGudCKpsZ+ok0wDuTpuWmvWngORC
   /gKRiULgddXGEYJjgQSxLSjNCarlllCw3RsKydehDFSnYaaGLC1OlSYx6
   o0nV3cPM3gTGQTtV9AUjVD2vTyHkueamldl5QdVD2rdwGrnUVVSeB07GR
   voRUrLDL4HmpVdqJ/W7BOikzXdHxcJOqJE7hyYZGFlOlQLY6/A6upBqrW
   kswbczThrHvMa9k8KdMTCZyIpITCfesIYnRrVf1yzyLjcZRS61j72sGLE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="346144848"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="346144848"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 02:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="763718355"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="763718355"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 02:23:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1A0F911FC9F;
        Thu, 27 Apr 2023 12:23:06 +0300 (EEST)
Date:   Thu, 27 Apr 2023 12:23:06 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 03/18] media: v4l: async: Simplify async sub-device
 fwnode matching
Message-ID: <ZEo++qRSSAoeJWi+@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-4-sakari.ailus@linux.intel.com>
 <dpw2fvycehgud3ijdzppy24bep2a54ceceksmifetczikdmgeq@ok4vru42ocvy>
 <ZDkz/DcjzayyokAQ@kekkonen.localdomain>
 <ZEbWdoATJN2JoK9B@oden.dyn.berto.se>
 <ZEbZcvaAp7ExU7KA@kekkonen.localdomain>
 <20230425013742.GL4921@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425013742.GL4921@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Apr 25, 2023 at 04:37:42AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Mon, Apr 24, 2023 at 10:33:06PM +0300, Sakari Ailus wrote:
> > On Mon, Apr 24, 2023 at 09:20:22PM +0200, Niklas Söderlund wrote:
> > > On 2023-04-14 14:07:40 +0300, Sakari Ailus wrote:
> > > > On Thu, Apr 13, 2023 at 06:50:04PM +0200, Jacopo Mondi wrote:
> > > > > On Thu, Mar 30, 2023 at 02:58:38PM +0300, Sakari Ailus wrote:
> > > > > > V4L2 async sub-device matching originally used the device nodes only.
> > > > > > Endpoint nodes were taken into use instead as using the device nodes was
> > > > > > problematic for it was in some cases ambiguous which link might have been
> > > > > > in question.
> > > > > >
> > > > > > There is however no need to use endpoint nodes on both sides, as the async
> > > > > > sub-device's fwnode can always be trivially obtained using
> > > > > > fwnode_graph_get_remote_endpoint() when needed while what counts is
> > > > > > whether or not the link is between two device nodes, i.e. the device nodes
> > > > > > match.
> > > > > 
> > > > > As you know I'm a bit debated.
> > > > > 
> > > > > Strict endpoint-matching requires one subdev to be registed per each
> > > > > endpoint, and this is tedious for drivers that have to register a
> > > > > subdev for each of its endpoints
> > > > > 
> > > > > Allowing a subdev to be matched multiple times on different endpoints
> > > > > gives a way for lazy drivers to take a shortcut and simplify their
> > > > > topologies to a single subdev, when they would actually need more.
> > > > 
> > > > I'd say this is really about interface design, not being "lazy". It depends
> > > > on the sub-device. Ideally the framework should be also as easy for drivers
> > > > drivers to use as possible.
> > > > 
> > > > What is not supported, though, is multiple sub-devices with a single device
> > > > node. Do we need that? At least I don't think I came across a driver that
> > > > would.
> > > 
> > > If I understand you correctly about multiple sub-device from a single 
> > > device node, this exists today. The ADV748x driver have a single device 
> > > node in DT and register multiple sub-devices, one for each source 
> > > endpoint.
> > > 
> > > The ADV748x have two CSI-2 transmitters, one 4-lane and one 1-lane as 
> > > well as two different video capture "ports" one HDMI and one CVBS. Both 
> > > capture ports can be active at the same time and routed internally 
> > > inside the ADV748x to the two different CSI-2 transmitters.
> > > 
> > > In order todo this the ADV748x register multiple subdevices and modifies 
> > > the fwnode to be the endpoint instead of the device node. So the change 
> > > in this patch for ADV748x driver would break that driver.
> > 
> > Ah, indeed. I guess I'll need to support that case as well then. It doesn't
> > seem to be troublesome to implement, but I'm tempted making it a special
> > case: every other driver would apparently be fine matching with device
> > fwnode whereas doing endpoint-to-endpoint matching adds complexity to the
> > drivers. This patch removes about 100 lines of rather ugly code largely
> > from v4l2-async.
> 
> It's only 50 lines from v4l2-async, and I don't think the code is uglier
> than the rest of the file :-) In general, I prefer implementing tricky
> code in the framework and simplifying drivers. I think our goals align
> there, the framework should do the right thing by default for the
> majority of cases. However, as Niklas pointed out, endpoint matching is
> needed for drivers that register multiple subdevs with external
> connections (such as the adv742x), and that's exactly why endpoint
> matching was added in the first place. I think this needs to be kept.

I'm certainly fine with keeping functionality that driver needs and indeed
did not intend to break it. However I'd like to simplify this for majority
of drivers, this one can use additional APIs to get the job done.

I'll address this in v2.

-- 
Regards,

Sakari Ailus
