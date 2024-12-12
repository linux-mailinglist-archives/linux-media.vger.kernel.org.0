Return-Path: <linux-media+bounces-23345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E889EF4AE
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 18:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47B151883251
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 17:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA93F2288FD;
	Thu, 12 Dec 2024 16:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="isMdK/fn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B7E216E14
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734022440; cv=none; b=YzOe4CyOUKsvZlZAhaPyHaEE+qQcZqtOsQ9ha4lLFvFx2H4vzUFguswTPGR5xpyKelnY8QoDmJfmE03oLTzz8UrqHbBDUsKpn6j8b+43MYVwK7LMX9jqmbshQ+qRJesJdvK4S12yC550+ncOZS+FcBJhoHkB0FK+Xon1Mq1UdcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734022440; c=relaxed/simple;
	bh=cYNTO+8wzzEpKOwhmZtdPutjjRRu4DmUDVrMFgf9zw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyHAmPUuAE+H/VKAk5d74qM3oJolVApk/KaqJW2ip6EqqHn8s67YsYh7lmsP4GrBcYpU6cJzBmdqu2Rr0NxfM/wCIAvYHOhjMJh4XergCUM/e+XRv9+AB3nUUNWLKHQ5gViq2eNXojD51vDzpkeLqPQ9i61rUUweLLLY8tm3+1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=isMdK/fn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94504316;
	Thu, 12 Dec 2024 17:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734022402;
	bh=cYNTO+8wzzEpKOwhmZtdPutjjRRu4DmUDVrMFgf9zw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=isMdK/fnzlRYDZd5IaaxtMyDFZMH9hI8aWvWHfFnHhtzD7VDTlGJ3Iz4NLPnxyCVC
	 xfwnenkQr/WMw8UPmqN52OjiENWZjvW5preRc4VBJ/1ymSIuICDUb5IXYBSCq4tczq
	 Pw+LOja1lXEzBq9c2zFxW9LqxmHEvPx4FtMA20jA=
Date: Thu, 12 Dec 2024 17:53:53 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v7 3/5] media: Documentation: Update link frequency
 driver documentation
Message-ID: <uk6uc7i3v6bpuphqvrhbkqisammkimgbgoas5g4tsakkcbj2jh@d4rss77am2c2>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210075906.609490-4-sakari.ailus@linux.intel.com>

Hi Sakari

On Tue, Dec 10, 2024 at 09:59:04AM +0200, Sakari Ailus wrote:
> Add the get_mbus_config() as the means for conveying the link frequency
> towards the receiver drivers.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/driver-api/media/tx-rx.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> index dd09484df1d3..1430c330fd52 100644
> --- a/Documentation/driver-api/media/tx-rx.rst
> +++ b/Documentation/driver-api/media/tx-rx.rst
> @@ -49,6 +49,10 @@ Link frequency
>  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
>  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
>
> +On devices where the link frequency isn't configurable, the link_freq field of
> +struct v4l2_mbus_config is recommended over controls for conveying the link
> +frequency to the downstream driver in the pipeline.

When read in its entirety, the paragraphs

 Link frequency
 ^^^^^^^^^^^^^^

 The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
 receiver the frequency of the bus (i.e. it is not the same as the symbol rate).

 On devices where the link frequency isn't configurable, the link_freq field of
 struct v4l2_mbus_config is recommended over controls for conveying the link
 frequency.

Sounds simpler without the last 7 words.

A nit and just tastes maybe

I like where this is going!

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>


> +
>  ``.enable_streams()`` and ``.disable_streams()`` callbacks
>  ^^^^^^^^^^^^^^^^^^^^^^^^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> --
> 2.39.5
>
>

