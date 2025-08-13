Return-Path: <linux-media+bounces-39850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C75B256CE
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 00:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C15E5C09C9
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 22:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B492F28EE;
	Wed, 13 Aug 2025 22:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q9fOIFT1"
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE962F39C3
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 22:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755124741; cv=none; b=CNt31WbIKRUJpzrTJXq12EM2otTI7QeWqFWWxtG2QwLzfGF9+MUJ6Fi76KG3ahm4mLEI107C/xpO9zD6Xjh5gZJD68R6sfOAPJ9GJdIOzazTQwnBuPfqIwTBpQLjrhZHbgpLibgNKUDX7Duff0wWDUaEowLviuzRD4k7iUJ277I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755124741; c=relaxed/simple;
	bh=QjRtne0kLAoY9A86Hicu7CesMAkS3OThcblu4TCvP8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/xpTX87Phle/enpbjeaYXXqKJKPqqV3pHl4Eff+chrrFj5RTO2g/ELdj44/09wBe13DCi4F5g+4OSnCPaHiJPRymWbXE20qFD91njpAhmjQrlr0rwLWI+181YqBvO2v8hcGpyoxIGHUO4UubugtTJOkq+8BA4zY5rgNIUtKQo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q9fOIFT1; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 14 Aug 2025 00:38:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755124727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n2eaizIy9t5k0mzdDEJ8AoGLYodhlrp3pjeCAeFIp+I=;
	b=q9fOIFT1AtMYd5khkXXtkBkw9IlSG9lgVPI5S5VSoCqebR1sEOdHaq4jGS6hc3tk+vhNfw
	SSwEz9f9K3bLn7Bd4uXv1Io6XK7kh9VPMgfG5ytGHyhlDQdVguiSq2t6aqDimpQVA9KPcR
	N5m3DCV19jsNWonkNNicjKckXbLUrFk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] media: nxp: imx8-isi: Fix streaming cleanup on
 release
Message-ID: <csndsqobu7uty5sn7d5fa7nsac6cb5adxmvehoxxg3nfw2pf75@zhzlywm2tsnx>
References: <20250813212451.22140-1-laurent.pinchart@ideasonboard.com>
 <20250813212451.22140-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813212451.22140-2-laurent.pinchart@ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

Hi Laurent,

On Thu, Aug 14, 2025 at 12:24:50AM +0300, Laurent Pinchart wrote:
> From: Richard Leitner <richard.leitner@linux.dev>
> 
> The current implementation unconditionally calls
> mxc_isi_video_cleanup_streaming() in mxc_isi_video_release(). This can
> lead to situations where any release call (like from a simple
> "v4l2-ctl -l") may release a currently streaming queue when called on
> such a device.
> 
> This is reproducible on an i.MX8MP board by streaming from an ISI
> capture device using gstreamer:
> 
> 	gst-launch-1.0 -v v4l2src device=/dev/videoX ! \
> 	    video/x-raw,format=GRAY8,width=1280,height=800,framerate=1/120 ! \
> 	    fakesink
> 
> While this stream is running, querying the caps of the same device
> provokes the error state:
> 
> 	v4l2-ctl -l -d /dev/videoX
> 
> This results in the following trace:
> 
> [  155.452152] ------------[ cut here ]------------
> [  155.452163] WARNING: CPU: 0 PID: 1708 at drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c:713 mxc_isi_pipe_irq_handler+0x19c/0x1b0 [imx8_isi]
> [  157.004248] Modules linked in: cfg80211 rpmsg_ctrl rpmsg_char rpmsg_tty virtio_rpmsg_bus rpmsg_ns rpmsg_core rfkill nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables mcp251x6
> [  157.053499] CPU: 0 UID: 0 PID: 1708 Comm: python3 Not tainted 6.15.4-00114-g1f61ca5cad76 #1 PREEMPT
> [  157.064369] Hardware name: imx8mp_board_01 (DT)
> [  157.068205] pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  157.075169] pc : mxc_isi_pipe_irq_handler+0x19c/0x1b0 [imx8_isi]
> [  157.081195] lr : mxc_isi_pipe_irq_handler+0x38/0x1b0 [imx8_isi]
> [  157.087126] sp : ffff800080003ee0
> [  157.090438] x29: ffff800080003ee0 x28: ffff0000c3688000 x27: 0000000000000000
> [  157.097580] x26: 0000000000000000 x25: ffff0000c1e7ac00 x24: ffff800081b5ad50
> [  157.104723] x23: 00000000000000d1 x22: 0000000000000000 x21: ffff0000c25e4000
> [  157.111866] x20: 0000000060000200 x19: ffff80007a0608d0 x18: 0000000000000000
> [  157.119008] x17: ffff80006a4e3000 x16: ffff800080000000 x15: 0000000000000000
> [  157.126146] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [  157.133287] x11: 0000000000000040 x10: ffff0000c01445f0 x9 : ffff80007a053a38
> [  157.140425] x8 : ffff0000c04004b8 x7 : 0000000000000000 x6 : 0000000000000000
> [  157.147567] x5 : ffff0000c0400490 x4 : ffff80006a4e3000 x3 : ffff0000c25e4000
> [  157.154706] x2 : 0000000000000000 x1 : ffff8000825c0014 x0 : 0000000060000200
> [  157.161850] Call trace:
> [  157.164296]  mxc_isi_pipe_irq_handler+0x19c/0x1b0 [imx8_isi] (P)
> [  157.170319]  __handle_irq_event_percpu+0x58/0x218
> [  157.175029]  handle_irq_event+0x54/0xb8
> [  157.178867]  handle_fasteoi_irq+0xac/0x248
> [  157.182968]  handle_irq_desc+0x48/0x68
> [  157.186723]  generic_handle_domain_irq+0x24/0x38
> [  157.191346]  gic_handle_irq+0x54/0x120
> [  157.195098]  call_on_irq_stack+0x24/0x30
> [  157.199027]  do_interrupt_handler+0x88/0x98
> [  157.203212]  el0_interrupt+0x44/0xc0
> [  157.206792]  __el0_irq_handler_common+0x18/0x28
> [  157.211328]  el0t_64_irq_handler+0x10/0x20
> [  157.215429]  el0t_64_irq+0x198/0x1a0
> [  157.219009] ---[ end trace 0000000000000000 ]---
> 
> Address this issue by moving the streaming preparation and cleanup to
> the vb2 .prepare_streaming() and .unprepare_streaming() operations. This
> also simplifies the driver by allowing direct usage of the
> vb2_ioctl_streamon() and vb2_ioctl_streamoff() helpers, and removal of
> the manual cleanup from mxc_isi_video_release().
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/nxp/imx8-isi/imx8-isi-video.c    | 156 +++++++-----------
>  1 file changed, 58 insertions(+), 98 deletions(-)

Thanks for picking this up and improving it! The patch looks fine to me.
Furthermore I just verified it still works as expected for my use-case.
Therefore please feel free to add

Tested-By: Richard Leitner <richard.leitner@linux.dev> # i.MX8MP

> -- 
> Regards,
> 
> Laurent Pinchart
> 

regards;rl

