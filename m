Return-Path: <linux-media+bounces-31329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A42EAA0FD6
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 17:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 670041A82EE8
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 15:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481AC21C197;
	Tue, 29 Apr 2025 15:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g+AJ2qJ5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA53B21638C;
	Tue, 29 Apr 2025 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938847; cv=none; b=VqAfVP6rUWD2gZI/8SOZoaU7tX1czohKcCOQwMrKVM6ntXdZyJ5jowy6r36OZ+770kRjABo/UasYNdK4TTJaM/6J6oPYOle6D/Uf/Q5NKI3Qe7z8rIOAvmx3Z3QBotKYCa0fV57Zs7GTSElQgClRLhSdtbUGC0+2YzDSq9xKbmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938847; c=relaxed/simple;
	bh=GmQqrxPKJVoEDfqdT4l7kmFgVe/4Rzt/JW674BRH9go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWptcZ4dvehxN9wmShsl8D5jUly+SQ7eS15cMTs1lDCJfGWqwiAnj7/15kdZPMJ+zBWltVf982HBDV1w0HZ3tAZoLh8s5hSzFg38KKu/2/xFhpVPDlPTpxyhc6+6ekBGryRKvBqNdjSXiTmMyyktfazgDSS7EuIAXWB6QwaWytc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g+AJ2qJ5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EFD1669;
	Tue, 29 Apr 2025 17:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745938826;
	bh=GmQqrxPKJVoEDfqdT4l7kmFgVe/4Rzt/JW674BRH9go=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g+AJ2qJ532iCA6OPxzz2daA8BzqYu0ZZhTyVwFOrGvr0+/Rmlvpyk//Wg3FaUIM7Y
	 RLnoGvu0MXe7qTFtgbTlHvIp6I0MaMdoPFWjg1dyBvTz/2oODeVPlDDtXlhSF2ryEY
	 uqSuYbhdy7XTvi6uJq8QM08hgGmp1ltAci0DWFjg=
Message-ID: <3ff75993-40ee-4d17-8612-491ea4d19404@ideasonboard.com>
Date: Tue, 29 Apr 2025 18:00:28 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] media: renesas: vsp1: Make HSI and HST modules
 optional
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250409003815.10253-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250409003815.10253-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250409003815.10253-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/04/2025 03:38, Laurent Pinchart wrote:
> Not all VSP instance incorporate the HSI and HST modules. Add a
> VSP1_HAS_HSIT feature flag, and create the modules only on VSP instances
> that implement them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/media/platform/renesas/vsp1/vsp1.h    |  1 +
>   .../media/platform/renesas/vsp1/vsp1_drv.c    | 59 ++++++++++---------
>   2 files changed, 33 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
> index 2f6f0c6ae555..44cb991f094f 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1.h
> @@ -56,6 +56,7 @@ struct vsp1_uif;
>   #define VSP1_HAS_BRS		BIT(9)
>   #define VSP1_HAS_EXT_DL		BIT(10)
>   #define VSP1_HAS_NON_ZERO_LBA	BIT(11)
> +#define VSP1_HAS_HSIT		BIT(12)
>   
>   struct vsp1_device_info {
>   	u32 version;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 9fc6bf624a52..4697bf790954 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -302,22 +302,6 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
>   		list_add_tail(&vsp1->clu->entity.list_dev, &vsp1->entities);
>   	}
>   
> -	vsp1->hsi = vsp1_hsit_create(vsp1, true);
> -	if (IS_ERR(vsp1->hsi)) {
> -		ret = PTR_ERR(vsp1->hsi);
> -		goto done;
> -	}
> -
> -	list_add_tail(&vsp1->hsi->entity.list_dev, &vsp1->entities);
> -
> -	vsp1->hst = vsp1_hsit_create(vsp1, false);
> -	if (IS_ERR(vsp1->hst)) {
> -		ret = PTR_ERR(vsp1->hst);
> -		goto done;
> -	}
> -
> -	list_add_tail(&vsp1->hst->entity.list_dev, &vsp1->entities);
> -
>   	if (vsp1_feature(vsp1, VSP1_HAS_HGO) && vsp1->info->uapi) {
>   		vsp1->hgo = vsp1_hgo_create(vsp1);
>   		if (IS_ERR(vsp1->hgo)) {
> @@ -340,6 +324,24 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
>   			      &vsp1->entities);
>   	}
>   
> +	if (vsp1_feature(vsp1, VSP1_HAS_HSIT)) {
> +		vsp1->hsi = vsp1_hsit_create(vsp1, true);
> +		if (IS_ERR(vsp1->hsi)) {
> +			ret = PTR_ERR(vsp1->hsi);
> +			goto done;
> +		}
> +
> +		list_add_tail(&vsp1->hsi->entity.list_dev, &vsp1->entities);
> +
> +		vsp1->hst = vsp1_hsit_create(vsp1, false);
> +		if (IS_ERR(vsp1->hst)) {
> +			ret = PTR_ERR(vsp1->hst);
> +			goto done;
> +		}
> +
> +		list_add_tail(&vsp1->hst->entity.list_dev, &vsp1->entities);
> +	}
> +
>   	/*
>   	 * The LIFs are only supported when used in conjunction with the DU, in
>   	 * which case the userspace API is disabled. If the userspace API is
> @@ -683,8 +685,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>   		.model = "VSP1-S",
>   		.gen = 2,
>   		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_HGO
> -			  | VSP1_HAS_HGT | VSP1_HAS_LUT | VSP1_HAS_SRU
> -			  | VSP1_HAS_WPF_VFLIP,
> +			  | VSP1_HAS_HGT | VSP1_HAS_HSIT | VSP1_HAS_LUT
> +			  | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
>   		.rpf_count = 5,
>   		.uds_count = 3,
>   		.wpf_count = 4,
> @@ -694,7 +696,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>   		.version = VI6_IP_VERSION_MODEL_VSPR_H2,
>   		.model = "VSP1-R",
>   		.gen = 2,
> -		.features = VSP1_HAS_BRU | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
> +		.features = VSP1_HAS_BRU | VSP1_HAS_HSIT | VSP1_HAS_SRU
> +			   | VSP1_HAS_WPF_VFLIP,
>   		.rpf_count = 5,
>   		.uds_count = 3,
>   		.wpf_count = 4,
> @@ -704,7 +707,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>   		.version = VI6_IP_VERSION_MODEL_VSPD_GEN2,
>   		.model = "VSP1-D",
>   		.gen = 2,
> -		.features = VSP1_HAS_BRU | VSP1_HAS_HGO | VSP1_HAS_LUT,
> +		.features = VSP1_HAS_BRU | VSP1_HAS_HGO | VSP1_HAS_HSIT
> +			  | VSP1_HAS_LUT,
>   		.lif_count = 1,
>   		.rpf_count = 4,
>   		.uds_count = 1,
> @@ -716,8 +720,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>   		.model = "VSP1-S",
>   		.gen = 2,
>   		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_HGO
> -			  | VSP1_HAS_HGT | VSP1_HAS_LUT | VSP1_HAS_SRU
> -			  | VSP1_HAS_WPF_VFLIP,
> +			  | VSP1_HAS_HGT | VSP1_HAS_HSIT | VSP1_HAS_LUT
> +			  | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
>   		.rpf_count = 5,
>   		.uds_count = 1,
>   		.wpf_count = 4,
> @@ -727,8 +731,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>   		.version = VI6_IP_VERSION_MODEL_VSPS_V2H,
>   		.model = "VSP1V-S",
>   		.gen = 2,
> -		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_LUT
> -			  | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
> +		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_HSIT
> +			  | VSP1_HAS_LUT | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
>   		.rpf_count = 4,
>   		.uds_count = 1,
>   		.wpf_count = 4,
> @@ -738,7 +742,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>   		.version = VI6_IP_VERSION_MODEL_VSPD_V2H,
>   		.model = "VSP1V-D",
>   		.gen = 2,
> -		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_LUT,
> +		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_HSIT
> +			  | VSP1_HAS_LUT,
>   		.lif_count = 1,
>   		.rpf_count = 4,
>   		.uds_count = 1,
> @@ -750,8 +755,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>   		.model = "VSP2-I",
>   		.gen = 3,
>   		.features = VSP1_HAS_CLU | VSP1_HAS_HGO | VSP1_HAS_HGT
> -			  | VSP1_HAS_LUT | VSP1_HAS_SRU | VSP1_HAS_WPF_HFLIP
> -			  | VSP1_HAS_WPF_VFLIP,
> +			  | VSP1_HAS_HSIT | VSP1_HAS_LUT | VSP1_HAS_SRU
> +			  | VSP1_HAS_WPF_HFLIP | VSP1_HAS_WPF_VFLIP,
>   		.rpf_count = 1,
>   		.uds_count = 1,
>   		.wpf_count = 1,

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi


