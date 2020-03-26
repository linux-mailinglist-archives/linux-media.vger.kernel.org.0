Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0AD4193E15
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 12:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbgCZLlI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 07:41:08 -0400
Received: from mga06.intel.com ([134.134.136.31]:52528 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727900AbgCZLlH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 07:41:07 -0400
IronPort-SDR: IMPa6RqzMFyZfjPnQ0nfklmHfhwp5Fvg0mBNYwV3k7sqt3mJAtzKEZ3xeS16KmBpukkxnd9RWH
 2k11oFoIY5LQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 04:41:06 -0700
IronPort-SDR: WOUHXL9PwRuvpqoK0pAfbs8+/omg2hHf8CQ4YRS0zZSiwk6fQtuId3rYrZvty9cRMzFDlEqBVA
 Fx/kWETaCYfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,308,1580803200"; 
   d="scan'208";a="393952680"
Received: from maytarsh-mobl1.ger.corp.intel.com (HELO mara.localdomain) ([10.249.36.33])
  by orsmga004.jf.intel.com with ESMTP; 26 Mar 2020 04:41:04 -0700
Received: from sailus by mara.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1jHQsd-0001BQ-73; Thu, 26 Mar 2020 13:40:59 +0200
Date:   Thu, 26 Mar 2020 13:40:58 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, tfiga@chromium.org,
        laurent.pinchart@ideasonboard.com, rajmohan.mani@intel.com,
        bingbu.cao@linux.intel.com
Subject: Re: [PATCH v2] media: staging/intel-ipu3: Implement lock for stream
 on/off operations
Message-ID: <20200326114058.GD4096@mara.localdomain>
References: <1585214190-30310-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585214190-30310-1-git-send-email-bingbu.cao@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Thu, Mar 26, 2020 at 05:16:30PM +0800, Bingbu Cao wrote:
> Currently concurrent stream off operations on ImgU nodes are not
> synchronized, leading to use-after-free bugs (as reported by KASAN).
> 
> [  250.090724] BUG: KASAN: use-after-free in
> ipu3_dmamap_free+0xc5/0x116 [ipu3_imgu]
> [  250.090726] Read of size 8 at addr ffff888127b29bc0 by task
> yavta/18836
> [  250.090731] Hardware name: HP Soraka/Soraka, BIOS
> Google_Soraka.10431.17.0 03/22/2018
> [  250.090732] Call Trace:
> [  250.090735]  dump_stack+0x6a/0xb1
> [  250.090739]  print_address_description+0x8e/0x279
> [  250.090743]  ? ipu3_dmamap_free+0xc5/0x116 [ipu3_imgu]
> [  250.090746]  kasan_report+0x260/0x28a
> [  250.090750]  ipu3_dmamap_free+0xc5/0x116 [ipu3_imgu]
> [  250.090754]  ipu3_css_pool_cleanup+0x24/0x37 [ipu3_imgu]
> [  250.090759]  ipu3_css_pipeline_cleanup+0x61/0xb9 [ipu3_imgu]
> [  250.090763]  ipu3_css_stop_streaming+0x1f2/0x321 [ipu3_imgu]
> [  250.090768]  imgu_s_stream+0x94/0x443 [ipu3_imgu]
> [  250.090772]  ? ipu3_vb2_buf_queue+0x280/0x280 [ipu3_imgu]
> [  250.090775]  ? vb2_dma_sg_unmap_dmabuf+0x16/0x6f [videobuf2_dma_sg]
> [  250.090778]  ? vb2_buffer_in_use+0x36/0x58 [videobuf2_common]
> [  250.090782]  ipu3_vb2_stop_streaming+0xf9/0x135 [ipu3_imgu]
> 
> Implemented a lock to synchronize imgu stream on / off operations and
> the modification of streaming flag (in struct imgu_device), to prevent
> these issues.
> 
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Rajmohan Mani <rajmohan.mani@intel.com>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 9 +++++++++
>  drivers/staging/media/ipu3/ipu3.c      | 3 +++
>  drivers/staging/media/ipu3/ipu3.h      | 4 ++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 09c8ede1457c..0358d0998314 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -367,8 +367,10 @@ static void imgu_vb2_buf_queue(struct vb2_buffer *vb)
>  
>  	vb2_set_plane_payload(vb, 0, need_bytes);
>  
> +	mutex_lock(&imgu->streaming_lock);
>  	if (imgu->streaming)
>  		imgu_queue_buffers(imgu, false, node->pipe);
> +	mutex_unlock(&imgu->streaming_lock);
>  
>  	dev_dbg(&imgu->pci_dev->dev, "%s for pipe %u node %u", __func__,
>  		node->pipe, node->id);
> @@ -468,10 +470,12 @@ static int imgu_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	dev_dbg(dev, "%s node name %s pipe %u id %u", __func__,
>  		node->name, node->pipe, node->id);
>  
> +	mutex_lock(&imgu->streaming_lock);
>  	if (imgu->streaming) {
>  		r = -EBUSY;

mutex_unlock() here.

Apart from that this seems fine.

>  		goto fail_return_bufs;
>  	}
> +	mutex_unlock(&imgu->streaming_lock);
>  
>  	if (!node->enabled) {
>  		dev_err(dev, "IMGU node is not enabled");
> @@ -498,9 +502,11 @@ static int imgu_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
>  
>  	/* Start streaming of the whole pipeline now */
>  	dev_dbg(dev, "IMGU streaming is ready to start");
> +	mutex_lock(&imgu->streaming_lock);
>  	r = imgu_s_stream(imgu, true);
>  	if (!r)
>  		imgu->streaming = true;
> +	mutex_unlock(&imgu->streaming_lock);
>  
>  	return 0;
>  
> @@ -532,6 +538,7 @@ static void imgu_vb2_stop_streaming(struct vb2_queue *vq)
>  		dev_err(&imgu->pci_dev->dev,
>  			"failed to stop subdev streaming\n");
>  
> +	mutex_lock(&imgu->streaming_lock);
>  	/* Was this the first node with streaming disabled? */
>  	if (imgu->streaming && imgu_all_nodes_streaming(imgu, node)) {
>  		/* Yes, really stop streaming now */
> @@ -542,6 +549,8 @@ static void imgu_vb2_stop_streaming(struct vb2_queue *vq)
>  	}
>  
>  	imgu_return_all_buffers(imgu, node, VB2_BUF_STATE_ERROR);
> +	mutex_unlock(&imgu->streaming_lock);
> +
>  	media_pipeline_stop(&node->vdev.entity);
>  }
>  
> diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
> index 4d53aad31483..a25a997cfd7e 100644
> --- a/drivers/staging/media/ipu3/ipu3.c
> +++ b/drivers/staging/media/ipu3/ipu3.c
> @@ -675,6 +675,7 @@ static int imgu_pci_probe(struct pci_dev *pci_dev,
>  		return r;
>  
>  	mutex_init(&imgu->lock);
> +	mutex_init(&imgu->streaming_lock);
>  	atomic_set(&imgu->qbuf_barrier, 0);
>  	init_waitqueue_head(&imgu->buf_drain_wq);
>  
> @@ -738,6 +739,7 @@ static int imgu_pci_probe(struct pci_dev *pci_dev,
>  out_css_powerdown:
>  	imgu_css_set_powerdown(&pci_dev->dev, imgu->base);
>  out_mutex_destroy:
> +	mutex_destroy(&imgu->streaming_lock);
>  	mutex_destroy(&imgu->lock);
>  
>  	return r;
> @@ -755,6 +757,7 @@ static void imgu_pci_remove(struct pci_dev *pci_dev)
>  	imgu_css_set_powerdown(&pci_dev->dev, imgu->base);
>  	imgu_dmamap_exit(imgu);
>  	imgu_mmu_exit(imgu->mmu);
> +	mutex_destroy(&imgu->streaming_lock);
>  	mutex_destroy(&imgu->lock);
>  }
>  
> diff --git a/drivers/staging/media/ipu3/ipu3.h b/drivers/staging/media/ipu3/ipu3.h
> index 73b123b2b8a2..8cd6a0077d99 100644
> --- a/drivers/staging/media/ipu3/ipu3.h
> +++ b/drivers/staging/media/ipu3/ipu3.h
> @@ -146,6 +146,10 @@ struct imgu_device {
>  	 * vid_buf.list and css->queue
>  	 */
>  	struct mutex lock;
> +
> +	/* Lock to protect writes to streaming flag in this struct */
> +	struct mutex streaming_lock;
> +
>  	/* Forbid streaming and buffer queuing during system suspend. */
>  	atomic_t qbuf_barrier;
>  	/* Indicate if system suspend take place while imgu is streaming. */

-- 
Kind regards,

Sakari Ailus
