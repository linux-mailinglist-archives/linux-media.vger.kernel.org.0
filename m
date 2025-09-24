Return-Path: <linux-media+bounces-43046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B46B9964B
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 12:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90F587ADA0A
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 10:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934702DE1E4;
	Wed, 24 Sep 2025 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRlqE/tc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB29E2DBF69;
	Wed, 24 Sep 2025 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758708952; cv=none; b=JxIAJ7lzjqfot8pw6WyC0nQ5G4FEj8okQ7W9OzI5l0rcT7e7+IyDkvj0yPg/xCIcOJkXWoWToprDIfG/bWSVpYq52eqElHaIMZMQ73VW0FTrZlhnM5iskdm97Jl3PqHEyijnA07gpa1gll25N4qhsmM8P+LKK4XKTOtcmZfwy4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758708952; c=relaxed/simple;
	bh=DvLhw947CblcIdyBFNhtEqAX1eV7V+6cSO3ZZNC0UuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eOEdRzqnNtFuET2TRx4gYsnLIf2aaMRCdYa/XnCSm+fsyp+gAH1IsNZeSIz+L28fr9U0mpu2sDNf0r7Ub3Vc0NPivfpLDhMVxL+jAQdFF4XcAnxHPvEp8d3+SSF923byAac+bbzNtfJR5VRdDpCR7dL36dWsn10RjBdJmHPGrF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRlqE/tc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80951C2BCAF;
	Wed, 24 Sep 2025 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758708952;
	bh=DvLhw947CblcIdyBFNhtEqAX1eV7V+6cSO3ZZNC0UuQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lRlqE/tcDWOs7fia3v9/EHCjzmuNXAFNG43/LCa1FTwxC3jmAKjLI+ZcF0IDmHPJL
	 P/l6nR995ioS/xTq5axHljw2J8kZpau6IRjpTd745QRLwgE8bKYUduwd9NAnEBXO1g
	 bR++Q3A2bSg2QAiGHLrVcByn/j8LYMz+V2mMxdvj8QPWz7iGioUIYbgtuR8726MTw/
	 h+b+7EQADZpUa/4m8po0u9bQNQHs1K1g2ODO2qS+z1OsHmoqV3s6lq9C44chBvFH1O
	 zpSq87UwzU0VaR/r7VGTh7eweThTE8f+zZ738TEOQyZNlyA71olvt5i6Jdra4tSDoM
	 Rslb+YbWRDHfw==
Date: Wed, 24 Sep 2025 12:15:45 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, Ricardo
 Ribalda <ribalda@chromium.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Ma Ke <make24@iscas.ac.cn>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] media: v4l2-core: Introduce state management
 for video devices
Message-ID: <20250924121545.1456cbea@foz.lan>
In-Reply-To: <20250919-vdev-state-v2-1-b2c42426965c@ideasonboard.com>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
	<20250919-vdev-state-v2-1-b2c42426965c@ideasonboard.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 19 Sep 2025 15:25:53 +0530
Jai Luthra <jai.luthra@ideasonboard.com> escreveu:

> Similar to V4L2 subdev states, introduce state support for video devices
> to provide a centralized location for storing device state information.
> This includes the current (active) pixelformat used by the device and
> the temporary (try) pixelformat used during format negotiation.

I didn't look at the patch series yet, so I may be just jumping too
fast here, but storing "try" attempts doesn't seem the right thing to
do.

Btw, IMHO, the first patch on this series should be against documentation,
where you would be describing not only the new feature with the supported 
states, but also the state machine transitions that are supported,
preferably with some graphs.

So, before actually looking on any code changes, I'd like to see a clear
description of this new feature, what it is proposing to address, how
and what impacts (if any) this would bring to userspace.

The current diffstat:

 include/media/v4l2-ctrls.h                         |   5 +-
 include/media/v4l2-dev.h                           |  84 +++++
 include/media/v4l2-fh.h                            |   2 +
 include/media/v4l2-ioctl.h                         | 238 ++++++-------
 include/media/v4l2-mem2mem.h                       |  48 ++-
 include/media/videobuf2-v4l2.h                     |  33 +-

implies that this affects for now only Documentation/driver-api/media/...

> In the
> future, this may be extended or subclassed by device drivers to store
> their internal state variables.
> 
> Also introduce a flag for drivers that wish to use this state
> management. When set, the framework automatically allocates the state
> during device registration and stores a pointer to it within the
> video_device structure.
> 
> This change aligns video devices with V4L2 subdevices by storing
> hardware state in a common framework-allocated structure. This is the
> first step towards enabling the multiplexing of the underlying hardware
> by using different software "contexts", each represented by the combined
> state of all video devices and V4L2 subdevices in a complex media graph.

... but when you mention "contexts", I'm assuming that you're aiming
at either userspace API changes and/or behavoral changes that will
affect uAPI as well.

Thanks,
Mauro

