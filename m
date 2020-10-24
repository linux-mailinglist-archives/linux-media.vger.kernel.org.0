Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6930297CD0
	for <lists+linux-media@lfdr.de>; Sat, 24 Oct 2020 16:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761993AbgJXO3Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Oct 2020 10:29:16 -0400
Received: from mga11.intel.com ([192.55.52.93]:9266 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1761987AbgJXO3Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Oct 2020 10:29:16 -0400
IronPort-SDR: RkK2q30kQWdlH+x/jPMxEPNl2DNOsSHHpofbH7qnRVrcaXFSm3lPGIxsQ+9WgneAiXym2X+Tr+
 jqfVABfn+ODQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9783"; a="164282692"
X-IronPort-AV: E=Sophos;i="5.77,412,1596524400"; 
   d="scan'208";a="164282692"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2020 07:29:15 -0700
IronPort-SDR: Bdj6yNfxOmMRJyy2+7q8WwAKzZFKlll+c5dYtGJ/eVi1WDBw14N3hnJR+wtMzvAuhDXIylyQoU
 bUveV2AWO3Mw==
X-IronPort-AV: E=Sophos;i="5.77,412,1596524400"; 
   d="scan'208";a="423687516"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2020 07:29:09 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id AD9A32063B; Sat, 24 Oct 2020 17:29:07 +0300 (EEST)
Date:   Sat, 24 Oct 2020 17:29:07 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dan Scally <djrscally@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Message-ID: <20201024142907.GB26150@paasikivi.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-8-djrscally@gmail.com>
 <20201020091958.GC4077@smile.fi.intel.com>
 <20201020120615.GV13341@paasikivi.fi.intel.com>
 <32bbb4db-17d7-b9d1-950f-8f29d67539c3@gmail.com>
 <20201020224910.GB2703@paasikivi.fi.intel.com>
 <20201024003955.GS5979@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201024003955.GS5979@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 24, 2020 at 03:39:55AM +0300, Laurent Pinchart wrote:
> Hi Sakari
> 
> On Wed, Oct 21, 2020 at 01:49:10AM +0300, Sakari Ailus wrote:
> > On Tue, Oct 20, 2020 at 08:56:07PM +0100, Dan Scally wrote:
> > > On 20/10/2020 13:06, Sakari Ailus wrote:
> > > > On Tue, Oct 20, 2020 at 12:19:58PM +0300, Andy Shevchenko wrote:
> > > >> On Mon, Oct 19, 2020 at 11:59:01PM +0100, Daniel Scally wrote:
> > > >>> fwnode_graph_get_endpoint_by_id() will optionally parse enabled devices
> > > >>> only; that status being determined through the .device_is_available() op
> > > >>> of the device's fwnode. As software_nodes don't have that operation and
> > > >>> adding it is meaningless, we instead need to check if the device's fwnode
> > > >>> is a software_node and if so pass the appropriate flag to disable that
> > > >>> check
> > > >> Period.
> > > >>
> > > >> I'm wondering if actually this can be hidden in fwnode_graph_get_endpoint_by_id().
> > > > The device availability test is actually there for a reason. Some firmware
> > > > implementations put all the potential devices in the tables and only one
> > > > (of some) of them are available.
> > > >
> > > > Could this be implemented so that if the node is a software node, then get
> > > > its parent and then see if that is available?
> > > >
> > > > I guess that could be implemented in software node ops. Any opinions?
> > > Actually when considering the cio2 device, it seems that
> > > set_secondary_fwnode() actually overwrites the _primary_, given
> > > fwnode_is_primary(dev->fwnode) returns false. So in at least some cases,
> > > this wouldn't work.
> > 
> > Ouch. I wonder when this happens --- have you checked what's the primary
> > there? I guess it might be if it's a PCI device without the corresponding
> > ACPI device node?
> > 
> > I remember you had an is_available implementation that just returned true
> > for software nodes in an early version of the set? I think it would still
> > be a lesser bad in this case.
> 
> How about the following ?

Looks good to me.

> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 81bd01ed4042..ea44ba846299 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -706,9 +706,14 @@ EXPORT_SYMBOL_GPL(fwnode_handle_put);
>  /**
>   * fwnode_device_is_available - check if a device is available for use
>   * @fwnode: Pointer to the fwnode of the device.
> + *
> + * For fwnode node types that don't implement the .device_is_available()
> + * operation, such as software nodes, this function returns true.
>   */
>  bool fwnode_device_is_available(const struct fwnode_handle *fwnode)
>  {
> +	if (!fwnode_has_op(fwnode, device_is_available))
> +		return true;
>  	return fwnode_call_bool_op(fwnode, device_is_available);
>  }
>  EXPORT_SYMBOL_GPL(fwnode_device_is_available);
> 

-- 
Sakari Ailus
