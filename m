Return-Path: <linux-media+bounces-12555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE328FC3EC
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 08:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A1B528483A
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 06:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34A2763EC;
	Wed,  5 Jun 2024 06:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UYMUvPYx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E591D190484
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 06:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717570179; cv=none; b=C9y0GFB7fZmLCPiICcfjzYuDPV6uxDXQFxxKyH70wR2XSPROq2ZKQHMKQyw4cIwJSa9wmy3c+qQz714tEgRiGxLlgG6dhTo5NJWYOXOxLTgN0QX3OUdMwOgzvZ4oHKaLO3LzYGQumEzW5lhpKDGlR8ZQoQh7Ps3uRF6PU4sA4mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717570179; c=relaxed/simple;
	bh=6EjrEi1Dd9K7XF/G2VVLosIQR+8W9/BdFILHYW0a0qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyAl2ks7pxZQOnZWDAyvpA1io9xlGzfUuIv8pzCIv7Px259C0RjXsCJkU8qCtOcABXTkfmd5g4CvBlX0ICQaDov4GHdvVHd1+jORoTUsM9jQArzYxHt+Ju7Gxuyg/QS0VVxG8OxnlHsTsa6EZ59wNm7cBtKGiZJ4eK7lQF9LzNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UYMUvPYx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3807315C5;
	Wed,  5 Jun 2024 08:49:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717570161;
	bh=6EjrEi1Dd9K7XF/G2VVLosIQR+8W9/BdFILHYW0a0qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYMUvPYxAI98sWCOVThdf8LG9bgfJZh0Ywi2OGe7EpcAm7QchZL8aF54lrvx5KRjz
	 gy4IjmiWyinu26jCdObPdXnD/eUMH0kl+TOeMKn+T9XxIZRR7crov7n+m3OVvJfFJZ
	 Am7cVyMbX8xW9Hvy9SXLICDeuxqff3ooNZesi8DU=
Date: Wed, 5 Jun 2024 09:49:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [RFC 0/3] media: videobuf2: Allow driver to override
 vb2_queue.buf_ops
Message-ID: <20240605064909.GB879@pendragon.ideasonboard.com>
References: <20240603152548.107158-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240603152548.107158-1-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

On Mon, Jun 03, 2024 at 05:25:44PM +0200, Jacopo Mondi wrote:
> Hello
> 
>   I have the need to allocate a scratch buffer to mirror the content of the
> vb2_buffer planes (more detail on this on request).
> 
> The allocation of such 'scratch' buffer should ideally be done once, at buffer
> creation time (and released at buffer release time ?)
>
> Looking at the videobuf2 framework implementation I noticed that the ideal entry
> point for this would be vb2_queue.buf_ops.init_buffer, which is called in the
> __vb2_queue_alloc() call path.
> 
> I have noticed that the vb2_queue.buf_ops members seems to be there to be made
> overridable by drivers, but are instead:
> 
> 1) unconditionally set by the framework in vb2_queue_init_name()
> 2) the core helpers are not exported
> 
> hence I was wondering if this is the result some half-baked attempt to make
> them ovverridable or the possibility of override them was instead deprecated.
> As I found no traces of this in the log, I thought it was easier to send an
> RFC.
> 
> I also checked what other entry points I could have used to allocate backing
> memory for a buffer, and I have considered vb2_queue.vb2_ops.buf_init which
> is however called in the vb2_req_prepare() call path (I'm not using the request
> API atm) or in the VIDIOC_PREPARE_BUF call path, which requires ad-hoc
> instrumentation in user space (something I would like to avoid if possibile).
> 
> What do you think ?

I've been thinking more about this. I wonder if you could use
.buf_init() for your use case. It's called in three places:

- __vb2_queue_alloc()
- __prepare_userptr()
- __prepare_dmabuf()

As your scratch buffer needs are limited to the ISP parameters queue,
which should use MMAP only, I think .buf_init() would be just fine.

> Jacopo Mondi (3):
>   media: videobuf2: WARN if !vb2_queue.buf_ops
>   media: Allow drivers to overwrite vb2_queue.buf_ops
>   media: rkisp1-params: Override vb2_queue.buf_ops
> 
>  .../media/common/videobuf2/videobuf2-core.c   | 12 ++++---
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 34 +++++++++++--------
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 18 +++++++++-
>  include/media/videobuf2-core.h                |  7 ++++
>  include/media/videobuf2-v4l2.h                |  8 +++++
>  5 files changed, 60 insertions(+), 19 deletions(-)

-- 
Regards,

Laurent Pinchart

