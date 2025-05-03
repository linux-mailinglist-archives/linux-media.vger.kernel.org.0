Return-Path: <linux-media+bounces-31652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2AAA7EBF
	for <lists+linux-media@lfdr.de>; Sat,  3 May 2025 08:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A11D5A033B
	for <lists+linux-media@lfdr.de>; Sat,  3 May 2025 06:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDB41A23BE;
	Sat,  3 May 2025 06:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nG1bFyDF"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD26E14B08C;
	Sat,  3 May 2025 06:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746252017; cv=none; b=Jt/EpzCrgo3o2OsLjCrWQlHeLFNaYXm75C1oEkA+nuEZDSOSM9MhQ5qc56MWXXN3IZwE/H0BSaJZ4UnRXjG4gb1+7EIOH5dGdgE7Ic1xeAh++lj5K1muu4NzbVY7FWUKRYwa3ipjJwmEvtK0BhNyV4aHhUyQijKbECOLNPapd38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746252017; c=relaxed/simple;
	bh=4IF2wjBMqe9kYoi07d1OYznfM1WTSlfUxNUugwXqDrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hez0fv5vEXtYTowxXXBZlcDW8/39kLSfFcUH1lA6gQ59e2mWrRZHFvVxQ9zhCS0JN6WLRdQioZ+oBH3edc2M54PsNjZFiv6eSxXdxU+bE/HLTT6a4T5b1qw64MPU+esypbtDzmaSlEpOiCs32j/7XX63gZisrXDIbpFiiaMDVjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nG1bFyDF; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 543600sT375841
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 3 May 2025 01:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746252000;
	bh=uX192ascD1tQw4R+O4G4hejYOzZh00dToItgKCafS5w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nG1bFyDFEQy/zXPW3fOVzz8CkNdDh8f/m+OBOhYaujtsJPai8nP5J3VkCsD7IYXfD
	 /X4e0m2Zphk3mMKR9ArSBtAmY9ngkhjVUV7cM03DipPOpwB3C6AldseR8MFZ694xy4
	 hhWyBAZul4D+GXMOOoBiGUcxTVJyyKy6b2I5scxM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5436000s011226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 3 May 2025 01:00:00 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 3
 May 2025 00:59:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 3 May 2025 00:59:59 -0500
Received: from [10.24.69.232] (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5435xrAW047042;
	Sat, 3 May 2025 00:59:54 -0500
Message-ID: <55afd406-82fc-474e-9809-77d0fe48997c@ti.com>
Date: Sat, 3 May 2025 11:29:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] media: ti: j721e-csi2rx: get number of contexts
 from device tree
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: <jai.luthra@linux.dev>, <mripard@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-7-r-donadkar@ti.com>
 <20250421132030.GF29483@pendragon.ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <20250421132030.GF29483@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 21/04/25 18:50, Laurent Pinchart wrote:
> Hi Rishikesh,
>
> Thank you for the patch.


Hi Laurent,

Thank you for the review !

>
> On Thu, Apr 17, 2025 at 12:25:47PM +0530, Rishikesh Donadkar wrote:
>> From: Pratyush Yadav <p.yadav@ti.com>
>>
>> Different platforms that use this driver might have different number of
>> DMA channels allocated for CSI. So only as many DMA contexts can be used
>> as the number of DMA channels available. Get the number of channels
>> provided via device tree and only configure that many contexts, and
>> hence only that many pads.
>>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> Co-developed-by: Jai Luthra <j-luthra@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 41 ++++++++++++++-----
>>   1 file changed, 30 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index ea7e331e872af..e85d04d7c2ff9 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -40,7 +40,7 @@
>>   #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
>>   
>>   #define PSIL_WORD_SIZE_BYTES		16
>> -#define TI_CSI2RX_NUM_CTX		1
>> +#define TI_CSI2RX_MAX_CTX		32
>>   
>>   /*
>>    * There are no hard limits on the width or height. The DMA engine can handle
>> @@ -53,8 +53,8 @@
>>   
>>   #define TI_CSI2RX_PAD_SINK		0
>>   #define TI_CSI2RX_PAD_FIRST_SOURCE	1
>> -#define TI_CSI2RX_NUM_SOURCE_PADS	1
>> -#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
>> +#define TI_CSI2RX_MAX_SOURCE_PADS	TI_CSI2RX_MAX_CTX
>> +#define TI_CSI2RX_MAX_PADS		(1 + TI_CSI2RX_MAX_SOURCE_PADS)
>>   
>>   #define DRAIN_TIMEOUT_MS		50
>>   #define DRAIN_BUFFER_SIZE		SZ_32K
>> @@ -112,14 +112,15 @@ struct ti_csi2rx_dev {
>>   	void __iomem			*shim;
>>   	struct mutex			mutex; /* To serialize ioctls. */
>>   	unsigned int			enable_count;
>> +	unsigned int			num_ctx;
>>   	struct v4l2_device		v4l2_dev;
>>   	struct media_device		mdev;
>>   	struct media_pipeline		pipe;
>> -	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
>> +	struct media_pad		pads[TI_CSI2RX_MAX_PADS];
>>   	struct v4l2_async_notifier	notifier;
>>   	struct v4l2_subdev		*source;
>>   	struct v4l2_subdev		subdev;
>> -	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
>> +	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
>>   	/* Buffer to drain stale data from PSI-L endpoint */
>>   	struct {
>>   		void			*vaddr;
>> @@ -449,7 +450,7 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>>   		return ret;
>>   
>>   	/* Create and link video nodes for all DMA contexts */
>> -	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
>> +	for (i = 0; i < csi->num_ctx; i++) {
>>   		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
>>   		struct video_device *vdev = &ctx->vdev;
>>   
>> @@ -1212,10 +1213,11 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>>   	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>>   
>>   	for (unsigned int i = TI_CSI2RX_PAD_FIRST_SOURCE;
>> -	     i < TI_CSI2RX_NUM_PADS; i++)
>> +	     i < TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx; i++)
>>   		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
>>   
>> -	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
>> +	ret = media_entity_pads_init(&sd->entity,
>> +				     TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx,
>>   				     csi->pads);
>>   	if (ret)
>>   		goto unregister_media;
>> @@ -1301,8 +1303,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
>>   
>>   static int ti_csi2rx_probe(struct platform_device *pdev)
>>   {
>> +	struct device_node *np = pdev->dev.of_node;
>>   	struct ti_csi2rx_dev *csi;
>> -	int ret, i;
>> +	int ret, i, count;
>>   
>>   	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
>>   	if (!csi)
>> @@ -1324,13 +1327,29 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>>   	if (!csi->drain.vaddr)
>>   		return -ENOMEM;
>>   
>> +	/* Only use as many contexts as the number of DMA channels allocated. */
>> +	count = of_property_count_strings(np, "dma-names");
>> +	if (count < 0) {
>> +		dev_err(csi->dev, "Failed to get DMA channel count: %d\n",
>> +			count);
>> +		return count;
> You're leaking the drain buffer.


Oops. Will fix in the next revision


>
>> +	}
>> +
>> +	csi->num_ctx = count;
>> +	if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
>> +		dev_warn(csi->dev,
>> +			 "%u DMA channels passed. Maximum is %u. Ignoring the rest.\n",
>> +			 csi->num_ctx, TI_CSI2RX_MAX_CTX);
> I'd rather turn this into a hard error and get the device trees fixed.


Right, will do that in the next revision.


>
>> +		csi->num_ctx = TI_CSI2RX_MAX_CTX;
>> +	}
>> +
>>   	mutex_init(&csi->mutex);
>>   
>>   	ret = ti_csi2rx_v4l2_init(csi);
>>   	if (ret)
>>   		goto err_v4l2;
>>   
>> -	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
>> +	for (i = 0; i < csi->num_ctx; i++) {
>>   		csi->ctx[i].idx = i;
>>   		csi->ctx[i].csi = csi;
>>   		ret = ti_csi2rx_init_ctx(&csi->ctx[i]);
>> @@ -1369,7 +1388,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>>   	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
>>   	unsigned int i;
>>   
>> -	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++)
>> +	for (i = 0; i < csi->num_ctx; i++)
>>   		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>>   
>>   	ti_csi2rx_cleanup_notifier(csi);

Regards,

Rishi




