Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5BDBCDBB4
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 08:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfJGGCU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 02:02:20 -0400
Received: from mailoutvs27.siol.net ([185.57.226.218]:53473 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726889AbfJGGCU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 02:02:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id 9592A521630;
        Mon,  7 Oct 2019 08:02:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id vcF-zkhEbduB; Mon,  7 Oct 2019 08:02:16 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id 2224752160B;
        Mon,  7 Oct 2019 08:02:16 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Zimbra) with ESMTPA id 4A222521630;
        Mon,  7 Oct 2019 08:02:13 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     mchehab@kernel.org, paul.kocialkowski@bootlin.com,
        mripard@kernel.org, pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        gregkh@linuxfoundation.org, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
Subject: Re: [PATCH v2 3/6] media: v4l2-mem2mem: add stateless_(try_)decoder_cmd ioctl helpers
Date:   Mon, 07 Oct 2019 08:02:12 +0200
Message-ID: <2840939.OS9t7MgvnY@jernej-laptop>
In-Reply-To: <6c7eeaf1-18bb-1c7e-7938-a3eb5af100b6@xs4all.nl>
References: <20190929200023.215831-1-jernej.skrabec@siol.net> <20190929200023.215831-4-jernej.skrabec@siol.net> <6c7eeaf1-18bb-1c7e-7938-a3eb5af100b6@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne petek, 04. oktober 2019 ob 11:21:12 CEST je Hans Verkuil napisal(a):
> On 9/29/19 10:00 PM, Jernej Skrabec wrote:
> > These helpers are used by stateless codecs when they support multiple
> > slices per frame and hold capture buffer flag is set. It's expected that
> > all such codecs will use this code.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  drivers/media/v4l2-core/v4l2-mem2mem.c | 35 ++++++++++++++++++++++++++
> >  include/media/v4l2-mem2mem.h           |  4 +++
> >  2 files changed, 39 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > b/drivers/media/v4l2-core/v4l2-mem2mem.c index 19937dd3c6f6..2677a07e4c9b
> > 100644
> > --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > @@ -1154,6 +1154,41 @@ int v4l2_m2m_ioctl_try_decoder_cmd(struct file
> > *file, void *fh,> 
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
> > 
> > +int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
> > +					     struct 
v4l2_decoder_cmd *dc)
> > +{
> > +	if (dc->cmd != V4L2_DEC_CMD_FLUSH)
> > +		return -EINVAL;
> > +
> > +	dc->flags = 0;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_try_decoder_cmd);
> > +
> > +int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
> > +					 struct 
v4l2_decoder_cmd *dc)
> > +{
> > +	struct v4l2_fh *fh = file->private_data;
> > +	struct vb2_v4l2_buffer *out_vb, *cap_vb;
> > +	int ret;
> > +
> > +	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, dc);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	out_vb = v4l2_m2m_last_src_buf(fh->m2m_ctx);
> > +	cap_vb = v4l2_m2m_last_dst_buf(fh->m2m_ctx);
> 
> I think this should be v4l2_m2m_next_dst_buf. If multiple capture buffers
> were queued up, then it can only be the first capture buffer that can be
> 'HELD'.

I'm pretty sure v4l2_m2m_last_dst_buf() is correct. We want to affect last job 
in the queue, all jobs before are already properly handled by comparing 
timestamps.

> 
> This might solve the race condition you saw with ffmpeg.

This actually doesn't change anything. ffmpeg currently queues only one job and 
then waits until it's executed. In this case it actually doesn't matter if 
"last" or "next" variant is used.

Best regards,
Jernej

> 
> Regards,
> 
> 	Hans
> 
> > +
> > +	if (out_vb)
> > +		out_vb->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
> > +	else if (cap_vb && cap_vb->is_held)
> > +		v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_decoder_cmd);
> > +
> > 
> >  /*
> >  
> >   * v4l2_file_operations helpers. It is assumed here same lock is used
> >   * for the output and the capture buffer queue.
> > 
> > diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> > index c9fa96c8eed1..8ae2f56c7fa3 100644
> > --- a/include/media/v4l2-mem2mem.h
> > +++ b/include/media/v4l2-mem2mem.h
> > @@ -714,6 +714,10 @@ int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file,
> > void *fh,> 
> >  				   struct v4l2_encoder_cmd *ec);
> >  
> >  int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
> >  
> >  				   struct v4l2_decoder_cmd *dc);
> > 
> > +int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
> > +					     struct 
v4l2_decoder_cmd *dc);
> > +int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
> > +					 struct 
v4l2_decoder_cmd *dc);
> > 
> >  int v4l2_m2m_fop_mmap(struct file *file, struct vm_area_struct *vma);
> >  __poll_t v4l2_m2m_fop_poll(struct file *file, poll_table *wait);




