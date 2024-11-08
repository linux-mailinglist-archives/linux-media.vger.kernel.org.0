Return-Path: <linux-media+bounces-21116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 922189C1842
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51C49282CD4
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 08:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0661DF759;
	Fri,  8 Nov 2024 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="i17cXhe2"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC411DF271
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 08:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731055469; cv=pass; b=VBc9cxwU4q+254F3viCirSaIcdX8i/wZp4vCq7rhB3UjPq+5DUKIyt6+foWSEhxJiE3YwC5TE89YbJyi68exWT0uHI9S0GZFj4CkW5XvMZuAlk1jIbGVJi02JApGsuKpkOYBTxjrAp+KNFSr0As8M797FP/6Dj18M1j7HoEg/AU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731055469; c=relaxed/simple;
	bh=TvkPXu88b6FgEyQDvU4lCT1Kv8U/MF+mSvgrK5P2hrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZiKZOhR3lQihHRpCjqkCyxyV1rGNdttDyMdFwstu2Cl63CTCUqPqG3BzYB6EYE+EWK5FckdkOc3J46qIpCHGTmPyeq0UXf6EL4tzMPomK1F0ELKPSDD7n4aTWW+KdGUXvykTUwr0DIde0UrSchn7i57Z/6CmDwzJ2Zl3aiIg58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=i17cXhe2; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4XlCD762kwzyRB;
	Fri,  8 Nov 2024 10:44:23 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1731055464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IH/SUwCOrssotSK23F1MWhcFxNhHg2AgI8BFw3YlpNk=;
	b=i17cXhe24F6V00Q5qHqdhG8G4FjzxFTLyGDDwe2EFfoS00VaJk+x9mTt0K2KYxTN0E+G1y
	F/aPU+OzKDOEtx80YRBXXA994ddo+cejRLS74GSjvG/NVmQGy8r0QXuG5ncbjPuWjoDD/V
	2UtfoV8rey8Gvi+pqtsLs4VbOwuusi4=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1731055464; a=rsa-sha256; cv=none;
	b=ErFLXsdx7Sn11lIr88D2k1YSurrv56GWSiV9XuWNBn6052jAaNxkint+gP1mf5M10sTYyn
	QYC4t3sANEKW92K3kJDvUGzrerclroicoxQPm6TQ7o/+lcJMiXSjJIM8dty39FmQDWF8jG
	gcvdUdd8AdrUjr+QuEFT9+8G8BPPkfs=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1731055464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IH/SUwCOrssotSK23F1MWhcFxNhHg2AgI8BFw3YlpNk=;
	b=MiFyzKb98NjQvojM3FRu3B55TZVOiQfobgJtJa1OW5sr9Hj6HICuTRpRiTLu/CiyqH/pSx
	cSPie/HN0qM056yCbAOsrCZA9xpQ8Qpe7AAsJi+/kxExdsKTp1q8kwYUVXFWLxUUAd+s7g
	Do/1eu2KvK/iFmw2evEee9ODXgs4oB4=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 73CCD634C93;
	Fri,  8 Nov 2024 10:44:23 +0200 (EET)
Date: Fri, 8 Nov 2024 08:44:23 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCHv3] media: vicodec: add V4L2_CID_MIN_BUFFERS_FOR_* controls
Message-ID: <Zy3PZ-pxsvMGPFto@valkosipuli.retiisi.eu>
References: <3c0362e5-aa47-4545-a81e-e696b0e01440@xs4all.nl>
 <Zy3KnT696hCBy6UM@valkosipuli.retiisi.eu>
 <457091ed-3fc0-4e91-980f-4d41fd2952b4@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <457091ed-3fc0-4e91-980f-4d41fd2952b4@xs4all.nl>

Hi Hans,

On Fri, Nov 08, 2024 at 09:40:30AM +0100, Hans Verkuil wrote:
> On 08/11/2024 09:23, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Tue, Nov 05, 2024 at 08:50:39AM +0100, Hans Verkuil wrote:
> >> Stateful codecs must support the V4L2_CID_MIN_BUFFERS_FOR_OUTPUT
> >> and V4L2_CID_MIN_BUFFERS_FOR_CAPTURE controls. The vicodec driver
> >> was missing support for these controls. Add them.
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> >> ---
> >> Change since v2: set min_reqbufs_allocation to the same value
> >> as used for V4L2_CID_MIN_BUFFERS_FOR_OUTPUT/CAPTURE.
> >> Change since v1: V4L2_CID_MIN_BUFFERS_FOR_OUTPUT was already
> >> supported, so that patch led to duplicated controls. That's now
> >> fixed.
> >> ---
> >>  .../media/test-drivers/vicodec/vicodec-core.c | 22 ++++++++++++++-----
> >>  1 file changed, 16 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
> >> index 00c84a06f343..556ec2a3d411 100644
> >> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> >> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> >> @@ -43,6 +43,8 @@ MODULE_PARM_DESC(debug, " activates debug info");
> >>  #define MIN_WIDTH		640U
> >>  #define MAX_HEIGHT		2160U
> >>  #define MIN_HEIGHT		360U
> >> +/* Recommended number of buffers for the stateful codecs */
> >> +#define VICODEC_REC_BUFS	2
> >>
> >>  #define dprintk(dev, fmt, arg...) \
> >>  	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: " fmt, __func__, ## arg)
> >> @@ -1705,12 +1707,14 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
> >>  	src_vq->ops = &vicodec_qops;
> >>  	src_vq->mem_ops = &vb2_vmalloc_memops;
> >>  	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> >> -	if (ctx->is_enc)
> >> +	if (ctx->is_enc) {
> >>  		src_vq->lock = &ctx->dev->stateful_enc.mutex;
> >> -	else if (ctx->is_stateless)
> >> +		src_vq->min_reqbufs_allocation = VICODEC_REC_BUFS;
> > 
> > Doesn't this change affect also stateless codecs?
> 
> No. The patch is a bit hard to read, the "else if (ctx->is_stateless)" is
> actually moved to after this new assignment.
> 
> Also note that the encoder in vicodec is stateful only. There is no
> stateless encoder.

Thanks, that explains it.

Feel free to add:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> 
> > 
> >> +	} else if (ctx->is_stateless) {
> >>  		src_vq->lock = &ctx->dev->stateless_dec.mutex;
> >> -	else
> >> +	} else {
> >>  		src_vq->lock = &ctx->dev->stateful_dec.mutex;
> >> +	}
> >>  	src_vq->supports_requests = ctx->is_stateless;
> >>  	src_vq->requires_requests = ctx->is_stateless;
> >>  	ret = vb2_queue_init(src_vq);
> >> @@ -1728,6 +1732,8 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
> >>  	dst_vq->mem_ops = &vb2_vmalloc_memops;
> >>  	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> >>  	dst_vq->lock = src_vq->lock;
> >> +	if (!ctx->is_stateless && !ctx->is_enc)
> >> +		dst_vq->min_reqbufs_allocation = VICODEC_REC_BUFS;
> >>
> >>  	return vb2_queue_init(dst_vq);
> >>  }
> >> @@ -1852,9 +1858,13 @@ static int vicodec_open(struct file *file)
> >>  			  1, 31, 1, 20);
> >>  	v4l2_ctrl_new_std(hdl, &vicodec_ctrl_ops, V4L2_CID_FWHT_P_FRAME_QP,
> >>  			  1, 31, 1, 20);
> >> -	if (ctx->is_enc)
> >> -		v4l2_ctrl_new_std(hdl, &vicodec_ctrl_ops,
> >> -				  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 1, 1, 1);
> >> +	if (!ctx->is_stateless)
> >> +		v4l2_ctrl_new_std(hdl, &vicodec_ctrl_ops, ctx->is_enc ?
> >> +				  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT :
> >> +				  V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
> >> +				  VICODEC_REC_BUFS, VICODEC_REC_BUFS, 1,
> >> +				  VICODEC_REC_BUFS);
> >> +
> >>  	if (ctx->is_stateless)
> > 
> > This could be replaced by an else branch.
> 
> Correct, I'll do that.

-- 
Regards,

Sakari Ailus

