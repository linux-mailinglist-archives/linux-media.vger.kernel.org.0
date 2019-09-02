Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0AFA5D99
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 23:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbfIBVht (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 17:37:49 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38229 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbfIBVhs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 17:37:48 -0400
Received: by mail-wr1-f65.google.com with SMTP id l11so6439754wrx.5;
        Mon, 02 Sep 2019 14:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=AzTuyC2UsbNpm6l7U9X8UINePV0sxSWA4lyUt5FUF8I=;
        b=ACOXOZftMzxnBXf7Mn8TNUGkt5tTRL0PxYAd9HIEyOmhxpyBC2Xs0YAiO2WCsQGZuM
         2RyyEMVjxsUXBfHRnbvsgdAJ0Soi7FTywBM7MiTPh/31uIqySyseSdQZ2X+ucXc/NAmB
         zzx7xB9CHW0AQlMugYjiOAr6J2CMaC4T4CTvmSNc4o6Gmrs3GUD3qiHcaceT2XEampVQ
         uv3DSFPyxEaoUQHtQj+MFFif6DI37sQ3URILMUTlkVDslod+EUX47nfEHhue5U0gMKpM
         4xjaCMmwR/X6+Pc/5og0XwtV56aBpEjjx+8JUbqJ613u7EsgbM4A4Bz6vFeED2fmwLm0
         PEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=AzTuyC2UsbNpm6l7U9X8UINePV0sxSWA4lyUt5FUF8I=;
        b=iDKH6+5TFjzoAL43GrNduPefldo8LT/+2ge/ccFt66qowi7pLlw3Iu/8+8QhLTGmpY
         FAAaDSsGQnJNFJ+xO0rq8n20c1ohx0gkg16BMi1RQxnKMzaMAc6n7+NFTgza7y9LeSZK
         wOVgaLYtmsUUysZScs1MNguTfE/PElO83q5BIhK8D8Hwc2ZrJkSGVbapaM3asxktmgsS
         lijH8nOWfR2Ev7jJ3dkvWyXVnLbOpxIryaIa1M/9g5tFQHxgsRL2O/rOtilZTA4P02ZW
         GssDSSNReCHwHlexRVaffX2xHrnDsNbZLLLG2GCIkCNEfdTzblcqvxQLDtK4p1fVhslc
         kv/Q==
X-Gm-Message-State: APjAAAVoxkCscA3BIZVv27YWK1gcQGwlmU/LPqnN0gNQmoj3KAQKRW7l
        dJgKmCR2r3Z2Ms/m5gxnVDyTday3
X-Google-Smtp-Source: APXvYqziqzBEOwGLRmlaO0Yb8EPO9joHZ7A7//D5mVWpDB+g5EX3APsttrwr1cYJsIvfbbQRjE3bKg==
X-Received: by 2002:adf:f30e:: with SMTP id i14mr24352349wro.288.1567460265983;
        Mon, 02 Sep 2019 14:37:45 -0700 (PDT)
Received: from [172.30.89.46] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id q24sm23219092wmc.3.2019.09.02.14.37.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 14:37:45 -0700 (PDT)
Subject: Re: [PATCH 15/22] media: imx7-media-csi: Create media links in bound
 notifier
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
 <20190805233505.21167-16-slongerbeam@gmail.com> <m3blw35970.fsf@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <b648b587-110d-8e6a-8b9c-10e8dbb9561e@gmail.com>
Date:   Mon, 2 Sep 2019 14:37:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <m3blw35970.fsf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On 9/2/19 2:38 AM, Rui Miguel Silva wrote:
> Hi Steve,
> On Tue 06 Aug 2019 at 00:34, Steve Longerbeam wrote:
>> Implement a notifier bound op to register media links from the remote
>> sub-device's source pad(s) to the CSI sink pad.
>>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>>   drivers/staging/media/imx/imx7-media-csi.c | 24 ++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
>> index a1c96c52a606..f71ac485f780 100644
>> --- a/drivers/staging/media/imx/imx7-media-csi.c
>> +++ b/drivers/staging/media/imx/imx7-media-csi.c
>> @@ -196,6 +196,11 @@ struct imx7_csi {
>>   	struct completion last_eof_completion;
>>   };
>>
>> +static inline struct imx7_csi *notifier_to_dev(struct v4l2_async_notifier *n)
>>
> As the other one add the namespace for the function name:
> imx7_csi_notifier_to_dev
>
> other than this, looks good to me.

Thanks for the review. I will make those changes in next rev.

Steve

>
>
>> +{
>> +	return container_of(n, struct imx7_csi, notifier);
>> +}
>> +
>>   static u32 imx7_csi_reg_read(struct imx7_csi *csi, unsigned int offset)
>>   {
>>   	return readl(csi->regbase + offset);
>> @@ -1173,6 +1178,23 @@ static int imx7_csi_parse_endpoint(struct device *dev,
>>   	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -EINVAL;
>>   }
>>
>> +static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
>> +				 struct v4l2_subdev *sd,
>> +				 struct v4l2_async_subdev *asd)
>> +{
>> +	struct imx7_csi *csi = notifier_to_dev(notifier);
>> +	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
>> +
>> +	return media_create_fwnode_pad_links(sink,
>> +					     dev_fwnode(csi->sd.dev),
>> +					     &sd->entity,
>> +					     dev_fwnode(sd->dev), 0);
>> +}
>> +
>> +static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
>> +	.bound = imx7_csi_notify_bound,
>> +};
>> +
>>   static int imx7_csi_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> @@ -1253,6 +1275,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
>>
>>   	v4l2_async_notifier_init(&csi->notifier);
>>
>> +	csi->notifier.ops = &imx7_csi_notify_ops;
>> +
>>   	ret = v4l2_async_register_fwnode_subdev(&csi->sd, &csi->notifier,
>>   						sizeof(struct v4l2_async_subdev),
>>   						NULL, 0,

