Return-Path: <linux-media+bounces-16881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B996F96054F
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 11:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B4F3281D6E
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 09:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6189719D880;
	Tue, 27 Aug 2024 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K7gby9Mg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD91676056;
	Tue, 27 Aug 2024 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724750135; cv=none; b=Wkqk9IOwUam/yhGTb/EvOKJnJZlkeja2/ga1oFSQCU7Hq3DiPbmTvlrHLjKlW2K+5U4WE4YiVMw9WKReengyVGUumxfFZA3QhTYzpA+Kdohfrq5z8Yz9JOMIiNqiA0AQW9ePfiRjY2p4129XyelnrNoTWaCQnfJZGrDzOeF/seE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724750135; c=relaxed/simple;
	bh=gHLSR6EWlBDyP7uNTxzYJpnHjzNAgAPqslnvAKgEBoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANSnc/2cq25Fhaqtwh+t8Act0zpLTyhv6xGV2ZQpi1Hc2WBEu9wBJJsoZnagVWaFrTc4Oss4+TcMp8qQcwNO+REpftS0SF7At8IxcZsi1fBennRmG296lbjVzHAfh+ZfgVAKv5Gg0rJLzZjNBYoC2MHgWDqGHkftCkoGna6mcPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K7gby9Mg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19F3D9FF;
	Tue, 27 Aug 2024 11:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724750065;
	bh=gHLSR6EWlBDyP7uNTxzYJpnHjzNAgAPqslnvAKgEBoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7gby9MgI6mjW7AQmEd56dQL//qdFWrUFN+I/thyAYwuaDPSBqyO2B3PpGLFEErqO
	 /FTN3FqIl0LP3V36McKAYc/vOZ35gu/QF6c9C1enXmnlkO0zajpBd9rn4vC8oXfuA5
	 7enZAhur9BRstjlSo1IIG1ZklbrzvBL1ecENdfeo=
Date: Tue, 27 Aug 2024 12:15:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: videobuf2: Drop minimum allocation requirement of
 2 buffers
Message-ID: <20240827091528.GD23129@pendragon.ideasonboard.com>
References: <20240825232449.25905-1-laurent.pinchart+renesas@ideasonboard.com>
 <fbdc2a88-bffc-4603-8ceb-25817967ade8@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fbdc2a88-bffc-4603-8ceb-25817967ade8@xs4all.nl>

Hi Hans,

Please let me know if you expect a pull request, otherwise I'll consider
you will take this in your tree.

On Mon, Aug 26, 2024 at 08:31:13AM +0200, Hans Verkuil wrote:
> On 26/08/2024 01:24, Laurent Pinchart wrote:
> > When introducing the ability for drivers to indicate the minimum number
> > of buffers they require an application to allocate, commit 6662edcd32cc
> > ("media: videobuf2: Add min_reqbufs_allocation field to vb2_queue
> > structure") also introduced a global minimum of 2 buffers. It turns out
> > this breaks the Renesas R-Car VSP test suite, where a test that
> > allocates a single buffer fails when two buffers are used.
> > 
> > One may consider debatable whether test suite failures without failures
> > in production use cases should be considered as a regression, but
> > operation with a single buffer is a valid use case. While full frame
> > rate can't be maintained, memory-to-memory devices can still be used
> > with a decent efficiency, and requiring applications to allocate
> > multiple buffers for single-shot use cases with capture devices would
> > just waste memory.
> > 
> > For those reasons, fix the regression by dropping the global minimum of
> > buffers. Individual drivers can still set their own minimum.
> > 
> > Fixes: 6662edcd32cc ("media: videobuf2: Add min_reqbufs_allocation field to vb2_queue structure")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> > ---
> >  drivers/media/common/videobuf2/videobuf2-core.c | 7 -------
> >  1 file changed, 7 deletions(-)
> > 
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> > index 500a4e0c84ab..29a8d876e6c2 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -2632,13 +2632,6 @@ int vb2_core_queue_init(struct vb2_queue *q)
> >  	if (WARN_ON(q->supports_requests && q->min_queued_buffers))
> >  		return -EINVAL;
> >  
> > -	/*
> > -	 * The minimum requirement is 2: one buffer is used
> > -	 * by the hardware while the other is being processed by userspace.
> > -	 */
> > -	if (q->min_reqbufs_allocation < 2)
> > -		q->min_reqbufs_allocation = 2;
> > -
> >  	/*
> >  	 * If the driver needs 'min_queued_buffers' in the queue before
> >  	 * calling start_streaming() then the minimum requirement is
> > 
> > base-commit: a043ea54bbb975ca9239c69fd17f430488d33522

-- 
Regards,

Laurent Pinchart

