Return-Path: <linux-media+bounces-1347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD07FD40D
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 11:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43BFC1F20FE8
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2347A1A73D;
	Wed, 29 Nov 2023 10:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oqdRt6ow"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6EDC4;
	Wed, 29 Nov 2023 02:24:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DE29842;
	Wed, 29 Nov 2023 11:23:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701253431;
	bh=Y6AJ/kPLyDOivircGV4x/fYC3/RvS1k47yzPnXLdMyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqdRt6owFMYgaCAV7pN799tF/mF11HYqekY+EQzfpOGqTL4rLzkdOJkis1PKVuI/C
	 QLrBkvODzfLuGVblA56vejCHbZcza/M/V+rQf+Usxfj+KRqvVn41jkyD/gCBFqvRJJ
	 ZLbM9hCj61pwJI4w8W/KDaVEsHalLLAOCSnKEV9U=
Date: Wed, 29 Nov 2023 12:24:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, hverkuil@xs4all.nl,
	mchehab@kernel.org, m.szyprowski@samsung.com,
	matt.ranostay@konsulko.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH 07/55] media: imx8-isi: Stop abusing of
 min_buffers_needed field
Message-ID: <20231129102434.GD18109@pendragon.ideasonboard.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
 <20231127165454.166373-8-benjamin.gaignard@collabora.com>
 <20231127170700.GC31314@pendragon.ideasonboard.com>
 <6fa1ec09-3e30-475e-9718-29d23586753e@collabora.com>
 <CAAFQd5DCVTLpPoKSp_OA6fe_Hqt-oV7=AsCZWSmkJORvLSgUiw@mail.gmail.com>
 <995eb6c2-cc7f-4217-bc37-4ab1a32f36ee@collabora.com>
 <CAAFQd5Bv5kc9TfNM5CkKowvaoRndTmkmU6+0LyCG8YbOKy=hxQ@mail.gmail.com>
 <b68b3fa5-a152-4b23-9451-61a89530512c@collabora.com>
 <CAAFQd5DXhDtcfjgds6qu2YZXkkcvJdygkvtFknrHRGRC5oRHkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5DXhDtcfjgds6qu2YZXkkcvJdygkvtFknrHRGRC5oRHkA@mail.gmail.com>

On Wed, Nov 29, 2023 at 05:39:25PM +0900, Tomasz Figa wrote:
> On Wed, Nov 29, 2023 at 5:28 PM Benjamin Gaignard wrote:
> > Le 29/11/2023 à 05:17, Tomasz Figa a écrit :
> > > On Tue, Nov 28, 2023 at 7:26 PM Benjamin Gaignard wrote:
> > >> Le 28/11/2023 à 10:35, Tomasz Figa a écrit :
> > >>> On Tue, Nov 28, 2023 at 6:31 PM Benjamin Gaignard wrote:
> > >>>> Le 27/11/2023 à 18:07, Laurent Pinchart a écrit :
> > >>>>> On Mon, Nov 27, 2023 at 05:54:06PM +0100, Benjamin Gaignard wrote:
> > >>>>>> 'min_buffers_needed' is suppose to be used to indicate the number
> > >>>>>> of buffers needed by DMA engine to start streaming.
> > >>>>>> imx8-isi driver doesn't use DMA engine and just want to specify
> > >>>>>
> > >>>>> What do you mean, "doesn't use DMA engine" ? The ISI surely has DMA
> > >>>>> engines :-)
> > >>>>
> > >>>> I have done assumption on drivers given if they use or dma_* functions.
> > >>>
> > >>> I suspect the use of vb2_dma_sg_plane_desc() and
> > >>> vb2_dma_contig_plane_dma_addr() may be more correlated to whether
> > >>> there is a DMA involved or not. Usually V4L2 drivers don't really have
> > >>> to deal with the DMA API explicitly, because the vb2 framework handles
> > >>> most of the work.
> > >>
> > >> Unfortunately isn't not true either, for example verisilicon driver use
> > >> these function but doesn't need DMA engine.
> > >
> > > That sounds weird. Why would a driver that doesn't have a DMA engine
> > > need to obtain a scatterlist or the DMA address of the buffer?
> >
> > Just because the hardware needs the physical address of the buffer to access it.
> 
> Right, and the part of the hardware that accesses the memory is called
> a DMA engine.
> 
> > >> I haven't found yet a 100% criteria to decide if driver use or not DMA engine
> > >> so I plan to fix case by case given maintainers remarks.
> > >
> > > Yeah, there probably wouldn't be a way that would give one a 100%
> > > certainty, although I'd still insist that the two functions I
> > > mentioned should be close to that. Of course a driver can use those
> > > functions for some queues, while other queues would be pure software
> > > queues, e.g. for some metadata - a simple grep is not enough. Is that
> > > perhaps the case for the verisilicon driver?
> >
> > Verisilicon hardware block doesn't have IOMMU so it needs the physical
> > addresses of all the buffers it use (input buffer, reference frame buffers, etc...).
> > No DMA engine involved here it is just how the hardware is working.
> 
> I think we need to clarify what you mean by DMA engine. If it's
> basically a standalone hardware block that does the DMA for another
> hardware block, i.e. such as the standalone DMA engines under
> drivers/dma, then I'd like to ask what the relation is between using
> an external DMA engine and min_buffers_needed.

Yes, there seems to have been some confusion, DMA engine != dmaengine.h.

> > Expect functions like dma_release_channel() or being in PCI directory,
> > I don't have found any magical way to know if a driver needs a minimum number of buffers before start streaming.
> > I can only read the code and do assumptions for the other cases.
> > I hope maintainers, like Laurent or you, will answer to this question for each driver.
> 
> In theory that could work too, so hopefully we can achieve that. Some
> drivers may not have very active maintainers... And other maintainers
> who never worked with such drivers are as suited to read the code and
> guess the expected state as you. That said, let's make sure that
> everyone involved does their best, without pushing the task around.

We can rely on individual drivers maintainers for review, but the
initial work needs to make a reasonable effort to analyze the drivers
and find the right value for min_buffers_needed and
min_reqbufs_allocation.

> > >>>> I have considers that all PCI drivers are using DMA engine and
> > >>>> I don't know the design for each drivers so I hope to get this information
> > >>>> from maintainers and fix that in v2.
> > >>>> If imx8-isi driver needs a minimum number of buffers before start streaming
> > >>>> I will do a v2 and use min_dma_buffers_needed instead.
> > >>>>
> > >>>>>> the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
> > >>>>>> That 'min_reqbufs_allocation' field purpose so use it.
> > >>>>>>
> > >>>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > >>>>>> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >>>>>> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> > >>>>>> CC: Shawn Guo <shawnguo@kernel.org>
> > >>>>>> CC: Sascha Hauer <s.hauer@pengutronix.de>
> > >>>>>> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> > >>>>>> CC: Fabio Estevam <festevam@gmail.com>
> > >>>>>> CC: NXP Linux Team <linux-imx@nxp.com>
> > >>>>>> ---
> > >>>>>>     drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
> > >>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>>>>
> > >>>>>> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > >>>>>> index 49bca2b01cc6..81673ff9084b 100644
> > >>>>>> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > >>>>>> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > >>>>>> @@ -1453,7 +1453,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
> > >>>>>>        q->mem_ops = &vb2_dma_contig_memops;
> > >>>>>>        q->buf_struct_size = sizeof(struct mxc_isi_buffer);
> > >>>>>>        q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > >>>>>> -    q->min_buffers_needed = 2;
> > >>>>>> +    q->min_reqbufs_allocation = 2;
> > >>>>>>        q->lock = &video->lock;
> > >>>>>>        q->dev = pipe->isi->dev;
> > >>>>>>

-- 
Regards,

Laurent Pinchart

