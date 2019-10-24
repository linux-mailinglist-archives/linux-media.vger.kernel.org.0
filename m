Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBB7EE2D46
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 11:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391251AbfJXJ1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 05:27:45 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:60383 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390225AbfJXJ1p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 05:27:45 -0400
Received: from [IPv6:2001:420:44c1:2577:2596:d813:5034:deee]
 ([IPv6:2001:420:44c1:2577:2596:d813:5034:deee])
        by smtp-cloud8.xs4all.net with ESMTPA
        id NZP8iqyAkfrRWNZPCiTnOA; Thu, 24 Oct 2019 11:27:42 +0200
Subject: Re: [PATCH v3 2/2] media: vimc: upon streaming, check that the
 pipeline starts with a source entity
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        andre.almeida@collabora.com, skhan@linuxfoundation.org,
        kernel@collabora.com, dafna3@gmail.com
References: <20191009155315.14280-1-dafna.hirschfeld@collabora.com>
 <20191009155315.14280-3-dafna.hirschfeld@collabora.com>
 <f2e70e0f-fc1a-714b-b32b-2352af3b089d@xs4all.nl>
 <f9b464d7-0fc0-ab0b-cb5d-1ef150162c5b@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <edce67bc-e8d8-f8a3-1d45-01775bbf546f@xs4all.nl>
Date:   Thu, 24 Oct 2019 11:27:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f9b464d7-0fc0-ab0b-cb5d-1ef150162c5b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIxP5tF/kN5NoI1ghZ1RMWYZGh9rcxBz90EpNY7TT0wKUUfxpnVCgJ4ifCs8qtoFuuvk2I7r0gn1bwqNGpejDLtHrR+puiHMD+SNd76GEV2OTRAbinps
 s2NZfWFcJn73h0jj8mp5EeE/VwJCk9iXl7+cxjGrwGc6l6y8XoK6mpUmey3JuPyZuWLG7ZIHEzETxj22M3x8KkAYHoQlW0RVXNsP2Z/YHKgqMKRyfqtXHuyz
 NvFFb+nzKjnUz+2upG9tjenSGRF7VeSsHzusH3B/HrVe1iZYU7AbuNrVN8tt2lrPXD3STet1RcWBrQYXct959o7LTIODPcO09iJaVhTMW9ZzJWdWuo9zMe8M
 Kuk0u7WhBz5elZwsXnIqmY+PtdE6IHQnYciXHtMpeR3H+YXxFVkEbNeT2lYiSLBkUjSMHk6zYKxBYxBXTKb/hlXUOfhN8cInSlKGmH/zIEDHAjBh7Oo6Pnz0
 ObX3oTzhDU33O84N4iGhxK0aS7vZVWIee3lmTxRjm9OWnwQHofJ8jrt6w4zxcFFJ6G7XtDa3GHB1moX2
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/24/19 10:36 AM, Dafna Hirschfeld wrote:
> 
> 
> On 10/23/19 9:26 AM, Hans Verkuil wrote:
>> On 10/9/19 5:53 PM, Dafna Hirschfeld wrote:
>>> Userspace can disable links and create pipelines that
>>> do not start with a source entity. Trying to stream
>>> from such a pipeline should fail with -EPIPE
>>> currently this is not handled and cause kernel crash.
>>>
>>> Reproducing the crash:
>>> media-ctl -d0 -l "5:1->21:0[0]" -v
>>> v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
>>> v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2
>>>
>>> Panic message:
>>> [   39.078841][  T248] BUG: kernel NULL pointer dereference, address: 0000000000000000
>>> [   39.079338][  T248] #PF: supervisor read access in kernel mode
>>> [   39.079704][  T248] #PF: error_code(0x0000) - not-present page
>>> [   39.080071][  T248] PGD 0 P4D 0
>>> [   39.080279][  T248] Oops: 0000 [#1] SMP PTI
>>> [   39.080546][  T248] CPU: 0 PID: 248 Comm: vimc-streamer t Not tainted 5.4.0-rc1+ #17
>>> [   39.081030][  T248] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.0-0-ga698c8995f-prebuilt.qemu.org 04/01/2014
>>> [   39.081779][  T248] RIP: 0010:vimc_sca_process_frame+0xdb/0x210 [vimc]
>>> [   39.082191][  T248] Code: 44 8d 0c 28 8b 93 a4 01 00 00 48 8b 8b 98 01 00 00 85 d2 74 40 48 8b 74 24 10 8d 7a ff 4c 01 c9 31 d2 4c 01 fe eb 03 4c 89 c2 <44> 0f b6 04 16 44 88 04 11 4c 8d 42 01 48 39 fa 75 eb 8b 93 a4 01
>>> [   39.083436][  T248] RSP: 0018:ffffb15a005abe90 EFLAGS: 00010246
>>> [   39.083808][  T248] RAX: 0000000000000000 RBX: ffffa3fdc46d2e00 RCX: ffffb15a02579000
>>> [   39.084298][  T248] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000002
>>> [   39.084792][  T248] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>>> [   39.085280][  T248] R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
>>> [   39.085770][  T248] R13: ffffa3fdc46d2ee0 R14: 0000000000000000 R15: 0000000000000000
>>> [   39.086258][  T248] FS:  0000000000000000(0000) GS:ffffa3fdc7800000(0000) knlGS:0000000000000000
>>> [   39.086806][  T248] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   39.087217][  T248] CR2: 0000000000000000 CR3: 0000000003c92005 CR4: 0000000000360ef0
>>> [   39.087706][  T248] Call Trace:
>>> [   39.087909][  T248]  ? vimc_streamer_pipeline_terminate+0x90/0x90 [vimc]
>>> [   39.088318][  T248]  vimc_streamer_thread+0x7c/0xe0 [vimc]
>>> [   39.088663][  T248]  kthread+0x10d/0x130
>>> [   39.088919][  T248]  ? kthread_park+0x80/0x80
>>> [   39.089205][  T248]  ret_from_fork+0x35/0x40
>>> [   39.089475][  T248] Modules linked in: vimc videobuf2_vmalloc videobuf2_memops v4l2_tpg videobuf2_v4l2 videobuf2_common videodev mc
>>> [   39.090208][  T248] CR2: 0000000000000000
>>> [   39.090463][  T248] ---[ end trace 697650fefbf78bee ]---
>>> [   39.090796][  T248] RIP: 0010:vimc_sca_process_frame+0xdb/0x210 [vimc]
>>> [   39.091209][  T248] Code: 44 8d 0c 28 8b 93 a4 01 00 00 48 8b 8b 98 01 00 00 85 d2 74 40 48 8b 74 24 10 8d 7a ff 4c 01 c9 31 d2 4c 01 fe eb 03 4c 89 c2 <44> 0f b6 04 16 44 88 04 11 4c 8d 42 01 48 39 fa 75 eb 8b 93 a4 01
>>> [   39.092417][  T248] RSP: 0018:ffffb15a005abe90 EFLAGS: 00010246
>>> [   39.092789][  T248] RAX: 0000000000000000 RBX: ffffa3fdc46d2e00 RCX: ffffb15a02579000
>>> [   39.093278][  T248] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000002
>>> [   39.093766][  T248] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>>> [   39.094254][  T248] R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
>>> [   39.094742][  T248] R13: ffffa3fdc46d2ee0 R14: 0000000000000000 R15: 0000000000000000
>>> [   39.095309][  T248] FS:  0000000000000000(0000) GS:ffffa3fdc7800000(0000) knlGS:0000000000000000
>>> [   39.095974][  T248] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   39.096372][  T248] CR2: 0000000000000000 CR3: 0000000003c92005 CR4: 0000000000360ef0
>>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> ---
>>>   drivers/media/platform/vimc/vimc-common.c   | 10 ++++++++
>>>   drivers/media/platform/vimc/vimc-common.h   |  5 ++++
>>>   drivers/media/platform/vimc/vimc-streamer.c | 27 ++++++++++++---------
>>>   3 files changed, 31 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
>>> index a3120f4f7a90..e8ad3199ffbf 100644
>>> --- a/drivers/media/platform/vimc/vimc-common.c
>>> +++ b/drivers/media/platform/vimc/vimc-common.c
>>> @@ -164,6 +164,16 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>>>   	},
>>>   };
>>>   
>>> +bool vimc_is_source(struct media_entity *ent)
>>> +{
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < ent->num_pads; i++)
>>> +		if (ent->pads[i].flags & MEDIA_PAD_FL_SINK)
>>> +			return false;
>>> +	return true;
>>> +}
>>> +
>>>   const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i)
>>>   {
>>>   	if (i >= ARRAY_SIZE(vimc_pix_map_list))
>>> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
>>> index 8349e3c68a49..112574bc3089 100644
>>> --- a/drivers/media/platform/vimc/vimc-common.h
>>> +++ b/drivers/media/platform/vimc/vimc-common.h
>>> @@ -154,6 +154,11 @@ struct vimc_ent_config {
>>>   	void (*rm)(struct vimc_device *vimc, struct vimc_ent_device *ved);
>>>   };
>>>   
>>> +/**
>>> + * vimc_is_source - returns true iff the entity has only source pads
>>> + */
>>> +bool vimc_is_source(struct media_entity *ent);
>>> +
>>>   /* prototypes for vimc_ent_config add and rm hooks */
>>>   struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>>>   				     const char *vcfg_name);
>>> diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
>>> index 37150c919fcb..680614851a14 100644
>>> --- a/drivers/media/platform/vimc/vimc-streamer.c
>>> +++ b/drivers/media/platform/vimc/vimc-streamer.c
>>> @@ -82,14 +82,12 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>>>   	struct media_entity *entity;
>>>   	struct video_device *vdev;
>>>   	struct v4l2_subdev *sd;
>>> -	int ret = 0;
>>> +	int ret = -EINVAL;
>>>   
>>>   	stream->pipe_size = 0;
>>>   	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
>>> -		if (!ved) {
>>> -			vimc_streamer_pipeline_terminate(stream);
>>> -			return -EINVAL;
>>> -		}
>>> +		if (!ved)
>>> +			break;
>>
>> This doesn't work, you need to set ret to -EINVAL explicitly since ret can
>> be set elsewhere as well in the while loop, so there is no guarantee that
>> ret is -EINVAL.
>>
>>>   		stream->ved_pipeline[stream->pipe_size++] = ved;
>>>   
>>>   		if (is_media_entity_v4l2_subdev(ved->ent)) {
>>> @@ -98,15 +96,23 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>>>   			if (ret && ret != -ENOIOCTLCMD) {
>>>   				dev_err(ved->dev, "subdev_call error %s\n",
>>>   				       ved->ent->name);
>>> -				vimc_streamer_pipeline_terminate(stream);
>>> -				return ret;
>>> +				break;
>>
>> And here ret can end up being -ENOIOCTLCMD, so returning 'ret' at the end
>> may not be the value you expect.
>>
> 
> Hi,
> But the condition "if (ret && ret != -ENOIOCTLCMD)" ensures it is not 
> -ENOIOCTLCMD

But if v4l2_subdev_call DID return -ENOIOCTLCMD, then ret now has that value.
If the while now exits or ved becomes NULL, then you fall to the return ret
which now returns -ENOIOCTLCMD.

This code is messy w.r.t. the return value, it should be cleaned up a bit.

Even if the code is correct (as in that the scenario I described above cannot
actually happen in practice), it is still hard to follow.

Regards,

	Hans

> 
> Regards,
> Dafna
> 
>> Regards,
>>
>> 	Hans
>>
>>>   			}
>>>   		}
>>>   
>>>   		entity = vimc_get_source_entity(ved->ent);
>>> -		/* Check if the end of the pipeline was reached*/
>>> -		if (!entity)
>>> +		/* Check if the end of the pipeline was reached */
>>> +		if (!entity) {
>>> +			/* the first entity of the pipe should be source only */
>>> +			if (!vimc_is_source(ved->ent)) {
>>> +				dev_err(ved->dev,
>>> +					"first entity in the pipe '%s' is not a source\n",
>>> +					ved->ent->name);
>>> +				ret = -EPIPE;
>>> +				break;
>>> +			}
>>>   			return 0;
>>> +		}
>>>   
>>>   		/* Get the next device in the pipeline */
>>>   		if (is_media_entity_v4l2_subdev(entity)) {
>>> @@ -119,9 +125,8 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>>>   			ved = video_get_drvdata(vdev);
>>>   		}
>>>   	}
>>> -
>>>   	vimc_streamer_pipeline_terminate(stream);
>>> -	return -EINVAL;
>>> +	return ret;
>>>   }
>>>   
>>>   /**
>>>
>>
>>

