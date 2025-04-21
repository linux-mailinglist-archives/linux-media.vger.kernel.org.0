Return-Path: <linux-media+bounces-30614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2320DA9518E
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 15:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59CA61724C8
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76DD266F1D;
	Mon, 21 Apr 2025 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DBLZcoAL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2DB265CDE;
	Mon, 21 Apr 2025 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241729; cv=none; b=XWReq0nyuakC82EsfuzMZnWbpSkdrutFVLGJj2uH5LBBs4kV5izImDjf0mc1z6fjjHDB07yaSu6Ko35YJVaiRjZp3u8uSV0Ti3O85/yk/LT021SNXUdwzrsKDw7AQpM9g5AdltkDttBEeop6xoY2XMottFMHnEdwKd3fhRxL4pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241729; c=relaxed/simple;
	bh=wjAmj3yBRwON5AC2N8EIOOjXnWbRpJNYgGcGb2FQTvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPWRzOg6/EPUekEfkglU61HS+l0ojeFd52YgekbNuLX4G7iyQkW7grOep30LXX9PCX+49qNfg8oMg2DJvV6Y/TGGXecxRVm96gUUNp44df9IJNS8JjDoxQAPVYD4g3UeaDrRofZfzwl3SsAKcwYSzliTOL3q4goQsvLeQwyvFbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DBLZcoAL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C6696D5;
	Mon, 21 Apr 2025 15:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745241599;
	bh=wjAmj3yBRwON5AC2N8EIOOjXnWbRpJNYgGcGb2FQTvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DBLZcoALsV0uCYSqS4/I7xvM1HlsdnOhToWc1lz+eG29sDbFYR0Sl8hWVB03B1pRc
	 eAACbLkkVKn3GA9QEAyzlFGDU14meXVKrZ08ueWpd1ZBS4eyOwmWNe9UTZ9cFjZ0DH
	 2nUCRRvAkVcZUOIUtIpV1jWzsq9xHdVD19lS+96I=
Date: Mon, 21 Apr 2025 16:22:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, mripard@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	devarsht@ti.com, y-abhilashchandra@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vaishnav.a@ti.com, s-jain1@ti.com, vigneshr@ti.com,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com
Subject: Re: [PATCH v3 07/13] media: cadence: csi2rx: add get_frame_desc
 wrapper
Message-ID: <20250421132204.GG29483@pendragon.ideasonboard.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-8-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065554.437541-8-r-donadkar@ti.com>

Hi Rishikesh,

Thank you for the patch.

On Thu, Apr 17, 2025 at 12:25:48PM +0530, Rishikesh Donadkar wrote:
> From: Pratyush Yadav <p.yadav@ti.com>
> 
> J721E wrapper CSI2RX driver needs to get the frame descriptor from the
> source to find out info about virtual channel. This driver itself does
> not touch the routing or virtual channels in any way. So simply pass the
> descriptor through from the source.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index cebcae196eecc..b7e9225f66a41 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -135,6 +135,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
>  	return NULL;
>  }
>  
> +static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
> +					     struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct media_pad *remote_pad;
> +
> +	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
> +	if (!remote_pad) {
> +		dev_err(csi2rx->dev, "No remote pad found for sink\n");
> +		return -ENODEV;
> +	}
> +
> +	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
> +				remote_pad->index, fd);
> +}
> +
>  static inline
>  struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
>  {
> @@ -458,10 +473,19 @@ static int csi2rx_init_state(struct v4l2_subdev *subdev,
>  	return csi2rx_set_fmt(subdev, state, &format);
>  }
>  
> +static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> +
> +	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
> +}
> +
>  static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
>  	.enum_mbus_code	= csi2rx_enum_mbus_code,
>  	.get_fmt	= v4l2_subdev_get_fmt,
>  	.set_fmt	= csi2rx_set_fmt,
> +	.get_frame_desc	= csi2rx_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_video_ops csi2rx_video_ops = {

-- 
Regards,

Laurent Pinchart

