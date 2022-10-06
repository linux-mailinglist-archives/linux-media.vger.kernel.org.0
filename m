Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336605F6520
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 13:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbiJFLUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 07:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbiJFLUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 07:20:49 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F046F24F29;
        Thu,  6 Oct 2022 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665055248; x=1696591248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eVjakT2R76LOXKY8u4IZh2HVC/ewPG8SKlq4jIby030=;
  b=WqrkPi8e1D6On7w5JzLyLYSHhh5x5lkc1TUgJOD19i00A9lEXxCzVEA2
   OvaNb6rerTZ8Es+Sj3yr0hsk19d10whVrlCmXgFnwgkMYb8O8iM6p7n1T
   YnzsU4XZr6jPkwmDkKas3mhLoA+CDhYcEVc2X3tMCupw6VUhwJY0KOITV
   o4vg+74jhwxH/dHPvOWujF+mg3YJdMAi3YOSHotj1xg1H9BcBzU3Ymv2s
   Aa93pz4GHx87zEP3SW93xYXG0VFL4gcmzjTmT4bIEU2/NyV5TgtD+LpA0
   UwBZk4dqojg48hhXOEI4Ebkh+migLAeKWUIgDl6rlGq84/CQ7OpnKrzoi
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="365355030"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; 
   d="scan'208";a="365355030"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 04:20:46 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="575791672"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; 
   d="scan'208";a="575791672"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 04:20:34 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 2FEE7201DB;
        Thu,  6 Oct 2022 14:20:32 +0300 (EEST)
Date:   Thu, 6 Oct 2022 11:20:32 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, luca@lucaceresoli.net,
        ian.arkver.dev@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 00/31] v4l: add support for multiplexed streams
Message-ID: <Yz66ADqFVj2UY248@paasikivi.fi.intel.com>
References: <20190328200608.9463-1-jacopo+renesas@jmondi.org>
 <1510023a-a6aa-611e-8920-32b949ec5250@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510023a-a6aa-611e-8920-32b949ec5250@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Thu, Feb 11, 2021 at 03:44:56PM +0200, Tomi Valkeinen wrote:
> Hi all,
> 
> On 28/03/2019 22:05, Jacopo Mondi wrote:
> > Hello,
> >    new iteration of multiplexed stream support patch series.
> > 
> > V3 available at:
> > https://patchwork.kernel.org/cover/10839889/
> > 
> > V2 sent by Niklas is available at:
> > https://patchwork.kernel.org/cover/10573817/
> > 
> > Series available at:
> > git://jmondi.org/linux v4l2-mux/media-master/v4
> 
> I'm trying to understand how these changes can be used with virtual
> channels and also with embedded data.
> 
> I have an SoC with two CSI-2 RX ports, both of which connect to a
> processing block with 8 DMA engines. Each of the DMA engines can be
> programmed to handle a certain virtual channel and datatype.
> 
> The board has a multiplexer, connected to 4 cameras, and the multiplexer
> connects to SoC's CSI-2 RX port. This board has just one multiplexer
> connected, but, of course, both RX ports could have a multiplexer,
> amounting to total 8 cameras.
> 
> So, in theory, there could be 16 streams to be handled (4 pixel streams
> and 4 embedded data streams for both RX ports). With only 8 DMA engines
> available, the driver has to manage them dynamically, reserving a DMA
> engine when a stream is started.
> 
> My confusion is with the /dev/video nodes. I think it would be logical
> to create 8 of them, one for each DMA engine (or less, if I know there
> is only, say, 1 camera connected, in which case 2 nodes would be

For more complex devices, it is often not possible to define such a number.
Say, put an external ISP in between the sensor and the CSI-2 receiver, and
you may get more streams than you would from the sensor alone.

> enough). But in that case how does the user know what data is being
> received from that node? In other words, how to connect, say,
> /dev/video0 to second camera's embedded data stream?
> 
> Another option would be to create 16 /dev/video nodes, and document that
> first one maps to virtual channel 0 + pixel data, second to virtual
> channel 0 + embedded data, and so on. And only allow 8 of them to be
> turned on at a time. But I don't like this idea much.

This isn't great IMO as it is limited to pre-defined use cases.

> 
> The current driver architecture is such that the multiplexer is modeled
> with a subdev with 4 sink pads and one source pad, the SoC's RX ports
> are subdevs with a single sink and a single output pad, and then there
> are the video devices connected to RX's source pad.
> 
> And while I can connect the video node's pad to the source pad on either
> of the RX ports, I don't think I have any way to define which stream it
> receives.
> 
> Does that mean that each RX port subdev should instead have 8 source
> pads? Isn't a pad like a physical connection? There's really just one
> output from the RX port, with multiplexed streams, so 8 pads doesn't
> sound right.

If you have eight DMAs you should always have eight video nodes.

I would put one link between the sub-device and a video node, and handle
the incoming streams by routing them to the desired video nodes.

If there's any doubt about the approach, it needs to be documented in
driver documentation.

-- 
Terveisin,

Sakari Ailus
