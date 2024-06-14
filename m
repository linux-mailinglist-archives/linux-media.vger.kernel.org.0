Return-Path: <linux-media+bounces-13284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE0A909347
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 22:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70D1F1C210EE
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 20:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7D71AB52D;
	Fri, 14 Jun 2024 20:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e85zUVgM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A2D146D6D;
	Fri, 14 Jun 2024 20:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718396115; cv=none; b=AzL8a+zXI8mHi15N4/d7eQuvCjifthhEcEDNINSH12g89Yggle5mcX16KvVaqlDSUAm7oZgRV+GSiW4twOXbZVm61XyWjjeH31hjsnGdgU75R2Y1TC5I+d+xvYBpoAMWsou+FZ0DY/JXN/Gnrs+4XJHH3KDyAZo2xOZ8viRIY2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718396115; c=relaxed/simple;
	bh=l/W+J6qPvynQpHpQmyda/968akOIsn5cZhnfNQgfVRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GI3//7O/g2wizYL1LY9V5aU5ofIJrCcMEwUjWSoZzX8k2yw0WVJV3cvJQjOmLho34qG0kAHfZs4jxW7/yshE9MBtctQ6IFVoJZKLTz1aWgC1O0gJ4rKnfieWY24BIpHAbqXLygTuArUQ+0Ut6EwrFpp7sOdpuOEed0xFE/iYTic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e85zUVgM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE766316;
	Fri, 14 Jun 2024 22:14:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718396095;
	bh=l/W+J6qPvynQpHpQmyda/968akOIsn5cZhnfNQgfVRg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e85zUVgMiS/J8/t5Ey5UhRFt1K3XmmRnP9Svx/Ca9/eiuod1dMR7ngaYZ0wAWhGHz
	 AbO8tpE/sOcGrLX+7Jo/KDbgs3ID/bHREIhBILRAanLLX/lBVd1ZuMvytGvlTPLNtL
	 JIBEUB8cnj+sKGYe+JCM570QBPUVa/h4MjOhAY1I=
Message-ID: <2063cbf3-73b7-4b34-8c3a-9fb530047842@ideasonboard.com>
Date: Fri, 14 Jun 2024 21:15:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/16] media: platform: Add mali-c55 parameters video
 node
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-16-dan.scally@ideasonboard.com>
 <ZmyRot1VIBXx3Ab8@valkosipuli.retiisi.eu>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 xsFNBGLydlEBEADa5O2s0AbUguprfvXOQun/0a8y2Vk6BqkQALgeD6KnXSWwaoCULp18etYW
 B31bfgrdphXQ5kUQibB0ADK8DERB4wrzrUb5CMxLBFE7mQty+v5NsP0OFNK9XTaAOcmD+Ove
 eIjYvqurAaro91jrRVrS1gBRxIFqyPgNvwwL+alMZhn3/2jU2uvBmuRrgnc/e9cHKiuT3Dtq
 MHGPKL2m+plk+7tjMoQFfexoQ1JKugHAjxAhJfrkXh6uS6rc01bYCyo7ybzg53m1HLFJdNGX
 sUKR+dQpBs3SY4s66tc1sREJqdYyTsSZf80HjIeJjU/hRunRo4NjRIJwhvnK1GyjOvvuCKVU
 RWpY8dNjNu5OeAfdrlvFJOxIE9M8JuYCQTMULqd1NuzbpFMjc9524U3Cngs589T7qUMPb1H1
 NTA81LmtJ6Y+IV5/kiTUANflpzBwhu18Ok7kGyCq2a2jsOcVmk8gZNs04gyjuj8JziYwwLbf
 vzABwpFVcS8aR+nHIZV1HtOzyw8CsL8OySc3K9y+Y0NRpziMRvutrppzgyMb9V+N31mK9Mxl
 1YkgaTl4ciNWpdfUe0yxH03OCuHi3922qhPLF4XX5LN+NaVw5Xz2o3eeWklXdouxwV7QlN33
 u4+u2FWzKxDqO6WLQGjxPE0mVB4Gh5Pa1Vb0ct9Ctg0qElvtGQARAQABzShEYW4gU2NhbGx5
 IDxkYW4uc2NhbGx5QGlkZWFzb25ib2FyZC5jb20+wsGNBBMBCAA3FiEEsdtt8OWP7+8SNfQe
 kiQuh/L+GMQFAmLydlIFCQWjmoACGwMECwkIBwUVCAkKCwUWAgMBAAAKCRCSJC6H8v4YxDI2
 EAC2Gz0iyaXJkPInyshrREEWbo0CA6v5KKf3I/HlMPqkZ48bmGoYm4mEQGFWZJAT3K4ir8bg
 cEfs9V54gpbrZvdwS4abXbUK4WjKwEs8HK3XJv1WXUN2bsz5oEJWZUImh9gD3naiLLI9QMMm
 w/aZkT+NbN5/2KvChRWhdcha7+2Te4foOY66nIM+pw2FZM6zIkInLLUik2zXOhaZtqdeJZQi
 HSPU9xu7TRYN4cvdZAnSpG7gQqmLm5/uGZN1/sB3kHTustQtSXKMaIcD/DMNI3JN/t+RJVS7
 c0Jh/ThzTmhHyhxx3DRnDIy7kwMI4CFvmhkVC2uNs9kWsj1DuX5kt8513mvfw2OcX9UnNKmZ
 nhNCuF6DxVrL8wjOPuIpiEj3V+K7DFF1Cxw1/yrLs8dYdYh8T8vCY2CHBMsqpESROnTazboh
 AiQ2xMN1cyXtX11Qwqm5U3sykpLbx2BcmUUUEAKNsM//Zn81QXKG8vOx0ZdMfnzsCaCzt8f6
 9dcDBBI3tJ0BI9ByiocqUoL6759LM8qm18x3FYlxvuOs4wSGPfRVaA4yh0pgI+ModVC2Pu3y
 ejE/IxeatGqJHh6Y+iJzskdi27uFkRixl7YJZvPJAbEn7kzSi98u/5ReEA8Qhc8KO/B7wprj
 xjNMZNYd0Eth8+WkixHYj752NT5qshKJXcyUU87BTQRi8nZSARAAx0BJayh1Fhwbf4zoY56x
 xHEpT6DwdTAYAetd3yiKClLVJadYxOpuqyWa1bdfQWPb+h4MeXbWw/53PBgn7gI2EA7ebIRC
 PJJhAIkeym7hHZoxqDQTGDJjxFEL11qF+U3rhWiL2Zt0Pl+zFq0eWYYVNiXjsIS4FI2+4m16
 tPbDWZFJnSZ828VGtRDQdhXfx3zyVX21lVx1bX4/OZvIET7sVUufkE4hrbqrrufre7wsjD1t
 8MQKSapVrr1RltpzPpScdoxknOSBRwOvpp57pJJe5A0L7+WxJ+vQoQXj0j+5tmIWOAV1qBQp
 hyoyUk9JpPfntk2EKnZHWaApFp5TcL6c5LhUvV7F6XwOjGPuGlZQCWXee9dr7zym8iR3irWT
 +49bIh5PMlqSLXJDYbuyFQHFxoiNdVvvf7etvGfqFYVMPVjipqfEQ38ST2nkzx+KBICz7uwj
 JwLBdTXzGFKHQNckGMl7F5QdO/35An/QcxBnHVMXqaSd12tkJmoRVWduwuuoFfkTY5mUV3uX
 xGj3iVCK4V+ezOYA7c2YolfRCNMTza6vcK/P4tDjjsyBBZrCCzhBvd4VVsnnlZhVaIxoky4K
 aL+AP+zcQrUZmXmgZjXOLryGnsaeoVrIFyrU6ly90s1y3KLoPsDaTBMtnOdwxPmo1xisH8oL
 a/VRgpFBfojLPxMAEQEAAcLBfAQYAQgAJhYhBLHbbfDlj+/vEjX0HpIkLofy/hjEBQJi8nZT
 BQkFo5qAAhsMAAoJEJIkLofy/hjEXPcQAMIPNqiWiz/HKu9W4QIf1OMUpKn3YkVIj3p3gvfM
 Res4fGX94Ji599uLNrPoxKyaytC4R6BTxVriTJjWK8mbo9jZIRM4vkwkZZ2bu98EweSucxbp
 vjESsvMXGgxniqV/RQ/3T7LABYRoIUutARYq58p5HwSP0frF0fdFHYdTa2g7MYZl1ur2JzOC
 FHRpGadlNzKDE3fEdoMobxHB3Lm6FDml5GyBAA8+dQYVI0oDwJ3gpZPZ0J5Vx9RbqXe8RDuR
 du90hvCJkq7/tzSQ0GeD3BwXb9/R/A4dVXhaDd91Q1qQXidI+2jwhx8iqiYxbT+DoAUkQRQy
 xBtoCM1CxH7u45URUgD//fxYr3D4B1SlonA6vdaEdHZOGwECnDpTxecENMbz/Bx7qfrmd901
 D+N9SjIwrbVhhSyUXYnSUb8F+9g2RDY42Sk7GcYxIeON4VzKqWM7hpkXZ47pkK0YodO+dRKM
 yMcoUWrTK0Uz6UzUGKoJVbxmSW/EJLEGoI5p3NWxWtScEVv8mO49gqQdrRIOheZycDmHnItt
 9Qjv00uFhEwv2YfiyGk6iGF2W40s2pH2t6oeuGgmiZ7g6d0MEK8Ql/4zPItvr1c1rpwpXUC1
 u1kQWgtnNjFHX3KiYdqjcZeRBiry1X0zY+4Y24wUU0KsEewJwjhmCKAsju1RpdlPg2kC
In-Reply-To: <ZmyRot1VIBXx3Ab8@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari - thanks for the comments

On 14/06/2024 19:53, Sakari Ailus wrote:
> Hi Jacopo, Dan,
>
> Thanks for the patch. Please see my comments below.
>
> On Wed, May 29, 2024 at 04:28:57PM +0100, Daniel Scally wrote:
>> Add a new code file to the mali-c55 driver that registers an output
>> video node for userspace to queue buffers of parameters to. Handlers
>> are included to program the statistics generation plus the white
>> balance, black level correction and mesh shading correction blocks.
>>
>> Update the rest of the driver to register and link the new video node
>>
>> Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
>> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>> Changes in v5:
>>
>> 	- New patch
>>
>>   drivers/media/platform/arm/mali-c55/Makefile  |   1 +
>>   .../platform/arm/mali-c55/mali-c55-common.h   |  18 +
>>   .../platform/arm/mali-c55/mali-c55-core.c     |  24 +
>>   .../platform/arm/mali-c55/mali-c55-isp.c      |  16 +-
>>   .../platform/arm/mali-c55/mali-c55-params.c   | 615 ++++++++++++++++++
>>   .../arm/mali-c55/mali-c55-registers.h         | 104 +++
>>   6 files changed, 777 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-params.c
>>
>> diff --git a/drivers/media/platform/arm/mali-c55/Makefile b/drivers/media/platform/arm/mali-c55/Makefile
>> index cd5a64bf0c62..b2443f2d416a 100644
>> --- a/drivers/media/platform/arm/mali-c55/Makefile
>> +++ b/drivers/media/platform/arm/mali-c55/Makefile
>> @@ -5,6 +5,7 @@ mali-c55-y := mali-c55-capture.o \
>>   	      mali-c55-isp.o \
>>   	      mali-c55-tpg.o \
>>   	      mali-c55-resizer.o \
>> +	      mali-c55-params.o \
>>   	      mali-c55-stats.o
>>   
>>   obj-$(CONFIG_VIDEO_MALI_C55) += mali-c55.o
>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
>> index 44119e04009b..565d98acfcdd 100644
>> --- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
>> @@ -80,6 +80,7 @@ enum mali_c55_isp_pads {
>>   	MALI_C55_ISP_PAD_SOURCE,
>>   	MALI_C55_ISP_PAD_SOURCE_BYPASS,
>>   	MALI_C55_ISP_PAD_SOURCE_3A,
>> +	MALI_C55_ISP_PAD_SINK_PARAMS,
>>   	MALI_C55_ISP_NUM_PADS,
>>   };
>>   
>> @@ -217,6 +218,19 @@ struct mali_c55_stats {
>>   	} buffers;
>>   };
>>   
>> +struct mali_c55_params {
>> +	struct mali_c55 *mali_c55;
>> +	struct video_device vdev;
>> +	struct vb2_queue queue;
>> +	struct media_pad pad;
>> +	struct mutex lock;
>> +
>> +	struct {
>> +		spinlock_t lock;
>> +		struct list_head queue;
>> +	} buffers;
>> +};
>> +
>>   enum mali_c55_config_spaces {
>>   	MALI_C55_CONFIG_PING,
>>   	MALI_C55_CONFIG_PONG,
>> @@ -247,6 +261,7 @@ struct mali_c55 {
>>   	struct mali_c55_isp isp;
>>   	struct mali_c55_resizer resizers[MALI_C55_NUM_RZRS];
>>   	struct mali_c55_cap_dev cap_devs[MALI_C55_NUM_CAP_DEVS];
>> +	struct mali_c55_params params;
>>   	struct mali_c55_stats stats;
>>   
>>   	struct list_head contexts;
>> @@ -271,6 +286,8 @@ int mali_c55_register_capture_devs(struct mali_c55 *mali_c55);
>>   void mali_c55_unregister_capture_devs(struct mali_c55 *mali_c55);
>>   int mali_c55_register_stats(struct mali_c55 *mali_c55);
>>   void mali_c55_unregister_stats(struct mali_c55 *mali_c55);
>> +int mali_c55_register_params(struct mali_c55 *mali_c55);
>> +void mali_c55_unregister_params(struct mali_c55 *mali_c55);
>>   struct mali_c55_ctx *mali_c55_get_active_context(struct mali_c55 *mali_c55);
>>   void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
>>   			     enum mali_c55_planes plane);
>> @@ -290,5 +307,6 @@ bool mali_c55_isp_is_format_supported(unsigned int mbus_code);
>>   	for ((fmt) = NULL; ((fmt) = mali_c55_isp_fmt_next((fmt)));)
>>   void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
>>   				enum mali_c55_config_spaces cfg_space);
>> +void mali_c55_params_write_config(struct mali_c55 *mali_c55);
>>   
>>   #endif /* _MALI_C55_COMMON_H */
>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
>> index 2cf8b1169604..6acee3edd03f 100644
>> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
>> @@ -347,6 +347,17 @@ static int mali_c55_create_links(struct mali_c55 *mali_c55)
>>   		goto err_remove_links;
>>   	}
>>   
>> +	ret = media_create_pad_link(&mali_c55->params.vdev.entity, 0,
>> +				    &mali_c55->isp.sd.entity,
>> +				    MALI_C55_ISP_PAD_SINK_PARAMS,
>> +				    MEDIA_LNK_FL_ENABLED |
>> +				    MEDIA_LNK_FL_IMMUTABLE);
>> +	if (ret) {
>> +		dev_err(mali_c55->dev,
>> +			"failed to link ISP and parameters video node\n");
>> +		goto err_remove_links;
>> +	}
>> +
>>   	return 0;
>>   
>>   err_remove_links:
>> @@ -360,6 +371,7 @@ static void mali_c55_unregister_entities(struct mali_c55 *mali_c55)
>>   	mali_c55_unregister_isp(mali_c55);
>>   	mali_c55_unregister_resizers(mali_c55);
>>   	mali_c55_unregister_capture_devs(mali_c55);
>> +	mali_c55_unregister_params(mali_c55);
>>   	mali_c55_unregister_stats(mali_c55);
>>   }
>>   
>> @@ -383,6 +395,10 @@ static int mali_c55_register_entities(struct mali_c55 *mali_c55)
>>   	if (ret)
>>   		goto err_unregister_entities;
>>   
>> +	ret = mali_c55_register_params(mali_c55);
>> +	if (ret)
>> +		goto err_unregister_entities;
>> +
>>   	ret = mali_c55_register_stats(mali_c55);
>>   	if (ret)
>>   		goto err_unregister_entities;
>> @@ -474,6 +490,14 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
>>   			curr_config >>= ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1;
>>   			next_config = curr_config ^ 1;
>>   
>> +			/*
>> +			 * Write the configuration parameters received from
>> +			 * userspace into the configuration buffer, which will
>> +			 * be transferred to the 'next' active config space at
>> +			 * by mali_c55_swap_next_config().
>> +			 */
>> +			mali_c55_params_write_config(mali_c55);
>> +
>>   			/*
>>   			 * The ordering of these two is currently important as
>>   			 * mali_c55_stats_fill_buffer() is asynchronous whereas
>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>> index 94876fba3353..8c2b45bfd82d 100644
>> --- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>> @@ -146,6 +146,7 @@ static int mali_c55_isp_start(struct mali_c55 *mali_c55)
>>   			     cfg->encoding == V4L2_PIXEL_ENC_RGB ?
>>   			     MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK : 0x00);
>>   
>> +	mali_c55_params_write_config(mali_c55);
>>   	ret = mali_c55_config_write(ctx, MALI_C55_CONFIG_PING);
>>   	if (ret) {
>>   		dev_err(mali_c55->dev, "failed to DMA config\n");
>> @@ -455,8 +456,20 @@ static const struct v4l2_subdev_internal_ops mali_c55_isp_internal_ops = {
>>   	.init_state = mali_c55_isp_init_state,
>>   };
>>   
>> +static int mali_c55_subdev_link_validate(struct media_link *link)
>> +{
>> +	/*
>> +	 * Skip validation for the parameters sink pad, as the source is not
>> +	 * a subdevice.
>> +	 */
>> +	if (link->sink->index == MALI_C55_ISP_PAD_SINK_PARAMS)
>> +		return 0;
>> +
>> +	return v4l2_subdev_link_validate(link);
>> +}
>> +
>>   static const struct media_entity_operations mali_c55_isp_media_ops = {
>> -	.link_validate		= v4l2_subdev_link_validate,
>> +	.link_validate		= mali_c55_subdev_link_validate,
>>   };
>>   
>>   static int mali_c55_isp_notifier_bound(struct v4l2_async_notifier *notifier,
>> @@ -565,6 +578,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
>>   	isp->pads[MALI_C55_ISP_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
>>   	isp->pads[MALI_C55_ISP_PAD_SOURCE_BYPASS].flags = MEDIA_PAD_FL_SOURCE;
>>   	isp->pads[MALI_C55_ISP_PAD_SOURCE_3A].flags = MEDIA_PAD_FL_SOURCE;
>> +	isp->pads[MALI_C55_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
>>   
>>   	ret = media_entity_pads_init(&sd->entity, MALI_C55_ISP_NUM_PADS,
>>   				     isp->pads);
>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
>> new file mode 100644
>> index 000000000000..049a7b8e4861
>> --- /dev/null
>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
>> @@ -0,0 +1,615 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * ARM Mali-C55 ISP Driver - Configuration parameters output device
>> + *
>> + * Copyright (C) 2024 Ideas on Board Oy
>> + */
>> +#include <linux/media/arm/mali-c55-config.h>
>> +
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-fh.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/videobuf2-core.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#include "mali-c55-common.h"
>> +#include "mali-c55-registers.h"
>> +
>> +typedef void (*mali_c55_block_handler)(struct mali_c55 *mali_c55,
> You can wrap after the return type (including typedef). Same elsewhere.
>
>> +				       struct mali_c55_params_block_header *block);
>> +
>> +struct mali_c55_block_handler {
>> +	size_t size;
>> +	mali_c55_block_handler handler;
>> +};
>> +
>> +static void mali_c55_params_sensor_offs(struct mali_c55 *mali_c55,
>> +					struct mali_c55_params_block_header *block)
>> +{
>> +	struct mali_c55_params_sensor_off_preshading *p =
>> +		(struct mali_c55_params_sensor_off_preshading *)block;
> I wonder if an union could be used to make this a bit cleaner. You're doing
> a lot of casting that I think could be avoided.


Interesting idea, thank you - let me give that a try and see how it looks

>
>> +	__u32 global_offset;
>> +
>> +	if (!block->enabled)
>> +		return;
>> +
>> +	if (!(p->chan00 || p->chan01 || p->chan10 || p->chan11))
>> +		return;
>> +
>> +	mali_c55_write(mali_c55, MALI_C55_REG_SENSOR_OFF_PRE_SHA_00,
>> +		       p->chan00 & MALI_C55_SENSOR_OFF_PRE_SHA_MASK);
>> +	mali_c55_write(mali_c55, MALI_C55_REG_SENSOR_OFF_PRE_SHA_01,
>> +		       p->chan01 & MALI_C55_SENSOR_OFF_PRE_SHA_MASK);
>> +	mali_c55_write(mali_c55, MALI_C55_REG_SENSOR_OFF_PRE_SHA_10,
>> +		       p->chan10 & MALI_C55_SENSOR_OFF_PRE_SHA_MASK);
>> +	mali_c55_write(mali_c55, MALI_C55_REG_SENSOR_OFF_PRE_SHA_11,
>> +		       p->chan11 & MALI_C55_SENSOR_OFF_PRE_SHA_MASK);
>> +
>> +	/*
>> +	 * The average offset is applied as a global offset for the digital
>> +	 * gain block
>> +	 */
>> +	global_offset = (p->chan00 + p->chan01 + p->chan10 + p->chan11) >> 2;
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_DIGITAL_GAIN_OFFSET,
>> +			     MALI_C55_DIGITAL_GAIN_OFFSET_MASK, global_offset);
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
>> +			     MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH, 0x00);
>> +}
>> +
>> +static void mali_c55_params_aexp_hist(struct mali_c55 *mali_c55,
>> +				struct mali_c55_params_block_header *block)
>> +{
>> +	u32 disable_mask = block->type == MALI_C55_PARAM_BLOCK_AEXP_HIST ?
>> +					  MALI_C55_AEXP_HIST_DISABLE_MASK :
>> +					  MALI_C55_AEXP_IHIST_DISABLE_MASK;
>> +	u32 base = block->type == MALI_C55_PARAM_BLOCK_AEXP_HIST ?
>> +				  MALI_C55_REG_AEXP_HIST_BASE :
>> +				  MALI_C55_REG_AEXP_IHIST_BASE;
>> +	struct mali_c55_params_aexp_hist *params =
>> +		(struct mali_c55_params_aexp_hist *)block;
>> +
>> +	if (!block->enabled) {
>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
>> +				     disable_mask, true);
>> +		return;
>> +	}
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
>> +			     disable_mask, false);
>> +
>> +	mali_c55_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SKIP_OFFSET,
>> +			     MALI_C55_AEXP_HIST_SKIP_X_MASK, params->skip_x);
>> +	mali_c55_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SKIP_OFFSET,
>> +			     MALI_C55_AEXP_HIST_OFFSET_X_MASK, params->offset_x);
>> +	mali_c55_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SKIP_OFFSET,
>> +			     MALI_C55_AEXP_HIST_SKIP_Y_MASK, params->skip_y);
>> +	mali_c55_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SKIP_OFFSET,
>> +			     MALI_C55_AEXP_HIST_OFFSET_Y_MASK, params->offset_y);
>> +
>> +	mali_c55_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SCALE_OFFSET,
>> +			     MALI_C55_AEXP_HIST_SCALE_BOTTOM_MASK, params->scale_bottom);
>> +	mali_c55_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SCALE_OFFSET,
>> +			     MALI_C55_AEXP_HIST_SCALE_TOP_MASK, params->scale_top);
>> +
>> +	mali_c55_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_PLANE_MODE_OFFSET,
>> +			     MALI_C55_AEXP_HIST_PLANE_MODE_MASK, params->plane_mode);
>> +
>> +	if (block->type == MALI_C55_PARAM_BLOCK_AEXP_HIST)
>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
>> +				     MALI_C55_AEXP_HIST_SWITCH_MASK,
>> +				     params->tap_point);
>> +}
>> +
>> +static void
>> +mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
>> +				  struct mali_c55_params_block_header *block)
>> +{
>> +	struct mali_c55_params_aexp_weights *params =
>> +		(struct mali_c55_params_aexp_weights *)block;
>> +	u32 base;
>> +
>> +	if (!block->enabled)
>> +		return;
>> +
>> +	base = block->type == MALI_C55_PARAM_BLOCK_AEXP_HIST_WEIGHTS ?
>> +			      MALI_C55_REG_AEXP_HIST_BASE :
>> +			      MALI_C55_REG_AEXP_IHIST_BASE;
>> +
>> +	mali_c55_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_NODES_USED_OFFSET,
>> +			     MALI_C55_AEXP_HIST_NODES_USED_HORIZ_MASK, params->nodes_used_horiz);
>> +	mali_c55_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_NODES_USED_OFFSET,
>> +			     MALI_C55_AEXP_HIST_NODES_USED_VERT_MASK, params->nodes_used_vert);
>> +
>> +	/*
>> +	 * The zone weights array is a 225-element array of u8 values, but that
>> +	 * is a bit annoying to handle given the ISP expects 32-bit writes. We
>> +	 * just reinterpret it as a 57-element array of 32-bit values for the
>> +	 * purposes of this transaction (the 3 bytes of additional space at the
>> +	 * end of the write is just padding for the array of weights in the ISP
>> +	 * memory space anyway, so there's no risk of overwriting other
>> +	 * registers).
>> +	 */
>> +	for (unsigned int i = 0; i < 57; i++) {
>> +		u32 val = ((u32 *)params->zone_weights)[i]
>> +			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;
>> +		u32 addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
>> +
>> +		mali_c55_write(mali_c55, addr, val);
>> +	}
>> +}
>> +
>> +static void mali_c55_params_digital_gain(struct mali_c55 *mali_c55,
>> +					 struct mali_c55_params_block_header *block)
>> +{
>> +	struct mali_c55_params_digital_gain *dgain =
>> +		(struct mali_c55_params_digital_gain *)block;
>> +
>> +	/*
>> +	 * If the block is flagged as disabled we write a gain of 1.0, which in
>> +	 * Q5.8 format is 256.
>> +	 */
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_DIGITAL_GAIN,
>> +			     MALI_C55_DIGITAL_GAIN_MASK,
>> +			     block->enabled ? dgain->gain : 256);
>> +}
>> +
>> +static void mali_c55_params_awb_gains(struct mali_c55 *mali_c55,
>> +				      struct mali_c55_params_block_header *block)
>> +{
>> +	struct mali_c55_params_awb_gains *gains =
>> +		(struct mali_c55_params_awb_gains *)block;
>> +
>> +	/*
>> +	 * There are two places AWB gains can be set in the ISP; one affects the
>> +	 * image output data and the other affects the statistics for the
>> +	 * AEXP-0 tap point.
>> +	 */
>> +	u32 addr1 = block->type = MALI_C55_PARAM_BLOCK_AWB_GAINS ?
>> +				  MALI_C55_REG_AWB_GAINS1 :
>> +				  MALI_C55_REG_AWB_GAINS1_AEXP;
>> +	u32 addr2 = block->type = MALI_C55_PARAM_BLOCK_AWB_GAINS ?
>> +				  MALI_C55_REG_AWB_GAINS2 :
>> +				  MALI_C55_REG_AWB_GAINS2_AEXP;
>> +
>> +	mali_c55_update_bits(mali_c55, addr1, MALI_C55_AWB_GAIN00_MASK,
>> +			     gains->gain00);
>> +	mali_c55_update_bits(mali_c55, addr1, MALI_C55_AWB_GAIN01_MASK,
>> +			     gains->gain01);
>> +	mali_c55_update_bits(mali_c55, addr2, MALI_C55_AWB_GAIN10_MASK,
>> +			     gains->gain10);
>> +	mali_c55_update_bits(mali_c55, addr2, MALI_C55_AWB_GAIN11_MASK,
>> +			     gains->gain11);
>> +}
>> +
>> +static void mali_c55_params_awb_config(struct mali_c55 *mali_c55,
>> +				      struct mali_c55_params_block_header *block)
>> +{
>> +	struct mali_c55_params_awb_config *params =
>> +		(struct mali_c55_params_awb_config *)block;
>> +
>> +	if (!block->enabled) {
>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
>> +				     MALI_C55_AWB_DISABLE_MASK, true);
>> +		return;
>> +	}
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
>> +			     MALI_C55_AWB_DISABLE_MASK, false);
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_AWB_STATS_MODE,
>> +			     MALI_C55_AWB_STATS_MODE_MASK, params->stats_mode);
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_AWB_WHITE_LEVEL,
>> +			     MALI_C55_AWB_WHITE_LEVEL_MASK, params->white_level);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_AWB_BLACK_LEVEL,
>> +			     MALI_C55_AWB_BLACK_LEVEL_MASK, params->black_level);
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_AWB_CR_MAX,
>> +			     MALI_C55_AWB_CR_MAX_MASK, params->cr_max);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_AWB_CR_MIN,
>> +			     MALI_C55_AWB_CR_MIN_MASK, params->cr_min);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_AWB_CB_MAX,
>> +			     MALI_C55_AWB_CB_MAX_MASK, params->cb_max);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_AWB_CB_MIN,
>> +			     MALI_C55_AWB_CB_MIN_MASK, params->cb_min);
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_AWB_NODES_USED,
>> +			     MALI_C55_AWB_NODES_USED_HORIZ_MASK,
>> +			     params->nodes_used_horiz);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_AWB_NODES_USED,
>> +			     MALI_C55_AWB_NODES_USED_VERT_MASK,
>> +			     params->nodes_used_vert);
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_AWB_CR_HIGH,
>> +			     MALI_C55_AWB_CR_HIGH_MASK, params->cr_high);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_AWB_CR_LOW,
>> +			     MALI_C55_AWB_CR_LOW_MASK, params->cr_low);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_AWB_CB_HIGH,
>> +			     MALI_C55_AWB_CB_HIGH_MASK, params->cb_high);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_AWB_CB_LOW,
>> +			     MALI_C55_AWB_CB_LOW_MASK, params->cb_low);
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
>> +			     MALI_C55_AWB_SWITCH_MASK, params->tap_point);
>> +}
>> +
>> +static void mali_c55_params_lsc_config(struct mali_c55 *mali_c55,
>> +				       struct mali_c55_params_block_header *block)
>> +{
>> +	struct mali_c55_params_mesh_shading_config *params =
>> +		(struct mali_c55_params_mesh_shading_config *)block;
>> +	unsigned int i;
>> +	u32 addr;
>> +
>> +	if (!block->enabled) {
>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
>> +				     MALI_C55_MESH_SHADING_ENABLE_MASK, false);
>> +		return;
>> +	}
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
>> +			     MALI_C55_MESH_SHADING_ENABLE_MASK, true);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
>> +			     MALI_C55_MESH_SHADING_MESH_SHOW, params->mesh_show);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
>> +			     MALI_C55_MESH_SHADING_SCALE_MASK,
>> +			     params->mesh_scale);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
>> +			     MALI_C55_MESH_SHADING_PAGE_R_MASK,
>> +			     params->mesh_page_r);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
>> +			     MALI_C55_MESH_SHADING_PAGE_G_MASK,
>> +			     params->mesh_page_g);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
>> +			     MALI_C55_MESH_SHADING_PAGE_B_MASK,
>> +			     params->mesh_page_b);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
>> +			     MALI_C55_MESH_SHADING_MESH_WIDTH_MASK,
>> +			     params->mesh_width);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
>> +			     MALI_C55_MESH_SHADING_MESH_HEIGHT_MASK,
>> +			     params->mesh_height);
>> +
>> +	for (i = 0; i < MALI_C55_NUM_MESH_SHADING_ELEMENTS; i++) {
>> +		addr = MALI_C55_REG_MESH_SHADING_TABLES + (i * 4);
>> +		mali_c55_write(mali_c55, addr, params->mesh[i]);
>> +	}
>> +}
>> +
>> +static void mali_c55_params_lsc_selection(struct mali_c55 *mali_c55,
>> +					  struct mali_c55_params_block_header *block)
>> +{
>> +	struct mali_c55_params_mesh_shading_selection *params =
>> +		(struct mali_c55_params_mesh_shading_selection *)block;
>> +
>> +	if (!block->enabled)
>> +		return;
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA_BANK,
>> +			     MALI_C55_MESH_SHADING_ALPHA_BANK_R_MASK,
>> +			     params->mesh_alpha_bank_r);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA_BANK,
>> +			     MALI_C55_MESH_SHADING_ALPHA_BANK_G_MASK,
>> +			     params->mesh_alpha_bank_g);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA_BANK,
>> +			     MALI_C55_MESH_SHADING_ALPHA_BANK_B_MASK,
>> +			     params->mesh_alpha_bank_b);
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA,
>> +			     MALI_C55_MESH_SHADING_ALPHA_R_MASK,
>> +			     params->mesh_alpha_r);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA,
>> +			     MALI_C55_MESH_SHADING_ALPHA_G_MASK,
>> +			     params->mesh_alpha_g);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA,
>> +			     MALI_C55_MESH_SHADING_ALPHA_B_MASK,
>> +			     params->mesh_alpha_b);
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_MESH_STRENGTH,
>> +			     MALI_c55_MESH_STRENGTH_MASK,
>> +			     params->mesh_strength);
>> +}
>> +
>> +static const struct mali_c55_block_handler mali_c55_block_handlers[] = {
>> +	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = {
>> +		.size = sizeof(struct mali_c55_params_sensor_off_preshading),
>> +		.handler = &mali_c55_params_sensor_offs,
>> +	},
>> +	[MALI_C55_PARAM_BLOCK_AEXP_HIST] = {
>> +		.size = sizeof(struct mali_c55_params_aexp_hist),
>> +		.handler = &mali_c55_params_aexp_hist,
>> +	},
>> +	[MALI_C55_PARAM_BLOCK_AEXP_IHIST] = {
>> +		.size = sizeof(struct mali_c55_params_aexp_hist),
>> +		.handler = &mali_c55_params_aexp_hist,
>> +	},
>> +	[MALI_C55_PARAM_BLOCK_AEXP_HIST_WEIGHTS] = {
>> +		.size = sizeof(struct mali_c55_params_aexp_weights),
>> +		.handler = &mali_c55_params_aexp_hist_weights,
>> +	},
>> +	[MALI_C55_PARAM_BLOCK_AEXP_IHIST_WEIGHTS] = {
>> +		.size = sizeof(struct mali_c55_params_aexp_weights),
>> +		.handler = &mali_c55_params_aexp_hist_weights,
>> +	},
>> +	[MALI_C55_PARAM_BLOCK_DIGITAL_GAIN] = {
>> +		.size = sizeof(struct mali_c55_params_digital_gain),
>> +		.handler = &mali_c55_params_digital_gain,
>> +	},
>> +	[MALI_C55_PARAM_BLOCK_AWB_GAINS] = {
>> +		.size = sizeof(struct mali_c55_params_awb_gains),
>> +		.handler = &mali_c55_params_awb_gains,
>> +	},
>> +	[MALI_C55_PARAM_BLOCK_AWB_CONFIG] = {
>> +		.size = sizeof(struct mali_c55_params_awb_config),
>> +		.handler = &mali_c55_params_awb_config,
>> +	},
>> +	[MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP] = {
>> +		.size = sizeof(struct mali_c55_params_awb_gains),
>> +		.handler = &mali_c55_params_awb_gains,
>> +	},
>> +	[MALI_C55_PARAM_MESH_SHADING_CONFIG] = {
>> +		.size = sizeof(struct mali_c55_params_mesh_shading_config),
>> +		.handler = &mali_c55_params_lsc_config,
>> +	},
>> +	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = {
>> +		.size = sizeof(struct mali_c55_params_mesh_shading_selection),
>> +		.handler = &mali_c55_params_lsc_selection,
>> +	},
>> +};
>> +
>> +static int mali_c55_params_enum_fmt_meta_out(struct file *file, void *fh,
>> +					    struct v4l2_fmtdesc *f)
>> +{
>> +	if (f->index || f->type != V4L2_BUF_TYPE_META_OUTPUT)
> The buffer type check has been done by the caller already.
>
>> +		return -EINVAL;
>> +
>> +	f->pixelformat = V4L2_META_FMT_MALI_C55_PARAMS;
>> +
>> +	return 0;
>> +}
>> +
>> +static int mali_c55_params_g_fmt_meta_out(struct file *file, void *fh,
>> +					 struct v4l2_format *f)
>> +{
>> +	static const struct v4l2_meta_format mfmt = {
>> +		.dataformat = V4L2_META_FMT_MALI_C55_PARAMS,
>> +		.buffersize = sizeof(struct mali_c55_params_buffer),
>> +	};
>> +
>> +	if (f->type != V4L2_BUF_TYPE_META_OUTPUT)
>> +		return -EINVAL;
> Ditto.
>
> Maybe check the other instances of format access functions in the driver,
> too?

Ack
>
>> +
>> +	f->fmt.meta = mfmt;
>> +
>> +	return 0;
>> +}
>> +
>> +static int mali_c55_params_querycap(struct file *file,
>> +				   void *priv, struct v4l2_capability *cap)
>> +{
>> +	strscpy(cap->driver, MALI_C55_DRIVER_NAME, sizeof(cap->driver));
>> +	strscpy(cap->card, "ARM Mali-C55 ISP", sizeof(cap->card));
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_ioctl_ops mali_c55_params_v4l2_ioctl_ops = {
>> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
>> +	.vidioc_querybuf = vb2_ioctl_querybuf,
>> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
>> +	.vidioc_qbuf = vb2_ioctl_qbuf,
>> +	.vidioc_expbuf = vb2_ioctl_expbuf,
>> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
>> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
>> +	.vidioc_streamon = vb2_ioctl_streamon,
>> +	.vidioc_streamoff = vb2_ioctl_streamoff,
>> +	.vidioc_enum_fmt_meta_out = mali_c55_params_enum_fmt_meta_out,
>> +	.vidioc_g_fmt_meta_out = mali_c55_params_g_fmt_meta_out,
>> +	.vidioc_s_fmt_meta_out = mali_c55_params_g_fmt_meta_out,
>> +	.vidioc_try_fmt_meta_out = mali_c55_params_g_fmt_meta_out,
>> +	.vidioc_querycap = mali_c55_params_querycap,
>> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>> +};
>> +
>> +static const struct v4l2_file_operations mali_c55_params_v4l2_fops = {
>> +	.owner = THIS_MODULE,
>> +	.unlocked_ioctl = video_ioctl2,
>> +	.open = v4l2_fh_open,
>> +	.release = vb2_fop_release,
>> +	.poll = vb2_fop_poll,
>> +	.mmap = vb2_fop_mmap,
>> +};
>> +
>> +static int
>> +mali_c55_params_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
>> +			   unsigned int *num_planes, unsigned int sizes[],
>> +			   struct device *alloc_devs[])
>> +{
>> +	if (*num_planes && *num_planes > 1)
>> +		return -EINVAL;
>> +
>> +	if (sizes[0] && sizes[0] != sizeof(struct mali_c55_params_buffer))
>> +		return -EINVAL;
>> +
>> +	*num_planes = 1;
>> +	sizes[0] = sizeof(struct mali_c55_params_buffer);
>> +
>> +	return 0;
>> +}
>> +
>> +static void mali_c55_params_buf_queue(struct vb2_buffer *vb)
>> +{
>> +	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +	struct mali_c55_buffer *buf = container_of(vbuf,
>> +						   struct mali_c55_buffer, vb);
>> +
>> +	vb2_set_plane_payload(vb, 0, sizeof(struct mali_c55_params_buffer));
>> +
>> +	spin_lock(&params->buffers.lock);
>> +	list_add_tail(&buf->queue, &params->buffers.queue);
>> +	spin_unlock(&params->buffers.lock);
>> +}
>> +
>> +static void mali_c55_params_stop_streaming(struct vb2_queue *q)
>> +{
>> +	struct mali_c55_params *params = vb2_get_drv_priv(q);
>> +	struct mali_c55_buffer *buf, *tmp;
>> +
>> +	spin_lock(&params->buffers.lock);
>> +
>> +	list_for_each_entry_safe(buf, tmp, &params->buffers.queue, queue) {
>> +		list_del(&buf->queue);
>> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>> +	}
>> +
>> +	spin_unlock(&params->buffers.lock);
>> +}
>> +
>> +static const struct vb2_ops mali_c55_params_vb2_ops = {
>> +	.queue_setup = mali_c55_params_queue_setup,
>> +	.buf_queue = mali_c55_params_buf_queue,
>> +	.wait_prepare = vb2_ops_wait_prepare,
>> +	.wait_finish = vb2_ops_wait_finish,
>> +	.stop_streaming = mali_c55_params_stop_streaming,
>> +};
>> +
>> +void mali_c55_params_write_config(struct mali_c55 *mali_c55)
>> +{
>> +	struct mali_c55_params *params = &mali_c55->params;
>> +	enum vb2_buffer_state state = VB2_BUF_STATE_DONE;
>> +	struct mali_c55_params_buffer *config;
>> +	struct mali_c55_buffer *buf;
>> +	size_t block_offset = 0;
>> +
>> +	spin_lock(&params->buffers.lock);
>> +
>> +	buf = list_first_entry_or_null(&params->buffers.queue,
>> +				       struct mali_c55_buffer, queue);
>> +	if (buf)
>> +		list_del(&buf->queue);
>> +	spin_unlock(&params->buffers.lock);
>> +
>> +	if (!buf)
>> +		return;
>> +
>> +	buf->vb.sequence = mali_c55->isp.frame_sequence;
>> +	config = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
>> +
>> +	if (config->total_size > MALI_C55_PARAMS_MAX_SIZE) {
>> +		dev_dbg(mali_c55->dev, "Invalid parameters buffer size %lu\n",
>> +			config->total_size);
>> +		state = VB2_BUF_STATE_ERROR;
>> +		goto err_buffer_done;
>> +	}
>> +
>> +	/* Walk the list of parameter blocks and process them. */
>> +	while (block_offset < config->total_size) {
>> +		const struct mali_c55_block_handler *block_handler;
>> +		struct mali_c55_params_block_header *block;
>> +
>> +		block = (struct mali_c55_params_block_header *)
>> +			 &config->data[block_offset];
> How do you ensure config->data does hold a full struct
> mali_c33_params_block_header at block_offset (i.e. that the struct does not
> exceed the memory available for config->data)?


We don't currently...the data buffer is sized specifically to be large enough to accept a single 
instance of each possible struct that could be included, we could keep track of the blocks that we 
have seen already and ensure that none are seen twice...and that should guarantee that the remaining 
space is sufficient to hold whatever the last block is. Does that sound ok?

>
>> +
>> +		if (block->type >= MALI_C55_PARAM_BLOCK_SENTINEL) {
>> +			dev_dbg(mali_c55->dev, "Invalid parameters block type\n");
>> +			state = VB2_BUF_STATE_ERROR;
>> +			goto err_buffer_done;
>> +		}
>> +
>> +		block_handler = &mali_c55_block_handlers[block->type];
>> +		if (block->size != block_handler->size) {
> How do you ensure config->data has room for the block?
I think through the same proposal as above.
>
>> +			dev_dbg(mali_c55->dev, "Invalid parameters block size\n");
>> +			state = VB2_BUF_STATE_ERROR;
>> +			goto err_buffer_done;
>> +		}
>> +
>> +		block_handler->handler(mali_c55, block);
>> +
>> +		block_offset += block->size;
>> +	}
>> +
>> +err_buffer_done:
>> +	vb2_buffer_done(&buf->vb.vb2_buf, state);
>> +}
>> +
>> +void mali_c55_unregister_params(struct mali_c55 *mali_c55)
>> +{
>> +	struct mali_c55_params *params = &mali_c55->params;
>> +
>> +	if (!video_is_registered(&params->vdev))
>> +		return;
>> +
>> +	vb2_video_unregister_device(&params->vdev);
>> +	media_entity_cleanup(&params->vdev.entity);
>> +	mutex_destroy(&params->lock);
>> +}
>> +
>> +int mali_c55_register_params(struct mali_c55 *mali_c55)
>> +{
>> +	struct mali_c55_params *params = &mali_c55->params;
>> +	struct video_device *vdev = &params->vdev;
>> +	struct vb2_queue *vb2q = &params->queue;
>> +	int ret;
>> +
>> +	mutex_init(&params->lock);
>> +	INIT_LIST_HEAD(&params->buffers.queue);
>> +
>> +	params->pad.flags = MEDIA_PAD_FL_SOURCE;
>> +	ret = media_entity_pads_init(&params->vdev.entity, 1, &params->pad);
>> +	if (ret)
>> +		goto err_destroy_mutex;
>> +
>> +	vb2q->type = V4L2_BUF_TYPE_META_OUTPUT;
>> +	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
>> +	vb2q->drv_priv = params;
>> +	vb2q->mem_ops = &vb2_dma_contig_memops;
>> +	vb2q->ops = &mali_c55_params_vb2_ops;
>> +	vb2q->buf_struct_size = sizeof(struct mali_c55_buffer);
>> +	vb2q->min_queued_buffers = 1;
>> +	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>> +	vb2q->lock = &params->lock;
>> +	vb2q->dev = mali_c55->dev;
>> +
>> +	ret = vb2_queue_init(vb2q);
>> +	if (ret) {
>> +		dev_err(mali_c55->dev, "params vb2 queue init failed\n");
>> +		goto err_cleanup_entity;
>> +	}
>> +
>> +	strscpy(params->vdev.name, "mali-c55 3a params",
>> +		sizeof(params->vdev.name));
>> +	vdev->release = video_device_release_empty;
>> +	vdev->fops = &mali_c55_params_v4l2_fops;
>> +	vdev->ioctl_ops = &mali_c55_params_v4l2_ioctl_ops;
>> +	vdev->lock = &params->lock;
>> +	vdev->v4l2_dev = &mali_c55->v4l2_dev;
>> +	vdev->queue = &params->queue;
>> +	vdev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING;
>> +	vdev->vfl_dir = VFL_DIR_TX;
>> +	video_set_drvdata(vdev, params);
>> +
>> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>> +	if (ret) {
>> +		dev_err(mali_c55->dev,
>> +			"failed to register params video device\n");
>> +		goto err_release_vb2q;
>> +	}
>> +
>> +	params->mali_c55 = mali_c55;
>> +
>> +	return 0;
>> +
>> +err_release_vb2q:
>> +	vb2_queue_release(vb2q);
>> +err_cleanup_entity:
>> +	media_entity_cleanup(&params->vdev.entity);
>> +err_destroy_mutex:
>> +	mutex_destroy(&params->lock);
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>> index eb3719245ec3..8e6a801077ed 100644
>> --- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>> @@ -119,6 +119,19 @@
>>   #define MALI_C55_REG_ACTIVE_HEIGHT_MASK			0xffff0000
>>   #define MALI_C55_REG_BAYER_ORDER			0x18e8c
>>   #define MALI_C55_BAYER_ORDER_MASK			GENMASK(1, 0)
>> +
>> +#define MALI_C55_REG_METERING_CONFIG			0x18ed0
>> +#define MALI_C55_5BIN_HIST_DISABLE_MASK			BIT(0)
>> +#define MALI_C55_5BIN_HIST_SWITCH_MASK			GENMASK(2, 1)
>> +#define MALI_C55_AF_DISABLE_MASK			BIT(4)
>> +#define MALI_C55_AF_SWITCH_MASK				BIT(5)
>> +#define MALI_C55_AWB_DISABLE_MASK			BIT(8)
>> +#define MALI_C55_AWB_SWITCH_MASK			BIT(9)
>> +#define MALI_C55_AEXP_HIST_DISABLE_MASK			BIT(12)
>> +#define MALI_C55_AEXP_HIST_SWITCH_MASK			GENMASK(14, 13)
>> +#define MALI_C55_AEXP_IHIST_DISABLE_MASK		BIT(16)
>> +#define MALI_C55_AEXP_SRC_MASK				BIT(24)
>> +
>>   #define MALI_C55_REG_TPG_CH0				0x18ed8
>>   #define MALI_C55_TEST_PATTERN_ON_OFF			BIT(0)
>>   #define MALI_C55_TEST_PATTERN_RGB_MASK			BIT(1)
>> @@ -138,6 +151,11 @@
>>   #define MALI_C55_REG_CONFIG_SPACES_OFFSET		0x0ab6c
>>   #define MALI_C55_CONFIG_SPACE_SIZE			0x1231c
>>   
>> +#define MALI_C55_REG_DIGITAL_GAIN			0x1926c
>> +#define MALI_C55_DIGITAL_GAIN_MASK			GENMASK(12, 0)
>> +#define MALI_C55_REG_DIGITAL_GAIN_OFFSET		0x19270
>> +#define MALI_C55_DIGITAL_GAIN_OFFSET_MASK		GENMASK(19, 0)
>> +
>>   #define MALI_C55_REG_SINTER_CONFIG			0x19348
>>   #define MALI_C55_SINTER_VIEW_FILTER_MASK		GENMASK(1, 0)
>>   #define MALI_C55_SINTER_SCALE_MODE_MASK			GENMASK(3, 2)
>> @@ -146,6 +164,46 @@
>>   #define MALI_C55_SINTER_INT_SELECT_MASK			BIT(6)
>>   #define MALI_C55_SINTER_RM_ENABLE_MASK			BIT(7)
>>   
>> +/* Black Level Correction Configuration */
>> +#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_00		0x1abcc
>> +#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_01		0x1abd0
>> +#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_10		0x1abd4
>> +#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_11		0x1abd8
>> +#define MALI_C55_SENSOR_OFF_PRE_SHA_MASK		0xfffff
>> +
>> +/* Lens Mesh Shading Configuration */
>> +#define MALI_C55_REG_MESH_SHADING_TABLES		0x13074
>> +#define MALI_C55_REG_MESH_SHADING_CONFIG		0x1abfc
>> +#define MALI_C55_MESH_SHADING_ENABLE_MASK		BIT(0)
>> +#define MALI_C55_MESH_SHADING_MESH_SHOW			BIT(1)
>> +#define MALI_C55_MESH_SHADING_SCALE_MASK		GENMASK(4, 2)
>> +#define MALI_C55_MESH_SHADING_PAGE_R_MASK		GENMASK(9, 8)
>> +#define MALI_C55_MESH_SHADING_PAGE_G_MASK		GENMASK(11, 10)
>> +#define MALI_C55_MESH_SHADING_PAGE_B_MASK		GENMASK(13, 12)
>> +#define MALI_C55_MESH_SHADING_MESH_WIDTH_MASK		GENMASK(21, 16)
>> +#define MALI_C55_MESH_SHADING_MESH_HEIGHT_MASK		GENMASK(29, 24)
>> +
>> +#define MALI_C55_REG_MESH_SHADING_ALPHA_BANK		0x1ac04
>> +#define MALI_C55_MESH_SHADING_ALPHA_BANK_R_MASK		GENMASK(2, 0)
>> +#define MALI_C55_MESH_SHADING_ALPHA_BANK_G_MASK		GENMASK(5, 3)
>> +#define MALI_C55_MESH_SHADING_ALPHA_BANK_B_MASK		GENMASK(8, 6)
>> +#define MALI_C55_REG_MESH_SHADING_ALPHA			0x1ac08
>> +#define MALI_C55_MESH_SHADING_ALPHA_R_MASK		GENMASK(7, 0)
>> +#define MALI_C55_MESH_SHADING_ALPHA_G_MASK		GENMASK(15, 8)
>> +#define MALI_C55_MESH_SHADING_ALPHA_B_MASK		GENMASK(23, 16)
>> +#define MALI_C55_REG_MESH_SHADING_MESH_STRENGTH		0x1ac0c
>> +#define MALI_c55_MESH_STRENGTH_MASK			GENMASK(15, 0)
>> +
>> +/* AWB Gains Configuration */
>> +#define MALI_C55_REG_AWB_GAINS1				0x1ac10
>> +#define MALI_C55_AWB_GAIN00_MASK			GENMASK(11, 0)
>> +#define MALI_C55_AWB_GAIN01_MASK			GENMASK(27, 16)
>> +#define MALI_C55_REG_AWB_GAINS2				0x1ac14
>> +#define MALI_C55_AWB_GAIN10_MASK			GENMASK(11, 0)
>> +#define MALI_C55_AWB_GAIN11_MASK			GENMASK(27, 16)
>> +#define MALI_C55_REG_AWB_GAINS1_AEXP			0x1ac18
>> +#define MALI_C55_REG_AWB_GAINS2_AEXP			0x1ac1c
>> +
>>   /* Colour Correction Matrix Configuration */
>>   #define MALI_C55_REG_CCM_ENABLE				0x1b07c
>>   #define MALI_C55_CCM_ENABLE_MASK			BIT(0)
>> @@ -168,6 +226,52 @@
>>   #define MALI_C55_REG_CCM_ANTIFOG_OFFSET_B		0x1b0c8
>>   #define MALI_C55_CCM_ANTIFOG_OFFSET_MASK		GENMASK(11, 0)
>>   
>> +/* AWB Statistics Configuration */
>> +#define MALI_C55_REG_AWB_STATS_MODE			0x1b29c
>> +#define MALI_C55_AWB_STATS_MODE_MASK			BIT(0)
>> +#define MALI_C55_REG_AWB_WHITE_LEVEL			0x1b2a0
>> +#define MALI_C55_AWB_WHITE_LEVEL_MASK			GENMASK(9, 0)
>> +#define MALI_C55_REG_AWB_BLACK_LEVEL			0x1b2a4
>> +#define MALI_C55_AWB_BLACK_LEVEL_MASK			GENMASK(9, 0)
>> +#define MALI_C55_REG_AWB_CR_MAX				0x1b2a8
>> +#define MALI_C55_AWB_CR_MAX_MASK			GENMASK(11, 0)
>> +#define MALI_C55_REG_AWB_CR_MIN				0x1b2ac
>> +#define MALI_C55_AWB_CR_MIN_MASK			GENMASK(11, 0)
>> +#define MALI_C55_REG_AWB_CB_MAX				0x1b2b0
>> +#define MALI_C55_REG_AWB_CB_MIN				0x1b2b4
>> +#define MALI_C55_AWB_CB_MIN_MASK			GENMASK(11, 0)
>> +#define MALI_C55_REG_AWB_NODES_USED			0x1b2c4
>> +#define MALI_C55_AWB_NODES_USED_HORIZ_MASK		GENMASK(7, 0)
>> +#define MALI_C55_AWB_NODES_USED_VERT_MASK		GENMASK(15, 8)
>> +#define MALI_C55_REG_AWB_CR_HIGH			0x1b2c8
>> +#define MALI_C55_AWB_CR_HIGH_MASK			GENMASK(11, 0)
>> +#define MALI_C55_REG_AWB_CR_LOW				0x1b2cc
>> +#define MALI_C55_AWB_CR_LOW_MASK			GENMASK(11, 0)
>> +#define MALI_C55_REG_AWB_CB_HIGH			0x1b2d0
>> +#define MALI_C55_AWB_CB_HIGH_MASK			GENMASK(11, 0)
>> +#define MALI_C55_REG_AWB_CB_LOW				0x1b2d4
>> +#define MALI_C55_AWB_CB_LOW_MASK			GENMASK(11, 0)
>> +
>> +/* AEXP Metering Histogram Configuration */
>> +#define MALI_C55_REG_AEXP_HIST_BASE			0x1b730
>> +#define MALI_C55_REG_AEXP_IHIST_BASE			0x1bbac
>> +#define MALI_C55_AEXP_HIST_SKIP_OFFSET			0
>> +#define MALI_C55_AEXP_HIST_SKIP_X_MASK			GENMASK(2, 0)
>> +#define MALI_C55_AEXP_HIST_OFFSET_X_MASK		BIT(3)
>> +#define MALI_C55_AEXP_HIST_SKIP_Y_MASK			GENMASK(6, 4)
>> +#define MALI_C55_AEXP_HIST_OFFSET_Y_MASK		BIT(7)
>> +#define MALI_C55_AEXP_HIST_SCALE_OFFSET			4
>> +#define MALI_C55_AEXP_HIST_SCALE_BOTTOM_MASK		GENMASK(3, 0)
>> +#define MALI_C55_AEXP_HIST_SCALE_TOP_MASK		GENMASK(7, 4)
>> +#define MALI_C55_AEXP_HIST_PLANE_MODE_OFFSET		16
>> +#define MALI_C55_AEXP_HIST_PLANE_MODE_MASK		GENMASK(2, 0)
>> +#define MALI_C55_AEXP_HIST_NODES_USED_OFFSET		52
>> +#define MALI_C55_AEXP_HIST_NODES_USED_HORIZ_MASK	GENMASK(7, 0)
>> +#define MALI_C55_AEXP_HIST_NODES_USED_VERT_MASK		GENMASK(15, 8)
>> +#define MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET		56
>> +#define MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK		0x0f0f0f0f
>> +
>>   /*
>>    * The Mali-C55 ISP has up to two output pipes; known as full resolution and
>>    * down scaled. The register space for these is laid out identically, but offset

