Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57E329453E
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 00:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410405AbgJTWtU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 18:49:20 -0400
Received: from mga09.intel.com ([134.134.136.24]:16074 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2410401AbgJTWtT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 18:49:19 -0400
IronPort-SDR: Sc7Ie1KyWDWWUzO9HwrLpjwuQM5oKyVlHLodTKY3qx7WFr8IHCQwpWgLjl85cv7v3FazxIqZlM
 7XfH/vtID5jQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="167407217"
X-IronPort-AV: E=Sophos;i="5.77,399,1596524400"; 
   d="scan'208";a="167407217"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 15:49:18 -0700
IronPort-SDR: 4KiBMEZzhtiQLObbYps0EonH2PxWkSsibGHJRBHbKboL9QF9BoQlRwfIm+RlrRrbTt2zTKbaAF
 8ls4rvJ5hBwg==
X-IronPort-AV: E=Sophos;i="5.77,399,1596524400"; 
   d="scan'208";a="358690253"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 15:49:12 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 06753206F4; Wed, 21 Oct 2020 01:49:11 +0300 (EEST)
Date:   Wed, 21 Oct 2020 01:49:10 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
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
Message-ID: <20201020224910.GB2703@paasikivi.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-8-djrscally@gmail.com>
 <20201020091958.GC4077@smile.fi.intel.com>
 <20201020120615.GV13341@paasikivi.fi.intel.com>
 <32bbb4db-17d7-b9d1-950f-8f29d67539c3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32bbb4db-17d7-b9d1-950f-8f29d67539c3@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Tue, Oct 20, 2020 at 08:56:07PM +0100, Dan Scally wrote:
> Hi Sakari
> 
> On 20/10/2020 13:06, Sakari Ailus wrote:
> > Hi Andy,
> >
> > On Tue, Oct 20, 2020 at 12:19:58PM +0300, Andy Shevchenko wrote:
> >> On Mon, Oct 19, 2020 at 11:59:01PM +0100, Daniel Scally wrote:
> >>> fwnode_graph_get_endpoint_by_id() will optionally parse enabled devices
> >>> only; that status being determined through the .device_is_available() op
> >>> of the device's fwnode. As software_nodes don't have that operation and
> >>> adding it is meaningless, we instead need to check if the device's fwnode
> >>> is a software_node and if so pass the appropriate flag to disable that
> >>> check
> >> Period.
> >>
> >> I'm wondering if actually this can be hidden in fwnode_graph_get_endpoint_by_id().
> > The device availability test is actually there for a reason. Some firmware
> > implementations put all the potential devices in the tables and only one
> > (of some) of them are available.
> >
> > Could this be implemented so that if the node is a software node, then get
> > its parent and then see if that is available?
> >
> > I guess that could be implemented in software node ops. Any opinions?
> Actually when considering the cio2 device, it seems that
> set_secondary_fwnode() actually overwrites the _primary_, given
> fwnode_is_primary(dev->fwnode) returns false. So in at least some cases,
> this wouldn't work.

Ouch. I wonder when this happens --- have you checked what's the primary
there? I guess it might be if it's a PCI device without the corresponding
ACPI device node?

I remember you had an is_available implementation that just returned true
for software nodes in an early version of the set? I think it would still
be a lesser bad in this case.

-- 
Regards,

Sakari Ailus
