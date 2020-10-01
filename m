Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9974127FC06
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 10:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731733AbgJAI43 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 04:56:29 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:61418 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgJAI41 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 04:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601542584; x=1604134584;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5qfhGBDJtYEDB90Yi1ULKFgAmOXz1vGdko1Qk2XBSVQ=;
        b=jm8fPaLndm5Anl6vqnzaO1DOwwI+kC196Mt8JllmtTcH0eExuQ28DXG3u0CmewZ7
        J6dokyr80KnRsia398H0aSXJhIDc4eOTAych/tfyZ4jg1aWflNfECcIq2NnxmNhi
        DBqDbCrFsXTXFbM8eFnrCLs0UENu4OByxlt6AAgxPGo=;
X-AuditID: c39127d2-269ff70000001c25-45-5f7599b87717
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 08.2E.07205.8B9957F5; Thu,  1 Oct 2020 10:56:24 +0200 (CEST)
Received: from [172.16.23.108] ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020100110562434-533353 ;
          Thu, 1 Oct 2020 10:56:24 +0200 
Subject: Re: [PATCH v2 3/5] media: mt9p031: Implement [gs]_register debug
 calls
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930105133.139981-3-s.riedmueller@phytec.de>
 <20200930113831.GG5689@pendragon.ideasonboard.com>
From:   =?UTF-8?Q?Stefan_Riedm=c3=bcller?= <s.riedmueller@phytec.de>
Message-ID: <289d5897-424f-326f-0bc1-c9a1b79284c3@phytec.de>
Date:   Thu, 1 Oct 2020 10:56:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930113831.GG5689@pendragon.ideasonboard.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 01.10.2020 10:56:24,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 01.10.2020 10:56:24,
        Serialize complete at 01.10.2020 10:56:24
X-TNEFEvaluated: 1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWyRoCBS3fHzNJ4g5l7JSz2HrvAYtE5cQm7
        xeVdc9gsejZsZbVYtukPk8WnLd+YHNg8ZnfMZPXYtKqTzWPeyUCPFSv/M3l83iQXwBrFZZOS
        mpNZllqkb5fAlbFwfxNTwXOxirUtF5kbGJcJdTFyckgImEj0Xl3H0sXIxSEksI1RoufuZnaQ
        hJDAaUaJWdsdQWxhgUCJjWdvgsVFBCwkehdNZwRpYBY4zihxcdEyVojuZYwSR/98ZwWpYhNw
        klh8voOti5GDg1fARmL+EksQk0VAReL1iWoQU1QgUmLnDkuQYl4BQYmTM5+wgNicAvYS/z5d
        YwKZKCHQyCTx5fgJNohDhSROLz7LDGIzC8hLbH87B8o2k5i3+SGULS5x68l8pgmMQrOQzJ2F
        pGUWkpZZSFoWMLKsYhTKzUzOTi3KzNYryKgsSU3WS0ndxAiMjcMT1S/tYOyb43GIkYmD8RCj
        BAezkgjvocSSeCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8G3hLwoQE0hNLUrNTUwtSi2CyTByc
        Ug2M6oFmHbKd65TKK9cI7K5NmMg67fZXu23vzaxYdp6c+ofRy3NL5saYTxNnufOHTv/A2VUl
        Nnm29dbeXPZJk40LLOcq5jQ/vcTP7C7ccWDFg40qF92tdnRJHYpvu63ToTdpl8ON6aK+igun
        eO2fpFKm9y9323HvEq2G/fly62ZaSR2T3L97ri+vEktxRqKhFnNRcSIAsepuqHsCAAA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 30.09.20 13:38, Laurent Pinchart wrote:
> Hi Stefan,
> 
> Thank you for the patch.
> 
> On Wed, Sep 30, 2020 at 12:51:31PM +0200, Stefan Riedmueller wrote:
>> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>>
>> Implement g_register and s_register v4l2_subdev_core_ops to access
>> camera register directly from userspace for debug purposes.
> 
> As the name of the operations imply, this is meant for debug purpose
> only. They are however prone to be abused to configure the sensor from
> userspace in production, which isn't a direction we want to take.
> What's your use case for this ?  I'd rather drop this patch and see the
> driver extended with support for more controls if needed

thanks for your feedback.

I get your point. I myself solely use these operations for debugging 
purposes but I'm aware that others like to abuse them.

I thought I send it anyway since for me the DEBUG config is enough to 
signalize that these operations are not to be used with a productive system. 
But I'm OK with dropping this patch if you think it might send the wrong signal.

Regards,
Stefan

> 
>> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
>> ---
>> No changes in v2
>> ---
>>   drivers/media/i2c/mt9p031.c | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
>> index b4c042f418c1..de36025260a8 100644
>> --- a/drivers/media/i2c/mt9p031.c
>> +++ b/drivers/media/i2c/mt9p031.c
>> @@ -703,6 +703,30 @@ static int mt9p031_restore_blc(struct mt9p031 *mt9p031)
>>   	return 0;
>>   }
>>   
>> +#ifdef CONFIG_VIDEO_ADV_DEBUG
>> +static int mt9p031_g_register(struct v4l2_subdev *sd,
>> +			      struct v4l2_dbg_register *reg)
>> +{
>> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
>> +	int ret;
>> +
>> +	ret = mt9p031_read(client, reg->reg);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	reg->val = ret;
>> +	return 0;
>> +}
>> +
>> +static int mt9p031_s_register(struct v4l2_subdev *sd,
>> +			      struct v4l2_dbg_register const *reg)
>> +{
>> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
>> +
>> +	return mt9p031_write(client, reg->reg, reg->val);
>> +}
>> +#endif
>> +
>>   static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
>>   {
>>   	struct mt9p031 *mt9p031 =
>> @@ -1000,6 +1024,10 @@ static int mt9p031_close(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
>>   
>>   static const struct v4l2_subdev_core_ops mt9p031_subdev_core_ops = {
>>   	.s_power        = mt9p031_set_power,
>> +#ifdef CONFIG_VIDEO_ADV_DEBUG
>> +	.s_register	= mt9p031_s_register,
>> +	.g_register	= mt9p031_g_register,
>> +#endif
>>   };
>>   
>>   static const struct v4l2_subdev_video_ops mt9p031_subdev_video_ops = {
> 
