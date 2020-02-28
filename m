Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196D11741FC
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 23:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgB1W1V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 17:27:21 -0500
Received: from mga14.intel.com ([192.55.52.115]:63312 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725957AbgB1W1V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 17:27:21 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Feb 2020 14:27:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,497,1574150400"; 
   d="scan'208";a="227683345"
Received: from jkalwas-mobl.ger.corp.intel.com (HELO mara.localdomain) ([10.249.154.47])
  by orsmga007.jf.intel.com with ESMTP; 28 Feb 2020 14:27:16 -0800
Received: from sailus by mara.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1j7o6B-0000Ha-Ij; Sat, 29 Feb 2020 00:27:13 +0200
Date:   Sat, 29 Feb 2020 00:27:10 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RESEND PATCH v3 02/17] media: v4l2-fwnode: Pass notifier to
 v4l2_async_register_fwnode_subdev()
Message-ID: <20200228222710.GA1068@mara.localdomain>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
 <20200215194136.10131-3-slongerbeam@gmail.com>
 <20200225150721.GO5379@paasikivi.fi.intel.com>
 <c9b232d6-07c9-d13d-18aa-3e1e640aadc2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9b232d6-07c9-d13d-18aa-3e1e640aadc2@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Btw. I think probably a smaller list of recipients would be just fine on the
next version.

On Fri, Feb 28, 2020 at 10:16:06AM -0800, Steve Longerbeam wrote:
> Hi Sakari,
> 
> On 2/25/20 7:07 AM, Sakari Ailus wrote:
> > Hi Steve,
> > 
> > On Sat, Feb 15, 2020 at 11:41:21AM -0800, Steve Longerbeam wrote:
> > > Instead of allocating a notifier in v4l2_async_register_fwnode_subdev(),
> > > have the caller provide one. This allows the caller to implement
> > > notifier ops (bind, unbind).
> > > 
> > > The caller is now responsible for first initializing its notifier with a
> > > call to v4l2_async_notifier_init().
> > > 
> > > Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> > Instead of improving v4l2_async_register_fwnode_subdev(), could you convert
> > the users (IMX driver in this case) to call the preferred APIs instead? As
> > the lines below show, v4l2_async_register_fwnode_subdev() has only two
> > users left --- the other one of which is the IMX driver. After converting
> > these two, we could just remove this API.
> > 
> > See e.g. drivers/media/pci/intel/ipu3/ipu3-cio2.c and
> > drivers/media/platform/omap3isp/isp.c for examples.
> 
> Shouldn't v4l2_async_notifier_add_fwnode_remote_subdev() check for the
> availability of the remote before adding it to the notifier's asd list, as
> in:
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c
> b/drivers/media/v4l2-core/v4l2-async.c
> index 8bde33c21ce4..b48ed68c6c6c 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -615,7 +615,7 @@ v4l2_async_notifier_add_fwnode_remote_subdev(struct
> v4l2_async_notifier *notif,
>         int ret;
> 
>         remote = fwnode_graph_get_remote_port_parent(endpoint);
> -       if (!remote)
> +       if (!remote || !fwnode_device_is_available(remote))
>                 return -ENOTCONN;
> 
>         asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> 
> 
> Otherwise we are back to the problem that the notifier will never complete
> because the remote's driver is not probed.

fwnode_graph_get_endpoint_by_id() only gives you endpoints that belong to an
enabled device (unless requested otherwise). So the there's need to check
the same in v4l2-fwnode.c.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
