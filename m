Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7FC12635C
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 14:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfLSNXX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 08:23:23 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47046 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbfLSNXX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 08:23:23 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 32F8E28B994
Subject: Re: [RFC PATCH] media: vimc: Add optimized mode
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     =?UTF-8?Q?Lucas_A=2e_M=2e_Magalh=c3=a3es?= <lucmaga@gmail.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Dafna Hirschfeld <dafna3@gmail.com>,
        helen.koike@collabora.com, lkcamp@lists.libreplanetbr.org
References: <20191203225649.2132-1-lucmaga@gmail.com>
 <a299c78d-ac09-49af-feb3-af3a7fb3b442@collabora.com>
Message-ID: <23c0fe78-26c9-7228-7d13-63d01b55087e@collabora.com>
Date:   Thu, 19 Dec 2019 14:23:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <a299c78d-ac09-49af-feb3-af3a7fb3b442@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
few more comments,

On 12/4/19 11:45 AM, Dafna Hirschfeld wrote:
> Hi,
> that's nie idea:)
> 
> On 12/3/19 11:56 PM, Lucas A. M. Magalhães wrote:
>> From: "Lucas A. M. Magalhaes" <lucmaga@gmail.com>
>>
>> Adds an optimized mode for vimc to generate the frame on the capture
>> device with the expected configuration.
>>
>> It adds new set of processor functions that propagates a struct tpg_data
>> instead of a frame. This struct is used at the end of the pipeline to
>> generate the expected frame.
>>
>> It adds the vimc-opt-mode parameter that is used to activate the change
>> previously explained.
>>
>> Signed-off-by: Lucas A. M. Magalhães <lucmaga@gmail.com>
>> ---
>>
>> Hi, I'm finally sending a patch for an optimized patch for vimc.
>>
>> Helen and Hans, please note that this is still an RFC. I would like to
>> know if this is more like what you expect for the optimized mode.
>>
>> Thanks!
>>
>>   drivers/media/platform/vimc/vimc-capture.c  | 57 ++++++++++++++++++++-
>>   drivers/media/platform/vimc/vimc-common.h   |  9 +++-
>>   drivers/media/platform/vimc/vimc-core.c     |  6 +++
>>   drivers/media/platform/vimc/vimc-debayer.c  | 27 ++++++++--
>>   drivers/media/platform/vimc/vimc-scaler.c   | 35 +++++++++++--
>>   drivers/media/platform/vimc/vimc-sensor.c   | 24 +++++++--
>>   drivers/media/platform/vimc/vimc-streamer.c |  2 +-
>>   7 files changed, 144 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
>> index 76c015898cfd..7e127cbbc806 100644
>> --- a/drivers/media/platform/vimc/vimc-capture.c
>> +++ b/drivers/media/platform/vimc/vimc-capture.c
>> @@ -8,6 +8,7 @@
>>   #include <media/v4l2-ioctl.h>
>>   #include <media/videobuf2-core.h>
>>   #include <media/videobuf2-vmalloc.h>
>> +#include <media/tpg/v4l2-tpg.h>
>>   #include "vimc-common.h"
>>   #include "vimc-streamer.h"
>> @@ -18,6 +19,7 @@ struct vimc_cap_device {
>>       struct v4l2_pix_format format;
>>       struct vb2_queue queue;
>>       struct list_head buf_list;
>> +    struct v4l2_mbus_framefmt mbus_format;
>>       /*
>>        * NOTE: in a real driver, a spin lock must be used to access the
>>        * queue because the frames are generated from a hardware interruption
>> @@ -30,6 +32,7 @@ struct vimc_cap_device {
>>       u32 sequence;
>>       struct vimc_stream stream;
>>       struct media_pad pad;
>> +    u8 *frame;
>>   };
>>   static const struct v4l2_pix_format fmt_default = {
>> @@ -344,7 +347,7 @@ void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
>>   }
>>   static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
>> -                    const void *frame)
>> +                    void *frame)
> should be alined to the beginning of the '('
> 
>>   {
>>       struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
>>                               ved);
>> @@ -382,6 +385,45 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
>>       return NULL;
>>   }
>> +static void *vimc_cap_process_tpg(struct vimc_ent_device *ved,
>> +                  void *sink_tpg)
>> +{
>> +    struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
>> +                            ved)the whole part starting with `container_of` can be in a new line
> 
>> +    struct vimc_cap_buffer *vimc_buf;
>> +    void *vbuf;
>> +
>> +    spin_lock(&vcap->qlock);
>> +
>> +    /* Get the first entry of the list */
>> +    vimc_buf = list_first_entry_or_null(&vcap->buf_list,
>> +                        typeof(*vimc_buf), list);
>> +    if (!vimc_buf) {
>> +        spin_unlock(&vcap->qlock);
>> +        return ERR_PTR(-EAGAIN);
>> +    }
>> +
>> +    /* Remove this entry from the list */
>> +    list_del(&vimc_buf->list);
>> +
>> +    spin_unlock(&vcap->qlock);
>> +
>> +    /* Fill the buffer */
>> +    vimc_buf->vb2.vb2_buf.timestamp = ktime_get_ns();
>> +    vimc_buf->vb2.sequence = vcap->sequence++;
>> +    vimc_buf->vb2.field = vcap->format.field;
>> +
>> +    vbuf = vb2_plane_vaddr(&vimc_buf->vb2.vb2_buf, 0);
>> +
>> +    tpg_fill_plane_buffer((struct tpg_data *)sink_tpg, 0, 0, vbuf);
>> +
>> +    /* Set it as ready */
>> +    vb2_set_plane_payload(&vimc_buf->vb2.vb2_buf, 0,
>> +                  vcap->format.sizeimage);
>> +    vb2_buffer_done(&vimc_buf->vb2.vb2_buf, VB2_BUF_STATE_DONE);
>> +    return NULL;
>> +}
> This function share big part of code with vimc_cap_process_frame,
> so maybe write a static function used by both of them
> 
>> +
>>   struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>>                        const char *vcfg_name)
>>   {
>> @@ -441,7 +483,18 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>>       /* Fill the vimc_ent_device struct */
>>       vcap->ved.ent = &vcap->vdev.entity;
>> -    vcap->ved.process_frame = vimc_cap_process_frame;
>> +
>> +    switch(vimc_op_mode) {
>> +        case VIMC_OP_MODE_FRAME:
>> +            vcap->ved.process_data = vimc_cap_process_frame;
>> +            break;
>> +        case VIMC_OP_MODE_OPTMIZED:
>> +            vcap->ved.process_data = vimc_cap_process_tpg;
>> +            break;
>> +        default:
>> +            vcap->ved.process_data = vimc_cap_process_frame;
>> +            break;
>> +    }
>>       vcap->ved.vdev_get_format = vimc_cap_get_format;
>>       vcap->ved.dev = &vimc->pdev.dev;
>> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
>> index 87eb8259c2a8..9b48b2f34f34 100644
>> --- a/drivers/media/platform/vimc/vimc-common.h
>> +++ b/drivers/media/platform/vimc/vimc-common.h
>> @@ -15,6 +15,11 @@
>>   #define VIMC_PDEV_NAME "vimc"
>> +#define VIMC_OP_MODE_FRAME 1
>> +#define VIMC_OP_MODE_OPTMIZED 2
>> +
>> +extern unsigned int vimc_op_mode;
>> +
>>   /* VIMC-specific controls */
>>   #define VIMC_CID_VIMC_BASE        (0x00f00000 | 0xf000)
>>   #define VIMC_CID_VIMC_CLASS        (0x00f00000 | 1)
>> @@ -97,8 +102,8 @@ struct vimc_pix_map {
>>   struct vimc_ent_device {
>>       struct device *dev;
>>       struct media_entity *ent;
>> -    void * (*process_frame)(struct vimc_ent_device *ved,
>> -                const void *frame);
>> +    void * (*process_data)(struct vimc_ent_device *ved,
>> +                   void *data);
>>       void (*vdev_get_format)(struct vimc_ent_device *ved,
>>                     struct v4l2_pix_format *fmt);
>>   };
>> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
>> index 97a272f3350a..9acf006c7b26 100644
>> --- a/drivers/media/platform/vimc/vimc-core.c
>> +++ b/drivers/media/platform/vimc/vimc-core.c
>> @@ -23,6 +23,10 @@
>>       .flags = link_flags,                    \
>>   }
>> +unsigned int vimc_op_mode = VIMC_OP_MODE_FRAME;
>> +module_param(vimc_op_mode, uint, 0000);
>> +MODULE_PARM_DESC(vimc_op_mode, " the operation mode");
>> +
> this should be documented in
> Documentation/media/v4l-drivers/vimc.rst
> similar to how sca_mult is documented
> 
>>   /* Structure which describes links between entities */
>>   struct vimc_ent_link {
>>       unsigned int src_ent;
>> @@ -275,6 +279,8 @@ static int vimc_probe(struct platform_device *pdev)
>>       media_device_init(&vimc->mdev);
>>       ret = vimc_register_devices(vimc);
>> +    dev_err(&pdev->dev, "OP MODE %d", vimc_op_mode);
>> +
> why an error debug?
> 
>>       if (ret) {
>>           media_device_cleanup(&vimc->mdev);
>>           return ret;
>> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
>> index 5d1b67d684bb..793953dd499b 100644
>> --- a/drivers/media/platform/vimc/vimc-debayer.c
>> +++ b/drivers/media/platform/vimc/vimc-debayer.c
>> @@ -12,6 +12,7 @@
>>   #include <media/v4l2-ctrls.h>
>>   #include <media/v4l2-event.h>
>>   #include <media/v4l2-subdev.h>
>> +#include <media/tpg/v4l2-tpg.h>
>>   #include "vimc-common.h"
>> @@ -455,7 +456,7 @@ static void vimc_deb_calc_rgb_sink(struct vimc_deb_device *vdeb,
>>   }
>>   static void *vimc_deb_process_frame(struct vimc_ent_device *ved,
>> -                    const void *sink_frame)
>> +                    void *sink_frame)
>>   {
>>       struct vimc_deb_device *vdeb = container_of(ved, struct vimc_deb_device,
>>                               ved);
>> @@ -494,6 +495,14 @@ static const struct v4l2_ctrl_ops vimc_deb_ctrl_ops = {
>>       .s_ctrl = vimc_deb_s_ctrl,
>>   };
>> +static void *vimc_deb_process_tpg(struct vimc_ent_device *ved,
>> +                  void *sink_tpg)
>> +{
>> +    //TODO: I dont know what to do here actually
> neither I :\
> 
>> +    ((struct tpg_data *)sink_tpg)->color_enc = TGP_COLOR_ENC_RGB;

Hi, since the debyer just convert the format of the stripes, I think all is needed is
something like:

const struct vimc_pix_map *vpix = vimc_pix_map_by_code(vdeb->src_code);
tpg_s_bytesperline(sink_tpg, 0, sink_fmt->width * vpix->bpp);
tpg_s_fourcc(sink_tpg, vpix->pixelformat);

>> +    return sink_tpg;
>> +}
>> +
>>   static void vimc_deb_release(struct v4l2_subdev *sd)
>>   {
>>       struct vimc_deb_device *vdeb =
>> @@ -568,9 +577,19 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>>       if (ret)
>>           goto err_free_hdl;
>> -    vdeb->ved.process_frame = vimc_deb_process_frame;
>> -    vdeb->ved.dev = &vimc->pdev.dev;
>> -    vdeb->mean_win_size = vimc_deb_ctrl_mean_win_size.def;
>> +    vdeb->ved.process_data = vimc_deb_process_frame;
>> +    switch(vimc_op_mode) {
>> +        case VIMC_OP_MODE_FRAME:
>> +            vdeb->ved.process_data = vimc_deb_process_frame;
>> +            break;
>> +        case VIMC_OP_MODE_OPTMIZED:
>> +            vdeb->ved.process_data = vimc_deb_process_tpg;
>> +            break;
>> +        default:
>> +            vdeb->ved.process_data = vimc_deb_process_frame;
>> +            break;
>> +    }
>> +    vdeb->dev = &vimc->pdev.dev;
>>       /* Initialize the frame format */
>>       vdeb->sink_fmt = sink_fmt_default;
>> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
>> index 2f88a7d9d67b..eed35400090d 100644
>> --- a/drivers/media/platform/vimc/vimc-scaler.c
>> +++ b/drivers/media/platform/vimc/vimc-scaler.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/vmalloc.h>
>>   #include <linux/v4l2-mediabus.h>
>>   #include <media/v4l2-subdev.h>
>> +#include <media/tpg/v4l2-tpg.h>
>>   #include "vimc-common.h"
>> @@ -317,7 +318,7 @@ static void vimc_sca_fill_src_frame(const struct vimc_sca_device *const vsca,
>>   }
>>   static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
>> -                    const void *sink_frame)
>> +                    void *sink_frame)
>>   {
>>       struct vimc_sca_device *vsca = container_of(ved, struct vimc_sca_device,
>>                               ved);
>> @@ -331,10 +332,26 @@ static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
>>       return vsca->src_frame;
>>   };
>> +static void *vimc_sca_process_tpg(struct vimc_ent_device *ved,
>> +                  void *sink_tpg)
>> +{
>> +    struct vimc_sca_device *vsca = container_of(ved, struct vimc_sca_device,
>> +                            ved);
>> +    const struct vimc_pix_map *vpix =
>> +                vimc_pix_map_by_code(vsca->sink_fmt.code);
>> +    struct tpg_data *tpg = (struct tpg_data *)sink_tpg;
>> +    tpg_reset_source(tpg, vsca->sink_fmt.width*sca_mult,
> the '*' of the multiplication should be surrounded by spaces,
> script/checkpatch.pl catches issues like that.
> 
>> +             vsca->sink_fmt.height*sca_mult, vsca->sink_fmt.field);
>> +    tpg_s_bytesperline(tpg, 0, vsca->sink_fmt.width * vpix->bpp * sca_mult);
>> +    tpg_s_buf_height(tpg, tpg->src_height * sca_mult);
>> +    tpg_s_fourcc(tpg, vpix->pixelformat);

Now the scaler has the get/set_selection API so you should probably add crop settings
like `tpg_s_crop_compose` , not sure how exactly.

>> +    return sink_tpg;
>> +}
>> +
>>   static void vimc_sca_release(struct v4l2_subdev *sd)
>>   {
>>       struct vimc_sca_device *vsca =
>> -                container_of(sd, struct vimc_sca_device, sd);
>> +                   container_of(sd, struct vimc_sca_device, sd);
> This is just identation fix? I think better not to add it since it is not related to the patch
>>       media_entity_cleanup(vsca->ved.ent);
>>       kfree(vsca);
>> @@ -378,8 +395,18 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>>           return NULL;
>>       }
>> -    vsca->ved.process_frame = vimc_sca_process_frame;
>> -    vsca->ved.dev = &vimc->pdev.dev;
>> +    switch(vimc_op_mode) {
>> +        case VIMC_OP_MODE_FRAME:
>> +            vsca->ved.process_data = vimc_sca_process_frame;
>> +            break;
>> +        case VIMC_OP_MODE_OPTMIZED:
>> +            vsca->ved.process_data = vimc_sca_process_tpg;
>> +            break;
>> +        default:
>> +            vsca->ved.process_data = vimc_sca_process_frame;
>> +            break;
>> +    }
>> +    vsca->dev = &vimc->pdev.dev;
>>       /* Initialize the frame format */
>>       vsca->sink_fmt = sink_fmt_default;
>> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
>> index 32380f504591..0305e2c693c6 100644
>> --- a/drivers/media/platform/vimc/vimc-sensor.c
>> +++ b/drivers/media/platform/vimc/vimc-sensor.c
>> @@ -183,7 +183,7 @@ static const struct v4l2_subdev_pad_ops vimc_sen_pad_ops = {
>>   };
>>   static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
>> -                    const void *sink_frame)
>> +                    void *sink_frame)
>>   {
>>       struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
>>                               ved);
>> @@ -192,6 +192,14 @@ static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
>>       return vsen->frame;
>>   }
>> +static void *vimc_sen_process_tpg(struct vimc_ent_device *ved,
>> +                  void *sink_tpg)
>> +{
>> +    struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
>> +                            ved);
>> +    return &vsen->tpg;
>> +}
>> +
>>   static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>>   {
>>       struct vimc_sen_device *vsen =
>> @@ -369,8 +377,18 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>>       if (ret)
>>           goto err_free_tpg;
>> -    vsen->ved.process_frame = vimc_sen_process_frame;
>> -    vsen->ved.dev = &vimc->pdev.dev;
>> +    switch(vimc_op_mode) {
>> +        case VIMC_OP_MODE_FRAME:
>> +            vsen->ved.process_data = vimc_sen_process_frame;
>> +            break;
>> +        case VIMC_OP_MODE_OPTMIZED:
>> +            vsen->ved.process_data = vimc_sen_process_tpg;
>> +            break;
>> +        default:
>> +            vsen->ved.process_data = vimc_sen_process_frame;
>> +            break;
>> +    }
>> +    vsen->dev = &vimc->pdev.dev;
> this switch case is repteaing, maybe add it to a function in vimc-common.c
> recieving the two funtions as arguments
>>       /* Initialize the frame format */
>>       vsen->mbus_format = fmt_default;
>> diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
>> index cd6b55433c9e..5fcf77391434 100644
>> --- a/drivers/media/platform/vimc/vimc-streamer.c
>> +++ b/drivers/media/platform/vimc/vimc-streamer.c
>> @@ -159,7 +159,7 @@ static int vimc_streamer_thread(void *data)
>>               break;
>>           for (i = stream->pipe_size - 1; i >= 0; i--) {
>> -            frame = stream->ved_pipeline[i]->process_frame(
>> +            frame = stream->ved_pipeline[i]->process_data(
>>                       stream->ved_pipeline[i], frame);

change the varible name from `frame` to `data`

>>               if (!frame || IS_ERR(frame))
>>                   break;
>>
> 
> Thanks,
> Dafna

Thanks again,
Dafna
