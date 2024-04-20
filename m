Return-Path: <linux-media+bounces-9808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4438ABACF
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 11:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98D571F2124A
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 09:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABCB1773D;
	Sat, 20 Apr 2024 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o/3MS6xl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E1814003
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713606028; cv=none; b=EspOFFokWZRoOhRuU7DHB7HGRYF+sm8iaguO55nJvbG88V5vzjn9Sc3X1pKsa9x5D7qapCclqmrp3qYhPsu0VWQtHSq0OHtIdNj5rJdaUNvXTbzLXiUNPDytz6Eyi1qxScp+KkjSf3DUiVQzgIVTN1pm6SnHPvFPpCrcsTZ0sl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713606028; c=relaxed/simple;
	bh=VokHvghgEOQqDGdEYgZV2/dq3PqfTv19qUpe9HVnAyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rchoibd5EaNmX8n7sKkPwftDWqIlgDPBxC9o0hQMCnOMPPbuBzBX2fyUm9vaK7u26lQv1OobnhpoA+elOoiw03yXUwwSki3d7HxuimHRSCnaZgeLmFzO2dtI9a5x6pBADi0/PUuPE4A4Bos10+DbHdQ+eaNW4p5tjs1hleyE/fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o/3MS6xl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD29955;
	Sat, 20 Apr 2024 11:39:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713605975;
	bh=VokHvghgEOQqDGdEYgZV2/dq3PqfTv19qUpe9HVnAyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/3MS6xlSqZEAt0hni7fGNxsQwaXc8DJ1+FVzNtL5wZdnLDxoVgBGUDq2h+TaAzwz
	 o7TwNlpe2VebVz9UPStPRFeUWKjPlWNkg5tmWlLEf9TiaUybOBunLb78SE/9JoUG2B
	 fEPTa3mrqeK+O/miAEnsZibHA4A8QcMHV+bRUoZE=
Date: Sat, 20 Apr 2024 12:40:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 42/46] media: ov2740: Add generic sensor fwnode
 properties as controls
Message-ID: <20240420094016.GZ6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-43-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240416193319.778192-43-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:15PM +0300, Sakari Ailus wrote:
> Add generic sensor property information as controĺs by using
> v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index dc0931308053..e37d824291fe 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -779,6 +779,8 @@ static const struct v4l2_ctrl_ops ov2740_ctrl_ops = {
>  
>  static int ov2740_init_controls(struct ov2740 *ov2740)
>  {
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
> +	struct v4l2_fwnode_device_properties props;
>  	struct v4l2_ctrl_handler *ctrl_hdlr;
>  	s64 exposure_max, h_blank, pixel_rate;
>  	u32 vblank_min, vblank_max, vblank_default;
> @@ -789,6 +791,10 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>  	if (ret)
>  		return ret;
>  
> +	if (!v4l2_fwnode_device_parse(&client->dev, &props))

If you moved the parsing earlier, you could set the right number of
controls when initializing the handler. This being said, maybe we should
instead try to get rid of the controls count hint to the handler
initialization function.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2740_ctrl_ops,
> +						&props);
> +
>  	ov2740->link_freq =
>  		v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
>  				       V4L2_CID_LINK_FREQ,

-- 
Regards,

Laurent Pinchart

