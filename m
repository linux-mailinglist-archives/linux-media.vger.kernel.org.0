Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74EE926ADFD
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 21:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgIOTsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 15:48:37 -0400
Received: from mga14.intel.com ([192.55.52.115]:46132 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727784AbgIOTsg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 15:48:36 -0400
IronPort-SDR: C/e1Hfk4jzRM/jGk8W2bMbyqozhi6Ixo8mBSEzOXVczAoA8KyIsUN4YjeZ2ujKK6HzqQRfGPc2
 D85Kw4XoNM5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="158618135"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; 
   d="scan'208";a="158618135"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2020 12:48:34 -0700
IronPort-SDR: FIhC517Di0zanHT6Hk8KEBh4TNgslsT16pfnEFFShxKkVRGbHayXjjENOLmjHJsiaw6ctLN3/Z
 21Y9791qKVMQ==
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; 
   d="scan'208";a="286943167"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2020 12:48:31 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0E96220628; Tue, 15 Sep 2020 22:48:29 +0300 (EEST)
Date:   Tue, 15 Sep 2020 22:48:29 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: v4l2-fwnode: Return -EINVAL for invalid bus-type
Message-ID: <20200915194828.GP26842@paasikivi.fi.intel.com>
References: <20200915155544.826-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915155544.826-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Tue, Sep 15, 2020 at 04:55:44PM +0100, Lad Prabhakar wrote:
> With the current implementation if invalid bus-type is passed via DT
> v4l2_fwnode_endpoint_parse() defaulted the mus-type to V4L2_MBUS_PARALLEL
> instead of returning error.

The default is dug from the rest of the properties, it could be different
from parallel. You could simply not mention the actual result, just that it
should have been an error.

> 
> This Patch adds V4L2_MBUS_INVALID entry to v4l2_mbus_type enum and when
> invalid bus-type is detected in v4l2_fwnode_endpoint_parse() it returns
> -EINVAL to the caller.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 6 +++++-
>  include/media/v4l2-mediabus.h         | 2 ++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index a4c3c77c1894..a6f3549eadd3 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -93,7 +93,7 @@ v4l2_fwnode_bus_type_to_mbus(enum v4l2_fwnode_bus_type type)
>  	const struct v4l2_fwnode_bus_conv *conv =
>  		get_v4l2_fwnode_bus_conv_by_fwnode_bus(type);
>  
> -	return conv ? conv->mbus_type : V4L2_MBUS_UNKNOWN;
> +	return conv ? conv->mbus_type : V4L2_MBUS_INVALID;
>  }
>  
>  static const char *
> @@ -436,6 +436,10 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
>  		 v4l2_fwnode_mbus_type_to_string(vep->bus_type),
>  		 vep->bus_type);
>  	mbus_type = v4l2_fwnode_bus_type_to_mbus(bus_type);
> +	if (mbus_type == V4L2_MBUS_INVALID) {
> +		pr_debug("unsupported bus type %u\n", bus_type);
> +		return -EINVAL;
> +	}
>  
>  	if (vep->bus_type != V4L2_MBUS_UNKNOWN) {
>  		if (mbus_type != V4L2_MBUS_UNKNOWN &&
> diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> index 45f88f0248c4..b4f630783cb7 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -78,6 +78,7 @@
>   * @V4L2_MBUS_CCP2:	CCP2 (Compact Camera Port 2)
>   * @V4L2_MBUS_CSI2_DPHY: MIPI CSI-2 serial interface, with D-PHY
>   * @V4L2_MBUS_CSI2_CPHY: MIPI CSI-2 serial interface, with C-PHY
> + * @V4L2_MBUS_INVALID:	invalid bus type (keep it last for sanity)

s/it last for sanity/as last/

>   */
>  enum v4l2_mbus_type {
>  	V4L2_MBUS_UNKNOWN,
> @@ -87,6 +88,7 @@ enum v4l2_mbus_type {
>  	V4L2_MBUS_CCP2,
>  	V4L2_MBUS_CSI2_DPHY,
>  	V4L2_MBUS_CSI2_CPHY,
> +	V4L2_MBUS_INVALID,
>  };
>  
>  /**

-- 
Regards,

Sakari Ailus
