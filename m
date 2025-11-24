Return-Path: <linux-media+bounces-47644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E37C7F66A
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 09:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 906E04E2F53
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 08:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26AB8261B9F;
	Mon, 24 Nov 2025 08:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e2eoZ3bE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA8527472
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763973444; cv=none; b=I4t32YI/ye5Tv/IWBDoUuYu3dGSS2FdKH/wvILMhVBUzIhftKL/vGFtBc1xI9gYoE/JnJFl8UTzrcagrapk8qj0ZEZ+ZydM88cKcPUR0CO1mHO22OPdU9l7hVrW6Aof7z6zZR7j9+WC3yuIsByilC49souCDGyzcsos2jZBeOEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763973444; c=relaxed/simple;
	bh=m3sWEgPS5R617ojX6IJg3P4UNQLHcAj431mC23Q5Mr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iz0S83kleprXjsLQyxZ5Jy0FVtt9K0/VpFUab4SVnn7QX29ePpD9vucEBoekV/GKp4V2JLM/5/M4cXfJrMPfOkPXVRlzni6ncauhikkgYjJcHdWGM5j96HhbkaWKNk1yeToSXTEg1EAXz7RnNiFtt0oetYYAN7mea0RdAa5nBGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e2eoZ3bE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-137-64.net.vodafone.it [5.90.137.64])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EC2389A;
	Mon, 24 Nov 2025 09:35:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763973309;
	bh=m3sWEgPS5R617ojX6IJg3P4UNQLHcAj431mC23Q5Mr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e2eoZ3bEjUHsiQ0hEdvj7fqP+EJkpdYavBjAPXt+sgFmuDqDgnH6zf29BotTVSa9H
	 d0s4Y0z97ZEeQmiqZkBzTAZ/HU3FcW8qyveXYmxfxAVP2f44b+Osz8XcuXLIi3qo9z
	 SxMBx1PpYI/2moRfhpV3CUPDfBbhieHu3Gp95Coc=
Date: Mon, 24 Nov 2025 09:37:14 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sune Brian <briansune@gmail.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [HELP] V4L2 kept reporting CROPCAP fail
Message-ID: <3qt2yxwubrxhbhst5o2ig5ng4wqokzfg6uqzrtc2lfzq2cjbds@uwdb3zg2a7vi>
References: <CAN7C2SA34JN71qvqyefmr9h11SsmCaeGGVyc=GW408+MrC-aRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAN7C2SA34JN71qvqyefmr9h11SsmCaeGGVyc=GW408+MrC-aRg@mail.gmail.com>

Hi Brian

On Sat, Nov 22, 2025 at 04:34:13AM +0800, Sune Brian wrote:
> Dear v4l mailing members,
>
> This is Brian trying to seek help on the following issue.
>
> * Platform using: Nanopi-Neo4 (RK3399)
> * Kernel version: 6.12 & 6.18

Is this a mainline kernel or a Rockchip BSP ? (tbh I've no idea if
rockchip BSP ships a different camera/ISP driver than mainline..)

> * Issue: CROPCAP fail warming and possible stall on v4l2
>
> More information:
>
> The MIPI camera is functioning on both 6.12&6.18.
> However, no matter preview or capturing there is
> a warming message kept reports and cannot found
> possible root cause.
>
> Message as follows:
> v4l2 gstv4l2object.c:5032:gst_v4l2_object_get_crop_rect:<v4l2src0:src>

this is gstreamer reporting an error.

I would start by suggesting increasing the gstreamer debug (plenty of
resources online)

However, if you're trying to capture from a camera going through the ISP
the v4l2src plugin from gstreamer shouldn't work, so I suspect you
might be on a different software stack than mainline linux and
gstreamer or you are using a different camera than what I'm thinking
of.

Could you provide more details on your setup, what application you're
capturing with etc etc ?


> VIDIOC_CROPCAP failed
>
> Thank you,
> Brian
>

