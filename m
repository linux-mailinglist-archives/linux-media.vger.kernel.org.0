Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E652EF7EF
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 20:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbhAHTLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 14:11:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbhAHTLo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 14:11:44 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C062C061380
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 11:11:03 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id t30so10044579wrb.0
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 11:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QtMzxmCBGCQSHMaALvYkqn7vhbBC+eIYtIFJTz6xoEQ=;
        b=rf4K5w62W35Zc0YwblPNNE95xzcLRn+uuKLGAxCvKQIZF2KfAWw4y1ZIPpnatMSzn5
         9R159sojiFmAPXBD1Siss8YsqNqoWIk5XoO2AlldvtCElQrFNqJyhaYWyfyF3f01FCmZ
         DtdjSxJZAFQnX9PduiUXFGimVfIIhJdL1NpxANYt9HCegsWlhMP51cOz3ytlXixnZOUv
         YwpDDDKowvEQ2jOM0Wt3j2ucwUH4b2PGRiS3AgI4wvqKN7/Fag9YlEv7q+s/lvpRYnRn
         OUyhuXLAiRPXDBnwEnIxD045UWgrHUwR8ZLh9krukNr5bqTouuYofkfyIX7DNecrs0JU
         suzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QtMzxmCBGCQSHMaALvYkqn7vhbBC+eIYtIFJTz6xoEQ=;
        b=XiKvdmqRSaI2WMUU7WgSFf8DZRSI6iwxTmtm8+PXHl5PZKOiKbDBZbIPxE2YP7HWwx
         mnfXTuBtZ/VLnwEsJti2NbjlI326mhO+sIK0V0GUjNXmkCu0u7W9YzPkAF693tKwj17S
         +wE13YPhHKRs9PHBvmblo23KAvfJmXsOZf2ekBJdqO2eTAJhxoMP4q+MvtZoJKL0uJYC
         UbAQrwLDCwlt4pvPNUgQ1cNRjtonClfpX8dkoSaKxoRKcOOXjqC81lGd8IqFWH1J/6XF
         PvEGx2CV193bM8TWyR5WIu9b2MAtm4nguLwpPQ5EXn+bacYi7daEdDy1bms8g5Oc2z4Y
         BRQQ==
X-Gm-Message-State: AOAM533fpFv+9MxQnF3rWbCWyPK/ZnWLkeOAX91WPTtj1oLuOA1D2FmW
        PPXA6v9oY4XPYueDP2mXRtY=
X-Google-Smtp-Source: ABdhPJyWYbsL8QzBzUSPyqfMIKK6+bxBMQs+7aG9+DmhdzLbsBkDqX2to+JFHC75fSAclg02b2N8NA==
X-Received: by 2002:a5d:4e92:: with SMTP id e18mr5258486wru.66.1610133062180;
        Fri, 08 Jan 2021 11:11:02 -0800 (PST)
Received: from [172.30.88.198] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id w13sm14259727wrt.52.2021.01.08.11.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jan 2021 11:11:01 -0800 (PST)
Subject: Re: [PATCH] media: imx6-mipi-csi2: Call remote subdev get_mbus_config
 to get active lanes
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>
References: <20201229103102.45547-1-ezequiel@collabora.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <cdd4a805-13a7-ab1a-dcf6-1d22c2dde1e5@gmail.com>
Date:   Fri, 8 Jan 2021 11:10:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201229103102.45547-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 12/29/20 2:31 AM, Ezequiel Garcia wrote:
> Currently, the CSI2 subdevice is using the data-lanes from the
> neareast endpoint to config the CSI2 lanes.
>
> While this may work, the proper way to configure the hardware is
> to obtain the remote subdevice in v4l2_async_notifier_operations.bound(),
> and then call get_mbus_config using the remote subdevice to get
> the active lanes.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>   drivers/staging/media/imx/TODO             |  12 ---
>   drivers/staging/media/imx/imx6-mipi-csi2.c | 101 ++++++++++++++++++---
>   2 files changed, 90 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
> index 9cfc1c1e78dc..c575f419204a 100644
> --- a/drivers/staging/media/imx/TODO
> +++ b/drivers/staging/media/imx/TODO
> @@ -2,18 +2,6 @@
>   - The Frame Interval Monitor could be exported to v4l2-core for
>     general use.
>   
> -- The CSI subdevice parses its nearest upstream neighbor's device-tree
> -  bus config in order to setup the CSI. Laurent Pinchart argues that
> -  instead the CSI subdev should call its neighbor's g_mbus_config op
> -  (which should be propagated if necessary) to get this info. However
> -  Hans Verkuil is planning to remove the g_mbus_config op. For now this
> -  driver uses the parsed DT bus config method until this issue is
> -  resolved.

This TODO was actually referring to the fwnode endpoint parsing in 
imx-media-csi.c, not imx6-mipi-csi2.c.

But the same conversion to call .get_mbus_config() instead of endpoint 
parsing could be done in imx-media-csi.c, but there is one imx6 
constraint that is preventing this from happening. The imx6 reference 
manual states that if the CSI is receiving from an input parallel bus 
that is 16-bits wide, the data must go directly to memory via the SMFC 
and not be sent to the IPU's Image Converter ("passthrough" mode):

"37.4.3.9 16 bit camera support

Devices that support 16 bit data bus can be connected to the CSI. This 
can be done in one
of the following ways.

16 bit YUV422
In this mode the CSI receives 2 components per cycle. The CSI is 
programmed to
accept the data as 16 bit generic data. The captured data will be stored 
in the memory
through the SMFC. The IDMAC needs to be programmed to store 16bit 
generic data.
When the data is read back from the memory for further processing in the 
IPU it will
be read as YUV422 data."

Same is said for RGB data to the CSI.

I'm not sure if this restriction is real or not. If this restriction 
were ignored, the fwnode endpoint check "ep->bus.parallel.bus_width >= 
16" could be removed and the only remaining info required to determine 
passthrough mode is available from 'struct v4l2_mbus_config' and the 
input mbus codes, thus allowing the conversion to .get_mbus_config().

Steve


> -
> -  2020-06: g_mbus has been removed in favour of the get_mbus_config pad
> -  operation which should be used to avoid parsing the remote endpoint
> -  configuration.
> -
>   - This media driver supports inheriting V4L2 controls to the
>     video capture devices, from the subdevices in the capture device's
>     pipeline. The controls for each capture device are updated in the
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index 94d87d27d389..bf6a61dd34c2 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -42,7 +42,10 @@ struct csi2_dev {
>   	struct clk             *pllref_clk;
>   	struct clk             *pix_clk; /* what is this? */
>   	void __iomem           *base;
> -	struct v4l2_fwnode_bus_mipi_csi2 bus;
> +
> +	struct v4l2_subdev	*remote;
> +	unsigned int		remote_pad;
> +	unsigned short		data_lanes;
>   
>   	/* lock to protect all members below */
>   	struct mutex lock;
> @@ -138,10 +141,8 @@ static void csi2_enable(struct csi2_dev *csi2, bool enable)
>   	}
>   }
>   
> -static void csi2_set_lanes(struct csi2_dev *csi2)
> +static void csi2_set_lanes(struct csi2_dev *csi2, unsigned int lanes)
>   {
> -	int lanes = csi2->bus.num_data_lanes;
> -
>   	writel(lanes - 1, csi2->base + CSI2_N_LANES);
>   }
>   
> @@ -250,12 +251,13 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
>   }
>   
>   /* Waits for low-power LP-11 state on data and clock lanes. */
> -static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
> +static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2,
> +				     unsigned int lanes)
>   {
>   	u32 mask, reg;
>   	int ret;
>   
> -	mask = PHY_STOPSTATECLK | (((1 << csi2->bus.num_data_lanes) - 1) <<
> +	mask = PHY_STOPSTATECLK | (((1 << lanes) - 1) <<
>   				   PHY_STOPSTATEDATA_BIT);
>   
>   	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
> @@ -300,8 +302,56 @@ static void csi2ipu_gasket_init(struct csi2_dev *csi2)
>   	writel(reg, csi2->base + CSI2IPU_GASKET);
>   }
>   
> +static int csi2_get_active_lanes(struct csi2_dev *csi2, unsigned int *lanes)
> +{
> +	struct v4l2_mbus_config mbus_config = { 0 };
> +	unsigned int num_lanes = UINT_MAX;
> +	int ret;
> +
> +	*lanes = csi2->data_lanes;
> +
> +	ret = v4l2_subdev_call(csi2->remote, pad, get_mbus_config,
> +			       csi2->remote_pad, &mbus_config);
> +	if (ret == -ENOIOCTLCMD) {
> +		dev_dbg(csi2->dev, "No remote mbus configuration available\n");
> +		return 0;
> +	}
> +
> +	if (ret) {
> +		dev_err(csi2->dev, "Failed to get remote mbus configuration\n");
> +		return ret;
> +	}
> +
> +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> +		dev_err(csi2->dev, "Unsupported media bus type %u\n",
> +			mbus_config.type);
> +		return -EINVAL;
> +	}
> +
> +	if (mbus_config.flags & V4L2_MBUS_CSI2_1_LANE)
> +		num_lanes = 1;
> +	else if (mbus_config.flags & V4L2_MBUS_CSI2_2_LANE)
> +		num_lanes = 2;
> +	else if (mbus_config.flags & V4L2_MBUS_CSI2_3_LANE)
> +		num_lanes = 3;
> +	else if (mbus_config.flags & V4L2_MBUS_CSI2_4_LANE)
> +		num_lanes = 4;
> +
> +	if (num_lanes > csi2->data_lanes) {
> +		dev_err(csi2->dev,
> +			"Unsupported mbus config: too many data lanes %u\n",
> +			num_lanes);
> +		return -EINVAL;
> +	}
> +
> +	*lanes = num_lanes;
> +
> +	return 0;
> +}
> +
>   static int csi2_start(struct csi2_dev *csi2)
>   {
> +	unsigned int lanes;
>   	int ret;
>   
>   	ret = clk_prepare_enable(csi2->pix_clk);
> @@ -316,12 +366,16 @@ static int csi2_start(struct csi2_dev *csi2)
>   	if (ret)
>   		goto err_disable_clk;
>   
> +	ret = csi2_get_active_lanes(csi2, &lanes);
> +	if (ret)
> +		goto err_disable_clk;
> +
>   	/* Step 4 */
> -	csi2_set_lanes(csi2);
> +	csi2_set_lanes(csi2, lanes);
>   	csi2_enable(csi2, true);
>   
>   	/* Step 5 */
> -	csi2_dphy_wait_stopstate(csi2);
> +	csi2_dphy_wait_stopstate(csi2, lanes);
>   
>   	/* Step 6 */
>   	ret = v4l2_subdev_call(csi2->src_sd, video, s_stream, 1);
> @@ -544,12 +598,37 @@ static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
>   {
>   	struct csi2_dev *csi2 = notifier_to_dev(notifier);
>   	struct media_pad *sink = &csi2->sd.entity.pads[CSI2_SINK_PAD];
> +	int pad;
> +
> +	pad = media_entity_get_fwnode_pad(&sd->entity, asd->match.fwnode,
> +					  MEDIA_PAD_FL_SOURCE);
> +	if (pad < 0) {
> +		dev_err(csi2->dev, "Failed to find pad for %s\n", sd->name);
> +		return pad;
> +	}
> +
> +	csi2->remote = sd;
> +	csi2->remote_pad = pad;
> +
> +	dev_dbg(csi2->dev, "Bound %s pad: %d\n", sd->name, pad);
>   
>   	return v4l2_create_fwnode_links_to_pad(sd, sink);
>   }
>   
> +static void csi2_notify_unbind(struct v4l2_async_notifier *notifier,
> +			       struct v4l2_subdev *sd,
> +			       struct v4l2_async_subdev *asd)
> +{
> +	struct csi2_dev *csi2 = notifier_to_dev(notifier);
> +
> +	csi2->remote = NULL;
> +
> +	dev_dbg(csi2->dev, "Unbind %s\n", sd->name);
> +}
> +
>   static const struct v4l2_async_notifier_operations csi2_notify_ops = {
>   	.bound = csi2_notify_bound,
> +	.unbind = csi2_notify_unbind,
>   };
>   
>   static int csi2_async_register(struct csi2_dev *csi2)
> @@ -572,10 +651,10 @@ static int csi2_async_register(struct csi2_dev *csi2)
>   	if (ret)
>   		goto err_parse;
>   
> -	csi2->bus = vep.bus.mipi_csi2;
> +	csi2->data_lanes = vep.bus.mipi_csi2.num_data_lanes;
>   
> -	dev_dbg(csi2->dev, "data lanes: %d\n", csi2->bus.num_data_lanes);
> -	dev_dbg(csi2->dev, "flags: 0x%08x\n", csi2->bus.flags);
> +	dev_dbg(csi2->dev, "data lanes: %d\n", vep.bus.mipi_csi2.num_data_lanes);
> +	dev_dbg(csi2->dev, "flags: 0x%08x\n", vep.bus.mipi_csi2.flags);
>   
>   	asd = kzalloc(sizeof(*asd), GFP_KERNEL);
>   	if (!asd) {

