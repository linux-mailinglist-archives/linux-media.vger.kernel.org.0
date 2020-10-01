Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73FF127FC33
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 11:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731067AbgJAJHC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 05:07:02 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:61710 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgJAJHB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 05:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601543220; x=1604135220;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pWZQ1NVUR4MU+7W9B3yIXLTmCn3vjuY13WnbA4zRH4g=;
        b=GNClneuFKkgCJgYUzmsmTncZDtdYDCT7okKCkdJtr4JAU9LpDjHPBugiuMkCIL0s
        Am0YZ+3Jt2DUPM2X+ESZPY03YbL4vICYw6FCa3J0lZmpU2v3xp0hgh9AXE3fqrBw
        f/mKSixX8iRZnvwW2SiD29kqAMwcNzdW58MmUcnWH9Y=;
X-AuditID: c39127d2-253ff70000001c25-c6-5f759c345d5c
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 29.3E.07205.43C957F5; Thu,  1 Oct 2020 11:07:00 +0200 (CEST)
Received: from [172.16.23.108] ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020100111070054-533442 ;
          Thu, 1 Oct 2020 11:07:00 +0200 
Subject: Re: [PATCH v2 1/5] media: mt9p031: Add support for 8 bit and 10 bit
 formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>,
        Jan Luebbe <jlu@pengutronix.de>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930114231.GH5689@pendragon.ideasonboard.com>
From:   =?UTF-8?Q?Stefan_Riedm=c3=bcller?= <s.riedmueller@phytec.de>
Message-ID: <eacb7df5-bc68-3047-b893-4c1ba4975278@phytec.de>
Date:   Thu, 1 Oct 2020 11:07:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930114231.GH5689@pendragon.ideasonboard.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 01.10.2020 11:07:00,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 01.10.2020 11:07:00,
        Serialize complete at 01.10.2020 11:07:00
X-TNEFEvaluated: 1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRmVeSWpSXmKPExsWyRoCBS9dkTmm8wZnJqhZf58xjteicuITd
        4vKuOWwWPRu2slos2/SHyeLTlm9MDmwesztmsnpsWtXJ5jHvZKBH/18Dj8+b5AJYo7hsUlJz
        MstSi/TtErgy2qbvYy54r1HR+d2igfGfQhcjJ4eEgInE5inH2EFsIYFtjBLT/xR1MXIB2acZ
        JeaeXszUxcjBISwQJrH7hSBIjYiAhUTvoumMIDXMArcYJf7cWMcK0VwkcfXVGjYQm03ASWLx
        +Q42kF5eARuJczdrQcIsAioSL9bdYAEJiwpESuzcYQkS5hUQlDg58wkLiM0pYC/xsWsTM8h4
        CYFGJok1Tw+xQtwpJHF68VlmEJtZQF5i+9s5ULaZxLzND6FscYlbT+YzTWAUmoVk7iwkLbOQ
        tMxC0rKAkWUVo1BuZnJ2alFmtl5BRmVJarJeSuomRmBUHJ6ofmkHY98cj0OMTByMhxglOJiV
        RHgPJZbEC/GmJFZWpRblxxeV5qQWH2KU5mBREufdwFsSJiSQnliSmp2aWpBaBJNl4uCUamDs
        OuxnyKf249n7lsWf1LSr/AWm+2UGdxhWH9mx4YSVJYOTtvCs0Huc7+fvLd2+belOx2y/7TFc
        EfVL/tmofmM8cj3F3yNr76avz67zyZed2+wx6d2kNV7s1r0urMsenCoQdLkrcDZ07mfPyfUO
        B5eturfm+h2/IhGFPt+EczXVu69ftuXtetmixFKckWioxVxUnAgAy6ET7HgCAAA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 30.09.20 13:42, Laurent Pinchart wrote:
> Hi Stefan,
> 
> Thank you for the patch.
> 
> On Wed, Sep 30, 2020 at 12:51:29PM +0200, Stefan Riedmueller wrote:
>> From: Christian Hemp <c.hemp@phytec.de>
>>
>> Aside from 12 bit monochrome or color format the sensor implicitly
>> supports 10 and 8 bit formats as well by simply dropping the
>> corresponding LSBs.
> 
> That's not how it should work though. If you set the format on
> MEDIA_BUS_FMT_SGRBG8_1X8 through the pipeline for instance, you will end
> up capturing the 8 LSB, not the 8 MSB.
> 
> What's your use case for this ?

I use this sensor in combination with an i.MX 6 and i.MX 6UL. When the 
sensor is connected with 12 bit (or 10 bit on the i.MX 6UL) and I set 
MEDIA_BUS_FMT_SGRBG8_1X8 through the pipeline the CSI interface drops the 
unused 4 LSB (or 2 LSB on the i.MX 6UL) so I get the 8 MSB from my 12 bit 
sensor.

Does this clarify things? Maybe the description in the commit message is not 
accurate enough or did I get something wrong?

Thanks,
Stefan

> 
>> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
>> [jlu@pengutronix.de: simplified by dropping v4l2_colorspace handling]
>> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
>> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
>> ---
>> Changes in v2:
>>   - Use unsigned int for num_fmts and loop variable in find_datafmt
>>   - Remove superfluous const qualifier from find_datafmt
>> ---
>>   drivers/media/i2c/mt9p031.c | 50 +++++++++++++++++++++++++++++--------
>>   1 file changed, 40 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
>> index dc23b9ed510a..2e6671ef877c 100644
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
>> +	unsigned int num_fmts;
>> +
>>   	/* Registers cache */
>>   	u16 output_control;
>>   	u16 mode2;
>> @@ -148,6 +163,17 @@ static struct mt9p031 *to_mt9p031(struct v4l2_subdev *sd)
>>   	return container_of(sd, struct mt9p031, subdev);
>>   }
>>   
>> +static u32 mt9p031_find_datafmt(struct mt9p031 *mt9p031, u32 code)
>> +{
>> +	unsigned int i;
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
