Return-Path: <linux-media+bounces-23443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D68E39F24DF
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 18:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C5EE161FAA
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 17:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F951B218E;
	Sun, 15 Dec 2024 17:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FgBbSyYW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145591758B
	for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 17:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734282531; cv=none; b=Wt/+Ufh5B46Xy5GbuSd265zk0sI9XAC/tpScPq7l+o4A5HImrq2iTrV0fGBvHNKFjT9YZnK3jt0bWVJhgMGoRE76diqSVXMAiLd3VaLo6JH7YNL2KfhKIRDsZz5DdrI4Lu4i9OTG/zeJLa3bUhwTw1xL4YR1emDbiU16qL3NPp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734282531; c=relaxed/simple;
	bh=8ja8q/1Z1jm5yPHAemOs2tuoyQT5FWi+hygE2PzQYwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBN5fJLGzw0A0Fva8PKy4rSFKJlO40wHohJD8e4UcxUMr7bNaecwARDx47hqe0X4AWSZLxDSmrvKgLMWx4DuC7CGLyOjg7Mj2VKOoJNGQs+YSpmIJpSXNVvQ7WpfnFEpVDXTxrEMxU+mmWzMeUKNnc7G76gMhQv5ztqRdq1VXVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FgBbSyYW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 659B899F;
	Sun, 15 Dec 2024 18:08:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734282492;
	bh=8ja8q/1Z1jm5yPHAemOs2tuoyQT5FWi+hygE2PzQYwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgBbSyYW1yk4kNcJoCGr9xMPXGdUbDoxi5ovHEqfjMhmQQ5WXgJ4bLX5nVsq1I51f
	 x4TOjOUATlmv3J3rnMPd5l9kjAtChJ6gtZRSYLsA5e0R//mLKvE2jJgRVgqS/LqtvP
	 V6BnpHGx5ghy9GSUTSTL09W9pslqxLFfadwuk6ic=
Date: Sun, 15 Dec 2024 19:08:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 5/5] media: intel/ipu6: Obtain link frequency from a
 sub-device
Message-ID: <20241215170832.GI9975@pendragon.ideasonboard.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210075906.609490-6-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

I think this should come before 4/5.

On Tue, Dec 10, 2024 at 09:59:06AM +0200, Sakari Ailus wrote:
> Obtain the link frequency from the sub-device instead of a control
> handler. This allows obtaining it using the get_mbus_config() sub-device
> pad op that which is only supported by the IVSC driver.

"which is the only method supported by the IVSC driver"

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index 051898ce53f4..da8581a37e22 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -80,25 +80,19 @@ static const struct ipu6_csi2_error dphy_rx_errors[] = {
>  s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
>  {
>  	struct media_pad *src_pad;
> -	struct v4l2_subdev *ext_sd;
> -	struct device *dev;
>  
>  	if (!csi2)
>  		return -EINVAL;
>  
> -	dev = &csi2->isys->adev->auxdev.dev;
>  	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);

Not a candidate for this patch, but can the source change, or can it be
cached at probe time (or notifier bound time) ?

>  	if (IS_ERR(src_pad)) {
> -		dev_err(dev, "can't get source pad of %s (%ld)\n",
> +		dev_err(&csi2->isys->adev->auxdev.dev,
> +			"can't get source pad of %s (%ld)\n",
>  			csi2->asd.sd.name, PTR_ERR(src_pad));
>  		return PTR_ERR(src_pad);
>  	}
>  
> -	ext_sd = media_entity_to_v4l2_subdev(src_pad->entity);
> -	if (WARN(!ext_sd, "Failed to get subdev for %s\n", csi2->asd.sd.name))
> -		return -ENODEV;
> -
> -	return v4l2_get_link_freq(ext_sd->ctrl_handler, 0, 0);
> +	return v4l2_get_link_freq(src_pad, 0, 0);
>  }
>  
>  static int csi2_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,

-- 
Regards,

Laurent Pinchart

