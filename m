Return-Path: <linux-media+bounces-28303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31035A631C8
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 19:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D6F87AC216
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 18:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2C8205E14;
	Sat, 15 Mar 2025 18:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kHcSXhRe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4571F561D;
	Sat, 15 Mar 2025 18:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742064104; cv=none; b=DFDJW/BLFfEC2gkQwW01Wh2U8b//zDg7IvE+PkurxSdcMywzrbU+EIuEeDzPFLUpfto3BL8ttYX+VZhnvaibJ2aC41bfZ4fF1/2UvcobjhcMwwv9yvBdLfiVR53qxbaDpcM7w0k3O23dh4mFOf7usL1r8Fw0AcxLNtxZZHfwPt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742064104; c=relaxed/simple;
	bh=Pyg8N/WYvKNjjiWnBRd7drwqlefTx7lp7mVjmV6c9Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3E01wz5Cxlh2sECiGsk5TGx/rfdkp0ChtwjrpqLw95UTxRQI4ky16H6WFggjUHv/jdrVTjvIPNcdFp8iSA5bHY675vSihw5M5Y2jY0hlofpb8t4Oy92EbkKkKXNPpzvPis/zMqYN+V4z+gV4Xhi92Gu4c1d2O8/6C4Ln9fyI94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kHcSXhRe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 978BE526;
	Sat, 15 Mar 2025 19:39:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742063993;
	bh=Pyg8N/WYvKNjjiWnBRd7drwqlefTx7lp7mVjmV6c9Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kHcSXhRezrZLM9DYVTLOR8yKcfQe4tqQPzLZrHnXOXYpiuwCg7RP/0MVZianLRUyS
	 ORyw8RzSUwdfxef2y2PaTYF9CdmeIyg6THYHJTwkUEIE280AzgwVMNTfuQ7Fg74iHh
	 LTV4cF1k445pzX4p3HUATRNjXkCCesGHoP96t8NY=
Date: Sat, 15 Mar 2025 20:41:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/10] media: thp7312: Use helper for iterating named
 child nodes
Message-ID: <20250315184111.GA29719@pendragon.ideasonboard.com>
References: <cover.1741610847.git.mazziesaccount@gmail.com>
 <ab79cf4415d21ff2854fee4f4189fac555c30b7a.1741610847.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ab79cf4415d21ff2854fee4f4189fac555c30b7a.1741610847.git.mazziesaccount@gmail.com>

Hi Matti,

Thank you for the patch.

On Mon, Mar 10, 2025 at 02:57:40PM +0200, Matti Vaittinen wrote:
> Slightly simplify code iterating the child nodes with specific names
> using the new fwnode_for_each_available_named_child_node().
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Revision history:
> v5 => v6:
>  - New patch
> 
> NOTE: This patch depends on the patch:
> [2/10] "property: Add functions to iterate named child"
> 
> Compile-tested only!
> ---
>  drivers/media/i2c/thp7312.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
> index 8852c56431fe..104754b2ace2 100644
> --- a/drivers/media/i2c/thp7312.c
> +++ b/drivers/media/i2c/thp7312.c
> @@ -2067,11 +2067,9 @@ static int thp7312_parse_dt(struct thp7312_device *thp7312)
>  		return -EINVAL;
>  	}
>  
> -	fwnode_for_each_available_child_node(sensors, node) {
> -		if (fwnode_name_eq(node, "sensor")) {
> -			if (!thp7312_sensor_parse_dt(thp7312, node))
> -				num_sensors++;
> -		}
> +	fwnode_for_each_available_named_child_node(sensors, node, "sensor") {
> +		if (!thp7312_sensor_parse_dt(thp7312, node))
> +			num_sensors++;
>  	}
>  
>  	fwnode_handle_put(sensors);

-- 
Regards,

Laurent Pinchart

