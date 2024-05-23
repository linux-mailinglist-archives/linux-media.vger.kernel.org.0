Return-Path: <linux-media+bounces-11800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B9B8CD0AC
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 12:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FDF31F213EA
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD0213D29D;
	Thu, 23 May 2024 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Ccq/lfq7";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="gDk2D1Mk"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0E61C3E
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716461394; cv=pass; b=eXBY8imqjyVDPjNO5LvomdFBSpXFSpMjfU/p6SvfpRAnYirdJcVtq+n3YJh+pWMSYMblM50OYF4vLVz53xj0PiX7vcQbKBeLgvb/l9wEYDMvKOgGrUqrYXk+vhE5qwT4Ogn6C9h2r1c4tmX5CTgkXzftaTaxfaH+wUsNh6PAMfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716461394; c=relaxed/simple;
	bh=LCVwSPVLG8K2SHl5EFsX6KZQGEiYi8f0++wCVDAb78I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=th8Aiy9U4nw1SMx44Il3TRHqs8b+/lApS8oVW+OMJy/9O5OyFJem/W0h4knZtN1FocHUP5y1C8vdNpf3MBrDpBjZ2LUQuZ5lTpqbvrqmKwQCtZSIgnlcGQ8BNVWF1bfX1kKWlNEpsqLeaBZeQ/EaJ3f8uw5W0dbvf/cFdWyP6zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Ccq/lfq7; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=gDk2D1Mk; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4VlQ0r51Ksz49Pyk
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 13:49:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1716461388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uNtx9ReQEwLiLNTAGtBlHkvbVJuUuNXxJcbSSnTArVc=;
	b=Ccq/lfq7x1YDZM6/RL/IGaxwto1FvrsRq8F8Jim8APR+tu6aR1SRhCjxpam5CsUUrs/tQy
	3/C+ZHnJDBnHoBx48MfnN4ft7tXbdp4JELSFLK50TXiP7MAxATZh/sGqH6vH6X3F9BpQo4
	oBA52vAlUJgJqclOpyqHyPale/cZ0Pe6DmZu0KDvaT4GfwqtWszrJqreO74EX9GDb3rYO1
	UtutxVzLiLH/memd3ko8eCaoAKxTz83nHHUDjDY8iLs+tbxktRLXWynZMyd/lzjGIcZI75
	3ZVGYWejHdt8a4t7kQaCYcraiC63cu0MLTNaFrA5rnw+cuMafu2vqBbJyO0v9g==
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VlQ0g3Z3XzyPp;
	Thu, 23 May 2024 13:49:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1716461379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uNtx9ReQEwLiLNTAGtBlHkvbVJuUuNXxJcbSSnTArVc=;
	b=gDk2D1Mkx4io8OhDO2JYXHOxrYsNQpvEizkVUEzk3TPoohalxlau/k4ZG+dh8xl43MDrMk
	pyWqLmEp4tCcXuKX401e2lDfNfrYEkGpSzeZ74WmYAA08iMpK95NEvuZX79iaQOkyveRPT
	QoxmTSFRs5YGXhif83YJHgbNjax1geU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1716461379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uNtx9ReQEwLiLNTAGtBlHkvbVJuUuNXxJcbSSnTArVc=;
	b=MOfKYY8GWt4vGhb1kq+T8XgDLpypL66r6Dg3WFtLzRbadtKtOPp5khsPaBRi+SI/Eb5tY/
	r8DUTQtul3LyTpmWN/SOPBw82poh/5QVnr+sKc1SmYCaq4SJa3YDoKjDhFSp8dnmOB6Tgu
	kSACbUvTVR99Av3wCde6279qLZg8mr8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1716461379; a=rsa-sha256; cv=none;
	b=V450iAANp0WVizmGrdi75QE29Pie2t8Mw+eNc6/+iTnBlIH40Do/sLGOOeE3AdzAtoteZ3
	blx5lKM5dD7ozf4C9k0s9n/uo27M73QOBT43UGSaBZTmLn3itgHjAJVqjQrxqTkrfWuDM0
	LIl+cA6wcVYbscR3wxzSNn8FBzigxto=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4E5C0634C94;
	Thu, 23 May 2024 13:47:00 +0300 (EEST)
Date: Thu, 23 May 2024 10:46:59 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v6 1/7] media: uapi: pixfmt-luma: Document MIPI CSI-2
 packing
Message-ID: <Zk8eo4OZs8gu_k2Q@valkosipuli.retiisi.eu>
References: <20240502110503.38412-1-jacopo.mondi@ideasonboard.com>
 <20240502110503.38412-2-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502110503.38412-2-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

On Thu, May 02, 2024 at 01:04:56PM +0200, Jacopo Mondi wrote:
> The Y10P, Y12P and Y14P format variants are packed according to
> the RAW10, RAW12 and RAW14 formats as defined by the MIPI CSI-2
> specification. Document it.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
> ---
>  Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> index b3c5779521d8..f02e6cf3516a 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -209,3 +209,7 @@ are often referred to as greyscale formats.
>      For Y012 and Y12 formats, Y012 places its data in the 12 high bits, with
>      padding zeros in the 4 low bits, in contrast to the Y12 format, which has
>      its padding located in the most significant bits of the 16 bit word.
> +
> +    The 'P' variations of the Y10, Y12 and Y14 formats are packed according to
> +    the RAW10, RAW12 and RAW14 packing scheme as defined by the MIPI CSI-2
> +    specification.

The CSI-2 specification isn't publicly available. I think you'll need to
add similar examples of the packing the packed raw formats have.

-- 
Kind regards,

Sakari Ailus

