Return-Path: <linux-media+bounces-19153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4FA992C6C
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 14:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20DD7B21993
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 12:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1151D27BF;
	Mon,  7 Oct 2024 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="adCQUYAM"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3834D1BB6B8
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 12:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728305873; cv=pass; b=FEoCTLGLgGbany8Wqk5zVZqP1tcYbjBgpGpWvBbEldnbq0bcH9tXSyr/lajjWVJfs+/cHUmtjrmrzueHdo0vpq+I5TOVOCa4An17nVaOMfyu0ZcCOGCT/uhCgmJ3UftmBw+yrgUmHGQX0oJ9caNZ/+T+9hRv1M7Y/gQDKILTm04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728305873; c=relaxed/simple;
	bh=CLJzTI0/rX097ZPLZvGK5jZA0AUsin453pYVGJwiPkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMelzd3acG2kimy09AlHtfJC28Rd8yQowQvAZ1kMIDJBCXrCEFooDKUoF6k/ydh8JdomBCcE1dFMDXpfMN5ItrbAV4j021+hZn+mLwfVIABOqs26hPXSa89znPLAeaFfiyRtM2A4WlhxnAuUS8mFQ6NCLNiMpavR/5TJkeH/mtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=adCQUYAM; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1728305855; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q2JZ4rPrXzEL7lAKiLZmmBDPbjV+oLD8hZ1MMbOuioerpNpbEPYVcQ78XtthzydM1UCiJ6f+QSXO+7d/m9UwvxA3V7s/lMLVl10ZkldpURSMUyj8lpW2mjTk96rXV/gwy4EYK0tWS8Yfnjq+9EsrW7WuEv3c94Lqi+QT2hd9HmY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728305855; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NYoc0B5Hgz71zyrV+GxibMAOQMz3cx6fVveDGcEwky8=; 
	b=lAiBCygwBJD+3IvfpxD3oFrZl8G9ZVH3KPNAJ93deSJxt5hznhih6662/31e5a+VakcuXy/udH7ZlGMjBNmtnGVl/E/Ju9V3NgX3CGr06Qb1IqoTrnY1XEPG7raRd8YZQCt616UZe5THwATOpjaQ4Il0dPYfOnJS83kasJ/VmfM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728305855;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=NYoc0B5Hgz71zyrV+GxibMAOQMz3cx6fVveDGcEwky8=;
	b=adCQUYAMHoB/yhqB04lUnU2yW/a0U9XV/QG6L9ZbN0cjz05mQ0nvNv3RMS4jX8pW
	Xog/QsTkeCsyywxh5N7guSlxehKV/cG3QrUT8D03Nz7ZZU/PuMP9Yxu9actWtqOd4dP
	ph+gqqVm673fqbQWeHFj2LEuq7u8gbWavLF6wG3I=
Received: by mx.zohomail.com with SMTPS id 1728305854622500.54968941240656;
	Mon, 7 Oct 2024 05:57:34 -0700 (PDT)
Date: Mon, 7 Oct 2024 14:57:30 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
	Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH] media: rkisp1: Reduce min_queued_buffers to 1
Message-ID: <20241007125730.yn6xinehhm73yqob@basti-XPS-13-9310>
References: <20241007124225.63463-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241007124225.63463-1-jacopo.mondi@ideasonboard.com>
X-ZohoMailClient: External

Hey Jacopo,

On 07.10.2024 14:42, Jacopo Mondi wrote:
>There apparently is no reason to require 3 queued buffers to call
>streamon() for the RkISP1 as the driver operates with a scratch buffer
>where frames can be directed to if there's no available buffer provided
>by userspace.
>
>Reduce the number of required buffers to 1 to allow applications to
>operate with a single queued buffer.
>
>Tested with libcamera, by operating with a single capture a request. The
>same request (and associated capture buffer) gets recycled once
>completed. This of course causes a frame rate drop but doesn't hinder
>operations.
>
>Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>---
>
>Adam,
>   a few months ago you were exercizing your pinhole app with a single capture
>request for StillCapture operations and you got the video device to hang because
>no enough buffers where provided.
>
>This small change should be enough to unblock you. Could you maybe give it a
>spin if you're still working on this ?
>
>Thanks
>   j
>---
>
> drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>index 2bddb4fa8a5c..34adaecdee54 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>@@ -35,8 +35,6 @@
> #define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
> #define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"
>
>-#define RKISP1_MIN_BUFFERS_NEEDED 3
>-
> enum rkisp1_plane {
> 	RKISP1_PLANE_Y	= 0,
> 	RKISP1_PLANE_CB	= 1,
>@@ -1563,7 +1561,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
> 	q->ops = &rkisp1_vb2_ops;
> 	q->mem_ops = &vb2_dma_contig_memops;
> 	q->buf_struct_size = sizeof(struct rkisp1_buffer);
>-	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;

It looks like RKISP1_MIN_BUFFERS_NEEDED is used only here, so can you
remove the define as well?

rg 'RKISP1_MIN_BUFFERS_NEEDED' 
drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
38:#define RKISP1_MIN_BUFFERS_NEEDED 3
1566:	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;

Or maybe just change the value, but I am not sure whether this can be
considered a magic value.

Regards,
Sebastian Fricke

>+	q->min_queued_buffers = 1;
> 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> 	q->lock = &node->vlock;
> 	q->dev = cap->rkisp1->dev;
>--
>2.46.1
>
>

