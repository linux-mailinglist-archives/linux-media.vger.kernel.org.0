Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387F42937D6
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 11:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392382AbgJTJTD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 05:19:03 -0400
Received: from mga17.intel.com ([192.55.52.151]:5080 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391205AbgJTJTC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 05:19:02 -0400
IronPort-SDR: wUhLC7L0YMUAyXGslRYhDFncWBGA6nDdYjtltzZqh3iLrFA72c/jMz+rQFY3zZ5j/4cqgv6C6K
 y6BaMqsQa2hA==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="147037018"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="147037018"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:19:02 -0700
IronPort-SDR: CMrq0FA3VNHs1JPZfErt9eYtSM2/0dTXWFAK82KHqJWn7lss5wKkvYs8tOkD0mq7vjXcBNGeE2
 APKZzZG9GLkw==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="353272831"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:18:56 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUnoE-00BJu4-Lr; Tue, 20 Oct 2020 12:19:58 +0300
Date:   Tue, 20 Oct 2020 12:19:58 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com, dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 7/9] ipu3-cio2: Check if pci_dev->dev's fwnode is
 a software_node in cio2_parse_firmware() and set
 FWNODE_GRAPH_DEVICE_DISABLED if so
Message-ID: <20201020091958.GC4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-8-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-8-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 19, 2020 at 11:59:01PM +0100, Daniel Scally wrote:
> fwnode_graph_get_endpoint_by_id() will optionally parse enabled devices
> only; that status being determined through the .device_is_available() op
> of the device's fwnode. As software_nodes don't have that operation and
> adding it is meaningless, we instead need to check if the device's fwnode
> is a software_node and if so pass the appropriate flag to disable that
> check

Period.

I'm wondering if actually this can be hidden in fwnode_graph_get_endpoint_by_id().

-- 
With Best Regards,
Andy Shevchenko


