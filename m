Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70331188CE5
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 19:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgCQSMi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 14:12:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35378 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgCQSMi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 14:12:38 -0400
Received: from [IPv6:2a02:810a:113f:ad1c:f038:27d4:2beb:6e6b] (unknown [IPv6:2a02:810a:113f:ad1c:f038:27d4:2beb:6e6b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F3673294811;
        Tue, 17 Mar 2020 18:12:35 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] media: staging: rkisp1: replace the call to
 v4l2_async_notifier_parse_fwnode_endpoints_by_port
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
References: <20200312154604.24996-1-dafna.hirschfeld@collabora.com>
 <20200312154604.24996-3-dafna.hirschfeld@collabora.com>
 <89b1c5e1-4659-b489-25d1-a8278949c048@collabora.com>
 <20200317132038.GD13878@kekkonen.localdomain>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <e1163758-94a7-1b31-8e1b-619944d2aac5@collabora.com>
Date:   Tue, 17 Mar 2020 19:12:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317132038.GD13878@kekkonen.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 17.03.20 14:20, Sakari Ailus wrote:
> Hi Dafna,
> 
> On Tue, Mar 17, 2020 at 10:12:22AM -0300, Helen Koike wrote:
>> Hi Dafna,
>>
>> On 3/12/20 12:46 PM, Dafna Hirschfeld wrote:
>>> don't call 'v4l2_async_notifier_parse_fwnode_endpoints_by_port'
>>> in order to register async subdevices. Instead call
>>> 'v4l2_fwnode_endpoint_parse' to parse the remote endpoints
>>> and then register each async subdev with
>>> 'v4l2_async_notifier_add_fwnode_remote_subdev'
>>>
>>> Also remove the relevant item in the TODO file
>>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> ---
>>
>> It would be nice to have a changelog here as well.
>>
>>>   drivers/staging/media/rkisp1/TODO         |  3 -
>>>   drivers/staging/media/rkisp1/rkisp1-dev.c | 94 +++++++++++++----------
>>>   2 files changed, 55 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
>>> index 0aa9877dd64a..1aa3bb9fd6cb 100644
>>> --- a/drivers/staging/media/rkisp1/TODO
>>> +++ b/drivers/staging/media/rkisp1/TODO
>>> @@ -1,6 +1,3 @@
>>> -* Don't use v4l2_async_notifier_parse_fwnode_endpoints_by_port().
>>> -e.g. isp_parse_of_endpoints in drivers/media/platform/omap3isp/isp.c
>>> -cio2_parse_firmware in drivers/media/pci/intel/ipu3/ipu3-cio2.c.
>>>   * Fix pad format size for statistics and parameters entities.
>>>   * Use threaded interrupt for rkisp1_stats_isr(), remove work queue.
>>>   * Fix checkpatch errors.
>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
>>> index d2186856bb24..1035a39f3e49 100644
>>> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
>>> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
>>> @@ -233,35 +233,6 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
>>>   	return 0;
>>>   }
>>>   
>>> -static int rkisp1_fwnode_parse(struct device *dev,
>>> -			       struct v4l2_fwnode_endpoint *vep,
>>> -			       struct v4l2_async_subdev *asd)
>>> -{
>>> -	struct rkisp1_sensor_async *s_asd =
>>> -			container_of(asd, struct rkisp1_sensor_async, asd);
>>> -
>>> -	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
>>> -		dev_err(dev, "Only CSI2 bus type is currently supported\n");
>>> -		return -EINVAL;
>>> -	}
>>> -
>>> -	if (vep->base.port != 0) {
>>> -		dev_err(dev, "The ISP has only port 0\n");
>>> -		return -EINVAL;
>>> -	}
>>> -
>>> -	s_asd->mbus_type = vep->bus_type;
>>> -	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
>>> -
>>> -	/* Parallel bus is currently not supported */
>>> -	s_asd->parallel_bus_flags = 0;
>>> -
>>> -	if (s_asd->lanes < 1 || s_asd->lanes > 4)
>>> -		return -EINVAL;
>>> -
>>> -	return 0;
>>> -}
>>> -
>>>   static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops = {
>>>   	.bound = rkisp1_subdev_notifier_bound,
>>>   	.unbind = rkisp1_subdev_notifier_unbind,
>>> @@ -271,23 +242,68 @@ static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops =
>>>   static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
>>>   {
>>>   	struct v4l2_async_notifier *ntf = &rkisp1->notifier;
>>> -	struct device *dev = rkisp1->dev;
>>> +	int next_id = 0;
>>
>> This is endpoint id right?
>> Maybe just change it to unsigned.
>>
>> The scope says it should be u32:
>>
>> struct fwnode_handle *
>> fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
>> 				u32 port, u32 endpoint, unsigned long flags)
>>
>>
>>>   	int ret;
>>>   
>>>   	v4l2_async_notifier_init(ntf);
>>>   
>>> -	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(dev, ntf,
>>> -					sizeof(struct rkisp1_sensor_async),
>>> -					0, rkisp1_fwnode_parse);
>>> -	if (ret)
>>> -		return ret;
>>> +	while (1) {
>>> +		struct v4l2_fwnode_endpoint vep = {
>>> +			.bus_type = V4L2_MBUS_CSI2_DPHY
>>> +		};
>>> +		struct rkisp1_sensor_async *rk_asd = NULL;
>>> +		struct fwnode_handle *ep;
>>>   
>>> -	if (list_empty(&ntf->asd_list))
>>> -		return -ENODEV;
>>> +		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
>>> +			0, next_id, FWNODE_GRAPH_ENDPOINT_NEXT);
>>>   
>>
>> Please, remove this new line, so the error check is near the function which generated it.
>>
>>> -	ntf->ops = &rkisp1_subdev_notifier_ops;
>>> +		if (!ep)
>>> +			break;
>>> +
>>> +		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>>> +		if (ret)
>>> +			goto err_parse;
>>> +
>>> +		rk_asd = kzalloc(sizeof(*rk_asd), GFP_KERNEL);
>>> +		if (!rk_asd) {
>>> +			ret = -ENOMEM;
>>> +			goto err_parse;
>>> +		}
>>> +
>>> +		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
>>> +		rk_asd->mbus_type = vep.bus_type;
>>> +
>>> +		/* Parallel bus is currently not supported */
>>> +		rk_asd->parallel_bus_flags = 0;
>>
>> Please see my comment in previous patch of this series.
>>
>>> +		ret = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
>>> +								   &rk_asd->asd);
>>> +		if (ret)
>>> +			goto err_parse;
>>> +
>>> +		dev_dbg(rkisp1->dev, "registered ep id %d with %d lanes\n",
>>> +			vep.base.id, rk_asd->lanes);
>>> +
>>> +		next_id = vep.base.id + 1;
>>> +
>>> +		fwnode_handle_put(ep);
>>>   
>>> -	return v4l2_async_notifier_register(&rkisp1->v4l2_dev, ntf);
>>> +		continue;
>>> +err_parse:
>>> +		fwnode_handle_put(ep);
>>> +		kfree(rk_asd);
>>> +		v4l2_async_notifier_cleanup(ntf);
>>> +		return ret;
>>
>> Question:
>>
>> If parsing one endpoint fails, should you:
>>
>> 1) Parse all the other endpoints and ignore the one which fails?
>> 2) Cleanup and free all the other endpoints?
>>
>> In any case, this code is just stopping in the first one that fails and not
>> cleaning up the previous one, so it is not doing any of the previous
>> behaviors.
>>
>> I see that ipu3-cio2.c does the same. Sakari, could you comment on this?
> 
> v4l2_async_notifier_cleanup() releases the memory allocated above so this
> is fine as far as I see.
> 
> Alternatively the bad ones could be just ignored (and complained about),
> but doing something drastic about such bugs usually gets the deserved
> attention.
>

Hi,
thank you both for reviewing, just sent v3 sticking to the drastic approach,
Dafna
  
