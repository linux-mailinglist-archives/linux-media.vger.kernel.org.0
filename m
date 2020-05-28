Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2481E6A41
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 21:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406275AbgE1TTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 15:19:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57470 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406274AbgE1TTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 15:19:42 -0400
Received: from [IPv6:2003:cb:871f:5b00:609a:762:a83:77bf] (p200300cb871f5b00609a07620a8377bf.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:609a:762:a83:77bf])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1E5282A0919;
        Thu, 28 May 2020 20:19:39 +0100 (BST)
Subject: Re: [PATCH 5/5] media: staging: rkisp1: replace workqueue with
 threaded irq for reading statistics registers
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200512120522.25960-1-dafna.hirschfeld@collabora.com>
 <20200512120522.25960-6-dafna.hirschfeld@collabora.com>
 <20200521000901.GE25474@pendragon.ideasonboard.com>
 <CAAFQd5AKrbtYMN+h6phaOYveNoUZptVdy+KD-Ef1+on_HXenyA@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <8eaaaf8e-2272-3c74-7c8a-6c320f72bc7a@collabora.com>
Date:   Thu, 28 May 2020 21:19:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5AKrbtYMN+h6phaOYveNoUZptVdy+KD-Ef1+on_HXenyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Tomasz, Laurent, and everyone

On 21.05.20 12:38, Tomasz Figa wrote:
> Hi Dafna,
> 
> On Thu, May 21, 2020 at 2:09 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> Hi Dafna,
>>
>> Thank you for the patch.
>>
>> On Tue, May 12, 2020 at 02:05:22PM +0200, Dafna Hirschfeld wrote:
>>> Reading the statistics registers might take too long
>>> to run inside the irq handler. Currently it is deferred
>>> to bottom half using workqueues. This patch replaces the
>>> workqueue with threaded interrupts for reading the
>>> statistics registers.
>>
>> Could you please explain why this is needed/desired ? Removal of the
>> kzalloc(GFP_ATOMIC) is very nice, but I'm sure there would have been
>> ways to avoid it while keeping a workqueue. I'm not claiming the patch
>> is bad, but I'd like to understand the reason.
>>
> 
> Thanks a lot for working on this driver!
> 
> I'll second what Laurent said. In general, a description of the patch
> should explain why a change is needed, e.g. what issues it fixes or
> what improvements it brings.

So from what I understand, the correct way to handle bottom half is
using threaded interrupts since they run in higher priority.
In case of this statistics reading for example, we want to read the stats
as fast as possible once we recieve the interrupt. If we read the stats too
long after the interrupt was recieved, then the values in the stats registerd
might have changed by then. Does that make sense?

I use the rockpi4 board to test the code and actually I did an experiment
of moving the code that reads the stats into the hard irq and it ran
fine. Maybe you know why the code is currently in a work queue and not
inside the hard irq? Also, the params struct is of size 5337 bytes and
the params subdevice can potentionaly run a lot of registers writing but
for some reasone the code of writing to the params registers still runs
inside the hard irq.

> 
> Also, would you mind adding me on CC for any patches for this driver?
> Since we use this driver in Chrome OS, I'd like to stay on top of any
> updates. Thanks in advance!
sure!

> 
> Best regards,
> Tomasz
> 
>>> A new struct type 'rkisp1_kstats_buffer' is used as the statistics
>>> buffers. The struct has a field 'ris' which is the flags of ready
>>> statistics. If new statistics are ready, the irq handler sets
>>> this variable and the frame sequence on the next available buffer
>>> and returns IRQ_WAKE_THREAD.
>>> Then the threaded interrupt reads the registers and calls
>>> vb2_buffer_done.
>>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> ---
>>>   drivers/staging/media/rkisp1/TODO            |   1 -
>>>   drivers/staging/media/rkisp1/rkisp1-common.h |   5 +-
>>>   drivers/staging/media/rkisp1/rkisp1-dev.c    |   8 +-
>>>   drivers/staging/media/rkisp1/rkisp1-isp.c    |   5 +-
>>>   drivers/staging/media/rkisp1/rkisp1-stats.c  | 167 ++++++++-----------
>>>   5 files changed, 76 insertions(+), 110 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
>>> index c0cbec0a164d..bdb1b8f73556 100644
>>> --- a/drivers/staging/media/rkisp1/TODO
>>> +++ b/drivers/staging/media/rkisp1/TODO
>>> @@ -1,5 +1,4 @@
>>>   * Fix pad format size for statistics and parameters entities.
>>> -* Use threaded interrupt for rkisp1_stats_isr(), remove work queue.
>>>   * Fix checkpatch errors.
>>>   * Review and comment every lock
>>>   * Handle quantization
>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
>>> index c635bb0a7727..c8adcdf661ab 100644
>>> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
>>> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
>>> @@ -190,8 +190,6 @@ struct rkisp1_stats {
>>>        struct list_head stat;
>>>        struct v4l2_format vdev_fmt;
>>>        bool is_streaming;
>>> -
>>> -     struct workqueue_struct *readout_wq;
>>>   };
>>>
>>>   /*
>>> @@ -308,10 +306,11 @@ void rkisp1_isp_unregister(struct rkisp1_device *rkisp1);
>>>
>>>   const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code);
>>>
>>> +irqreturn_t rkisp1_read_stats_threaded_irq(int irq, void *ctx);
>>>   irqreturn_t rkisp1_isp_isr(struct rkisp1_device *rkisp1);
>>>   irqreturn_t rkisp1_mipi_isr(struct rkisp1_device *rkisp1);
>>>   irqreturn_t rkisp1_capture_isr(struct rkisp1_device *rkisp1);
>>> -void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris);
>>> +irqreturn_t rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris);
>>>   void rkisp1_params_isr(struct rkisp1_device *rkisp1, u32 isp_mis);
>>>
>>>   int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1);
>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
>>> index b7f43dab71c8..12e2e8559acd 100644
>>> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
>>> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
>>> @@ -405,6 +405,8 @@ irqreturn_t rkisp1_isr(int irq, void *ctx)
>>>        isp_ret = rkisp1_isp_isr(rkisp1);
>>>        mipi_ret = rkisp1_mipi_isr(rkisp1);
>>>
>>> +     if (isp_ret == IRQ_WAKE_THREAD)
>>> +             return IRQ_WAKE_THREAD;
>>>        if (isp_ret == IRQ_NONE && cap_ret == IRQ_NONE && mipi_ret == IRQ_NONE)
>>>                return IRQ_NONE;
>>
>> Let me slightly modify my proposal from another patch in this series:
>>
>>          irqreturn_t ret = IRQ_NONE;
>>          ...
>>
>>          ret |= rkisp1_capture_isr(rkisp1);
>>          ret |= rkisp1_isp_isr(rkisp1);
>>          ret |= rkisp1_mipi_isr(rkisp1);
>>
>>          return ret & IRQ_WAKE_THREAD ? IRQ_WAKE_THREAD : ret;
>>
>> Up to you.
>>
>>>
>>> @@ -490,8 +492,10 @@ static int rkisp1_probe(struct platform_device *pdev)
>>>        if (irq < 0)
>>>                return irq;
>>>
>>> -     ret = devm_request_irq(dev, irq, rkisp1_isr, IRQF_SHARED,
>>> -                            dev_driver_string(dev), dev);
>>> +     ret = devm_request_threaded_irq(dev, irq, rkisp1_isr,
>>> +                                     rkisp1_read_stats_threaded_irq,
>>> +                                     IRQF_SHARED,
>>> +                                     dev_driver_string(dev), dev);
>>>        if (ret) {
>>>                dev_err(dev, "request irq failed: %d\n", ret);
>>>                return ret;
>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
>>> index 49b47e1734b0..09893073af00 100644
>>> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
>>> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
>>> @@ -1111,6 +1111,7 @@ static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
>>>   irqreturn_t rkisp1_isp_isr(struct rkisp1_device *rkisp1)
>>>   {
>>>        u32 status, isp_err;
>>> +     irqreturn_t ret = IRQ_HANDLED;
>>>
>>>        status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_MIS);
>>>        if (!status)
>>> @@ -1138,7 +1139,7 @@ irqreturn_t rkisp1_isp_isr(struct rkisp1_device *rkisp1)
>>>                /* New frame from the sensor received */
>>>                isp_ris = rkisp1_read(rkisp1, RKISP1_CIF_ISP_RIS);
>>>                if (isp_ris & RKISP1_STATS_MEAS_MASK)
>>> -                     rkisp1_stats_isr(&rkisp1->stats, isp_ris);
>>> +                     ret = rkisp1_stats_isr(&rkisp1->stats, isp_ris);
>>
>> Overriding the ret variable isn't very nice, even if it should work in
>> practice here as ret is already equal to IRQ_HANDLED and
>> rkisp1_stats_isr() returns IRQ_HANDLED or IRQ_WAKE_THREAD, never
>> IRQ_NONE. You could however write
>>
>>                          ret |= rkisp1_stats_isr(&rkisp1->stats, isp_ris);
>>
>> as IRQ_HANDLED and IRQ_WAKE_THREAD are independent bit flags to
>> accumulate them, provided you return IRQ_WAKE_THREAD from rkisp1_isr()
>> when both IRQ_WAKE_THREAD and IRQ_HANDLED are set (it seems the the core
>> IRQ code can't deal with both being set).
>>
>>>        }
>>>
>>>        /*
>>> @@ -1148,5 +1149,5 @@ irqreturn_t rkisp1_isp_isr(struct rkisp1_device *rkisp1)
>>>         */
>>>        rkisp1_params_isr(rkisp1, status);
>>>
>>> -     return IRQ_HANDLED;
>>> +     return ret;
>>>   }
>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
>>> index e6fb2c5f3b3e..f5eaa81362ea 100644
>>> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
>>> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
>>> @@ -18,19 +18,9 @@
>>>   #define RKISP1_ISP_STATS_REQ_BUFS_MIN 2
>>>   #define RKISP1_ISP_STATS_REQ_BUFS_MAX 8
>>>
>>> -enum rkisp1_isp_readout_cmd {
>>> -     RKISP1_ISP_READOUT_MEAS,
>>> -     RKISP1_ISP_READOUT_META,
>>> -};
>>> -
>>> -struct rkisp1_isp_readout_work {
>>> -     struct work_struct work;
>>> -     struct rkisp1_stats *stats;
>>> -
>>> -     unsigned int frame_id;
>>> -     unsigned int isp_ris;
>>> -     enum rkisp1_isp_readout_cmd readout;
>>> -     struct vb2_buffer *vb;
>>> +struct rkisp1_kstats_buffer {
>>> +     struct rkisp1_buffer buff;
>>> +     u32 ris;
>>>   };
>>>
>>>   static int rkisp1_stats_enum_fmt_meta_cap(struct file *file, void *priv,
>>> @@ -126,16 +116,17 @@ static int rkisp1_stats_vb2_queue_setup(struct vb2_queue *vq,
>>>   static void rkisp1_stats_vb2_buf_queue(struct vb2_buffer *vb)
>>>   {
>>>        struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>>> -     struct rkisp1_buffer *stats_buf =
>>> -             container_of(vbuf, struct rkisp1_buffer, vb);
>>> +     struct rkisp1_kstats_buffer *kstats_buf =
>>> +             container_of(vbuf, struct rkisp1_kstats_buffer, buff.vb);
>>>        struct vb2_queue *vq = vb->vb2_queue;
>>>        struct rkisp1_stats *stats_dev = vq->drv_priv;
>>>        unsigned long flags;
>>>
>>> -     stats_buf->vaddr[0] = vb2_plane_vaddr(vb, 0);
>>> +     kstats_buf->buff.vaddr[0] = vb2_plane_vaddr(vb, 0);
>>> +     kstats_buf->ris = 0;
>>>
>>>        spin_lock_irqsave(&stats_dev->stats_lock, flags);
>>> -     list_add_tail(&stats_buf->queue, &stats_dev->stat);
>>> +     list_add_tail(&kstats_buf->buff.queue, &stats_dev->stat);
>>>        spin_unlock_irqrestore(&stats_dev->stats_lock, flags);
>>>   }
>>>
>>> @@ -152,25 +143,19 @@ static int rkisp1_stats_vb2_buf_prepare(struct vb2_buffer *vb)
>>>   static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
>>>   {
>>>        struct rkisp1_stats *stats = vq->drv_priv;
>>> -     struct rkisp1_buffer *buf;
>>> +     struct rkisp1_kstats_buffer *buf;
>>>        unsigned long flags;
>>>        unsigned int i;
>>>
>>> -     /* Make sure no new work queued in isr before draining wq */
>>>        spin_lock_irqsave(&stats->stats_lock, flags);
>>>        stats->is_streaming = false;
>>> -     spin_unlock_irqrestore(&stats->stats_lock, flags);
>>> -
>>> -     drain_workqueue(stats->readout_wq);
>>> -
>>> -     spin_lock_irqsave(&stats->stats_lock, flags);
>>>        for (i = 0; i < RKISP1_ISP_STATS_REQ_BUFS_MAX; i++) {
>>>                if (list_empty(&stats->stat))
>>>                        break;
>>>                buf = list_first_entry(&stats->stat,
>>> -                                    struct rkisp1_buffer, queue);
>>> -             list_del(&buf->queue);
>>> -             vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>> +                                    struct rkisp1_kstats_buffer, buff.queue);
>>> +             list_del(&buf->buff.queue);
>>> +             vb2_buffer_done(&buf->buff.vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>>        }
>>>        spin_unlock_irqrestore(&stats->stats_lock, flags);
>>>   }
>>> @@ -207,7 +192,7 @@ rkisp1_stats_init_vb2_queue(struct vb2_queue *q, struct rkisp1_stats *stats)
>>>        q->drv_priv = stats;
>>>        q->ops = &rkisp1_stats_vb2_ops;
>>>        q->mem_ops = &vb2_vmalloc_memops;
>>> -     q->buf_struct_size = sizeof(struct rkisp1_buffer);
>>> +     q->buf_struct_size = sizeof(struct rkisp1_kstats_buffer);
>>>        q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>>        q->lock = &node->vlock;
>>>
>>> @@ -325,85 +310,81 @@ static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
>>>        }
>>>   }
>>>
>>> -static void
>>> -rkisp1_stats_send_measurement(struct rkisp1_stats *stats,
>>> -                           struct rkisp1_isp_readout_work *meas_work)
>>> +irqreturn_t rkisp1_read_stats_threaded_irq(int irq, void *ctx)
>>>   {
>>> +     struct device *dev = ctx;
>>> +     struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>>> +     struct rkisp1_stats *stats = &rkisp1->stats;
>>> +     struct rkisp1_kstats_buffer *kstats_buf = NULL;
>>>        struct rkisp1_stat_buffer *cur_stat_buf;
>>> -     struct rkisp1_buffer *cur_buf = NULL;
>>> -     unsigned int frame_sequence =
>>> -             atomic_read(&stats->rkisp1->isp.frame_sequence);
>>> -     u64 timestamp = ktime_get_ns();
>>>        unsigned long flags;
>>> -
>>> -     if (frame_sequence != meas_work->frame_id) {
>>> -             dev_warn(stats->rkisp1->dev,
>>> -                      "Measurement late(%d, %d)\n",
>>> -                      frame_sequence, meas_work->frame_id);
>>> -             frame_sequence = meas_work->frame_id;
>>> -     }
>>> +     u64 timestamp = ktime_get_ns();
>>>
>>>        spin_lock_irqsave(&stats->stats_lock, flags);
>>> -     /* get one empty buffer */
>>> -     if (!list_empty(&stats->stat)) {
>>> -             cur_buf = list_first_entry(&stats->stat,
>>> -                                        struct rkisp1_buffer, queue);
>>> -             list_del(&cur_buf->queue);
>>> +     if (!stats->is_streaming) {
>>> +             spin_unlock_irqrestore(&stats->stats_lock, flags);
>>> +             return IRQ_HANDLED;
>>> +     }
>>> +     if (list_empty(&stats->stat)) {
>>> +             spin_unlock_irqrestore(&stats->stats_lock, flags);
>>> +             WARN("%s: threaded irq waked but there are no buffers",
>>> +                  __func__);
>>> +             return IRQ_HANDLED;
>>> +     }
>>> +     kstats_buf = list_first_entry(&stats->stat,
>>> +                                   struct rkisp1_kstats_buffer, buff.queue);
>>> +
>>> +     /*
>>> +      * each waked irq thread reads exactly one ready statistics
>>> +      * so it is a bug  if no statistics are ready
>>> +      */
>>
>> What happens if this function takes too long to run ? With the
>> workqueue, if the work gets delayed once in a while, the work items will
>> accumulate, and all of them will be handled eventually. Here it seems
>> that an IRQ could get lost.

If the irs runs and there are no available buffers then indeed we lost the interrupt.
You think it might be a problem if userspace expect an associated stats buffer
for every recieved frame?
Also with workqueue we will lose the stats if we don't have an available buffer
when the workqueue runs.

Thanks,
Dafna
>>
>>> +     if (!kstats_buf->ris) {
>>> +             spin_unlock_irqrestore(&stats->stats_lock, flags);
>>> +             WARN("%s: threaded irq waked but buffer holds no measures",
>>> +                  __func__);
>>> +             return IRQ_HANDLED;
>>>        }
>>> +     list_del(&kstats_buf->buff.queue);
>>>        spin_unlock_irqrestore(&stats->stats_lock, flags);
>>>
>>> -     if (!cur_buf)
>>> -             return;
>>> -
>>>        cur_stat_buf =
>>> -             (struct rkisp1_stat_buffer *)(cur_buf->vaddr[0]);
>>> +             (struct rkisp1_stat_buffer *)(kstats_buf->buff.vaddr[0]);
>>>
>>> -     if (meas_work->isp_ris & RKISP1_CIF_ISP_AWB_DONE) {
>>> +     if (kstats_buf->ris & RKISP1_CIF_ISP_AWB_DONE) {
>>>                rkisp1_stats_get_awb_meas(stats, cur_stat_buf);
>>>                cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
>>>        }
>>>
>>> -     if (meas_work->isp_ris & RKISP1_CIF_ISP_AFM_FIN) {
>>> +     if (kstats_buf->ris & RKISP1_CIF_ISP_AFM_FIN) {
>>>                rkisp1_stats_get_afc_meas(stats, cur_stat_buf);
>>>                cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_AFM_FIN;
>>>        }
>>>
>>> -     if (meas_work->isp_ris & RKISP1_CIF_ISP_EXP_END) {
>>> +     if (kstats_buf->ris & RKISP1_CIF_ISP_EXP_END) {
>>>                rkisp1_stats_get_aec_meas(stats, cur_stat_buf);
>>>                rkisp1_stats_get_bls_meas(stats, cur_stat_buf);
>>>                cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
>>>        }
>>>
>>> -     if (meas_work->isp_ris & RKISP1_CIF_ISP_HIST_MEASURE_RDY) {
>>> +     if (kstats_buf->ris & RKISP1_CIF_ISP_HIST_MEASURE_RDY) {
>>>                rkisp1_stats_get_hst_meas(stats, cur_stat_buf);
>>>                cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
>>>        }
>>>
>>> -     vb2_set_plane_payload(&cur_buf->vb.vb2_buf, 0,
>>> +     vb2_set_plane_payload(&kstats_buf->buff.vb.vb2_buf, 0,
>>>                              sizeof(struct rkisp1_stat_buffer));
>>> -     cur_buf->vb.sequence = frame_sequence;
>>> -     cur_buf->vb.vb2_buf.timestamp = timestamp;
>>> -     vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>>> +     kstats_buf->buff.vb.vb2_buf.timestamp = timestamp;
>>> +     vb2_buffer_done(&kstats_buf->buff.vb.vb2_buf, VB2_BUF_STATE_DONE);
>>> +     return IRQ_HANDLED;
>>>   }
>>>
>>> -static void rkisp1_stats_readout_work(struct work_struct *work)
>>> -{
>>> -     struct rkisp1_isp_readout_work *readout_work =
>>> -             container_of(work, struct rkisp1_isp_readout_work, work);
>>> -     struct rkisp1_stats *stats = readout_work->stats;
>>> -
>>> -     if (readout_work->readout == RKISP1_ISP_READOUT_MEAS)
>>> -             rkisp1_stats_send_measurement(stats, readout_work);
>>>
>>
>> Is the second blank line intentional ?
>>
>>> -     kfree(readout_work);
>>> -}
>>> -
>>> -void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
>>> +irqreturn_t rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
>>>   {
>>> -     unsigned int frame_sequence =
>>> -             atomic_read(&stats->rkisp1->isp.frame_sequence);
>>>        struct rkisp1_device *rkisp1 = stats->rkisp1;
>>> -     struct rkisp1_isp_readout_work *work;
>>> +     struct rkisp1_isp *isp = &rkisp1->isp;
>>> +     struct rkisp1_kstats_buffer *buf = NULL;
>>> +     irqreturn_t ret = IRQ_HANDLED;
>>>        unsigned int isp_mis_tmp = 0;
>>>        unsigned long flags;
>>>        u32 val;
>>> @@ -417,28 +398,22 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
>>>        if (isp_mis_tmp & RKISP1_STATS_MEAS_MASK)
>>>                rkisp1->debug.stats_error++;
>>>
>>> -     if (!stats->is_streaming)
>>> +     if (!stats->is_streaming || !(isp_ris & RKISP1_STATS_MEAS_MASK))
>>>                goto unlock;
>>> -     if (isp_ris & RKISP1_STATS_MEAS_MASK) {
>>> -             work = kzalloc(sizeof(*work), GFP_ATOMIC);
>>> -             if (work) {
>>> -                     INIT_WORK(&work->work,
>>> -                               rkisp1_stats_readout_work);
>>> -                     work->readout = RKISP1_ISP_READOUT_MEAS;
>>> -                     work->stats = stats;
>>> -                     work->frame_id = frame_sequence;
>>> -                     work->isp_ris = isp_ris;
>>> -                     if (!queue_work(stats->readout_wq,
>>> -                                     &work->work))
>>> -                             kfree(work);
>>> -             } else {
>>> -                     dev_err(stats->rkisp1->dev,
>>> -                             "Could not allocate work\n");
>>> +
>>> +     list_for_each_entry(buf, &stats->stat, buff.queue) {
>>> +             if (!buf->ris) {
>>> +                     buf->buff.vb.sequence =
>>> +                             atomic_read(&isp->frame_sequence);
>>> +                     buf->ris = isp_ris;
>>> +                     ret = IRQ_WAKE_THREAD;
>>> +                     break;
>>>                }
>>>        }
>>>
>>>   unlock:
>>>        spin_unlock_irqrestore(&stats->stats_lock, flags);
>>> +     return ret;
>>>   }
>>>
>>>   static void rkisp1_init_stats(struct rkisp1_stats *stats)
>>> @@ -489,19 +464,8 @@ int rkisp1_stats_register(struct rkisp1_stats *stats,
>>>                goto err_cleanup_media_entity;
>>>        }
>>>
>>> -     stats->readout_wq = alloc_workqueue("measurement_queue",
>>> -                                         WQ_UNBOUND | WQ_MEM_RECLAIM,
>>> -                                         1);
>>> -
>>> -     if (!stats->readout_wq) {
>>> -             ret = -ENOMEM;
>>> -             goto err_unreg_vdev;
>>> -     }
>>> -
>>>        return 0;
>>>
>>> -err_unreg_vdev:
>>> -     video_unregister_device(vdev);
>>>   err_cleanup_media_entity:
>>>        media_entity_cleanup(&vdev->entity);
>>>   err_release_queue:
>>> @@ -515,7 +479,6 @@ void rkisp1_stats_unregister(struct rkisp1_stats *stats)
>>>        struct rkisp1_vdev_node *node = &stats->vnode;
>>>        struct video_device *vdev = &node->vdev;
>>>
>>> -     destroy_workqueue(stats->readout_wq);
>>>        video_unregister_device(vdev);
>>>        media_entity_cleanup(&vdev->entity);
>>>        vb2_queue_release(vdev->queue);
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
