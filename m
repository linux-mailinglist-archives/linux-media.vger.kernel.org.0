Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E2B30A003
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 02:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhBAB3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Jan 2021 20:29:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhBAB3K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Jan 2021 20:29:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E998CC061573
        for <linux-media@vger.kernel.org>; Sun, 31 Jan 2021 17:28:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CB74556;
        Mon,  1 Feb 2021 02:28:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1612142906;
        bh=e49V97/JGvAkXHuM3RgAN0QOb5KjVlBzT2JcgJQ2yfA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TcsgxbpuL3JDl0F4lg+R+eds4aIqm5+AXLnI53IKMGSXcogYR4xH/BSsuuf1+ecCN
         XdxLD5/KDYq/5X4cLClLmtBzHmnwMP7z2BWhrazOKe97kbMR2qMG0aNvhg9fQP02mR
         kbbskWCHfashAzqou6ovLupfquHREdK+tZmq1NHg=
Date:   Mon, 1 Feb 2021 03:28:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Adrian Fiergolski <adrian.fiergolski@fastree3d.com>,
        niklas.soderlund+renesas@ragnatech.se, linux-media@vger.kernel.org,
        vishal.sagar@xilinx.com
Subject: Re: v4l: status of 'add support for multiplexed streams' patch
Message-ID: <YBdZJpTfgiipt3IK@pendragon.ideasonboard.com>
References: <ad1f038f-f067-89f6-9dc6-4b423d719fc5@fastree3d.com>
 <20210129222654.GL32460@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210129222654.GL32460@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Sat, Jan 30, 2021 at 12:26:54AM +0200, Sakari Ailus wrote:
> On Mon, Jan 25, 2021 at 03:08:56PM +0100, Adrian Fiergolski wrote:
> > Dear Niklas,
> > 
> > Thank you for your 'v4l: add support for multiplexed streams' patch [1].
> > 
> > What is the status of merging your development with v4l-utils? Version
> > 1.16.5 doesn't provide --get/set-routing options. Also in the master of
> > v4l-utils I haven't found your code.
> > 
> > What is the current way of changing routing the video switches (e.g.
> > xilinx-axis-swtich which is not yet in the mainstream kernel)?
> > 
> > [1] https://lwn.net/Articles/782479/
> 
> I seem to have something here:
> 
> <URL:https://git.retiisi.eu/?p=~sailus/v4l-utils.git;a=shortlog;h=refs/heads/routing>
> 
> It hasn't been tested for some time though. The header update patches need
> to be reworked but the media-ctl + libv4l2subdev patches probably rebase
> just fine.

I've recently rebased the latest version of the patches (exclusing the
changes to the Renesas drivers) that was posted to the linux-media
mailing list, and have pushed the result to 

	git://linuxtv.org/pinchartl/media.git muxed-streams

This has only been compile-tested so far, and I hope to test it on real
hardware soon.

-- 
Regards,

Laurent Pinchart
