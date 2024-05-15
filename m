Return-Path: <linux-media+bounces-11482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DF38C67BB
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 15:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 224601C21DB4
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 13:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751AD13EFF4;
	Wed, 15 May 2024 13:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6dAdjaGe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004A38615E;
	Wed, 15 May 2024 13:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715780966; cv=none; b=qRq92CL4M9kn6+RD28651fcsnVcYcv3EQiUykbZ9GLvhGiRS1YwKplQjbYI+SRp3agAOB6QyXeyiA6Y8lsSBZcA4DLHAd8Xf4/A1q6ZRXg0LnCq2jlAf6WZCsmkQqgll2LJRNk7mlWBVQbtWTJzHHKnC5a3ifn7OdVc4dhbLpcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715780966; c=relaxed/simple;
	bh=ma0SDy1/Ty0yp0Zp6U88INF7i/YGDyZBL7lmsJZsJOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SMFtF49h4YkC5NQkRrXK3MduANuGCm1ZFdzfZhPaRvKZSTpfYX7DOOyBGuhJKl8aZeNyi75i6QgGPB3tV1FyBemOL6h759ZeArSmMRfllFfwStJFJCcN2As3+G5bBCpOqVyvhDSQAInU0rBPbYKCWCHD4NXnZPqEMNiQyV+T/xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=6dAdjaGe; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FDVMe8005405;
	Wed, 15 May 2024 15:49:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=f/XUg0G5HNBM0Do0C8UdXuXwEzE90yrUPRuR7LaA0RY=; b=6d
	AdjaGenQxFFuJQ2zwbia4eeJdPTLGAFsblB3oPbRxwE0S3AmGW4dPC4bFnIZr61N
	7QAVFJtkXX3aAWn/cRraBPZXbbPn0p9qhzLEU2H0XLyzvtb1DVXMCYgpefBUmeUs
	ztM4pWDpXH8aZi03e2t+gI4gLJJAsxHQ0gYRa3Y+tUjjzDeMFkOuN12uZXMOFRbH
	LwGa28DN0R8KPefekMYdzRmFKPelhwnZDD4zkvdHNFdAWY2ccJYRKgBMtX/HSBIh
	8EXsprNXwfAs5vdugd4bZV+0AU62iDccByB/mt5A//YgOcFbz5Ob6ersNUujoTRf
	r6t2wX7fEaTe6FQHBasA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y4sym9atv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 15:49:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 818F440046;
	Wed, 15 May 2024 15:49:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F2992194D5;
	Wed, 15 May 2024 15:47:52 +0200 (CEST)
Received: from [10.252.29.14] (10.252.29.14) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 15 May
 2024 15:47:51 +0200
Message-ID: <ea17d93b-2493-46c4-a9ab-d95e8203a07a@foss.st.com>
Date: Wed, 15 May 2024 15:47:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 linux-next] media: i2c: st-mipid02: replace
 of_node_put() with __free
To: R Sundar <prosunofficial@gmail.com>, <sylvain.petinot@foss.st.com>,
        <mchehab@kernel.org>, <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <skhan@linuxfoundation.org>, <javier.carrasco.cruz@gmail.com>,
        Julia Lawall
	<julia.lawall@inria.fr>
References: <20240429163736.11544-1-prosunofficial@gmail.com>
 <a688b2f2-d972-450a-9bec-2b506b58a21f@foss.st.com>
 <af208bb4-f02c-4535-a39e-dcdf91522f38@gmail.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <af208bb4-f02c-4535-a39e-dcdf91522f38@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_07,2024-05-15_01,2023-05-22_02

Hi,

On 5/14/24 17:20, R Sundar wrote:
> Hi,
> 
> Thanks for the comments.
> 
> On 13/05/24 17:13, Benjamin Mugnier wrote:
>> Hi,
>>
>> I took sometime to reflect on this. Currently I favor drivers
>> consistency.
> 
> 
>> Merging this patch as is would introduce some differences between the
>> vgxy61 and other drivers that follow the 'of_node_put' flow, which I
>> think is not an improvement.
>>
> 
> I checked st-vgxy61.c file, I didn't find of_node_put().

Apologize, I meant st-mipid02.

> Any file apart from this,  you want to see those changes? If yes let me
> know, please.
> Meanwhile I am also looking into it.
> 
> This patch mainly reduce the goto error statements and increases
> readability of the code.
> 
>> Now, this patch is certainly good. Would it be possible to extend it to
>> all other drivers using the 'of_node_put' ?
>>
> yes, people are working on it to replace of_node_put() in many places.
> soon many patches can be expected to come in , for replacing of_node_put
> with auto cleanup module.
> I am also adding these changes to few other files also.

Good, I'd rather see a series with all these files then to ease the
review. But I only maintain the st-mipid02 so other people opinion may
differ.

> 
> Thanks,
> >> That would the consistency issue while improving code quality at the
>> same time.
>>
>> Thank you.
>>  >
>> On 4/29/24 18:37, R Sundar wrote:
>>> Use the new cleanup magic to replace of_node_put() with
>>> __free(device_node) marking to auto release and to simplify the error
>>> paths.
>>>
>>> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
>>> Signed-off-by: R Sundar <prosunofficial@gmail.com>
>>> ---
>>>
>>> Changes since v1 -
>>>
>>> - Added missed out __free() marking in mipid02_parse_tx_ep().
>>> - In mipid02_parse_tx_ep(), In error case, return value is always
>>> -EINVAL.  so
>>> sending the -EINVAL instead of ret variable value.
>>>
>>> Link to v1 -
>>> https://lore.kernel.org/all/20240427095643.11486-1-prosunofficial@gmail.com/#t
>>>
>>>   drivers/media/i2c/st-mipid02.c | 37 +++++++++-------------------------
>>>   1 file changed, 9 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/st-mipid02.c
>>> b/drivers/media/i2c/st-mipid02.c
>>> index f250640729ca..bd3cf94f8534 100644
>>> --- a/drivers/media/i2c/st-mipid02.c
>>> +++ b/drivers/media/i2c/st-mipid02.c
>>> @@ -715,31 +715,28 @@ static int mipid02_parse_rx_ep(struct
>>> mipid02_dev *bridge)
>>>       struct v4l2_fwnode_endpoint ep = { .bus_type =
>>> V4L2_MBUS_CSI2_DPHY };
>>>       struct i2c_client *client = bridge->i2c_client;
>>>       struct v4l2_async_connection *asd;
>>> -    struct device_node *ep_node;
>>>       int ret;
>>>         /* parse rx (endpoint 0) */
>>> -    ep_node =
>>> of_graph_get_endpoint_by_regs(bridge->i2c_client->dev.of_node,
>>> -                        0, 0);
>>> +    struct device_node *ep_node __free(device_node) =
>>> +       
>>> of_graph_get_endpoint_by_regs(bridge->i2c_client->dev.of_node, 0, 0);
>>>       if (!ep_node) {
>>>           dev_err(&client->dev, "unable to find port0 ep");
>>> -        ret = -EINVAL;
>>> -        goto error;
>>> +        return -EINVAL;
>>>       }
>>>         ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node),
>>> &ep);
>>>       if (ret) {
>>>           dev_err(&client->dev, "Could not parse v4l2 endpoint %d\n",
>>>               ret);
>>> -        goto error_of_node_put;
>>> +        return ret;
>>>       }
>>>         /* do some sanity checks */
>>>       if (ep.bus.mipi_csi2.num_data_lanes > 2) {
>>>           dev_err(&client->dev, "max supported data lanes is 2 / got
>>> %d",
>>>               ep.bus.mipi_csi2.num_data_lanes);
>>> -        ret = -EINVAL;
>>> -        goto error_of_node_put;
>>> +        return -EINVAL;
>>>       }
>>>         /* register it for later use */
>>> @@ -750,7 +747,6 @@ static int mipid02_parse_rx_ep(struct mipid02_dev
>>> *bridge)
>>>       asd = v4l2_async_nf_add_fwnode_remote(&bridge->notifier,
>>>                             of_fwnode_handle(ep_node),
>>>                             struct v4l2_async_connection);
>>> -    of_node_put(ep_node);
>>>         if (IS_ERR(asd)) {
>>>           dev_err(&client->dev, "fail to register asd to notifier %ld",
>>> @@ -764,46 +760,31 @@ static int mipid02_parse_rx_ep(struct
>>> mipid02_dev *bridge)
>>>           v4l2_async_nf_cleanup(&bridge->notifier);
>>>         return ret;
>>> -
>>> -error_of_node_put:
>>> -    of_node_put(ep_node);
>>> -error:
>>> -
>>> -    return ret;
>>>   }
>>>     static int mipid02_parse_tx_ep(struct mipid02_dev *bridge)
>>>   {
>>>       struct v4l2_fwnode_endpoint ep = { .bus_type =
>>> V4L2_MBUS_PARALLEL };
>>>       struct i2c_client *client = bridge->i2c_client;
>>> -    struct device_node *ep_node;
>>>       int ret;
>>>         /* parse tx (endpoint 2) */
>>> -    ep_node =
>>> of_graph_get_endpoint_by_regs(bridge->i2c_client->dev.of_node,
>>> -                        2, 0);
>>> +    struct device_node *ep_node __free(device_node) =
>>> +       
>>> of_graph_get_endpoint_by_regs(bridge->i2c_client->dev.of_node, 2, 0);
>>>       if (!ep_node) {
>>>           dev_err(&client->dev, "unable to find port1 ep");
>>> -        ret = -EINVAL;
>>> -        goto error;
>>> +        return -EINVAL;
>>>       }
>>>         ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node),
>>> &ep);
>>>       if (ret) {
>>>           dev_err(&client->dev, "Could not parse v4l2 endpoint\n");
>>> -        goto error_of_node_put;
>>> +        return -EINVAL;
>>>       }
>>>   -    of_node_put(ep_node);
>>>       bridge->tx = ep;
>>>         return 0;
>>> -
>>> -error_of_node_put:
>>> -    of_node_put(ep_node);
>>> -error:
>>> -
>>> -    return -EINVAL;
>>>   }
>>>     static int mipid02_probe(struct i2c_client *client)
>>
> 

-- 
Regards,

Benjamin

