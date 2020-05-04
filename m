Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70BDC1C3553
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbgEDJNC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726467AbgEDJNB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 05:13:01 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8954EC061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 02:13:01 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id i10so19976241wrv.10
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 02:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sqXFPwMwxkvGrEH4NHzYVqyahQBbtw80ggDFiH189P4=;
        b=GX0fkyUOa2L0RgQlEE4JRcFFxmmMv6TXpM51+X6HIsPxyrRUcsWskp5gafZ55cxzBv
         Xf4vyArU9xpsDX+aOikVcd24dKuulXslgECiPgYzVM2R8GMxeUgtgB1E2Mw9ksEcz9DQ
         g9QAaCDnWrQTZRtKaxXIbDPYDmti0rBZwGWxDed/g1W+b0kzj33Q6DBw+cZHR3AiTlpo
         UsiDux44vPKt+1j+kBJCrgSe8iuGjTQTVYMZLJNh8ismVOYEtbFjl/4IDURHU0kBcyLn
         vJylFsYjpqxtUZfsovr8ROIf49tubwHzfDimkbn6rG2d4VrlUSkIJ5sAXaYYmmRd0LYS
         Qdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sqXFPwMwxkvGrEH4NHzYVqyahQBbtw80ggDFiH189P4=;
        b=Vwt98nerSb+CFgWtLNbvQ9APLs2brHi/6qUS+/xw2E0a/YNazpM3nYRoZ53+EVTRrn
         0q4z1m1IFt+O/wNSTavffT6T8tcWZvAX4tgtxh5Lv+HF0O/Bm71Ix/UhKEqEJSamphqM
         Jj4fEW+bhiosOISee9/TmBAbM9YrbI0PqVv7x9L+X1BE/ZgnoTCv1Fr3kqQqtulbAJH/
         R1/N2U/gaRIqEFSe6XED3iHpYTrC6o+bqF04AlsceBqzFKn9GZSoKX9+4gBVQxQcmg3h
         xbdXSLEJ9PGu/oOwwziNMV5/5PQZhrearZip1R/K/qYe+V9+4DlDEImryNV4qNmjsgOC
         1ikw==
X-Gm-Message-State: AGi0PubaR+F7YvbWFXKCi7ZwG6b+jpMYEzfzcVDrrvjyeFX9BagcIZRp
        BpLu+FmCK+orwQRIBQ1/8OodY157
X-Google-Smtp-Source: APiQypIa1gDzV7YatKvyda+/5ZnmriPEVpF1+i4dPxT0M5ZOge/lRmXVBKVrJVkM+th/wQpjopPzPQ==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr19597817wrp.39.1588583580095;
        Mon, 04 May 2020 02:13:00 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id e21sm18546110wrc.1.2020.05.04.02.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 02:12:59 -0700 (PDT)
Date:   Mon, 4 May 2020 10:12:57 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v6 14/22] media: imx7: mipi csis: Create media links in
 bound notifier
Message-ID: <20200504091257.dfvmye62ew44qgla@arch-thunder.localdomain>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
 <20200501171556.14731-15-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501171556.14731-15-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,
On Fri, May 01, 2020 at 10:15:48AM -0700, Steve Longerbeam wrote:
> Implement a notifier bound op to register media links from the remote
> sub-device's source pad(s) to the mipi csi-2 receiver sink pad.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui

> ---
> Changes in v5:
> - imx_media_create_fwnode_pad_link() has been moved to core as
>   v4l2_create_fwnode_links_to_pad().
> Changes in v4:
> - none
> Changes in v3:
> - call a local imx-media utility imx_media_create_fwnode_pad_link().
> Changes in v2:
> - Move notifier_to_csis_state() next to mipi_sd_to_csis_state(), remove
>   unnecessary inline, and rename to mipi_notifier_to_csis_state().
>   Suggested by Rui Silva.
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 7b5c3e662d0d..1025e42740f1 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -26,6 +26,7 @@
>  
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
>  #include <media/v4l2-subdev.h>
>  
>  #define CSIS_DRIVER_NAME			"imx7-mipi-csis"
> @@ -385,6 +386,12 @@ static int mipi_csis_dump_regs(struct csi_state *state)
>  	return 0;
>  }
>  
> +static struct csi_state *
> +mipi_notifier_to_csis_state(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct csi_state, notifier);
> +}
> +
>  static struct csi_state *mipi_sd_to_csis_state(struct v4l2_subdev *sdev)
>  {
>  	return container_of(sdev, struct csi_state, mipi_sd);
> @@ -948,6 +955,20 @@ static int mipi_csis_parse_dt(struct platform_device *pdev,
>  
>  static int mipi_csis_pm_resume(struct device *dev, bool runtime);
>  
> +static int mipi_csis_notify_bound(struct v4l2_async_notifier *notifier,
> +				  struct v4l2_subdev *sd,
> +				  struct v4l2_async_subdev *asd)
> +{
> +	struct csi_state *state = mipi_notifier_to_csis_state(notifier);
> +	struct media_pad *sink = &state->mipi_sd.entity.pads[CSIS_PAD_SINK];
> +
> +	return v4l2_create_fwnode_links_to_pad(sd, sink);
> +}
> +
> +static const struct v4l2_async_notifier_operations mipi_csis_notify_ops = {
> +	.bound = mipi_csis_notify_bound,
> +};
> +
>  static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
>  				 struct platform_device *pdev,
>  				 const struct v4l2_subdev_ops *ops)
> @@ -1016,6 +1037,8 @@ static int mipi_csis_async_register(struct csi_state *state)
>  
>  	fwnode_handle_put(ep);
>  
> +	state->notifier.ops = &mipi_csis_notify_ops;
> +
>  	ret = v4l2_async_subdev_notifier_register(&state->mipi_sd,
>  						  &state->notifier);
>  	if (ret)
> -- 
> 2.17.1
> 
