Return-Path: <linux-media+bounces-60396-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NSgCFLL+Wn3EAMAu9opvQ
	(envelope-from <linux-media+bounces-60396-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 12:49:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D85E4CBD25
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 12:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FD28307D50E
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 10:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A8540628D;
	Tue,  5 May 2026 10:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syNCZHje"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D98401A30;
	Tue,  5 May 2026 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777977477; cv=none; b=YK8x1eKmAedqVc24qQTaM673+n6rtMiFtL2O0Br3GZei/8A94qi5O3pVnruU5nNtjshYP+KokQ5cU5s++HpyuyYgaMXvsSX7yrOzDHF3Ov5fn9AiQQ+nz8JSjimg1w1owYoUvin3BDl06NNlSRz9fnyjHTQU/68hwAX/KyCH6GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777977477; c=relaxed/simple;
	bh=l5KkDwhHvA9fv6CwmdxbHnibX1HIPPhPtaC5mU9VKzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0qgBu7C+2tY6ZU5zwbSet5PuEDGtxI55aI7s/CeGBJSehik3Z2hQgzIo2fcGWbp9rHmHgfMzgkzBSBuNhT4+gYMNjA6Fw1jbMciuHrcflfendjRTlADciPgny1hF2ba5h6JLtLHEpkbXOLpzKX1DpwkrqY8zXPhCJzTM0xeBEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=syNCZHje; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715A9C2BCB4;
	Tue,  5 May 2026 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777977477;
	bh=l5KkDwhHvA9fv6CwmdxbHnibX1HIPPhPtaC5mU9VKzc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=syNCZHjeASZ7LLGDXixJWnMtBkBcS7sbSK5ntv59MsEdhvrbk8YpuXVGhp378dgOy
	 qjMAhfm2SwYerH3zKQzzxK08uxGGQKt9eZeKifOFqDWsSBhqtkWDZA+vrr7cjTJsmX
	 FNTWDWB7jWjcFTovSAu920kuC61xHMxNvYC3y0fXIfjfsOQc9vso/h6a7eSQW1Ftkq
	 ywZ3aXXuuwAWw1KnS+8scAXaSe39gccYRaXKL/7QnMC0H8Umu+McSRynTAgGrOWg0s
	 a5xXZ5dTbbaO/hw+bppfM7/z8DrY1dGIjEDf7sL6eF+2kqhnalOhxwColQZ1nO4RV/
	 OwrzLfbeNycxA==
Message-ID: <336b8ec9-f3e3-4850-9261-752392a898ac@kernel.org>
Date: Tue, 5 May 2026 12:37:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] media: pci: add AVMatrix HWS capture driver
To: hoff.benjamin.k@gmail.com, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org,
 kernel test robot <lkp@intel.com>
References: <20260330233636.381969-1-hoff.benjamin.k@gmail.com>
 <20260403135709.46163-1-hoff.benjamin.k@gmail.com>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <20260403135709.46163-1-hoff.benjamin.k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4D85E4CBD25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60396-lists,linux-media=lfdr.de,cisco];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Hi Ben,

While reviewing v5 I discovered some issues, one of them (sizeimage handling)
important enough to warrant a v6.

On 4/3/26 15:57, hoff.benjamin.k@gmail.com wrote:
> From: Ben Hoff <hoff.benjamin.k@gmail.com>
> 
> Add an in-tree AVMatrix HWS PCIe capture driver. The driver supports
> up to four HDMI inputs and exposes the video capture path through
> V4L2 with vb2-dma-contig streaming, DV timings, and per-input
> controls. Audio support is intentionally omitted from this
> submission.
> 
> This patch also adds the MAINTAINERS entry for the new driver.
> 
> This driver is derived from a GPL out-of-tree driver.
> 
> Changes since v4:
> - replace plain 64-bit elapsed-time divisions in debug logging with
>   div_u64() so i386 module builds do not emit __udivdi3 references
> 
> Changes since v3:
> - fold the MAINTAINERS update into this patch so per-patch CI sees the
>   new file pattern
> - wrap the validation text for checkpatch
> 
> Changes since v2:
> - keep scratch DMA allocation on a single probe-owned path
> - avoid double-freeing V4L2 control handlers on register unwind
> - drop the extra per-node resolution sysfs ABI
> - turn live geometry changes into explicit SOURCE_CHANGE renegotiation
> - report live DV timings and reject attempts to retime a live source
> - stop advertising RESOLUTION source changes for fps-only updates
> - keep live fps state across harmless S_FMT restarts
> - stop exposing an unvalidated DV RX power-present signal
> - clean the imported sources for checkpatch and W=1 builds
> 
> Validation:
> - build-tested with W=1 against a local kernel build tree
> - compiled the driver with ARCH=i386 allmodconfig and verified the
>   resulting hws_pci.o, hws_video.o, and hws.o do not reference
>   __udivdi3
> - v4l2-compliance 1.32.0 on /dev/video1: 51 tests succeeded,
>   0 failed, 1 warning
> 
> DV_RX_POWER_PRESENT is intentionally left unsupported in this revision
> because current hardware evidence does not expose a validated
> receiver-side power-detect signal distinct from active video presence.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604020522.z22eZuW8-lkp@intel.com/
> Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
> ---
>  MAINTAINERS                            |    6 +
>  drivers/media/pci/Kconfig              |    1 +
>  drivers/media/pci/Makefile             |    1 +
>  drivers/media/pci/hws/Kconfig          |   12 +
>  drivers/media/pci/hws/Makefile         |    4 +
>  drivers/media/pci/hws/hws.h            |  174 +++
>  drivers/media/pci/hws/hws_irq.c        |  271 +++++
>  drivers/media/pci/hws/hws_irq.h        |   10 +
>  drivers/media/pci/hws/hws_pci.c        |  865 ++++++++++++++
>  drivers/media/pci/hws/hws_reg.h        |  136 +++
>  drivers/media/pci/hws/hws_v4l2_ioctl.c |  924 +++++++++++++++
>  drivers/media/pci/hws/hws_v4l2_ioctl.h |   36 +
>  drivers/media/pci/hws/hws_video.c      | 1506 ++++++++++++++++++++++++
>  drivers/media/pci/hws/hws_video.h      |   29 +
>  14 files changed, 3975 insertions(+)
>  create mode 100644 drivers/media/pci/hws/Kconfig
>  create mode 100644 drivers/media/pci/hws/Makefile
>  create mode 100644 drivers/media/pci/hws/hws.h
>  create mode 100644 drivers/media/pci/hws/hws_irq.c
>  create mode 100644 drivers/media/pci/hws/hws_irq.h
>  create mode 100644 drivers/media/pci/hws/hws_pci.c
>  create mode 100644 drivers/media/pci/hws/hws_reg.h
>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
>  create mode 100644 drivers/media/pci/hws/hws_video.c
>  create mode 100644 drivers/media/pci/hws/hws_video.h
> 

<snip>

> diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.c b/drivers/media/pci/hws/hws_v4l2_ioctl.c
> new file mode 100644
> index 000000000000..9c0826c0f9f9
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_v4l2_ioctl.c
> @@ -0,0 +1,924 @@

<snip>

> +/* Query the *current detected* DV timings on the input.
> + * If you have a real hardware detector, call it here; otherwise we
> + * derive from the cached pix state and map to the closest supported DV mode.
> + */
> +int hws_vidioc_query_dv_timings(struct file *file, void *fh,
> +				struct v4l2_dv_timings *timings)
> +{
> +	struct hws_video *vid = video_drvdata(file);
> +	u32 w, h;
> +	u32 fps;
> +	bool interlace;
> +
> +	if (!timings)
> +		return -EINVAL;
> +
> +	w = vid->pix.width;
> +	h = vid->pix.height;
> +	interlace = vid->pix.interlaced;
> +	(void)hws_get_live_dv_geometry(vid, &w, &h, &interlace);

No need to cast to (void). I've seen it several times in this patch, just drop it.

> +	fps = hws_get_live_fps(vid);
> +	if (!fps)
> +		fps = vid->current_fps ? vid->current_fps :
> +		      hws_pick_fps_from_mode(w, h, interlace);
> +
> +	return hws_fill_dv_timings(w, h, interlace, fps, timings);
> +}

<snip>

> diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
> new file mode 100644
> index 000000000000..9c81af6e7d7f
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_video.c
> @@ -0,0 +1,1506 @@

<snip>

> +static int hws_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
> +			   unsigned int *nplanes, unsigned int sizes[],
> +			   struct device *alloc_devs[])
> +{
> +	struct hws_video *vid = q->drv_priv;
> +
> +	(void)num_buffers;
> +	(void)alloc_devs;

This shouldn't be needed.

> +
> +	if (!vid->pix.sizeimage) {

Why would this ever be 0? At probe time this should be set to something
sane.

> +		vid->pix.bytesperline = ALIGN(vid->pix.width * 2, 64);

Apparently vid->pix.width/height are valid (non-0), so why would sizeimage
be 0? vid->pix should always have sane consistent data.

> +		vid->pix.sizeimage = vid->pix.bytesperline * vid->pix.height;
> +	}
> +	if (*nplanes) {
> +		if (sizes[0] < vid->pix.sizeimage)

If PAGE_ALIGN is used below, then it should also be used here.
This can cause memory overwrite if you pass a buffer with VIDIOC_CREATEBUF
that is of size 'sizeimage' when it should be 'PAGE_ALIGN(sizeimage)'.

> +			return -EINVAL;
> +	} else {
> +		*nplanes = 1;
> +		sizes[0] = PAGE_ALIGN(vid->pix.sizeimage);

But if you need PAGE_ALIGN, why isn't vid->pix.sizeimage set with PAGE_ALIGN
in the first place?

> +	}
> +
> +	vid->alloc_sizeimage = PAGE_ALIGN(vid->pix.sizeimage);

What is alloc_sizeimage used for? I see it used only in a v4l2_dbg message.

> +	return 0;
> +}
Regards,

	Hans

