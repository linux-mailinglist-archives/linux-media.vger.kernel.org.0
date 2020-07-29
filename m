Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8AB231D10
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 12:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgG2K6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 06:58:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37792 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgG2K6Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 06:58:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id AD512298419
Subject: Re: [PATCH v2 3/3] media: vimc: Join pipeline if one already exists
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
 <20200724120213.17119-4-kgupta@es.iitr.ac.in>
 <e70ecfa2-695f-70ca-eccc-841477700445@collabora.com>
 <20200728124828.GA8928@kaaira-HP-Pavilion-Notebook>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <e2a1ccd5-003c-1378-4e4e-ffcd7156b165@collabora.com>
Date:   Wed, 29 Jul 2020 12:58:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728124828.GA8928@kaaira-HP-Pavilion-Notebook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 28.07.20 14:48, Kaaira Gupta wrote:
> On Tue, Jul 28, 2020 at 02:24:37PM +0200, Dafna Hirschfeld wrote:
>>
>>
>> On 24.07.20 14:02, Kaaira Gupta wrote:
>>> An output which is running is already part of a pipeline and trying to
>>> start a new pipeline is not possible. This prevents two capture devices
>>> from streaming at the same time.
>>>
>>> Instead of failing to start the second capture device allow it to join
>>> the already running pipeline. This allows two (or more) capture devices
>>> to independently be started and stopped.
>>>
>>> [Kaaira: Changed the search for an existing connected sensor, to search
>>> for a non-NULL pipe instead, this helps to terminate the search at
>>> output itself instead of going till the sensor, changed variable names,
>>> commit message and conditions accordingly]
>>>
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
>>> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
>>> ---
>>>    .../media/test-drivers/vimc/vimc-capture.c    | 35 ++++++++++++++++++-
>>>    1 file changed, 34 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
>>> index c63496b17b9a..423d5e5a508d 100644
>>> --- a/drivers/media/test-drivers/vimc/vimc-capture.c
>>> +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
>>> @@ -237,16 +237,49 @@ static void vimc_cap_return_all_buffers(struct vimc_cap_device *vcap,
>>>    	spin_unlock(&vcap->qlock);
>>>    }
>>> +static struct media_entity *vimc_cap_get_output(struct vimc_cap_device *vcap)
>>> +{
>>> +	struct media_entity *entity = &vcap->vdev.entity;
>>> +	struct media_device *mdev = entity->graph_obj.mdev;
>>> +	struct media_graph graph;
>>> +
>>> +	mutex_lock(&mdev->graph_mutex);
>>> +	if (media_graph_walk_init(&graph, mdev)) {
>>> +		mutex_unlock(&mdev->graph_mutex);
>>> +		return NULL;
>>> +	}
>>> +
>>> +	media_graph_walk_start(&graph, entity);
>>> +
>>> +	while ((entity = media_graph_walk_next(&graph)))
>>> +		if (entity->pipe)
>>> +			break;
>>> +
>>> +	mutex_unlock(&mdev->graph_mutex);
>>> +
>>> +	media_graph_walk_cleanup(&graph);
>>> +
>>> +	return entity;
>>> +}
>>> +
>>>    static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
>>>    {
>>>    	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
>>>    	struct media_entity *entity = &vcap->vdev.entity;
>>> +	struct media_pipeline *pipe = NULL;
>>> +	struct media_entity *oent;
>>>    	int ret;
>>>    	vcap->sequence = 0;
>>>    	/* Start the media pipeline */
>>> -	ret = media_pipeline_start(entity, &vcap->stream.pipe);
>>> +	oent = vimc_cap_get_output(vcap);
>>> +	if (oent)
>>> +		pipe = oent->pipe;
>>> +	else
>>> +		pipe = &vcap->stream.pipe;
>>> +
>>> +	ret = media_pipeline_start(entity, pipe);
>>>    	if (ret) {
>>>    		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
>>>    		return ret;
>>>
>>
>> I think there is actually no need to iterate the graph. If the capture is already connected to another capture
>> that streams, it means that they both have the same pipe in the media core.
>> So actually the code can just be:
> 
> Hi,
> iterating the graph takes care of the case when output already exists.
> So in case where an output is needed from both Capture1 and RGB capture,
> don't they represent two different pipes?

Actually no, the function __media_pipeline_start gives the same pipe to all entities that are reachable
with an enabled link from the entity that called 'media_pipeline_start' (the direction of the link does not matter in that case).
So that means that all entities that are connected have the same pipe.

The term 'stream' is a path from the capture down to the sensor, so we can have two streams sharing the same pipe.

Thanks,
Dafna

> 
>>
>> if (vcap->ved.ent->pipe)
>> 	pipe = vcap->ved.ent->pipe;
>> else
>> 	pipe = &vcap->stream.pipe;
>>
>>
>> (and no need the function vimc_cap_get_output)
>>
>> Thanks,
>> Dafna
