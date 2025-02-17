Return-Path: <linux-media+bounces-26202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5219BA37C9B
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 08:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1DEE3AACED
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 07:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFF919D89E;
	Mon, 17 Feb 2025 07:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qXZWWMHt"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA4A42AB4;
	Mon, 17 Feb 2025 07:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739779071; cv=none; b=DnXtIzD+2DCVO01iyz0MSG4V58XjRGtSsRw/ofgMAfh+rCV9gCrbujfKM3dK9MOoQ/Gp34mZRtuJTwhUlxQ0J8XcmC91/AJskgbOnLhaSKCDv/vlNx8JlS8+j8wK6WNXB7BbvW2QpKKjKAGSfogwtsIVty60OwGS1PQUbrVCD+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739779071; c=relaxed/simple;
	bh=KUs60n+JC3ZiYnj6BdBCbLl34IE1tOAF62zrnqrOYyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=utZjJlaP1WKYxJStHhwHXr8Qs8dEfRcBESydwoF5CYYEo6kLY+Ty+lbGqLoY/3neqeDZMDFR/wJmeqwoO4ksxgtYTIjRFWjaTsG2giIXVSVhaTSx/DCRL0RYMdImw7QnMabeeajjccgQ3vcD6Ykfp9gKK4LTy4fxnPnFHrzhtGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qXZWWMHt; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51H7vKqx1435828
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 01:57:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739779040;
	bh=xez1+L110KINs6OYxw0mw/9mXvAQixJs7kB8CYnYUvM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qXZWWMHtJkUU46Wn/72Ot+zeZ0XKoSUOy+f6l2Vl0mzA8QqfRgwGt7Lb6bzuOSaxV
	 1ztbbNZ/aoA0nrXSCFftBKVImHv6j+V0HxTdyKFwvW/2IhbLPCxgNvG6D79fpszFC2
	 FGeV0GEm/gAMOFYDlM4LS9nEiS565whNZxyRiAZc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51H7vKpD010985
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Feb 2025 01:57:20 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Feb 2025 01:57:20 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Feb 2025 01:57:20 -0600
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51H7vG5N124460;
	Mon, 17 Feb 2025 01:57:16 -0600
Message-ID: <41b244b3-0dbb-435e-8ca0-0caa639d0471@ti.com>
Date: Mon, 17 Feb 2025 13:27:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] media: cadence: csi2rx: Enable csi2rx_err_irq
 interrupt and add support for VIDIOC_LOG_STATUS
To: Jai Luthra <jai.luthra@linux.dev>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <mripard@kernel.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devarsht@ti.com>, <vaishnav.a@ti.com>,
        <r-donadkar@ti.com>, <u-kumar1@ti.com>
References: <20250212131244.1397722-1-y-abhilashchandra@ti.com>
 <20250212131244.1397722-3-y-abhilashchandra@ti.com>
 <s7xhbinc4m3le57f3y5je2ejmpxkgwrvukb7u3cjkg3zy4i63r@6fdctkuv5wrz>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <s7xhbinc4m3le57f3y5je2ejmpxkgwrvukb7u3cjkg3zy4i63r@6fdctkuv5wrz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jai,

Thank you for the review.

On 14/02/25 11:44, Jai Luthra wrote:
> Hi Abhilash,
> 
> On Wed, Feb 12, 2025 at 06:42:43PM +0530, Yemike Abhilash Chandra wrote:
>> Enable the csi2rx_err_irq interrupt to record any errors during streaming
>> and also add support for VIDIOC_LOG_STATUS ioctl. The VIDIOC_LOG_STATUS
>> ioctl can be invoked from user space to retrieve the device status,
>> including details about any errors.
>>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   drivers/media/platform/cadence/cdns-csi2rx.c | 104 ++++++++++++++++++-
>>   1 file changed, 103 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
>> index 4d64df829e75..b3d76f0678fa 100644
>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
>> @@ -57,6 +57,28 @@
>>   #define CSI2RX_LANES_MAX	4
>>   #define CSI2RX_STREAMS_MAX	4
>>   
>> +#define CSI2RX_ERROR_IRQS_REG			0x28
>> +#define CSI2RX_ERROR_IRQS_MASK_REG		0x2C
>> +
>> +#define CSI2RX_STREAM3_FIFO_OVERFLOW_IRQ	BIT(19)
>> +#define CSI2RX_STREAM2_FIFO_OVERFLOW_IRQ	BIT(18)
>> +#define CSI2RX_STREAM1_FIFO_OVERFLOW_IRQ	BIT(17)
>> +#define CSI2RX_STREAM0_FIFO_OVERFLOW_IRQ	BIT(16)
>> +#define CSI2RX_FRONT_TRUNC_HDR_IRQ		BIT(12)
>> +#define CSI2RX_PROT_TRUNCATED_PACKET_IRQ	BIT(11)
>> +#define CSI2RX_FRONT_LP_NO_PAYLOAD_IRQ		BIT(10)
>> +#define CSI2RX_SP_INVALID_RCVD_IRQ		BIT(9)
>> +#define CSI2RX_DATA_ID_IRQ			BIT(7)
>> +#define CSI2RX_HEADER_CORRECTED_ECC_IRQ	BIT(6)
>> +#define CSI2RX_HEADER_ECC_IRQ			BIT(5)
>> +#define CSI2RX_PAYLOAD_CRC_IRQ			BIT(4)
>> +
>> +#define CSI2RX_ECC_ERRORS		GENMASK(7, 4)
>> +#define CSI2RX_PACKET_ERRORS		GENMASK(12, 9)
>> +#define CSI2RX_STREAM_ERRORS		GENMASK(19, 16)
>> +#define CSI2RX_ERRORS			(CSI2RX_ECC_ERRORS | CSI2RX_PACKET_ERRORS | \
>> +					CSI2RX_STREAM_ERRORS)
>> +
>>   enum csi2rx_pads {
>>   	CSI2RX_PAD_SINK,
>>   	CSI2RX_PAD_SOURCE_STREAM0,
>> @@ -71,6 +93,28 @@ struct csi2rx_fmt {
>>   	u8				bpp;
>>   };
>>   
>> +struct csi2rx_event {
>> +	u32 mask;
>> +	const char *name;
>> +};
>> +
>> +static const struct csi2rx_event csi2rx_events[] = {
>> +	{ CSI2RX_STREAM3_FIFO_OVERFLOW_IRQ, "Overflow of the Stream 3 FIFO detected" },
>> +	{ CSI2RX_STREAM2_FIFO_OVERFLOW_IRQ, "Overflow of the Stream 2 FIFO detected" },
>> +	{ CSI2RX_STREAM1_FIFO_OVERFLOW_IRQ, "Overflow of the Stream 1 FIFO detected" },
>> +	{ CSI2RX_STREAM0_FIFO_OVERFLOW_IRQ, "Overflow of the Stream 0 FIFO detected" },
>> +	{ CSI2RX_FRONT_TRUNC_HDR_IRQ, "A truncated header [short or long] has been received" },
>> +	{ CSI2RX_PROT_TRUNCATED_PACKET_IRQ, "A truncated long packet has been received" },
>> +	{ CSI2RX_FRONT_LP_NO_PAYLOAD_IRQ, "A truncated long packet has been received. No payload" },
>> +	{ CSI2RX_SP_INVALID_RCVD_IRQ, "A reserved or invalid short packet has been received" },
>> +	{ CSI2RX_DATA_ID_IRQ, "Data ID error in the header packet" },
>> +	{ CSI2RX_HEADER_CORRECTED_ECC_IRQ, "ECC error detected and corrected" },
>> +	{ CSI2RX_HEADER_ECC_IRQ, "Unrecoverable ECC error" },
>> +	{ CSI2RX_PAYLOAD_CRC_IRQ, "CRC error" },
>> +};
>> +
>> +#define CSI2RX_NUM_EVENTS		ARRAY_SIZE(csi2rx_events)
>> +
>>   struct csi2rx_priv {
>>   	struct device			*dev;
>>   	unsigned int			count;
>> @@ -95,6 +139,7 @@ struct csi2rx_priv {
>>   	u8				max_lanes;
>>   	u8				max_streams;
>>   	bool				has_internal_dphy;
>> +	u32				events[CSI2RX_NUM_EVENTS];
>>   
>>   	struct v4l2_subdev		subdev;
>>   	struct v4l2_async_notifier	notifier;
>> @@ -124,6 +169,29 @@ static const struct csi2rx_fmt formats[] = {
>>   	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, },
>>   };
>>   
>> +static void csi2rx_configure_err_irq_mask(void __iomem *base)
>> +{
>> +	writel(CSI2RX_ERRORS, base + CSI2RX_ERROR_IRQS_MASK_REG);
>> +}
>> +
>> +static irqreturn_t csi2rx_irq_handler(int irq, void *dev_id)
>> +{
>> +	struct csi2rx_priv *csi2rx = dev_id;
>> +	int i;
>> +	u32 error_status;
>> +
>> +	error_status = readl(csi2rx->base + CSI2RX_ERROR_IRQS_REG);
>> +
>> +	for (i = 0; i < CSI2RX_NUM_EVENTS; i++)
>> +		if (error_status & csi2rx_events[i].mask)
>> +			csi2rx->events[i]++;
>> +
>> +	writel(CSI2RX_ERRORS & error_status,
>> +	       csi2rx->base + CSI2RX_ERROR_IRQS_REG);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>>   static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
>>   {
>>   	unsigned int i;
>> @@ -209,12 +277,26 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   	unsigned int i;
>>   	unsigned long lanes_used = 0;
>>   	u32 reg;
>> -	int ret;
>> +	int irq, ret;
>>   
>>   	ret = clk_prepare_enable(csi2rx->p_clk);
>>   	if (ret)
>>   		return ret;
>>   
>> +	irq = platform_get_irq_byname_optional(to_platform_device(csi2rx->dev), "error");
> 
> Why is this interrupt acquired everytime somebody starts the stream, as
> opposed to once at probe-time?

This was a mistake. Thanks for pointing this out.
In v2, I will correct this by acquiring the interrupt in the probe
function and the interrupt will only be enabled by writing to the
mask register in start_stream() and disabled in stop_stream().

> 
>> +
>> +	if (irq < 0) {
>> +		dev_warn(csi2rx->dev, "Optional interrupt not defined, proceeding without it\n");
> 
> Given this is an optional interrupt, and different SoC vendors may or may not
> integerate it, I don't think bothering the end-user with a warning everytime
> is best. This could be dev_dbg.

Yes, understood. I will change dev_warn() to dev_dbg() in v2.

Thanks and Regards,
Yemike Abhilash Chandra

> 
>> +	} else {
>> +		csi2rx_configure_err_irq_mask(csi2rx->base);
>> +		ret = devm_request_irq(csi2rx->dev, irq, csi2rx_irq_handler, 0,
>> +					"csi2rx-irq", csi2rx);
>> +		if (ret) {
>> +			dev_err(csi2rx->dev, "Unable to request interrupt: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>>   	reset_control_deassert(csi2rx->p_rst);
>>   	csi2rx_reset(csi2rx);
>>   
>> @@ -361,6 +443,21 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>>   	}
>>   }
>>   
>> +static int csi2rx_log_status(struct v4l2_subdev *sd)
>> +{
>> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(sd);
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < CSI2RX_NUM_EVENTS; i++) {
>> +		if (csi2rx->events[i])
>> +			dev_info(csi2rx->dev, "%s events: %d\n",
>> +				 csi2rx_events[i].name,
>> +				 csi2rx->events[i]);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
>>   {
>>   	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>> @@ -466,7 +563,12 @@ static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
>>   	.s_stream	= csi2rx_s_stream,
>>   };
>>   
>> +static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
>> +	.log_status	= csi2rx_log_status,
>> +};
>> +
>>   static const struct v4l2_subdev_ops csi2rx_subdev_ops = {
>> +	.core		= &csi2rx_core_ops,
>>   	.video		= &csi2rx_video_ops,
>>   	.pad		= &csi2rx_pad_ops,
>>   };
>> -- 
>> 2.34.1
>>

