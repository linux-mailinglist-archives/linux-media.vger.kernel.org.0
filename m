Return-Path: <linux-media+bounces-7343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E45880849
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 00:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A718D1F229AC
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 23:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E535FBA8;
	Tue, 19 Mar 2024 23:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pX7iBXa0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386D75FB8C
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 23:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710892118; cv=none; b=a4hkgh+BkMihMJ7ON+CfbDjcql4CNnWwAMY0hF1VdN6eTXOIqzL2S2efBCyDhXwapyGUT+cRZ4IgKoKF3cQf4MYnbmwCOjyfGF7pQA2J41a+P3gYznCjqfYL32MXJSRls4CvMG9uYSzsx0VtLRaqLf69vpoSubj72aI9I6CAWks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710892118; c=relaxed/simple;
	bh=0wpjR2/7PMMTE3gaf0t3mX/1e/5KURM6QHb5FxeI8JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gn3vo6A/9ybmQbp1ZTgx4SbYstUKSz4isvYnND6amYpe5OZZzwzmTFIVn5/nYiIJR2BuCfsFxgyr4x1VmkUsNz7BdCUxPmB+kUds+dZVzY4iL8g7EjM9LAhEjPhcryInMnsqssYjj00d/IOnK3BGh7xfQ7dZbiLHVBD+vo+SKZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pX7iBXa0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63C59B1;
	Wed, 20 Mar 2024 00:48:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710892087;
	bh=0wpjR2/7PMMTE3gaf0t3mX/1e/5KURM6QHb5FxeI8JY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pX7iBXa0vaExWrKhtBi7AVCyABlrK435mmNsX8oQyVjv9meDBIWskoz2QJHA3gQf4
	 kOtseF4cwRtWwYgwb0EnbyjZ66CElo7QHLq5v5EMFVsppYVYEpZvZ0RrkYVBtDsJJS
	 0KWrFZmuHsiGytCPVMWHgKmvaIgVwwnwcj/qOXFQ=
Date: Wed, 20 Mar 2024 01:48:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 07/38] media: Documentation: Additional streams
 generally don't harm capture
Message-ID: <20240319234831.GL8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-8-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-8-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:45AM +0200, Sakari Ailus wrote:
> Having extra streams on the source end of the link that cannot be captured
> by the sink sub-device generally are not an issue, at least not on CSI-2
> bus. Still document that there may be hardware specific limitations. For

s/hardware specific/hardware-specific/

> example on parallel bus this might not work on all cases.

s/bus/buses/

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  Documentation/userspace-api/media/v4l/dev-subdev.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index f375b820ab68..a387e8a15b8d 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -529,9 +529,9 @@ the its sink pad and allows to route them individually to one of its source
>  pads.
>  
>  Subdevice drivers that support multiplexed streams are compatible with
> -non-multiplexed subdev drivers, but, of course, require a routing configuration
> -where the link between those two types of drivers contains only a single
> -stream.
> +non-multiplexed subdev drivers. However, if the driver at the sink end of a link
> +does not support streams, then only the stream 0 on source end may be

s/the stream 0 on source end/stream 0 of the source/

> +captured. There may be additional hardware specific limitations.

s/hardware specific/hardware-specific/

Or maybe

There may be additional limitations specific to the sink device.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  Understanding streams
>  ^^^^^^^^^^^^^^^^^^^^^

-- 
Regards,

Laurent Pinchart

