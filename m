Return-Path: <linux-media+bounces-42078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F0FB4A5A9
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 10:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ADCB16DB91
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 08:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D36256C83;
	Tue,  9 Sep 2025 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="XLWsG37+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB2824677D
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 08:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407297; cv=none; b=MgxbJUIm+6tyXaT6kapkE8aJtOOqMHzPYOm+xhoNbH3V5lUAlTCqtX+zMoL49v83VctpT3zYiplr9kf1Y0i54AEPYnWvHRCF2hPfmz+VFzO4bTQrkU2i2MspQ6buYXhJdy1Cr555xCb4iXkgY+220HimBOsFcuMiWSzqANfHH0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407297; c=relaxed/simple;
	bh=Ip46ot/9O4pNIM/Ny61T7ztTm2iML4XIOp1LKYVRsy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5X3hKIn3fUumINz1Cyk8al1pM0PsUMo/x16RiAvi+Lk3o3Oa7WoZWTFUwzgXTEAwrNxws9ewpibjbYIVLy79PcqJIZu3iGMNuEiUUHkPpu9ppLPcpwnTrTm59gN6a1aIzxf8Hxlw2PyGf0YAh4kvB8vPBNusLGB3nnD0NTDdMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=XLWsG37+; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1757407288;
 bh=DEI8j5MLwQIMmp/tto4y5edHY0QtHqsLOROzDCJAx8I=;
 b=XLWsG37+JYO5T1Bv9mY3d8qHzfLouFcNpDbvhub6sIUbHMguELj6XtM18m2itPqMtUoPbEOU7
 5FIYQTaok2m9Uk71BvNuZ6PAAy6F5q35623YoYV9tlofmSRbZ2bJHGnmpn2Qqom0C0OMMqcl0Fp
 KRnRjRzB9ikE3H46xA7Ca3CwQ7DOl+hT7fMlfkMQz2jn33qrIVsZAsa34goal5oFuzFzlUbud6n
 t0lvzPrYFwbvT+tmDZnjWOf79rGEq1Qr4/SdDuVWBAQUaYGTsFvPGPKLTAm1LPFvqwGukMgjUmy
 2qtnAy5nwk5Azr3YbUZ2SNE0oiMiVQ4BGjDueLJAgk4A==
X-Forward-Email-ID: 68bfe832381b9a7fa9093c07
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.14
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <baaf6f27-aac1-4567-b69f-84945de45a44@kwiboo.se>
Date: Tue, 9 Sep 2025 10:41:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: rkvdec: Add variants support
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250905161942.3759717-1-jonas@kwiboo.se>
 <20250905161942.3759717-3-jonas@kwiboo.se>
 <c05ea992-b0d8-4ea4-8a11-660b9cae4820@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <c05ea992-b0d8-4ea4-8a11-660b9cae4820@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Detlev,

On 9/8/2025 8:32 PM, Detlev Casanova wrote:
> Hi Jonas,
> 
> On 9/5/25 12:19, Jonas Karlman wrote:
>> From: Alex Bee <knaerzche@gmail.com>
>>
>> Different versions of the Rockchip VDEC IP exists and one way they can
>> differ is what decoding formats are supported.
>>
>> Add a variant implementation in order to support flagging different
>> capabilities.
>>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> Changes in v3:
>> - Use a reference to rkvdec_variant
>> - Add num_regs field
> 
> Why are you adding this field ? I don't see it being used in a later patch.

Correct, this was briefly mentioned in the cover letter change log for v3:

  Add num_regs field to rkvdec_variant, currently not used for anything

This addition was mostly to make us aware that there are different
number of swregs for the different variants of "rkvdev1".

> 
> Would that be useful for writing the right amount of registers later 
> when switching to structs and memcpy ?

Correct, to my knowledge there are 3 different register configurations
for "rkvdec1", all are mostly extended with more registers at the end.

  68 (rk3288) -> 78 (rk3399) -> 109 (rk3328)

Currently there are writel() that are blindly written to regs >68 and
>78 regardless of variant. If we are to move to use io memcpy we should
probably ensure to write to the regs that exists for each variant.

> 
> I haven't checked how different the register maps are between those 
> different variants.

As mentioned above they mostly differ at the end (more swregs), or use
additional previously unused bits of existing swregs. E.g. rk3328 has
sw_wr_ddr_align_en, sw_scl_down_en and sw_allow_not_wr_unref_bframe
added to swreg1.

The added num_regs can be dropped or replaced with proper structs (or
something different) if you think that is a better way to signal how the
variants regs differs.

Regards,
Jonas

> 
>> - Collect r-b tag
>>
>> Changes in v2:
>> - No change
>> ---
>>   .../media/platform/rockchip/rkvdec/rkvdec.c   | 22 ++++++++++++++++++-
>>   .../media/platform/rockchip/rkvdec/rkvdec.h   | 11 ++++++++++
>>   2 files changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index c15fc238d6af..daf6d9ab2d1d 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/iommu.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>> +#include <linux/of_device.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm.h>
>>   #include <linux/pm_runtime.h>
>> @@ -327,6 +328,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>>   		.ops = &rkvdec_hevc_fmt_ops,
>>   		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
>>   		.decoded_fmts = rkvdec_hevc_decoded_fmts,
>> +		.capability = RKVDEC_CAPABILITY_HEVC,
>>   	},
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_H264_SLICE,
>> @@ -343,6 +345,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>>   		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
>>   		.decoded_fmts = rkvdec_h264_decoded_fmts,
>>   		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>> +		.capability = RKVDEC_CAPABILITY_H264,
>>   	},
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
>> @@ -358,6 +361,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>>   		.ops = &rkvdec_vp9_fmt_ops,
>>   		.num_decoded_fmts = ARRAY_SIZE(rkvdec_vp9_decoded_fmts),
>>   		.decoded_fmts = rkvdec_vp9_decoded_fmts,
>> +		.capability = RKVDEC_CAPABILITY_VP9,
>>   	}
>>   };
>>   
>> @@ -1186,8 +1190,18 @@ static void rkvdec_watchdog_func(struct work_struct *work)
>>   	}
>>   }
>>   
>> +static const struct rkvdec_variant rk3399_rkvdec_variant = {
>> +	.num_regs = 78,
>> +	.capabilities = RKVDEC_CAPABILITY_HEVC |
>> +			RKVDEC_CAPABILITY_H264 |
>> +			RKVDEC_CAPABILITY_VP9,
>> +};
>> +
>>   static const struct of_device_id of_rkvdec_match[] = {
>> -	{ .compatible = "rockchip,rk3399-vdec" },
>> +	{
>> +		.compatible = "rockchip,rk3399-vdec",
>> +		.data = &rk3399_rkvdec_variant,
>> +	},
>>   	{ /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, of_rkvdec_match);
>> @@ -1198,16 +1212,22 @@ static const char * const rkvdec_clk_names[] = {
>>   
>>   static int rkvdec_probe(struct platform_device *pdev)
>>   {
>> +	const struct rkvdec_variant *variant;
>>   	struct rkvdec_dev *rkvdec;
>>   	unsigned int i;
>>   	int ret, irq;
>>   
>> +	variant = of_device_get_match_data(&pdev->dev);
>> +	if (!variant)
>> +		return -EINVAL;
>> +
>>   	rkvdec = devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
>>   	if (!rkvdec)
>>   		return -ENOMEM;
>>   
>>   	platform_set_drvdata(pdev, rkvdec);
>>   	rkvdec->dev = &pdev->dev;
>> +	rkvdec->variant = variant;
>>   	mutex_init(&rkvdec->vdev_lock);
>>   	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
>>   
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> index 209dd79ce9bd..c47457c954e5 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> @@ -22,6 +22,10 @@
>>   #include <media/videobuf2-core.h>
>>   #include <media/videobuf2-dma-contig.h>
>>   
>> +#define RKVDEC_CAPABILITY_HEVC		BIT(0)
>> +#define RKVDEC_CAPABILITY_H264		BIT(1)
>> +#define RKVDEC_CAPABILITY_VP9		BIT(2)
>> +
>>   struct rkvdec_ctx;
>>   
>>   struct rkvdec_ctrl_desc {
>> @@ -63,6 +67,11 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>>   			    base.vb.vb2_buf);
>>   }
>>   
>> +struct rkvdec_variant {
>> +	unsigned int num_regs;
>> +	unsigned int capabilities;
>> +};
>> +
>>   struct rkvdec_coded_fmt_ops {
>>   	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
>>   			  struct v4l2_format *f);
>> @@ -98,6 +107,7 @@ struct rkvdec_coded_fmt_desc {
>>   	unsigned int num_decoded_fmts;
>>   	const struct rkvdec_decoded_fmt_desc *decoded_fmts;
>>   	u32 subsystem_flags;
>> +	unsigned int capability;
>>   };
>>   
>>   struct rkvdec_dev {
>> @@ -111,6 +121,7 @@ struct rkvdec_dev {
>>   	struct mutex vdev_lock; /* serializes ioctls */
>>   	struct delayed_work watchdog_work;
>>   	struct iommu_domain *empty_domain;
>> +	const struct rkvdec_variant *variant;
>>   };
>>   
>>   struct rkvdec_ctx {
> 
> Regards,
> 
> Detlev
> 


