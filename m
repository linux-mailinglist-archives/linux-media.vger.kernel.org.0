Return-Path: <linux-media+bounces-17832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DE896FE52
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 01:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A32EC1F23E96
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 23:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE1F15B12A;
	Fri,  6 Sep 2024 23:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Sq0ajFEr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6491B85DC;
	Fri,  6 Sep 2024 23:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725664244; cv=none; b=JrOvbiEafoYeo32+l4YQO3f4xmtefVVXFHBUiONbdTxvGkAmnJwGI4w9CLmKMxraWEWp046SILvEPo29pM5p3NKPg2O5stxTKIdB5Pq1I7qUvA0fMFPp1ObeXY7WcCwFr2qAhZKA3nDVYdrab3EXCKz4ya3uoAa0ahFIob1eCVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725664244; c=relaxed/simple;
	bh=17e/COF6bpH5iqL0DPpdwjicHShPPCI1pEi7grYzng8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phcAbnxZBmR1yYqW/YLV+U2Go0DQFJlSpKng+W9HZeRu+CmunU6acq5RGma0ugYU7n2QWtRwi2FZZPqmrizinGMnoI6FYN4nWyo8M9SLjxulYqv7Hn4j/OIXIu+VoGeHjjKsOFGGqR25W93TIdGn2hYNX6RMJ8SkTvtIsYaSbFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Sq0ajFEr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8ACF03D5;
	Sat,  7 Sep 2024 01:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725664166;
	bh=17e/COF6bpH5iqL0DPpdwjicHShPPCI1pEi7grYzng8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sq0ajFErjH1q+HR+FifJI9sDjGNN3fNgyGjn6ytUnYpcaqim7dzUzNXlTQ9sum5rU
	 8hk5gXMDK4Krp9vPjVuqYXxF/UxCiMxI19VoLwwKu+MKOHQRG18P/Bqlw01jqq/je1
	 /VnT745mO/5UfrEH5wiXZ9e+FJeCkX0Adym5lKRQ=
Date: Sat, 7 Sep 2024 02:10:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/3] media: platform: rzg2l-cru: rzg2l-video: Retrieve
 virtual channel information
Message-ID: <20240906231038.GC12915@pendragon.ideasonboard.com>
References: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906173947.282402-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240906173947.282402-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, Sep 06, 2024 at 06:39:46PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The RZ/G2L CRU needs to configure the ICnMC.VCSEL bits to specify which
> virtual channel should be processed from the four available VCs. To
> retrieve this information from the connected subdevice, the
> .get_frame_desc() function is called.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index bbf4674f888d..6101a070e785 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -433,12 +433,41 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>  	spin_unlock_irqrestore(&cru->qlock, flags);
>  }
>  
> +static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
> +{
> +	struct v4l2_mbus_frame_desc fd = { };
> +	struct media_pad *pad;
> +	int ret;
> +
> +	pad = media_pad_remote_pad_unique(&cru->ip.pads[1]);

It would be nice to use RZG2L_CRU_IP_SOURCE here instead of hardcoding
the pad number. That would require moving rzg2l_csi2_pads to the shared
header. You can do that on top.

An now that I've said that, is it really the source pad you need here ?

> +	if (IS_ERR(pad))
> +		return PTR_ERR(pad);

Can this happen, or would the pipeline fail to validate ? I think you
can set the MUST_CONNECT flag on the sink pad, then you'll have a
guarantee something will be connected.

> +
> +	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc,
> +			       pad->index, &fd);
> +	if (ret < 0 && ret != -ENOIOCTLCMD)

Printing an error message would help debugging.

> +		return ret;
> +	/* If remote subdev does not implement .get_frame_desc default to VC0. */
> +	if (ret == -ENOIOCTLCMD)
> +		return 0;
> +
> +	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)

An error message would help here too I think.

> +		return -EINVAL;
> +
> +	return fd.num_entries ? fd.entry[0].bus.csi2.vc : 0;

I think you should return an error if fd.num_entries is 0, that
shouldn't happen.

> +}
> +
>  int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  {
>  	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
>  	unsigned long flags;
>  	int ret;
>  
> +	ret = rzg2l_cru_get_virtual_channel(cru);
> +	if (ret < 0)
> +		return ret;
> +	cru->csi.channel = ret;

How about passing the value to the function that needs it, instead of
storing it in cru->csi.channel ? You can do that on top and drop the
csi.channel field.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	spin_lock_irqsave(&cru->qlock, flags);
>  
>  	/* Select a video input */

-- 
Regards,

Laurent Pinchart

