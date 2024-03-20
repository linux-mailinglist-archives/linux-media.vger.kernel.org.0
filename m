Return-Path: <linux-media+bounces-7349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E01A88089E
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 01:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 069F02828C0
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 00:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54242A3F;
	Wed, 20 Mar 2024 00:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="luig7vl4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0762D629
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 00:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710895153; cv=none; b=LVWVkPrLpUSR6x9fi8RZ8d4BDosHORfKPnewMadZEaMw0JpBUIfFH0qA2GSr4DIY4G9hTnmHSGdU6FdGruxAfO2UzgYbGI4v4dUNt2/3hbZh0cheTFexWOSF/xeU5/msiXX4tIXL7huA5Hlw/2Iur+X5MxkRQ2A++AvgjprT55s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710895153; c=relaxed/simple;
	bh=KWvL5w/b5nyqwAdvVTZLofHv8hq7RhQPytL16TqFUsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVSzEkD4SqGNKvFu8gEeFBIVQliqH07sct4m1R4b2SXzbdNjmnFPMjflWUGOW27TcO4fedr42eOr6tEjVxQ4YdZTjBJ3rYsVFNsAhxy3GE9Cche/NujOA4dhViqDj+6ZLS9pr/M1f0V2VTl7hgx662p9CRdMsMc25iRPF54Jxjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=luig7vl4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C42C0B1;
	Wed, 20 Mar 2024 01:38:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710895124;
	bh=KWvL5w/b5nyqwAdvVTZLofHv8hq7RhQPytL16TqFUsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=luig7vl40Gs0pZgReFfASkvbH8r+atxv6GXADiDsTctUrB4R7dhUElGafczRR7ul5
	 1yCGtYUlWir3NcmJ5nNmBeV5CezHPdeoiOCpzR6IHiciLu2uqnWf0gm1woJuP84Gte
	 1N89VVU5kDjqldaNNAyBLE5ur8aBxGUEqXBm4tG8=
Date: Wed, 20 Mar 2024 02:39:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 13/38] media: v4l: subdev: Copy argument back to user
 also for S_ROUTING
Message-ID: <20240320003907.GR8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-14-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-14-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:51AM +0200, Sakari Ailus wrote:
> As the user needs to know what went wrong for S_ROUTING, copy array
> arguments back to the user.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index d125d23e4e61..95bd56145d38 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3415,11 +3415,14 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>  	 * FIXME: subdev IOCTLS are partially handled here and partially in
>  	 * v4l2-subdev.c and the 'always_copy' flag can only be set for IOCTLS
>  	 * defined here as part of the 'v4l2_ioctls' array. As
> -	 * VIDIOC_SUBDEV_G_ROUTING needs to return results to applications even
> -	 * in case of failure, but it is not defined here as part of the
> +	 * VIDIOC_SUBDEV_[GS]_ROUTING needs to return results to applications

s/needs/need/

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +	 * even in case of failure, but it is not defined here as part of the
>  	 * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
>  	 */
> -	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
> +	if (cmd == VIDIOC_SUBDEV_G_ROUTING || cmd == VIDIOC_SUBDEV_S_ROUTING)
> +		always_copy = true;
> +
> +	if (err < 0 && !always_copy)
>  		goto out;
>  
>  	if (has_array_args) {

-- 
Regards,

Laurent Pinchart

