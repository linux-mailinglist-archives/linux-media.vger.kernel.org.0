Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB6B268526
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 08:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726051AbgINGyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 02:54:20 -0400
Received: from mga01.intel.com ([192.55.52.88]:33536 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgINGyU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 02:54:20 -0400
IronPort-SDR: 9z7zLBqthAIuv2/W1wASKCv2JFUZPMQcJObAD3FqMuugDfJLE7QjmXrTGDyhaq4rb4hP7rs8Fl
 iRnRmNyioq5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="177092748"
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; 
   d="scan'208";a="177092748"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2020 23:54:19 -0700
IronPort-SDR: pdEiVDhMyKt7oIChbRSjZKBN4EcgjafmPS4ykn+81MtIwHwnqFCNhEEN4umDbCbm4DxCu/3qLv
 5KhEZ4b/34+g==
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; 
   d="scan'208";a="286329780"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2020 23:54:17 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9E6CE20815; Mon, 14 Sep 2020 09:54:15 +0300 (EEST)
Date:   Mon, 14 Sep 2020 09:54:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v4 1/3] media: i2c: ov772x: Parse endpoint properties
Message-ID: <20200914065415.GK26842@paasikivi.fi.intel.com>
References: <20200913184247.618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200913184247.618-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200913184247.618-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thanks for the patchset.

On Sun, Sep 13, 2020 at 07:42:45PM +0100, Lad Prabhakar wrote:
> Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
> to determine bus-type and store it locally in priv data.
> 
> Also for backward compatibility with the existing DT where bus-type
> isnt specified fallback to V4L2_MBUS_PARALLEL.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov772x.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 2cc6a678069a..551082aa7026 100644
> --- a/drivers/media/i2c/ov772x.c
> +++ b/drivers/media/i2c/ov772x.c
> @@ -31,6 +31,7 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
>  #include <media/v4l2-image-sizes.h>
>  #include <media/v4l2-subdev.h>
>  
> @@ -434,6 +435,7 @@ struct ov772x_priv {
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	struct media_pad pad;
>  #endif
> +	enum v4l2_mbus_type		  bus_type;
>  };
>  
>  /*
> @@ -1354,6 +1356,8 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
>  
>  static int ov772x_probe(struct i2c_client *client)
>  {
> +	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
> +	struct fwnode_handle	*ep;
>  	struct ov772x_priv	*priv;
>  	int			ret;
>  	static const struct regmap_config ov772x_regmap_config = {
> @@ -1415,6 +1419,26 @@ static int ov772x_probe(struct i2c_client *client)
>  		goto error_clk_put;
>  	}
>  
> +	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> +					    NULL);
> +	if (!ep) {
> +		dev_err(&client->dev, "endpoint node not found\n");
> +		ret = -EINVAL;
> +		goto error_clk_put;
> +	}
> +
> +	bus_cfg.bus_type = V4L2_MBUS_PARALLEL;
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	priv->bus_type = bus_cfg.bus_type;
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +	if (ret) {
> +		/* For backward compatibility with the existing DT where
> +		 * bus-type isnt specified fallback to V4L2_MBUS_PARALLEL

"isn't", "fall back", and a period, please.

> +		 */
> +		priv->bus_type = V4L2_MBUS_PARALLEL;
> +		dev_notice(&client->dev, "Falling back to V4L2_MBUS_PARALLEL mode\n");

I'd just use dev_dbg().

> +	}
> +
>  	ret = ov772x_video_probe(priv);
>  	if (ret < 0)
>  		goto error_gpio_put;

-- 
Regards,

Sakari Ailus
