Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2EA416E98C
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 16:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730866AbgBYPH1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 10:07:27 -0500
Received: from mga05.intel.com ([192.55.52.43]:24506 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729510AbgBYPH1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 10:07:27 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 07:07:27 -0800
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; 
   d="scan'208";a="284693145"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 07:07:22 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 39A9D2089D; Tue, 25 Feb 2020 17:07:21 +0200 (EET)
Date:   Tue, 25 Feb 2020 17:07:21 +0200
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
Message-ID: <20200225150721.GO5379@paasikivi.fi.intel.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
 <20200215194136.10131-3-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200215194136.10131-3-slongerbeam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Sat, Feb 15, 2020 at 11:41:21AM -0800, Steve Longerbeam wrote:
> Instead of allocating a notifier in v4l2_async_register_fwnode_subdev(),
> have the caller provide one. This allows the caller to implement
> notifier ops (bind, unbind).
> 
> The caller is now responsible for first initializing its notifier with a
> call to v4l2_async_notifier_init().
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

Instead of improving v4l2_async_register_fwnode_subdev(), could you convert
the users (IMX driver in this case) to call the preferred APIs instead? As
the lines below show, v4l2_async_register_fwnode_subdev() has only two
users left --- the other one of which is the IMX driver. After converting
these two, we could just remove this API.

See e.g. drivers/media/pci/intel/ipu3/ipu3-cio2.c and
drivers/media/platform/omap3isp/isp.c for examples.

> ---
> Changes in v3:
> - added the missing calls to unregister/cleanup the new subdev notifiers.
>   Reported by Rui Silva.
> ---
>  drivers/media/platform/video-mux.c         |  8 +++++++-
>  drivers/media/v4l2-core/v4l2-fwnode.c      | 11 +----------
>  drivers/staging/media/imx/imx6-mipi-csi2.c |  7 ++++++-
>  drivers/staging/media/imx/imx7-media-csi.c |  7 ++++++-
>  drivers/staging/media/imx/imx7-mipi-csis.c |  9 ++++++++-
>  include/media/v4l2-fwnode.h                | 12 ++++++++----
>  6 files changed, 36 insertions(+), 18 deletions(-)

-- 
Kind regards,

Sakari Ailus
