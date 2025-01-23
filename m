Return-Path: <linux-media+bounces-25185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 955EAA19F0D
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 08:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE90C16DAC2
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 07:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E8F20B7F9;
	Thu, 23 Jan 2025 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qvU/IBO2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADC61C5D55;
	Thu, 23 Jan 2025 07:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617671; cv=none; b=eODG7xvpqN9BPb+a+ylsffuseZkjQowKQFUJPvSQKC3IT05TqhZ/GwUGIYrMQPAYSMeWmW2yqwpTSrNmHYQ8Z6P146S0hLCahpitfnQT7OKDTHhpuL7s+5eigfcsnYuHphcdB/B89P4C7VI4Qnn+nsmw6S7FFUlRllpzdof8pZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617671; c=relaxed/simple;
	bh=Kvzir3h4qPXcy8Q7spj+PuouxRKRFerRc1mtEhtEbxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZYsj9kVNr2/EhGRPHo1Sgfp0jlTLNewEAQL6pYsI2rFYk4WVIxf4M/Ko5qWROlBO0j5Vc5tX9Q99e8xsmFFJ3k31LwF/q6DDQX2NIa6TPQYOkf13y+kQBXofWgxhXN5GXNi7ic6RCuyoMH0qTarvRYgrWyKNs0eLS7ehAVg9UiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qvU/IBO2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CA693A4;
	Thu, 23 Jan 2025 08:33:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737617605;
	bh=Kvzir3h4qPXcy8Q7spj+PuouxRKRFerRc1mtEhtEbxI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=qvU/IBO2pGwnvcto9SKBNZ+a5j0AqD7Jv8EoOXBhe2EmuwsIn+0+mIPXM4WdESca6
	 Tf1+RC3egcV1Nx8WjDLCwufZr9NgW0erfN/qA2NCqilSBIz3p7qE2jLmEFWOZVk8Rz
	 7SSHd71db5/DpSiXLabngTLO5cXhU1KXv4n/F0hw=
Message-ID: <a45fcc55-6521-4b90-9fce-2d935ef8f73f@ideasonboard.com>
Date: Thu, 23 Jan 2025 09:34:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] media: rcar-csi2: Remove hack to detect NTSC
 content
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
 <20250122165353.1273739-6-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250122165353.1273739-6-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/01/2025 18:53, Niklas Söderlund wrote:
> In an effort to emulate support for SEQ_{TB,BT} in the R-Car VIN driver
> on data captured from a CVBS input a hack was added to detect NTSC vs
> PAL. This is ugly and as support for emulated SEQ_{TB,BT} have been
> removed from the VIN driver remove the ugly hack.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   drivers/media/platform/renesas/rcar-csi2.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi

> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 0a53dd47d7bf..7dfa2729209d 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1045,16 +1045,10 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>   			vcdt2 |= vcdt_part << ((i % 2) * 16);
>   	}
>   
> -	if (fmt->field == V4L2_FIELD_ALTERNATE) {
> +	if (fmt->field == V4L2_FIELD_ALTERNATE)
>   		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
>   			| FLD_FLD_EN;
>   
> -		if (fmt->height == 240)
> -			fld |= FLD_FLD_NUM(0);
> -		else
> -			fld |= FLD_FLD_NUM(1);
> -	}
> -
>   	/*
>   	 * Get the number of active data lanes inspecting the remote mbus
>   	 * configuration.


