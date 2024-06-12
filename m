Return-Path: <linux-media+bounces-13051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACAB90551B
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 16:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4546288475
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 14:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AE217E456;
	Wed, 12 Jun 2024 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r/UaKYfb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3DE7FB
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 14:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718202494; cv=none; b=rj6d6y53PlZi4QtryjwLPmkh1wZmY/bUDnUQSGuYWZw8taEBIEre3mILrbpn4mP4sto0jFYZxUoAn/dSdyZK5JNitfm4GOtfJC4CBtX2871Qqjm7cACKfJU/bq7/+EWUBQe754flw+CsjGSyJ45RrqgAYBHrjBYQb96XrUFkDt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718202494; c=relaxed/simple;
	bh=lvn44ApluEsOy5rvIxKChtCTtKJAQ1XO/lH/prs4uIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NUFl8MdcZHMXiVrChU1lnuU/mOStZASP3+A7ackOqmtSjhIa9YzmsXyVQOXUloa+IJVfc0EpgOR2k1zAdqaVibQlNHfhteKPRRJxOndOIkynoG4cMoIWngmhrQ6RHFmNG4pzUfD2oafIHiTA7YEx90wvfqZFe8ub8wFHx4zBlCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r/UaKYfb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E659230;
	Wed, 12 Jun 2024 16:27:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718202475;
	bh=lvn44ApluEsOy5rvIxKChtCTtKJAQ1XO/lH/prs4uIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r/UaKYfbudK+nrjyKBGGxaTdhCbFDhCy5X3lo0A52tJCzzNdYs4YX7FD3uMCbVwTT
	 EZ6oTObEd9f1ZMiJAjnwHX3OvWSDD5nud2GYEMFBmKuJnDbhlEpU4zXWTgHFAko9G4
	 UUzD5VEZBjMhP9XXZDCkMl1e36RDNWDKeVFIVibw=
Message-ID: <2c7e4fb9-a23c-41f3-a5d1-fa8699e313be@ideasonboard.com>
Date: Wed, 12 Jun 2024 15:28:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] media: rkisp1: Copy and validate parameters buffer
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-9-jacopo.mondi@ideasonboard.com>
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
In-Reply-To: <20240605165434.432230-9-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo. As mentioned in the last patch, I think that this could be squashed into 5/8, but a 
couple of comments below

On 05/06/2024 17:54, Jacopo Mondi wrote:
> With the introduction of the extensible parameters format support in the
> rkisp1-param.c module, the RkISP1 driver now configures the ISP blocks
> by parsing the content of a data buffer of variable size provided by
> userspace through the V4L2 meta-output interface using the MMAP memory
> handling mode.
>
> As the parameters buffer is mapped in the userspace process memory,
> applications have access to the buffer content while the driver
> parses it.
>
> To prevent potential issues during the parameters buffer parsing and
> processing in the driver, implement three vb2_ops to
>
> 1) allocate a scratch buffer in the driver private buffer structure
> 2) validate the buffer content at VIDIOC_QBUF time
> 3) copy the content of the user provided configuration parameters
>     in the driver-private scratch buffer
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   .../platform/rockchip/rkisp1/rkisp1-params.c  | 154 ++++++++++++++----
>   1 file changed, 124 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 4adaf084ce6e..003239e14511 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -5,6 +5,8 @@
>    * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
>    */
>   
> +#include <linux/string.h>
> +
>   #include <media/v4l2-common.h>
>   #include <media/v4l2-event.h>
>   #include <media/v4l2-ioctl.h>
> @@ -1943,17 +1945,14 @@ static const struct rkisp1_ext_params_handler {
>   };
>   
>   static int __rkisp1_ext_params_config(struct rkisp1_params *params,
> -				      struct rkisp1_ext_params_cfg *cfg,
> +				      struct rkisp1_params_buffer *buffer,
>   				      u32 block_group_mask)
>   {
> +	struct rkisp1_ext_params_cfg *cfg = buffer->cfg;
>   	size_t block_offset = 0;
>   
> -	if (cfg->total_size > RKISP1_EXT_PARAMS_MAX_SIZE) {
> -		dev_dbg(params->rkisp1->dev,
> -			"Invalid parameters buffer size %llu\n",
> -			cfg->total_size);
> -		return -EINVAL;
> -	}
> +	if (WARN_ON(!cfg))
> +		return -ENOMEM;
>   
>   	/* Walk the list of parameter blocks and process them. */
>   	while (block_offset < cfg->total_size) {
> @@ -1965,25 +1964,13 @@ static int __rkisp1_ext_params_config(struct rkisp1_params *params,
>   		block_offset += block->size;
>   
>   		/*
> -		 * Validate the block id and make sure the block group is in
> -		 * the list of groups to configure.
> +		 * Make sure the block group is in  the list of groups to
> +		 * configure.
>   		 */
> -		if (block->type >= RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL) {
> -			dev_dbg(params->rkisp1->dev,
> -				"Invalid parameters block type\n");
> -			return -EINVAL;
> -		}
> -
>   		block_handler = &rkisp1_ext_params_handlers[block->type];
>   		if (!(block_handler->group & block_group_mask))
>   			continue;
>   
> -		if (block->size != block_handler->size) {
> -			dev_dbg(params->rkisp1->dev,
> -				"Invalid parameters block size\n");
> -			return -EINVAL;
> -		}
> -
>   		block_handler->handler(params, block);
>   	}
>   
> @@ -1991,9 +1978,9 @@ static int __rkisp1_ext_params_config(struct rkisp1_params *params,
>   }
>   
>   static int rkisp1_ext_params_config(struct rkisp1_params *params,
> -				    struct rkisp1_ext_params_cfg *cfg)
> +				    struct rkisp1_params_buffer *buffer)
>   {
> -	return __rkisp1_ext_params_config(params, cfg,
> +	return __rkisp1_ext_params_config(params, buffer,
>   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
>   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC |
>   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
> @@ -2001,17 +1988,17 @@ static int rkisp1_ext_params_config(struct rkisp1_params *params,
>   
>   static int
>   rkisp1_ext_params_other_meas_config(struct rkisp1_params *params,
> -				    struct rkisp1_ext_params_cfg *cfg)
> +				    struct rkisp1_params_buffer *buffer)
>   {
> -	return __rkisp1_ext_params_config(params, cfg,
> +	return __rkisp1_ext_params_config(params, buffer,
>   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
>   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
>   }
>   
>   static int rkisp1_ext_params_lsc_config(struct rkisp1_params *params,
> -					struct rkisp1_ext_params_cfg *cfg)
> +					struct rkisp1_params_buffer *buffer)
>   {
> -	return __rkisp1_ext_params_config(params, cfg,
> +	return __rkisp1_ext_params_config(params, buffer,
>   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
>   }
>   
> @@ -2057,7 +2044,7 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>   		rkisp1_isp_isr_lsc_config(params, cfg);
>   		rkisp1_isp_isr_meas_config(params, cfg);
>   	} else {
> -		ret = rkisp1_ext_params_config(params, cfg);
> +		ret = rkisp1_ext_params_config(params, buf);
>   	}
>   
>   	if (ret)
> @@ -2168,7 +2155,7 @@ int rkisp1_params_pre_configure(struct rkisp1_params *params,
>   		rkisp1_isp_isr_other_config(params, cfg);
>   		rkisp1_isp_isr_meas_config(params, cfg);
>   	} else {
> -		ret = rkisp1_ext_params_other_meas_config(params, cfg);
> +		ret = rkisp1_ext_params_other_meas_config(params, buf);
>   	}
>   
>   	if (ret) {
> @@ -2215,7 +2202,7 @@ int rkisp1_params_post_configure(struct rkisp1_params *params)
>   	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
>   		rkisp1_isp_isr_lsc_config(params, cfg);
>   	else
> -		ret = rkisp1_ext_params_lsc_config(params, cfg);
> +		ret = rkisp1_ext_params_lsc_config(params, buf);
>   
>   	if (ret)
>   		goto complete_and_unlock;
> @@ -2407,6 +2394,110 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
>   	return 0;
>   }
>   
> +static int rkisp1_params_vb2_buf_init(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rkisp1_params_buffer *params_buf =
> +		container_of(vbuf, struct rkisp1_params_buffer, vb);
> +	struct rkisp1_params *params = vb->vb2_queue->drv_priv;
> +	size_t buf_size = params->metafmt.buffersize;
> +
> +	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
> +		params_buf->cfg = NULL;
> +		return 0;
> +	}
> +
> +	params_buf->cfg = kvmalloc(buf_size, GFP_KERNEL);
> +	if (IS_ERR_OR_NULL(params_buf->cfg))
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static void rkisp1_params_vb2_buf_cleanup(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rkisp1_params_buffer *params_buf =
> +		container_of(vbuf, struct rkisp1_params_buffer, vb);
> +
> +	kvfree(params_buf->cfg);
> +}
> +
> +static int rkisp1_params_validate_ext_params(struct rkisp1_params *params,
> +					     struct rkisp1_ext_params_cfg *cfg)
> +{
> +	size_t block_offset = 0;
> +
> +	if (cfg->total_size > RKISP1_EXT_PARAMS_MAX_SIZE) {
> +		dev_dbg(params->rkisp1->dev,
> +			"Invalid parameters buffer size %llu\n",
> +			cfg->total_size);
> +		return -EINVAL;
> +	}
> +
> +	/* Walk the list of parameter blocks and validate them. */
> +	while (block_offset < cfg->total_size) {
> +		const struct rkisp1_ext_params_handler *hdlr;
> +		struct rkisp1_ext_params_block_header *block;
> +
> +		block = (struct rkisp1_ext_params_block_header *)
> +			&cfg->data[block_offset];
> +		block_offset += block->size;
> +
> +		if (block->type >= RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL) {
> +			dev_dbg(params->rkisp1->dev,
> +				"Invalid parameters block type\n");
> +			return -EINVAL;
> +		}
> +
> +		hdlr = &rkisp1_ext_params_handlers[block->type];
> +		if (hdlr->group != RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS &&
> +		    hdlr->group != RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC &&
> +		    hdlr->group != RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS) {
> +			dev_dbg(params->rkisp1->dev,
> +				"Invalid parameters block group\n");
> +			return -EINVAL;
> +		}
I think this check can probably be dropped; those values are from the kernel driver rather than 
userspace inputs.
> +
> +		if (block->size != hdlr->size) {
> +			dev_dbg(params->rkisp1->dev,
> +				"Invalid parameters block size\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int rkisp1_params_vb2_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rkisp1_params_buffer *params_buf =
> +		container_of(vbuf, struct rkisp1_params_buffer, vb);
> +	struct vb2_queue *vq = vb->vb2_queue;
> +	struct rkisp1_params *params = vq->drv_priv;
> +	struct rkisp1_ext_params_cfg *cfg =
> +		vb2_plane_vaddr(&params_buf->vb.vb2_buf, 0);
> +	int ret;
> +
> +	/* Fixed parameters format doesn't require validation. */
> +	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
> +		return 0;
> +
> +	ret = rkisp1_params_validate_ext_params(params, cfg);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * If the parameters buffer is valid, copy it to the internal scratch
> +	 * buffer to avoid userspace modifying the buffer content while
> +	 * the driver processes it.
> +	 */
> +	memcpy(params_buf->cfg, cfg, sizeof(*cfg));
I think that this part is something that we probably ought to handle in vb2 core if we can, since 
the problem it's fixing isn't specific to the extensible parameters format or even the rkisp1 itself 
(unless I'm missing something). That doesn't have to block this set though, we can change this over 
to a vb2-core implementation when that's done.
> +
> +	return 0;
> +}
> +
>   static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
>   {
>   	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> @@ -2455,6 +2546,9 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>   
>   static const struct vb2_ops rkisp1_params_vb2_ops = {
>   	.queue_setup = rkisp1_params_vb2_queue_setup,
> +	.buf_init = rkisp1_params_vb2_buf_init,
> +	.buf_cleanup = rkisp1_params_vb2_buf_cleanup,
> +	.buf_out_validate = rkisp1_params_vb2_buf_out_validate,
>   	.wait_prepare = vb2_ops_wait_prepare,
>   	.wait_finish = vb2_ops_wait_finish,
>   	.buf_queue = rkisp1_params_vb2_buf_queue,

