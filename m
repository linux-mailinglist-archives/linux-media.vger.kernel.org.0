Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5125523B6B1
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 10:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729390AbgHDISH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 04:18:07 -0400
Received: from mga12.intel.com ([192.55.52.136]:20181 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbgHDISH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Aug 2020 04:18:07 -0400
IronPort-SDR: PK9eileLvzXHNVXQMTIVmNvyg7mAQ+KduJd+B03hK1GpoyUlIPCc6zXj8hc2gD132cDIhRjgFI
 wZ0aOJdpAs6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="131840845"
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="131840845"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2020 01:18:06 -0700
IronPort-SDR: lIPKwjOwt6Z/dHXBMxc2tUMS7VrggARADIVhJLj8dxURiyIUymmGIKXCbXECFxFk6hkn6KZVS2
 6EsbiN6ViElg==
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="330528978"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2020 01:18:03 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id F148D20686; Tue,  4 Aug 2020 11:18:01 +0300 (EEST)
Date:   Tue, 4 Aug 2020 11:18:01 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: i2c: ov5640: Fallback to parallel mode
Message-ID: <20200804081801.GD13316@paasikivi.fi.intel.com>
References: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596465107-14251-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596465107-14251-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Mon, Aug 03, 2020 at 03:31:47PM +0100, Lad Prabhakar wrote:
> Fallback to parallel mode if bus_type doesn't match the supported
> interfaces by the driver.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov5640.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 08c67250042f..4e88b0540740 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3074,6 +3074,12 @@ static int ov5640_probe(struct i2c_client *client)
>  		return ret;
>  	}
>  
> +	/* fallback to parallel mode */
> +	if (sensor->ep.bus_type != V4L2_MBUS_PARALLEL &&
> +	    sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY &&
> +	    sensor->ep.bus_type != V4L2_MBUS_BT656)
> +		sensor->ep.bus_type = V4L2_MBUS_PARALLEL;

You basically need the type from the v4l2_fwnode_endpoint_parse(), and if
you don't have any of the above bus types, probe should fail. The old
bindings were documented in a way that either parallel or CSI-2 bus will be
used, and there were no defaults. So all should be well.

-- 
Sakari Ailus
