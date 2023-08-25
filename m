Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE917890A6
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 23:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbjHYVou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Aug 2023 17:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbjHYVoY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Aug 2023 17:44:24 -0400
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A8026A3
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 14:44:21 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id ZebEqI11VuWDMZebFqgFz9; Fri, 25 Aug 2023 23:44:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1692999859;
        bh=x+5ZPrYbhj5PKPVE2fTXOKBcqKXtsQpYPqOoSU95+TU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=dmH2cbL7pPtsZ6zNKdCHqOfgcHMf6oSHtp/VBv6+ilraxBQHHCT8l9XGK0oTrtxOA
         eSwSyE17nq/6JNxGAo4SKignN4lJq5vl9LEU39SiRK7NF+TQ46f0p50ZldBRd3WKr3
         4dUj6R/WgH01yjP2wXovRu7+1hSl4KCyDU7ICRVC9ZIIyuNk9qR6M/ib1kaETWwPy4
         Nqo9c70hKjyh4ShKmZG7qhxMEz+jpABoO29xfTmc+cTj0xxDC6lvi3J54hglCwz6ZU
         +d7HQd7DniHnMb1OJL1S3kja6Ihd6GTiqobB3V/rNjAnQ7MTY1n98vKJEl9OJTJvkC
         RCWp38HK3Tr+g==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 25 Aug 2023 23:44:19 +0200
X-ME-IP: 86.243.2.178
Message-ID: <bff9e368-9c42-144c-bdbc-9b9fcd04ec6b@wanadoo.fr>
Date:   Fri, 25 Aug 2023 23:44:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 3/8] media: staging: media: starfive: camss: Add core
 driver
To:     Jack Zhu <jack.zhu@starfivetech.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, bryan.odonoghue@linaro.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
        changhuang.liang@starfivetech.com
References: <20230824080109.89613-1-jack.zhu@starfivetech.com>
 <20230824080109.89613-4-jack.zhu@starfivetech.com>
 <74183f7b-6e53-ba3d-2160-1e526d61073b@wanadoo.fr>
 <a0c023e0-e145-f6f7-3a84-ac6045a6c495@starfivetech.com>
Content-Language: fr
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <a0c023e0-e145-f6f7-3a84-ac6045a6c495@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le 25/08/2023 à 12:44, Jack Zhu a écrit :
> Hi Christophe,
> 
> Thank you for your comment!
> 
> On 2023/8/25 2:31, Christophe JAILLET wrote:
>> Le 24/08/2023 à 10:01, Jack Zhu a écrit :
>>> Add core driver for StarFive Camera Subsystem. The code parses
>>> the device platform resources and registers related devices.
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
>>> ---
>>
>> ...
>>
>>> diff --git a/drivers/staging/media/starfive/camss/Kconfig b/drivers/staging/media/starfive/camss/Kconfig
>>> new file mode 100644
>>> index 000000000000..8d20e2bd2559
>>> --- /dev/null
>>> +++ b/drivers/staging/media/starfive/camss/Kconfig
>>> @@ -0,0 +1,17 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +config VIDEO_STARFIVE_CAMSS
>>> +    tristate "Starfive Camera Subsystem driver"
>>> +    depends on V4L_PLATFORM_DRIVERS
>>> +    depends on VIDEO_DEV && OF
>>> +    depends on HAS_DMA
>>> +    depends on PM
>>> +    select MEDIA_CONTROLLER
>>> +    select VIDEO_V4L2_SUBDEV_API
>>> +    select VIDEOBUF2_DMA_CONTIG
>>> +    select V4L2_FWNODE
>>> +    help
>>> +       Enable this to support for the Starfive Camera subsystem
>>> +       found on Starfive JH7110 SoC.
>>> +
>>> +       To compile this driver as a module, choose M here: the
>>> +       module will be called msstf-cas.
>>
>> stf_camss? (s/-/_)
>>
> 
> Refer to the writing method of other media drivers, most of them use hyphen.

Forget about my comment. I have been puzzled by "msstf-cas" here, vs 
"stf_camss" below.

> it may be better to use ‘starfive-camss'？

Yes, I think so.

> 
>>> diff --git a/drivers/staging/media/starfive/camss/Makefile b/drivers/staging/media/starfive/camss/Makefile
>>> new file mode 100644
>>> index 000000000000..f53c5cbe958f
>>> --- /dev/null
>>> +++ b/drivers/staging/media/starfive/camss/Makefile
>>> @@ -0,0 +1,9 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +#
>>> +# Makefile for StarFive Camera Subsystem driver
>>> +#
>>> +
>>> +starfive-camss-objs += \
>>> +        stf_camss.o
>>> +
>>> +obj-$(CONFIG_VIDEO_STARFIVE_CAMSS) += starfive-camss.o
>>
>> I'm not an expert in Makefile files, but this stf_camss.o and starfive-camss.o look strange to me.
>>
> 
> Is it better to replace 'stf_camss.o' with 'stf-camss.o', which is consistent
> with the driving style of other media drivers?

No strong opinion on it.
Consistency is always good.

> 
>>> diff --git a/drivers/staging/media/starfive/camss/stf_camss.c b/drivers/staging/media/starfive/camss/stf_camss.c
>>> new file mode 100644
>>> index 000000000000..75ebc3a35218
>>> --- /dev/null
>>> +++ b/drivers/staging/media/starfive/camss/stf_camss.c
>>
>> ...
>>
>>> +static int stfcamss_of_parse_ports(struct stfcamss *stfcamss)
>>> +{
>>> +    struct device_node *node = NULL;
>>> +    int ret, num_subdevs = 0;
>>> +
>>> +    for_each_endpoint_of_node(stfcamss->dev->of_node, node) {
>>> +        struct stfcamss_async_subdev *csd;
>>> +
>>> +        if (!of_device_is_available(node))
>>> +            continue;
>>> +
>>> +        csd = v4l2_async_nf_add_fwnode_remote(&stfcamss->notifier,
>>> +                              of_fwnode_handle(node),
>>> +                              struct stfcamss_async_subdev);
>>> +        if (IS_ERR(csd)) {
>>> +            ret = PTR_ERR(csd);
>>> +            dev_err(stfcamss->dev, "failed to add async notifier\n");
>>> +            v4l2_async_nf_cleanup(&stfcamss->notifier);
>>
>> having it here, looks strange to me.
>> It is already called in the error handling path of the probe.
>>
>> Should there be a "of_node_put(node);" if we return here?
>>
> 
> We do not call a 'get' interface, is it necessary to use the 'put' interface?

for_each_endpoint_of_node() does.

See [1] for doc, and [2] for an example.

[1]: 
https://elixir.bootlin.com/linux/v6.5-rc7/source/include/linux/of_graph.h#L30

[2]: 
https://elixir.bootlin.com/linux/v6.5-rc7/source/drivers/gpu/drm/bridge/tc358767.c#L2196



Also, at least because of the recent b8ec754ae4c5 in -next, your patch 
does not compile as-is on -next.

CJ

> 
>>> +            return ret;
>>> +        }
>>> +
>>> +        ret = stfcamss_of_parse_endpoint_node(stfcamss, node, csd);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        num_subdevs++;
>>> +    }
>>> +
>>> +    return num_subdevs;
>>> +}
>>
>> ...
>>
>>> +static int stfcamss_remove(struct platform_device *pdev)
>>> +{
>>> +    struct stfcamss *stfcamss = platform_get_drvdata(pdev);
>>> +
>>> +    v4l2_device_unregister(&stfcamss->v4l2_dev);
>>> +    media_device_cleanup(&stfcamss->media_dev);
>>
>> Is a "v4l2_async_nf_cleanup(&stfcamss->notifier);" missing to match the error handling path of the probe?
>>
>>> +    pm_runtime_disable(&pdev->dev);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>
>> ...
> 

