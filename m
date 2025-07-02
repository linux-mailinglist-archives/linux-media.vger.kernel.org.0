Return-Path: <linux-media+bounces-36491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24198AF0783
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 02:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 143DD7A31AE
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 00:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6376843AA4;
	Wed,  2 Jul 2025 00:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KNMcej1r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1F534CF9
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 00:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751417632; cv=none; b=hn2aIZ1kJxshaKurZYiTy3k3Xb+M7Y/S7Ndn08uRAMnlbQwrSTte0TTjpHuAtMNQcst4TKkJKNpyHfaEDLkgKBviNFlAzx+QNJTwWshh+iLuZW7JWdCWRadcVYCOaloNBRblmS/WRSIX6bisnGQAqPAnC30FVPxYNCljhdv51B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751417632; c=relaxed/simple;
	bh=Tun0Z7GEPL5FVEcf/9d2Vms6smRb3PGUP1z5hSPp5rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWQUt67S6UK1b2qyRQDrNT+5AYeL+zGfA2x7yUeTsraqrOLkJe2Wu9AbzNWKgrnL0ZKYV10q6qTxl6tcJJNl8lU+NGeEgCAuKGlg/w6/T2df4UHKwMpEd8NqAUN91mK3QDfTfydwBm9aGSYebT7Rv8NEz9RGBE/52Xh35mpSQRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KNMcej1r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D353E111D;
	Wed,  2 Jul 2025 02:53:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751417607;
	bh=Tun0Z7GEPL5FVEcf/9d2Vms6smRb3PGUP1z5hSPp5rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNMcej1rypRwYkbjCmhr/L0kSP0gOnjKTEX/Cgop1jKRzzHSGvnugUXBlIWlZWoxt
	 LCbdg1kD53lFfGAQO9OXTr+zUH7M4Du++kbZHqWozOC4MEUj7VK4QvBRp7nw8p9Sgb
	 mgChRxKRyPYISlqNak5bfBLMad0Fj8Pj0QHP76I0=
Date: Wed, 2 Jul 2025 03:53:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 14/15] media: mt9m114: Return -EPROBE_DEFER if no
 endpoint is found
Message-ID: <20250702005323.GH17819@pendragon.ideasonboard.com>
References: <20250629205626.68341-1-hansg@kernel.org>
 <20250629205626.68341-15-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250629205626.68341-15-hansg@kernel.org>

Hi Hans,

Thank you for the patch.

On Sun, Jun 29, 2025 at 10:56:24PM +0200, Hans de Goede wrote:
> With IPU# bridges, endpoints may only be created when the IPU bridge is
> initialized. This may happen after the sensor driver's first probe().
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>  drivers/media/i2c/mt9m114.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index ec5e9ce24d1c..5e759a23e6cc 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -2448,11 +2448,14 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
>  	struct fwnode_handle *ep;
>  	int ret;
>  
> +	/*
> +	 * Sometimes the fwnode graph is initialized by the bridge driver,
> +	 * wait for this.
> +	 */

I'm still not thrilled by this, but there's no real alternative for the
time being. Still, as Sakari mentioned, the IPU bridge code should at
some point be moved to the ACPI framework, so let's record here that the
sensor driver should then be updated:

	/*
	 * On ACPI systems the fwnode graph can be initialized by a bridge
	 * driver, which may not have probed yet. Wait for this.
	 *
	 * TODO: Return an error once bridge driver code will have moved
	 * to the ACPI core.
	 */

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I wouldn't like to see this being replicated in lots of sensor drivers
though.

>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> -	if (!ep) {
> -		dev_err(&sensor->client->dev, "No endpoint found\n");
> -		return -EINVAL;
> -	}
> +	if (!ep)
> +		return dev_err_probe(&sensor->client->dev, -EPROBE_DEFER,
> +				     "waiting for fwnode graph endpoint\n");
>  
>  	sensor->bus_cfg.bus_type = V4L2_MBUS_UNKNOWN;
>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &sensor->bus_cfg);

-- 
Regards,

Laurent Pinchart

