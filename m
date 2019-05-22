Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D02EA261B2
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 12:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbfEVKZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 06:25:23 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46102 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbfEVKZW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 06:25:22 -0400
Received: by mail-pf1-f194.google.com with SMTP id y11so1076774pfm.13
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 03:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zqfWKVsUhdkOR/Nc5yLisuDwHqajL3y1wL67d7oCIDY=;
        b=mHqEpBboVjbUR3xpwir5FCaaamu8gZr+LEkXtzA9l5Q/cn5aNAh5nRcegYj1925abJ
         IMzQsj6Z7O0kOl1BOPOOtJgIs5wpMMSXwKW+VMkTpZ/+1LYNJt93/RGgjHEOP1ixCnMN
         M9BeIidwUlVG4KSw2YA1UCnoMF9NG2MSe0KSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zqfWKVsUhdkOR/Nc5yLisuDwHqajL3y1wL67d7oCIDY=;
        b=qIjVlo4g2InPPw8JQ94mgEr34VjSQAfX4rEEKXqsKeV/6Ioo2dhfgvODSKM9qTHPZr
         iRzB9CuToqSddriMZqXD1Fzlhld4FZ1JFm6H/jt6YrNQ7Gsz1TYWkgHIybn5mA4UUBcB
         wRVjGPe+ZZxKzoBJyDfKDfQHg5A85lHxNQnVVBhY8p+hADitz7gGSOc2Zh6QETTGv8PO
         HV03shPvAow6cTihAivfb586thIiRZsmGEs/qF1h0ftx+pR9/lZD6LQUkBpc4R0IA+Jy
         N+5T3E44HNiIK2oGT4qdajnfX9ilNip3PV51nwR1PWcv3k40/xMLZOBYM/T6EV+7H0iY
         QMpA==
X-Gm-Message-State: APjAAAUdeQDMpDCAG22KQTSyBaHTUREeuRXHSY8J/jkhHRlx4lhJf29y
        Zu7X8LFpZNfeyTNWCrCXUf2VhA==
X-Google-Smtp-Source: APXvYqxbPH4VpvYlm7+27HRhk3WMtsV80mvd3UDJftfAxajmAnCKWgnvSrBa8SSZBJDxaQpg3o25UQ==
X-Received: by 2002:a62:798b:: with SMTP id u133mr30621588pfc.210.1558520721582;
        Wed, 22 May 2019 03:25:21 -0700 (PDT)
Received: from chromium.org ([2401:fa00:4:4:6d27:f13:a0fa:d4b6])
        by smtp.gmail.com with ESMTPSA id 140sm39271455pfw.123.2019.05.22.03.25.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 22 May 2019 03:25:20 -0700 (PDT)
Date:   Wed, 22 May 2019 19:25:14 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Frederic Chen <frederic.chen@mediatek.com>
Cc:     matthias.bgg@gmail.com, mchehab@kernel.org, yuzhao@chromium.org,
        zwisler@chromium.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com, Jerry-ch.Chen@mediatek.com,
        jungo.lin@mediatek.com, Rynn.Wu@mediatek.com,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org, shik@chromium.org,
        suleiman@chromium.org, laurent.pinchart+renesas@ideasonboard.com,
        hans.verkuil@cisco.com
Subject: Re: [RFC PATCH V1 6/6] platform: mtk-isp: Add Mediatek DIP driver
Message-ID: <20190522102514.GA218991@chromium.org>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-7-frederic.chen@mediatek.com>
 <20190509094846.GA65444@google.com>
 <1558466055.15388.342.camel@mtksdccf07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558466055.15388.342.camel@mtksdccf07>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frederic,

On Wed, May 22, 2019 at 03:14:15AM +0800, Frederic Chen wrote:
> Dear Tomasz,
> 
> I appreciate your comment. It is very helpful for us.
> 

You're welcome. Thanks for replying to all the comments. I'll skip those
resolved in my reply to keep the message shorter.

> 
> On Thu, 2019-05-09 at 18:48 +0900, Tomasz Figa wrote:
> > Hi Frederic,
> > 
> > On Wed, Apr 17, 2019 at 7:45 PM Frederic Chen <frederic.chen@mediatek.com> wrote:
[snip]
> > > +
> > > +       timestamp = ktime_get_ns();
> > 
> > This timestamp is unused.
> 
> This line will be removed in the next patch.
> 
> > 
> > > +
> > > +       for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; i++) {
> > > +               struct mtk_dip_dev_buffer *dev_buf = job_info->buf_map[i];
> > > +
> > > +               if (!dev_buf) {
> > > +                       continue;
> > > +               } else {
> > 
> > No need to put this code under else.
> 
> I got it.
> 
> > 
> > > +                       dev_buf->vbb.vb2_buf.timestamp = ktime_get_ns();
> > 
> > Did you mean to use the timestamp variable here?
> 
> I would like to remove timestamp and still use
> dev_buf->vbb.vb2_buf.timestamp directly.
> 

That would result in buffers from different queues having different
timestamps.

However, this is a mem2mem device, so we shouldn't assign timestamps
here. We should copy the timestamp from the matching input buffer. I
missed that before, sorry.

[snip]

> > 
> > > +       dev_buf->buffer_usage = node->dev_q.buffer_usage;
> > 
> > There should be no buffer_usage, but rather separate queue for each usage.
> 
> I will remove mtk_dip_dev_buffer.buffer_usage and
> mtk_dip_dev_queue.buffer_usage.
> 
> May I add the dma port information (DMA port selection hint) in each
> video node's setting (mtk_dip_video_device_desc) so that we can retrieve
> the hint when we need to pass the buffer to co-processor as following:
> 
> 
> static int fill_ipi_img_param(struct mtk_dip_pipe *dip_pipe,
> 			      struct img_image_buffer *img,
> 			      struct mtk_dip_dev_buffer *dev_buf,
> 			      char *buf_name)
> {
> struct mtk_dip_video_device *vdo_dev;
> // ...
> vdo_dev = mtk_dip_vbq_to_node(dev_buf->vbb.vb2_buf.vb2_queue);
> /* image parameter will be passed to firmware*/
> img->usage = vdo_dev->desc->dma_hint;
> // ...
> }
>

Yes, that sounds sensible, but I'm not sure "hint" is a good name here,
because the purpose is precisely defined, not just a hint. Perhaps
better to call it something like "dma_port"?

> 
> > 
> > > +       dev_buf->rotation = node->dev_q.rotation;
> > > +
> > > +       if (desc->smem_alloc) {
> > > +               dev_buf->scp_daddr =
> > > +                       mtk_dip_smem_iova_to_phys
> > > +                       (dip_pipe->smem_alloc_dev,
> > > +                        dev_buf->isp_daddr);
> > 
> > Isn't this overly wrapped? The first argument should fit in the second line.
> 
> Do you mean the modification like this:
> 
>                dev_buf->scp_daddr = mtk_dip_smem_iova_to_phys
> 					(dip_pipe->smem_alloc_dev,
> 					 dev_buf->isp_daddr);

Almost. The wrapped lines should be aligned to the right as much as
possible, so it would be more like:

		dev_buf->scp_daddr = mtk_dip_smem_iova_to_phys(
						dip_pipe->smem_alloc_dev,
						dev_buf->isp_daddr);

[snip]
> > > +
> > > +       if (fjob->sequence == -1) {
> > > +               pr_err("%s: Invalid cmdq_cb_data(%p)\n",
> > > +                      __func__, data);
> > > +               ipi_fparam = NULL;
> > 
> > As far as I can see, we always get the data we explicitly gave to the cmdq
> > driver together with the callback function, so it sounds like we shouldn't
> > be able to get invalid data here.
> > 
> 
> I'm not sure if we can always trust CMDQ callback since we had
> suffered from an CMDQ bug that return an invalid address before.
> 

Hmm, but these values don't really go to the CMDQ hardware or firmware,
right? It's just the kernel CMDQ driver that looks the data pointer in
its internal state. That would be a bug similar to the workqueue
framework giving a bad pointer to the work function.

Also, checking for -1 alone doesn't really help us too much, because we
could for example get a pointer to some memory filled with random
values, in case of such bug.

Perhaps we should inspect the CMDQ driver design instead to make sure
it's impossible to receive a bad pointer from it.

[snip]

> > > +
> > > +       if (WARN_ONCE(!mdpcb_work, "%s: frame_no(%d) is lost",
> > > +                     __func__, frameparam->frame_no))
> > > +               return;
> > > +
> > > +       INIT_WORK(&mdpcb_work->frame_work, mdp_cb_worker);
> > > +       mdpcb_work->frameparams = frameparam;
> > > +       if (data.sta != CMDQ_CB_NORMAL)
> > > +               mdpcb_work->frameparams->state = FRAME_STATE_HW_TIMEOUT;
> > > +
> > > +       queue_work(dip_hw->mdpcb_workqueue, &mdpcb_work->frame_work);
> > 
> > Looking at mdp_cb_worker() and mtk_dip_notify() called by it, after fixing
> > the locking to use spinlocks rather than mutexes and remove some dynamic
> > allocations pointed out in other comments, we could just run them in atomic
> > context, without the need for this workqueue.
> 
> I will re-design this part to support the function to be run in
> atomic context. 
> 
> I would like to discuss the error handling in this function 
> for the next patch. When we get FRAME_STATE_HW_TIMEOUT, is it 
> suitable to trigger a  work to notify SCP with scp_ipi_send() to
> dump debug messages in further? (Can this kind of debugging 
> function be upstream?)
>

Yes, we should be able to have something like that.

> > 
> > > +}
> > > +
> > > +static void dip_vpu_handler(void *data, unsigned int len, void *priv)
> > > +{
> > > +       struct img_frameparam *framejob;
> > > +       struct img_ipi_frameparam *frameparam;
> > > +       struct mtk_dip_hw *dip_hw;
> > > +       struct mtk_dip_dev *dip_dev;
> > > +       unsigned long flags;
> > > +       u32 num;
> > > +
> > > +       if (WARN_ONCE(!data, "%s: failed due to NULL data\n", __func__))
> > > +               return;
> > > +
> > > +       frameparam = (struct img_ipi_frameparam *)data;
> > > +       framejob = dip_create_framejob(frameparam->index);
> > 
> > Rather than creating this dynamically, it should be already created. The
> > reason you have the priv argument to this function is that you can have the
> > SCP driver give to you a pointer to some struct that you gave to it when
> > calling scp_ipi_register(). That struct should have a list of valid VPU jobs
> > and here you should iterate through that list and find a matching job or
> > fail if there is no matching one. (We need to validate here, because we
> > can't trust the values coming from the firmware.)
> 
> May I embedded img_frameparam into the extended media_request object
> so that it can be managed with media_request objects?
> 
> struct mtk_dip_request {
> 	struct media_request request;
> 	struct mtk_dip_pipe_job_info job_info;
> 	struct mtk_dip_hw_work dip_work;
> 	struct img_frameparam job;
> 	struct mtk_dip_hw_mdpcb_timeout_work timeout_work;
> };
> 
> 

Yes, I think it would make sense indeed.

[snip]

> > > +static int dip_runner_func(void *data)
> > > +{
> > > +       struct img_frameparam *framejob;
> > > +       struct mtk_dip_hw *dip_hw;
> > > +       struct mtk_dip_dev *dip_dev;
> > > +       struct mtk_dip_hw_user_id *user_id;
> > > +       unsigned long flags;
> > > +       bool found;
> > > +       u32 queuecnt, num;
> > > +       int ret;
> > > +
> > > +       dip_hw = (struct mtk_dip_hw *)data;
> > > +       dip_dev = mtk_dip_hw_to_dev(dip_hw);
> > > +
> > > +       while (1) {
> > > +               spin_lock_irqsave(&dip_hw->dip_gcejoblist.queuelock, flags);
> > > +               queuecnt = dip_hw->dip_gcejoblist.queue_cnt;
> > > +               spin_unlock_irqrestore(&dip_hw->dip_gcejoblist.queuelock,
> > > +                                      flags);
> > > +
> > > +               ret = wait_event_interruptible_timeout
> > > +                       (dip_hw->dip_runner_thread.wq,
> > > +                        queuecnt || kthread_should_stop(),
> > > +                        msecs_to_jiffies(DIP_COMPOSER_THREAD_TIMEOUT));
> > 
> > Checking queuecnt here is also wrong. Please check my comment to another
> > wait_event_* in this patch.
> > 
> > Also the interruptibility and timeout don't make sense here, because we just
> > want to keep waiting unless something shows up or the kthread is forcefully
> > woken up for stopping.
> > 
> > However, we probably want it to be freezable(), so that we don't have to
> > bring the thread down and up on suspend/resume.
> 
> 
> I would like to fix it as following:
> 
> 
> static bool mtk_dip_hw_qce_queuecnt(struct mtk_dip_hw *dip_hw)
> {
> 	int queuecnt;
> 
> 	spin_lock_irqsave(&dip_hw->dip_gcejoblist.queuelock, flags);
> 	queuecnt = dip_hw->dip_gcejoblist.queue_cnt;
> 	spin_unlock_irqrestore(&dip_hw->dip_gcejoblist.queuelock,
> 
> 	return queuecnt;	
> }
> 
> static int dip_runner_func(void *data)
> {
> 
> 	//...
> 	set_freezable();
> 	while(1) {
> 		wait_event_freezable((dip_hw->dip_runner_thread.wq,
> 			 	     mtk_dip_hw_qce_queuecnt() ||
> 			 	     kthread_should_stop());
> 
> 		if (kthread_should_stop())
> 			break;
> 	
> 		// Call MDP/GCE API to do HW excecution
> 		// ...
> 
> 	}
> }
>

Sounds good to me.

[snip]

> > > +
> > > +free_work_list:
> > > +
> > > +       dev_dbg(&dip_dev->pdev->dev,
> > > +               "%s, free: frame_no(%d),idx(0x%x),worklist cnt(%d),composing num(%d)\n",
> > > +               __func__, dip_work->frameparams.frame_no,
> > > +               dip_work->frameparams.index, len, num);
> > > +
> > > +       kfree(dip_work);
> > 
> > We haven't allocated this object and so we shouldn't free it here. The layer
> > that allocated it should receive it back and free. (But we probably don't
> > need to allocate it dynamically as per my other comments.)
> > 
> 
> May I also merge dip_work into mtk_dip_request? 
> 
> struct mtk_dip_request {
> 	struct media_request request;
> 	struct mtk_dip_pipe_job_info job_info;
> 	struct mtk_dip_hw_work dip_work;
> 	struct img_frameparam job;
> 	struct mtk_dip_hw_mdpcb_timeout_work timeout_work;
> };
> 

Yes, it should indeed make sense.

> 
> > Also a general note - a work can be queued only once. This means that
> > current code races when two dip_works are attempted to be queued very
> > quickly one after another (or even at the same time from different threads).
> > 
> > I can think of two potential options for fixing this:
> > 
> > 1) Loop in the work function until there is nothing to queue to the hardware
> >    anymore - but this needs tricky synchronization, because there is still
> >    short time at the end of the work function when a new dip_work could be
> >    added.
> > 
> > 2) Change this to a kthread that just keeps running in a loop waiting for
> >    some available dip_work to show up and then sending it to the firmware.
> >    This should be simpler, as the kthread shouldn't have a chance to miss
> >    any dip_work queued.
> > 
> > I'm personally in favor of option 2, as it should simplify the
> > synchronization.
> > 
> 
> I would like to re-design this part with a kthread in the next patch.

Actually I missed another option. We could have 1 work_struct for 1
request and then we could keep using a workqueue. Perhaps that could be
simpler than a kthread.

Actually, similar approach could be used for the dip_runner_func.
Instead of having a kthread looping, we could just have another
workqueue and 1 dip_runner_work per 1 request. Then we wouldn't need to
do the waiting loop ourselves anymore.

Does it make sense?

[snip]

> > > +               buf->buffer.iova = sg_dma_address(buf->table.sgl);
> > > +               buf->tuning_buf.iova = buf->buffer.iova +
> > > +                       DIP_TUNING_OFFSET;
> > > +
> > > +               dev_dbg(&dip_dev->pdev->dev,
> > > +                       "%s: buf(%d), pa(%p), iova(%p)\n",
> > > +                       __func__, i, buf->buffer.pa, buf->buffer.iova);
> > > +
> > > +               dev_dbg(&dip_dev->pdev->dev,
> > > +                       "%s: config_data(%d), pa(%p), iova(%p)\n",
> > > +                       __func__, i, buf->config_data.pa, buf->config_data.va);
> > > +
> > > +               dev_dbg(&dip_dev->pdev->dev,
> > > +                       "%s: tuning_buf(%d), pa(%p), iova(%p)\n",
> > > +                       __func__, i, buf->tuning_buf.pa, buf->tuning_buf.iova);
> > > +
> > > +               dev_dbg(&dip_dev->pdev->dev,
> > > +                       "%s: frameparam(%d), pa(%p), iova(%p)\n",
> > > +                       __func__, i, buf->frameparam.pa, buf->frameparam.va);
> > > +
> > > +               list_add_tail(&buf->list_entry,
> > > +                             &dip_hw->dip_freebufferlist.queue);
> > > +               dip_hw->dip_freebufferlist.queue_cnt++;
> > > +               kfree(pages);
> > > +       }
> > 
> > But actually, why aren't these buffers managed by VB2?
> > 
> 
> I would like to manage the buffer with VB2, but I'm not sure what is 
> the right way to do that.
> 
> These are DIP internal working buffers. The buffers are not read or
> written by user application. In this case, could I add a meta capture
> video device to manage them or integrate the buffers with tuning meta
> output buffer directly?
> 

Ah, if these are internal buffers, then I guess we indeed need to
allocate them ourselves.

[snip]

> > > +               frameparam.state = FRAME_STATE_INIT;
> > > +               dip_send(dip_hw->vpu_pdev, SCP_IPI_DIP_INIT,
> > > +                        (void *)&frameparam, sizeof(frameparam), 0);
> > 
> > Is the call above synchronous? If not, don't we need to wait here for SCP to
> > initialize?
> > 
> 
> No, it is not synchronous when passing 0 in the latest parameter. We
> would like to improve it by using scp_ipi_send() directly instead of
> dip_send(), and wait for the ack from SCP with 2ms timeout setting.
> 
> ret = scp_ipi_send(dip_hw->scp_pdev SCP_IPI_DIP_INIT,
> 		   &frameparam, sizeof(frameparam), 2);
> 

2ms could likely fail here quite often, because even kernel code can be
preempted. We should have something like 200ms here, just to avoid
blocking indefinitely, but long enough not to happen even during high
system load.

[snip]

> 
> > > +       framework->frameparams.state = FRAME_STATE_INIT;
> > > +       framework->frameparams.frame_no =
> > > +               atomic_inc_return(&dip_hw->dip_enque_cnt);
> > 
> > It sounds like the struct passed as the frameparams argument to this
> > function and framework->frameparams should be two different structs.
> > 
> 
> I'm not sure if I understand it. Would you like to elaborate on this
> point? 
> 
> I would like to merge mtk_dip_hw_enqueue and mtk_dip_pipe_job_start so
> that we can configure the framework->frameparams in a single function.
>

Ah, that comment might have been added before I noticed that the
functions can be merged. Forgot to remove, sorry. Please ignore.

[snip]

> > > +static int __maybe_unused mtk_dip_pm_suspend(struct device *dev)
> > > +{
> > > +       struct mtk_dip_dev *dip_dev = dev_get_drvdata(dev);
> > > +
> > > +       if (atomic_read(&dip_dev->dip_hw.dip_user_cnt) > 0) {
> > > +               mtk_dip_hw_set_clk(&dip_dev->dip_hw, false);
> > > +               dev_dbg(&dip_dev->pdev->dev, "%s: disable clock\n",
> > > +                       __func__);
> > > +       }
> > 
> > Don't we need to do something to prevent the driver from scheduling next
> > frames here and wait for the hardware to finish processing current frame
> > here?
> > 
> 
> I will add some design to handle this case. Could we add a 
> suspend variable in mtk_dip_hw and check it in submit work kthread?
> 

Actually, with the other changes, the kthread would have been frozen for
us at this point, so maybe there isn't anything to do here! :)

OR, if we change the kthread to a workqueue (as per my other comment
above), we could make the workqueue freezable (by adding WQ_FREEZABLE to
the flags argument at creation time) and it would be frozen for us after
finishing current work struct.

> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int __maybe_unused mtk_dip_pm_resume(struct device *dev)
> > > +{
> > > +       struct mtk_dip_dev *dip_dev = dev_get_drvdata(dev);
> > > +
> > > +       if (atomic_read(&dip_dev->dip_hw.dip_user_cnt) > 0) {
> > > +               mtk_dip_hw_set_clk(&dip_dev->dip_hw, true);
> > > +               dev_dbg(&dip_dev->pdev->dev, "%s: enable clock\n",
> > > +                       __func__);
> > > +       }
> > 
> > Don't we need to kick off the hardware here to continue processing from
> > the next frame?
> > 
> 
> I will add some design to handle this case.
> 

As per above, making the kthreads/workqueues freezable actually should
solve the problem.

[snip]

> > > +static int mtk_dip_subdev_close(struct v4l2_subdev *sd,
> > > +                               struct v4l2_subdev_fh *fh)
> > > +{
> > > +       struct mtk_dip_pipe *dip_pipe = mtk_dip_subdev_to_pipe(sd);
> > > +       struct mtk_dip_dev *dip_dev =
> > > +               dev_get_drvdata(&dip_pipe->dip_dev->pdev->dev);
> > > +
> > > +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > > +               "%s:%s: pipe(%d) disconnect to dip_hw\n",
> > > +               __func__, dip_pipe->desc->name,
> > > +               dip_pipe->desc->id);
> > > +
> > > +       return mtk_dip_hw_disconnect(&dip_dev->dip_hw);
> > > +}
> > 
> > We shouldn't do any hardware operations just at subdev open or close. Those
> > should happen once the streaming actually starts.
> > 
> > Userspace is expected to open device nodes just to query them and that
> > shouldn't have any side effects.
> > 
> > In general I don't see why we actually should even do anything in subdev ops
> > in this driver. The subdev is only exposed to bridge all the video nodes
> > together and any control is done via either video ioctls or metadata
> > buffers.
> > 
> 
> I will move the hardware operation to streamon. We call rproc_boot() to
> load frimware in mtk_dip_hw_connect(), should it be moved to streamon,
> too?
> 

I think that would normally be done in runtime PM callbacks, with
autosuspend delay enabled to avoid continuous power-off and on
repeateadly.

Then, when there is a request to queue, the driver would call
pm_runtime_get_sync() and when a request completes,
pm_runtime_put_autosuspend().

[snip]

> > > +static void mtk_dip_node_to_v4l2(struct mtk_dip_pipe *dip_pipe,
> > > +                                u32 idx,
> > > +                                struct video_device *vdev,
> > > +                                struct v4l2_format *f)
> > > +{
> > > +       u32 cap;
> > > +       struct mtk_dip_video_device *node = &dip_pipe->nodes[idx];
> > > +
> > > +       cap = mtk_dip_node_get_v4l2_cap(dip_pipe, node);
> > > +       vdev->ioctl_ops = node->desc->ops;
> > > +       vdev->device_caps = V4L2_CAP_STREAMING | cap;
> > 
> > Why not just have mtk_dip_node_get_v4l2_cap() include V4L2_CAP_STREAMING in
> > the return value?
> > 
> 
> I would like to set the V4L2_CAP_STREAMING in node->desc->cap directly.
> 
> vdev->device_caps = node->desc->caps;
> 

Sure, that's also good.

Best regards,
Tomasz
