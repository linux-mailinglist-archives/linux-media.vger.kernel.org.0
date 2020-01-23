Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31DEF146A0F
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 14:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbgAWN7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 08:59:47 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53681 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726240AbgAWN7q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 08:59:46 -0500
Received: from [IPv6:2001:983:e9a7:1:1bd:458:b834:7f13]
 ([IPv6:2001:983:e9a7:1:1bd:458:b834:7f13])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ud1GiMhyrpLtbud1HiQmGT; Thu, 23 Jan 2020 14:59:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579787984; bh=QMJEymLawOLXetjmUApu8pD98GsGg9QmPDT6OQP12HI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Pj0qq3RPWTXnW81gSSId/7TqNxzdAaal+ojwUfoDH+gIwcuRF7fez3cdaby3gets+
         JqY6T57OH0bwfNis/KUjyFJEBWI9tdxlBZYPWKkW5v1pT5jlD6bY6hNxMjQX1dlbLA
         2LfZqz73iwivrE8indM+jRUezRIsiMP8NkWKrdiHp5mH3C34wvhiJyyDzU8G+RbdWz
         LtAVF7n3Xg3oIuCAfpf6IqB26WuIfRDoUvADjihUT9UaZSJB/6QzbjbhgVY3tbpEpA
         WwYHP9S9J6VGLN89xLCT6a61LXt0Q7aEv2W9rJAeczj9V4woIZtUKCFgXl7tHTX7RE
         t6b5zMCvpJsdQ==
Subject: Re: [v6, 5/5] media: platform: Add Mediatek ISP P1 V4L2 device driver
To:     Jungo Lin <jungo.lin@mediatek.com>, tfiga@chromium.org,
        laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        srv_heupstream@mediatek.com, ddavenport@chromium.org,
        robh@kernel.org, Sean.Cheng@mediatek.com, sj.huang@mediatek.com,
        frederic.chen@mediatek.com, Jerry-ch.Chen@mediatek.com,
        frankie.chiu@mediatek.com, ryan.yu@mediatek.com,
        Rynn.Wu@mediatek.com, yuzhao@chromium.org, zwisler@chromium.org,
        shik@chromium.org, suleiman@chromium.org,
        Pi-Hsun Shih <pihsun@chromium.org>
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20191219054930.29513-1-jungo.lin@mediatek.com>
 <20191219054930.29513-6-jungo.lin@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c481734a-c706-2ea9-3888-ab2fb9c805ef@xs4all.nl>
Date:   Thu, 23 Jan 2020 14:59:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191219054930.29513-6-jungo.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHmimHHTwlo1o0FCcYiUsnwhPqcAkb48Vy7zKrjhr6BOI8+sGCR4zzat8J4pe1h0dNghXVwNG0ZXNUxuDoGYbBYLmpPSsBnYkLqEwZAF+UydZByWDCxU
 G4zvgTfaj1jIuiW/1CE2RhVxsLWAfyPUedRYEbYegq4BBYOiLVg5VizUDIfI9MwgYO2y5bPeRPjU2WCZOaxyzHduPWHZthMUrz0zk3vbXMpN92sZwXTkfg+L
 BLh/f+77Q2Z6CeCH23/CG5AV5nm2EbwnN5JKdgoQxwVUk5UtaFxiJ3qFT6e5qx1/U7O6ewvHfeGUkeqsJzjZP2FQctiaARNxXvnztJUUYcNUOS/5K8Gynkbm
 DQyIkvw67V6JAFDLD0EnO/CcVOJ2rD7BfnQc1Vptkj/HT7sUKVjRrv66elzqwAvnp5a+gVBlqDhCUpaQWuzlqCB0lVZxAvmBm6FwN8RN/9LxF1WGfL1hfELH
 vptYSzCYCuogg5EYcs5YYK7XMb4DbjRs4HfkRgr4t+eUS7vLRY/LUVzTAqLrJV9dt+KywWERXFhTThadaappv53sXbAa4cxj3umRbV2nyu1rASp0S5Vja6fO
 nDg1BNIpTN94Gtb5KYMjj9CfN0PDDNdBbFWTTY7AKQNrFrZT4zYgdpCIpg6qMd19LcnsaaUHgX7SHKg5h0aPx/Pu6ki8GpaiBdZzv6Rt8Hv+klF5O4UgubX3
 BJWBGG+VVombldflQr5RitCluIGiiFYqt98ppFqigM9NS+vQxDOwferkDxlVFo+FFAXZ1BNtFwM29xUuqF/cBctpLj53h+Dx9syu9TGyDO/q7iKIikQ4Hkmr
 5cnOJMoCzI2fXiiOCTsnqzjOmMb7NHsB6jyHClwyx/FeRkPlYoGpEAlRMmXLvIH5SDemavdblN0MEOLNgqkPJityhHn7QYEIWnxpE01prQ+1cculJQc2CbkR
 5nQrrvpPOqlIFAo9ebTbp3bPiCziqod8y8GuRq2MkjGWfEE44QW4LlE4n6H/tsRBA/0jag32P6253tBVsGAZSZYBsyiP6QuJHdj5n3GesELTEb9RfOoMI9qX
 /yG9JoFsS5Wm/58wzoKUPiyFLkZQzeyua/A=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jungo,

On 12/19/19 6:49 AM, Jungo Lin wrote:
> This patch adds the Mediatek ISP P1 HW control device driver.
> It handles the ISP HW configuration, provides interrupt handling and
> initializes the V4L2 device nodes and other V4L2 functions. Moreover,
> implement standard V4L2 video driver that utilizes V4L2 and media
> framework APIs. It supports one media device, one sub-device and
> several video devices during initialization. Moreover, it also connects
> with sensor and seninf drivers with V4L2 async APIs. Communicate with
> co-process via SCP communication to compose ISP registers in the
> firmware.
> 
> (The current metadata interface used in meta input and partial
> meta nodes is only a temporary solution to kick off the driver
> development and is not ready to be reviewed yet.)
> 
> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> ---
> Changes from v6:
>  - Revise help description for VIDEO_MEDIATEK_ISP_PASS1
>  - Apply SCP v21 change in P1 driver by Pi-Hsun Shih
>  - Correct auto suspend timer value for suspend/resume issue
>  - Increase IPI guard timer to 1 second to avoid false alarm command timeout event
>  - Fix KE due to no sen-inf sub-device
> ---
>  drivers/media/platform/mtk-isp/Kconfig        |   20 +
>  .../media/platform/mtk-isp/isp_50/Makefile    |    3 +
>  .../platform/mtk-isp/isp_50/cam/Makefile      |    6 +
>  .../platform/mtk-isp/isp_50/cam/mtk_cam-hw.c  |  636 +++++
>  .../platform/mtk-isp/isp_50/cam/mtk_cam-hw.h  |   64 +
>  .../platform/mtk-isp/isp_50/cam/mtk_cam-ipi.h |  222 ++
>  .../mtk-isp/isp_50/cam/mtk_cam-regs.h         |   95 +
>  .../platform/mtk-isp/isp_50/cam/mtk_cam.c     | 2087 +++++++++++++++++
>  .../platform/mtk-isp/isp_50/cam/mtk_cam.h     |  244 ++
>  9 files changed, 3377 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ipi.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h

<snip>

> +static void isp_tx_frame_worker(struct work_struct *work)
> +{
> +	struct mtk_cam_dev_request *req =
> +		container_of(work, struct mtk_cam_dev_request, frame_work);
> +	struct mtk_cam_dev *cam =
> +		container_of(req->req.mdev, struct mtk_cam_dev, media_dev);
> +	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(cam->dev);
> +
> +	scp_ipi_send(p1_dev->scp, SCP_IPI_ISP_FRAME, &req->frame_params,
> +		     sizeof(req->frame_params), MTK_ISP_IPI_SEND_TIMEOUT);
> +}

<snip>

> +void mtk_isp_req_enqueue(struct mtk_cam_dev *cam,
> +			 struct mtk_cam_dev_request *req)
> +{
> +	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(cam->dev);
> +
> +	/* Accumulated frame sequence number */
> +	req->frame_params.frame_seq_no = ++p1_dev->enqueued_frame_seq_no;
> +
> +	INIT_WORK(&req->frame_work, isp_tx_frame_worker);
> +	queue_work(p1_dev->composer_wq, &req->frame_work);
> +	dev_dbg(cam->dev, "enqueue fd:%s frame_seq_no:%d job cnt:%d\n",
> +		req->req.debug_str, req->frame_params.frame_seq_no,
> +		cam->running_job_count);
> +}

<snip>

> +/*
> + * struct dma_buffer - DMA buffer address information
> + *
> + * @iova: DMA address for ISP DMA device
> + * @scp_addr: SCP address for external co-process unit
> + *
> + */
> +struct dma_buffer {
> +	u32 iova;
> +	u32 scp_addr;
> +} __packed;

<snip>

> +static void mtk_cam_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
> +	struct mtk_cam_dev_buffer *buf = mtk_cam_vb2_buf_to_dev_buf(vb);
> +	struct mtk_cam_dev_request *req = mtk_cam_req_to_dev_req(vb->request);
> +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
> +	struct device *dev = cam->dev;
> +	unsigned long flags;
> +
> +	dev_dbg(dev, "%s: node:%d fd:%d idx:%d\n", __func__,
> +		node->id, buf->vbb.request_fd, buf->vbb.vb2_buf.index);
> +
> +	/* added the buffer into the tracking list */
> +	spin_lock_irqsave(&node->buf_list_lock, flags);
> +	list_add_tail(&buf->list, &node->buf_list);
> +	spin_unlock_irqrestore(&node->buf_list_lock, flags);
> +
> +	/* update buffer internal address */
> +	req->frame_params.dma_bufs[buf->node_id].iova = buf->daddr;
> +	req->frame_params.dma_bufs[buf->node_id].scp_addr = buf->scp_addr;
> +}
> +

<snip>

> +/*
> + * struct mtk_p1_frame_param - MTK ISP P1 driver frame parameters.
> + *
> + * @frame_seq_no: The frame sequence of frame in driver layer.
> + * @dma_bufs: The DMA buffer address information of enabled DMA nodes.
> + *
> + */
> +struct mtk_p1_frame_param {
> +	unsigned int frame_seq_no;
> +	struct dma_buffer dma_bufs[MTK_CAM_P1_TOTAL_NODES];
> +} __packed;

So if I understand this correctly, to set the ISP frame parameters userspace
provides an array of pointers to other memory areas that are magically created
somewhere and containing magic, undocumented data.

I know you said that this is 'not ready to be reviewed yet', but I just wanted
to mention that this is of course not acceptable and needs to be replaced with
a documented metadata structure that userspace can pass in the metadata buffer.

Just ignore this email if you were already planning on doing that. I just wanted
to make sure that it is clear that the current approach won't fly.

Regards,

	Hans
