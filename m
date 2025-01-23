Return-Path: <linux-media+bounces-25179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CECEA19EC4
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 08:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF0F37A3EF4
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 07:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F6B201023;
	Thu, 23 Jan 2025 07:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RBgfW3C6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27071BD01F;
	Thu, 23 Jan 2025 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737616659; cv=none; b=G434S+pxQ2uvs+yWsy4sTwYHyhJrwg56Mvz555O3Pc7mKKQ/riYaH5L8a83Mk2BXfqG5VKOQBVsSy+2JpNX7Fal9oal66Wgk1YGIhcw/swrbZZrtatjNXjETuCVL3ci4pY78kJvOegZjqVQjNSzBdLqdjGNw9mYxnptzgBCVUPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737616659; c=relaxed/simple;
	bh=/vH3Y3VRCkQvONSMOlWjNSv+gdP/iPcQZ8kqoqqRYu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AINq45mMWmuZUvU59RZ6YpW4dW/Qj9OVVQ4C/3z3p0hPZcCjk6h4sHM2+9q+z9qaaH1dCgIOTxRZicnKtNtpLeQC+CEhNo1DHg70HK4pk/3Z5DAt3o65DlhF0isbZ9G5980ND8j4fM0lgPfj/OdihBam4bQosBuL2fwEDwE0sbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RBgfW3C6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38CE63A4;
	Thu, 23 Jan 2025 08:16:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737616592;
	bh=/vH3Y3VRCkQvONSMOlWjNSv+gdP/iPcQZ8kqoqqRYu0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=RBgfW3C6/0kLF5b26J6Aa/Va7cViLp79knatD6WZl27WN/j8dQzZbzExMr2e8fo/R
	 Em1WKg/XuOpWwppQpxXlA/KTWABVCovip+ZDYW9bBbH76bhPyLXe6C+jcttlC/IMM0
	 Dur0VN/QQucKwD0FOEbt1m4xCITwQfhSfP2BBXfE=
Message-ID: <56f28d74-bafb-4c6e-926f-74f37e65b2c4@ideasonboard.com>
Date: Thu, 23 Jan 2025 09:17:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: rcar-vin: Remove superfluous suspended
 state
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
 <20250122165353.1273739-3-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250122165353.1273739-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/01/2025 18:53, Niklas Söderlund wrote:
> The VIN state of suspended is superfluous. The logic was that when the
> device where suspended and in a RUNNING state the state was set to

s/where/were/

> SUSPENDED. And when resuming it checked if the state is SUSPENDED and if
> so started the device and changed it to RUNNING.
> 
> This can be avoided by simply checking if the device is in a RUNNING
> state at both suspend and resume callbacks. Remove the unneeded
> complexity.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   drivers/media/platform/renesas/rcar-vin/rcar-core.c | 4 +---
>   drivers/media/platform/renesas/rcar-vin/rcar-vin.h  | 2 --
>   2 files changed, 1 insertion(+), 5 deletions(-)
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi

> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index ddfb18e6e7a4..b8e35ef4d9d8 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1085,8 +1085,6 @@ static int __maybe_unused rvin_suspend(struct device *dev)
>   
>   	rvin_stop_streaming(vin);
>   
> -	vin->state = SUSPENDED;
> -
>   	return 0;
>   }
>   
> @@ -1094,7 +1092,7 @@ static int __maybe_unused rvin_resume(struct device *dev)
>   {
>   	struct rvin_dev *vin = dev_get_drvdata(dev);
>   
> -	if (vin->state != SUSPENDED)
> +	if (vin->state != RUNNING)
>   		return 0;
>   
>   	/*
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> index d5763462809a..4cb25d8bbf32 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> @@ -67,14 +67,12 @@ enum rvin_isp_id {
>    * @STARTING:  Capture starting up
>    * @RUNNING:   Operation in progress have buffers
>    * @STOPPING:  Stopping operation
> - * @SUSPENDED: Capture is suspended
>    */
>   enum rvin_dma_state {
>   	STOPPED = 0,
>   	STARTING,
>   	RUNNING,
>   	STOPPING,
> -	SUSPENDED,
>   };
>   
>   /**


