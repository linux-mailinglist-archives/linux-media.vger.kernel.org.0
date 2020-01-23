Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 471F2146B22
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 15:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgAWOWO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 09:22:14 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47305 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726729AbgAWOWO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 09:22:14 -0500
Received: from [IPv6:2001:983:e9a7:1:1bd:458:b834:7f13]
 ([IPv6:2001:983:e9a7:1:1bd:458:b834:7f13])
        by smtp-cloud8.xs4all.net with ESMTPA
        id udN4iMr00pLtbudN5iQtxj; Thu, 23 Jan 2020 15:22:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579789331; bh=VYSlYdAy/dPnIS/yHwgdT8WI6wvXxd0gOJF0zd9pmrw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=W4EtHqLfbQHwAz9c6pkHqXFNC2pP88krF48PksJ7rFMEYsfWKA9nWSJdnSQbzoGPp
         T7RGLvPhcAL5HbaUFzoct+EDjNi34WymMBXcm/jOz0QS1buX30KV2ywkY06kwzyKGi
         SGoMTXj7cRe9g7F8OwQQhx281wMj4Y+Op9K/os6UeS4xiOhEDOQ3ugvKhOYLaELuJG
         vPxbuWcI2jS1HFWse22bWa8xJc2PFxTT2ru4Lam/ytF0HCmjA3Yt1551szHF+XPU6f
         8s+Xf9u1W+FblCIEqnOhYQEbg6EfhpAkwX8NzAtfU9u9xZEKUaXBvo6dbVjmhPatHZ
         a/+XNatvrbMSQ==
Subject: Re: [PATCH v4 4/6] media: vimc: capture: crash fix - synchronize call
 to vb2_queue_release when unregistering
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        skhan@linuxfoundation.org, kernel@collabora.com, dafna3@gmail.com
References: <20200113215506.13329-1-dafna.hirschfeld@collabora.com>
 <20200113215506.13329-5-dafna.hirschfeld@collabora.com>
 <9355c7cf-74e2-47a4-f5a1-0eb47134b0d6@xs4all.nl>
 <26a37623-9da9-8723-f29e-6471b5bbf9c4@collabora.com>
 <a574f05f-6937-b64c-1812-f291d8eef542@xs4all.nl>
 <93655fd0-b442-c253-05fb-920e4bdf4bcf@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ec825e17-f034-0192-f750-4125bb773326@xs4all.nl>
Date:   Thu, 23 Jan 2020 15:22:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <93655fd0-b442-c253-05fb-920e4bdf4bcf@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfG0p+uDGefEnELR7YXcRX9nb056TnDvWP5QEOcpG2qpylUAZzdcYPFZllmrV13K4vZPRrWFRHd5OxuaagWgfGdy1Yc4j7t2PDzQsdcpNvKIDahki7l+h
 XYdovbfTYrfC4mKAvqtPmx/cjwkN6vLvYSI0GryRer1tTlqaZ7mnP3KchBI2iihPXdSHJzMtkBRkaez+jlbjI87Ik9BqHE55ePqRaLnE2X/Jhcc/c64gUIaf
 cASJC9QiYJFZe1/kJ13MZ5nvpKD55Q5Op+0jLbuOq/RjZOVHom4oeXv8WWepU6fHQ9o113jjFz0pPGIG4ZAgM/ghFd5ndZw99O7spXdwOfJCZm3JtSfwlVw+
 jCfnKvyiLWDPSrcd3PISVNmsfane2wvLdCz4T/TXCojUtbKRuRZVqVfbzehKPxHjeLmGzW3wQ+JogpAnxjpxo2ORYB3dTKNfn596nnFmv4SmElcGvpIlXF4D
 N64mLMotQRfGkPP+
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/23/20 2:55 PM, Dafna Hirschfeld wrote:
> 
> 
> On 14.01.20 12:50, Hans Verkuil wrote:
>> On 1/14/20 12:17 PM, Dafna Hirschfeld wrote:
>>> Hi
>>>
>>> On 14.01.20 12:25, Hans Verkuil wrote:
>>>> On 1/13/20 10:55 PM, Dafna Hirschfeld wrote:
>>>>> vb2_queue_release is called from vimc_cap_unregister.
>>>>> `vb2_queue_release` stops the streaming in case
>>>>> streaming is on and therefore it should be synchronized
>>>>> with other streaming ioctls using the vdev's lock.
>>>>> Currently the call is not synchronized and this cause
>>>>> race conditions.
>>>>>
>>>>> Using the following script:
>>>>>
>>>>> while [ 1 ]; do
>>>>> media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480],"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
>>>>>
>>>>> v4l2-ctl -d2 -v width=1920,height=1440
>>>>> v4l2-ctl -d0 -v pixelformat=BA81
>>>>> v4l2-ctl --stream-mmap -d /dev/video2 &
>>>>> echo -n vimc.0 >/sys/bus/platform/drivers/vimc/unbind
>>>>> echo -n vimc.0 >/sys/bus/platform/drivers/vimc/bind
>>>>> done
>>>>>
>>>>> The following crash appeared:
>>>>>
>>>>> [  101.909376] BUG: kernel NULL pointer dereference, address: 0000000000000009
>>>>> [  101.909661] #PF: supervisor read access in kernel mode
>>>>> [  101.909835] #PF: error_code(0x0000) - not-present page
>>>>> [  101.910048] PGD 0 P4D 0
>>>>> [  101.910223] Oops: 0000 [#1] SMP NOPTI
>>>>> [  101.910475] CPU: 0 PID: 1167 Comm: v4l2-ctl Not tainted 5.5.0-rc1+ #5
>>>>> [  101.910716] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1ubuntu1 04/01/2014
>>>>> [  101.911294] RIP: 0010:vb2_vmalloc_put_userptr+0x15/0x90 [videobuf2_vmalloc]
>>>>> [  101.911671] Code: 89 df 5b e9 0d e6 29 c6 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 90 41 55 41 54 55 48 89 fd 53 4c 8b 65 08 48 8b 3f <41> 80 7c 24 09 00 75 65 48 81 e7 00 f0 ff ff
>>>>> 45 8b 6c 24 04 75 44
>>>>> [  101.912329] RSP: 0018:ffff9b0c42253df0 EFLAGS: 00000286
>>>>> [  101.912557] RAX: ffffffffc03bc1a0 RBX: ffff9095b37e1400 RCX: 0000000000000001
>>>>> [  101.912818] RDX: 0000000000000004 RSI: 0000000000000003 RDI: ffff9b0c4229d000
>>>>> [  101.913088] RBP: ffff9095b37d1480 R08: 0000000000000000 R09: ffff9b0c42253db8
>>>>> [  101.913352] R10: ffff9095b37df858 R11: ffff9095b3444b50 R12: 0000000000000000
>>>>> [  101.913598] R13: ffff9095b371c5b8 R14: 0000000000000004 R15: 0000000000000000
>>>>> [  101.913896] FS:  00007fe62d779240(0000) GS:ffff9095bfc00000(0000) knlGS:0000000000000000
>>>>> [  101.914202] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>> [  101.914418] CR2: 0000000000000009 CR3: 0000000233392000 CR4: 00000000000006f0
>>>>> [  101.914738] Call Trace:
>>>>> [  101.915604]  __vb2_queue_free+0xf8/0x210 [videobuf2_common]
>>>>> [  101.915876]  vb2_core_queue_release+0x34/0x40 [videobuf2_common]
>>>>> [  101.916086]  _vb2_fop_release+0x7d/0x90 [videobuf2_v4l2]
>>>>> [  101.916307]  v4l2_release+0x9e/0xf0 [videodev]
>>>>> [  101.916499]  __fput+0xb6/0x250
>>>>> [  101.916688]  task_work_run+0x7e/0xa0
>>>>> [  101.916842]  exit_to_usermode_loop+0xaa/0xb0
>>>>> [  101.917018]  do_syscall_64+0x10b/0x160
>>>>> [  101.917175]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>>> [  101.917463] RIP: 0033:0x7fe62cf4c421
>>>>> [  101.917575] Code: f7 d8 64 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 8b 05 ea cf 20 00 85 c0 75 16 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 3f f3 c3 0f 1f 44 00 00
>>>>> 53 89 fb 48 83 ec 10
>>>>>
>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>> ---
>>>>>    drivers/media/platform/vimc/vimc-capture.c | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
>>>>> index c5a645f98c66..314fda6db112 100644
>>>>> --- a/drivers/media/platform/vimc/vimc-capture.c
>>>>> +++ b/drivers/media/platform/vimc/vimc-capture.c
>>>>> @@ -339,7 +339,9 @@ void vimc_cap_unregister(struct vimc_ent_device *ved)
>>>>>        struct vimc_cap_device *vcap =
>>>>>            container_of(ved, struct vimc_cap_device, ved);
>>>>>    +    mutex_lock(&vcap->lock);
>>>>>        vb2_queue_release(&vcap->queue);
>>>>> +    mutex_unlock(&vcap->lock);
>>>>
>>>> I wonder if the vb2_queue_release call is needed at all.
>>>>
>>>> What if you just delete it? When the filehandle is closed eventually, it will
>>>> call vb2_queue_release as well.
>>>
>>> Hi, I actually tried that, the problem is that then the streaming is
>>> stopped in the release of the video fh. The function
>>> vimc_cap_stop_streaming calls media_pipeline_stop(&vcap->vdev.entity);
>>> after the media entity is already unregistered and therefore
>>> `entity->graph_obj.mdev` is NULL
>>> but the function `media_pipeline_stop` tries to reference this mdev
>>> which crashes.
>>>
>>> The code in v4l2-dev.c actually solve this by calling
>>> media_device_unregister_entity in the release cb and not immediately
>>> when unregistered. The problem is that it is unregistered in
>>> `media_device_unregister`
>>
>> I really don't like all the cleanup that happens in media_device_unregister.
>> That is really stuff that should happen in the media_devnode release callback.
>>
>> This whole problem goes away if it is done like that, I believe.
>>
>> Basically when you unregister a device it should just unregister the device node,
>> mark it as unregistered and cause all file operations except release() to fail.
>>
>> The actual cleanup should be postponed until the last user closes the fh.
>>
>> It would be interesting if you can experiment with this.
> 
> This also means removing the call to `media_device_unregister_entity` in
> v4l2_device_release in v4l2-dev.c ?

Actually, I think the media topology should be updated when the device node is
unregistered: that's the moment the video node is removed in /dev and the topology
should reflect that.

> Also, according to the documentation the drivers should call `media_devnode_remove`
> but this should probably also postpone to media_devnode release right?

Same here: this should be done at unregistration time.

You don't want to update the topology only at release time since that will cause
problems in scenarios where entities are dynamically added/removed. Say that a
DMA capture entity is removed (i.e. the corresponding video device is unregistered),
then when you query the MC topology after that's done it should no longer show that
entity, even if some application still has a filehandle open on the unregistered
video device.

That's actually a nice test to check with a configfs enabled vimc.

Regards,

	Hans

> 
> Dafna
> 
>>
>> Regards,
>>
>>     Hans
>>
>>>
>>> Dafna
>>>
>>>
>>>
>>>>
>>>> If you DO need to call this function here, then you indeed need to take the mutex.
>>>> But I think it is a good idea to add a comment here as well to explain why you
>>>> need to call vb2_queue_release().
>>>>
>>>> Regards,
>>>>
>>>>     Hans
>>>>
>>>>>        video_unregister_device(&vcap->vdev);
>>>>>    }
>>>>>   
>>>>
>>

