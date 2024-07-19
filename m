Return-Path: <linux-media+bounces-15145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E693769E
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 12:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A211AB22B12
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 10:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5676C83CD5;
	Fri, 19 Jul 2024 10:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IWt2mv0c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554AA81211;
	Fri, 19 Jul 2024 10:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721384929; cv=none; b=BYOEckwDKS5gFrp2G/myVMrIO2qFpBEUOB4gGK4UXe/iGsyCl5V9WpNx04MjUY4P2Utrei3tuOlvemMsO16j7Hyp8kwn1bzy13NIlg5RB9545KNnOncP1iFJusuMCMJoaG8ewf9fDiGVvOVZjgZ/haJGW4MgsVJAz2PYLOyAxTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721384929; c=relaxed/simple;
	bh=/q47iXtzMVfOIcogFFYXMhnPbpkMe3e/B/3kRjnQkaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKvti/i8OLVi/3CusvZ+a4lJcK1cQM2FnZTR255Btrsi5Ib6EJbcZnzwdJoVZUDigrGCm7SgcYa9zNvLsRoJUtp3DlM/r5mYMhfMS18NDeCtyGpEyp1VuKVY7AUrtZAaW9itZWQbl2Zw5wpV1/N7w7kMiFqbyCGumEXANKa6LLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IWt2mv0c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-149-128.elisa-laajakaista.fi [91.157.149.128])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDD774AD;
	Fri, 19 Jul 2024 12:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721384886;
	bh=/q47iXtzMVfOIcogFFYXMhnPbpkMe3e/B/3kRjnQkaM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IWt2mv0cOy2a3+QRp4dOZE4RUVEMOSLORb6/14zGZ19+LhCpeOVPVrqL4OsMOoQ6w
	 vs9Guma8emtGwpj4YNJl9Qrc1KUFug050HyTY4NVe6bfLrmUKlddsMa1HAbU411HSQ
	 g8vsnGpCBPM2pF5b/750BjorhDnMBX8/WXj6SKHY=
Message-ID: <26af0977-8e38-47d0-a521-c5b1e505d564@ideasonboard.com>
Date: Fri, 19 Jul 2024 13:28:41 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: cadence: csi2rx: Add system PM support
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 Keith Zhao <keith.zhao@starfivetech.com>, Jayshri Pawar
 <jpawar@cadence.com>, Jai Luthra <j-luthra@ti.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
 <20240718032834.53876-3-changhuang.liang@starfivetech.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20240718032834.53876-3-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/07/2024 06:28, Changhuang Liang wrote:
> Add system PM support make it stopping streaming at system suspend time,
> and restarting streaming at system resume time.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>   drivers/media/platform/cadence/cdns-csi2rx.c | 32 ++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 981819adbb3a..81e90b31e9f8 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -776,8 +776,40 @@ static int csi2rx_runtime_resume(struct device *dev)
>   	return ret;
>   }
>   
> +static int __maybe_unused csi2rx_suspend(struct device *dev)
> +{
> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> +
> +	mutex_lock(&csi2rx->lock);
> +	if (csi2rx->count)
> +		csi2rx_stop(csi2rx);
> +	mutex_unlock(&csi2rx->lock);
> +
> +	pm_runtime_force_suspend(dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused csi2rx_resume(struct device *dev)
> +{
> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	mutex_lock(&csi2rx->lock);
> +	if (csi2rx->count)
> +		csi2rx_start(csi2rx);
> +	mutex_unlock(&csi2rx->lock);
> +
> +	return 0;
> +}
> +
>   static const struct dev_pm_ops csi2rx_pm_ops = {
>   	SET_RUNTIME_PM_OPS(csi2rx_runtime_suspend, csi2rx_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(csi2rx_suspend, csi2rx_resume)
>   };
>   
>   static const struct of_device_id csi2rx_of_table[] = {

If I'm not mistaken, this is a subdev driver, and is somewhere in the 
middle of the pipeline. Afaiu, only the driver that handles the v4l2 
video devices should have system suspend hooks. The job of that driver 
is then to disable or enable the pipeline using v4l2 functions, and for 
the rest of the pipeline system suspend looks just like a normal 
pipeline disable.

  Tomi


