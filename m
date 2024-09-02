Return-Path: <linux-media+bounces-17341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E469968617
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 13:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4B9F2838F0
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 11:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9912184551;
	Mon,  2 Sep 2024 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EkAzmFBA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E501E87B
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 11:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725276164; cv=none; b=nIkCyJVp7RDdm+bZIAj1k6YPjIaCGaku7y/4KKhss+yKhQKIKQplw2Uug7me8B9L64Rm1Xe03xsrI6AnT4q2hpx7KPHyVLgpnu3v336coHWw8h92p7gJ446O7S9412tjjS4DY8zy2ObqK70jM+Wz47JHvdcoTmgPYdtPPfPNRaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725276164; c=relaxed/simple;
	bh=DkoV/C4N/AGB54eNckVVnTKL8exK7NJGVHIIPBDuyyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlyGaGUJ+DJBxq3IiSXVBBKAkUwkyIBZ13+mIJqRaMuZnZ0f6JWtxJspD3NpmQdSUK5w5OXDEQAbCPj+6DWhSztMkdYy8oQBAqJx7YkBbDVBDmMlLIbyz26QpJ+lak+i4wkn5lbsHSzvd+LfxwnWgVXUSoEY1+OLb+C8hvin5+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EkAzmFBA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-54-22.net.vodafone.it [5.90.54.22])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 571B1720;
	Mon,  2 Sep 2024 13:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725276088;
	bh=DkoV/C4N/AGB54eNckVVnTKL8exK7NJGVHIIPBDuyyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EkAzmFBA4FJ6aOdUi2dQVd0SEccrNf66YAX6Qnp7L3tgjGGNfB2eyf49f+o9/0RPq
	 S/HPjklUrt4lLwc1eKwE8aBI9/OrgDqEALvGuae+QbHq09PoSB70wag8AmvI6dH+Cy
	 NdENA6Aetg/7dFzag91tulYzS7sM3H0B1W46CVB0=
Date: Mon, 2 Sep 2024 13:22:35 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/4] media: pisp_be: add missing wait_prepare/finish ops
Message-ID: <wvshtsjm4ruvbyzu5na3vshyfspmzhldybkyz7r5hg6nytdaq5@nctsjagloqf4>
References: <cover.1725265884.git.hverkuil-cisco@xs4all.nl>
 <dbe984e9d94781de82a157e96274db04774cbc27.1725265884.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dbe984e9d94781de82a157e96274db04774cbc27.1725265884.git.hverkuil-cisco@xs4all.nl>

Hi Hans

On Mon, Sep 02, 2024 at 10:31:23AM GMT, Hans Verkuil wrote:
> Without these ops the v4l2-compliance blocking wait test will fail.
> These ops are required to ensure that when VIDIOC_DQBUF has to
> wait for buffers to arrive, the queue lock is correctly released
> and retaken. Otherwise the wait for a buffer would block all other
> queue ioctls.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I can confirm it fixes a previously failing test

was:

                fail: v4l2-test-buffers.cpp(3050): !thread_streamoff.done
                fail: v4l2-test-buffers.cpp(3078): testBlockingDQBuf(node, q)
	test blocking wait: FAIL

now:
	test blocking wait: OK

Acked-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Tested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index 65ff2382cffe..7ce3be626c4a 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -964,6 +964,8 @@ static const struct vb2_ops pispbe_node_queue_ops = {
>  	.buf_queue = pispbe_node_buffer_queue,
>  	.start_streaming = pispbe_node_start_streaming,
>  	.stop_streaming = pispbe_node_stop_streaming,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
>  };
>
>  static const struct v4l2_file_operations pispbe_fops = {
> --
> 2.43.0
>
>

