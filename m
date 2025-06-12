Return-Path: <linux-media+bounces-34553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5EEAD6469
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 02:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1211917D6DF
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 00:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68B911CA9;
	Thu, 12 Jun 2025 00:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fDr9dKH6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF0BA34;
	Thu, 12 Jun 2025 00:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749687747; cv=none; b=bbHhWgZX+xHQT2X1xziXmaLEI6lrUkVVwV2sLfBFyhcpONFxYoRPrKFyQXYXmiPLcPErU76laVHF00kk4c3lji8ZaQT4uHfxv7xE4UAy+DfIZHHEvc8wn7owIEVUIc7XBxeDP/X/Y72X1mwJovmkjWdQX4Nj1679R0EAsUKkvHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749687747; c=relaxed/simple;
	bh=cwsZWJps58GdPaWozqRSgitYHSPHolA58de0WHiD/Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKLo1N14crxmQwXWV0qAzufZZ0a/FYV5DTdihhzi3tQIAx+/JpyFHo2xrOlkuO1b5seYDSZBDIU5pKcl0jWeoIxno7PbIzfgNb3B7OZX7pQt2vlDnbI8CHn6zVsb+8v2f1gtl1vUxMPD1vCoSYjWcceCdyuvIaiwHPTtRv/oN/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fDr9dKH6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D8B4EA0;
	Thu, 12 Jun 2025 02:22:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749687735;
	bh=cwsZWJps58GdPaWozqRSgitYHSPHolA58de0WHiD/Do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fDr9dKH6f8UBupWiXSiISOq6uu4US21SI19iidULlF6gJQ8y52kiIEp03T2WqQtM6
	 WUlk1evmetOFEGQBCwhNUV+AqSusXFNvnEHCc+INCsAP3nXQFff22brE3QECy2cU9C
	 +7eTaxR0sJY8rST0o111v9NROAQio4WDvbEIPcGk=
Date: Thu, 12 Jun 2025 03:22:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 06/12] media: rcar-vin: Improve error paths for
 parallel devices
Message-ID: <20250612002211.GB22977@pendragon.ideasonboard.com>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-7-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606182606.3984508-7-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Fri, Jun 06, 2025 at 08:26:00PM +0200, Niklas Söderlund wrote:
> Use the __free(fwnode_handle) hooks to free the endpoints when the
> function exits to simplify the error paths and make the intent more
> clear.
> 
> While at it correct the error message when failing to parse an endpoint
> to report the correct node.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v4
> - New in v5, improvement suggested by Sakari and Laurent in review of v4.
> ---
>  .../platform/renesas/rcar-vin/rcar-core.c     | 28 +++++++------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index df3f15bd95a4..100432080ad7 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -340,24 +340,20 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
>  
>  static int rvin_parallel_parse_of(struct rvin_dev *vin)
>  {
> -	struct fwnode_handle *ep, *fwnode;
> +	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
> +	struct fwnode_handle *ep __free(fwnode_handle) = NULL;
>  	struct v4l2_fwnode_endpoint vep = {
>  		.bus_type = V4L2_MBUS_UNKNOWN,
>  	};
>  	struct v4l2_async_connection *asc;
> -	int ret;
>  
>  	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
>  	if (!ep)
>  		return 0;
>  
> -	fwnode = fwnode_graph_get_remote_endpoint(ep);
> -	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> -	fwnode_handle_put(ep);
> -	if (ret) {
> -		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
> -		ret = -EINVAL;
> -		goto out;
> +	if (v4l2_fwnode_endpoint_parse(ep, &vep)) {
> +		vin_err(vin, "Failed to parse %pOF\n", to_of_node(ep));
> +		return -EINVAL;
>  	}
>  
>  	switch (vep.bus_type) {
> @@ -371,24 +367,20 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
>  		break;
>  	default:
>  		vin_err(vin, "Unknown media bus type\n");
> -		ret = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>  	}
>  
> +	fwnode = fwnode_graph_get_remote_endpoint(ep);
>  	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
>  				       struct v4l2_async_connection);
> -	if (IS_ERR(asc)) {
> -		ret = PTR_ERR(asc);
> -		goto out;
> -	}
> +	if (IS_ERR(asc))
> +		return PTR_ERR(asc);
>  
>  	vin->parallel.asc = asc;
>  
>  	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
> -out:
> -	fwnode_handle_put(fwnode);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,

-- 
Regards,

Laurent Pinchart

