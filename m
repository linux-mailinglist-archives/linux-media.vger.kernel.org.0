Return-Path: <linux-media+bounces-28838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0294A72D88
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 11:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78BA53B1499
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 10:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8090520E71B;
	Thu, 27 Mar 2025 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="H9BSvqmm"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43FF20E6FB;
	Thu, 27 Mar 2025 10:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070485; cv=none; b=CrGiG925HQuoKR1fZozIyVKsWWjakOAkkbujJ4lsmyDBPW0trTo8ZBSV2cB4uri9DC3gKSRwDmTkAcdV/QLg+v12cbZXNUcrKuOP0Aa+QwdNGEFKDsm+etOiCAEImk2qZenOMPsqJDPLoWgeKqFTyhusga+r4IuTP8RNEQAVyt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070485; c=relaxed/simple;
	bh=rnzBvdRbSTyIG6cy6l+uIjLmvLq18jqXRfIor1Iq/hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NhzCAJTtUiSqrNjUedPtKXTi/NPZ8ZJ+xRHLDKhoIFO4G33m8goMH807bZq89k0+fBV6efRYAk5HSg91/8MXyLHasM+Qwq2xYK4lFr6toxttYy77orEzj5PCFP2Au7MP+5uSWCAiLCbtnGwGWTNLdS1D3J7Rp+A3kS2RO7NvEdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=H9BSvqmm; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52RAEEx22362126
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 05:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743070454;
	bh=X9teR79IJRxW3SQmh9ToGw/nunmVP9SzQFNAQN9VgFI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=H9BSvqmmEyWsWMn3L2ssLCJHJPF2vfzqmRaEY7qtbvYc6QUFro12AhoQf3CJcKqiZ
	 GlGqs0yP4Ky0QNl1NzgYsUOiwZpta3ABZ+WWiFmZpuKy5jH+Y5TqLrUMntqOy8GkDA
	 mFlJ322ej1oO72C4dtoqDP572Ojsk4sGSERx46iY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52RAEEqL111973
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Mar 2025 05:14:14 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Mar 2025 05:14:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Mar 2025 05:14:13 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52RAE9Zj131057;
	Thu, 27 Mar 2025 05:14:10 -0500
Message-ID: <7a6966e8-dbbe-49de-84e4-127c22c7ca33@ti.com>
Date: Thu, 27 Mar 2025 15:44:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] media: ti: j721e-csi2rx: Fix source subdev link
 creation
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
 <20250324-probe_fixes-v1-3-5cd5b9e1cfac@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250324-probe_fixes-v1-3-5cd5b9e1cfac@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 24/03/25 17:31, Jai Luthra wrote:
> We don't use OF ports and remote-endpoints to connect the CSI2RX bridge
> and this device in the device tree, thus it is wrong to use
> v4l2_create_fwnode_links_to_pad() to create the media graph link between
> the two.
> 
> It works out on accident, as neither the source nor the sink implement
> the .get_fwnode_pad() callback, and the framework helper falls back on
> using the first source and sink pads to create the link between them.
> 
> Instead, manually create the media link from the first source pad of the
> bridge to the first sink pad of the J721E CSI2RX.
> 
> Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>   drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 6d406925e092660cb67c04cc2a7e1e10c14e295e..ad51d033b6725426550578bdac1bae8443458f13 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -53,6 +53,8 @@
>   #define DRAIN_TIMEOUT_MS		50
>   #define DRAIN_BUFFER_SIZE		SZ_32K
>   
> +#define CSI2RX_BRIDGE_SOURCE_PAD	1
> +
>   struct ti_csi2rx_fmt {
>   	u32				fourcc;	/* Four character code. */
>   	u32				code;	/* Mbus code. */
> @@ -427,8 +429,9 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>   	if (ret)
>   		return ret;
>   
> -	ret = v4l2_create_fwnode_links_to_pad(csi->source, &csi->pad,
> -					      MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
> +	ret = media_create_pad_link(&csi->source->entity, CSI2RX_BRIDGE_SOURCE_PAD,
> +				    &vdev->entity, csi->pad.index,
> +				    MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
>   
>   	if (ret) {
>   		video_unregister_device(vdev);
> 

