Return-Path: <linux-media+bounces-25126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC3A1912D
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 13:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4987B165CB7
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 12:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E19212B1F;
	Wed, 22 Jan 2025 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LrACSX6h"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C86F211A2B
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737547879; cv=none; b=iugEbb2mH3PtFeRkq9o9lYq27W8tAMQ4uv/htMOZYq1dUnTs98uH7AsFjTrs8O5H2i26vdQVr8tnfhNNgeZAIBX1lvCowBiwslAjIda1kzG8ryvBSnD+YTYJ99VhN8BXICMner7qWOXN/34k8gbhdiirPnCR/EnZT6PgFVQ8hTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737547879; c=relaxed/simple;
	bh=9SOpsTq0OlfI1jbsJZ9RrYM70aGjV5rQzCkawdPFQek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUhi01UFmOL+Mb4uRebSP+tPWYVssAkD8fkVbi1TBiQAz4iZY++ktG0w0Q5RWnkl+DKkBxqf1qJBYU31NC6aFhAQGlgULEoJbV+oDflCV/S0JT6pGxxbxN9Xl9Y1fJIc/+l/O9dYTwfM5pIMegWKxNdDaU7c/flnt6XZKK8tFGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LrACSX6h; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D22BA7E0;
	Wed, 22 Jan 2025 13:10:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737547812;
	bh=9SOpsTq0OlfI1jbsJZ9RrYM70aGjV5rQzCkawdPFQek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LrACSX6hkckJRlye/FdmPoyZwTPpgoYtbok7upLvuoAT2jJjgOShjNZvOPH8alKwk
	 3ui2JlgBKihZMqkBfmisOEsGx0b1ppYZrD6AzYw95al+32jVeHJbNmAdf+cA2rpr0/
	 +T+y4dy/bBBrzkludLtmpFjpmNrs/i6fEwDKDljI=
Date: Wed, 22 Jan 2025 14:11:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [yavta PATCH 1/1] Add IPU3_Y10 support
Message-ID: <20250122121106.GA7077@pendragon.ideasonboard.com>
References: <20250122114501.1618032-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250122114501.1618032-1-sakari.ailus@linux.intel.com>

On Wed, Jan 22, 2025 at 01:45:01PM +0200, Sakari Ailus wrote:
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and pushed.

> ---
>  yavta.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/yavta.c b/yavta.c
> index 882603333bcc..c8706df8e047 100644
> --- a/yavta.c
> +++ b/yavta.c
> @@ -358,6 +358,7 @@ static struct v4l2_format_info {
>  	{ "IPU3_SGBRG10", V4L2_PIX_FMT_IPU3_SGBRG10, 1 },
>  	{ "IPU3_SGRBG10", V4L2_PIX_FMT_IPU3_SGRBG10, 1 },
>  	{ "IPU3_SRGGB10", V4L2_PIX_FMT_IPU3_SRGGB10, 1 },
> +	{ "IPU3_Y10", V4L2_PIX_FMT_IPU3_Y10, 1 },
>  	{ "DV", V4L2_PIX_FMT_DV, 1 },
>  	{ "MJPEG", V4L2_PIX_FMT_MJPEG, 1 },
>  	{ "MPEG", V4L2_PIX_FMT_MPEG, 1 },

-- 
Regards,

Laurent Pinchart

