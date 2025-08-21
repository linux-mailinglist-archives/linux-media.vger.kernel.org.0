Return-Path: <linux-media+bounces-40569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B42B2F816
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDCE71CC585C
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935C83112BE;
	Thu, 21 Aug 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L1YncIOH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADB02F5E;
	Thu, 21 Aug 2025 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779616; cv=none; b=UhQSVUP+obgKnX4IVDZIkXG+4wBnJbl9GaYiZbuP7RaItZkT4Y857ygsZCf1rk/8wZSxZy47Bu/HdOzFo5AjfIccpjD1jkbH8xmCr9KqOEBVNNWkD5dJLBzUqXAuFs3mrxBv0wXzER8W59WVWOflJoJYYeq3QgeHgN7UlSExyd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779616; c=relaxed/simple;
	bh=STIWLtVOMHk9RfVFUUas9ZZPysmjI7JRjEhbfGJJX/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6QxDdVeqWLHkdo5KWdhOAdxDm23EFu4fmafHFq8abP+hAUYDTwaMNug2XNxLOvB95qdRBpDt7lTOOybYHrS02NsMaaJhJnyot83JL1+DVKuMXlpMz2dnaroTjtJLdUwqhO/DPsFrs/RXmukwh49y0Hvh/f9jY3ig9ZZf33SQnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L1YncIOH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A342EEFF;
	Thu, 21 Aug 2025 14:32:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755779551;
	bh=STIWLtVOMHk9RfVFUUas9ZZPysmjI7JRjEhbfGJJX/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1YncIOH3YE/EcyBbynXHYa8GJMi6nL8Pm2nCWAJhQKuipg3XJiAAE6Yx8H49oOBY
	 SacwpnqIkyhRZFahZoypuiEzmLg/m6DrUn1QcqWOvPJ9GAxFs1g0tqTVhMrcXUFdmL
	 aRoIUsqUg0uespog5NQTpTPVY9T6FKgbOoePB/dM=
Date: Thu, 21 Aug 2025 15:33:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Christian Hemp <c.hemp@phytec.de>, Jacopo Mondi <jacopo@jmondi.org>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] media: nxp: imx8-isi: Fix streamon/streamoff calls
 are imbalanced issue
Message-ID: <20250821123307.GB8865@pendragon.ideasonboard.com>
References: <20250821-isi_m2m-v2-1-c616e4b00600@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821-isi_m2m-v2-1-c616e4b00600@nxp.com>

Hi Guoniu,

Thank you for the patch.

On Thu, Aug 21, 2025 at 02:08:29PM +0800, Guoniu Zhou wrote:
> If streamon/streamoff calls are imbalanced, such as exit application
> with Ctrl+C when streaming, m2m usage_count will never reach to zero
> and ISI channel won't be freed. Besides from that, if the input line
> width is more 2K and exit with Ctrl+C when streaming, it will trigger
> kernel panic, like bellow:
> 
> [ 59.222120] ------------[ cut here ]------------
> [ 59.226758] WARNING: drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:631 at mxc_isi_channel_chain+0xa4/0x120, CPU#4: v4l2-ctl/654
> [ 59.238569] Modules linked in: ap1302
> [ 59.242231] CPU: 4 UID: 0 PID: 654 Comm: v4l2-ctl Not tainted 6.16.0-rc4-next-20250704-06511-gff0e002d480a-dirty #258 PREEMPT
> [ 59.253597] Hardware name: NXP i.MX95 15X15 board (DT)
> [ 59.258720] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [ 59.265669] pc : mxc_isi_channel_chain+0xa4/0x120
> [ 59.270358] lr : mxc_isi_channel_chain+0x44/0x120
> [ 59.275047] sp : ffff8000848c3b40
> [ 59.278348] x29: ffff8000848c3b40 x28: ffff0000859b4c98 x27: ffff800081939f00
> [ 59.285472] x26: 000000000000000a x25: ffff0000859b4cb8 x24: 0000000000000001
> [ 59.292597] x23: ffff0000816f4760 x22: ffff0000816f4258 x21: ffff000084ceb780
> [ 59.299720] x20: ffff000084342ff8 x19: ffff000084340000 x18: 0000000000000000
> [ 59.306845] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffdb369e1c
> [ 59.313969] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [ 59.321093] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [ 59.328217] x8 : ffff8000848c3d48 x7 : ffff800081930b30 x6 : ffff800081930b30
> [ 59.335340] x5 : ffff0000859b6000 x4 : ffff80008193ae80 x3 : ffff800081022420
> [ 59.342464] x2 : ffff0000852f6900 x1 : 0000000000000001 x0 : ffff000084341000
> [ 59.349590] Call trace:
> [ 59.352025]  mxc_isi_channel_chain+0xa4/0x120 (P)
> [ 59.356722]  mxc_isi_m2m_streamon+0x160/0x20c
> [ 59.361072]  v4l_streamon+0x24/0x30
> [ 59.364556]  __video_do_ioctl+0x40c/0x4a0
> [ 59.368560]  video_usercopy+0x2bc/0x690
> [ 59.372382]  video_ioctl2+0x18/0x24
> [ 59.375857]  v4l2_ioctl+0x40/0x60
> [ 59.379168]  __arm64_sys_ioctl+0xac/0x104
> [ 59.383172]  invoke_syscall+0x48/0x104
> [ 59.386916]  el0_svc_common.constprop.0+0xc0/0xe0
> [ 59.391613]  do_el0_svc+0x1c/0x28
> [ 59.394915]  el0_svc+0x34/0xf4
> [ 59.397966]  el0t_64_sync_handler+0xa0/0xe4
> [ 59.402143]  el0t_64_sync+0x198/0x19c
> [ 59.405801] ---[ end trace 0000000000000000 ]---
> 		VIDIOC_STREAMON returned -1 (Invalid argument)
> 
> So check the queue streaming status when application close and call
> streamoff to fix the issue.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v2:
> - No functions changed, add Cc:stable@vger.kernel.org tag in the sign-off area
> - Link to v1: https://lore.kernel.org/r/20250818-isi_m2m-v1-1-bbe2b774d4bf@nxp.com
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 22e49d3a128732c077beb7ac2e2f688e0899f8e2..7650a9fe6b093e2b4e09e3e66b624c8c019c8583 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -709,6 +709,14 @@ static int mxc_isi_m2m_release(struct file *file)
>  	struct mxc_isi_m2m *m2m = video_drvdata(file);
>  	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(file->private_data);
>  
> +	if (ctx->queues.out.streaming)
> +		mxc_isi_m2m_streamoff(file, &ctx->fh,
> +				      V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +
> +	if (ctx->queues.cap.streaming)
> +		mxc_isi_m2m_streamoff(file, &ctx->fh,
> +				      V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +

Stopping streaming is supposed to be handled by the
v4l2_m2m_ctx_release() function, which calls vb2_queue_release() for
both queues. This doesn't work today because mxc_isi_m2m_streamon() and
mxc_isi_m2m_streamoff() perform extra operations before calling
v4l2_m2m_ioctl_streamon() and v4l2_m2m_ioctl_streamoff(). I think moving
that code to the .prepare_streaming() and .unprepare_streaming()
operations would be best, as done in
https://lore.kernel.org/r/20250813212451.22140-2-laurent.pinchart@ideasonboard.com
for the non-M2M case.

I'm testing a patch and I will send it out.

>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	mxc_isi_m2m_ctx_ctrls_delete(ctx);
>  
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250818-isi_m2m-ac52338ae925

-- 
Regards,

Laurent Pinchart

