Return-Path: <linux-media+bounces-51692-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIcjKCjSeGmNtQEAu9opvQ
	(envelope-from <linux-media+bounces-51692-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:56:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB6D961C8
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B16BD303D361
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 14:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246D035CB82;
	Tue, 27 Jan 2026 14:49:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71DC1DEFE9;
	Tue, 27 Jan 2026 14:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525383; cv=none; b=daUxxBJfGZ8gMPMZEvSlm+oIYrcQyu8kuad9rmQQuw9eWokPwgqDuxchCZZJuOOR/vvpaNImyzGR1VNVXdoB5E0IKDyva/B2HPWYCPsuUKuOzE1XR6upUN5n2ZaFUgQEpXLfKmHYO4XY6mF4yjyxNS4U55BUnh1lOEfr9Whgo10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525383; c=relaxed/simple;
	bh=1Himlk2cWUOe1Edpzbo0r4AnRcogAjnhWAaE1JVR8ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZR0xhleRzjD4BAQB80ijZTcdve3HUWYaCEJ0DD51bKThzCnqMcNY0bT1JM+jODNQsxVQTlruWVC1bAjzEYvg5Y5p78/lyH1XGy2ce1Clj+ZxOwz8wMpQuYHLYRhEYN9xCXHx0VIqZFn3sJ/t/hWrmX0F5ylUksNgElG6c4x7DY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C897F1595;
	Tue, 27 Jan 2026 06:49:34 -0800 (PST)
Received: from [10.57.51.176] (unknown [10.57.51.176])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 284C03F73F;
	Tue, 27 Jan 2026 06:49:36 -0800 (PST)
Message-ID: <02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com>
Date: Tue, 27 Jan 2026 14:49:34 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] media: iris: add context bank devices using iommu-map
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-5-e2646246bfc1@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260126-kaanapali-iris-v1-5-e2646246bfc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51692-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4EB6D961C8
X-Rspamd-Action: no action

On 2026-01-26 12:25 pm, Vikash Garodia wrote:
> Introduce different context banks(CB) and the associated buffer region.
> Different stream IDs from VPU would be associated to one of these CB.
> The patch ensures to handle CBs which are described as iommu-map in DT.
> Multiple CBs are needed to increase the IOVA for the video usecases like
> higher concurrent sessions.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      | 29 ++++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      | 55 ++++++++++++++++++++--
>   drivers/media/platform/qcom/iris/iris_resources.c  | 35 ++++++++++++++
>   drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
>   4 files changed, 116 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580eb10022fdcb52f7321a915e8b239d..d2d7c898fc8ef0de1b16aebd72681ea3c5b736ae 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -204,6 +204,33 @@ struct icc_vote_data {
>   	u32 fps;
>   };
>   
> +enum iris_iommu_map_function_id {
> +	IRIS_CB_NON_SECURE_NON_PIXEL	= 0x100,
> +	IRIS_CB_NON_SECURE_PIXEL	= 0x101,
> +	IRIS_CB_NON_SECURE_BITSTREAM	= 0x102,
> +	IRIS_CB_SECURE_NON_PIXEL	= 0x200,
> +	IRIS_CB_SECURE_PIXEL		= 0x201,
> +	IRIS_CB_SECURE_BITSTREAM	= 0x202,
> +	IRIS_CB_FIRMWARE		= 0x300,
> +};
> +
> +enum iris_buffer_region {
> +	IRIS_NON_SECURE_NON_PIXEL	= BIT(0),
> +	IRIS_NON_SECURE_PIXEL		= BIT(1),
> +	IRIS_NON_SECURE_BITSTREAM	= BIT(2),
> +	IRIS_SECURE_NON_PIXEL		= BIT(3),
> +	IRIS_SECURE_PIXEL		= BIT(4),
> +	IRIS_SECURE_BITSTREAM		= BIT(5),
> +};
> +
> +struct iris_context_bank {
> +	struct device *dev;
> +	const char *name;
> +	const enum iris_iommu_map_function_id f_id;
> +	const enum iris_buffer_region region;
> +	const u64 dma_mask;
> +};
> +
>   enum platform_pm_domain_type {
>   	IRIS_CTRL_POWER_DOMAIN,
>   	IRIS_HW_POWER_DOMAIN,
> @@ -246,6 +273,8 @@ struct iris_platform_data {
>   	u32 inst_fw_caps_enc_size;
>   	const struct tz_cp_config *tz_cp_config_data;
>   	u32 tz_cp_config_data_size;
> +	struct iris_context_bank *cb_data;
> +	u32 cb_data_size;
>   	u32 core_arch;
>   	u32 hw_response_timeout;
>   	struct ubwc_config_data *ubwc_config;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ddaacda523ecb9990af0dd0640196223fbcc2cab..c1a6aac5a3d65d980c5a34ba5fa1c1dbcf790ec5 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -123,6 +123,37 @@ static int iris_init_resets(struct iris_core *core)
>   				     core->iris_platform_data->controller_rst_tbl_size);
>   }
>   
> +static int iris_init_context_bank_devices(struct iris_core *core)
> +{
> +	struct iris_context_bank *cb;
> +	const __be32 *map_data;
> +	int tupple_size = 5;
> +	int i, j, ret, len;
> +	u32 fid;
> +
> +	map_data = of_get_property(core->dev->of_node, "iommu-map", &len);

If despite proposing all this hackery in the common OF code you're then 
_still_ going to open-code your own parsing of the property, with 
hard-coded assumptions to boot, then clearly this is not the appropriate 
approach at all...

> +	if (!map_data)
> +		return 0;
> +
> +	len /= sizeof(__be32);
> +
> +	for (i = 0; i < len; i += tupple_size) {
> +		fid = be32_to_cpu(map_data[i]);
> +
> +		for (j = 0; j < core->iris_platform_data->cb_data_size; j++) {
> +			cb = &core->iris_platform_data->cb_data[j];
> +
> +			if (fid == cb->f_id && !cb->dev) {
> +				ret = iris_create_child_device_and_map(core, cb);
> +				if (ret)
> +					return ret;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static int iris_init_resources(struct iris_core *core)
>   {
>   	int ret;
> @@ -139,7 +170,11 @@ static int iris_init_resources(struct iris_core *core)
>   	if (ret)
>   		return ret;
>   
> -	return iris_init_resets(core);
> +	ret = iris_init_resets(core);
> +	if (ret)
> +		return ret;
> +
> +	return iris_init_context_bank_devices(core);
>   }
>   
>   static int iris_register_video_device(struct iris_core *core, enum domain_type type)
> @@ -187,6 +222,8 @@ static int iris_register_video_device(struct iris_core *core, enum domain_type t
>   static void iris_remove(struct platform_device *pdev)
>   {
>   	struct iris_core *core;
> +	struct device *dev;
> +	int i;
>   
>   	core = platform_get_drvdata(pdev);
>   	if (!core)
> @@ -194,6 +231,14 @@ static void iris_remove(struct platform_device *pdev)
>   
>   	iris_core_deinit(core);
>   
> +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
> +		dev = core->iris_platform_data->cb_data[i].dev;
> +		if (dev) {
> +			platform_device_unregister(to_platform_device(dev));
> +			core->iris_platform_data->cb_data[i].dev = NULL;
> +		}
> +	}
> +
>   	video_unregister_device(core->vdev_dec);
>   	video_unregister_device(core->vdev_enc);
>   
> @@ -277,9 +322,11 @@ static int iris_probe(struct platform_device *pdev)
>   
>   	dma_mask = core->iris_platform_data->dma_mask;
>   
> -	ret = dma_set_mask_and_coherent(dev, dma_mask);
> -	if (ret)
> -		goto err_vdev_unreg_enc;
> +	if (device_iommu_mapped(core->dev)) {
> +		ret = dma_set_mask_and_coherent(core->dev, dma_mask);

Huh? Why would this be conditional? If it's a DMA device then it's a DMA 
device, regardless of whether an IOMMU driver happens to be present or not.

> +		if (ret)
> +			goto err_vdev_unreg_enc;
> +	}
>   
>   	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>   	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index 773f6548370a257b8ae7332242544266cbbd61a9..647f6760f2b7a6bab8a585a13eb03cf60a9c047e 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -6,6 +6,7 @@
>   #include <linux/clk.h>
>   #include <linux/devfreq.h>
>   #include <linux/interconnect.h>
> +#include <linux/of_device.h>
>   #include <linux/pm_domain.h>
>   #include <linux/pm_opp.h>
>   #include <linux/pm_runtime.h>
> @@ -141,3 +142,37 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
>   
>   	return 0;
>   }
> +
> +int iris_create_child_device_and_map(struct iris_core *core, struct iris_context_bank *cb)
> +{
> +	struct platform_device *pdev;
> +	int ret;
> +
> +	pdev = platform_device_alloc(cb->name, 0);
> +	if (!pdev)
> +		return -ENOMEM;
> +
> +	ret = platform_device_add(pdev);
> +	if (ret) {
> +		platform_device_put(pdev);
> +		return ret;
> +	}
> +
> +	ret = of_dma_configure_id(&pdev->dev, core->dev->of_node, true,
> +				  (const u32 *)&cb->f_id);

No. As I already said before, of_dma_configure() is for bus drivers; if 
you want to act like a bus, implement a proper bus_type with a 
.dma_configure callback. If you don't want to do that then describe the 
individual functional blocks of the codec appropriately as distinct 
devices with distinct hardware properties so the platform bus code can 
handle them correctly. It is not reasonable to advertise physical 
hardware to Linux as a single monolithic device, but then have a driver 
try to pull a "well actually..." by abusing all the internal 
abstractions. The fact that you might happen to avoid the warning from 
iommu_probe_device() because you're not binding drivers to these fake 
platform devices doesn't make this design any less wrong.

Thanks,
Robin.

> +	if (ret)
> +		goto error_unregister;
> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, cb->dma_mask);
> +	if (ret)
> +		goto error_unregister;
> +
> +	cb->dev = &pdev->dev;
> +
> +	return 0;
> +
> +error_unregister:
> +	platform_device_unregister(to_platform_device(&pdev->dev));
> +
> +	return ret;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
> index 6bfbd2dc6db095ec05e53c894e048285f82446c6..b7efe15facb203eea9ae13d5f0abdcc2ea718b4d 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.h
> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
> @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
>   int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>   int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
>   int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
> +int iris_create_child_device_and_map(struct iris_core *core, struct iris_context_bank *cb);
>   
>   #endif
> 


