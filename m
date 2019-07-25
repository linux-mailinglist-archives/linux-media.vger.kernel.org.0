Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 701CF749CB
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 11:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389081AbfGYJXz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 05:23:55 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:32841 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388704AbfGYJXz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 05:23:55 -0400
Received: by mail-ed1-f65.google.com with SMTP id i11so49592216edq.0
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 02:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W3PT03x21n4X7D7DC8kpShGPbnUUUcZVsQsSjEWFpVs=;
        b=nnYu2IvwUPE95wpN4CLi/On1KUaWltQdN+17+SloHhXgkVSpuKD+noPi9VjCsieQ3A
         2Gn6f/8Sm8XgaiLtNHi8s1NT1xtnJdUZV5B9E85uXUVt7/HzkFhq6Lqs9oT05meLxQEo
         0lSuCPmizvXGGKU1hZbW4e22ZoX7G/cP8ikUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W3PT03x21n4X7D7DC8kpShGPbnUUUcZVsQsSjEWFpVs=;
        b=p1CuQ3ao8Sj7IwJK7tSHkv9FvKiyWvqoXwgS+LmX20r6T7fIve77vm0TKu5GbDXnhb
         fvG5vlIU2Sa6tqVeTc1m6tzyE6hofn1t7mgB8+sTbNV3Y6Ugyz2CjpZJNSs49kG3p6zp
         iSEwg/4ntsX39gZOKiC6B80KBwxyggaqc1lnyIAd/AVCKY21XnQxxwDSdswy3VDZ78qf
         LRxVon+vXJLHEkTTxP+4m2ozvxfxvjPffAa277dcS9U64GqXdDgm3EPRHICOi0/cY+Ka
         OcXQh4Fp03RsBV8V2EFAnodZ8fBdWrtbZKth436vgSbleN9q0Wn+GC+fbupFaW+7xfuY
         fkJA==
X-Gm-Message-State: APjAAAUI4FT8BjkkGmgeoXa1IhCcL2yeXepA9fte8FLnqlqs7A8Zfkxt
        hmnEaMe/or9La6SxvkPPuCbSrzCmpsv1Uw==
X-Google-Smtp-Source: APXvYqxBskJck8Of6ziyeHVgN66p+k/Hzi0fPQj1HHNN3VpNRm7ctYKv81eX4wyjIsjn6K9UEqaNiw==
X-Received: by 2002:a17:906:7f01:: with SMTP id d1mr64506953ejr.310.1564046632142;
        Thu, 25 Jul 2019 02:23:52 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id jr20sm9629112ejb.88.2019.07.25.02.23.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 02:23:49 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id r1so49944927wrl.7
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 02:23:48 -0700 (PDT)
X-Received: by 2002:adf:ed41:: with SMTP id u1mr89163560wro.162.1564046628416;
 Thu, 25 Jul 2019 02:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <jungo.lin@mediatek.com> <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-8-jungo.lin@mediatek.com> <20190710095646.GB181405@chromium.org>
 <1563616681.1212.386.camel@mtksdccf07>
In-Reply-To: <1563616681.1212.386.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 25 Jul 2019 18:23:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AmAXm1T0eLPiUTFLv9qiKxe-wZGyXxk0jvge+EanZ3FQ@mail.gmail.com>
Message-ID: <CAAFQd5AmAXm1T0eLPiUTFLv9qiKxe-wZGyXxk0jvge+EanZ3FQ@mail.gmail.com>
Subject: Re: [RFC,v3 7/9] media: platform: Add Mediatek ISP P1 device driver
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        srv_heupstream <srv_heupstream@mediatek.com>,
        ddavenport@chromium.org, Rob Herring <robh@kernel.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <sean.cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <rynn.wu@mediatek.com>,
        =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= 
        <frankie.chiu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

.Hi Jungo,

On Sat, Jul 20, 2019 at 6:58 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
>
> Hi, Tomasz:
>
> On Wed, 2019-07-10 at 18:56 +0900, Tomasz Figa wrote:
> > Hi Jungo,
> >
> > On Tue, Jun 11, 2019 at 11:53:42AM +0800, Jungo Lin wrote:
> > > This patch adds the Mediatek ISP P1 HW control device driver.
> > > It handles the ISP HW configuration, provides interrupt handling and
> > > initializes the V4L2 device nodes and other functions.
> > >
> > > (The current metadata interface used in meta input and partial
> > > meta nodes is only a temporary solution to kick off the driver
> > > development and is not ready to be reviewed yet.)
> > >
> > > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > > ---
> > >  .../platform/mtk-isp/isp_50/cam/Makefile      |    1 +
> > >  .../mtk-isp/isp_50/cam/mtk_cam-regs.h         |  126 ++
> > >  .../platform/mtk-isp/isp_50/cam/mtk_cam.c     | 1087 +++++++++++++++++
> > >  .../platform/mtk-isp/isp_50/cam/mtk_cam.h     |  243 ++++
> > >  4 files changed, 1457 insertions(+)
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h
> > >
> >
> > Thanks for the patch! Please see my comments inline.
> >
> > [snip]
> >
>
> Thanks for your comments. Please check my replies inline.
>

Thanks! I'll snip anything I don't have further comments on.

[snip]
> > > +/* META */
> > > +#define REG_META0_VB2_INDEX                0x14dc
> > > +#define REG_META1_VB2_INDEX                0x151c
> >
> > I don't believe these registers are really for VB2 indexes.
> >
>
> MTK P1 ISP HW supports frame header spare registers for each DMA, such
> as CAM_DMA_FH_AAO_SPARE or CAM_DMA_FH_AFO_SPARE. We could save some
> frame information in these ISP registers. In this case, we save META0
> VB2 index into AAO FH spare register and META1 VB2 index into AFO FH
> spare register. These implementation is designed for non-request 3A
> DMAs. These VB2 indexes are sent in ISP_CMD_ENQUEUE_META command of
> mtk_isp_enqueue function. So we just call CAM_DMA_FH_AAO_SPARE as
> REG_META0_VB2_INDEX for easy understanding.

Unfortunately it's not a good idea to mix hardware concepts with
naming specific to the OS the driver is written for. Better to keep
the hardware naming, e.g. CAM_DMA_FH_AAO_SPARE.

> Moreover, if we only need to
> support request mode, we should remove this here.
>
> cmd_params.cmd_id = ISP_CMD_ENQUEUE_META;
> cmd_params.meta_frame.enabled_dma = dma_port;
> cmd_params.meta_frame.vb_index = buffer->vbb.vb2_buf.index;
> cmd_params.meta_frame.meta_addr.iova = buffer->daddr;
> cmd_params.meta_frame.meta_addr.scp_addr = buffer->scp_addr;
>

Okay, removing sounds good to me. Let's keep the code simple.

[snip]
> > > +
> > > +   err_status = irq_status & INT_ST_MASK_CAM_ERR;
> > > +
> > > +   /* Sof, done order check */
> > > +   if ((irq_status & SOF_INT_ST) && (irq_status & HW_PASS1_DON_ST)) {
> > > +           dev_dbg(dev, "sof_done block cnt:%d\n", isp_dev->sof_count);
> > > +
> > > +           /* Notify IRQ event and enqueue frame */
> > > +           irq_handle_notify_event(isp_dev, irq_status, dma_status, 0);
> > > +           isp_dev->current_frame = hw_frame_num;
> >
> > What exactly is hw_frame_num? Shouldn't we assign it before notifying the
> > event?
> >
>
> This is a another spare register for frame sequence number usage.
> It comes from struct p1_frame_param:frame_seq_no which is sent by
> SCP_ISP_FRAME IPI command. We will rename this to dequeue_frame_seq_no.
> Is it a better understanding?

I'm sorry, unfortunately it's still not clear to me. Is it the
sequence number of the frame that was just processed and returned to
the kernel or the next frame that is going to be processed from now
on?

>
> Below is our frame request handling in current design.
>
> 1. Buffer preparation
> - Combined image buffers (IMGO/RRZO) + meta input buffer (Tuining) +
> other meta histogram buffers (LCSO/LMVO) into one request.
> - Accumulated one unique frame sequence number to each request and send
> this request to the SCP composer to compose CQ (Command queue) buffer
> via SCP_ISP_FRAME IPI command.
> - CQ buffer is frame registers set. If ISP registers should be updated
> per frame, these registers are configured in the CQ buffer, such as
> frame sequence number, DMA addresses and tuning ISP registers.
> - One frame request will be composed into one CQ buffer.Once CQ buffer
> is composed done and kernel driver will receive ISP_CMD_FRAME_ACK with
> its corresponding frame sequence number. Based on this, kernel driver
> knows which request is ready to be en-queued and save this with
> p1_dev->isp_ctx.composed_frame_id.

Hmm, why do we need to save this in p1_dev->isp_ctx? Wouldn't we
already have a linked lists of requests that are composed and ready to
be enqueued? Also, the request itself would contain its frame ID
inside the driver request struct, right?

> - The maximum number of CQ buffers in SCP is 3.
>
> 2. Buffer en-queue flow
> - In order to configure correct CQ buffer setting before next SQF event,
> it is depended on by MTK ISP P1 HW CQ mechanism.
> - The basic concept of CQ mechanism is loaded ISP CQ buffer settings
> when HW_PASS1_DON_ST is received which means DMA output is done.
> - Btw, the pre-condition of this, need to tell ISP HW which CQ buffer
> address is used. Otherwise, it will loaded one dummy CQ buffer to
> bypass.
> - So we will check available CQ buffers by comparing composed frame
> sequence number & dequeued frame sequence from ISP HW in SOF event.
> - If there are available CQ buffers, update the CQ base address to the
> next CQ buffer address based on current de-enqueue frame sequence
> number. So MTK ISP P1 HW will load this CQ buffer into HW when
> HW_PASS1_DON_ST is triggered which is before the next SOF.
> - So in next SOF event, ISP HW starts to output DMA buffers with this
> request until request is done.
> - But, for the first request, it is loaded into HW manually when
> streaming is on for better performance.
>
> 3. Buffer de-queue flow
> - We will use frame sequence number to decide which request is ready to
> de-queue.
> - We will save some important register setting from ISP HW when SOF is
> received. This is because the ISP HW starts to output the data with the
> corresponding settings, especially frame sequence number setting.

Could you explain a bit more about these important register settings?
When does the hardware update the values in the register to new ones?
At SOF?

> - When receiving SW_PASS1_DON_ST IRQ event, it means the DMA output is
> done. So we could call isp_deque_request_frame with frame sequence
> number to de-queue frame to VB2

What's the difference between HW_PASS1_DON_ST and SW_PASS1_DON_ST?

> - For AAO/AFO buffers, it has similar design concept. Sometimes, if only
> AAO/AFO non-request buffers are en-queued without request buffers at the
> same time, there will be no SW P1 done event for AAO/AFO DMA done.
> Needs to depend on other IRQ events, such as AAO/AFO_DONE_EVENT.

Do we have a case like this? Wouldn't we normally always want to
bundle AAO/AFO buffers with frame buffers?

> - Due to CQ buffer number limitation, if we receive SW_PASS1_DONT_ST,
> we may try to send another request to SCP for composing.

Okay, so basically in SW_PASS1_DONT_ST the CQ completed reading the CQ
buffers, right?

>
> Hopefully, my explanation is helpful for better understanding our
> implementation. If you still have any questions, please let me know.
>

Yes, it's more clear now, thanks. Still some more comments above, though.

> > > +           isp_dev->meta0_vb2_index = meta0_vb2_index;
> > > +           isp_dev->meta1_vb2_index = meta1_vb2_index;
> > > +   } else {
> > > +           if (irq_status & SOF_INT_ST) {
> > > +                   isp_dev->current_frame = hw_frame_num;
> > > +                   isp_dev->meta0_vb2_index = meta0_vb2_index;
> > > +                   isp_dev->meta1_vb2_index = meta1_vb2_index;
> > > +           }
> > > +           irq_handle_notify_event(isp_dev, irq_status, dma_status, 1);
> > > +   }
> >
> > The if and else blocks do almost the same things just in different order. Is
> > it really expected?
> >
>
> If we receive HW_PASS1_DON_ST & SOF_INT_ST IRQ events at the same time,
> the correct sequence should be handle HW_PASS1_DON_ST firstly to check
> any de-queued frame and update the next frame setting later.
> Normally, this is a corner case or system performance issue.

So it sounds like HW_PASS1_DON_ST means that all data from current
frame has been written, right? If I understand your explanation above
correctly, that would mean following handling of each interrupt:

HW_PASS1_DON_ST:
 - CQ executes with next CQ buffer to prepare for next frame. <- how
is this handled? does the CQ hardware automatically receive this event
from the ISP hadware?
 - return VB2 buffers,
 - complete requests.

SOF_INT_ST:
 - send VSYNC event to userspace,
 - program next CQ buffer to CQ,

SW_PASS1_DON_ST:
 - reclaim CQ buffer and enqueue next frame to composing if available

>
> Btw, we will revise the above implementation as below.
>
>
> if (irq_status & SOF_INT_ST)
>         mtk_cam_dev_event_frame_sync(&p1_dev->cam_dev,
>                                              dequeue_frame_seq_no);
>
> /* Sof, done order check */
> if ((irq_status & SOF_INT_ST) && (irq_status & HW_PASS1_DON_ST))
>         dev_warn(dev, "sof_done block cnt:%d\n", p1_dev->sof_count);
>
> /* Notify IRQ event and de-enqueue frame */
> irq_handle_notify_event(p1_dev, irq_status, dma_status);

Don't we still need to do this conditionally, only if we got HW_PASS1_DON_ST?

[snip]
> > > +/* ISP P1 interface functions */
> > > +int mtk_isp_power_init(struct mtk_cam_dev *cam_dev)
> > > +{
> > > +   struct device *dev = &cam_dev->pdev->dev;
> > > +   struct isp_p1_device *p1_dev = get_p1_device(dev);
> > > +   struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > > +   int ret;
> > > +
> > > +   ret = isp_setup_scp_rproc(p1_dev);
> > > +   if (ret)
> > > +           return ret;
> > > +
> > > +   ret = isp_init_context(p1_dev);
> > > +   if (ret)
> > > +           return ret;
> >
> > The above function doesn't really seem to be related to power management.
> > Should it be called from subdev stream on?
> >
>
> We will rename this function to mtk_isp_hw_init.
> But, it will be called when the first video node is streamed on.
> This is because we need to initialize the HW firstly for sub-device
> stream-on performance.  We need to send some IPI commands, such as
> ISP_CMD_INIT & ISP_CMD_CONFIG_META & ISP_CMD_ENQUEUE_META in this
> timing.

What performance do you mean here? The time between first video node
stream on and last video node stream on should be really short. Are
you seeing some long delays there?

That said, doing it when the first video node starts streaming is okay.

[snip]
> > > +   /* Use pure RAW as default HW path */
> > > +   isp_ctx->isp_raw_path = ISP_PURE_RAW_PATH;
> > > +   atomic_set(&p1_dev->cam_dev.streamed_node_count, 0);
> > > +
> > > +   isp_composer_hw_init(dev);
> > > +   /* Check enabled DMAs which is configured by media setup */
> > > +   isp_composer_meta_config(dev, get_enabled_dma_ports(cam_dev));
> >
> > Hmm, this seems to be also configured by isp_compoer_hw_config(). Are both
> > necessary?
> >
>
> Yes, it is necessary for non-request buffers design for Camera 3A video
> nodes. For 3A video nodes, we just want to know which 3A video nodes are
> enabled in ISP_CMD_CONFIG_META. In this stage, we may not know the image
> format from user space. So we just pass the enabled DMA information from
> kernel to SCP only. With 3A enabled DMA information, we could configure
> related 3A registers in SCP.

We should try to remove this non-request mode. Let's continue
discussion on the other patch where I brought this topic.

[snip]
> > > +int mtk_isp_power_release(struct device *dev)
> > > +{
> > > +   isp_composer_hw_deinit(dev);
> > > +   isp_uninit_context(dev);
> >
> > These two don't seem to be related to power either.
> >
> > Instead, I don't see anything that could undo the rproc_boot() operation
> > here.
> >
>
> We will rename this function to mtk_isp_hw_release.
> We will also add rproc_shutdown function call here.
>
> int mtk_isp_hw_release(struct mtk_cam_dev *cam)
> {
>         struct device *dev = cam->dev;
>         struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);
>
>         isp_composer_hw_deinit(p1_dev);
>         pm_runtime_put_sync_autosuspend(dev);

Note that for autosuspend to work correctly, you also need to call
pm_runtime_mark_last_busy() before this one.

[snip]
> > > +   struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > > +   struct p1_frame_param frameparams;
> > > +   struct mtk_isp_queue_job *framejob;
> > > +   struct media_request_object *obj, *obj_safe;
> > > +   struct vb2_buffer *vb;
> > > +   struct mtk_cam_dev_buffer *buf;
> > > +
> > > +   framejob = kzalloc(sizeof(*framejob), GFP_ATOMIC);
> >
> > This allocation shouldn't be needed. The structure should be already a part
> > of the mtk_cam_dev_request struct that wraps media_request. Actually. I'd
> > even say that the contents of this struct should be just moved to that one
> > to avoid overabstracting.
> >
>
> For this function, we will apply the new design from P2 driver's
> comment. Here is the new implementation.
>
> struct mtk_cam_dev_request {
>         struct media_request req;
>         struct mtk_p1_frame_param frame_params;
>         struct work_struct frame_work;
>         struct list_head list;
>         atomic_t buf_count;
> };
>
> void mtk_isp_req_enqueue(struct mtk_cam_dev *cam,
>                          struct mtk_cam_dev_request *req)
> {
>         struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(cam->dev);
>         int ret;
>
>         req->frame_params.frame_seq_no = ++p1_dev->enqueue_frame_seq_no;
>         INIT_WORK(&req->frame_work, isp_tx_frame_worker);
>         ret = queue_work(p1_dev->composer_wq, &req->frame_work);
>         if (!ret)
>                 dev_dbg(cam->dev, "frame_no:%d queue_work failed\n",
>                         req->frame_params.frame_seq_no, ret);
>         else
>                 dev_dbg(cam->dev, "Enqueue fd:%s frame_seq_no:%d job cnt:%d\n",
>                         req->req.debug_str, req->frame_params.frame_seq_no,
>                         atomic_read(&cam->running_job_count));

It shouldn't be possible for queue_work() to fail here. We just
received a brand new request from the Request API core and called
INIT_WORK() on the work struct.

[snip]
> > > +   enable_sys_clock(p1_dev);
> > > +
> > > +   /* V4L2 stream-on phase & restore HW stream-on status */
> > > +   if (p1_dev->cam_dev.streaming) {
> > > +           dev_dbg(dev, "Cam:%d resume,enable VF\n", module);
> > > +           /* Enable CMOS */
> > > +           reg_val = readl(isp_dev->regs + REG_TG_SEN_MODE);
> > > +           writel((reg_val | CMOS_EN_BIT),
> > > +                  isp_dev->regs + REG_TG_SEN_MODE);
> > > +           /* Enable VF */
> > > +           reg_val = readl(isp_dev->regs + REG_TG_VF_CON);
> > > +           writel((reg_val | VFDATA_EN_BIT),
> > > +                  isp_dev->regs + REG_TG_VF_CON);
> > > +   }
> >
> > Does the hardware keep all the state, e.g. queued buffers, during suspend?
> > Would the code above continue all the capture from the next buffer, as
> > queued by the userspace before the suspend?
> >
>
> Yes, we will test it.
> 1. SCP buffers are kept by SCP processor
> 2. ISP registers are still kept even if ISP clock is disable.
>

That said, during system suspend, it would be more than just ISP clock
disabled. I'd expect that the ISP power domain would be powered off.
However, if we ensure that the ISP completes before suspend, I guess
that after the resume the next frame CQ buffer would reprogram all the
registers, right?

Also, would SCP always keep running in system suspend?

[snip]
> > > +
> > > +   for (i = ISP_CAMSYS_CONFIG_IDX; i < ISP_DEV_NODE_NUM; i++) {
> >
> > I think we want to start from 0 here?
> >
>
> Because of single CAM support, we will revise our DTS tree to support
> single CAM only.

Note that DT bindings should describe the hardware not the driver. So
please design the bindings in a way that would cover all the cameras,
even if the driver only takes the information needed to handle 1.

> So we could remove this loop and check the CAM-B HW
> information here. Here is below new function.
>
> static int mtk_isp_probe(struct platform_device *pdev)
> {
>         /* List of clocks required by isp cam */
>         static const char * const clk_names[] = {
>                 "camsys_cam_cgpdn", "camsys_camtg_cgpdn"
>         };
>         struct mtk_isp_p1_device *p1_dev;
>         struct device *dev = &pdev->dev;
>         struct resource *res;
>         int irq, ret, i;
>
>         p1_dev = devm_kzalloc(dev, sizeof(*p1_dev), GFP_KERNEL);
>         if (!p1_dev)
>                 return -ENOMEM;
>
>         p1_dev->dev = dev;
>         dev_set_drvdata(dev, p1_dev);
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         p1_dev->regs = devm_ioremap_resource(dev, res);
>         if (IS_ERR(p1_dev->regs)) {
>                 dev_err(dev, "Failed platform resources map\n");
>                 return PTR_ERR(p1_dev->regs);
>         }
>         dev_dbg(dev, "cam, map_addr=0x%pK\n", p1_dev->regs);
>
>         irq = platform_get_irq(pdev, 0);
>         if (!irq) {
>                 dev_err(dev, "Missing IRQ resources data\n");
>                 return -ENODEV;
>         }
>         ret = devm_request_irq(dev, irq, isp_irq_cam, IRQF_SHARED,
>                                dev_name(dev), p1_dev);
>         if (ret) {
>                 dev_err(dev, "req_irq fail, dev:%s irq=%d\n",
>                         dev->of_node->name, irq);
>                 return ret;
>         }
>         dev_dbg(dev, "Reg. irq=%d, isr:%s\n", irq, dev_driver_string(dev));
>         spin_lock_init(&p1_dev->spinlock_irq);
>
>         p1_dev->num_clks = ARRAY_SIZE(clk_names);
>         p1_dev->clks = devm_kcalloc(dev, p1_dev->num_clks,
>                                     sizeof(*p1_dev->clks), GFP_KERNEL);
>         if (!p1_dev->clks)
>                 return -ENOMEM;
>
>         for (i = 0; i < p1_dev->num_clks; ++i)
>                 p1_dev->clks[i].id = clk_names[i];
>
>         ret = devm_clk_bulk_get(dev, p1_dev->num_clks, p1_dev->clks);
>         if (ret) {
>                 dev_err(dev, "cannot get isp cam clock:%d\n", ret);
>                 return ret;
>         }
>
>         ret = isp_setup_scp_rproc(p1_dev, pdev);
>         if (ret)
>                 return ret;
>
>         pm_runtime_enable(dev);

We also need to call pm_runtime_use_autosuspend() and
pm_runtime_set_autosuspend_delay() before enabling runtime PM. I'd
suggest an autosuspend delay equal to around 2x the time that's needed
to stop and start streaming in total.

[snip]
> > > +static const struct dev_pm_ops mtk_isp_pm_ops = {
> > > +   SET_SYSTEM_SLEEP_PM_OPS(mtk_isp_suspend, mtk_isp_resume)
> > > +   SET_RUNTIME_PM_OPS(mtk_isp_suspend, mtk_isp_resume, NULL)
> >
> > For V4L2 drivers system and runtime PM ops would normally be completely
> > different. Runtime PM ops would be called when the hardware is idle already
> > or is about to become active. System PM ops would be called at system power
> > state change and the hardware might be both idle or active. Please also see
> > my comments to mtk_isp_suspend() and mtk_isp_resume() above.
> >
>
> Here is the new implementation. It should be clear to show the
> difference between system and runtime PM ops.
>
> static const struct dev_pm_ops mtk_isp_pm_ops = {
>         SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>                                 pm_runtime_force_resume)
>         SET_RUNTIME_PM_OPS(mtk_isp_runtime_suspend, mtk_isp_runtime_resume,
> NULL)
> };

That's still not correct. In runtime suspend/resume ops we already are
not streaming anymore, because we call pm_runtime_get/put_*() when
starting and stopping streaming. In system suspend/resume ops we might
be streaming and that's when we need to stop the hardware and wait for
it to finish. Please implement these ops separately.

Best regards,
Tomasz
