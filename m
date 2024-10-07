Return-Path: <linux-media+bounces-19189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD91F9937A0
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 21:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D7A8B220B3
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 19:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916221DE3B7;
	Mon,  7 Oct 2024 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tU/EBwfP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CDE13698F
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 19:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728330590; cv=none; b=u0PKfZUGIyue2MdNqQej+nqueKBbIXPHKhrWeMXQYDKsS5+3FV0BlkbiIm3uM4Po8xI0B279GQeWI12Jeoc1Z5up2yB6seHaE9lfi/6cwzLJJZoBwkIPsVy0ZQ2E9bBJ/53/jaUYokJLbrO6LqvXrGL6xtauFIy7TJuEV0IWNp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728330590; c=relaxed/simple;
	bh=4lv2D8OcwpPHMPgvBSLnL6NWhJmkcprVj/ll4Snjfvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHq7rShLDSgA9+P5mnu4fcg+q4b+j5FlZ0To+6ejQl6TrnItle/KIf8OQBjW5ubWQHWXQ2+9xoKfLqmwUqq8CcRFDA0+cbsQVk0Fklb70GrC1ys4pV08nJ46paY7oq72lhQH9e2YDr5qaORHswcrTLjKrK8/9uXKXo3zdcPCOYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tU/EBwfP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [132.205.230.14])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A59A75A;
	Mon,  7 Oct 2024 21:48:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728330488;
	bh=4lv2D8OcwpPHMPgvBSLnL6NWhJmkcprVj/ll4Snjfvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tU/EBwfPmh8EIdW9rfpS0Gteao0QxaRO2aIQ8z1V58kqIvydydmcWzy8ZUEQmthOg
	 I0JgW5mb2517NkwMcfyq/rqB6ZEZGqGg53YET1ljfZLMcZB8kir8C98yvPh/hHvsP/
	 2w5oo44ojew2cXLj/6xKPPZ9tobAgHutjTd7h+T4=
Date: Mon, 7 Oct 2024 22:49:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
	Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH] media: rkisp1: Reduce min_queued_buffers to 1
Message-ID: <20241007194939.GJ14766@pendragon.ideasonboard.com>
References: <20241007124225.63463-1-jacopo.mondi@ideasonboard.com>
 <20241007125730.yn6xinehhm73yqob@basti-XPS-13-9310>
 <20241007134734.GA7439@pendragon.ideasonboard.com>
 <20241007140501.2rvqu6rrgy26uwl5@basti-XPS-13-9310>
 <g75gbejsguk5jk46ppbfrfmul6ynp4ixo2tqv27445bwcyuagm@vjcoagkjj6pg>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <g75gbejsguk5jk46ppbfrfmul6ynp4ixo2tqv27445bwcyuagm@vjcoagkjj6pg>

On Mon, Oct 07, 2024 at 09:35:49PM +0200, Jacopo Mondi wrote:
> Hi Sebastian,
> 
> On Mon, Oct 07, 2024 at 04:05:01PM GMT, Sebastian Fricke wrote:
> > On 07.10.2024 16:47, Laurent Pinchart wrote:
> > > On Mon, Oct 07, 2024 at 02:57:30PM +0200, Sebastian Fricke wrote:
> > > > Hey Jacopo,
> > > >
> > > > On 07.10.2024 14:42, Jacopo Mondi wrote:
> > > > > There apparently is no reason to require 3 queued buffers to call
> > > > > streamon() for the RkISP1 as the driver operates with a scratch buffer
> > > > > where frames can be directed to if there's no available buffer provided
> > > > > by userspace.
> > > > >
> > > > > Reduce the number of required buffers to 1 to allow applications to
> > > > > operate with a single queued buffer.
> > > > >
> > > > > Tested with libcamera, by operating with a single capture a request. The
> > > > > same request (and associated capture buffer) gets recycled once
> > > > > completed. This of course causes a frame rate drop but doesn't hinder
> > > > > operations.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > ---
> > > > >
> > > > > Adam,
> > > > >    a few months ago you were exercizing your pinhole app with a single capture
> > > > > request for StillCapture operations and you got the video device to hang because
> > > > > no enough buffers where provided.
> > > > >
> > > > > This small change should be enough to unblock you. Could you maybe give it a
> > > > > spin if you're still working on this ?
> > > > >
> > > > > Thanks
> > > > >    j
> > > > > ---
> > > > >
> > > > >  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 +---
> > > > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > > > index 2bddb4fa8a5c..34adaecdee54 100644
> > > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > > > @@ -35,8 +35,6 @@
> > > > >  #define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
> > > > >  #define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"
> > > > >
> > > > > -#define RKISP1_MIN_BUFFERS_NEEDED 3
> > > > > -
> > > > >  enum rkisp1_plane {
> > > > >  	RKISP1_PLANE_Y	= 0,
> > > > >  	RKISP1_PLANE_CB	= 1,
> > > > > @@ -1563,7 +1561,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
> > > > >  	q->ops = &rkisp1_vb2_ops;
> > > > >  	q->mem_ops = &vb2_dma_contig_memops;
> > > > >  	q->buf_struct_size = sizeof(struct rkisp1_buffer);
> > > > > -	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
> > > >
> > > > It looks like RKISP1_MIN_BUFFERS_NEEDED is used only here, so can you
> > > > remove the define as well?
> > >
> > > Isn't that exactly what this patch is doing ?
> >
> > Oh *facepalm* ... I missed that please disregard ...
> >
> > but my question below remains whether to not just change the value.
> 
> Do you mean
> 
> -#define RKISP1_MIN_BUFFERS_NEEDED 3
> +#define RKISP1_MIN_BUFFERS_NEEDED 1
> 
> ?
> 
> I would rather avoid defining a value used in a single place. If it
> was some magic number a macro name would maybe help giving come
> context, but considering this is assigned to min_queued_buffers it's
> imho clear enough ?

I find it clear enough, I prefer dropping the macro as you do in this
patch.

> > > > rg 'RKISP1_MIN_BUFFERS_NEEDED'
> > > > drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > > 38:#define RKISP1_MIN_BUFFERS_NEEDED 3
> > > > 1566:	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
> > > >
> > > > Or maybe just change the value, but I am not sure whether this can be
> > > > considered a magic value.
> > > >
> > > > > +	q->min_queued_buffers = 1;
> > > > >  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > > > >  	q->lock = &node->vlock;
> > > > >  	q->dev = cap->rkisp1->dev;

-- 
Regards,

Laurent Pinchart

