Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5461F523D
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 12:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbgFJK3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 06:29:00 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:39773 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726533AbgFJK27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 06:28:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ixyWjgYFiCKzeixyajwFcP; Wed, 10 Jun 2020 12:28:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591784937; bh=Qmd3Po5WmedPd6SnQS15ReHXur2bmLTHnIR4zy7yoME=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OuOrUdInufSqMQzHCE6CTrGv5w53ZTR9p0+gjoLzomyoxjSgAkUXQvrcZxZQiiR12
         OfDWSbNU06h/33MFHQoXg7S7nw6WLs9wIAouDW/YqB5jR0eQgoRnDla6endslz4xMB
         Sztk27N3QWisuLoa7DYKBbbmPliFVvutkWgnZ54hU4wIlDyGDixlfFN6HdZmADM244
         2JOhUfQ/vmWQiQY1R9VL+Ffos00eZk3yAbYgNMSDQephICAEFJe3iQVFtmVamPCuk+
         rXGyiaXlGYPw45NjkbwhROW2IT+rrl9rCmrayTE2XDQjVflZbRdXOXgKx7Ke9M5wRb
         t0axYFskIzFCw==
Subject: Re: [RFC PATCH V4 1/4] media: v4l2-mem2mem: add v4l2_m2m_suspend,
 v4l2_m2m_resume
To:     Tomasz Figa <tfiga@chromium.org>,
        Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Cc:     laurent.pinchart+renesas@ideasonboard.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, pihsun@chromium.org, yuzhao@chromium.org,
        zwisler@chromium.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        frederic.chen@mediatek.com, jungo.lin@mediatek.com,
        Rynn.Wu@mediatek.com, linux-media@vger.kernel.org,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com>
 <20200521171101.GA243874@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e31fe64a-c5c1-7b1e-eec1-27111fe43ac2@xs4all.nl>
Date:   Wed, 10 Jun 2020 12:28:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200521171101.GA243874@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPjvDRwAPuBWAShnkaoy0Ko1HJ/dBfaHGDX6rtabWr+JGzfga9JvRL0Z10aQ1hEni+uuVwBL9NpJlbHqv1Xk/3g6Ii3fEMHWp8W6kf3u1uALpb2Gn9Ao
 QAqUDEgTW2OGCL2CFkzRJPvzV47P+7vm/mf1wEO+hTf/jgPTZLBuMLTo4DSM4YwTSL9CUG4IL8DVfFdKLq8T0Y8PX0uvKd8svILMRVngvwwCw8JA8BiXZxBo
 Iu26+DEFrg0Hc9tclOpaf51WxPfSRwLoi15S3UbAHaBiGa9G78WlIVgoUgP89Sk/EOgNd8P6hlARgeAf8/a9eYojiuOGFDxIhpEp3XuanMMW96e1yGI2h3Ba
 oODjlnzhs8KXcNk4+Qq1Nn06tKrzFPTTnyP9Bo9pqLnWyoOFiZfx/CQgR0z6zMdMkoLjXQGxahk+k2OwPxfQloq6Mf+K3bNynE25GDSLHUR6/flvrQUJ8EOT
 Ynec3fePBQtGaPxWUQm46segEwXUomve1yOK1sjOYJiZlombg3CEZmxLmrEh6Eltw/BcDDuURdl2SrjUAbiEXQxx3REFR992xLvfCqqr8AzsVZgoH3dStTWG
 YUhX4yub2tL3JgDtKE2OtJSI377Buy5UEVZmsILVDp0IVrLoA+Mh6CbzsnSlt7/M4K3saP7ympO8IYRFu1H4PI3n69jwRjUYzySaqguKO+4PR5VOb7qY2ZmT
 MPyvsqUfBgfCzntwyCzk3A019FsIwqhqSfGoWnO5ibXy41Gt071yMqVcQe1Pwob28KMorI0UmVzez3QqSI5VI1nXCRJm6SSGNA8lyjeiyqWp+SqDuHl2JSV3
 ukeiqR4R6rbbCsa3WoLGusGd4lutrXB4WS+tgRveshrLBptlmrl3nc7nFDdX0GjgewYzBwqJckaOqjl/rNnm5WVjFbPCk3e5DFxVMAtp
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/05/2020 19:11, Tomasz Figa wrote:
> Hi Jerry,
> 
> On Wed, Dec 04, 2019 at 08:47:29PM +0800, Jerry-ch Chen wrote:
>> From: Pi-Hsun Shih <pihsun@chromium.org>
>>
>> Add two functions that can be used to stop new jobs from being queued /
>> continue running queued job. This can be used while a driver using m2m
>> helper is going to suspend / wake up from resume, and can ensure that
>> there's no job running in suspend process.
>>
>> BUG=b:143046833
>> TEST=build
>>
>> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
>> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-mem2mem.c | 40 ++++++++++++++++++++++++++
>>  include/media/v4l2-mem2mem.h           | 22 ++++++++++++++
>>  2 files changed, 62 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
>> index 5bbdec55b7d7..76ba203e0035 100644
>> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
>> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
>> @@ -47,6 +47,10 @@ module_param(debug, bool, 0644);
>>  #define TRANS_ABORT		(1 << 2)
>>  
>>  
>> +/* The job queue is not running new jobs */
>> +#define QUEUE_PAUSED		(1 << 0)
>> +
>> +
>>  /* Offset base for buffers on the destination queue - used to distinguish
>>   * between source and destination buffers when mmapping - they receive the same
>>   * offsets but for different queues */
>> @@ -88,6 +92,7 @@ static const char * const m2m_entity_name[] = {
>>   * @job_queue:		instances queued to run
>>   * @job_spinlock:	protects job_queue
>>   * @job_work:		worker to run queued jobs.
>> + * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
>>   * @m2m_ops:		driver callbacks
>>   */
>>  struct v4l2_m2m_dev {
>> @@ -105,6 +110,7 @@ struct v4l2_m2m_dev {
>>  	struct list_head	job_queue;
>>  	spinlock_t		job_spinlock;
>>  	struct work_struct	job_work;
>> +	unsigned long		job_queue_flags;
>>  
>>  	const struct v4l2_m2m_ops *m2m_ops;
>>  };
>> @@ -267,6 +273,12 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
>>  		return;
>>  	}
>>  
>> +	if (m2m_dev->job_queue_flags & QUEUE_PAUSED) {
>> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> +		dprintk("Running new jobs is paused\n");
>> +		return;
>> +	}
>> +
>>  	m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
>>  				   struct v4l2_m2m_ctx, queue);
>>  	m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
>> @@ -447,6 +459,34 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
>>  }
>>  EXPORT_SYMBOL(v4l2_m2m_job_finish);
>>  
>> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
>> +{
>> +	unsigned long flags;
>> +	struct v4l2_m2m_ctx *curr_ctx;
>> +
>> +	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>> +	m2m_dev->job_queue_flags |= QUEUE_PAUSED;
>> +	curr_ctx = m2m_dev->curr_ctx;
>> +	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> +
>> +	if (curr_ctx)
>> +		wait_event(curr_ctx->finished,
>> +			   !(curr_ctx->job_flags & TRANS_RUNNING));
>> +}
>> +EXPORT_SYMBOL(v4l2_m2m_suspend);
>> +
>> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev)
>> +{
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>> +	m2m_dev->job_queue_flags &= ~QUEUE_PAUSED;
>> +	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> +
>> +	v4l2_m2m_try_run(m2m_dev);
>> +}
>> +EXPORT_SYMBOL(v4l2_m2m_resume);
>> +
>>  int v4l2_m2m_reqbufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>>  		     struct v4l2_requestbuffers *reqbufs)
>>  {
>> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
>> index 5467264771ec..119a195da390 100644
>> --- a/include/media/v4l2-mem2mem.h
>> +++ b/include/media/v4l2-mem2mem.h
>> @@ -183,6 +183,28 @@ v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
>>  	vb2_buffer_done(&buf->vb2_buf, state);
>>  }
>>  
>> +/**
>> + * v4l2_m2m_suspend() - stop new jobs from being run and wait for current job
>> + * to finish
>> + *
>> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
>> + *
>> + * Called by a driver in the suspend hook. Stop new jobs from being run, and
>> + * wait for current running job to finish.
>> + */
>> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev);
>> +
>> +/**
>> + * v4l2_m2m_resume() - resume job running and try to run a queued job
>> + *
>> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
>> + *
>> + * Called by a driver in the resume hook. This reverts the operation of
>> + * v4l2_m2m_suspend() and allows job to be run. Also try to run a queued job if
>> + * there is any.
>> + */
>> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev);
>> +
>>  /**
>>   * v4l2_m2m_reqbufs() - multi-queue-aware REQBUFS multiplexer
>>   *
>> -- 
>> 2.18.0
> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> 
> [Corrected Hans's email address.]
> Hans, does this look good to you?

Yes, this looks good.

Sorry for the late reply.

I assume this will be part of a future patch series that calls these new functions?

Regards,

	Hans
