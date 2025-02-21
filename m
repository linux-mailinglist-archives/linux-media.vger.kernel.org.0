Return-Path: <linux-media+bounces-26537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7935FA3EC1F
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 06:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A77C93B5F3A
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 05:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C843E1FBCBA;
	Fri, 21 Feb 2025 05:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NoWzvM6E"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B0F8F6E;
	Fri, 21 Feb 2025 05:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740114712; cv=none; b=cloWBfW+dxGsg13eu4sUccRQ7FlJee5QpH/0aR3Qvj853rX2wsWEmheGRWkOgB+yAtEXbaUxyyMZJ49Iu26ugcTMRgdyNhczZEI04QLKlGyN1fKpspdtyErL6hpWkobBPl9AVgT+C03/cKZSOxNKJWNi6SstgV/4zVt362vVb08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740114712; c=relaxed/simple;
	bh=jSabu95rtnStDPlQGTh9to9XDb9ataCsZe7RdVSIWEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JBO5xSTcHUF0pJzFTVnI28ptKt+ldwUP78jVxTjPktq17jK10dXF8p2A6/8tFBZdbJW4RRID5vREENUgq6y75L5ECIXGn0yMO+EqNb6cXgIu8+jlpeLsWfkfyRSqj0Gky+H4/ajybNgq70UqSQtqnEdIyJaw3S4xrunQuAYfvbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NoWzvM6E; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51L5BLtA797411
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 20 Feb 2025 23:11:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740114681;
	bh=K+wA/hjqVLyjaCyInrl8CSTOgQS6yf34GbRa02+x2gM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NoWzvM6EaQeiZ9UN/QGEPqYQebipKBPi0j4XsR/vZy0Sa3t6ZF6WyVVk5t2+PXuUc
	 OX8xmoUpYmioLnn7OWHXj0IjoxGXrThveYSJJvtLCXL/Ew1LSconHWbdxKk3WHdxdW
	 6+4cgNGYp8ouPuBQ882mWRe1ib7IFjrkZT0mnMy4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51L5BL7I003743;
	Thu, 20 Feb 2025 23:11:21 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Feb 2025 23:11:21 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Feb 2025 23:11:21 -0600
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51L5BHqg057941;
	Thu, 20 Feb 2025 23:11:18 -0600
Message-ID: <a8d4b0d8-c64e-443c-a4c0-8b375873bb9b@ti.com>
Date: Fri, 21 Feb 2025 10:41:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq
 interrupt and add support for VIDIOC_LOG_STATUS
To: Jai Luthra <jai.luthra@linux.dev>, Rishikesh Donadkar <r-donadkar@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <mripard@kernel.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <u-kumar1@ti.com>
References: <20250217130013.2802293-1-y-abhilashchandra@ti.com>
 <20250217130013.2802293-3-y-abhilashchandra@ti.com>
 <x6akslzswdbesyazl6wi5xetikw7gnklvb3xuz2jra3qnk72as@r23gujc6ldhl>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <x6akslzswdbesyazl6wi5xetikw7gnklvb3xuz2jra3qnk72as@r23gujc6ldhl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jai,
Thanks for the review.

On 18/02/25 13:39, Jai Luthra wrote:
> Hi Abhilash,
> 
> On Mon, Feb 17, 2025 at 06:30:13PM +0530, Yemike Abhilash Chandra wrote:
>> Enable the csi2rx_err_irq interrupt to record any errors during streaming
>> and also add support for VIDIOC_LOG_STATUS ioctl. The VIDIOC_LOG_STATUS
>> ioctl can be invoked from user space to retrieve the device status,
>> including details about any errors.
>>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>
>> Changes in v2:
>> - Address Jai's review comment to get interrupt at probe instead of
>>    start_stream.
>> - Address Jai's review comment to change dev_warn to dev_dbg when there
>>    is no interrupt defined in DT.
>>
>>   drivers/media/platform/cadence/cdns-csi2rx.c | 102 ++++++++++++++++++-
>>   1 file changed, 101 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
>> index 4d64df829e75..79f0c31eaf50 100644
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
>> @@ -124,6 +169,24 @@ static const struct csi2rx_fmt formats[] = {
>>   	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, },
>>   };
>>   
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
>> @@ -218,6 +281,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   	reset_control_deassert(csi2rx->p_rst);
>>   	csi2rx_reset(csi2rx);
>>   
>> +	writel(CSI2RX_ERRORS, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
>> +
> 
> Because all events are masked here, I receive a flood of interrupts on my
> SK-AM62A due to Stream1 overflow events.
> 
> [  328.931479] cdns_csi2rx.30101000.csi-bridge: =================  START STATUS  =================
> [  328.940213] cdns-csi2rx 30101000.csi-bridge: Overflow of the Stream 1 FIFO detected events: 108078
> [  328.949179] cdns_csi2rx.30101000.csi-bridge: ==================  END STATUS  ==================
> 
> $ cat /proc/interrupts | grep csi
> 559:     108078          0          0          0     GICv3 175 Level     csi2rx-irq
> 
> I don't think Stream1 (pad2 of cdns-csi2rx) is connected to anything in the
> hardware, at least from what I can see in the AM62A TRM [1].
> 
> It should be possible to figure out which pads of cdns-csi2rx subdev have
> active links to other subdevs, and only enable events for the corresponding
> Stream port on the hardware.
> 

I will fix this in v3 so that the stream overflow bits in the
mask are set only when the corresponding pad/stream is active.

Thanks and Regards,
Yemike Abhilash Chandra

> This also exposes another issue in the csi2rx_start() function where we start
> streaming on all source pads, ignoring if it is actually linked to any subdev
> in the pipeline:
> 
>      for (i = 0; i < csi2rx->max_streams; i++) {
>      ...
> 		writel(CSI2RX_STREAM_CTRL_START,
> 		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
>      }
> 
> I believe that should be fixed as a separate patch, probably along with the v3
> of v4l2 streams API support [2].
> 
> [1] https://www.ti.com/lit/pdf/spruj16
> [2] https://lore.kernel.org/linux-media/20240627-multistream-v2-0-6ae96c54c1c3@ti.com/
> 
>>   	reg = csi2rx->num_lanes << 8;
>>   	for (i = 0; i < csi2rx->num_lanes; i++) {
>>   		reg |= CSI2RX_STATIC_CFG_DLANE_MAP(i, csi2rx->lanes[i]);
>> @@ -330,6 +395,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>>   	reset_control_assert(csi2rx->sys_rst);
>>   	clk_disable_unprepare(csi2rx->sys_clk);
>>   
>> +	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
>> +
>>   	for (i = 0; i < csi2rx->max_streams; i++) {
>>   		writel(CSI2RX_STREAM_CTRL_STOP,
>>   		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
>> @@ -361,6 +428,21 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
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
>> @@ -466,7 +548,12 @@ static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
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
>> @@ -665,7 +752,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>>   {
>>   	struct csi2rx_priv *csi2rx;
>>   	unsigned int i;
>> -	int ret;
>> +	int irq, ret;
>>   
>>   	csi2rx = kzalloc(sizeof(*csi2rx), GFP_KERNEL);
>>   	if (!csi2rx)
>> @@ -703,6 +790,19 @@ static int csi2rx_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_cleanup;
>>   
>> +	irq = platform_get_irq_byname_optional(to_platform_device(csi2rx->dev), "error");
>> +
> 
> What about the other two interrupts that are required in DT?
> 
>> +	if (irq < 0) {
>> +		dev_dbg(csi2rx->dev, "Optional interrupt not defined, proceeding without it\n");
>> +	} else {
>> +		ret = devm_request_irq(csi2rx->dev, irq, csi2rx_irq_handler, 0,
>> +					"csi2rx-irq", csi2rx);
>> +		if (ret) {
>> +			dev_err(csi2rx->dev, "Unable to request interrupt: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>>   	ret = v4l2_subdev_init_finalize(&csi2rx->subdev);
>>   	if (ret)
>>   		goto err_cleanup;
>> -- 
>> 2.34.1
>>
> 
> Thanks,
> Jai

