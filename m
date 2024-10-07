Return-Path: <linux-media+bounces-19154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7E6992DAB
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 15:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 219AA1F219E9
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 13:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB7A1D4326;
	Mon,  7 Oct 2024 13:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s+DeR30J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880081D415D
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 13:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728308866; cv=none; b=uIL0Rz27HcgZHI4of3r4suo3ScU5YDWhOtFAPjDx08bfN70DiUHmJXB9opDbWMmKgmhVllPJ9orcZuxjSROGSh2GpFbBbeC2QHvdu5SetsvnwJWgUar5MNToTYrSA3o4y5uarG1SkxxLcI2hyBkF4duHv3osNSMb3PYWr9hW6Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728308866; c=relaxed/simple;
	bh=qskkxcmC/vCV4Vt/RLO7XR0wYzs5bGYBv2xmxZEFU+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U596Cly0PmV6FXeEOrSbK0DgtiOC3L3rxdyFOjBGoEzVv44s3kImXfgty+cc23VM5a4sLaZQFsHK0mdEs6kJxzTbx8OAtX3y5uWIVpv7/pi/Uo8N/PtspVUCC95YtiDbuuttugKIkCBQMqOMHCAxQsLXZ0mFkIXWBDQF4Knfa2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s+DeR30J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [132.205.230.14])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4FC9D49;
	Mon,  7 Oct 2024 15:46:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728308764;
	bh=qskkxcmC/vCV4Vt/RLO7XR0wYzs5bGYBv2xmxZEFU+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+DeR30JoyYakVNFTJtoLJfUbQRih1vEt/bVWzI+TPTC1wUcBKLj75x6Upv+f6hy9
	 VT+irHGFt3Jbt8JeGSdZgB1Stf3XPeOlnej7Y/qWfweB9tD+/SKZ4xPZX57Ix6RU5z
	 uxm4gnfNWyIiS5TY18c8fyIF9yYeCN8d/p7Gstv0=
Date: Mon, 7 Oct 2024 16:47:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
	Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH] media: rkisp1: Reduce min_queued_buffers to 1
Message-ID: <20241007134734.GA7439@pendragon.ideasonboard.com>
References: <20241007124225.63463-1-jacopo.mondi@ideasonboard.com>
 <20241007125730.yn6xinehhm73yqob@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007125730.yn6xinehhm73yqob@basti-XPS-13-9310>

On Mon, Oct 07, 2024 at 02:57:30PM +0200, Sebastian Fricke wrote:
> Hey Jacopo,
> 
> On 07.10.2024 14:42, Jacopo Mondi wrote:
> > There apparently is no reason to require 3 queued buffers to call
> > streamon() for the RkISP1 as the driver operates with a scratch buffer
> > where frames can be directed to if there's no available buffer provided
> > by userspace.
> > 
> > Reduce the number of required buffers to 1 to allow applications to
> > operate with a single queued buffer.
> > 
> > Tested with libcamera, by operating with a single capture a request. The
> > same request (and associated capture buffer) gets recycled once
> > completed. This of course causes a frame rate drop but doesn't hinder
> > operations.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> > 
> > Adam,
> >    a few months ago you were exercizing your pinhole app with a single capture
> > request for StillCapture operations and you got the video device to hang because
> > no enough buffers where provided.
> > 
> > This small change should be enough to unblock you. Could you maybe give it a
> > spin if you're still working on this ?
> > 
> > Thanks
> >    j
> > ---
> > 
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > index 2bddb4fa8a5c..34adaecdee54 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > @@ -35,8 +35,6 @@
> >  #define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
> >  #define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"
> > 
> > -#define RKISP1_MIN_BUFFERS_NEEDED 3
> > -
> >  enum rkisp1_plane {
> >  	RKISP1_PLANE_Y	= 0,
> >  	RKISP1_PLANE_CB	= 1,
> > @@ -1563,7 +1561,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
> >  	q->ops = &rkisp1_vb2_ops;
> >  	q->mem_ops = &vb2_dma_contig_memops;
> >  	q->buf_struct_size = sizeof(struct rkisp1_buffer);
> > -	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
> 
> It looks like RKISP1_MIN_BUFFERS_NEEDED is used only here, so can you
> remove the define as well?

Isn't that exactly what this patch is doing ?

> rg 'RKISP1_MIN_BUFFERS_NEEDED' 
> drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> 38:#define RKISP1_MIN_BUFFERS_NEEDED 3
> 1566:	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
> 
> Or maybe just change the value, but I am not sure whether this can be
> considered a magic value.
> 
> > +	q->min_queued_buffers = 1;
> >  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> >  	q->lock = &node->vlock;
> >  	q->dev = cap->rkisp1->dev;

-- 
Regards,

Laurent Pinchart

