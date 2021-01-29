Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983AE309013
	for <lists+linux-media@lfdr.de>; Fri, 29 Jan 2021 23:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbhA2W2o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jan 2021 17:28:44 -0500
Received: from mga17.intel.com ([192.55.52.151]:56768 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233401AbhA2W2n (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jan 2021 17:28:43 -0500
IronPort-SDR: 9ydgOTcYgB0FT4MKq+PEPTRIp7RaO+PaOZUTNHaLAFQ6k01H2YJU+y1IwSjv1zXkPHQ9hGJjGP
 rZ5rPa6lI8Ig==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="160264163"
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; 
   d="scan'208";a="160264163"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 14:26:57 -0800
IronPort-SDR: Tx9XirJDZ+EEdbNeGVbKfJ27FQ2nM2xZJR8TKnSXGCiRoJAUc05e/Rm6XpuM51l+2mg8zlqAjO
 rvYBL1HlPUpg==
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; 
   d="scan'208";a="576605851"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 14:26:56 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 565E2205FC; Sat, 30 Jan 2021 00:26:54 +0200 (EET)
Date:   Sat, 30 Jan 2021 00:26:54 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Adrian Fiergolski <adrian.fiergolski@fastree3d.com>
Cc:     niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        vishal.sagar@xilinx.com
Subject: Re: v4l: status of 'add support for multiplexed streams' patch
Message-ID: <20210129222654.GL32460@paasikivi.fi.intel.com>
References: <ad1f038f-f067-89f6-9dc6-4b423d719fc5@fastree3d.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad1f038f-f067-89f6-9dc6-4b423d719fc5@fastree3d.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adrian,

On Mon, Jan 25, 2021 at 03:08:56PM +0100, Adrian Fiergolski wrote:
> Dear Niklas,
> 
> Thank you for your 'v4l: add support for multiplexed streams' patch [1].
> 
> What is the status of merging your development with v4l-utils? Version
> 1.16.5 doesn't provide --get/set-routing options. Also in the master of
> v4l-utils I haven't found your code.
> 
> What is the current way of changing routing the video switches (e.g.
> xilinx-axis-swtich which is not yet in the mainstream kernel)?
> 
> [1] https://lwn.net/Articles/782479/

I seem to have something here:

<URL:https://git.retiisi.eu/?p=~sailus/v4l-utils.git;a=shortlog;h=refs/heads/routing>

It hasn't been tested for some time though. The header update patches need
to be reworked but the media-ctl + libv4l2subdev patches probably rebase
just fine.

-- 
Regards,

Sakari Ailus
