Return-Path: <linux-media+bounces-53106-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKO7BO9Bl2lXwAIAu9opvQ
	(envelope-from <linux-media+bounces-53106-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 18:01:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B92BF160E2E
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 18:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01F1D3034C9C
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 17:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1FA34DB4A;
	Thu, 19 Feb 2026 17:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p25jL6qP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40EC27979A;
	Thu, 19 Feb 2026 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771520453; cv=none; b=d4kKVrpQv2nCb4wl5lXHpxWTOfYuZH0PT9FOB5iF7LZtrHYK8mGwRiB6KxSXrG6gCWDq4pqMLXSLpwmcgcQiTodjEhjOa4Ju9UQvriIWHCV2w3ctnfJTToZN330gbQ5FjO5TOiCZtBGZ3nqNbjIwTgNp1Y5iDcMgqmGod6sxzl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771520453; c=relaxed/simple;
	bh=+bJb8RAUEGHe8xLGRMHWSourYuWFNASIziuTwS8aCok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oi0PWePCYqgQ+LbP37UJxeMWgTASRHZZZCRAcnnQBIHH4MeeiR5PNvXtNW60iE4k/I1bdiMZWvJeR5kPDCmtZiW2K3Mo65JSqaccKuYFN3Anhri3apVrBaWGSnVUrty51uoYJmbJw54QC7I2a0Gwbv5l8yREV6fuDyQ+aqcrrD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p25jL6qP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [83.245.237.175])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2D10755C;
	Thu, 19 Feb 2026 17:59:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771520396;
	bh=+bJb8RAUEGHe8xLGRMHWSourYuWFNASIziuTwS8aCok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p25jL6qPmnFmkBcyC8A8dXf8xXvrzOWBzsJn4Ux841mXCS0ZyncZ3QnzdQC+gJE8W
	 QLRGk9gON41wwd4iIFLQMWFilucJbxZa86JpDMbIq5NtgkYJAw+SFVIYjR746In9bP
	 0VMMLw97wf0sABn7MygMiSSh5RxYmPTtgQnVWuWQ=
Date: Thu, 19 Feb 2026 18:00:46 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: comply with minimum number
 of buffers requirement
Message-ID: <20260219170046.GA626936@killaraus.ideasonboard.com>
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
 <20260216-rkcif-fixes-v1-2-b16db20b6d68@collabora.com>
 <20260219091301.GF520738@killaraus.ideasonboard.com>
 <d701a97d-6051-4a32-ada6-bf014e385c68@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d701a97d-6051-4a32-ada6-bf014e385c68@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53106-lists,linux-media=lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[collabora.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[stable.kernel.org:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,collabora.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: B92BF160E2E
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 05:19:46PM +0100, Michael Riesch wrote:
> On 2/19/26 10:13, Laurent Pinchart wrote:
> > On Mon, Feb 16, 2026 at 02:49:57PM +0100, Michael Riesch via B4 Relay wrote:
> >> From: Michael Riesch <michael.riesch@collabora.com>
> >>
> >> Each stream requires CIF_REQ_BUFS_MIN=1 buffers to enable streaming.
> >> However, it failed with only one buffer provided.
> >>
> >> Comply with the minimum number of buffers requirement and accept
> >> exactly one buffer.
> >>
> >> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
> >> Cc: stable@kernel.org
> >> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> >> ---
> >>  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 41 +++++++++++-----------
> >>  1 file changed, 21 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> >> index e00010a91e8b..5a5ab9e7e86e 100644
> >> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> >> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> >> @@ -106,19 +106,6 @@ static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
> >>  {
> >>  	struct v4l2_pix_format_mplane *pix = &stream->pix;
> >>  
> >> -	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
> >> -	if (!stream->buffers[0])
> >> -		goto err_buff_0;
> >> -
> >> -	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
> >> -	if (!stream->buffers[1])
> >> -		goto err_buff_1;
> >> -
> >> -	if (stream->queue_buffer) {
> >> -		stream->queue_buffer(stream, 0);
> >> -		stream->queue_buffer(stream, 1);
> >> -	}
> >> -
> >>  	stream->dummy.size = pix->num_planes * pix->plane_fmt[0].sizeimage;
> >>  	stream->dummy.vaddr =
> >>  		dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
> >> @@ -132,16 +119,30 @@ static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
> >>  			stream->dummy.buffer.buff_addr[i - 1] +
> >>  			pix->plane_fmt[i - 1].bytesperline * pix->height;
> >>  
> >> -	return 0;
> >> +	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
> >> +	if (!stream->buffers[0])
> >> +		goto err_buff_0;
> > 
> > Why do you move this after allocation of the dummy buffer, to then add
> > dma_free_attrs() in the err_buff_0 error path ?
> 
> To keep the two rkcif_stream_pop_buffer calls together. We need to
> allocate the dummy in any case, but in case the second pop fails we use
> it -- this was not the case before.

I suppose it's easier than returning buffers[0] in the dummy buffer
allocate error path. Works for me.

> >> -err_dummy:
> >> -	rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEUED);
> >> -	stream->buffers[1] = NULL;
> >> +	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
> >> +	if (!stream->buffers[1]) {
> >> +		stream->buffers[stream->frame_phase] = &stream->dummy.buffer;
> >> +		stream->buffers[stream->frame_phase]->is_dummy = true;
> >> +	}
> >> +
> >> +	if (stream->queue_buffer) {
> >> +		stream->queue_buffer(stream, 0);
> >> +		stream->queue_buffer(stream, 1);
> >> +	}
> >> +
> >> +	return 0;
> >>  
> >> -err_buff_1:
> >> -	rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEUED);
> >> -	stream->buffers[0] = NULL;
> >>  err_buff_0:
> >> +	dma_free_attrs(stream->rkcif->dev, stream->dummy.size,
> >> +		       stream->dummy.vaddr,
> >> +		       stream->dummy.buffer.buff_addr[0],
> >> +		       DMA_ATTR_NO_KERNEL_MAPPING);
> >> +	stream->dummy.vaddr = NULL;
> >> +err_dummy:
> >>  	return -EINVAL;
> > 
> > You can drop the err_dummy label and return -EINVAL directly. Except you
> > should probably return -ENOMEM as the failure comes from
> > dma_alloc_attrs().
> 
> Makes sense, will fix.
> 
> >>  }
> >>  

-- 
Regards,

Laurent Pinchart

