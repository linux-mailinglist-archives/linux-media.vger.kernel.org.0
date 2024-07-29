Return-Path: <linux-media+bounces-15464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9564293F760
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 16:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B53921C21900
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 14:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E430153838;
	Mon, 29 Jul 2024 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nw+PdMEm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB14F1E4A2;
	Mon, 29 Jul 2024 14:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262523; cv=none; b=Ex2FtK/ydadpyyhP5uDjRP0IgvVxGqc4/eziAWLJ0VMeFwB23r2GYz3feZYrQfWPniZ7tGRrivzqZswi4zhAG0xazusG58Jp7uHZqnd/R/OOj05FNRQVejZSZSeJmTx+RNh4nSWp0m4oKBKzprlRsQclewLtBT2uZLE43pNqoj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262523; c=relaxed/simple;
	bh=Dsx+wQDpQZBV6jgYIBuibYg69MaOvR6sl7gc+MNvXCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvehD2U+v/yKe34cn4iU3i1uZRmJcWBE60f+txflCF9V2TNKhzB66CwXT/PssJx9aSJIoFBPAqDZ7quNQpEA4UlSfQvaUA9roO9RaX3+e/lvR+eW5K+p9NFWC0wPNAl3xVhcrpJONiuCzgWS8WGVtYj1yAqlBNTZvl1LBa4MED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Nw+PdMEm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 088FF229;
	Mon, 29 Jul 2024 16:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722262473;
	bh=Dsx+wQDpQZBV6jgYIBuibYg69MaOvR6sl7gc+MNvXCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nw+PdMEmiHulb82E2wbq5gWTzJuGJYuutZwFznRuA0KH9TXb3ypLpqvFIkPYK/TFm
	 tporQ5xcUF8vJwIlRSJ6wv6Q7qa8ewt4X6NyrP8Bgoy4B++zUBpuHxFtGENdAQLAVr
	 QALTeiCNdekNbpIJ76Szr/qKm4fVmDuFjd/Cmqmg=
Date: Mon, 29 Jul 2024 17:14:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Andy Hsieh =?utf-8?B?KOisneaZuueakyk=?= <Andy.Hsieh@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Message-ID: <20240729141459.GA1552@pendragon.ideasonboard.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
 <85c54f0b1b8bb5d9026c67109a3526fd95cc013b.camel@mediatek.com>
 <CAEHHSvZ2etjPKq0MqHYD=hjs19Yy+DJLwXGGorJK7q2tW2dfRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvZ2etjPKq0MqHYD=hjs19Yy+DJLwXGGorJK7q2tW2dfRQ@mail.gmail.com>

On Mon, Jul 29, 2024 at 03:40:09PM +0200, Julien Stephan wrote:
> Le jeu. 18 juil. 2024 à 04:54, CK Hu (胡俊光) <ck.hu@mediatek.com> a écrit :
> >
> > Hi, Julien:
> >
> > On Thu, 2024-07-04 at 15:36 +0200, Julien Stephan wrote:
> > >
> > > External email : Please do not click links or open attachments until you have verified the sender or the content.
> > >  From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > >
> > > This driver provides a path to bypass the SoC ISP so that image data
> > > coming from the SENINF can go directly into memory without any image
> > > processing. This allows the use of an external ISP.
> > >
> > > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > > [Paul Elder fix irq locking]
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > ---
> >
> > [snip]
> >
> > > +static int mtk_cam_vb2_start_streaming(struct vb2_queue *vq,
> > > +       unsigned int count)
> > > +{
> > > +struct mtk_cam_dev *cam = vb2_get_drv_priv(vq);
> > > +struct mtk_cam_dev_buffer *buf;
> > > +struct mtk_cam_video_device *vdev =
> > > +vb2_queue_to_mtk_cam_video_device(vq);
> > > +struct device *dev = cam->dev;
> > > +const struct v4l2_pix_format_mplane *fmt = &vdev->format;
> > > +int ret;
> > > +unsigned long flags;
> > > +
> > > +if (pm_runtime_get_sync(dev) < 0) {
> > > +dev_err(dev, "failed to get pm_runtime\n");
> > > +pm_runtime_put_autosuspend(dev);
> > > +return -1;
> > > +}
> > > +
> > > +(*cam->hw_functions->mtk_cam_setup)(cam, fmt->width, fmt->height,
> > > +fmt->plane_fmt[0].bytesperline, vdev->fmtinfo->code);
> > > +
> > > +
> > > +/* Enable CMOS and VF */
> > > +mtk_cam_cmos_vf_enable(cam, true, true);
> > > +
> > > +mutex_lock(&cam->op_lock);
> > > +
> > > +ret = mtk_cam_verify_format(cam);
> > > +if (ret < 0)
> > > +goto fail_unlock;
> > > +
> > > +/* Start streaming of the whole pipeline now*/
> > > +if (!cam->pipeline.start_count) {
> > > +ret = media_pipeline_start(vdev->vdev.entity.pads,
> > > +   &cam->pipeline);
> > > +if (ret) {
> > > +dev_err(dev, "failed to start pipeline:%d\n", ret);
> > > +goto fail_unlock;
> > > +}
> > > +}
> > > +
> > > +/* Media links are fixed after media_pipeline_start */
> > > +cam->stream_count++;
> > > +
> > > +cam->sequence = (unsigned int)-1;
> > > +
> > > +/* Stream on the sub-device */
> > > +ret = v4l2_subdev_call(&cam->subdev, video, s_stream, 1);
> > > +if (ret)
> > > +goto fail_no_stream;
> > > +
> > > +mutex_unlock(&cam->op_lock);
> > > +
> > > +/* Create dummy buffer */
> > > +cam->dummy_size = fmt->plane_fmt[0].sizeimage;
> > > +
> > > +cam->dummy.vaddr = dma_alloc_coherent(cam->dev, cam->dummy_size,
> > > +      &cam->dummy.daddr, GFP_KERNEL);
> >
> > Dummy buffer cost much in DRAM footprint. I think we can get rid of
> > this dummy buffer. If no buffer is queued from user space, call
> > mtk_camsv30_cmos_vf_hw_disable() to stop write data into DRAM. After
> > buffer is queued from user space, call mtk_camsv30_cmos_vf_hw_enable()
> > to start write data into DRAM.
> 
> Hi CK,
> 
> IMHO it does not cost that much. A long time ago, we tried to remove
> it, but we faced an issue (can't remember what :/).
> Moreover, some other driver already uses the dummy buffer
> implementation, if I am not wrong.

The hardware have a CAMSV_IMGO_SV_STRIDE register. What happens if you
set the stride to 0 instead of bytesperline ? Will the hardware write
repeatedly over the same line ? If so you can allocate a scratch buffer
of a single line.

You will need to ensure that, whenever you reconfigure the device, the
stride and buffer address will always be programmed atomically. If you
switch to the line buffer and the image starts before the stride is
reconfigure, bad things will happen.

Stopping the DMA is another solution that would I think be even better
if that can be done quickly (without waiting synchronously for the end
of the next frame), and if restarting is equally quick.

> > > +if (!cam->dummy.vaddr) {
> > > +ret = -ENOMEM;
> > > +goto fail_no_buffer;
> > > +}
> > > +
> > > +/* update first buffer address */
> > > +
> > > +/* added the buffer into the tracking list */
> > > +spin_lock_irqsave(&cam->irqlock, flags);
> > > +if (list_empty(&cam->buf_list)) {
> > > +(*cam->hw_functions->mtk_cam_update_buffers_add)(cam, &cam->dummy);
> > > +cam->is_dummy_used = true;
> > > +} else {
> > > +buf = list_first_entry_or_null(&cam->buf_list,
> > > +       struct mtk_cam_dev_buffer,
> > > +       list);
> > > +(*cam->hw_functions->mtk_cam_update_buffers_add)(cam, buf);
> > > +cam->is_dummy_used = false;
> > > +}
> > > +spin_unlock_irqrestore(&cam->irqlock, flags);
> > > +
> > > +return 0;
> > > +
> > > +fail_no_buffer:
> > > +mutex_lock(&cam->op_lock);
> > > +v4l2_subdev_call(&cam->subdev, video, s_stream, 0);
> > > +fail_no_stream:
> > > +cam->stream_count--;
> > > +if (cam->stream_count == 0)
> > > +media_pipeline_stop(vdev->vdev.entity.pads);
> > > +fail_unlock:
> > > +mutex_unlock(&cam->op_lock);
> > > +mtk_cam_vb2_return_all_buffers(cam, VB2_BUF_STATE_QUEUED);
> > > +
> > > +return ret;
> > > +}
> > > +

-- 
Regards,

Laurent Pinchart

