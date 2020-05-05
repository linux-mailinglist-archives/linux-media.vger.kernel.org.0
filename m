Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC6D1C5BA1
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 17:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730351AbgEEPiu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 11:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729276AbgEEPit (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 11:38:49 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61652C061A0F;
        Tue,  5 May 2020 08:38:48 -0700 (PDT)
Received: from [IPv6:2804:431:e7cd:1c96:62a8:9ef5:72d1:90eb] (unknown [IPv6:2804:431:e7cd:1c96:62a8:9ef5:72d1:90eb])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4672F2A12F5;
        Tue,  5 May 2020 16:38:37 +0100 (BST)
Subject: Re: [v6, 5/5] media: platform: Add Mediatek ISP P1 V4L2 device driver
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, shik@chromium.org, devicetree@vger.kernel.org,
        Sean.Cheng@mediatek.com, suleiman@chromium.org,
        Pi-Hsun Shih <pihsun@chromium.org>,
        srv_heupstream@mediatek.com, robh@kernel.org, ryan.yu@mediatek.com,
        Jerry-ch.Chen@mediatek.com, frankie.chiu@mediatek.com,
        sj.huang@mediatek.com, yuzhao@chromium.org,
        linux-mediatek@lists.infradead.org, zwisler@chromium.org,
        ddavenport@chromium.org, frederic.chen@mediatek.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        tfiga@chromium.org, hverkuil-cisco@xs4all.nl
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20191219054930.29513-1-jungo.lin@mediatek.com>
 <20191219054930.29513-6-jungo.lin@mediatek.com>
 <6cd0b8e9-2914-9440-b9ec-dbc7e01de5a1@collabora.com>
 <1586397928.8406.66.camel@mtksdccf07>
 <ac2f6375-01f4-34ea-27f2-29a11949d47d@collabora.com>
 <b2c30e560e9b4ec488957ca62bae09fe@mtkmbs01n2.mediatek.inc>
 <1588595278.6897.30.camel@mtksdccf07>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <84f36233-c250-e8a8-779f-ca4350383c67@collabora.com>
Date:   Tue, 5 May 2020 12:38:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588595278.6897.30.camel@mtksdccf07>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/4/20 9:27 AM, Jungo Lin wrote:
> 
> Hi Helen;
> 
> Sorry for late reply.
> Please check my feedback & questions below.
> 
> On Tue, 2020-04-14 at 09:25 -0300, Helen Koike wrote:
>> On 4/8/20 11:05 PM, Jungo Lin wrote:
>>> Hi Helen:
>>>
>>> Thanks for your comments.
>>>
>>> On Tue, 2020-03-31 at 12:34 -0300, Helen Koike wrote:
>>>> Hello Jungo,
>>>>
>>>> I was taking a look at this patch (thanks for the work),
>>>> I didn't look in deep details, but I have some comments, please see
>>>> below. I hope it helps.
>>>>
>>>> On 12/19/19 3:49 AM, Jungo Lin wrote:
>>>>> This patch adds the Mediatek ISP P1 HW control device driver.
>>>>> It handles the ISP HW configuration, provides interrupt handling and
>>>>> initializes the V4L2 device nodes and other V4L2 functions. Moreover,
>>>>> implement standard V4L2 video driver that utilizes V4L2 and media
>>>>> framework APIs. It supports one media device, one sub-device and
>>>>> several video devices during initialization. Moreover, it also connects
>>>>> with sensor and seninf drivers with V4L2 async APIs. Communicate with
>>>>> co-process via SCP communication to compose ISP registers in the
>>>>> firmware.
>>>>>
>>>>> (The current metadata interface used in meta input and partial
>>>>> meta nodes is only a temporary solution to kick off the driver
>>>>> development and is not ready to be reviewed yet.)
>>>>>
>>>>> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
>>>>> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
>>>>> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
>>>>> ---
>>>>> Changes from v6:
>>>>>  - Revise help description for VIDEO_MEDIATEK_ISP_PASS1
>>>>>  - Apply SCP v21 change in P1 driver by Pi-Hsun Shih
>>>>>  - Correct auto suspend timer value for suspend/resume issue
>>>>>  - Increase IPI guard timer to 1 second to avoid false alarm command timeout event
>>>>>  - Fix KE due to no sen-inf sub-device
>>>>> ---
>>>>>  drivers/media/platform/mtk-isp/Kconfig        |   20 +
>>>>>  .../media/platform/mtk-isp/isp_50/Makefile    |    3 +
>>>>>  .../platform/mtk-isp/isp_50/cam/Makefile      |    6 +
>>>>>  .../platform/mtk-isp/isp_50/cam/mtk_cam-hw.c  |  636 +++++
>>>>>  .../platform/mtk-isp/isp_50/cam/mtk_cam-hw.h  |   64 +
>>>>>  .../platform/mtk-isp/isp_50/cam/mtk_cam-ipi.h |  222 ++
>>>>>  .../mtk-isp/isp_50/cam/mtk_cam-regs.h         |   95 +
>>>>>  .../platform/mtk-isp/isp_50/cam/mtk_cam.c     | 2087 +++++++++++++++++
>>>>
>>>> I think I would split this file a bit, to separate which code is being used for the subdevice, which for
>>>> capture, which for metadata, and what is being used to deal with requests.
>>>>
>>>> It would make it easier to review imho.
>>>>
>>>
>>> For file structure design, it was reviewed in the previous patch
>>> serials.
>>> e.g.
>>> https://patchwork.kernel.org/patch/10938137/
>>> If you think it is better, I will modify it.
>>
>> Right, I saw a suggestion to merge two files there.
>>
>> I'm not sure what others think, but I'm used to see a separation per entity, or at least separate subdevices
>> from video devices, it is easier to see which v4l2 functions is being called per entity IMHO.
>> So it reflects a bit the topology.
>> But it is also up to you to see if it improves organization or not, it is just a suggestion.
>>
> 
> Ok, got your point.
> We will discuss how to do internally.
> 
> [snip]
>>>>> +isp_composer_hw_init(p1_dev);
>>>>> +
>>>>> +p1_dev->enqueued_frame_seq_no = 0;
>>>>> +p1_dev->dequeued_frame_seq_no = 0;
>>>>> +p1_dev->composed_frame_seq_no = 0;
>>>>> +p1_dev->sof_count = 0;
>>>>> +
>>>>> +dev_dbg(dev, "%s done\n", __func__);
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +int mtk_isp_hw_release(struct mtk_cam_dev *cam)
>>>>> +{
>>>>> +struct device *dev = cam->dev;
>>>>> +struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);
>>>>> +
>>>>> +isp_composer_hw_deinit(p1_dev);
>>>>> +pm_runtime_mark_last_busy(dev);
>>>>> +pm_runtime_put_autosuspend(dev);
>>>>> +rproc_shutdown(p1_dev->rproc_handle);
>>>>> +
>>>>> +dev_dbg(dev, "%s done\n", __func__);
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +void mtk_isp_req_enqueue(struct mtk_cam_dev *cam,
>>>>> + struct mtk_cam_dev_request *req)
>>>>> +{
>>>>> +struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(cam->dev);
>>>>> +
>>>>> +/* Accumulated frame sequence number */
>>>>> +req->frame_params.frame_seq_no = ++p1_dev->enqueued_frame_seq_no;
>>>>> +
>>>>> +INIT_WORK(&req->frame_work, isp_tx_frame_worker);
>>>>> +queue_work(p1_dev->composer_wq, &req->frame_work);
>>>>> +dev_dbg(cam->dev, "enqueue fd:%s frame_seq_no:%d job cnt:%d\n",
>>>>> +req->req.debug_str, req->frame_params.frame_seq_no,
>>>>> +cam->running_job_count);
>>>>> +}
>>>>> +
>>>>> +static void isp_irq_handle_sof(struct mtk_isp_p1_device *p1_dev,
>>>>> +       unsigned int dequeued_frame_seq_no)
>>>>> +{
>>>>> +dma_addr_t base_addr = p1_dev->composer_iova;
>>>>> +struct device *dev = p1_dev->dev;
>>>>> +struct mtk_cam_dev_request *req;
>>>>> +int composed_frame_seq_no = p1_dev->composed_frame_seq_no;
>>>>> +unsigned int addr_offset;
>>>>> +
>>>>> +/* Send V4L2_EVENT_FRAME_SYNC event */
>>>>> +mtk_cam_dev_event_frame_sync(&p1_dev->cam_dev, dequeued_frame_seq_no);
>>>>> +
>>>>> +p1_dev->sof_count += 1;
>>>>> +/* Save frame information */
>>>>> +p1_dev->dequeued_frame_seq_no = dequeued_frame_seq_no;
>>>>> +
>>>>> +req = mtk_cam_dev_get_req(&p1_dev->cam_dev, dequeued_frame_seq_no);
>>>>> +if (req)
>>>>> +req->timestamp = ktime_get_boottime_ns();
>>>>> +
>>>>> +/* Update CQ base address if needed */
>>>>> +if (composed_frame_seq_no <= dequeued_frame_seq_no) {
>>>>> +dev_dbg(dev,
>>>>> +"SOF_INT_ST, no update, cq_num:%d, frame_seq:%d\n",
>>>>> +composed_frame_seq_no, dequeued_frame_seq_no);
>>>>> +return;
>>>>> +}
>>>>> +addr_offset = MTK_ISP_CQ_ADDRESS_OFFSET *
>>>>> +(dequeued_frame_seq_no % MTK_ISP_CQ_BUFFER_COUNT);
>>>>> +writel(base_addr + addr_offset, p1_dev->regs + REG_CQ_THR0_BASEADDR);
>>>>> +dev_dbg(dev,
>>>>> +"SOF_INT_ST, update next, cq_num:%d, frame_seq:%d cq_addr:0x%x\n",
>>>>> +composed_frame_seq_no, dequeued_frame_seq_no, addr_offset);
>>>>> +}
>>>>> +
>>>>> +static void isp_irq_handle_dma_err(struct mtk_isp_p1_device *p1_dev)
>>>>> +{
>>>>> +u32 val;
>>>>> +
>>>>> +dev_err(p1_dev->dev,
>>>>> +"IMGO:0x%x, RRZO:0x%x, AAO=0x%x, AFO=0x%x, LMVO=0x%x\n",
>>>>> +readl(p1_dev->regs + REG_IMGO_ERR_STAT),
>>>>> +readl(p1_dev->regs + REG_RRZO_ERR_STAT),
>>>>> +readl(p1_dev->regs + REG_AAO_ERR_STAT),
>>>>> +readl(p1_dev->regs + REG_AFO_ERR_STAT),
>>>>> +readl(p1_dev->regs + REG_LMVO_ERR_STAT));
>>>>> +dev_err(p1_dev->dev,
>>>>> +"LCSO=0x%x, PSO=0x%x, FLKO=0x%x, BPCI:0x%x, LSCI=0x%x\n",
>>>>> +readl(p1_dev->regs + REG_LCSO_ERR_STAT),
>>>>> +readl(p1_dev->regs + REG_PSO_ERR_STAT),
>>>>> +readl(p1_dev->regs + REG_FLKO_ERR_STAT),
>>>>> +readl(p1_dev->regs + REG_BPCI_ERR_STAT),
>>>>> +readl(p1_dev->regs + REG_LSCI_ERR_STAT));
>>>>
>>>> I think if would be better to transfor those into dev_dbg and add a counter
>>>> in debugfs.
>>>>
>>>
>>> These error messages are important for debugging.
>>> I suggest to keep in dev_err.
>>
>> I mean, these messages are usefull for debug (as you mentioned yourself), but for an
>> end user not so much, since end users won't know the meaning of those values.
>>
>> For end users a "dma failure" message would be enough, then advanced users can enable
>> debug messages to see more.
> 
> OK.
> Got your point.
> 
>>>
>>> Moreover, could you give more information about debug counter?
>>> I don't get your point.
>>> Do you suggest to accumulate the total count of DMA errors?
>>
>>
>> Yes, you could have a debugfs entry with error counters like:
>>
>> cat /debugfs/mtk_isp/dma_err
>> 8
>>
>> So it is easier if this error happens very frequent or not.
>> In the rkisp1 case we added:
>>
>> /debugfs/rkisp1/data_loss
>> /debugfs/rkisp1/pic_size_error
>> /debugfs/rkisp1/mipi_error
>> /debugfs/rkisp1/stats_error
>> /debugfs/rkisp1/mp_stop_timeout
>> /debugfs/rkisp1/sp_stop_timeout
>> /debugfs/rkisp1/mp_frame_drop
>> /debugfs/rkisp1/sp_frame_drop
>>
>> Also, these error are non fatal, userspace can continue to work (in a way) when they happen,
>> so the idea was not to flood the logs with messages that end users don't care much, if they are frequent.
>>
>> But I'm not sure if this applies well or if it is useful to you case (please don't take my suggestions blindly).
>>
> 
> Ok, we will follow your suggestion.
> 
> 
> [snip]
> 
>>>>> +return;
>>>>> +
>>>>> +dev_dbg(cam->dev, "job done request:%s frame_seq:%d state:%d\n",
>>>>> +req->req.debug_str, req->frame_params.frame_seq_no, state);
>>>>> +
>>>>> +list_for_each_entry_safe(obj, obj_prev, &req->req.objects, list) {
>>>>> +struct vb2_buffer *vb;
>>>>> +struct mtk_cam_dev_buffer *buf;
>>>>> +struct mtk_cam_video_device *node;
>>>>> +
>>>>> +if (!vb2_request_object_is_buffer(obj))
>>>>> +continue;
>>>>> +vb = container_of(obj, struct vb2_buffer, req_obj);
>>>>> +buf = mtk_cam_vb2_buf_to_dev_buf(vb);
>>>>> +node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
>>>>> +spin_lock_irqsave(&node->buf_list_lock, flags);
>>>>> +list_del(&buf->list);
>>>>> +spin_unlock_irqrestore(&node->buf_list_lock, flags);
>>>>> +buf->vbb.sequence = req->frame_params.frame_seq_no;
>>>>> +if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
>>>>> +vb->timestamp = ts_eof;
>>>>> +else
>>>>> +vb->timestamp = req->timestamp;
>>>>> +vb2_buffer_done(&buf->vbb.vb2_buf, state);
>>>>> +}
>>>>> +}
>>>>> +
>>>>> +struct mtk_cam_dev_request *mtk_cam_dev_get_req(struct mtk_cam_dev *cam,
>>>>> +unsigned int frame_seq_no)
>>>>> +{
>>>>> +struct mtk_cam_dev_request *req, *req_prev;
>>>>> +unsigned long flags;
>>>>> +
>>>>> +spin_lock_irqsave(&cam->running_job_lock, flags);
>>>>> +list_for_each_entry_safe(req, req_prev, &cam->running_job_list, list) {
>>>>> +dev_dbg(cam->dev, "frame_seq:%d, get frame_seq:%d\n",
>>>>> +req->frame_params.frame_seq_no, frame_seq_no);
>>>>> +
>>>>> +/* Match by the en-queued request number */
>>>>> +if (req->frame_params.frame_seq_no == frame_seq_no) {
>>>>> +spin_unlock_irqrestore(&cam->running_job_lock, flags);
>>>>> +return req;
>>>>> +}
>>>>> +}
>>>>> +spin_unlock_irqrestore(&cam->running_job_lock, flags);
>>>>> +
>>>>> +return NULL;
>>>>> +}
>>>>> +
>>>>> +void mtk_cam_dev_dequeue_req_frame(struct mtk_cam_dev *cam,
>>>>> +   unsigned int frame_seq_no)
>>>>> +{
>>>>> +struct mtk_cam_dev_request *req, *req_prev;
>>>>> +unsigned long flags;
>>>>> +
>>>>> +spin_lock_irqsave(&cam->running_job_lock, flags);
>>>>> +list_for_each_entry_safe(req, req_prev, &cam->running_job_list, list) {
>>>>> +dev_dbg(cam->dev, "frame_seq:%d, de-queue frame_seq:%d\n",
>>>>> +req->frame_params.frame_seq_no, frame_seq_no);
>>>>> +
>>>>> +/* Match by the en-queued request number */
>>>>> +if (req->frame_params.frame_seq_no == frame_seq_no) {
>>>>> +cam->running_job_count--;
>>>>> +/* Pass to user space */
>>>>> +mtk_cam_dev_job_done(cam, req, VB2_BUF_STATE_DONE);
>>>>> +list_del(&req->list);
>>>>> +break;
>>>>> +} else if (req->frame_params.frame_seq_no < frame_seq_no) {
>>>>> +cam->running_job_count--;
>>>>> +/* Pass to user space for frame drop */
>>>>> +mtk_cam_dev_job_done(cam, req, VB2_BUF_STATE_ERROR);
>>>>> +dev_warn(cam->dev, "frame_seq:%d drop\n",
>>>>> + req->frame_params.frame_seq_no);
>>>>
>>>> maybe a counter in debugfs instead of the warning.
>>>>
>>>
>>> Do you mean to add counter to accumulate the total count of drop frames?
>>
>> please see my comment above.
>>
> 
> Ok, add this in next patch.
> 
>>> Could we add this and also keep this warning message?
>>
>> Userspace would still continue to work when this happens, not sure if it is worthy
>> adding a warn, I would move it to dev_dbg() instead IMHO.
>>
> 
> Ok, revise in next patch.
> 
> [snip]
>>>>> +
>>>>> +static void cal_image_pix_mp(struct mtk_cam_dev *cam, unsigned int node_id,
>>>>> +     struct v4l2_pix_format_mplane *mp)
>>>>> +{
>>>>> +unsigned int bpl, ppl;
>>>>
>>>> bytes per line and pixels per line right?
>>>>
>>>
>>> Yes.
>>>
>>>>> +unsigned int pixel_bits = get_pixel_bits(mp->pixelformat);
>>>>
>>>> wouldn't be easier a get_pixel_bytes() function instead of bits?
>>>>
>>>
>>> Sorry. I didn't get the point.
>>> The unit of return value is bits, not bytes.
>>> Do you suggest move bpl & ppl calculation into get_pixel_bits() and
>>> rename to get_pixel_bytes()?
>>
>> Never mind, I misread it.
>>
> 
> Ok, we will skip this.
> 
> [snip]
>>>>> +unsigned int enabled_dma_ports = cam->enabled_dmas;
>>>>> +int ret;
>>>>> +
>>>>> +/* Get sensor format configuration */
>>>>> +sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>>>> +ret = v4l2_subdev_call(cam->sensor, pad, get_fmt, NULL, &sd_fmt);
>>>>> +if (ret) {
>>>>> +dev_dbg(dev, "sensor g_fmt failed:%d\n", ret);
>>>>> +return ret;
>>>>> +}
>>>>> +sd_width = sd_fmt.format.width;
>>>>> +sd_height = sd_fmt.format.height;
>>>>> +sd_code = sd_fmt.format.code;
>>>>> +dev_dbg(dev, "sd fmt w*h=%d*%d, code=0x%x\n", sd_width, sd_height,
>>>>> +sd_code);
>>>>
>>>> If V4L2_SUBDEV_FL_HAS_DEVNODE is used, then format shouldn't propagate from one node to the other,
>>>> it should be configured from userspace.
>>>>
>>>
>>> Could you explain why?
>>> Moreover, how does configuration from user space?
>>
>> IIUC there are two ways to configure the topology, see Hans comment on https://lkml.org/lkml/2020/2/6/305
>>
>> If you use v4l2_device_register_subdev_nodes(), it exposes a /dev/v4l-subdevX file to userspace
>> in all subdevices you have the flag V4L2_SUBDEV_FL_HAS_DEVNODE (and you have it in the isp node).
>>
>> Which means that if the sensor implements VIDIOC_SUBDEV_S_FMT, part of the subdevices in the topology
>> can be configured by userspace and part can't (which iirc should't be done in the media API).
>>
>> Do you need to use v4l2_device_register_subdev_nodes() ?
>>
>> Also, Jacopo's patchset introduces a v4l2_device_register_ro_subdev_nodes() fuction:
>> https://patchwork.kernel.org/cover/11463183/
>>
>> which would be more appropriated if you don't want userspace to configure the whole pipeline.
>>
> 
> The purpose of P1 sub-device is to provide V4L2 event subscribe with
> V4L2_EVENT_FRAME_SYNC event for user space. It is the same
> implementation as blow link.
> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/omap3isp/ispccdc.c#L1853
> 
> As you suggest, we may use v4l2_device_register_ro_subdev_nodes() more
> precisely.
> 
> [snip]
> 
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static void mtk_cam_vb2_buf_queue(struct vb2_buffer *vb)
>>>>> +{
>>>>> +struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
>>>>> +struct mtk_cam_dev_buffer *buf = mtk_cam_vb2_buf_to_dev_buf(vb);
>>>>> +struct mtk_cam_dev_request *req = mtk_cam_req_to_dev_req(vb->request);
>>>>> +struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
>>>>> +struct device *dev = cam->dev;
>>>>> +unsigned long flags;
>>>>> +
>>>>> +dev_dbg(dev, "%s: node:%d fd:%d idx:%d\n", __func__,
>>>>> +node->id, buf->vbb.request_fd, buf->vbb.vb2_buf.index);
>>>>> +
>>>>> +/* added the buffer into the tracking list */
>>>>> +spin_lock_irqsave(&node->buf_list_lock, flags);
>>>>> +list_add_tail(&buf->list, &node->buf_list);
>>>>> +spin_unlock_irqrestore(&node->buf_list_lock, flags);
>>>>> +
>>>>> +/* update buffer internal address */
>>>>> +req->frame_params.dma_bufs[buf->node_id].iova = buf->daddr;
>>>>> +req->frame_params.dma_bufs[buf->node_id].scp_addr = buf->scp_addr;
>>>>
>>>> isn't it an issue if userspace queue two buffers for the same video device in the same request?
>>>>
>>>> vb2_request_queue(req) will call all the .buf_queue() callbacks, and only the last buffer in the list
>>>> will be at req->frame_params.dma_bufs[buf->node_id], no?
>>>>
>>>> Also, what happens if a request doesn't contain buffers for all node_ids ? Will it put data in the previous programmed
>>>> buffer?
>>>>
>>>> Please, let me know if these questions doesn't make sense, I'm not that familiar with the request API internals.
>>>>
>>>
>>> 1. yes, it is a issue if userspace queues two buffers for the same video
>>> device with the same request FD.
>>>
>>> 2. All buffers which are belonged different to different video devices
>>> in the request list will be updated to req->frame_params.dma_bufs by
>>> buf->node_id.
>>>
>>> 3. It is not allowed for userspace to queue partial buffers for all
>>> enabled video devices. If it happens, it may trigger DMA errors for this
>>> request.
>>
>> So I guess you should implement a custom .req_validate() to enforce userspace follows this.
>>
> 
> For case 1, it is handled in the vb2_queue_or_prepare_buf.
> https://elixir.bootlin.com/linux/latest/source/drivers/media/common/videobuf2/videobuf2-v4l2.c#L453

Ok, thanks for the link.

> 
> For case 3, I need to correct my previous answer. This behavior should
> be OK for outputted DMA. We have frame buffer controller for each
> outputted DMAs. So it means the tuning buffer node is mandatory for each
> request, other nodes are optional. We will implement this
> in .req_validate to check.
> 
>>>
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_vb2_buf_init(struct vb2_buffer *vb)
>>>>> +{
>>>>> +struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
>>>>> +struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
>>>>> +struct device *dev = cam->dev;
>>>>> +struct mtk_cam_dev_buffer *buf;
>>>>> +dma_addr_t addr;
>>>>> +
>>>>> +buf = mtk_cam_vb2_buf_to_dev_buf(vb);
>>>>> +buf->node_id = node->id;
>>>>> +buf->daddr = vb2_dma_contig_plane_dma_addr(vb, 0);
>>>>> +buf->scp_addr = 0;
>>>>> +
>>>>> +/* SCP address is only valid for meta input buffer */
>>>>> +if (!node->desc.smem_alloc)
>>>>> +return 0;
>>>>> +
>>>>> +buf = mtk_cam_vb2_buf_to_dev_buf(vb);
>>>>> +/* Use coherent address to get iova address */
>>>>> +addr = dma_map_resource(dev, buf->daddr, vb->planes[0].length,
>>>>> +DMA_BIDIRECTIONAL, DMA_ATTR_SKIP_CPU_SYNC);> +if (dma_mapping_error(dev, addr)) {
>>>>> +dev_err(dev, "failed to map meta addr:%pad\n", &buf->daddr);
>>>>> +return -EFAULT;
>>>>> +}
>>>>> +buf->scp_addr = buf->daddr;
>>>>> +buf->daddr = addr;
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_vb2_buf_prepare(struct vb2_buffer *vb)
>>>>> +{
>>>>> +struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
>>>>> +struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
>>>>> +struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
>>>>> +const struct v4l2_format *fmt = &node->vdev_fmt;
>>>>> +unsigned int size;
>>>>> +
>>>>> +if (vb->vb2_queue->type == V4L2_BUF_TYPE_META_OUTPUT ||
>>>>> +    vb->vb2_queue->type == V4L2_BUF_TYPE_META_CAPTURE)
>>>>> +size = fmt->fmt.meta.buffersize;
>>>>> +else
>>>>> +size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
>>>>> +
>>>>> +if (vb2_plane_size(vb, 0) < size) {
>>>>> +dev_dbg(cam->dev, "plane size is too small:%lu<%u\n",
>>>>> +vb2_plane_size(vb, 0), size);
>>>>> +return -EINVAL;
>>>>> +}
>>>>> +
>>>>> +if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
>>>>> +if (vb2_get_plane_payload(vb, 0) != size) {
>>>>> +dev_dbg(cam->dev, "plane payload is mismatch:%lu:%u\n",
>>>>> +vb2_get_plane_payload(vb, 0), size);
>>>>> +return -EINVAL;
>>>>> +}
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +v4l2_buf->field = V4L2_FIELD_NONE;
>>>>> +vb2_set_plane_payload(vb, 0, size);
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static void mtk_cam_vb2_buf_cleanup(struct vb2_buffer *vb)
>>>>> +{
>>>>> +struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
>>>>> +struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
>>>>> +struct mtk_cam_dev_buffer *buf;
>>>>> +struct device *dev = cam->dev;
>>>>> +
>>>>> +if (!node->desc.smem_alloc)
>>>>> +return;
>>>>> +
>>>>> +buf = mtk_cam_vb2_buf_to_dev_buf(vb);
>>>>> +dma_unmap_page_attrs(dev, buf->daddr,
>>>>> +     vb->planes[0].length,
>>>>> +     DMA_BIDIRECTIONAL,
>>>>> +     DMA_ATTR_SKIP_CPU_SYNC);
>>>>> +}
>>>>> +
>>>>> +static void mtk_cam_vb2_request_complete(struct vb2_buffer *vb)
>>>>> +{
>>>>> +struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
>>>>> +
>>>>> +dev_dbg(cam->dev, "%s\n", __func__);
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_vb2_queue_setup(struct vb2_queue *vq,
>>>>> +   unsigned int *num_buffers,
>>>>> +   unsigned int *num_planes,
>>>>> +   unsigned int sizes[],
>>>>> +   struct device *alloc_devs[])
>>>>> +{
>>>>> +struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
>>>>> +unsigned int max_buffer_count = node->desc.max_buf_count;
>>>>> +const struct v4l2_format *fmt = &node->vdev_fmt;
>>>>> +unsigned int size;
>>>>> +
>>>>> +/* Check the limitation of buffer size */
>>>>> +if (max_buffer_count)
>>>>> +*num_buffers = clamp_val(*num_buffers, 1, max_buffer_count);
>>>>> +
>>>>> +if (node->desc.smem_alloc)
>>>>> +vq->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
>>>>> +
>>>>> +if (vq->type == V4L2_BUF_TYPE_META_OUTPUT ||
>>>>> +    vq->type == V4L2_BUF_TYPE_META_CAPTURE)
>>>>> +size = fmt->fmt.meta.buffersize;
>>>>> +else
>>>>> +size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
>>>>> +
>>>>> +/* Add for q.create_bufs with fmt.g_sizeimage(p) / 2 test */
>>>>> +if (*num_planes) {
>>>>> +if (sizes[0] < size || *num_planes != 1)
>>>>> +return -EINVAL;
>>>>> +} else {
>>>>> +*num_planes = 1;
>>>>> +sizes[0] = size;
>>>>> +}
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static void mtk_cam_vb2_return_all_buffers(struct mtk_cam_dev *cam,
>>>>> +   struct mtk_cam_video_device *node,
>>>>> +   enum vb2_buffer_state state)
>>>>> +{
>>>>> +struct mtk_cam_dev_buffer *buf, *buf_prev;
>>>>> +unsigned long flags;
>>>>> +
>>>>> +spin_lock_irqsave(&node->buf_list_lock, flags);
>>>>> +list_for_each_entry_safe(buf, buf_prev, &node->buf_list, list) {
>>>>> +list_del(&buf->list);
>>>>> +vb2_buffer_done(&buf->vbb.vb2_buf, state);
>>>>> +}
>>>>> +spin_unlock_irqrestore(&node->buf_list_lock, flags);
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_vb2_start_streaming(struct vb2_queue *vq,
>>>>> +       unsigned int count)
>>>>> +{
>>>>> +struct mtk_cam_dev *cam = vb2_get_drv_priv(vq);
>>>>> +struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
>>>>> +struct device *dev = cam->dev;
>>>>> +int ret;
>>>>> +
>>>>> +if (!node->enabled) {
>>>>> +dev_err(dev, "Node:%d is not enabled\n", node->id);
>>>>> +ret = -ENOLINK;
>>>>> +goto fail_ret_buf;
>>>>> +}
>>>>> +
>>>>> +mutex_lock(&cam->op_lock);
>>>>> +/* Start streaming of the whole pipeline now*/
>>>>> +if (!cam->pipeline.streaming_count) {
>>>>
>>>> No need for this check, vb2 won't call .start_streaming() twice without stop_streaming() in between.
>>>>
>>>
>>> The check is designed to start the media pipeline when we start
>>> streaming on the first node. You could refer the detail in below link.
>>>
>>> https://patchwork.kernel.org/patch/10985819/
>>
>> right, ok, this is when enabling streaming from multiple nodes.
>>
>> media_pipeline_start() is usually called for every stream that starts.
>>
>> So cam->pipeline.streaming_count can reflect the number of streams enabled.
>>
>> So maybe you don't need cam->stream_count.
>>
> 
> Ok, revise in next patch.
> 
>>>
>>>
>>>>> +ret = media_pipeline_start(&node->vdev.entity, &cam->pipeline);
>>>>> +if (ret) {
>>>>> +dev_err(dev, "failed to start pipeline:%d\n", ret);
>>>>> +goto fail_unlock;
>>>>> +}
>>>>> +mtk_cam_dev_init_stream(cam);
>>>>> +ret = mtk_isp_hw_init(cam);
>>
>> Would it make sense to move this to s_stream in the ISP's subdevice ?
>>
> 
> No, we like to initialize our ISP firmware here when the first video
> node is streaming on. It is too late to initialize when all video nodes
> are streaming-on.
> 
>>>>> +if (ret) {
>>>>> +dev_err(dev, "failed to init HW:%d\n", ret);
>>>>> +goto fail_stop_pipeline;
>>>>> +}
>>>>> +}
>>>>> +
>>>>> +/* Media links are fixed after media_pipeline_start */
>>>>> +cam->stream_count++;
>>>>> +dev_dbg(dev, "%s: count info:%d:%d\n", __func__, cam->stream_count,
>>>>> +cam->enabled_count);
>>>>> +if (cam->stream_count < cam->enabled_count) {
>>
>> I'm also wondering, since you need to wait for all the enabled video devices
>> to start streaming, shouldn't this be done inside a request? So you can enable
>> all of them at once?
>>
>> Also, like this you wouldn't need to check enabled links to query for enabled video
>> nodes, you can just enable the ones in the request.
>>
>> make sense?
>>
> 
> Sorry, I didn't get your point about this comment.
> Which request could we handle this logic?
> Do you mean move this logic into mtk_cam_req_queue function?

Sorry me, I thought we could use request api to call VIDIOC_STREAMON for multiple capture nodes,
but it seems we can't (please see my reply on the cover letter).

Regards,
Helen

> 
>>>>> +mutex_unlock(&cam->op_lock);
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +/* Stream on sub-devices node */
>>>>> +ret = v4l2_subdev_call(&cam->subdev, video, s_stream, 1);
>>>>> +if (ret)
>>>>> +goto fail_no_stream;
>>>>> +mutex_unlock(&cam->op_lock);
>>>>> +
>>>>> +return 0;
>>>>> +
>>>>> +fail_no_stream:
>>>>> +cam->stream_count--;
>>>>> +fail_stop_pipeline:
>>>>> +if (cam->stream_count == 0)
>>>>> +media_pipeline_stop(&node->vdev.entity);
>>>>> +fail_unlock:
>>>>> +mutex_unlock(&cam->op_lock);
>>>>> +fail_ret_buf:
>>>>> +mtk_cam_vb2_return_all_buffers(cam, node, VB2_BUF_STATE_QUEUED);
>>>>> +
>>>>> +return ret;
>>>>> +}
>>>>> +
>>>>> +static void mtk_cam_vb2_stop_streaming(struct vb2_queue *vq)
>>>>> +{
>>>>> +struct mtk_cam_dev *cam = vb2_get_drv_priv(vq);
>>>>> +struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
>>>>> +struct device *dev = cam->dev;
>>>>> +
>>>>> +mutex_lock(&cam->op_lock);
>>>>> +dev_dbg(dev, "%s node:%d count info:%d\n", __func__, node->id,
>>>>> +cam->stream_count);
>>>>> +/* Check the first node to stream-off */
>>>>> +if (cam->stream_count == cam->enabled_count)
>>>>> +v4l2_subdev_call(&cam->subdev, video, s_stream, 0);
>>>>> +
>>>>> +mtk_cam_vb2_return_all_buffers(cam, node, VB2_BUF_STATE_ERROR);
>>>>> +cam->stream_count--;
>>>>> +if (cam->stream_count) {
>>>>> +mutex_unlock(&cam->op_lock);
>>>>> +return;
>>>>> +}
>>>>> +mutex_unlock(&cam->op_lock);
>>>>> +
>>>>> +mtk_cam_dev_req_cleanup(cam);
>>>>> +media_pipeline_stop(&node->vdev.entity);
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_vidioc_querycap(struct file *file, void *fh,
>>>>> +   struct v4l2_capability *cap)
>>>>> +{
>>>>> +struct mtk_cam_dev *cam = video_drvdata(file);
>>>>> +
>>>>> +strscpy(cap->driver, dev_driver_string(cam->dev), sizeof(cap->driver));
>>>>> +strscpy(cap->card, dev_driver_string(cam->dev), sizeof(cap->card));
>>>>> +snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
>>>>> + dev_name(cam->dev));
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_vidioc_enum_fmt(struct file *file, void *fh,
>>>>> +   struct v4l2_fmtdesc *f)
>>>>> +{
>>>>> +struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
>>>>> +
>>>>> +if (f->index >= node->desc.num_fmts)
>>>>> +return -EINVAL;
>>>>> +
>>>>> +/* f->description is filled in v4l_fill_fmtdesc function */
>>>>> +f->pixelformat = node->desc.fmts[f->index].fmt.pix_mp.pixelformat;
>>>>> +f->flags = 0;
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_vidioc_g_fmt(struct file *file, void *fh,
>>>>> +struct v4l2_format *f)
>>>>> +{
>>>>> +struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
>>>>> +
>>>>> +f->fmt = node->vdev_fmt.fmt;
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_vidioc_try_fmt(struct file *file, void *fh,
>>>>> +  struct v4l2_format *f)
>>>>> +{
>>>>> +struct mtk_cam_dev *cam = video_drvdata(file);
>>>>> +struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
>>>>> +struct device *dev = cam->dev;
>>>>> +const struct v4l2_format *dev_fmt;
>>>>> +struct v4l2_format try_fmt;
>>>>> +
>>>>> +memset(&try_fmt, 0, sizeof(try_fmt));
>>>>> +try_fmt.type = f->type;
>>>>> +
>>>>> +/* Validate pixelformat */
>>>>> +dev_fmt = mtk_cam_dev_find_fmt(&node->desc, f->fmt.pix_mp.pixelformat);
>>>>> +if (!dev_fmt) {
>>>>> +dev_dbg(dev, "unknown fmt:%d\n", f->fmt.pix_mp.pixelformat);
>>>>> +dev_fmt = &node->desc.fmts[node->desc.default_fmt_idx];
>>>>> +}
>>>>> +try_fmt.fmt.pix_mp.pixelformat = dev_fmt->fmt.pix_mp.pixelformat;
>>>>> +
>>>>> +/* Validate image width & height range */
>>>>> +try_fmt.fmt.pix_mp.width = clamp_val(f->fmt.pix_mp.width,
>>>>> +     IMG_MIN_WIDTH, IMG_MAX_WIDTH);
>>>>> +try_fmt.fmt.pix_mp.height = clamp_val(f->fmt.pix_mp.height,
>>>>> +      IMG_MIN_HEIGHT, IMG_MAX_HEIGHT);
>>>>> +/* 4 bytes alignment for width */
>>>>> +try_fmt.fmt.pix_mp.width = ALIGN(try_fmt.fmt.pix_mp.width, 4);
>>>>> +
>>>>> +/* Only support one plane */
>>>>> +try_fmt.fmt.pix_mp.num_planes = 1;
>>>>> +
>>>>> +/* bytesperline & sizeimage calculation */
>>>>> +cal_image_pix_mp(cam, node->id, &try_fmt.fmt.pix_mp);
>>>>> +
>>>>> +/* Constant format fields */
>>>>> +try_fmt.fmt.pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
>>>>> +try_fmt.fmt.pix_mp.field = V4L2_FIELD_NONE;
>>>>> +try_fmt.fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>>>>> +try_fmt.fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>>>>> +try_fmt.fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
>>>>> +
>>>>> +*f = try_fmt;
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_vidioc_s_fmt(struct file *file, void *fh,
>>>>> +struct v4l2_format *f)
>>>>> +{
>>>>> +struct mtk_cam_dev *cam = video_drvdata(file);
>>>>> +struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
>>>>> +
>>>>> +if (vb2_is_busy(node->vdev.queue)) {
>>>>> +dev_dbg(cam->dev, "%s: queue is busy\n", __func__);
>>>>> +return -EBUSY;
>>>>> +}
>>>>> +
>>>>> +/* Get the valid format */
>>>>> +mtk_cam_vidioc_try_fmt(file, fh, f);
>>>>> +/* Configure to video device */
>>>>> +node->vdev_fmt = *f;
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_vidioc_enum_framesizes(struct file *filp, void *priv,
>>>>> +  struct v4l2_frmsizeenum *sizes)
>>>>> +{
>>>>> +struct mtk_cam_video_device *node = file_to_mtk_cam_node(filp);
>>>>> +const struct v4l2_format *dev_fmt;
>>>>> +
>>>>> +dev_fmt = mtk_cam_dev_find_fmt(&node->desc, sizes->pixel_format);
>>>>> +if (!dev_fmt || sizes->index)
>>>>> +return -EINVAL;
>>>>> +
>>>>> +sizes->type = node->desc.frmsizes->type;
>>>>> +memcpy(&sizes->stepwise, &node->desc.frmsizes->stepwise,
>>>>> +       sizeof(sizes->stepwise));
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_vidioc_meta_enum_fmt(struct file *file, void *fh,
>>>>> +struct v4l2_fmtdesc *f)
>>>>> +{
>>>>> +struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
>>>>> +
>>>>> +if (f->index)
>>>>> +return -EINVAL;
>>>>> +
>>>>> +/* f->description is filled in v4l_fill_fmtdesc function */
>>>>> +f->pixelformat = node->vdev_fmt.fmt.meta.dataformat;
>>>>> +f->flags = 0;
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_vidioc_g_meta_fmt(struct file *file, void *fh,
>>>>> +     struct v4l2_format *f)
>>>>> +{
>>>>> +struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
>>>>> +
>>>>> +f->fmt.meta.dataformat = node->vdev_fmt.fmt.meta.dataformat;
>>>>> +f->fmt.meta.buffersize = node->vdev_fmt.fmt.meta.buffersize;
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static const struct v4l2_subdev_core_ops mtk_cam_subdev_core_ops = {
>>>>> +.subscribe_event = mtk_cam_sd_subscribe_event,
>>>>> +.unsubscribe_event = v4l2_event_subdev_unsubscribe,
>>>>> +};
>>>>> +
>>>>> +static const struct v4l2_subdev_video_ops mtk_cam_subdev_video_ops = {
>>>>> +.s_stream =  mtk_cam_sd_s_stream,
>>>>> +};
>>>>> +
>>>>> +static const struct v4l2_subdev_ops mtk_cam_subdev_ops = {
>>>>> +.core = &mtk_cam_subdev_core_ops,
>>>>> +.video = &mtk_cam_subdev_video_ops,
>>>>> +};
>>>>
>>>> hmm, since this subdevice is exposed with V4L2_SUBDEV_FL_HAS_DEVNODE,
>>>> I wonder if pad ops shouldn't be implemented too (to be verified).
>>>>
>>>
>>> Ok, I will investigate this.
>>>
>>>>> +
>>>>> +static const struct media_entity_operations mtk_cam_media_entity_ops = {
>>>>> +.link_setup = mtk_cam_media_link_setup,
>>>>> +.link_validate = v4l2_subdev_link_validate,
>>>>> +};
>>>>> +
>>>>> +static const struct vb2_ops mtk_cam_vb2_ops = {
>>>>> +.queue_setup = mtk_cam_vb2_queue_setup,
>>>>> +.wait_prepare = vb2_ops_wait_prepare,
>>>>> +.wait_finish = vb2_ops_wait_finish,
>>>>> +.buf_init = mtk_cam_vb2_buf_init,
>>>>> +.buf_prepare = mtk_cam_vb2_buf_prepare,
>>>>> +.start_streaming = mtk_cam_vb2_start_streaming,
>>>>> +.stop_streaming = mtk_cam_vb2_stop_streaming,
>>>>> +.buf_queue = mtk_cam_vb2_buf_queue,
>>>>> +.buf_cleanup = mtk_cam_vb2_buf_cleanup,
>>>>> +.buf_request_complete = mtk_cam_vb2_request_complete,
>>>>> +};> +
>>>>> +static const struct v4l2_file_operations mtk_cam_v4l2_fops = {
>>>>> +.unlocked_ioctl = video_ioctl2,
>>>>> +.open = v4l2_fh_open,
>>>>> +.release = vb2_fop_release,
>>>>> +.poll = vb2_fop_poll,
>>>>> +.mmap = vb2_fop_mmap,
>>>>> +#ifdef CONFIG_COMPAT
>>>>> +.compat_ioctl32 = v4l2_compat_ioctl32,
>>>>> +#endif
>>>>> +};
>>>>> +
>>>>> +static const struct media_device_ops mtk_cam_media_ops = {
>>>>> +.req_alloc = mtk_cam_req_alloc,
>>>>> +.req_free = mtk_cam_req_free,
>>>>> +.req_validate = vb2_request_validate,
>>>>> +.req_queue = mtk_cam_req_queue,
>>>>> +};
>>>>> +
>>>>> +static int mtk_cam_media_register(struct mtk_cam_dev *cam,
>>>>> +  struct media_device *media_dev)
>>>>> +{
>>>>> +/* Reserved MTK_CAM_CIO_PAD_SINK + 1 pads to use */
>>>>> +unsigned int num_pads = MTK_CAM_CIO_PAD_SINK + 1;
>>>>> +struct device *dev = cam->dev;
>>>>> +int i, ret;
>>>>> +
>>>>> +media_dev->dev = cam->dev;
>>>>> +strscpy(media_dev->model, dev_driver_string(dev),
>>>>> +sizeof(media_dev->model));
>>>>> +snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
>>>>> + "platform:%s", dev_name(dev));
>>>>> +media_dev->hw_revision = 0;
>>>>> +media_device_init(media_dev);
>>>>> +media_dev->ops = &mtk_cam_media_ops;
>>>>> +
>>>>> +ret = media_device_register(media_dev);
>>>>> +if (ret) {
>>>>> +dev_err(dev, "failed to register media device:%d\n", ret);
>>>>> +return ret;
>>>>> +}
>>>>> +
>>>>> +/* Initialize subdev pads */
>>>>> +cam->subdev_pads = devm_kcalloc(dev, num_pads,
>>>>> +sizeof(*cam->subdev_pads),
>>>>> +GFP_KERNEL);
>>>>> +if (!cam->subdev_pads) {
>>>>> +dev_err(dev, "failed to allocate subdev_pads\n");
>>>>> +ret = -ENOMEM;
>>>>> +goto fail_media_unreg;
>>>>> +}
>>>>> +
>>>>> +ret = media_entity_pads_init(&cam->subdev.entity, num_pads,
>>>>> +     cam->subdev_pads);
>>>>> +if (ret) {
>>>>> +dev_err(dev, "failed to initialize media pads:%d\n", ret);
>>>>> +goto fail_media_unreg;
>>>>> +}
>>>>> +
>>>>> +/* Initialize all pads with MEDIA_PAD_FL_SOURCE */
>>>>> +for (i = 0; i < num_pads; i++)
>>>>> +cam->subdev_pads[i].flags = MEDIA_PAD_FL_SOURCE;
>>>>> +
>>>>> +/* Customize the last one pad as CIO sink pad. */
>>>>> +cam->subdev_pads[MTK_CAM_CIO_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>>>>> +
>>>>> +return 0;
>>>>> +
>>>>> +fail_media_unreg:
>>>>> +media_device_unregister(&cam->media_dev);
>>>>> +media_device_cleanup(&cam->media_dev);
>>>>> +
>>>>> +return ret;
>>>>> +}
>>>>> +
>>>>> +static int
>>>>> +mtk_cam_video_register_device(struct mtk_cam_dev *cam,
>>>>> +      struct mtk_cam_video_device *node)
>>>>> +{
>>>>> +struct device *dev = cam->dev;
>>>>> +struct video_device *vdev = &node->vdev;
>>>>> +struct vb2_queue *vbq = &node->vbq;
>>>>> +unsigned int output = V4L2_TYPE_IS_OUTPUT(node->desc.buf_type);
>>>>> +unsigned int link_flags = node->desc.link_flags;
>>>>> +int ret;
>>>>> +
>>>>> +/* Initialize mtk_cam_video_device */
>>>>> +if (link_flags & MEDIA_LNK_FL_IMMUTABLE)
>>>>> +node->enabled = true;
>>>>> +else
>>>>> +node->enabled = false;
>>>>> +mtk_cam_dev_load_default_fmt(cam, &node->desc, &node->vdev_fmt);
>>>>> +
>>>>> +cam->subdev_pads[node->id].flags = output ?
>>>>> +MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
>>>>> +
>>>>> +/* Initialize media entities */
>>>>> +ret = media_entity_pads_init(&vdev->entity, 1, &node->vdev_pad);
>>>>> +if (ret) {
>>>>> +dev_err(dev, "failed to initialize media pad:%d\n", ret);
>>>>> +return ret;
>>>>> +}
>>>>> +node->vdev_pad.flags = output ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
>>>>> +
>>>>> +/* Initialize vbq */
>>>>> +vbq->type = node->desc.buf_type;
>>>>> +if (vbq->type == V4L2_BUF_TYPE_META_OUTPUT)
>>>>> +vbq->io_modes = VB2_MMAP;
>>>>> +else
>>>>> +vbq->io_modes = VB2_MMAP | VB2_DMABUF;
>>>>> +
>>>>> +if (node->desc.smem_alloc) {
>>>>> +vbq->bidirectional = 1;
>>>>> +vbq->dev = cam->smem_dev;
>>>>> +} else {
>>>>> +vbq->dev = dev;
>>>>> +}
>>>>> +vbq->ops = &mtk_cam_vb2_ops;
>>>>> +vbq->mem_ops = &vb2_dma_contig_memops;
>>>>> +vbq->buf_struct_size = sizeof(struct mtk_cam_dev_buffer);
>>>>> +vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_BOOTIME;
>>>>> +if (output)
>>>>> +vbq->timestamp_flags |= V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
>>>>> +else
>>>>> +vbq->timestamp_flags |= V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
>>>>> +/* No minimum buffers limitation */
>>>>> +vbq->min_buffers_needed = 0;
>>>>> +vbq->drv_priv = cam;
>>>>> +vbq->lock = &node->vdev_lock;
>>>>> +vbq->supports_requests = true;
>>>>> +vbq->requires_requests = true;
>>>>> +
>>>>> +ret = vb2_queue_init(vbq);
>>>>> +if (ret) {
>>>>> +dev_err(dev, "failed to init. vb2 queue:%d\n", ret);
>>>>> +goto fail_media_clean;
>>>>> +}
>>>>> +
>>>>> +/* Initialize vdev */
>>>>> +snprintf(vdev->name, sizeof(vdev->name), "%s %s",
>>>>> + dev_driver_string(dev), node->desc.name);
>>>>> +/* set cap/type/ioctl_ops of the video device */
>>>>> +vdev->device_caps = node->desc.cap | V4L2_CAP_STREAMING;
>>>>> +vdev->ioctl_ops = node->desc.ioctl_ops;
>>>>> +vdev->fops = &mtk_cam_v4l2_fops;
>>>>> +vdev->release = video_device_release_empty;
>>>>> +vdev->lock = &node->vdev_lock;
>>>>> +vdev->v4l2_dev = &cam->v4l2_dev;
>>>>> +vdev->queue = &node->vbq;
>>>>> +vdev->vfl_dir = output ? VFL_DIR_TX : VFL_DIR_RX;
>>>>> +vdev->entity.function = MEDIA_ENT_F_IO_V4L;
>>>>> +vdev->entity.ops = NULL;
>>>>> +video_set_drvdata(vdev, cam);
>>>>> +dev_dbg(dev, "registered vdev:%d:%s\n", node->id, vdev->name);
>>>>> +
>>>>> +/* Initialize miscellaneous variables */
>>>>> +mutex_init(&node->vdev_lock);
>>>>> +INIT_LIST_HEAD(&node->buf_list);
>>>>> +spin_lock_init(&node->buf_list_lock);
>>>>> +
>>>>> +ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
>>>>> +if (ret) {
>>>>> +dev_err(dev, "failed to register vde:%d\n", ret);
>>>>> +goto fail_vb2_rel;
>>>>> +}
>>>>> +
>>>>> +/* Create link between video node and the subdev pad */
>>>>> +if (output) {
>>>>> +ret = media_create_pad_link(&vdev->entity, 0,
>>>>> +    &cam->subdev.entity,
>>>>> +    node->id, link_flags);
>>>>> +} else {
>>>>> +ret = media_create_pad_link(&cam->subdev.entity,
>>>>> +    node->id, &vdev->entity, 0,
>>>>> +    link_flags);
>>>>> +}
>>>>
>>>> No need for the curly braces.
>>>>
>>>
>>> Revised in next patch.
>>>
>>>>> +if (ret)
>>>>> +goto fail_vdev_ureg;
>>>>> +
>>>>> +return 0;
>>>>> +
>>>>> +fail_vdev_ureg:
>>>>> +video_unregister_device(vdev);
>>>>> +fail_vb2_rel:
>>>>> +mutex_destroy(&node->vdev_lock);
>>>>> +vb2_queue_release(vbq);
>>>>> +fail_media_clean:
>>>>> +media_entity_cleanup(&vdev->entity);
>>>>> +
>>>>> +return ret;
>>>>> +}
>>>>> +
>>>>> +static void
>>>>> +mtk_cam_video_unregister_device(struct mtk_cam_video_device *node)
>>>>> +{
>>>>> +video_unregister_device(&node->vdev);
>>>>> +vb2_queue_release(&node->vbq);
>>>>> +media_entity_cleanup(&node->vdev.entity);
>>>>> +mutex_destroy(&node->vdev_lock);
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_v4l2_register(struct mtk_cam_dev *cam)
>>>>> +{
>>>>> +struct device *dev = cam->dev;
>>>>> +int i, ret;
>>>>> +
>>>>> +/* Set up media device & pads */
>>>>> +ret = mtk_cam_media_register(cam, &cam->media_dev);
>>>>> +if (ret)
>>>>> +return ret;
>>>>> +dev_info(dev, "Registered media%d\n", cam->media_dev.devnode->minor);
>>>>> +
>>>>> +/* Set up v4l2 device */
>>>>> +cam->v4l2_dev.mdev = &cam->media_dev;
>>>>> +ret = v4l2_device_register(dev, &cam->v4l2_dev);
>>>>> +if (ret) {
>>>>> +dev_err(dev, "failed to register V4L2 device:%d\n", ret);
>>>>> +goto fail_media_unreg;
>>>>> +}
>>>>> +dev_info(dev, "Registered %s\n", cam->v4l2_dev.name);
>>>>> +
>>>>> +/* Initialize subdev */
>>>>> +v4l2_subdev_init(&cam->subdev, &mtk_cam_subdev_ops);
>>>>> +cam->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>>>>> +cam->subdev.entity.ops = &mtk_cam_media_entity_ops;
>>>>> +cam->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
>>>>> +V4L2_SUBDEV_FL_HAS_EVENTS;
>>>>> +snprintf(cam->subdev.name, sizeof(cam->subdev.name),
>>>>> + "%s", dev_driver_string(dev));
>>>>> +v4l2_set_subdevdata(&cam->subdev, cam);
>>>>> +
>>>>> +ret = v4l2_device_register_subdev(&cam->v4l2_dev, &cam->subdev);
>>>>> +if (ret) {
>>>>> +dev_err(dev, "failed to initialize subdev:%d\n", ret);
>>>>> +goto fail_clean_media_entiy;
>>>>> +}
>>>>> +dev_dbg(dev, "registered %s\n", cam->subdev.name);
>>>>> +
>>>>> +/* Create video nodes and links */
>>>>> +for (i = 0; i < MTK_CAM_P1_TOTAL_NODES; i++) {
>>>>> +struct mtk_cam_video_device *node = &cam->vdev_nodes[i];
>>>>> +
>>>>> +node->id = node->desc.id;
>>>>> +ret = mtk_cam_video_register_device(cam, node);
>>>>> +if (ret)
>>>>> +goto fail_vdev_unreg;
>>>>> +}
>>>>> +vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
>>>>> +
>>>>> +return 0;
>>>>> +
>>>>> +fail_vdev_unreg:
>>>>> +for (i--; i >= 0; i--)
>>>>> +mtk_cam_video_unregister_device(&cam->vdev_nodes[i]);
>>>>> +fail_clean_media_entiy:
>>>>> +media_entity_cleanup(&cam->subdev.entity);
>>>>> +v4l2_device_unregister(&cam->v4l2_dev);
>>>>> +fail_media_unreg:
>>>>> +media_device_unregister(&cam->media_dev);
>>>>> +media_device_cleanup(&cam->media_dev);
>>>>> +
>>>>> +return ret;
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_v4l2_unregister(struct mtk_cam_dev *cam)
>>>>> +{
>>>>> +int i;
>>>>> +
>>>>> +for (i = 0; i < MTK_CAM_P1_TOTAL_NODES; i++)
>>>>> +mtk_cam_video_unregister_device(&cam->vdev_nodes[i]);
>>>>> +
>>>>> +vb2_dma_contig_clear_max_seg_size(cam->dev);
>>>>> +v4l2_device_unregister_subdev(&cam->subdev);
>>>>> +v4l2_device_unregister(&cam->v4l2_dev);
>>>>> +media_entity_cleanup(&cam->subdev.entity);
>>>>> +media_device_unregister(&cam->media_dev);
>>>>> +media_device_cleanup(&cam->media_dev);
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_dev_notifier_bound(struct v4l2_async_notifier *notifier,
>>>>> +      struct v4l2_subdev *sd,
>>>>> +      struct v4l2_async_subdev *asd)
>>>>> +{
>>>>> +struct mtk_cam_dev *cam =
>>>>> +container_of(notifier, struct mtk_cam_dev, notifier);
>>>>> +
>>>>> +if (!(sd->entity.function & MEDIA_ENT_F_VID_IF_BRIDGE)) {
>>>>> +dev_dbg(cam->dev, "no MEDIA_ENT_F_VID_IF_BRIDGE function\n");
>>>>> +return -ENODEV;
>>>>> +}
>>>>> +
>>>>> +cam->seninf = sd;
>>>>> +dev_dbg(cam->dev, "%s is bound\n", sd->entity.name);
>>>>> +
>>>>> +return 0;
>>>>> +}
>>>>> +
>>>>> +static void mtk_cam_dev_notifier_unbind(struct v4l2_async_notifier *notifier,
>>>>> +struct v4l2_subdev *sd,
>>>>> +struct v4l2_async_subdev *asd)
>>>>> +{
>>>>> +struct mtk_cam_dev *cam =
>>>>> +container_of(notifier, struct mtk_cam_dev, notifier);
>>>>> +
>>>>> +cam->seninf = NULL;
>>>>> +dev_dbg(cam->dev, "%s is unbound\n", sd->entity.name);
>>>>> +}
>>>>> +
>>>>> +static int mtk_cam_dev_notifier_complete(struct v4l2_async_notifier *notifier)
>>>>> +{
>>>>> +struct mtk_cam_dev *cam =
>>>>> +container_of(notifier, struct mtk_cam_dev, notifier);
>>>>> +struct device *dev = cam->dev;
>>>>> +int ret;
>>>>> +
>>>>> +if (!cam->seninf) {
>>>>> +dev_err(dev, "No seninf subdev\n");
>>>>> +return -ENODEV;
>>>>> +}
>>>>> +
>>>>> +ret = media_create_pad_link(&cam->seninf->entity, MTK_CAM_CIO_PAD_SRC,
>>>>> +    &cam->subdev.entity, MTK_CAM_CIO_PAD_SINK,
>>>>> +    MEDIA_LNK_FL_IMMUTABLE |
>>>>> +    MEDIA_LNK_FL_ENABLED);
>>>>> +if (ret) {
>>>>> +dev_err(dev, "failed to create pad link %s %s err:%d\n",
>>>>> +cam->seninf->entity.name, cam->subdev.entity.name,
>>>>> +ret);
>>>>> +return ret;
>>>>> +}
>>>>> +
>>>>> +ret = v4l2_device_register_subdev_nodes(&cam->v4l2_dev);
>>>>> +if (ret) {
>>>>> +dev_err(dev, "failed to initialize subdev nodes:%d\n", ret);
>>>>> +return ret;
>>>>> +}
>>>>> +
>>>>> +return ret;
>>>>> +}
>>>>> +
>>>>> +static const struct v4l2_async_notifier_operations mtk_cam_v4l2_async_ops = {
>>>>> +.bound = mtk_cam_dev_notifier_bound,
>>>>> +.unbind = mtk_cam_dev_notifier_unbind,
>>>>> +.complete = mtk_cam_dev_notifier_complete,
>>>>> +};
>>>>> +
>>>>> +static int mtk_cam_v4l2_async_register(struct mtk_cam_dev *cam)
>>>>> +{
>>>>> +struct device *dev = cam->dev;
>>>>> +int ret;
>>>>> +
>>>>> +v4l2_async_notifier_init(&cam->notifier);
>>>>> +ret = v4l2_async_notifier_parse_fwnode_endpoints(dev,
>>>>> +&cam->notifier, sizeof(struct v4l2_async_subdev), NULL);
>>>>
>>>> It seems we shouldn't be using this function, please see comments at https://patchwork.kernel.org/patch/11066527/
>>>>
>>>> Regards,
>>>> Helen
>>>>
>>>
>>> Ok, we will investigate how to do.
>>>
>>>>> +if (ret) {
>>>>> +dev_err(dev, "failed to parse fwnode endpoints:%d\n", ret);
>>>>> +return ret;
>>>>> +}
>>>>> +
>>>>> +cam->notifier.ops = &mtk_cam_v4l2_async_ops;
>>>>> +dev_dbg(dev, "mtk_cam v4l2_async_notifier_register\n");
>>>>> +ret = v4l2_async_notifier_register(&cam->v4l2_dev, &cam->notifier);
>>>>> +if (ret) {
>>>>> +dev_err(dev, "failed to register async notifier : %d\n", ret);
>>>>> +v4l2_async_notifier_cleanup(&cam->notifier);
>>>>> +}
>>>>> +
>>>>> +return ret;
>>>>> +}
>>>>> +
>>>>> +static void mtk_cam_v4l2_async_unregister(struct mtk_cam_dev *cam)
>>>>> +{
>>>>> +v4l2_async_notifier_unregister(&cam->notifier);
>>>>> +v4l2_async_notifier_cleanup(&cam->notifier);
>>>>> +}
>>>>> +
>>>>> +static const struct v4l2_ioctl_ops mtk_cam_v4l2_vcap_ioctl_ops = {
>>>>> +.vidioc_querycap = mtk_cam_vidioc_querycap,
>>>>> +.vidioc_enum_framesizes = mtk_cam_vidioc_enum_framesizes,
>>>>> +.vidioc_enum_fmt_vid_cap = mtk_cam_vidioc_enum_fmt,
>>>>> +.vidioc_g_fmt_vid_cap_mplane = mtk_cam_vidioc_g_fmt,
>>>>> +.vidioc_s_fmt_vid_cap_mplane = mtk_cam_vidioc_s_fmt,
>>>>> +.vidioc_try_fmt_vid_cap_mplane = mtk_cam_vidioc_try_fmt,
>>>>> +.vidioc_reqbufs = vb2_ioctl_reqbufs,
>>>>> +.vidioc_create_bufs = vb2_ioctl_create_bufs,
>>>>> +.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
>>>>> +.vidioc_querybuf = vb2_ioctl_querybuf,
>>>>> +.vidioc_qbuf = vb2_ioctl_qbuf,
>>>>> +.vidioc_dqbuf = vb2_ioctl_dqbuf,
>>>>> +.vidioc_streamon = vb2_ioctl_streamon,
>>>>> +.vidioc_streamoff = vb2_ioctl_streamoff,
>>>>> +.vidioc_expbuf = vb2_ioctl_expbuf,
>>>>> +.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>>>>> +.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>>>>> +};
>>>>> +
>>>>> +static const struct v4l2_ioctl_ops mtk_cam_v4l2_meta_cap_ioctl_ops = {
>>>>> +.vidioc_querycap = mtk_cam_vidioc_querycap,
>>>>> +.vidioc_enum_fmt_meta_cap = mtk_cam_vidioc_meta_enum_fmt,
>>>>> +.vidioc_g_fmt_meta_cap = mtk_cam_vidioc_g_meta_fmt,
>>>>> +.vidioc_s_fmt_meta_cap = mtk_cam_vidioc_g_meta_fmt,
>>>>> +.vidioc_try_fmt_meta_cap = mtk_cam_vidioc_g_meta_fmt,
>>>>> +.vidioc_reqbufs = vb2_ioctl_reqbufs,
>>>>> +.vidioc_create_bufs = vb2_ioctl_create_bufs,
>>>>> +.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
>>>>> +.vidioc_querybuf = vb2_ioctl_querybuf,
>>>>> +.vidioc_qbuf = vb2_ioctl_qbuf,
>>>>> +.vidioc_dqbuf = vb2_ioctl_dqbuf,
>>>>> +.vidioc_streamon = vb2_ioctl_streamon,
>>>>> +.vidioc_streamoff = vb2_ioctl_streamoff,
>>>>> +.vidioc_expbuf = vb2_ioctl_expbuf,
>>>>> +};
>>>>> +
>>>>> +static const struct v4l2_ioctl_ops mtk_cam_v4l2_meta_out_ioctl_ops = {
>>>>> +.vidioc_querycap = mtk_cam_vidioc_querycap,
>>>>> +.vidioc_enum_fmt_meta_out = mtk_cam_vidioc_meta_enum_fmt,
>>>>> +.vidioc_g_fmt_meta_out = mtk_cam_vidioc_g_meta_fmt,
>>>>> +.vidioc_s_fmt_meta_out = mtk_cam_vidioc_g_meta_fmt,
>>>>> +.vidioc_try_fmt_meta_out = mtk_cam_vidioc_g_meta_fmt,
>>>>> +.vidioc_reqbufs = vb2_ioctl_reqbufs,
>>>>> +.vidioc_create_bufs = vb2_ioctl_create_bufs,
>>>>> +.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
>>>>> +.vidioc_querybuf = vb2_ioctl_querybuf,
>>>>> +.vidioc_qbuf = vb2_ioctl_qbuf,
>>>>> +.vidioc_dqbuf = vb2_ioctl_dqbuf,
>>>>> +.vidioc_streamon = vb2_ioctl_streamon,
>>>>> +.vidioc_streamoff = vb2_ioctl_streamoff,
>>>>> +.vidioc_expbuf = vb2_ioctl_expbuf,
>>>>> +};> +
>>>>> +static const struct v4l2_format meta_fmts[] = {
>>>>> +{
>>>>> +.fmt.meta = {
>>>>> +.dataformat = V4L2_META_FMT_MTISP_PARAMS,
>>>>> +.buffersize = 512 * SZ_1K,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.meta = {
>>>>> +.dataformat = V4L2_META_FMT_MTISP_3A,
>>>>> +.buffersize = 1200 * SZ_1K,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.meta = {
>>>>> +.dataformat = V4L2_META_FMT_MTISP_AF,
>>>>> +.buffersize = 640 * SZ_1K,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.meta = {
>>>>> +.dataformat = V4L2_META_FMT_MTISP_LCS,
>>>>> +.buffersize = 288 * SZ_1K,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.meta = {
>>>>> +.dataformat = V4L2_META_FMT_MTISP_LMV,
>>>>> +.buffersize = 256,
>>>>> +},
>>>>> +},
>>>>> +};
>>>>> +
>>>>> +static const struct v4l2_format stream_out_fmts[] = {
>>>>> +/* This is a default image format */
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR10,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR8,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR12,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR14,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG8,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG10,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG12,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG14,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG8,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG10,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG12,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG14,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB8,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB10,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB12,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB14,
>>>>> +},
>>>>> +},
>>>>> +};
>>>>> +
>>>>> +static const struct v4l2_format bin_out_fmts[] = {
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR8F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR10F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR12F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR14F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG8F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG10F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG12F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG14F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG8F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG10F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG12F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG14F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB8F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB10F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB12F,
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.fmt.pix_mp = {
>>>>> +.width = IMG_MAX_WIDTH,
>>>>> +.height = IMG_MAX_HEIGHT,
>>>>> +.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB14F,
>>>>> +},
>>>>> +},
>>>>> +};
>>>>> +
>>>>> +static const struct
>>>>> +mtk_cam_dev_node_desc output_queues[] = {
>>>>> +{
>>>>> +.id = MTK_CAM_P1_META_IN_0,
>>>>> +.name = "meta input",
>>>>> +.cap = V4L2_CAP_META_OUTPUT,
>>>>> +.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
>>>>> +.link_flags = 0,
>>>>> +.image = false,
>>>>> +.smem_alloc = true,
>>>>> +.fmts = meta_fmts,
>>>>> +.default_fmt_idx = 0,
>>>>> +.max_buf_count = 10,
>>>>> +.ioctl_ops = &mtk_cam_v4l2_meta_out_ioctl_ops,
>>>>> +},
>>>>> +};
>>>>> +
>>>>> +static const struct
>>>>> +mtk_cam_dev_node_desc capture_queues[] = {
>>>>> +{
>>>>> +.id = MTK_CAM_P1_MAIN_STREAM_OUT,
>>>>> +.name = "main stream",
>>>>> +.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
>>>>> +.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>>>>> +.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
>>>>> +.image = true,
>>>>> +.smem_alloc = false,
>>>>> +.dma_port = R_IMGO,
>>>>> +.fmts = stream_out_fmts,
>>>>> +.num_fmts = ARRAY_SIZE(stream_out_fmts),
>>>>> +.default_fmt_idx = 0,
>>>>> +.ioctl_ops = &mtk_cam_v4l2_vcap_ioctl_ops,
>>>>> +.frmsizes = &(struct v4l2_frmsizeenum) {
>>>>> +.index = 0,
>>>>> +.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
>>>>> +.stepwise = {
>>>>> +.max_width = IMG_MAX_WIDTH,
>>>>> +.min_width = IMG_MIN_WIDTH,
>>>>> +.max_height = IMG_MAX_HEIGHT,
>>>>> +.min_height = IMG_MIN_HEIGHT,
>>>>> +.step_height = 1,
>>>>> +.step_width = 1,
>>>>> +},
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.id = MTK_CAM_P1_PACKED_BIN_OUT,
>>>>> +.name = "packed out",
>>>>> +.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
>>>>> +.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>>>>> +.link_flags = 0,
>>>>> +.image = true,
>>>>> +.smem_alloc = false,
>>>>> +.dma_port = R_RRZO,
>>>>> +.fmts = bin_out_fmts,
>>>>> +.num_fmts = ARRAY_SIZE(bin_out_fmts),
>>>>> +.default_fmt_idx = 0,
>>>>> +.ioctl_ops = &mtk_cam_v4l2_vcap_ioctl_ops,
>>>>> +.frmsizes = &(struct v4l2_frmsizeenum) {
>>>>> +.index = 0,
>>>>> +.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
>>>>> +.stepwise = {
>>>>> +.max_width = IMG_MAX_WIDTH,
>>>>> +.min_width = IMG_MIN_WIDTH,
>>>>> +.max_height = IMG_MAX_HEIGHT,
>>>>> +.min_height = IMG_MIN_HEIGHT,
>>>>> +.step_height = 1,
>>>>> +.step_width = 1,
>>>>> +},
>>>>> +},
>>>>> +},
>>>>> +{
>>>>> +.id = MTK_CAM_P1_META_OUT_0,
>>>>> +.name = "partial meta 0",
>>>>> +.cap = V4L2_CAP_META_CAPTURE,
>>>>> +.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
>>>>> +.link_flags = 0,
>>>>> +.image = false,
>>>>> +.smem_alloc = false,
>>>>> +.dma_port = R_AAO | R_FLKO | R_PSO,
>>>>> +.fmts = meta_fmts,
>>>>> +.default_fmt_idx = 1,
>>>>> +.max_buf_count = 5,
>>>>> +.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
>>>>> +},
>>>>> +{
>>>>> +.id = MTK_CAM_P1_META_OUT_1,
>>>>> +.name = "partial meta 1",
>>>>> +.cap = V4L2_CAP_META_CAPTURE,
>>>>> +.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
>>>>> +.link_flags = 0,
>>>>> +.image = false,
>>>>> +.smem_alloc = false,
>>>>> +.dma_port = R_AFO,
>>>>> +.fmts = meta_fmts,
>>>>> +.default_fmt_idx = 2,
>>>>> +.max_buf_count = 5,
>>>>> +.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
>>>>> +},
>>>>> +{
>>>>> +.id = MTK_CAM_P1_META_OUT_2,
>>>>> +.name = "partial meta 2",
>>>>> +.cap = V4L2_CAP_META_CAPTURE,
>>>>> +.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
>>>>> +.link_flags = 0,
>>>>> +.image = false,
>>>>> +.smem_alloc = false,
>>>>> +.dma_port = R_LCSO,
>>>>> +.fmts = meta_fmts,
>>>>> +.default_fmt_idx = 3,
>>>>> +.max_buf_count = 10,
>>>>> +.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
>>>>> +},
>>>>> +{
>>>>> +.id = MTK_CAM_P1_META_OUT_3,
>>>>> +.name = "partial meta 3",
>>>>> +.cap = V4L2_CAP_META_CAPTURE,
>>>>> +.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
>>>>> +.link_flags = 0,
>>>>> +.image = false,
>>>>> +.smem_alloc = false,
>>>>> +.dma_port = R_LMVO,
>>>>> +.fmts = meta_fmts,
>>>>> +.default_fmt_idx = 4,
>>>>> +.max_buf_count = 10,
>>>>> +.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
>>>>> +},
>>>>> +};
>>>>> +
>>>>> +/* The helper to configure the device context */
>>>>> +static void mtk_cam_dev_queue_setup(struct mtk_cam_dev *cam)
>>>>> +{
>>>>> +unsigned int node_idx;
>>>>> +int i;
>>>>> +
>>>>> +node_idx = 0;
>>>>> +/* Setup the output queue */
>>>>> +for (i = 0; i < ARRAY_SIZE(output_queues); i++)
>>>>> +cam->vdev_nodes[node_idx++].desc = output_queues[i];
>>>>> +
>>>>> +/* Setup the capture queue */
>>>>> +for (i = 0; i < ARRAY_SIZE(capture_queues); i++)
>>>>> +cam->vdev_nodes[node_idx++].desc = capture_queues[i];
>>>>> +}
>>>>> +
>>>>> +int mtk_cam_dev_init(struct platform_device *pdev,
>>>>> +     struct mtk_cam_dev *cam)
>>>>> +{
>>>>> +int ret;
>>>>> +
>>>>> +cam->dev = &pdev->dev;
>>>>> +mtk_cam_dev_queue_setup(cam);
>>>>> +
>>>>> +spin_lock_init(&cam->pending_job_lock);
>>>>> +spin_lock_init(&cam->running_job_lock);
>>>>> +INIT_LIST_HEAD(&cam->pending_job_list);
>>>>> +INIT_LIST_HEAD(&cam->running_job_list);
>>>>> +mutex_init(&cam->op_lock);
>>>>> +
>>>>> +/* v4l2 sub-device registration */
>>>>> +ret = mtk_cam_v4l2_register(cam);
>>>>> +if (ret)
>>>>> +return ret;
>>>>> +
>>>>> +ret = mtk_cam_v4l2_async_register(cam);
>>>>> +if (ret)
>>>>> +goto fail_v4l2_unreg;
>>>>> +
>>>>> +return 0;
>>>>> +
>>>>> +fail_v4l2_unreg:
>>>>> +mutex_destroy(&cam->op_lock);
>>>>> +mtk_cam_v4l2_unregister(cam);
>>>>> +
>>>>> +return ret;
>>>>> +}
>>>>> +
>>>>> +void mtk_cam_dev_cleanup(struct mtk_cam_dev *cam)
>>>>> +{
>>>>> +mtk_cam_v4l2_async_unregister(cam);
>>>>> +mtk_cam_v4l2_unregister(cam);
>>>>> +mutex_destroy(&cam->op_lock);
>>>>> +}
>>>>> +
>>>>> diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h
>>>>> new file mode 100644
>>>>> index 000000000000..0a340a1e65ea
>>>>> --- /dev/null
>>>>> +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h
>>>>> @@ -0,0 +1,244 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>> +/*
>>>>> + * Copyright (c) 2019 MediaTek Inc.
>>>>> + */
>>>>> +
>>>>> +#ifndef __MTK_CAM_H__
>>>>> +#define __MTK_CAM_H__
>>>>> +
>>>>> +#include <linux/device.h>
>>>>> +#include <linux/types.h>
>>>>> +#include <linux/platform_device.h>
>>>>> +#include <linux/spinlock.h>
>>>>> +#include <linux/videodev2.h>
>>>>> +#include <media/v4l2-device.h>
>>>>> +#include <media/v4l2-ctrls.h>
>>>>> +#include <media/v4l2-subdev.h>
>>>>> +#include <media/videobuf2-core.h>
>>>>> +#include <media/videobuf2-v4l2.h>
>>>>> +
>>>>> +#include "mtk_cam-ipi.h"
>>>>> +
>>>>> +#define IMG_MAX_WIDTH5376
>>>>> +#define IMG_MAX_HEIGHT4032
>>>>> +#define IMG_MIN_WIDTH80
>>>>> +#define IMG_MIN_HEIGHT60
>>>>> +
>>>>> +/*
>>>>> + * ID enum value for struct mtk_cam_dev_node_desc:id
>>>>> + * or mtk_cam_video_device:id
>>>>> + */
>>>>> +enum  {
>>>>> +MTK_CAM_P1_META_IN_0 = 0,
>>>>> +MTK_CAM_P1_MAIN_STREAM_OUT,
>>>>> +MTK_CAM_P1_PACKED_BIN_OUT,
>>>>> +MTK_CAM_P1_META_OUT_0,
>>>>> +MTK_CAM_P1_META_OUT_1,
>>>>> +MTK_CAM_P1_META_OUT_2,
>>>>> +MTK_CAM_P1_META_OUT_3,
>>>>> +MTK_CAM_P1_TOTAL_NODES
>>>>> +};
>>>>> +
>>>>> +/* Supported image format list */
>>>>> +#define MTK_CAM_IMG_FMT_UNKNOWN0x0000
>>>>> +#define MTK_CAM_IMG_FMT_BAYER80x2200
>>>>> +#define MTK_CAM_IMG_FMT_BAYER100x2201
>>>>> +#define MTK_CAM_IMG_FMT_BAYER120x2202
>>>>> +#define MTK_CAM_IMG_FMT_BAYER140x2203
>>>>> +#define MTK_CAM_IMG_FMT_FG_BAYER80x2204
>>>>> +#define MTK_CAM_IMG_FMT_FG_BAYER100x2205
>>>>> +#define MTK_CAM_IMG_FMT_FG_BAYER120x2206
>>>>> +#define MTK_CAM_IMG_FMT_FG_BAYER140x2207
>>>>> +
>>>>> +/* Supported bayer pixel order */
>>>>> +#define MTK_CAM_RAW_PXL_ID_B0
>>>>> +#define MTK_CAM_RAW_PXL_ID_GB1
>>>>> +#define MTK_CAM_RAW_PXL_ID_GR2
>>>>> +#define MTK_CAM_RAW_PXL_ID_R3
>>>>> +#define MTK_CAM_RAW_PXL_ID_UNKNOWN4
>>>>> +
>>>>> +/*
>>>>> + * struct mtk_p1_frame_param - MTK ISP P1 driver frame parameters.
>>>>> + *
>>>>> + * @frame_seq_no: The frame sequence of frame in driver layer.
>>>>> + * @dma_bufs: The DMA buffer address information of enabled DMA nodes.
>>>>> + *
>>>>> + */
>>>>> +struct mtk_p1_frame_param {
>>>>> +unsigned int frame_seq_no;
>>>>> +struct dma_buffer dma_bufs[MTK_CAM_P1_TOTAL_NODES];
>>>>> +} __packed;
>>>>> +
>>>>> +/*
>>>>> + * struct mtk_cam_dev_request - MTK camera device request.
>>>>> + *
>>>>> + * @req: Embedded struct media request.
>>>>> + * @frame_params: The frame info. & address info. of enabled DMA nodes.
>>>>> + * @frame_work: work queue entry for frame transmission to SCP.
>>>>> + * @list: List entry of the object for @struct mtk_cam_dev:
>>>>> + *        pending_job_list or running_job_list.
>>>>> + * @timestamp: Start of frame timestamp in ns
>>>>> + *
>>>>> + */
>>>>> +struct mtk_cam_dev_request {
>>>>> +struct media_request req;
>>>>> +struct mtk_p1_frame_param frame_params;
>>>>> +struct work_struct frame_work;
>>>>> +struct list_head list;
>>>>> +u64 timestamp;
>>>>> +};
>>>>> +
>>>>> +/*
>>>>> + * struct mtk_cam_dev_buffer - MTK camera device buffer.
>>>>> + *
>>>>> + * @vbb: Embedded struct vb2_v4l2_buffer.
>>>>> + * @list: List entry of the object for @struct mtk_cam_video_device:
>>>>> + *        buf_list.
>>>>> + * @daddr: The DMA address of this buffer.
>>>>> + * @scp_addr: The SCP address of this buffer which
>>>>> + *            is only supported for meta input node.
>>>>> + * @node_id: The vidoe node id which this buffer belongs to.
>>>>> + *
>>>>> + */
>>>>> +struct mtk_cam_dev_buffer {
>>>>> +struct vb2_v4l2_buffer vbb;
>>>>> +struct list_head list;
>>>>> +/* Intenal part */
>>>>> +dma_addr_t daddr;
>>>>> +dma_addr_t scp_addr;
>>>>> +unsigned int node_id;
>>>>> +};
>>>>> +
>>>>> +/*
>>>>> + * struct mtk_cam_dev_node_desc - MTK camera device node descriptor
>>>>> + *
>>>>> + * @id: id of the node
>>>>> + * @name: name of the node
>>>>> + * @cap: supported V4L2 capabilities
>>>>> + * @buf_type: supported V4L2 buffer type
>>>>> + * @dma_port: the dma ports associated to the node
>>>>> + * @link_flags: default media link flags
>>>>> + * @smem_alloc: using the smem_dev as alloc device or not
>>>>> + * @image: true for image node, false for meta node
>>>>> + * @num_fmts: the number of supported node formats
>>>>> + * @default_fmt_idx: default format of this node
>>>>> + * @max_buf_count: maximum VB2 buffer count
>>>>> + * @ioctl_ops:  mapped to v4l2_ioctl_ops
>>>>> + * @fmts: supported format
>>>>> + * @frmsizes: supported V4L2 frame size number
>>>>> + *
>>>>> + */
>>>>> +struct mtk_cam_dev_node_desc {
>>>>> +u8 id;
>>>>> +const char *name;
>>>>> +u32 cap;
>>>>> +u32 buf_type;
>>>>> +u32 dma_port;
>>>>> +u32 link_flags;
>>>>> +u8 smem_alloc:1;
>>>>> +u8 image:1;
>>>>> +u8 num_fmts;
>>>>> +u8 default_fmt_idx;
>>>>> +u8 max_buf_count;
>>>>> +const struct v4l2_ioctl_ops *ioctl_ops;
>>>>> +const struct v4l2_format *fmts;
>>>>> +const struct v4l2_frmsizeenum *frmsizes;
>>>>> +};
>>>>> +
>>>>> +/*
>>>>> + * struct mtk_cam_video_device - Mediatek video device structure
>>>>> + *
>>>>> + * @id: Id for index of mtk_cam_dev:vdev_nodes array
>>>>> + * @enabled: Indicate the video device is enabled or not
>>>>> + * @desc: The node description of video device
>>>>> + * @vdev_fmt: The V4L2 format of video device
>>>>> + * @vdev_pad: The media pad graph object of video device
>>>>> + * @vbq: A videobuf queue of video device
>>>>> + * @vdev: The video device instance
>>>>> + * @vdev_lock: Serializes vb2 queue and video device operations
>>>>> + * @buf_list: List for enqueue buffers
>>>>> + * @buf_list_lock: Lock used to protect buffer list.
>>>>> + *
>>>>> + */
>>>>> +struct mtk_cam_video_device {
>>>>> +unsigned int id;
>>>>> +unsigned int enabled;
>>>>> +struct mtk_cam_dev_node_desc desc;
>>>>> +struct v4l2_format vdev_fmt;
>>>>> +struct media_pad vdev_pad;
>>>>> +struct vb2_queue vbq;
>>>>> +struct video_device vdev;
>>>>> +/* Serializes vb2 queue and video device operations */
>>>>> +struct mutex vdev_lock;
>>>>> +struct list_head buf_list;
>>>>> +/* Lock used to protect buffer list */
>>>>> +spinlock_t buf_list_lock;
>>>>> +};
>>>>> +
>>>>> +/*
>>>>> + * struct mtk_cam_dev - Mediatek camera device structure.
>>>>> + *
>>>>> + * @dev: Pointer to device.
>>>>> + * @smem_pdev: Pointer to shared memory device.
>>>>> + * @pipeline: Media pipeline information.
>>>>> + * @media_dev: Media device instance.
>>>>> + * @subdev: The V4L2 sub-device instance.
>>>>> + * @v4l2_dev: The V4L2 device driver instance.
>>>>> + * @notifier: The v4l2_device notifier data.
>>>>> + * @subdev_pads: Pointer to the number of media pads of this sub-device.
>>>>> + * @vdev_nodes: The array list of mtk_cam_video_device nodes.
>>>>> + * @seninf: Pointer to the seninf sub-device.
>>>>> + * @sensor: Pointer to the active sensor V4L2 sub-device when streaming on.
>>>>> + * @streaming: Indicate the overall streaming status is on or off.
>>>>> + * @enabled_dmas: The enabled dma port information when streaming on.
>>>>> + * @enabled_count: Number of enabled video nodes
>>>>> + * @stream_count: Number of streaming video nodes
>>>>> + * @running_job_count: Nunber of running jobs in the HW driver.
>>>>> + * @pending_job_list: List to keep the media requests before en-queue into
>>>>> + *                    HW driver.
>>>>> + * @pending_job_lock: Protect the pending_job_list data & running_job_count.
>>>>> + * @running_job_list: List to keep the media requests after en-queue into
>>>>> + *                    HW driver.
>>>>> + * @running_job_lock: Protect the running_job_list data.
>>>>> + * @op_lock: Serializes driver's VB2 callback operations.
>>>>> + *
>>>>> + */
>>>>> +struct mtk_cam_dev {
>>>>> +struct device *dev;
>>>>> +struct device *smem_dev;
>>>>> +struct media_pipeline pipeline;
>>>>> +struct media_device media_dev;
>>>>> +struct v4l2_subdev subdev;
>>>>> +struct v4l2_device v4l2_dev;
>>>>> +struct v4l2_async_notifier notifier;
>>>>> +struct media_pad *subdev_pads;
>>>>> +struct mtk_cam_video_device vdev_nodes[MTK_CAM_P1_TOTAL_NODES];
>>>>> +struct v4l2_subdev *seninf;
>>>>> +struct v4l2_subdev *sensor;
>>>>> +unsigned int streaming;
>>>>> +unsigned int enabled_dmas;
>>>>> +unsigned int enabled_count;
>>>>> +unsigned int stream_count;
>>>>> +unsigned int running_job_count;
>>>>> +struct list_head pending_job_list;
>>>>> +/* Protect the pending_job_list data */
>>>>> +spinlock_t pending_job_lock;
>>>>> +struct list_head running_job_list;
>>>>> +/* Protect the running_job_list data & running_job_count */
>>>>> +spinlock_t running_job_lock;
>>>>> +/* Serializes driver's VB2 callback operations */
>>>>> +struct mutex op_lock;
>>>>> +};
>>>>> +
>>>>> +int mtk_cam_dev_init(struct platform_device *pdev,
>>>>> +     struct mtk_cam_dev *cam_dev);
>>>>> +void mtk_cam_dev_cleanup(struct mtk_cam_dev *cam_dev);
>>>>> +void mtk_cam_dev_req_try_queue(struct mtk_cam_dev *cam_dev);
>>>>> +void mtk_cam_dev_dequeue_req_frame(struct mtk_cam_dev *cam_dev,
>>>>> +   unsigned int frame_seq_no);
>>>>> +void mtk_cam_dev_event_frame_sync(struct mtk_cam_dev *cam_dev,
>>>>> +  unsigned int frame_seq_no);
>>>>> +struct mtk_cam_dev_request *mtk_cam_dev_get_req(struct mtk_cam_dev *cam,
>>>>> +unsigned int frame_seq_no);
>>>>> +
>>>>> +#endif /* __MTK_CAM_H__ */
>>>>>
>>>>
>>>> _______________________________________________
>>>> Linux-mediatek mailing list
>>>> Linux-mediatek@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
>>>
>>
>> Regards,
>> Helen
> 
> Thanks for your comment.
> 
> Best regards,
> 
> 
> Jungo
> 
