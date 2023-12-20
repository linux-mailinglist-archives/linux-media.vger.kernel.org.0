Return-Path: <linux-media+bounces-2680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C2C8198D5
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 07:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23F9C28875F
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 06:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222B214AA6;
	Wed, 20 Dec 2023 06:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l4MgsIBL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58D71CA91
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 06:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A028833;
	Wed, 20 Dec 2023 07:50:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1703055030;
	bh=MFI5a8Ks+vVRa4zIfQoK1Y7GxzV0NV6BlyGDSxLM4Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l4MgsIBL80l4d4wncRVmpnb5Qz+wNmF8vagvm0QfrX8886rR4yMb859U085QhdXDW
	 0XGA62jg9+6nEKPmpfcwI9w+63AzMGu9qbWKFL890E28gGvIxfzKChPABLtfXfBYoH
	 3ZudjdwCVVIUCzUVaC2YD4ElUJNg6OpyO5V5mVfE=
Date: Wed, 20 Dec 2023 08:51:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	tfiga@chromium.org, senozhatsky@chromium.org,
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
	tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH 11/15] media: intel/ipu6: input system video capture nodes
Message-ID: <20231220065127.GD29638@pendragon.ideasonboard.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-12-bingbu.cao@intel.com>
 <7ed5642c-cb3e-a931-dc83-ed9c6241aa69@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7ed5642c-cb3e-a931-dc83-ed9c6241aa69@linux.intel.com>

Hi Bingbu,

On Wed, Dec 20, 2023 at 11:42:47AM +0800, Bingbu Cao wrote:
> On 7/27/23 3:15 PM, bingbu.cao@intel.com wrote:
> > From: Bingbu Cao <bingbu.cao@intel.com>
> > 
> > Register v4l2 video device and setup the vb2 queue to
> > support basic video capture. Video streaming callback
> > will trigger the input system driver to construct a
> > input system stream configuration for firmware based on
> > data type and stream ID and then queue buffers to firmware
> > to do capture.
> > 
> > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > ---
> >  .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  864 ++++++++++++
> >  .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   97 ++
> >  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1237 +++++++++++++++++
> >  .../media/pci/intel/ipu6/ipu6-isys-video.h    |  133 ++
> >  4 files changed, 2331 insertions(+)
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> > new file mode 100644
> > index 000000000000..c683a1b7c91f
> --snip--
> 
> > +static const struct vb2_ops ipu6_isys_queue_ops = {
> > +	.queue_setup = queue_setup,
> > +	.wait_prepare = vb2_ops_wait_prepare,
> > +	.wait_finish = vb2_ops_wait_finish,
> > +	.buf_prepare = buf_prepare,
> > +	.start_streaming = start_streaming,
> > +	.stop_streaming = stop_streaming,
> > +	.buf_queue = buf_queue,
> > +};
> > +
> > +int ipu6_isys_queue_init(struct ipu6_isys_queue *aq)
> > +{
> > +	struct ipu6_isys *isys = ipu6_isys_queue_to_video(aq)->isys;
> > +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> > +	int ret;
> > +
> > +	/* no support for userptr */
> > +	if (!aq->vbq.io_modes)
> > +		aq->vbq.io_modes = VB2_MMAP | VB2_DMABUF;
> 
> 
> There are some improvement and bug fixing in vb2 USERPTR in the past
> months, I remember someone told me the userptr is buggy, I remove the
> USERPTR support from current IPU6 ISYS driver. However, there is some
> userspace application still need the USERPTR, so I am not sure whether
> I should add it back. Do you have any suggestion?

Modern applications should really not use USERPTR, so I wouldn't add it
back. It's still a deprecated interface.

In the vast majority of cases, the PSYS will be used through libcamera,
which doesn't use USERPTR. I expect the remaining use cases to be very
specialized and not rely on pre-existing code that would require
USERPTR.

-- 
Regards,

Laurent Pinchart

