Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E22293AF3
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 14:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394038AbgJTMG1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 08:06:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:53193 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393999AbgJTMG1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 08:06:27 -0400
IronPort-SDR: j3wCLvqRsMY84Oz8hFSIoM0Oe577WgyOd4/EqjjpTr0VVYapO2pIea9gn+1oqATmil2DeQUPSz
 9hTArwx2BDng==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="154138354"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="154138354"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 05:06:27 -0700
IronPort-SDR: 2sFYuGjqOi3pw8XFi+yYwrUwIN/TtMjL6TENxRXWuVyPCqDafH1HRsRD8sEvHoqgSLlRCCaDYn
 r4vye6O7Pgtg==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="358498529"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 05:06:17 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 493E92062D; Tue, 20 Oct 2020 15:06:15 +0300 (EEST)
Date:   Tue, 20 Oct 2020 15:06:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux.walleij@linaro.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, yong.zhi@intel.com, rafael@kernel.org,
        gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 7/9] ipu3-cio2: Check if pci_dev->dev's fwnode is
 a software_node in cio2_parse_firmware() and set
 FWNODE_GRAPH_DEVICE_DISABLED if so
Message-ID: <20201020120615.GV13341@paasikivi.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-8-djrscally@gmail.com>
 <20201020091958.GC4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020091958.GC4077@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Tue, Oct 20, 2020 at 12:19:58PM +0300, Andy Shevchenko wrote:
> On Mon, Oct 19, 2020 at 11:59:01PM +0100, Daniel Scally wrote:
> > fwnode_graph_get_endpoint_by_id() will optionally parse enabled devices
> > only; that status being determined through the .device_is_available() op
> > of the device's fwnode. As software_nodes don't have that operation and
> > adding it is meaningless, we instead need to check if the device's fwnode
> > is a software_node and if so pass the appropriate flag to disable that
> > check
> 
> Period.
> 
> I'm wondering if actually this can be hidden in fwnode_graph_get_endpoint_by_id().

The device availability test is actually there for a reason. Some firmware
implementations put all the potential devices in the tables and only one
(of some) of them are available.

Could this be implemented so that if the node is a software node, then get
its parent and then see if that is available?

I guess that could be implemented in software node ops. Any opinions?

-- 
Kind regards,

Sakari Ailus
