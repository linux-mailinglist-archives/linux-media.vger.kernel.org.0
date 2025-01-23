Return-Path: <linux-media+bounces-25181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F09DA19EDC
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 08:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8A0A3A3E83
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 07:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C12B20B210;
	Thu, 23 Jan 2025 07:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="grYMdPu5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827D201023;
	Thu, 23 Jan 2025 07:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617053; cv=none; b=vF4gtCP3GKMjgoIVg+8GYa3qEW/rcAngm399XT2jdyWJzvVzIUAExCEhi5b6BqfB3BZojLlSzS75xXADPI3u2XagK9xLNGazmJwKEHUaMPFqVpCmtvEI4S5xvU1XBGClrQZijNxpZi1I/by/kP1WacVPFAKFhCCdePHH1bYaOwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617053; c=relaxed/simple;
	bh=XesGX8dwwo8WR67NzbSbaaylbEZYNb/wQMIZPicbNjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kr4Y7D8mq0uK68LQiC6X2XfSHLxhn3VK3rRGfdw2vaBoapech/HmRUdAyobZOczf/ndu+hW1f3Sy9mmLvIwAAcdvWLni9g6ieieeG+sq48uEE7KPCsAdZBzFjtWkRQlWRoCVxw4MBRwSx+HYFHFvN7Wb2nViAPBz47Dkl9/ZGmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=grYMdPu5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7557C3A4;
	Thu, 23 Jan 2025 08:23:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737616986;
	bh=XesGX8dwwo8WR67NzbSbaaylbEZYNb/wQMIZPicbNjw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=grYMdPu5By+7AbnlYkBVT+5RF3Ixv4lzE9hgNCW1yJFfx/7f69JNVTaO+sPtLXAxG
	 Q1/L9uh/dBBnR6481+LPrvHb25pzUAZXTDfmRo9StvXPp1DDzhsgCACm8uPDxrVeOV
	 oiyxso3cm49eXQE1xzrUlkj+NQy9r0Z2rwmCw/8s=
Message-ID: <d8d2b38a-3ab3-451b-80c7-ad9150f37675@ideasonboard.com>
Date: Thu, 23 Jan 2025 09:24:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] media: rcar-vin: Remove superfluous starting state
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
 <20250122165353.1273739-4-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250122165353.1273739-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/01/2025 18:53, Niklas Söderlund wrote:
> The STARTING state is superfluous and can be replaced with a check of
> the sequence counter. The design idea is that the first buffer returned
> from the driver have to come from the first hardware buffer slot.
> Failing this the first 3 buffers queued to the device can be returned
> out-of-order.
> 
> But it's much clearer to check the sequence counter to only return the
> first buffer if it comes from hardware slot 0 then it is to carry around
> an extra state just for this. Remove the unneeded state and replace it
> with a simpler check.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 5 ++---
>   drivers/media/platform/renesas/rcar-vin/rcar-vin.h | 2 --
>   2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

I don't understand the feature, though =). Why does the first buffer 
have to come from slot 0?

  Tomi

> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index a16adc6fd4dc..ba55ccf648de 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -1064,7 +1064,7 @@ static int rvin_capture_start(struct rvin_dev *vin)
>   	/* Continuous Frame Capture Mode */
>   	rvin_write(vin, VNFC_C_FRAME, VNFC_REG);
>   
> -	vin->state = STARTING;
> +	vin->state = RUNNING;
>   
>   	return 0;
>   }
> @@ -1120,14 +1120,13 @@ static irqreturn_t rvin_irq(int irq, void *data)
>   	 * To hand buffers back in a known order to userspace start
>   	 * to capture first from slot 0.
>   	 */
> -	if (vin->state == STARTING) {
> +	if (!vin->sequence) {
>   		if (slot != 0) {
>   			vin_dbg(vin, "Starting sync slot: %d\n", slot);
>   			goto done;
>   		}
>   
>   		vin_dbg(vin, "Capture start synced!\n");
> -		vin->state = RUNNING;
>   	}
>   
>   	/* Capture frame */
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> index 4cb25d8bbf32..f13ef379d095 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> @@ -64,13 +64,11 @@ enum rvin_isp_id {
>   /**
>    * enum rvin_dma_state - DMA states
>    * @STOPPED:   No operation in progress
> - * @STARTING:  Capture starting up
>    * @RUNNING:   Operation in progress have buffers
>    * @STOPPING:  Stopping operation
>    */
>   enum rvin_dma_state {
>   	STOPPED = 0,
> -	STARTING,
>   	RUNNING,
>   	STOPPING,
>   };


