Return-Path: <linux-media+bounces-28810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED0A72A24
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 07:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A8A61896FBE
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 06:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEA01C3F30;
	Thu, 27 Mar 2025 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jT9wp617"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8A217E4;
	Thu, 27 Mar 2025 06:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743056755; cv=none; b=cmVCVJZAt2Ux1KhIQSrcwTsV6SHw79yP1EHLSNTg156FcsZg+qdwlqz/DHqDEDaIbKyBSlOGau9aKYxIhbooI6Jj/G+OUTZRQkg83jA4qCO1N3BWEHm96V7dy/hK7g0+Hf1DT+b2wp8RGfBYKef6BjFC2KXiOwkDV5qY2Iis51E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743056755; c=relaxed/simple;
	bh=AoXL8hpcNGRM86CC02gZufjwGC+N033mnX/R9DQvFTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rCqHlAJxRNfaBwodXY8bgalffPnzYpeAFsha30m57d6979fkGJHWf/c14pFMFLqcXrnr3m9nHMq+MbiuT+J2PKPYY4TwsgpPTSEcjfy6S9KgQDW13WXEQ/JVFbvU55rxgnLZulMX9htkgqqC+kdNglGl6uhHRrSnl0zqHNXterw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jT9wp617; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52R6PZRT2400369
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 01:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743056735;
	bh=X6X477M6Va5tmFzvIWyeyFPAoll0J0fqW7yMcUpyfIs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jT9wp617Nb+KhxmAumqwlwv2WEZXkT9C0gQFEk7k8EJmHA607mAlPG4gTeJA/g4iP
	 u7zVlOYTRV8A9zXKJja9hMRfT8GeEQYkVfVkUjl4MdpXaVgy131oKVFkTF9l8AiiUK
	 doU5CRR7HBOO9IvehTdzv6xKIcBBaAhf2VAGzpOc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52R6PZvA107600
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Mar 2025 01:25:35 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Mar 2025 01:25:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Mar 2025 01:25:35 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52R6PVGp070709;
	Thu, 27 Mar 2025 01:25:31 -0500
Message-ID: <b7439746-4143-4504-939e-e8abd705c962@ti.com>
Date: Thu, 27 Mar 2025 11:55:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: ti: j721e-csi2rx: Use
 devm_of_platform_populate
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
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com>
 <20250324-probe_fixes-v1-1-5cd5b9e1cfac@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250324-probe_fixes-v1-1-5cd5b9e1cfac@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 24/03/25 17:31, Jai Luthra wrote:
> Ensure that we clean up the platform bus when we remove this driver.
> 
> This fixes a crash seen when reloading the module for the child device
> with the parent not yet reloaded.
> 
> Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>   drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 6412a00be8eab89548950dd21b3b3ec02dafa5b4..a066024bf745450e2ba01d06c0fec4e6bdbfa97e 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -1118,7 +1118,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_vb2q;
>   
> -	ret = of_platform_populate(csi->dev->of_node, NULL, NULL, csi->dev);
> +	ret = devm_of_platform_populate(csi->dev);
>   	if (ret) {
>   		dev_err(csi->dev, "Failed to create children: %d\n", ret);
>   		goto err_subdev;
> 

