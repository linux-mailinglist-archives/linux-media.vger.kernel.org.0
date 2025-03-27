Return-Path: <linux-media+bounces-28811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E91E2A72A31
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 07:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9CC41895138
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 06:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1744B18C01D;
	Thu, 27 Mar 2025 06:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="j5KU+76P"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B7BA48;
	Thu, 27 Mar 2025 06:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743057129; cv=none; b=B+Xw1t7VtC2vQtB6VOYpuBv4FLUSjIjmb9JlKgbCIMPwMIUzW5h8Q+gnA2wihrRfgod/jY7dKQqgvpN2QJMIR3VH/gZhhXoSzSq03D3a/42akgGIvq6Zy6X7HfvdLQlkNR/PjwP9qh7vI4PzdMt31D/GmphfTUUSRi/ILpjEf+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743057129; c=relaxed/simple;
	bh=GDIN5A5gWg8FSi7r3k2nXwunmt7cGUfbO+lbx6esFFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kPSi9lmlqHPOYhSAdxvDDrxM9UhckwoaYx0KSDnWG8vwoflfOYVjxhaxiEtkNXY9SiBlmlPbs/gZZ/clshsoAYSr8F4H5TW/TicIFO4qXW6v/1oKdZVm8QGmOtPyn4zshisEOWzg82Fg9NvlmtKdDVfkFRLxOZNRuqRg41vZmQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=j5KU+76P; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52R6VflH2310500
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 27 Mar 2025 01:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743057101;
	bh=DSMX1viPjvHdMhDZWQjOOTAlYbRWHPDKDxdpL/NTsVA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=j5KU+76PIZuj1vEGtSW9DuTFeNIKtz+Bb1nSGS8K/v9HXS31IF2GvFu5F/YoKGKbz
	 o58wNXgP6J7GfGs1qSd0izw8b7RBVzbOBvLcFgCHsSa8jJsHoLIMpfvOQhSGtGd3Tz
	 8Hm+uhdNdEfksUa56/RC98ja+8W6fyzhPsHN/NjI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52R6VfnV074675;
	Thu, 27 Mar 2025 01:31:41 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Mar 2025 01:31:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Mar 2025 01:31:41 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52R6VbTj048655;
	Thu, 27 Mar 2025 01:31:38 -0500
Message-ID: <671ccf0e-7b98-405f-b973-4ffb6996092b@ti.com>
Date: Thu, 27 Mar 2025 12:01:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] media: ti: j721e-csi2rx: Use
 fwnode_get_named_child_node
To: Jai Luthra <jai.luthra@ideasonboard.com>,
        Jai Luthra
	<jai.luthra@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans
 Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>
CC: Rishikesh Donadkar <r-donadkar@ti.com>,
        Vaishnav Achath
	<vaishnav.a@ti.com>,
        Changhuang Liang <changhuang.liang@starfivetech.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com>
 <20250324-probe_fixes-v1-2-5cd5b9e1cfac@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250324-probe_fixes-v1-2-5cd5b9e1cfac@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 24/03/25 17:31, Jai Luthra wrote:
> Simplify notifier registration logic. Instead of first getting the
> device node, get the fwnode of the child directly.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>   drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index a066024bf745450e2ba01d06c0fec4e6bdbfa97e..6d406925e092660cb67c04cc2a7e1e10c14e295e 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -13,6 +13,7 @@
>   #include <linux/module.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> +#include <linux/property.h>
>   
>   #include <media/mipi-csi2.h>
>   #include <media/v4l2-device.h>
> @@ -450,25 +451,23 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
>   {
>   	struct fwnode_handle *fwnode;
>   	struct v4l2_async_connection *asc;
> -	struct device_node *node;
>   	int ret;
>   
> -	node = of_get_child_by_name(csi->dev->of_node, "csi-bridge");
> -	if (!node)
> +	fwnode = fwnode_get_named_child_node(csi->dev->fwnode, "csi-bridge");
> +	if (!fwnode)
>   		return -EINVAL;
>   
> -	fwnode = of_fwnode_handle(node);
> -	if (!fwnode) {
> -		of_node_put(node);
> -		return -EINVAL;
> -	}
> -
>   	v4l2_async_nf_init(&csi->notifier, &csi->v4l2_dev);
>   	csi->notifier.ops = &csi_async_notifier_ops;
>   
>   	asc = v4l2_async_nf_add_fwnode(&csi->notifier, fwnode,
>   				       struct v4l2_async_connection);
> -	of_node_put(node);
> +	/*
> +	 * Calling v4l2_async_nf_add_fwnode grabs a refcount,
> +	 * so drop the one we got in fwnode_get_named_child_node
> +	 */
> +	fwnode_handle_put(fwnode);
> +
>   	if (IS_ERR(asc)) {
>   		v4l2_async_nf_cleanup(&csi->notifier);
>   		return PTR_ERR(asc);
> 

