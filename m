Return-Path: <linux-media+bounces-40233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C36C6B2BADE
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DE97626645
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 07:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B8E2F9C3E;
	Tue, 19 Aug 2025 07:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YgDNdJ0N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437322D7809
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 07:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755588937; cv=none; b=B1UB1CcQ0roLDSDLfc0k84yx1eS/BIIck2GAhF4NzPAxjp+OJ98OBjVj9wkgltlOZFWUhlLL8Izcjh89lIYrs8q9dAc6CwUlWofa3MghO2dxb7EyUYt6aX9gLpnDSwOSJBDK7OCmAdqwr7CgSCTIdczItEWR5Ap3bwqolviD864=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755588937; c=relaxed/simple;
	bh=6muHT8Vz7FWBM7IxWQ7FJ7BNFmydgV6AQcSNIRRp0a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYBMDMZgrJQlgoakuVhsJ+yxu+z6dQXH38kux9HjkRhG9FZ8eJs5otafeKawPpjhPXQBne2NCU1xwwmwjplnQMwSRzZMqU6k4F/V6bExh8axDSzv0hMpYBTpzevqYWsDnftTZ+TdRwHxZfA1Fji6yoNh5+/+Z6rhBL+LM6KyXo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YgDNdJ0N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58B9C596;
	Tue, 19 Aug 2025 09:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755588871;
	bh=6muHT8Vz7FWBM7IxWQ7FJ7BNFmydgV6AQcSNIRRp0a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YgDNdJ0Ny4UAaCIt6zhpAREx+3G5hjZxBzRz2HdAdeNqcfa7WCikjt1QiMRcmxI1C
	 8AAyhcIQBAxIHcipPUptMETYezNSzo0ctuidu9zhNs55Gmbb+gCgFwTKct6RWXNsBL
	 UpQ9KkcQi6u3ruz9r+cib+lEc9LZXD+PpjuUiuVY=
Date: Tue, 19 Aug 2025 09:35:21 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Keke Li <keke.li@amlogic.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 1/2] media: amlogic: c3-mipi-csi2: Call
 v4l2_get_link_freq() on source pad
Message-ID: <rnlb6bowvqy5yyzhhqdpqgpp4o4m4c6qkfyywggcpqnmdgl7ft@picz2hkvjth6>
References: <20250818141444.1160565-1-sakari.ailus@linux.intel.com>
 <20250818141444.1160565-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250818141444.1160565-2-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Aug 18, 2025 at 05:14:43PM +0300, Sakari Ailus wrote:
> Call v4l2_get_link_freq() on the source pad so we can remove the
> workaround allowing doing that.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> index 1011ab3ebac7..d56525d5fd74 100644
> --- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> @@ -389,12 +389,12 @@ static void c3_mipi_csi_cfg_host(struct c3_csi_device *csi)
>  }
>
>  static int c3_mipi_csi_start_stream(struct c3_csi_device *csi,
> -				    struct v4l2_subdev *src_sd)
> +				    struct media_pad *src_pad)

You could also pass 'csi' only and retrieve 'src_pad' from there.
Nit apart:
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  {
>  	s64 link_freq;
>  	s64 lane_rate;
>
> -	link_freq = v4l2_get_link_freq(src_sd->ctrl_handler, 0, 0);
> +	link_freq = v4l2_get_link_freq(src_pad, 0, 0);
>  	if (link_freq < 0) {
>  		dev_err(csi->dev,
>  			"Unable to obtain link frequency: %lld\n", link_freq);
> @@ -434,7 +434,7 @@ static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
>
>  	pm_runtime_resume_and_get(csi->dev);
>
> -	c3_mipi_csi_start_stream(csi, src_sd);
> +	c3_mipi_csi_start_stream(csi, csi->src_pad);
>
>  	ret = v4l2_subdev_enable_streams(src_sd, csi->src_pad->index, BIT(0));
>  	if (ret) {
> --
> 2.39.5
>
>

