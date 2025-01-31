Return-Path: <linux-media+bounces-25476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0542AA240AC
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 827BE188A564
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DC61F37B9;
	Fri, 31 Jan 2025 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ihKB4EW3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257E61E9918
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341202; cv=none; b=TFa7RHrlRv0rv3Kx2JEPL2DF6O3VsESeHJjw3TpLKjyFsEOp9TCAASNt/YZ41/koSZeHeSCOITn429rMY+rleEasPD6DvBvfcryHnsF4pCEjehRcwPpVEMLCzuOdQQpiMjjPltMt06/mYfax10ZseeUvqLCLkM6YRs52wWBGoRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341202; c=relaxed/simple;
	bh=g/K8pA6c6joiOMtd5AiWs4+FlCBtWbixOOpu1PV06B4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mh21bPjt2hjgJbq8zg+45BaxH2qHpGIQTXJJL5rLqSts/rHTvtfKAyc+cD6WUxIFIB36QHP0TaLv0fxOye612y8lGM/vuXIv8XMDVdlG4z8U/IJD0hMRInpoqVq7sIS/z1E8c0PZ5i6PPTw7X0xHsEH6+P7GFv8xLqPRi2+VJl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ihKB4EW3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29DCAB63;
	Fri, 31 Jan 2025 17:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738341125;
	bh=g/K8pA6c6joiOMtd5AiWs4+FlCBtWbixOOpu1PV06B4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ihKB4EW3cNbgSpJn3xMggxmd5C7a+TwLeNYkV0qo9NDYGyxMXtNbTp4/oZLI5urMg
	 PwnMcbztPH58OR4/pSCXTVgAlLO/uPrltqka5s8VKms+MuUgsVZNflXi2ktc5homBB
	 YRdIX37gDFbKYm/ALiDLVVO29AwAcVsisjTaUiNs=
Message-ID: <d2cf5d7e-808b-4283-afbf-664913362369@ideasonboard.com>
Date: Fri, 31 Jan 2025 18:33:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 8/9] media: ivsc: csi: Obtain link frequency from the
 media pad
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi
 <yong.zhi@intel.com>, Dan Scally <djrscally@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benoit Parrot <bparrot@ti.com>, Ricardo Ribalda <ribalda@chromium.org>,
 "Duc-Long, Le" <duclong.linux@gmail.com>
References: <20250120110157.152732-1-sakari.ailus@linux.intel.com>
 <20250120110157.152732-9-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250120110157.152732-9-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/01/2025 13:01, Sakari Ailus wrote:
> Support the use of the media pad for obtaining the link frequency.
> Similarly, call the v4l2_get_link_freq() on the media pad, not on the
> remote's control handler.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/pci/intel/ivsc/mei_csi.c | 78 +++++++++-----------------
>   1 file changed, 26 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
> index 2a9c12c975ca..545de4654609 100644
> --- a/drivers/media/pci/intel/ivsc/mei_csi.c
> +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> @@ -35,8 +35,6 @@
>   
>   #define MEI_CSI_ENTITY_NAME "Intel IVSC CSI"
>   
> -#define MEI_CSI_LINK_FREQ_400MHZ 400000000ULL
> -
>   /* the 5s used here is based on experiment */
>   #define CSI_CMD_TIMEOUT (5 * HZ)
>   /* to setup CSI-2 link an extra delay needed and determined experimentally */
> @@ -121,14 +119,13 @@ struct mei_csi {
>   	struct mutex lock;
>   
>   	struct v4l2_subdev subdev;
> -	struct v4l2_subdev *remote;
> +	struct media_pad *remote;
>   	struct v4l2_async_notifier notifier;
>   	struct v4l2_ctrl_handler ctrl_handler;
>   	struct v4l2_ctrl *freq_ctrl;
>   	struct v4l2_ctrl *privacy_ctrl;
>   	/* lock for v4l2 controls */
>   	struct mutex ctrl_lock;
> -	unsigned int remote_pad;
>   	/* start streaming or not */
>   	int streaming;
>   
> @@ -147,10 +144,6 @@ static const struct v4l2_mbus_framefmt mei_csi_format_mbus_default = {
>   	.field = V4L2_FIELD_NONE,
>   };
>   
> -static s64 link_freq_menu_items[] = {
> -	MEI_CSI_LINK_FREQ_400MHZ
> -};
> -
>   static inline struct mei_csi *notifier_to_csi(struct v4l2_async_notifier *n)
>   {
>   	return container_of(n, struct mei_csi, notifier);
> @@ -161,11 +154,6 @@ static inline struct mei_csi *sd_to_csi(struct v4l2_subdev *sd)
>   	return container_of(sd, struct mei_csi, subdev);
>   }
>   
> -static inline struct mei_csi *ctrl_to_csi(struct v4l2_ctrl *ctrl)
> -{
> -	return container_of(ctrl->handler, struct mei_csi, ctrl_handler);
> -}
> -
>   /* send a command to firmware and mutex must be held by caller */
>   static int mei_csi_send(struct mei_csi *csi, u8 *buf, size_t len)
>   {
> @@ -286,11 +274,13 @@ static void mei_csi_rx(struct mei_cl_device *cldev)
>   static int mei_csi_set_stream(struct v4l2_subdev *sd, int enable)
>   {
>   	struct mei_csi *csi = sd_to_csi(sd);
> +	struct v4l2_subdev *remote_sd =
> +		media_entity_to_v4l2_subdev(csi->remote->entity);
>   	s64 freq;
>   	int ret;
>   
>   	if (enable && csi->streaming == 0) {
> -		freq = v4l2_get_link_freq(csi->remote->ctrl_handler, 0, 0);
> +		freq = v4l2_get_link_freq(csi->remote, 0, 0);
>   		if (freq < 0) {
>   			dev_err(&csi->cldev->dev,
>   				"error %lld, invalid link_freq\n", freq);
> @@ -309,11 +299,11 @@ static int mei_csi_set_stream(struct v4l2_subdev *sd, int enable)
>   		if (ret < 0)
>   			goto err_switch;
>   
> -		ret = v4l2_subdev_call(csi->remote, video, s_stream, 1);
> +		ret = v4l2_subdev_call(remote_sd, video, s_stream, 1);
>   		if (ret)
>   			goto err_switch;
>   	} else if (!enable && csi->streaming == 1) {
> -		v4l2_subdev_call(csi->remote, video, s_stream, 0);
> +		v4l2_subdev_call(remote_sd, video, s_stream, 0);
>   
>   		/* switch CSI-2 link to IVSC */
>   		ret = csi_set_link_owner(csi, CSI_LINK_IVSC);
> @@ -470,34 +460,30 @@ static int mei_csi_set_fmt(struct v4l2_subdev *sd,
>   	return 0;
>   }
>   
> -static int mei_csi_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +static int mei_csi_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
> +				   struct v4l2_mbus_config *mbus_config)
>   {
> -	struct mei_csi *csi = ctrl_to_csi(ctrl);
> +	struct mei_csi *csi = sd_to_csi(sd);
> +	unsigned int i;
>   	s64 freq;
>   
> -	if (ctrl->id == V4L2_CID_LINK_FREQ) {
> -		if (!csi->remote)
> -			return -EINVAL;
> +	mbus_config->type = V4L2_MBUS_CSI2_DPHY;
> +	for (i = 0; i < V4L2_MBUS_CSI2_MAX_DATA_LANES; i++)
> +		mbus_config->bus.mipi_csi2.data_lanes[i] = i + 1;
> +	mbus_config->bus.mipi_csi2.num_data_lanes = csi->nr_of_lanes;
>   
> -		freq = v4l2_get_link_freq(csi->remote->ctrl_handler, 0, 0);
> -		if (freq < 0) {
> -			dev_err(&csi->cldev->dev,
> -				"error %lld, invalid link_freq\n", freq);
> -			return -EINVAL;
> -		}
> -
> -		link_freq_menu_items[0] = freq;
> -		ctrl->val = 0;
> -
> -		return 0;
> +	freq = v4l2_get_link_freq(csi->remote, 0, 0);
> +	if (freq < 0) {
> +		dev_err(&csi->cldev->dev,
> +			"error %lld, invalid link_freq\n", freq);
> +		return -EINVAL;
>   	}
>   
> -	return -EINVAL;
> -}
> +	csi->link_freq = freq;
> +	mbus_config->link_freq = freq;
>   
> -static const struct v4l2_ctrl_ops mei_csi_ctrl_ops = {
> -	.g_volatile_ctrl = mei_csi_g_volatile_ctrl,
> -};
> +	return 0;
> +}
>   
>   static const struct v4l2_subdev_video_ops mei_csi_video_ops = {
>   	.s_stream = mei_csi_set_stream,
> @@ -506,6 +492,7 @@ static const struct v4l2_subdev_video_ops mei_csi_video_ops = {
>   static const struct v4l2_subdev_pad_ops mei_csi_pad_ops = {
>   	.get_fmt = v4l2_subdev_get_fmt,
>   	.set_fmt = mei_csi_set_fmt,
> +	.get_mbus_config = mei_csi_get_mbus_config,
>   };
>   
>   static const struct v4l2_subdev_ops mei_csi_subdev_ops = {
> @@ -533,8 +520,7 @@ static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
>   	if (pad < 0)
>   		return pad;
>   
> -	csi->remote = subdev;
> -	csi->remote_pad = pad;
> +	csi->remote = &subdev->entity.pads[pad];
>   
>   	return media_create_pad_link(&subdev->entity, pad,
>   				     &csi->subdev.entity, CSI_PAD_SINK,
> @@ -558,28 +544,16 @@ static const struct v4l2_async_notifier_operations mei_csi_notify_ops = {
>   
>   static int mei_csi_init_controls(struct mei_csi *csi)
>   {
> -	u32 max;
>   	int ret;
>   
>   	mutex_init(&csi->ctrl_lock);
>   
> -	ret = v4l2_ctrl_handler_init(&csi->ctrl_handler, 2);
> +	ret = v4l2_ctrl_handler_init(&csi->ctrl_handler, 1);
>   	if (ret)
>   		return ret;
>   
>   	csi->ctrl_handler.lock = &csi->ctrl_lock;
>   
> -	max = ARRAY_SIZE(link_freq_menu_items) - 1;
> -	csi->freq_ctrl = v4l2_ctrl_new_int_menu(&csi->ctrl_handler,
> -						&mei_csi_ctrl_ops,
> -						V4L2_CID_LINK_FREQ,
> -						max,
> -						0,
> -						link_freq_menu_items);
> -	if (csi->freq_ctrl)
> -		csi->freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY |
> -					 V4L2_CTRL_FLAG_VOLATILE;
> -
>   	csi->privacy_ctrl = v4l2_ctrl_new_std(&csi->ctrl_handler, NULL,
>   					      V4L2_CID_PRIVACY, 0, 1, 1, 0);
>   	if (csi->privacy_ctrl)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi


