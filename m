Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B12BE114674
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 19:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbfLESBp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 13:01:45 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53718 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729154AbfLESBp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 13:01:45 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 0AC2728A9C9
Subject: Re: [PATCH v3 RESEND] media: vimc: fla: Add virtual flash subdevice
To:     =?UTF-8?Q?Lucas_Magalh=c3=a3es?= <lucmaga@gmail.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Eduardo Barretto <edusbarretto@gmail.com>,
        lkcamp@lists.libreplanetbr.org
References: <20191203230148.2442-1-lucmaga@gmail.com>
 <dba2fa57-2101-b24a-a482-97878895fb92@collabora.com>
 <CAK0xOaELnX_axasmBaqanWfaoj+AF3kFZjLdzxjEgnHtzFkX5A@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <e0d05406-9ceb-ed7c-162d-4d98e34522a6@collabora.com>
Date:   Thu, 5 Dec 2019 19:01:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAK0xOaELnX_axasmBaqanWfaoj+AF3kFZjLdzxjEgnHtzFkX5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On 12/5/19 12:12 AM, Lucas Magalhães wrote:
> Hi Dafna,
> Thanks for the review.
> 
> On Wed, Dec 4, 2019 at 7:03 AM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>
>> Hi,
>> Thanks for the patch
>>
>> On 12/4/19 12:01 AM, Lucas A. M. Magalhães wrote:
>>> From: Lucas A. M. Magalhaes <lucmaga@gmail.com>
>>>
>>> Add a virtual subdevice to simulate the flash control API.
>>> Those are the supported controls:
>>> v4l2-ctl -d /dev/v4l-subdev6 -L
>>> Flash Controls
>>>
>>>                          led_mode 0x009c0901 (menu)   : min=0 max=2 default=1 value=1
>>>                                   0: Off
>>>                                   1: Flash
>>>                                   2: Torch
>>>                     strobe_source 0x009c0902 (menu)   : min=0 max=1 default=0 value=0
>>>                                   0: Software
>>>                                   1: External
>>>                            strobe 0x009c0903 (button) : flags=write-only, execute-on-write
>>>                       stop_strobe 0x009c0904 (button) : flags=write-only, execute-on-write
>>>                     strobe_status 0x009c0905 (bool)   : default=0 value=0 flags=read-only
>>>                    strobe_timeout 0x009c0906 (int)    : min=50 max=400 step=50 default=50 value=400
>>>              intensity_flash_mode 0x009c0907 (int)    : min=23040 max=1499600 step=11718 default=23040 value=23040
>>>              intensity_torch_mode 0x009c0908 (int)    : min=2530 max=187100 step=1460 default=2530 value=2530
>>>               intensity_indicator 0x009c0909 (int)    : min=0 max=255 step=1 default=0 value=0
>>>                            faults 0x009c090a (bitmask): max=0x00000002 default=0x00000000 value=0x00000000
>>>
>>> Co-authored-by: Eduardo Barretto <edusbarretto@gmail.com>
>>> Signed-off-by: Eduardo Barretto <edusbarretto@gmail.com>
>>> Signed-off-by: Lucas A. M. Magalhães <lucmaga@gmail.com>
>>>
>>> ---
>>> Hi,
>>>
>>> I've copied some values from another driver (lm3646) to make it more
>>> realistic, as suggested by Hans. All values except for
>>> V4L2_CID_FLASH_INDICATOR_INTENSITY, which I couldn't find any
>>> implementation.
>>>
>>> The v4l-compliance is failing. From the documentation
>>> V4L2_CID_FLASH_STROBE should just work if the
>>> V4L2_CID_FLASH_STROBE_SOURCE is "Software" and the
>>> V4L2_CID_FLASH_LED_MODE is "Flash", otherwise it should fail. With the
>>> standard values configured for the V4L2_CID_FLASH_STROBE will not fail.
>>> But during the tests v4l-compliance sets V4L2_CID_FLASH_LED_MODE to
>>> "Torch" and V4L2_CID_FLASH_STROBE_SOURCE to "External" which makes
>>> V4L2_CID_FLASH_STROBE to fail. How do I proceed? Should the
>>> v4l-compliance be changed?
>>>
>>> Changes in v3:
>>>        - Fix style errors
>>>        - Use more realistic numbers for the controllers
>>>        - Change from kthread to workqueue
>>>        - Change commit message for the new controllers values
>>>
>>> Changes in v2:
>>>        - Fix v4l2-complience errors
>>>        - Add V4L2_CID_FLASH_STROBE_STATUS behavior
>>>        - Add V4L2_CID_FLASH_STROBE restrictions
>>>        - Remove vimc_fla_g_volatile_ctrl
>>>        - Remove unnecessarie V4L2_CID_FLASH_CLASS
>>>        - Change varables names
>>>
>>>    drivers/media/platform/vimc/Makefile      |   2 +-
>>>    drivers/media/platform/vimc/vimc-common.c |   2 +
>>>    drivers/media/platform/vimc/vimc-common.h |   4 +
>>>    drivers/media/platform/vimc/vimc-core.c   |   5 +
>>>    drivers/media/platform/vimc/vimc-flash.c  | 248 ++++++++++++++++++++++
>>>    5 files changed, 260 insertions(+), 1 deletion(-)
>>>    create mode 100644 drivers/media/platform/vimc/vimc-flash.c
>>>
>>> diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/platform/vimc/Makefile
>>> index a53b2b532e9f..e759bbb04b14 100644
>>> --- a/drivers/media/platform/vimc/Makefile
>>> +++ b/drivers/media/platform/vimc/Makefile
>>> @@ -1,6 +1,6 @@
>>>    # SPDX-License-Identifier: GPL-2.0
>>>    vimc-y := vimc-core.o vimc-common.o vimc-streamer.o vimc-capture.o \
>>> -             vimc-debayer.o vimc-scaler.o vimc-sensor.o
>>> +             vimc-debayer.o vimc-scaler.o vimc-sensor.o vimc-flash.o
>>>
>>>    obj-$(CONFIG_VIDEO_VIMC) += vimc.o
>>>
>>> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
>>> index a3120f4f7a90..cb786de75573 100644
>>> --- a/drivers/media/platform/vimc/vimc-common.c
>>> +++ b/drivers/media/platform/vimc/vimc-common.c
>>> @@ -203,6 +203,8 @@ struct media_pad *vimc_pads_init(u16 num_pads, const unsigned long *pads_flag)
>>>        struct media_pad *pads;
>>>        unsigned int i;
>>>
>>> +     if (!num_pads)
>>> +             return NULL;
>> Please rebase on top of latest master,
>> this function was removed in patch 'media: vimc: embed the pads of entities in the entities' structs'
>>
> Ok.
> 
>>>        /* Allocate memory for the pads */
>>>        pads = kcalloc(num_pads, sizeof(*pads), GFP_KERNEL);
>>>        if (!pads)
>>> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
>>> index 698db7c07645..19815f0f4d40 100644
>>> --- a/drivers/media/platform/vimc/vimc-common.h
>>> +++ b/drivers/media/platform/vimc/vimc-common.h
>>> @@ -169,6 +169,10 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>>>                                     const char *vcfg_name);
>>>    void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
>>>
>>> +struct vimc_ent_device *vimc_fla_add(struct vimc_device *vimc,
>>> +                                  const char *vcfg_name);
>> This should be lined with the opening '('
>>
> That's strange. I'm sure it's not like this here. Maybe my smtp is alterating
> my code for some reason. I will look this.
Hi, apparently it is my email client that does not show the alignment correctly
sorry for the false comment

> 
>>> +void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
>>> +
>>>    /**
>>>     * vimc_pads_init - initialize pads
>>>     *
>>> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
>>> index 6e3e5c91ae39..5f6c750d3d8d 100644
>>> --- a/drivers/media/platform/vimc/vimc-core.c
>>> +++ b/drivers/media/platform/vimc/vimc-core.c
>>> @@ -91,6 +91,11 @@ static struct vimc_ent_config ent_config[] = {
>>>                .add = vimc_cap_add,
>>>                .rm = vimc_cap_rm,
>>>        },
>>> +     {
>>> +             .name = "Flash Controller",
>>> +             .add = vimc_fla_add,
>>> +             .rm = vimc_fla_rm,
>>> +     }
>>>    };
>>>
>>>    static const struct vimc_ent_link ent_links[] = {
>>> diff --git a/drivers/media/platform/vimc/vimc-flash.c b/drivers/media/platform/vimc/vimc-flash.c
>>> new file mode 100644
>>> index 000000000000..3918beecec57
>>> --- /dev/null
>>> +++ b/drivers/media/platform/vimc/vimc-flash.c
>>> @@ -0,0 +1,248 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * vimc-flash.c Virtual Media Controller Driver
>>> + *
>>> + * Copyright (C) 2019
>>> + * Contributors: Lucas A. M. Magalhães <lamm@lucmaga.dev>
>>> + *               Eduardo Barretto <edusbarretto@gmail.com>
>>> + *
>>> + */
>>> +
>>> +#include <linux/delay.h>
>>> +#include <linux/workqueue.h>
>>> +#include <linux/sched.h>
>>> +#include <linux/vmalloc.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-event.h>
>>> +#include <media/v4l2-subdev.h>
>>> +
>>> +#include "vimc-common.h"
>>> +
>>> +/*
>>> + * Flash timeout in ms
>>> + */
>>> +#define VIMC_FLASH_TIMEOUT_MS_MIN 50
>>> +#define VIMC_FLASH_TIMEOUT_MS_MAX 400
>>> +#define VIMC_FLASH_TIMEOUT_MS_STEP 50
>>> +
>>> +/*
>>> + * Torch intencity in uA
>>> + */
>>> +#define VIMC_FLASH_TORCH_UA_MIN 2530
>>> +#define VIMC_FLASH_TORCH_UA_MAX 187100
>>> +#define VIMC_FLASH_TORCH_UA_STEP 1460
>>> +
>>> +/*
>>> + * Flash intencity in uA
>>> + */
>>> +#define VIMC_FLASH_FLASH_UA_MIN 23040
>>> +#define VIMC_FLASH_FLASH_UA_MAX 1499600
>>> +#define VIMC_FLASH_FLASH_UA_STEP 11718
>>> +
>>> +struct vimc_fla_device {
>>> +     struct vimc_ent_device ved;
>>> +     struct v4l2_subdev sd;
>>> +     struct v4l2_ctrl_handler hdl;
>>> +     int strobe_source;
>>> +     bool is_strobe;
>>> +     int led_mode;
>>> +     int indicator_intensity;
>>> +     int torch_intensity;
>>> +     int flash_intensity;
>>> +     u64 timeout;
>>> +     u64 last_strobe;
>>> +     struct workqueue_struct *wq;
>>> +     struct work_struct work;
>>> +     struct v4l2_ctrl *strobe_status_ctl;
>>> +};
>>> +
>>> +static void vimc_fla_strobe_work(struct work_struct *work)
>>> +{
>>> +     struct vimc_fla_device *vfla =
>>> +             container_of(work, struct vimc_fla_device, work);
>>> +     v4l2_ctrl_s_ctrl(vfla->strobe_status_ctl, true);
>>> +     vfla->last_strobe = ktime_get_ns();
>>> +     while (vfla->is_strobe &&
>>> +            vfla->last_strobe + vfla->timeout > ktime_get_ns()) {
>>> +             msleep_interruptible(VIMC_FLASH_TIMEOUT_MS_STEP);
>>> +     }
>>> +     v4l2_ctrl_s_ctrl(vfla->strobe_status_ctl, false);
>>> +}
>>> +
>>> +static int vimc_fla_s_ctrl(struct v4l2_ctrl *c)
>>> +{
>>> +     struct vimc_fla_device *vfla =
>>> +             container_of(c->handler, struct vimc_fla_device, hdl);
>>> +
>>> +     switch (c->id) {
>>> +     case V4L2_CID_FLASH_LED_MODE:
>>> +             vfla->led_mode = c->val;
>>> +             return 0;
>>> +     case V4L2_CID_FLASH_STROBE_SOURCE:
>>> +             vfla->strobe_source = c->val;
>>> +             return 0;
>>> +     case V4L2_CID_FLASH_STROBE:
>>> +             if (vfla->led_mode != V4L2_FLASH_LED_MODE_FLASH ||
>>> +                 vfla->strobe_source != V4L2_FLASH_STROBE_SOURCE_SOFTWARE){
>> you can add error/warning debug here,
>> if you choose not to, then the parentheses are redundant.
>> Additionally, the opening '{' should come after a space
>> You can run srctipts/checkpatch.pl before submitting to catch such issues
>>
>>> +                     return -EINVAL;
>>> +             }
>>> +             queue_work(vfla->wq, &vfla->work);
>>> +             return 0;
>>> +     case V4L2_CID_FLASH_STROBE_STATUS:
>>> +             vfla->is_strobe = c->val;
>>> +             return 0;
>>> +     case V4L2_CID_FLASH_STROBE_STOP:
>>> +             vfla->is_strobe = false;
>>> +             return 0;
>>> +     case V4L2_CID_FLASH_TIMEOUT:
>>> +             vfla->timeout = c->val * 1000000; /* MS to NS */
>>> +             return 0;
>>> +     case V4L2_CID_FLASH_INTENSITY:
>>> +             vfla->flash_intensity = c->val;
>>> +             return 0;
>>> +     case V4L2_CID_FLASH_TORCH_INTENSITY:
>>> +             vfla->torch_intensity = c->val;
>>> +             return 0;
>>> +     case V4L2_CID_FLASH_INDICATOR_INTENSITY:
>>> +             vfla->indicator_intensity = c->val;
>>> +             return 0;
>>> +     default:
>>> +             return -EINVAL;
>>> +     }
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct v4l2_ctrl_ops vimc_fla_ctrl_ops = {
>>> +     .s_ctrl = vimc_fla_s_ctrl,
>>> +};
>>> +
>>> +static const struct v4l2_subdev_core_ops vimc_fla_core_ops = {
>>> +     .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>>> +     .unsubscribe_event = v4l2_event_subdev_unsubscribe,
>>> +};
>>> +
>>> +static const struct v4l2_subdev_ops vimc_fla_ops = {
>>> +     .core = &vimc_fla_core_ops,
>>> +};
>>> +
>>> +static void vimc_fla_release(struct v4l2_subdev *sd)
>>> +{
>>> +     struct vimc_fla_device *vfla =
>>> +                             container_of(sd, struct vimc_fla_device, sd);
>> one tab is enough
>>> +
>>> +     v4l2_ctrl_handler_free(&vfla->hdl);
>>> +     kfree(vfla);
>>> +}
>>> +
>>> +static const struct v4l2_subdev_internal_ops vimc_fla_int_ops = {
>>> +     .release = vimc_fla_release,
>>> +};
>>> +
>>> +/* initialize device */
>>> +struct vimc_ent_device *vimc_fla_add(struct vimc_device *vimc,
>>> +                                  const char *vcfg_name)
>>> +{
>>> +     struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
>>> +     struct vimc_fla_device *vfla;
>>> +     int ret;
>>> +
>>> +     /* Allocate the vfla struct */
>>> +     vfla = kzalloc(sizeof(*vfla), GFP_KERNEL);
>>> +     if (!vfla)
>>> +             return NULL;
>> I think it is better to change the return values of the .add calbbacks
>> to return ERR_PTR upon error and not just NULL so that different types of
>> errors can be distinguished.
>> (This is not related specifically to this patch),
>> If you want you can send a patch fixing that.
>>
> 
> Sure. I will change it.
cool, thanks
> 
>>> +
>>> +     v4l2_ctrl_handler_init(&vfla->hdl, 4);
>>> +     v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                            V4L2_CID_FLASH_LED_MODE,
>>> +                            V4L2_FLASH_LED_MODE_TORCH, ~0x7,
>>> +                            V4L2_FLASH_LED_MODE_FLASH);
>>> +     v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                            V4L2_CID_FLASH_STROBE_SOURCE, 0x1, ~0x3,
>>> +                            V4L2_FLASH_STROBE_SOURCE_SOFTWARE);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_STROBE, 0, 0, 0, 0);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_STROBE_STOP, 0, 0, 0, 0);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_TIMEOUT, VIMC_FLASH_TIMEOUT_MS_MIN,
>>> +                       VIMC_FLASH_TIMEOUT_MS_MAX,
>>> +                       VIMC_FLASH_TIMEOUT_MS_STEP,
>>> +                       VIMC_FLASH_TIMEOUT_MS_MIN);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_TORCH_INTENSITY,
>>> +                       VIMC_FLASH_TORCH_UA_MIN,
>>> +                       VIMC_FLASH_TORCH_UA_MAX,
>>> +                       VIMC_FLASH_TORCH_UA_STEP,
>>> +                       VIMC_FLASH_TORCH_UA_MIN);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_INTENSITY,
>>> +                       VIMC_FLASH_FLASH_UA_MIN,
>>> +                       VIMC_FLASH_FLASH_UA_MAX,
>>> +                       VIMC_FLASH_FLASH_UA_STEP,
>>> +                       VIMC_FLASH_FLASH_UA_MIN);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_INDICATOR_INTENSITY,
>>> +                       0,
>>> +                       255,
>>> +                       1,
>>> +                       0);
>> why not having one line with "0,255,1,0);" ?
>>
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_STROBE_STATUS, 0, 1, 1, 0);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_FAULT, 0,
>>> +                       V4L2_FLASH_FAULT_TIMEOUT, 0, 0);
>>> +     vfla->sd.ctrl_handler = &vfla->hdl;
>>> +     if (vfla->hdl.error) {
>>> +             ret = vfla->hdl.error;
>>> +             goto err_free_vfla;
>>> +     }
>>> +     vfla->strobe_status_ctl = v4l2_ctrl_find(&vfla->hdl,
>>> +                                              V4L2_CID_FLASH_STROBE_STATUS);
>>> +
>>> +     /* Initialize ved and sd */
>>> +     ret = vimc_ent_sd_register(&vfla->ved, &vfla->sd, v4l2_dev,
>>> +                                vcfg_name,
>>> +                                MEDIA_ENT_F_FLASH, 0, NULL,
>>> +                                &vimc_fla_int_ops, &vimc_fla_ops);
>>> +     if (ret)
>>> +             goto err_free_hdl;
>>> +
>>> +     /* Create processing workqueue */
>>> +     vfla->wq = alloc_workqueue("%s", 0, 0, "vimc-flash thread");
>>> +     if (!vfla->wq)
>>> +             goto err_unregister;
>>> +
>>> +     INIT_WORK(&vfla->work, vimc_fla_strobe_work);
>>> +     /* Initialize standard values */
>>> +     vfla->indicator_intensity = 0;
>>> +     vfla->torch_intensity = 0;
>>> +     vfla->flash_intensity = 0;
>>> +     vfla->is_strobe = false;
>>> +     vfla->timeout = 0;
>>> +     vfla->last_strobe = 0;
>>> +     vfla->strobe_source = V4L2_FLASH_STROBE_SOURCE_SOFTWARE;
>>> +     vfla->led_mode = V4L2_FLASH_LED_MODE_FLASH;
>>> +
>>> +     return &vfla->ved;
>>> +
>>> +err_unregister:
>>> +     vimc_ent_sd_unregister(&vfla->ved, &vfla->sd);
>>> +err_free_hdl:
>>> +     v4l2_ctrl_handler_free(&vfla->hdl);
>>> +err_free_vfla:
>>> +     kfree(vfla);
>>> +
>>> +     return NULL;
>>> +}
>>> +
>>> +void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
>>> +{
>>> +     struct vimc_fla_device *vfla;
>>> +
>>> +     if (!ved)
>>> +             return;
>>> +
>>> +     vfla = container_of(ved, struct vimc_fla_device, ved);
>>> +     destroy_workqueue(vfla->wq);
>>> +     vimc_ent_sd_unregister(ved, &vfla->sd);
>>> +}
>>>
>> Not sure but I think there are indentation issues in this patch, a tab should be 8 spaces
> 
> This is strange. I already had style issues on the v2 so I runned the
> checkpatch.pl on the
> patch before sent and it didn't point this identation issues.
> 
> Here is the checkpatch.pl output. It could be the case that my smtp is
> alterating the
> it before transmission.
Sorry, as I wrote, this is my thunderbird client

Dafna

> 
> $ scripts/checkpatch.pl
> patchset/0001-media-vimc-fla-Add-virtual-flash-subdevice.patch
> WARNING: Possible unwrapped commit description (prefer a maximum 75
> chars per line)
> #14:
>                         led_mode 0x009c0901 (menu)   : min=0 max=2
> default=1 value=1
> 
> WARNING: Non-standard signature: Co-authored-by:
> #30:
> Co-authored-by: Eduardo Barretto <edusbarretto@gmail.com>
> 
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #131:
> new file mode 100644
> 
> total: 0 errors, 3 warnings, 284 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>        mechanically convert to the typical style using --fix or --fix-inplace.
> 
> patchset/0001-media-vimc-fla-Add-virtual-flash-subdevice.patch has
> style problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>        them to the maintainer, see CHECKPATCH in MAINTAINERS.
> 
> 
> Thanks,
> Lucas
> 
