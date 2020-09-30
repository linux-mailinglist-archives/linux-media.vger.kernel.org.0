Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA1F27E6FE
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 12:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729268AbgI3Ksz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 06:48:55 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:58334 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI3Ks2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 06:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601462900; x=1604054900;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uHNgAUSRjIYpKONmOmxLzT0J1VwoWeIp8MW5HjRFusw=;
        b=ncu8L3KWQXxdocX3s5NOtQyf+Q53qo8bIzUg9/Z7eKR7Du685o5KNq3cu5+jR9te
        lh8L2lnuvk4etcqdb2emhsfW3bZPw6TLExRIEjqjKk0HU+PQm06q/UFpwGTVENOc
        LDFrB7aJVy0mNNuTSsohXi7virYo+5aZAeNxnY7QRNw=;
X-AuditID: c39127d2-269ff70000001c25-9e-5f746274219c
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id F6.89.07205.472647F5; Wed, 30 Sep 2020 12:48:20 +0200 (CEST)
Received: from [172.16.23.108] ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020093012481989-526280 ;
          Wed, 30 Sep 2020 12:48:19 +0200 
Subject: Re: [PATCH 1/5] media: mt9p031: Add support for 8 bit and 10 bit
 formats
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>,
        Jan Luebbe <jlu@pengutronix.de>
References: <20200925075029.32181-1-s.riedmueller@phytec.de>
 <20200925201125.GX26842@paasikivi.fi.intel.com>
From:   =?UTF-8?Q?Stefan_Riedm=c3=bcller?= <s.riedmueller@phytec.de>
Message-ID: <2d96fe8a-cb68-9945-738c-b3d9b42591a8@phytec.de>
Date:   Wed, 30 Sep 2020 12:48:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925201125.GX26842@paasikivi.fi.intel.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 12:48:19,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 12:48:20,
        Serialize complete at 30.09.2020 12:48:20
X-TNEFEvaluated: 1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRmVeSWpSXmKPExsWyRoCBS7ckqSTe4HErr8XXOfNYLTonLmG3
        uLxrDptFz4atrBbLNv1hsvi05RuTA5vH7I6ZrB6bVnWyecw7GejR/9fA4/MmuQDWKC6blNSc
        zLLUIn27BK6MF7uvMRVcUar4fLGugbFLpouRk0NCwERiy48DLF2MXBxCAtsYJfYd3ccO4Zxh
        lPi+/QITSJWwQLDEipU9QFUcHCIC+hKTHpiB1DALPGaUWD7tDStIXEggT+LBPEmQcjYBJ4nF
        5zvYQGxeARuJ3VcesILYLAKqElsu3mQHKRcViJTYucMSokRQ4uTMJ2DTOYHKr+xRBpkuIdDI
        JPG7exYTxJ1CEqcXn2UGsZkF5CW2v50DZZtJzNv8EMoWl7j1ZD7TBEahWUjGzkLSMgtJyywk
        LQsYWVYxCuVmJmenFmVm6xVkVJakJuulpG5iBEbF4Ynql3Yw9s3xOMTIxMF4iFGCg1lJhPdQ
        Ykm8EG9KYmVValF+fFFpTmrxIUZpDhYlcd4NvCVhQgLpiSWp2ampBalFMFkmDk6pBsaJt11m
        K0b3yZz9wnPjSVch78IEsbyTh+IupEbFLFPZdV7MwGcNqy/TYR0OowO2Va+XHc4pPeL4+aeX
        qVyUi7KXxp0gvbPve0+f2MZ2+Zb7yWTWo0271txj7bG6dtbI2f9uRNrqK4nOBtVTd8xVnua8
        Qc588XmunsPn5ufIT5nTFLUyc671wuNKLMUZiYZazEXFiQBD4OoUeAIAAA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 25.09.20 22:11, Sakari Ailus wrote:
> Hi Stefan,
> 
> On Fri, Sep 25, 2020 at 09:50:25AM +0200, Stefan Riedmueller wrote:
>> From: Christian Hemp <c.hemp@phytec.de>
>>
>> Aside from 12 bit monochrome or color format the sensor implicitly
>> supports 10 and 8 bit formats as well by simply dropping the
>> corresponding LSBs.
>>
>> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
>> [jlu@pengutronix.de: simplified by dropping v4l2_colorspace handling]
>> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
>> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
>> ---
>>   drivers/media/i2c/mt9p031.c | 50 +++++++++++++++++++++++++++++--------
>>   1 file changed, 40 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
>> index dc23b9ed510a..0002dd299ffa 100644
>> --- a/drivers/media/i2c/mt9p031.c
>> +++ b/drivers/media/i2c/mt9p031.c
>> @@ -116,6 +116,18 @@ enum mt9p031_model {
>>   	MT9P031_MODEL_MONOCHROME,
>>   };
>>   
>> +static const u32 mt9p031_color_fmts[] = {
>> +	MEDIA_BUS_FMT_SGRBG8_1X8,
>> +	MEDIA_BUS_FMT_SGRBG10_1X10,
>> +	MEDIA_BUS_FMT_SGRBG12_1X12,
>> +};
>> +
>> +static const u32 mt9p031_monochrome_fmts[] = {
>> +	MEDIA_BUS_FMT_Y8_1X8,
>> +	MEDIA_BUS_FMT_Y10_1X10,
>> +	MEDIA_BUS_FMT_Y12_1X12,
>> +};
>> +
>>   struct mt9p031 {
>>   	struct v4l2_subdev subdev;
>>   	struct media_pad pad;
>> @@ -138,6 +150,9 @@ struct mt9p031 {
>>   	struct v4l2_ctrl *blc_auto;
>>   	struct v4l2_ctrl *blc_offset;
>>   
>> +	const u32 *fmts;
>> +	int num_fmts;
> 
> Unsigned int, please.
> 
>> +
>>   	/* Registers cache */
>>   	u16 output_control;
>>   	u16 mode2;
>> @@ -148,6 +163,17 @@ static struct mt9p031 *to_mt9p031(struct v4l2_subdev *sd)
>>   	return container_of(sd, struct mt9p031, subdev);
>>   }
>>   
>> +static const u32 mt9p031_find_datafmt(struct mt9p031 *mt9p031, u32 code)
>> +{
>> +	int i;
> 
> Same here.

I'll fix it in v2.

Thanks,
Stefan

> 
>> +
>> +	for (i = 0; i < mt9p031->num_fmts; i++)
>> +		if (mt9p031->fmts[i] == code)
>> +			return mt9p031->fmts[i];
>> +
>> +	return mt9p031->fmts[mt9p031->num_fmts-1];
>> +}
>> +
>>   static int mt9p031_read(struct i2c_client *client, u8 reg)
>>   {
>>   	return i2c_smbus_read_word_swapped(client, reg);
>> @@ -476,10 +502,11 @@ static int mt9p031_enum_mbus_code(struct v4l2_subdev *subdev,
>>   {
>>   	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
>>   
>> -	if (code->pad || code->index)
>> +	if (code->pad || code->index >= mt9p031->num_fmts)
>>   		return -EINVAL;
>>   
>> -	code->code = mt9p031->format.code;
>> +	code->code = mt9p031->fmts[code->index];
>> +
>>   	return 0;
>>   }
>>   
>> @@ -573,6 +600,8 @@ static int mt9p031_set_format(struct v4l2_subdev *subdev,
>>   	__format->width = __crop->width / hratio;
>>   	__format->height = __crop->height / vratio;
>>   
>> +	__format->code = mt9p031_find_datafmt(mt9p031, format->format.code);
>> +
>>   	format->format = *__format;
>>   
>>   	return 0;
>> @@ -951,10 +980,7 @@ static int mt9p031_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
>>   
>>   	format = v4l2_subdev_get_try_format(subdev, fh->pad, 0);
>>   
>> -	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
>> -		format->code = MEDIA_BUS_FMT_Y12_1X12;
>> -	else
>> -		format->code = MEDIA_BUS_FMT_SGRBG12_1X12;
>> +	format->code = mt9p031_find_datafmt(mt9p031, 0);
>>   
>>   	format->width = MT9P031_WINDOW_WIDTH_DEF;
>>   	format->height = MT9P031_WINDOW_HEIGHT_DEF;
>> @@ -1121,10 +1147,14 @@ static int mt9p031_probe(struct i2c_client *client,
>>   	mt9p031->crop.left = MT9P031_COLUMN_START_DEF;
>>   	mt9p031->crop.top = MT9P031_ROW_START_DEF;
>>   
>> -	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
>> -		mt9p031->format.code = MEDIA_BUS_FMT_Y12_1X12;
>> -	else
>> -		mt9p031->format.code = MEDIA_BUS_FMT_SGRBG12_1X12;
>> +	if (mt9p031->model == MT9P031_MODEL_MONOCHROME) {
>> +		mt9p031->fmts = mt9p031_monochrome_fmts;
>> +		mt9p031->num_fmts = ARRAY_SIZE(mt9p031_monochrome_fmts);
>> +	} else {
>> +		mt9p031->fmts = mt9p031_color_fmts;
>> +		mt9p031->num_fmts = ARRAY_SIZE(mt9p031_color_fmts);
>> +	}
>> +	mt9p031->format.code = mt9p031_find_datafmt(mt9p031, 0);
>>   
>>   	mt9p031->format.width = MT9P031_WINDOW_WIDTH_DEF;
>>   	mt9p031->format.height = MT9P031_WINDOW_HEIGHT_DEF;
> 
