Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE86529617A
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 17:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2901250AbgJVPKw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 11:10:52 -0400
Received: from z5.mailgun.us ([104.130.96.5]:33593 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2508585AbgJVPKv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 11:10:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603379450; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3C3F2lmQbp8gch9c0PmjXhNxmlr9JRn/7qUaP8Vq+pk=;
 b=PaA+zJilyblSHpsv6w6wpkAxAIjOPxlO/AcYN5KXIdVzx1xdCRfoKm9srbLdi8FdaGPAdbUH
 VAr/C0T8xsQl4KIAc6iApsfh3acAX3F028XzffMgbVgMzWgXljR836dRhYyhQMXH3Zt/inI6
 +mPMuguEYis9E/QCf8ThISUddZg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f91a0f2319d4e9cb5653c6f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 15:10:42
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2C691C433C9; Thu, 22 Oct 2020 15:10:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6BF63C433CB;
        Thu, 22 Oct 2020 15:10:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 22 Oct 2020 20:40:40 +0530
From:   dikshita@codeaurora.org
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>
Subject: Re: [PATCH] venus: venc: add handling for VIDIOC_ENCODER_CMD
In-Reply-To: <CAPBb6MVPmW7MVveAKYzBXm=g=Ou4xviv5DjqMG+n0ax4OR7O0A@mail.gmail.com>
References: <1603117737-16965-1-git-send-email-dikshita@codeaurora.org>
 <CAPBb6MVPmW7MVveAKYzBXm=g=Ou4xviv5DjqMG+n0ax4OR7O0A@mail.gmail.com>
Message-ID: <c6a5c4b7c4ae8cb4e653cf98ec8a9750@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

Thanks for your suggestion, the helpers are good
but it is complicated to use them in video deriver
as video driver needs to deal with FW interface and
wait for buffer processing from FW.
So these helpers can't be used directly.

For example in case of B frames,
to encode such frame FW expect one more buffer to be queued
on src queue which needs to be handled by queueing an empty buffer
with EOS flag. Without EOS, we can't handle B frames.

Thanks,
Dikshita

On 2020-10-20 14:27, Alexandre Courbot wrote:
> Hi Dikshita,
> 
> On Mon, Oct 19, 2020 at 11:29 PM Dikshita Agarwal
> <dikshita@codeaurora.org> wrote:
>> 
>> Add handling for below commands in encoder:
>> 1. V4L2_ENC_CMD_STOP
>> 2. V4L2_ENC_CMD_START
> 
> I suspect this can be implemented more easily (and more safely) using
> the m2m encoder helpers introduced recently. Please see this commit
> for details:
> 
> https://github.com/torvalds/linux/commit/2b48e113866a6735de3a99531183afb6217c2a60
> 
> By making use of this you can probably get rid of venus_enc_state
> entirely. Also this generic implementation should take care of corner
> cases that this patch does not address (like streaming off while a
> drain is in progress).
> 
>> 
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.h |  9 +++++
>>  drivers/media/platform/qcom/venus/venc.c | 64 
>> +++++++++++++++++++++++++++++++-
>>  2 files changed, 72 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/core.h 
>> b/drivers/media/platform/qcom/venus/core.h
>> index e30eeaf..5c46936 100644
>> --- a/drivers/media/platform/qcom/venus/core.h
>> +++ b/drivers/media/platform/qcom/venus/core.h
>> @@ -276,6 +276,14 @@ enum venus_dec_state {
>>         VENUS_DEC_STATE_DRC             = 7,
>>  };
>> 
>> +enum venus_enc_state {
>> +       VENUS_ENC_STATE_DEINIT          = 0,
>> +       VENUS_ENC_STATE_INIT            = 1,
>> +       VENUS_ENC_STATE_ENCODING        = 2,
>> +       VENUS_ENC_STATE_STOPPED         = 3,
>> +       VENUS_ENC_STATE_DRAIN           = 4,
>> +};
>> +
>>  struct venus_ts_metadata {
>>         bool used;
>>         u64 ts_ns;
>> @@ -367,6 +375,7 @@ struct venus_inst {
>>         u8 quantization;
>>         u8 xfer_func;
>>         enum venus_dec_state codec_state;
>> +       enum venus_enc_state enc_state;
>>         wait_queue_head_t reconf_wait;
>>         unsigned int subscriptions;
>>         int buf_count;
>> diff --git a/drivers/media/platform/qcom/venus/venc.c 
>> b/drivers/media/platform/qcom/venus/venc.c
>> index f7fb6e3..c6143b0 100644
>> --- a/drivers/media/platform/qcom/venus/venc.c
>> +++ b/drivers/media/platform/qcom/venus/venc.c
>> @@ -498,6 +498,46 @@ static int venc_enum_frameintervals(struct file 
>> *file, void *fh,
>>         return 0;
>>  }
>> 
>> +static int
>> +venc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd 
>> *cmd)
>> +{
>> +       struct venus_inst *inst = to_inst(file);
>> +       struct hfi_frame_data fdata = {0};
>> +       int ret = 0;
>> +
>> +       ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
>> +       if (ret)
>> +               return ret;
>> +
>> +       mutex_lock(&inst->lock);
>> +
>> +       if (cmd->cmd == V4L2_ENC_CMD_STOP &&
>> +           inst->enc_state == VENUS_ENC_STATE_ENCODING) {
>> +               /*
>> +                * Implement V4L2_ENC_CMD_STOP by enqueue an empty 
>> buffer on
>> +                * encoder input to signal EOS.
>> +                */
>> +               if (!(inst->streamon_out && inst->streamon_cap))
>> +                       goto unlock;
>> +
>> +               fdata.buffer_type = HFI_BUFFER_INPUT;
>> +               fdata.flags |= HFI_BUFFERFLAG_EOS;
>> +               fdata.device_addr = 0xdeadb000;
>> +
>> +               ret = hfi_session_process_buf(inst, &fdata);
>> +
>> +               inst->enc_state = VENUS_ENC_STATE_DRAIN;
>> +       } else if (cmd->cmd == V4L2_ENC_CMD_START &&
>> +               inst->enc_state == VENUS_ENC_STATE_STOPPED) {
>> +               
>> vb2_clear_last_buffer_dequeued(&inst->fh.m2m_ctx->cap_q_ctx.q);
>> +               inst->enc_state = VENUS_ENC_STATE_ENCODING;
>> +       }
>> +
>> +unlock:
>> +       mutex_unlock(&inst->lock);
>> +       return ret;
>> +}
>> +
>>  static const struct v4l2_ioctl_ops venc_ioctl_ops = {
>>         .vidioc_querycap = venc_querycap,
>>         .vidioc_enum_fmt_vid_cap = venc_enum_fmt,
>> @@ -525,6 +565,7 @@ static int venc_enum_frameintervals(struct file 
>> *file, void *fh,
>>         .vidioc_enum_frameintervals = venc_enum_frameintervals,
>>         .vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>>         .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>> +       .vidioc_encoder_cmd = venc_encoder_cmd,
>>  };
>> 
>>  static int venc_set_properties(struct venus_inst *inst)
>> @@ -884,6 +925,8 @@ static int venc_start_streaming(struct vb2_queue 
>> *q, unsigned int count)
>>         if (ret)
>>                 goto deinit_sess;
>> 
>> +       inst->enc_state = VENUS_ENC_STATE_ENCODING;
>> +
>>         mutex_unlock(&inst->lock);
>> 
>>         return 0;
>> @@ -903,8 +946,19 @@ static int venc_start_streaming(struct vb2_queue 
>> *q, unsigned int count)
>>  static void venc_vb2_buf_queue(struct vb2_buffer *vb)
>>  {
>>         struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>> +       struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> 
>>         mutex_lock(&inst->lock);
>> +
>> +       if (inst->enc_state == VENUS_ENC_STATE_STOPPED) {
>> +               vbuf->sequence = inst->sequence_cap++;
>> +               vbuf->field = V4L2_FIELD_NONE;
>> +               vb2_set_plane_payload(vb, 0, 0);
>> +               v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
>> +               mutex_unlock(&inst->lock);
>> +               return;
>> +       }
>> +
>>         venus_helper_vb2_buf_queue(vb);
>>         mutex_unlock(&inst->lock);
>>  }
>> @@ -943,6 +997,11 @@ static void venc_buf_done(struct venus_inst 
>> *inst, unsigned int buf_type,
>>                 vb->planes[0].data_offset = data_offset;
>>                 vb->timestamp = timestamp_us * NSEC_PER_USEC;
>>                 vbuf->sequence = inst->sequence_cap++;
>> +
>> +               if ((vbuf->flags & V4L2_BUF_FLAG_LAST) &&
>> +                   inst->enc_state == VENUS_ENC_STATE_DRAIN) {
>> +                       inst->enc_state = VENUS_ENC_STATE_STOPPED;
>> +               }
>>         } else {
>>                 vbuf->sequence = inst->sequence_out++;
>>         }
>> @@ -1041,6 +1100,9 @@ static int venc_open(struct file *file)
>>         inst->clk_data.core_id = VIDC_CORE_ID_DEFAULT;
>>         inst->core_acquired = false;
>> 
>> +       if (inst->enc_state == VENUS_ENC_STATE_DEINIT)
>> +               inst->enc_state = VENUS_ENC_STATE_INIT;
>> +
>>         venus_helper_init_instance(inst);
>> 
>>         ret = pm_runtime_get_sync(core->dev_enc);
>> @@ -1105,7 +1167,7 @@ static int venc_close(struct file *file)
>>         mutex_destroy(&inst->lock);
>>         v4l2_fh_del(&inst->fh);
>>         v4l2_fh_exit(&inst->fh);
>> -
>> +       inst->enc_state = VENUS_ENC_STATE_DEINIT;
>>         pm_runtime_put_sync(inst->core->dev_enc);
>> 
>>         kfree(inst);
>> --
>> 1.9.1
>> 
