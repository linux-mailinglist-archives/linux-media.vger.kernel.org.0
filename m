Return-Path: <linux-media+bounces-16770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2466B95ED91
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 11:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46F101C2198B
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 09:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19D3145B1F;
	Mon, 26 Aug 2024 09:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RqnuwcP1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AA413C667;
	Mon, 26 Aug 2024 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724665400; cv=none; b=OXRrx0QNkk0CMJJWbBDEi17iaTKrgIDhmAXoojFVHML/X9byBfuKOO9yz8PzDyrXnK8bo99kPLLqdZb4xrZH+hV1FqR3jOJCNsbT/QA4ZVdBF01KuNbDWoX1Y+Tiwl38qu7mf1sa7ZXbaWRv88wgsuRZWKRWITPn86qbBIAx19k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724665400; c=relaxed/simple;
	bh=v70iVqIy22nhqbATkIon/UL25fCmNBuSpmm3WTAapV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+a8aMLtDntvPHadnwZYP4VWXL7oJktrFmVK9xkeONySCnQRT+6VRvqp7yZ4NVpFfvK979XXZt+cwJ1xDDaoYO98Rb8Gb2jt7w+AOI9AlWpDhKmXEbU5HcmOHTMzzE866Becn+LBAPgomFFNer0v6KJwzfWWap2fUwKucS8yPRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RqnuwcP1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D107480;
	Mon, 26 Aug 2024 11:42:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724665329;
	bh=v70iVqIy22nhqbATkIon/UL25fCmNBuSpmm3WTAapV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqnuwcP16vqYRMeTM+k3f5XhLDdnIeo1y/atrX44r7iTGtgpl99n5ffLF2EkhN3lV
	 LEy3gZlU3rVoGlnjlkueL4LmBaU9bwrfCSqqT+JVGXHlaT0USI7t2vNyetuji9xlpp
	 UVGZ9dc+A1SvGAQZGbGlw6GCYwgYbjvQEWloNKV0=
Date: Mon, 26 Aug 2024 12:43:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to probe()
Message-ID: <20240826094311.GA27596@pendragon.ideasonboard.com>
References: <20240824182120.320751-1-biju.das.jz@bp.renesas.com>
 <6f16a3f7-99bb-47c4-9034-c1f0ccd59546@tuxon.dev>
 <TY3PR01MB11346F3C71013AD71C1556BA1868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346F3C71013AD71C1556BA1868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Mon, Aug 26, 2024 at 08:08:33AM +0000, Biju Das wrote:
> On Monday, August 26, 2024 8:27 AM, claudiu beznea wrote:
> > On 24.08.2024 21:21, Biju Das wrote:
> > > Move request_irq() to probe(), in order to avoid requesting IRQ during
> > > device start which happens frequently. As this function is in probe(),
> > > it is better to replace it with its devm variant for managing the
> > > resource efficiently.
> > >
> > > Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v2->v3:
> > >  * Dropped wrapper function rzg2l_cru_process_irq() and made
> > >    rzg2l_cru_irq() global.
> > >  * Added Rb tag from Laurent.
> > > v1->v2:
> > >  * Updated commit header and description.
> > >  * Moved rzg2l_cru_irq from rzg2l-video.c->rzg2l-core.c and introduced
> > >    rzg2l_cru_process_irq() in video.c to process irq.
> > >  * Dropped image_conv_irq from struct rzg2l_cru_dev
> > >  * Replaced request_irq with its devm variant.
> > > ---
> > >  .../media/platform/renesas/rzg2l-cru/rzg2l-core.c | 13 +++++++++----
> > > .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h  |  6 ++----
> > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c      | 15 ++-------------
> > >  3 files changed, 13 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > index 280efd2a8185..2a2907beb722 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > @@ -242,7 +242,7 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
> > >  static int rzg2l_cru_probe(struct platform_device *pdev)
> > >  {
> > >  	struct rzg2l_cru_dev *cru;
> > > -	int ret;
> > > +	int irq, ret;
> > >
> > >  	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
> > >  	if (!cru)
> > > @@ -270,9 +270,14 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> > >  	cru->dev = &pdev->dev;
> > >  	cru->info = of_device_get_match_data(&pdev->dev);
> > >
> > > -	cru->image_conv_irq = platform_get_irq(pdev, 0);
> > > -	if (cru->image_conv_irq < 0)
> > > -		return cru->image_conv_irq;
> > > +	irq = platform_get_irq(pdev, 0);
> > > +	if (irq < 0)
> > > +		return irq;
> > > +
> > > +	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, IRQF_SHARED,
> > > +			       KBUILD_MODNAME, cru);
> > 
> > Because this is requested w/ IRQF_SHARED the free_irq() ->
> > __free_irq() [1] will call the IRQ handler to simulate an IRQ SHARE
> > scenario where other device generate an interrupt.

Good point, I had missed that.

> Currently CSI driver is not registered any interrupts and CRU is the single user.

Regardless, the fact that the IRQ is requested with IRQF_SHARED means
that the IRQ handler needs to be prepared to be called at any time from
the point of registration to the point the IRQ is freed. This is tested
by CONFIG_DEBUG_SHIRQ=y, which you should enable for testing.

If you don't need to share the interrupt with any other device, you can
drop the IRQF_SHARED. Otherwise, you will need to fix the issue
properly. You can probably wrap the interrupt handling with
pm_runtime_get_if_in_use() and pm_runtime_put() (hoping those functions
can be called from interrupt context).

On a side note, I also I wonder if this issue precludesusage of
devm_request_irq() for shared interrupts, requiring calling free_irq()
manually at remove time to control the sequence of cleanup operations.

> > > +	if (ret)
> > > +		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
> > >
> > >  	platform_set_drvdata(pdev, cru);
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > index a5a99b004322..174760239548 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > @@ -8,6 +8,7 @@
> > >  #ifndef __RZG2L_CRU__
> > >  #define __RZG2L_CRU__
> > >
> > > +#include <linux/irqreturn.h>
> > >  #include <linux/reset.h>
> > >
> > >  #include <media/v4l2-async.h>
> > > @@ -68,8 +69,6 @@ struct rzg2l_cru_ip {
> > >   *
> > >   * @vclk:		CRU Main clock
> > >   *
> > > - * @image_conv_irq:	Holds image conversion interrupt number
> > > - *
> > >   * @vdev:		V4L2 video device associated with CRU
> > >   * @v4l2_dev:		V4L2 device
> > >   * @num_buf:		Holds the current number of buffers enabled
> > > @@ -105,8 +104,6 @@ struct rzg2l_cru_dev {
> > >
> > >  	struct clk *vclk;
> > >
> > > -	int image_conv_irq;
> > > -
> > >  	struct video_device vdev;
> > >  	struct v4l2_device v4l2_dev;
> > >  	u8 num_buf;
> > > @@ -141,6 +138,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
> > >
> > >  int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
> > >  void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
> > > +irqreturn_t rzg2l_cru_irq(int irq, void *data);
> > >
> > >  const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index b16b8af6e8f8..e80bfb9fc1af 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -527,7 +527,7 @@ static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
> > >  	rzg2l_cru_set_stream(cru, 0);
> > >  }
> > >
> > > -static irqreturn_t rzg2l_cru_irq(int irq, void *data)
> > > +irqreturn_t rzg2l_cru_irq(int irq, void *data)
> > >  {
> > >  	struct rzg2l_cru_dev *cru = data;
> > >  	unsigned int handled = 0;
> > > @@ -637,13 +637,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
> > >  		goto assert_aresetn;
> > >  	}
> > >
> > > -	ret = request_irq(cru->image_conv_irq, rzg2l_cru_irq,
> > > -			  IRQF_SHARED, KBUILD_MODNAME, cru);
> > > -	if (ret) {
> > > -		dev_err(cru->dev, "failed to request irq\n");
> > > -		goto assert_presetn;
> > > -	}
> > > -
> > >  	/* Allocate scratch buffer. */
> > >  	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
> > >  					  &cru->scratch_phys, GFP_KERNEL); @@ -651,7 +644,7 @@ static
> > > int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
> > >  		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
> > >  		dev_err(cru->dev, "Failed to allocate scratch buffer\n");
> > >  		ret = -ENOMEM;
> > > -		goto free_image_conv_irq;
> > > +		goto assert_presetn;
> > >  	}
> > >
> > >  	cru->sequence = 0;
> > > @@ -670,9 +663,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
> > >  	if (ret)
> > >  		dma_free_coherent(cru->dev, cru->format.sizeimage, cru->scratch,
> > >  				  cru->scratch_phys);
> > > -free_image_conv_irq:
> > > -	free_irq(cru->image_conv_irq, cru);
> > > -
> > >  assert_presetn:
> > >  	reset_control_assert(cru->presetn);
> > >
> > > @@ -698,7 +688,6 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
> > >  	dma_free_coherent(cru->dev, cru->format.sizeimage,
> > >  			  cru->scratch, cru->scratch_phys);
> > >
> > > -	free_irq(cru->image_conv_irq, cru);
> > >  	return_unused_buffers(cru, VB2_BUF_STATE_ERROR);
> > >
> > >  	reset_control_assert(cru->presetn);

-- 
Regards,

Laurent Pinchart

