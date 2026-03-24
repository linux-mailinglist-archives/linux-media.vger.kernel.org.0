Return-Path: <linux-media+bounces-56831-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GExKKfhZwmnQbwQAu9opvQ
	(envelope-from <linux-media+bounces-56831-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:31:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6433059F7
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80690302FBC3
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B67363C49;
	Tue, 24 Mar 2026 09:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgqP2dM9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEC73D6495;
	Tue, 24 Mar 2026 09:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343870; cv=none; b=lyiO4aL40MTxjqmX8EB8bXp7ofveynm11SVwKOGcwY1tfIaNm2H1+3SIAtrK0yLlvOjP3gmm7llabyxwLjRnUuOwYps+pZa1LiAQcqojy+2PGkn9R4qg0+kHqmaV6HBqqdn6KQLcjdF5ufxHK7pg8myvfsi0s/uGqTtRHLxVA1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343870; c=relaxed/simple;
	bh=o8j9kE8AjF+zJZrm7iohla5M/i7CMMq3LmJ+lTrpYy0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=a4MbLhPJq4wxzsuHJTOY4UGEhh/aJbNP1+CqgK92oQZl5clVnOlUyWAnRlOlCZ0XpEQRawkVZuAtChUl5cn0kU1423gAJQNOKGOsmORx8PGFMN0NYI2A45j3Ump54FrkyFU62ty604vJeHzObDXqbRQuQ8bMo9VqwQwL9wUjq7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgqP2dM9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81159C2BCB2;
	Tue, 24 Mar 2026 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774343869;
	bh=o8j9kE8AjF+zJZrm7iohla5M/i7CMMq3LmJ+lTrpYy0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=IgqP2dM9kYbFiDaKyOLeYehcbb4VjaNOBnPxS37uaGiADSjsXgc+UYWC8zywqS2r8
	 FmIrBNO82W4fnTo/MAOXPNL8UWDHikJjs68HfoK3hMlVlCQX6eLqDB9KJnZMOpXRIk
	 3P+hpENlSjVxhS0hNwSxCryjEaFR9vLsHIWdzL2ATMKxA2ulsJO/9AYsXH6l+8ckgo
	 lb6C78uq2RIiScv4ZxEZSbOOjUDpQMYDHqpAZ5H9T4nZ38xw+JEKwsztTvwaq59O6c
	 P5Y7BTersnPZGbY33ogKk1WYQa3tbIkHnTXuubsUY7z2NES7K/+8zbw3rM+qRZ9FJk
	 /jNfaabEYwUgQ==
Message-ID: <ec7c69f6-eef9-4370-9695-857df0161a2d@kernel.org>
Date: Tue, 24 Mar 2026 10:17:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 1/2] media: pci: add AVMatrix HWS capture driver
To: Ben Hoff <hoff.benjamin.k@gmail.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
 <20260318001056.465071-1-hoff.benjamin.k@gmail.com>
 <20260318001056.465071-2-hoff.benjamin.k@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260318001056.465071-2-hoff.benjamin.k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56831-lists,linux-media=lfdr.de,cisco];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4C6433059F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ben,

Some more view comments below:

On 18/03/2026 01:10, Ben Hoff wrote:
> Add an in-tree AVMatrix HWS PCIe capture driver. The driver supports
> up to four HDMI inputs and exposes the video capture path through
> V4L2 with vb2-dma-contig streaming, DV timings, and per-input
> controls. Audio support is intentionally omitted from this
> submission.
> 
> This driver is derived from a GPL out-of-tree driver. The baseline
> rework used for comparison is available at:
> https://github.com/benhoff/hws/tree/baseline
> 
> A vendor driver bundle is available at:
> https://www.acasis.com/pages/acasis-product-drivers
> 
> The vendor is not involved in this upstreaming effort.
> 
> This in-tree version folds in the review-driven cleanup needed for a
> v2 posting:
> - keep scratch DMA allocation on a single probe-owned path
> - avoid double-freeing V4L2 control handlers on register unwind
> - turn live mode changes into explicit SOURCE_CHANGE renegotiation
> - report frame intervals and DV power-present status
> 
> Build-tested with:
> make -C /home/hoff/swdev/linux O=/tmp/hws-build M=drivers/media/pci/hws W=1 KBUILD_MODPOST_WARN=1 modules
> 
> Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
> ---
>  drivers/media/pci/Kconfig              |    1 +
>  drivers/media/pci/Makefile             |    1 +
>  drivers/media/pci/hws/Kconfig          |   12 +
>  drivers/media/pci/hws/Makefile         |    4 +
>  drivers/media/pci/hws/hws.h            |  176 +++
>  drivers/media/pci/hws/hws_irq.c        |  271 +++++
>  drivers/media/pci/hws/hws_irq.h        |   10 +
>  drivers/media/pci/hws/hws_pci.c        |  864 +++++++++++++
>  drivers/media/pci/hws/hws_reg.h        |  144 +++
>  drivers/media/pci/hws/hws_v4l2_ioctl.c |  778 ++++++++++++
>  drivers/media/pci/hws/hws_v4l2_ioctl.h |   43 +
>  drivers/media/pci/hws/hws_video.c      | 1546 ++++++++++++++++++++++++
>  drivers/media/pci/hws/hws_video.h      |   29 +
>  13 files changed, 3879 insertions(+)
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
> diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
> index eebb16c58f3d..bfdb200f85a3 100644
> --- a/drivers/media/pci/Kconfig
> +++ b/drivers/media/pci/Kconfig
> @@ -13,6 +13,7 @@ if MEDIA_PCI_SUPPORT
>  if MEDIA_CAMERA_SUPPORT
>  	comment "Media capture support"
>  
> +source "drivers/media/pci/hws/Kconfig"
>  source "drivers/media/pci/mgb4/Kconfig"
>  source "drivers/media/pci/solo6x10/Kconfig"
>  source "drivers/media/pci/tw5864/Kconfig"
> diff --git a/drivers/media/pci/Makefile b/drivers/media/pci/Makefile
> index 02763ad88511..c4508b6723a9 100644
> --- a/drivers/media/pci/Makefile
> +++ b/drivers/media/pci/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_VIDEO_CX23885) += cx23885/
>  obj-$(CONFIG_VIDEO_CX25821) += cx25821/
>  obj-$(CONFIG_VIDEO_CX88) += cx88/
>  obj-$(CONFIG_VIDEO_DT3155) += dt3155/
> +obj-$(CONFIG_VIDEO_HWS) += hws/
>  obj-$(CONFIG_VIDEO_IVTV) += ivtv/
>  obj-$(CONFIG_VIDEO_MGB4) += mgb4/
>  obj-$(CONFIG_VIDEO_SAA7134) += saa7134/
> diff --git a/drivers/media/pci/hws/Kconfig b/drivers/media/pci/hws/Kconfig
> new file mode 100644
> index 000000000000..b606d5ffadef
> --- /dev/null
> +++ b/drivers/media/pci/hws/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_HWS
> +	tristate "AVMatrix HWS capture driver"
> +	depends on VIDEO_DEV && PCI
> +	select VIDEOBUF2_DMA_CONTIG
> +	help
> +	  This is a Video4Linux2 driver for AVMatrix HWS PCIe capture cards.
> +	  It provides a PCIe capture interface with V4L2 streaming, DV timings,
> +	  and per-input controls for the supported HWS boards.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called hws.
> diff --git a/drivers/media/pci/hws/Makefile b/drivers/media/pci/hws/Makefile
> new file mode 100644
> index 000000000000..a66aebd348e5
> --- /dev/null
> +++ b/drivers/media/pci/hws/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +hws-objs := hws_pci.o hws_irq.o hws_video.o hws_v4l2_ioctl.o
> +
> +obj-$(CONFIG_VIDEO_HWS) += hws.o
> diff --git a/drivers/media/pci/hws/hws.h b/drivers/media/pci/hws/hws.h
> new file mode 100644
> index 000000000000..097f6937b231
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws.h
> @@ -0,0 +1,176 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef HWS_PCIE_H
> +#define HWS_PCIE_H
> +
> +#include <linux/types.h>
> +#include <linux/compiler.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/kthread.h>
> +#include <linux/pci.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/sizes.h>
> +#include <linux/atomic.h>
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-dv-timings.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "hws_reg.h"
> +
> +struct hwsmem_param {
> +	u32 index;
> +	u32 type;
> +	u32 status;
> +};
> +
> +struct hws_pix_state {
> +	u32 width;
> +	u32 height;
> +	u32 fourcc;		/* V4L2_PIX_FMT_* (YUYV only here) */
> +	u32 bytesperline;	/* stride */
> +	u32 sizeimage;		/* full frame */
> +	enum v4l2_field field;	/* V4L2_FIELD_NONE or INTERLACED */
> +	enum v4l2_colorspace colorspace;	/* e.g., REC709 */
> +	enum v4l2_ycbcr_encoding ycbcr_enc;	/* V4L2_YCBCR_ENC_DEFAULT */
> +	enum v4l2_quantization quantization;	/* V4L2_QUANTIZATION_LIM_RANGE */
> +	enum v4l2_xfer_func xfer_func;	/* V4L2_XFER_FUNC_DEFAULT */
> +	bool interlaced;	/* cached hardware state */
> +	u32 half_size;		/* optional: if your HW needs it */
> +};
> +
> +#define	UNSET	(-1U)
> +
> +struct hws_pcie_dev;
> +struct hws_adapter;
> +struct hws_video;
> +
> +struct hwsvideo_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head list;
> +	int slot;		/* for two-buffer approach */
> +};
> +
> +struct hws_video {
> +	/* ───── linkage ───── */
> +	struct hws_pcie_dev *parent;	/* parent device */
> +	struct video_device *video_device;
> +
> +	struct vb2_queue buffer_queue;
> +	struct list_head capture_queue;
> +	struct hwsvideo_buffer *active;
> +	struct hwsvideo_buffer *next_prepared;
> +
> +	/* ───── locking ───── */
> +	struct mutex state_lock;	/* primary state */
> +	spinlock_t irq_lock;	/* ISR-side */
> +
> +	/* ───── indices ───── */
> +	int channel_index;
> +
> +	/* ───── colour controls ───── */
> +	int current_brightness;
> +	int current_contrast;
> +	int current_saturation;
> +	int current_hue;
> +
> +	/* ───── V4L2 controls ───── */
> +	struct v4l2_ctrl_handler control_handler;
> +	struct v4l2_ctrl *hotplug_detect_control;
> +	struct v4l2_ctrl *ctrl_brightness;
> +	struct v4l2_ctrl *ctrl_contrast;
> +	struct v4l2_ctrl *ctrl_saturation;
> +	struct v4l2_ctrl *ctrl_hue;
> +	/* ───── capture queue status ───── */
> +	struct hws_pix_state pix;
> +	struct v4l2_dv_timings cur_dv_timings; /* last configured DV timings */
> +	u32 current_fps; /* Hz, derived from mode or HW rate reg */
> +	u32 alloc_sizeimage;
> +
> +	/* ───── per-channel capture state ───── */
> +	bool cap_active;
> +	bool stop_requested;
> +	u8 last_buf_half_toggle;
> +	bool half_seen;
> +	atomic_t sequence_number;
> +	u32 queued_count;
> +
> +	/* ───── timeout and error handling ───── */
> +	u32 timeout_count;
> +	u32 error_count;
> +
> +	bool window_valid;
> +	u32 last_dma_hi;
> +	u32 last_dma_page;
> +	u32 last_pci_addr;
> +	u32 last_half16;
> +
> +	/* ───── misc counters ───── */
> +	int signal_loss_cnt;
> +};
> +
> +static inline void hws_set_current_dv_timings(struct hws_video *vid,
> +					      u32 width, u32 height,
> +					      bool interlaced)
> +{
> +	if (!vid)
> +		return;
> +
> +	vid->cur_dv_timings = (struct v4l2_dv_timings) {
> +		.type = V4L2_DV_BT_656_1120,
> +		.bt = {
> +			.width = width,
> +			.height = height,
> +			.interlaced = interlaced,
> +		},
> +	};
> +}
> +
> +struct hws_scratch_dma {
> +	void *cpu;
> +	dma_addr_t dma;
> +	size_t size;
> +};
> +
> +struct hws_pcie_dev {
> +	/* ───── core objects ───── */
> +	struct pci_dev *pdev;
> +	struct hws_video video[MAX_VID_CHANNELS];
> +
> +	/* ───── BAR & workqueues ───── */
> +	void __iomem *bar0_base;
> +
> +	/* ───── device identity / capabilities ───── */
> +	u16 vendor_id;
> +	u16 device_id;
> +	u16 device_ver;
> +	u16 hw_ver;
> +	u32 sub_ver;
> +	u32 port_id;
> +	// TriState, used in `set_video_format_size`
> +	u32 support_yv12;
> +	u32 max_hw_video_buf_sz;
> +	u8 max_channels;
> +	u8 cur_max_video_ch;
> +	bool start_run;
> +
> +	bool buf_allocated;
> +
> +	/* ───── V4L2 framework objects ───── */
> +	struct v4l2_device v4l2_device;
> +
> +	/* ───── kernel thread ───── */
> +	struct task_struct *main_task;
> +	struct hws_scratch_dma scratch_vid[MAX_VID_CHANNELS];
> +
> +	bool suspended;
> +	int irq;
> +
> +	/* ───── error flags ───── */
> +	int pci_lost;
> +
> +};
> +
> +#endif
> diff --git a/drivers/media/pci/hws/hws_irq.c b/drivers/media/pci/hws/hws_irq.c
> new file mode 100644
> index 000000000000..11f7dfde0eff
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_irq.c
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/compiler.h>
> +#include <linux/moduleparam.h>
> +#include <linux/io.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/minmax.h>
> +#include <linux/string.h>
> +
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "hws_irq.h"
> +#include "hws_reg.h"
> +#include "hws_video.h"
> +#include "hws.h"
> +
> +#define MAX_INT_LOOPS 100
> +
> +static bool hws_toggle_debug;
> +module_param_named(toggle_debug, hws_toggle_debug, bool, 0644);
> +MODULE_PARM_DESC(toggle_debug,
> +		 "Read toggle registers in IRQ handler for debug logging");
> +
> +static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
> +{
> +	struct hws_video *v = &hws->video[ch];
> +	unsigned long flags;
> +	struct hwsvideo_buffer *buf;
> +
> +	dev_dbg(&hws->pdev->dev,
> +		"arm_next(ch=%u): stop=%d cap=%d queued=%d\n",
> +		ch, READ_ONCE(v->stop_requested), READ_ONCE(v->cap_active),
> +		!list_empty(&v->capture_queue));
> +
> +	if (unlikely(READ_ONCE(hws->suspended))) {

I noticed a lot of 'likely' and 'unlikely' calls in this driver. These generally
just make the code harder to read. They only make sense inside tight loops where
every CPU cycle counts.

Just drop them, unless they really make sense.

> +		dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): suspended\n", ch);
> +		return -EBUSY;
> +	}
> +

<snip>

> diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.c b/drivers/media/pci/hws/hws_v4l2_ioctl.c
> new file mode 100644
> index 000000000000..a9a7597f76e1
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_v4l2_ioctl.c
> @@ -0,0 +1,778 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +#include <linux/pci.h>
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-dv-timings.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "hws.h"
> +#include "hws_reg.h"
> +#include "hws_video.h"
> +#include "hws_v4l2_ioctl.h"
> +
> +struct hws_dv_mode {
> +	struct v4l2_dv_timings timings;
> +	u32 refresh_hz;
> +};
> +
> +static const struct hws_dv_mode *
> +hws_find_dv_by_wh(u32 w, u32 h, bool interlaced);
> +
> +static const struct hws_dv_mode hws_dv_modes[] = {
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 1920,
> +				.height = 1080,
> +				.interlaced = 0,
> +			},
> +		},
> +		60,
> +	},
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 1280,
> +				.height = 720,
> +				.interlaced = 0,
> +			},
> +		},
> +		60,
> +	},
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 720,
> +				.height = 480,
> +				.interlaced = 0,
> +			},
> +		},
> +		60,
> +	},
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 720,
> +				.height = 576,
> +				.interlaced = 0,
> +			},
> +		},
> +		50,
> +	},
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 800,
> +				.height = 600,
> +				.interlaced = 0,
> +			},
> +		},
> +		60,
> +	},
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 640,
> +				.height = 480,
> +				.interlaced = 0,
> +			},
> +		},
> +		60,
> +	},
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 1024,
> +				.height = 768,
> +				.interlaced = 0,
> +			},
> +		},
> +		60,
> +	},
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 1280,
> +				.height = 768,
> +				.interlaced = 0,
> +			},
> +		},
> +		60,
> +	},
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 1280,
> +				.height = 800,
> +				.interlaced = 0,
> +			},
> +		},
> +		60,
> +	},
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 1280,
> +				.height = 1024,
> +				.interlaced = 0,
> +			},
> +		},
> +		60,
> +	},
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 1360,
> +				.height = 768,
> +				.interlaced = 0,
> +			},
> +		},
> +		60,
> +	},
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 1440,
> +				.height = 900,
> +				.interlaced = 0,
> +			},
> +		},
> +		60,
> +	},
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 1680,
> +				.height = 1050,
> +				.interlaced = 0,
> +			},
> +		},
> +		60,
> +	},
> +	/* Portrait */
> +	{
> +		{
> +			.type = V4L2_DV_BT_656_1120,
> +			.bt = {
> +				.width = 1080,
> +				.height = 1920,
> +				.interlaced = 0,
> +			},
> +		},
> +		60,
> +	},
> +};
> +
> +static const size_t hws_dv_modes_cnt = ARRAY_SIZE(hws_dv_modes);
> +
> +/* YUYV: 16 bpp; align to 64 as you did elsewhere */
> +static inline u32 hws_calc_bpl_yuyv(u32 w)     { return ALIGN(w * 2, 64); }
> +static inline u32 hws_calc_size_yuyv(u32 w, u32 h) { return hws_calc_bpl_yuyv(w) * h; }
> +static inline u32 hws_calc_half_size(u32 sizeimage)
> +{
> +	return sizeimage / 2;
> +}
> +
> +static inline void hws_hw_write_bchs(struct hws_pcie_dev *hws, unsigned int ch,
> +				     u8 br, u8 co, u8 hu, u8 sa)
> +{
> +	u32 packed = (sa << 24) | (hu << 16) | (co << 8) | br;
> +
> +	if (!hws || !hws->bar0_base || ch >= hws->max_channels)
> +		return;
> +	writel_relaxed(packed, hws->bar0_base + HWS_REG_BCHS(ch));
> +	(void)readl(hws->bar0_base + HWS_REG_BCHS(ch)); /* post write */
> +}
> +
> +/* Helper: find a supported DV mode by W/H + interlace flag */
> +static const struct hws_dv_mode *
> +hws_match_supported_dv(const struct v4l2_dv_timings *req)
> +{
> +	const struct v4l2_bt_timings *bt;
> +
> +	if (!req || req->type != V4L2_DV_BT_656_1120)
> +		return NULL;
> +
> +	bt = &req->bt;
> +	return hws_find_dv_by_wh(bt->width, bt->height, !!bt->interlaced);
> +}
> +
> +/* Helper: find a supported DV mode by W/H + interlace flag */
> +static const struct hws_dv_mode *
> +hws_find_dv_by_wh(u32 w, u32 h, bool interlaced)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < ARRAY_SIZE(hws_dv_modes); i++) {
> +		const struct hws_dv_mode *t = &hws_dv_modes[i];
> +		const struct v4l2_bt_timings *bt = &t->timings.bt;
> +
> +		if (t->timings.type != V4L2_DV_BT_656_1120)
> +			continue;
> +
> +		if (bt->width == w && bt->height == h &&
> +		    !!bt->interlaced == interlaced)
> +			return t;
> +	}
> +	return NULL;
> +}
> +
> +static bool hws_get_live_dv_geometry(struct hws_video *vid,
> +				     u32 *w, u32 *h, bool *interlaced)
> +{
> +	struct hws_pcie_dev *pdx;
> +	u32 reg;
> +
> +	if (!vid)
> +		return false;
> +
> +	pdx = vid->parent;
> +	if (!pdx || !pdx->bar0_base)
> +		return false;
> +
> +	reg = readl(pdx->bar0_base + HWS_REG_IN_RES(vid->channel_index));
> +	if (!reg || reg == 0xFFFFFFFF)
> +		return false;
> +
> +	if (w)
> +		*w = reg & 0xFFFF;
> +	if (h)
> +		*h = (reg >> 16) & 0xFFFF;
> +	if (interlaced) {
> +		reg = readl(pdx->bar0_base + HWS_REG_ACTIVE_STATUS);
> +		*interlaced = !!(reg & BIT(8 + vid->channel_index));
> +	}
> +	return true;
> +}
> +
> +static u32 hws_pick_fps_from_mode(u32 w, u32 h, bool interlaced)
> +{
> +	const struct hws_dv_mode *m = hws_find_dv_by_wh(w, h, interlaced);
> +
> +	if (m && m->refresh_hz)
> +		return m->refresh_hz;
> +	/* Fallback to a sane default */
> +	return 60;
> +}
> +
> +/* Query the *current detected* DV timings on the input.
> + * If you have a real hardware detector, call it here; otherwise we
> + * derive from the cached pix state and map to the closest supported DV mode.
> + */
> +int hws_vidioc_query_dv_timings(struct file *file, void *fh,
> +				struct v4l2_dv_timings *timings)
> +{
> +	struct hws_video *vid = video_drvdata(file);
> +	const struct hws_dv_mode *m;
> +	u32 w, h;
> +	bool interlace;
> +
> +	if (!timings)
> +		return -EINVAL;
> +
> +	w = vid->pix.width;
> +	h = vid->pix.height;
> +	interlace = vid->pix.interlaced;
> +	(void)hws_get_live_dv_geometry(vid, &w, &h, &interlace);
> +	/* Map current (live if available, otherwise cached) WxH/interlace
> +	 * to one of our supported modes.
> +	 */
> +	m = hws_find_dv_by_wh(w, h, !!interlace);
> +	if (!m)
> +		return -ENOLINK;
> +
> +	*timings = m->timings;
> +	vid->cur_dv_timings = m->timings;
> +	vid->current_fps = m->refresh_hz;
> +	return 0;
> +}
> +
> +/* Enumerate the Nth supported DV timings from our static table. */
> +int hws_vidioc_enum_dv_timings(struct file *file, void *fh,
> +			       struct v4l2_enum_dv_timings *edv)
> +{
> +	if (!edv)
> +		return -EINVAL;
> +
> +	if (edv->pad)
> +		return -EINVAL;
> +
> +	if (edv->index >= hws_dv_modes_cnt)
> +		return -EINVAL;
> +
> +	edv->timings = hws_dv_modes[edv->index].timings;
> +	return 0;
> +}
> +
> +/* Get the *currently configured* DV timings. */
> +int hws_vidioc_g_dv_timings(struct file *file, void *fh,
> +			    struct v4l2_dv_timings *timings)
> +{
> +	struct hws_video *vid = video_drvdata(file);
> +
> +	if (!timings)
> +		return -EINVAL;
> +
> +	*timings = vid->cur_dv_timings;
> +	return 0;
> +}
> +
> +static inline void hws_set_colorimetry_state(struct hws_pix_state *p)
> +{
> +	bool sd = p->height <= 576;
> +
> +	p->colorspace   = sd ? V4L2_COLORSPACE_SMPTE170M : V4L2_COLORSPACE_REC709;
> +	p->ycbcr_enc    = V4L2_YCBCR_ENC_DEFAULT;
> +	p->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	p->xfer_func    = V4L2_XFER_FUNC_DEFAULT;
> +}
> +
> +/* Set DV timings: must match one of our supported modes.
> + * If buffers are queued and this implies a size change, we reject with -EBUSY.
> + * Otherwise we update pix state and (optionally) reprogram the HW.
> + */
> +int hws_vidioc_s_dv_timings(struct file *file, void *fh,
> +			    struct v4l2_dv_timings *timings)
> +{
> +	struct hws_video *vid = video_drvdata(file);
> +	const struct hws_dv_mode *m;
> +	const struct v4l2_bt_timings *bt;
> +	u32 new_w, new_h;
> +	bool interlaced;
> +	int ret = 0;
> +	unsigned long was_busy;
> +
> +	if (!timings)
> +		return -EINVAL;
> +
> +	m = hws_match_supported_dv(timings);
> +	if (!m)
> +		return -EINVAL;
> +
> +	bt = &m->timings.bt;
> +	if (bt->interlaced)
> +		return -EINVAL; /* only progressive modes are advertised */
> +	new_w = bt->width;
> +	new_h = bt->height;
> +	interlaced = false;
> +
> +	lockdep_assert_held(&vid->state_lock);
> +
> +	/* If vb2 has active buffers and size would change, reject. */
> +	was_busy = vb2_is_busy(&vid->buffer_queue);
> +	if (was_busy &&
> +	    (new_w != vid->pix.width || new_h != vid->pix.height ||
> +	     interlaced != vid->pix.interlaced)) {

Just checking: you can change the timings on the fly as long as the width,
height and interlaced mode are the same? So going from e.g. 1080p60 to 1080p30
would work?

Often this is not actually possible without stopping streaming and restarting
it afterwards.

> +		ret = -EBUSY;
> +		return ret;
> +	}
> +
> +	/* Update software pixel state (and recalc sizes) */
> +	vid->pix.width      = new_w;
> +	vid->pix.height     = new_h;
> +	vid->pix.field      = interlaced ? V4L2_FIELD_INTERLACED
> +					 : V4L2_FIELD_NONE;
> +	vid->pix.interlaced = interlaced;
> +	vid->pix.fourcc     = V4L2_PIX_FMT_YUYV;
> +
> +	hws_set_colorimetry_state(&vid->pix);
> +
> +	/* Recompute stride/sizeimage/half_size using your helper */
> +	vid->pix.bytesperline = hws_calc_bpl_yuyv(new_w);
> +	vid->pix.sizeimage    = hws_calc_size_yuyv(new_w, new_h);
> +	vid->pix.half_size    = hws_calc_half_size(vid->pix.sizeimage);
> +	vid->cur_dv_timings   = m->timings;
> +	vid->current_fps      = m->refresh_hz;
> +	if (!was_busy)
> +		vid->alloc_sizeimage = vid->pix.sizeimage;
> +	return ret;
> +}
> +
> +/* Report DV timings capability: advertise BT.656/1120 with
> + * the min/max WxH derived from our table and basic progressive support.
> + */
> +int hws_vidioc_dv_timings_cap(struct file *file, void *fh,
> +			      struct v4l2_dv_timings_cap *cap)
> +{
> +	u32 min_w = ~0U, min_h = ~0U;
> +	u32 max_w = 0,       max_h = 0;
> +	size_t i, n = 0;
> +
> +	if (!cap)
> +		return -EINVAL;
> +
> +	memset(cap, 0, sizeof(*cap));
> +	cap->type = V4L2_DV_BT_656_1120;
> +
> +	for (i = 0; i < ARRAY_SIZE(hws_dv_modes); i++) {
> +		const struct v4l2_bt_timings *bt = &hws_dv_modes[i].timings.bt;
> +
> +		if (hws_dv_modes[i].timings.type != V4L2_DV_BT_656_1120)
> +			continue;
> +		n++;
> +
> +		if (bt->width  < min_w)
> +			min_w = bt->width;
> +		if (bt->height < min_h)
> +			min_h = bt->height;
> +		if (bt->width  > max_w)
> +			max_w = bt->width;
> +		if (bt->height > max_h)
> +			max_h = bt->height;
> +	}
> +
> +	/* If the table was empty, fail gracefully. */
> +	if (!n || min_w == U32_MAX)
> +		return -ENODATA;
> +
> +	cap->bt.min_width  = min_w;
> +	cap->bt.max_width  = max_w;
> +	cap->bt.min_height = min_h;
> +	cap->bt.max_height = max_h;
> +
> +	/* We support both CEA-861- and VESA-style modes in the list. */
> +	cap->bt.standards =
> +		V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT | V4L2_DV_BT_STD_CVT;
> +
> +	/* Progressive only, unless your table includes interlaced entries. */
> +	cap->bt.capabilities = V4L2_DV_BT_CAP_PROGRESSIVE;
> +
> +	/* Leave pixelclock/porch limits unconstrained (0) for now. */
> +	return 0;
> +}
> +
> +static int hws_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct hws_video *vid =
> +		container_of(ctrl->handler, struct hws_video, control_handler);
> +	struct hws_pcie_dev *pdx = vid->parent;
> +	bool program = false;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_BRIGHTNESS:
> +		vid->current_brightness = ctrl->val;
> +		program = true;
> +		break;
> +	case V4L2_CID_CONTRAST:
> +		vid->current_contrast = ctrl->val;
> +		program = true;
> +		break;
> +	case V4L2_CID_SATURATION:
> +		vid->current_saturation = ctrl->val;
> +		program = true;
> +		break;
> +	case V4L2_CID_HUE:
> +		vid->current_hue = ctrl->val;
> +		program = true;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (program) {
> +		hws_hw_write_bchs(pdx, vid->channel_index,
> +				  (u8)vid->current_brightness,
> +				  (u8)vid->current_contrast,
> +				  (u8)vid->current_hue,
> +				  (u8)vid->current_saturation);
> +	}
> +	return 0;
> +}
> +
> +const struct v4l2_ctrl_ops hws_ctrl_ops = {
> +	.s_ctrl = hws_s_ctrl,
> +};
> +
> +int hws_vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
> +{
> +	struct hws_video *vid = video_drvdata(file);
> +	struct hws_pcie_dev *pdev = vid->parent;
> +	int vi_index = vid->channel_index + 1; /* keep it simple */
> +
> +	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
> +	snprintf(cap->card, sizeof(cap->card),
> +		 "AVMatrix HWS Capture %d", vi_index);
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s", dev_name(&pdev->pdev->dev));

No need to set bus_info, it's done for you.

> +
> +	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;

No need to set these two field, the v4l2 core does that for you.

> +	return 0;
> +}
> +
> +int hws_vidioc_enum_fmt_vid_cap(struct file *file, void *priv_fh, struct v4l2_fmtdesc *f)
> +{
> +	if (f->index != 0)
> +		return -EINVAL; /* only one format */
> +
> +	f->pixelformat = V4L2_PIX_FMT_YUYV;
> +	return 0;
> +}
> +
> +int hws_vidioc_enum_frameintervals(struct file *file, void *fh,
> +				   struct v4l2_frmivalenum *fival)

This generally makes no sense for HDMI receivers. I'd drop it.

> +{
> +	const struct hws_dv_mode *mode;
> +
> +	if (fival->index)
> +		return -EINVAL;
> +
> +	if (fival->pixel_format != V4L2_PIX_FMT_YUYV)
> +		return -EINVAL;
> +
> +	mode = hws_find_dv_by_wh(fival->width, fival->height, false);
> +	if (!mode)
> +		return -EINVAL;
> +
> +	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
> +	fival->discrete.numerator = 1;
> +	fival->discrete.denominator = mode->refresh_hz ?: 60;
> +
> +	return 0;
> +}
> +
> +int hws_vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
> +{
> +	struct hws_video *vid = video_drvdata(file);
> +
> +	fmt->fmt.pix.width        = vid->pix.width;
> +	fmt->fmt.pix.height       = vid->pix.height;
> +	fmt->fmt.pix.pixelformat  = V4L2_PIX_FMT_YUYV;
> +	fmt->fmt.pix.field        = vid->pix.field;
> +	fmt->fmt.pix.bytesperline = vid->pix.bytesperline;
> +	fmt->fmt.pix.sizeimage    = vid->pix.sizeimage;
> +	fmt->fmt.pix.colorspace   = vid->pix.colorspace;
> +	fmt->fmt.pix.ycbcr_enc    = vid->pix.ycbcr_enc;
> +	fmt->fmt.pix.quantization = vid->pix.quantization;
> +	fmt->fmt.pix.xfer_func    = vid->pix.xfer_func;
> +	return 0;
> +}
> +
> +static inline void hws_set_colorimetry_fmt(struct v4l2_pix_format *p)
> +{
> +	bool sd = p->height <= 576;
> +
> +	p->colorspace   = sd ? V4L2_COLORSPACE_SMPTE170M : V4L2_COLORSPACE_REC709;
> +	p->ycbcr_enc    = V4L2_YCBCR_ENC_DEFAULT;
> +	p->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	p->xfer_func    = V4L2_XFER_FUNC_DEFAULT;
> +}
> +
> +int hws_vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
> +{
> +	struct hws_video *vid = file ? video_drvdata(file) : NULL;
> +	struct hws_pcie_dev *pdev = vid ? vid->parent : NULL;
> +	struct v4l2_pix_format *pix = &f->fmt.pix;
> +	u32 req_w = pix->width, req_h = pix->height;
> +	u32 w, h, min_bpl, bpl;
> +	size_t size; /* wider than u32 for overflow check */
> +	size_t max_frame = pdev ? pdev->max_hw_video_buf_sz : MAX_MM_VIDEO_SIZE;
> +
> +	/* Only YUYV */
> +	pix->pixelformat = V4L2_PIX_FMT_YUYV;
> +
> +	/* Defaults then clamp */
> +	w = (req_w ? req_w : 640);
> +	h = (req_h ? req_h : 480);
> +	if (w > MAX_VIDEO_HW_W)
> +		w = MAX_VIDEO_HW_W;
> +	if (h > MAX_VIDEO_HW_H)
> +		h = MAX_VIDEO_HW_H;
> +	if (!w)
> +		w = 640; /* hard fallback in case macros are odd */
> +	if (!h)
> +		h = 480;
> +
> +	/* Field policy */
> +	pix->field = V4L2_FIELD_NONE;
> +
> +	/* Stride policy for packed 16bpp, 64B align */
> +	min_bpl = ALIGN(w * 2, 64);
> +
> +	/* Bound requested bpl to something sane, then align */
> +	bpl = pix->bytesperline;
> +	if (bpl < min_bpl) {
> +		bpl = min_bpl;
> +	} else {
> +		/* Cap at 16x width to avoid silly values that overflow sizeimage */
> +		u32 max_bpl = ALIGN(w * 2 * 16, 64);
> +
> +		if (bpl > max_bpl)
> +			bpl = max_bpl;
> +		bpl = ALIGN(bpl, 64);
> +	}
> +	if (h && max_frame) {
> +		size_t max_bpl_hw = max_frame / h;
> +
> +		if (max_bpl_hw < min_bpl)
> +			return -ERANGE;
> +		max_bpl_hw = rounddown(max_bpl_hw, 64);
> +		if (!max_bpl_hw)
> +			return -ERANGE;
> +		if (bpl > max_bpl_hw) {
> +			if (pdev)
> +				dev_dbg(&pdev->pdev->dev,
> +					"try_fmt: clamp bpl %u -> %zu due to hw buf cap %zu\n",
> +					bpl, max_bpl_hw, max_frame);
> +			bpl = (u32)max_bpl_hw;
> +		}
> +	}
> +	size = (size_t)bpl * (size_t)h;
> +	if (size > max_frame)
> +		return -ERANGE;
> +
> +	pix->width        = w;
> +	pix->height       = h;
> +	pix->bytesperline = bpl;
> +	pix->sizeimage    = (u32)size; /* logical size, not page-aligned */
> +
> +	hws_set_colorimetry_fmt(pix);
> +	if (pdev)
> +		dev_dbg(&pdev->pdev->dev,
> +			"try_fmt: w=%u h=%u bpl=%u size=%u field=%u\n",
> +			pix->width, pix->height, pix->bytesperline,
> +			pix->sizeimage, pix->field);
> +	return 0;
> +}
> +
> +int hws_vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct hws_video *vid = video_drvdata(file);
> +	int ret;
> +
> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	/* Normalize the request */
> +	ret = hws_vidioc_try_fmt_vid_cap(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	/* Don’t allow size changes while buffers are queued */
> +	if (vb2_is_busy(&vid->buffer_queue)) {
> +		if (f->fmt.pix.width       != vid->pix.width  ||
> +		    f->fmt.pix.height      != vid->pix.height ||
> +		    f->fmt.pix.pixelformat != V4L2_PIX_FMT_YUYV) {

Drop the pixelformat check: hws_vidioc_try_fmt_vid_cap already hardcodes it
to V4L2_PIX_FMT_YUYV.

But you are missing a check for bytesperline: changing that will change the buffer size,
which is a no-go for S_FMT when vb2_is_busy.

> +			return -EBUSY;
> +		}
> +	}
> +
> +	/* Apply to driver state */
> +	vid->pix.width        = f->fmt.pix.width;
> +	vid->pix.height       = f->fmt.pix.height;
> +	vid->pix.fourcc       = V4L2_PIX_FMT_YUYV;
> +	vid->pix.field        = f->fmt.pix.field;
> +	vid->pix.colorspace   = f->fmt.pix.colorspace;
> +	vid->pix.ycbcr_enc    = f->fmt.pix.ycbcr_enc;
> +	vid->pix.quantization = f->fmt.pix.quantization;
> +	vid->pix.xfer_func    = f->fmt.pix.xfer_func;
> +
> +	/* Update sizes (use helper if you prefer strict alignment math) */
> +	vid->pix.bytesperline = f->fmt.pix.bytesperline; /* aligned */
> +	vid->pix.sizeimage    = f->fmt.pix.sizeimage;    /* logical */
> +	vid->pix.half_size    = hws_calc_half_size(vid->pix.sizeimage);
> +	vid->pix.interlaced   = false;
> +	hws_set_current_dv_timings(vid, vid->pix.width, vid->pix.height,
> +				   vid->pix.interlaced);
> +	vid->current_fps = hws_pick_fps_from_mode(vid->pix.width,
> +						  vid->pix.height,
> +						  vid->pix.interlaced);
> +	/* Or:
> +	 * hws_calc_sizeimage(vid, vid->pix.width, vid->pix.height, false);
> +	 */
> +
> +	/* Refresh vb2 watermark when idle */
> +	if (!vb2_is_busy(&vid->buffer_queue))
> +		vid->alloc_sizeimage = PAGE_ALIGN(vid->pix.sizeimage);
> +	dev_dbg(&vid->parent->pdev->dev,
> +		"s_fmt:   w=%u h=%u bpl=%u size=%u alloc=%u\n",
> +		vid->pix.width, vid->pix.height, vid->pix.bytesperline,
> +		vid->pix.sizeimage, vid->alloc_sizeimage);
> +
> +	return 0;
> +}
> +
> +int hws_vidioc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *param)
> +{
> +	struct hws_video *vid = video_drvdata(file);
> +	u32 fps;
> +
> +	if (param->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	fps = vid->current_fps ? vid->current_fps : 60;
> +
> +	/* Report cached frame rate; expose timeperframe capability */
> +	param->parm.capture.capability           = V4L2_CAP_TIMEPERFRAME;
> +	param->parm.capture.capturemode          = 0;
> +	param->parm.capture.timeperframe.numerator   = 1;
> +	param->parm.capture.timeperframe.denominator = fps;
> +	param->parm.capture.extendedmode         = 0;
> +	param->parm.capture.readbuffers          = 0;
> +
> +	return 0;
> +}
> +
> +int hws_vidioc_enum_input(struct file *file, void *priv,
> +			  struct v4l2_input *input)
> +{
> +	if (input->index)
> +		return -EINVAL;
> +	input->type         = V4L2_INPUT_TYPE_CAMERA;
> +	strscpy(input->name, KBUILD_MODNAME, sizeof(input->name));
> +	input->capabilities = V4L2_IN_CAP_DV_TIMINGS;
> +	input->status       = 0;
> +
> +	return 0;
> +}
> +
> +int hws_vidioc_g_input(struct file *file, void *priv, unsigned int *index)
> +{
> +	*index = 0;
> +	return 0;
> +}
> +
> +int hws_vidioc_s_input(struct file *file, void *priv, unsigned int i)
> +{
> +	return i ? -EINVAL : 0;
> +}
> +
> +int hws_vidioc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *param)
> +{
> +	struct hws_video *vid = video_drvdata(file);
> +	struct v4l2_captureparm *cap;
> +	u32 fps;
> +
> +	if (param->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	cap = &param->parm.capture;
> +
> +	fps = vid->current_fps ? vid->current_fps : 60;
> +	cap->timeperframe.denominator = fps;
> +	cap->timeperframe.numerator   = 1;
> +	cap->capability               = V4L2_CAP_TIMEPERFRAME;
> +	cap->capturemode              = 0;
> +	cap->extendedmode             = 0;
> +	/* readbuffers left unchanged or zero; vb2 handles queue depth */
> +
> +	return 0;
> +}
> diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.h b/drivers/media/pci/hws/hws_v4l2_ioctl.h
> new file mode 100644
> index 000000000000..f20e6aadff67
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_v4l2_ioctl.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef HWS_V4L2_IOCTL_H
> +#define HWS_V4L2_IOCTL_H
> +
> +#include <linux/fs.h>
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-ioctl.h>
> +
> +extern const struct v4l2_ctrl_ops hws_ctrl_ops;
> +
> +int hws_vidioc_querycap(struct file *file, void *priv,
> +			struct v4l2_capability *cap);
> +int hws_vidioc_enum_fmt_vid_cap(struct file *file, void *priv_fh,
> +				struct v4l2_fmtdesc *f);
> +int hws_vidioc_enum_frameintervals(struct file *file, void *fh,
> +				   struct v4l2_frmivalenum *fival);
> +int hws_vidioc_g_fmt_vid_cap(struct file *file, void *fh,
> +			     struct v4l2_format *fmt);
> +int hws_vidioc_try_fmt_vid_cap(struct file *file, void *fh,
> +			       struct v4l2_format *f);
> +int hws_vidioc_s_fmt_vid_cap(struct file *file, void *priv,
> +			     struct v4l2_format *f);
> +int hws_vidioc_g_parm(struct file *file, void *fh,
> +		      struct v4l2_streamparm *setfps);
> +int hws_vidioc_s_parm(struct file *file, void *fh,
> +		      struct v4l2_streamparm *a);
> +int hws_vidioc_enum_input(struct file *file, void *priv,
> +			  struct v4l2_input *i);
> +int hws_vidioc_g_input(struct file *file, void *priv, unsigned int *i);
> +int hws_vidioc_s_input(struct file *file, void *priv, unsigned int i);
> +int hws_vidioc_dv_timings_cap(struct file *file, void *fh,
> +			      struct v4l2_dv_timings_cap *cap);
> +int hws_vidioc_s_dv_timings(struct file *file, void *fh,
> +			    struct v4l2_dv_timings *timings);
> +int hws_vidioc_g_dv_timings(struct file *file, void *fh,
> +			    struct v4l2_dv_timings *timings);
> +int hws_vidioc_enum_dv_timings(struct file *file, void *fh,
> +			       struct v4l2_enum_dv_timings *edv);
> +int hws_vidioc_query_dv_timings(struct file *file, void *fh,
> +				struct v4l2_dv_timings *timings);
> +
> +#endif
> diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
> new file mode 100644
> index 000000000000..9fcf40a12ec3
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_video.c
> @@ -0,0 +1,1546 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/pci.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/compiler.h>
> +#include <linux/overflow.h>
> +#include <linux/delay.h>
> +#include <linux/bits.h>
> +#include <linux/jiffies.h>
> +#include <linux/ktime.h>
> +#include <linux/interrupt.h>
> +#include <linux/moduleparam.h>
> +#include <linux/sysfs.h>
> +
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-event.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "hws.h"
> +#include "hws_reg.h"
> +#include "hws_video.h"
> +#include "hws_irq.h"
> +#include "hws_v4l2_ioctl.h"
> +
> +#define HWS_REMAP_SLOT_OFF(ch)   (0x208 + (ch) * 8)	/* one 64-bit slot per ch */
> +#define HWS_BUF_BASE_OFF(ch)     (CVBS_IN_BUF_BASE  + (ch) * PCIE_BARADDROFSIZE)
> +#define HWS_HALF_SZ_OFF(ch)      (CVBS_IN_BUF_BASE2 + (ch) * PCIE_BARADDROFSIZE)
> +
> +static void update_live_resolution(struct hws_pcie_dev *pdx, unsigned int ch);
> +static bool hws_update_active_interlace(struct hws_pcie_dev *pdx,
> +					unsigned int ch);
> +static void handle_hwv2_path(struct hws_pcie_dev *hws, unsigned int ch);
> +static void handle_legacy_path(struct hws_pcie_dev *hws, unsigned int ch);
> +static u32 hws_calc_sizeimage(struct hws_video *v, u16 w, u16 h,
> +			      bool interlaced);
> +
> +/* DMA helper functions */
> +static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma);
> +static struct hwsvideo_buffer *
> +hws_take_queued_buffer_locked(struct hws_video *vid);
> +
> +#if IS_ENABLED(CONFIG_SYSFS)
> +static ssize_t resolution_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct hws_video *vid = video_get_drvdata(vdev);
> +	struct hws_pcie_dev *hws;
> +	u32 res_reg;
> +	u16 w, h;
> +	bool interlaced;
> +
> +	if (!vid)
> +		return -ENODEV;
> +
> +	hws = vid->parent;
> +	if (!hws || !hws->bar0_base)
> +		return sysfs_emit(buf, "unknown\n");
> +
> +	res_reg = readl(hws->bar0_base + HWS_REG_IN_RES(vid->channel_index));
> +	if (!res_reg || res_reg == 0xFFFFFFFF)
> +		return sysfs_emit(buf, "unknown\n");
> +
> +	w = res_reg & 0xFFFF;
> +	h = (res_reg >> 16) & 0xFFFF;
> +
> +	interlaced =
> +	    !!(readl(hws->bar0_base + HWS_REG_ACTIVE_STATUS) &
> +	       BIT(8 + vid->channel_index));
> +
> +	return sysfs_emit(buf, "%ux%u%s\n", w, h, interlaced ? "i" : "p");
> +}
> +static DEVICE_ATTR_RO(resolution);
> +
> +static inline int hws_resolution_create(struct video_device *vdev)
> +{
> +	return device_create_file(&vdev->dev, &dev_attr_resolution);
> +}
> +
> +static inline void hws_resolution_remove(struct video_device *vdev)
> +{
> +	device_remove_file(&vdev->dev, &dev_attr_resolution);
> +}
> +#else
> +static inline int hws_resolution_create(struct video_device *vdev)
> +{
> +	return 0;
> +}
> +
> +static inline void hws_resolution_remove(struct video_device *vdev)
> +{
> +}
> +#endif
> +
> +static bool dma_window_verify;
> +module_param_named(dma_window_verify, dma_window_verify, bool, 0644);
> +MODULE_PARM_DESC(dma_window_verify,
> +		 "Read back DMA window registers after programming (debug)");
> +
> +void hws_set_dma_doorbell(struct hws_pcie_dev *hws, unsigned int ch,
> +			  dma_addr_t dma, const char *tag)
> +{
> +	iowrite32(lower_32_bits(dma), hws->bar0_base + HWS_REG_DMA_ADDR(ch));
> +	dev_dbg(&hws->pdev->dev, "dma_doorbell ch%u: dma=0x%llx tag=%s\n", ch,
> +		(u64)dma, tag ? tag : "");
> +}
> +
> +static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma)
> +{
> +	const u32 addr_mask = PCI_E_BAR_ADD_MASK;	// 0xE0000000
> +	const u32 addr_low_mask = PCI_E_BAR_ADD_LOWMASK;	// 0x1FFFFFFF
> +	struct hws_pcie_dev *hws = vid->parent;
> +	unsigned int ch = vid->channel_index;
> +	u32 table_off = HWS_REMAP_SLOT_OFF(ch);
> +	u32 lo = lower_32_bits(dma);
> +	u32 hi = upper_32_bits(dma);
> +	u32 pci_addr = lo & addr_low_mask;	// low 29 bits inside 512MB window
> +	u32 page_lo = lo & addr_mask;	// bits 31..29 only (page bits)
> +
> +	bool wrote = false;
> +
> +	/* Remap entry only when DMA crosses into a new 512 MB page */
> +	if (!vid->window_valid || vid->last_dma_hi != hi ||
> +	    vid->last_dma_page != page_lo) {
> +		writel(hi, hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off);
> +		writel(page_lo,
> +		       hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off +
> +		       PCIE_BARADDROFSIZE);
> +		vid->last_dma_hi = hi;
> +		vid->last_dma_page = page_lo;
> +		wrote = true;
> +	}
> +
> +	/* Base pointer only needs low 29 bits */
> +	if (!vid->window_valid || vid->last_pci_addr != pci_addr) {
> +		writel((ch + 1) * PCIEBAR_AXI_BASE + pci_addr,
> +		       hws->bar0_base + HWS_BUF_BASE_OFF(ch));
> +		vid->last_pci_addr = pci_addr;
> +		wrote = true;
> +	}
> +
> +	/* Half-size only changes when resolution changes */
> +	if (!vid->window_valid || vid->last_half16 != vid->pix.half_size / 16) {
> +		writel(vid->pix.half_size / 16,
> +		       hws->bar0_base + HWS_HALF_SZ_OFF(ch));
> +		vid->last_half16 = vid->pix.half_size / 16;
> +		wrote = true;
> +	}
> +
> +	vid->window_valid = true;
> +
> +	if (unlikely(dma_window_verify) && wrote) {
> +		u32 r_hi =
> +		    readl(hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off);
> +		u32 r_lo =
> +		    readl(hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off +
> +			  PCIE_BARADDROFSIZE);
> +		u32 r_base = readl(hws->bar0_base + HWS_BUF_BASE_OFF(ch));
> +		u32 r_half = readl(hws->bar0_base + HWS_HALF_SZ_OFF(ch));
> +
> +		dev_dbg(&hws->pdev->dev,
> +			"ch%u remap verify: hi=0x%08x page_lo=0x%08x exp_page=0x%08x base=0x%08x exp_base=0x%08x half16B=0x%08x exp_half=0x%08x\n",
> +			ch, r_hi, r_lo, page_lo, r_base,
> +			(ch + 1) * PCIEBAR_AXI_BASE + pci_addr, r_half,
> +			vid->pix.half_size / 16);
> +	} else if (wrote) {
> +		/* Flush posted writes before arming DMA */
> +		readl_relaxed(hws->bar0_base + HWS_HALF_SZ_OFF(ch));
> +	}
> +}
> +
> +static struct hwsvideo_buffer *
> +hws_take_queued_buffer_locked(struct hws_video *vid)
> +{
> +	struct hwsvideo_buffer *buf;
> +
> +	if (!vid || list_empty(&vid->capture_queue))
> +		return NULL;
> +
> +	buf = list_first_entry(&vid->capture_queue,
> +			       struct hwsvideo_buffer, list);
> +	list_del_init(&buf->list);
> +	if (vid->queued_count)
> +		vid->queued_count--;
> +	return buf;
> +}
> +
> +void hws_prime_next_locked(struct hws_video *vid)
> +{
> +	struct hws_pcie_dev *hws;
> +	struct hwsvideo_buffer *next;
> +	dma_addr_t dma;
> +
> +	if (!vid)
> +		return;
> +
> +	hws = vid->parent;
> +	if (!hws || !hws->bar0_base)
> +		return;
> +
> +	if (!READ_ONCE(vid->cap_active) || !vid->active || vid->next_prepared)
> +		return;
> +
> +	next = hws_take_queued_buffer_locked(vid);
> +	if (!next)
> +		return;
> +
> +	vid->next_prepared = next;
> +	dma = vb2_dma_contig_plane_dma_addr(&next->vb.vb2_buf, 0);
> +	hws_program_dma_for_addr(hws, vid->channel_index, dma);
> +	iowrite32(lower_32_bits(dma),
> +		  hws->bar0_base + HWS_REG_DMA_ADDR(vid->channel_index));
> +	dev_dbg(&hws->pdev->dev,
> +		"ch%u pre-armed next buffer %p dma=0x%llx\n",
> +		vid->channel_index, next, (u64)dma);
> +}
> +
> +static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
> +{
> +	struct hws_pcie_dev *hws;
> +	unsigned long flags;
> +	struct hwsvideo_buffer *buf = NULL, *next = NULL;
> +	bool have_next = false;
> +	bool doorbell = false;
> +
> +	if (!v)
> +		return false;
> +	hws = v->parent;
> +	if (!hws || READ_ONCE(v->stop_requested) || !READ_ONCE(v->cap_active))
> +		return false;
> +	spin_lock_irqsave(&v->irq_lock, flags);
> +	if (v->active) {
> +		buf = v->active;
> +		v->active = NULL;
> +		buf->slot = 0;
> +	} else if (!list_empty(&v->capture_queue)) {
> +		buf = list_first_entry(&v->capture_queue,
> +				       struct hwsvideo_buffer, list);
> +		list_del_init(&buf->list);
> +		if (v->queued_count)
> +			v->queued_count--;
> +		buf->slot = 0;
> +	}
> +	if (v->next_prepared) {
> +		next = v->next_prepared;
> +		v->next_prepared = NULL;
> +		next->slot = 0;
> +		v->active = next;
> +		have_next = true;
> +	} else if (!list_empty(&v->capture_queue)) {
> +		next = list_first_entry(&v->capture_queue,
> +					struct hwsvideo_buffer, list);
> +		list_del_init(&next->list);
> +		if (v->queued_count)
> +			v->queued_count--;
> +		next->slot = 0;
> +		v->active = next;
> +		have_next = true;
> +	} else {
> +		v->active = NULL;
> +	}
> +	spin_unlock_irqrestore(&v->irq_lock, flags);
> +	if (!buf)
> +		return false;
> +	/* Complete buffer with a neutral frame so dequeuers keep running. */
> +	{
> +		struct vb2_v4l2_buffer *vb2v = &buf->vb;
> +		void *dst = vb2_plane_vaddr(&vb2v->vb2_buf, 0);
> +
> +		if (dst)
> +			memset(dst, 0x10, v->pix.sizeimage);
> +		vb2_set_plane_payload(&vb2v->vb2_buf, 0, v->pix.sizeimage);
> +		vb2v->sequence = (u32)atomic_inc_return(&v->sequence_number);
> +		vb2v->vb2_buf.timestamp = ktime_get_ns();
> +		vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
> +	}
> +	if (have_next && next) {
> +		dma_addr_t dma =
> +		    vb2_dma_contig_plane_dma_addr(&next->vb.vb2_buf, 0);
> +		hws_program_dma_for_addr(hws, v->channel_index, dma);
> +		hws_set_dma_doorbell(hws, v->channel_index, dma,
> +				     tag ? tag : "nosignal_zero");
> +		doorbell = true;
> +	}
> +	if (doorbell) {
> +		wmb(); /* ensure descriptors visible before enabling capture */
> +		hws_enable_video_capture(hws, v->channel_index, true);
> +	}
> +	return true;
> +}
> +
> +static int hws_ctrls_init(struct hws_video *vid)
> +{
> +	struct v4l2_ctrl_handler *hdl = &vid->control_handler;
> +
> +	/* Create BCHS controls plus signal-detect status. */
> +	v4l2_ctrl_handler_init(hdl, 5);
> +
> +	vid->ctrl_brightness = v4l2_ctrl_new_std(hdl, &hws_ctrl_ops,
> +						 V4L2_CID_BRIGHTNESS,
> +						 MIN_VAMP_BRIGHTNESS_UNITS,
> +						 MAX_VAMP_BRIGHTNESS_UNITS, 1,
> +						 HWS_BRIGHTNESS_DEFAULT);
> +
> +	vid->ctrl_contrast =
> +	    v4l2_ctrl_new_std(hdl, &hws_ctrl_ops, V4L2_CID_CONTRAST,
> +			      MIN_VAMP_CONTRAST_UNITS, MAX_VAMP_CONTRAST_UNITS,
> +			      1, HWS_CONTRAST_DEFAULT);
> +
> +	vid->ctrl_saturation = v4l2_ctrl_new_std(hdl, &hws_ctrl_ops,
> +						 V4L2_CID_SATURATION,
> +						 MIN_VAMP_SATURATION_UNITS,
> +						 MAX_VAMP_SATURATION_UNITS, 1,
> +						 HWS_SATURATION_DEFAULT);
> +
> +	vid->ctrl_hue = v4l2_ctrl_new_std(hdl, &hws_ctrl_ops, V4L2_CID_HUE,
> +					  MIN_VAMP_HUE_UNITS,
> +					  MAX_VAMP_HUE_UNITS, 1,
> +					  HWS_HUE_DEFAULT);
> +	vid->hotplug_detect_control = v4l2_ctrl_new_std(hdl, NULL,
> +							V4L2_CID_DV_RX_POWER_PRESENT,
> +							0, 1, 1, 0);
> +	if (vid->hotplug_detect_control)
> +		vid->hotplug_detect_control->flags |=
> +			V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	if (hdl->error) {
> +		int err = hdl->error;
> +
> +		v4l2_ctrl_handler_free(hdl);
> +		return err;
> +	}
> +	return 0;
> +}
> +
> +static void hws_video_move_buf_to_done_locked(struct hwsvideo_buffer **buf,
> +					      struct list_head *done)
> +{
> +	if (!*buf)
> +		return;
> +
> +	if (list_empty(&(*buf)->list))
> +		list_add_tail(&(*buf)->list, done);
> +	else
> +		list_move_tail(&(*buf)->list, done);
> +
> +	*buf = NULL;
> +}
> +
> +static void hws_video_collect_done_locked(struct hws_video *vid,
> +					  struct list_head *done)
> +{
> +	struct hwsvideo_buffer *buf;
> +
> +	hws_video_move_buf_to_done_locked(&vid->active, done);
> +	hws_video_move_buf_to_done_locked(&vid->next_prepared, done);
> +
> +	while (!list_empty(&vid->capture_queue)) {
> +		buf = list_first_entry(&vid->capture_queue,
> +				       struct hwsvideo_buffer, list);
> +		list_move_tail(&buf->list, done);
> +	}
> +
> +	vid->queued_count = 0;
> +}
> +
> +int hws_video_init_channel(struct hws_pcie_dev *pdev, int ch)
> +{
> +	struct hws_video *vid;
> +
> +	/* basic sanity */
> +	if (!pdev || ch < 0 || ch >= pdev->max_channels)
> +		return -EINVAL;
> +
> +	vid = &pdev->video[ch];
> +
> +	/* hard reset the per-channel struct (safe here since we init everything next) */
> +	memset(vid, 0, sizeof(*vid));
> +
> +	/* identity */
> +	vid->parent = pdev;
> +	vid->channel_index = ch;
> +
> +	/* locks & lists */
> +	mutex_init(&vid->state_lock);
> +	spin_lock_init(&vid->irq_lock);
> +	INIT_LIST_HEAD(&vid->capture_queue);
> +	atomic_set(&vid->sequence_number, 0);
> +	vid->active = NULL;
> +
> +	/* DMA watchdog removed; retain counters for diagnostics */
> +	vid->timeout_count = 0;
> +	vid->error_count = 0;
> +
> +	vid->queued_count = 0;
> +	vid->window_valid = false;
> +
> +	/* default format (adjust to your HW) */
> +	vid->pix.width = 1920;
> +	vid->pix.height = 1080;
> +	vid->pix.fourcc = V4L2_PIX_FMT_YUYV;
> +	vid->pix.bytesperline = ALIGN(vid->pix.width * 2, 64);
> +	vid->pix.sizeimage = vid->pix.bytesperline * vid->pix.height;
> +	vid->pix.field = V4L2_FIELD_NONE;
> +	vid->pix.colorspace = V4L2_COLORSPACE_REC709;
> +	vid->pix.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	vid->pix.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	vid->pix.xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +	vid->pix.interlaced = false;
> +	vid->pix.half_size = vid->pix.sizeimage / 2;
> +	vid->alloc_sizeimage = vid->pix.sizeimage;
> +	hws_set_current_dv_timings(vid, vid->pix.width,
> +				   vid->pix.height, vid->pix.interlaced);
> +	vid->current_fps = 60;
> +
> +	/* color controls default (mid-scale) */
> +	vid->current_brightness = 0x80;
> +	vid->current_contrast = 0x80;
> +	vid->current_saturation = 0x80;
> +	vid->current_hue = 0x80;
> +
> +	/* capture state */
> +	vid->cap_active = false;
> +	vid->stop_requested = false;
> +	vid->last_buf_half_toggle = 0;
> +	vid->half_seen = false;
> +	vid->signal_loss_cnt = 0;
> +
> +	/* Create BCHS + DV power-present as modern controls */
> +	{
> +		int err = hws_ctrls_init(vid);
> +
> +		if (err) {
> +			dev_err(&pdev->pdev->dev,
> +				"v4l2 ctrl init failed on ch%d: %d\n", ch, err);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +void hws_video_cleanup_channel(struct hws_pcie_dev *pdev, int ch)
> +{
> +	struct hws_video *vid;
> +	unsigned long flags;
> +	struct hwsvideo_buffer *buf, *tmp;
> +	LIST_HEAD(done);
> +
> +	if (!pdev || ch < 0 || ch >= pdev->max_channels)
> +		return;
> +
> +	vid = &pdev->video[ch];
> +
> +	/* 1) Stop HW best-effort for this channel */
> +	hws_enable_video_capture(vid->parent, vid->channel_index, false);
> +
> +	/* 2) Flip software state so IRQ/BH will be no-ops if they run */
> +	WRITE_ONCE(vid->stop_requested, true);
> +	WRITE_ONCE(vid->cap_active, false);
> +
> +	/* 3) Ensure the IRQ handler finished any in-flight completions */
> +	if (vid->parent && vid->parent->irq >= 0)
> +		synchronize_irq(vid->parent->irq);
> +
> +	/* 4) Drain SW capture queue & in-flight under lock */
> +	spin_lock_irqsave(&vid->irq_lock, flags);
> +	hws_video_collect_done_locked(vid, &done);
> +	spin_unlock_irqrestore(&vid->irq_lock, flags);
> +
> +	list_for_each_entry_safe(buf, tmp, &done, list) {
> +		list_del_init(&buf->list);
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +	}
> +
> +	/* 5) Release VB2 queue if initialized */
> +	if (vid->buffer_queue.ops)
> +		vb2_queue_release(&vid->buffer_queue);
> +
> +	/* 6) Free V4L2 controls */
> +	v4l2_ctrl_handler_free(&vid->control_handler);
> +
> +	/* 7) Unregister the video_device if we own it */
> +	if (vid->video_device && video_is_registered(vid->video_device))
> +		video_unregister_device(vid->video_device);
> +	/* If you allocated it with video_device_alloc(), release it here:
> +	 * video_device_release(vid->video_device);
> +	 */
> +	vid->video_device = NULL;
> +
> +	/* 8) Reset simple state (don’t memset the whole struct here) */
> +	mutex_destroy(&vid->state_lock);
> +	INIT_LIST_HEAD(&vid->capture_queue);
> +	vid->active = NULL;
> +	vid->stop_requested = false;
> +	vid->last_buf_half_toggle = 0;
> +	vid->half_seen = false;
> +	vid->signal_loss_cnt = 0;
> +}
> +
> +/* Convenience cast */
> +static inline struct hwsvideo_buffer *to_hwsbuf(struct vb2_buffer *vb)
> +{
> +	return container_of(to_vb2_v4l2_buffer(vb), struct hwsvideo_buffer, vb);
> +}
> +
> +static int hws_buf_init(struct vb2_buffer *vb)
> +{
> +	struct hwsvideo_buffer *b = to_hwsbuf(vb);
> +
> +	INIT_LIST_HEAD(&b->list);
> +	return 0;
> +}
> +
> +static void hws_buf_finish(struct vb2_buffer *vb)
> +{
> +	/* vb2 core handles cache maintenance for dma-contig buffers */
> +	(void)vb;
> +}
> +
> +static void hws_buf_cleanup(struct vb2_buffer *vb)
> +{
> +	struct hwsvideo_buffer *b = to_hwsbuf(vb);
> +
> +	if (!list_empty(&b->list))
> +		list_del_init(&b->list);
> +}
> +
> +void hws_program_dma_for_addr(struct hws_pcie_dev *hws, unsigned int ch,
> +			      dma_addr_t dma)
> +{
> +	struct hws_video *vid = &hws->video[ch];
> +
> +	hws_program_dma_window(vid, dma);
> +}
> +
> +void hws_enable_video_capture(struct hws_pcie_dev *hws, unsigned int chan,
> +			      bool on)
> +{
> +	u32 status;
> +
> +	if (!hws || hws->pci_lost || chan >= hws->max_channels)
> +		return;
> +
> +	status = readl(hws->bar0_base + HWS_REG_VCAP_ENABLE);
> +	status = on ? (status | BIT(chan)) : (status & ~BIT(chan));
> +	writel(status, hws->bar0_base + HWS_REG_VCAP_ENABLE);
> +	(void)readl(hws->bar0_base + HWS_REG_VCAP_ENABLE);
> +
> +	WRITE_ONCE(hws->video[chan].cap_active, on);
> +
> +	dev_dbg(&hws->pdev->dev, "vcap %s ch%u (reg=0x%08x)\n",
> +		on ? "ON" : "OFF", chan, status);
> +}
> +
> +static void hws_seed_dma_windows(struct hws_pcie_dev *hws)
> +{
> +	const u32 addr_mask = PCI_E_BAR_ADD_MASK;
> +	const u32 addr_low_mask = PCI_E_BAR_ADD_LOWMASK;
> +	u32 table = 0x208;	/* one 64-bit entry per channel */
> +	unsigned int ch;
> +
> +	if (!hws || !hws->bar0_base)
> +		return;
> +
> +	/* If cur_max_video_ch isn’t set yet, default to max_channels */
> +	if (!hws->cur_max_video_ch || hws->cur_max_video_ch > hws->max_channels)
> +		hws->cur_max_video_ch = hws->max_channels;
> +
> +	for (ch = 0; ch < hws->cur_max_video_ch; ch++, table += 8) {
> +		/* Scratch buffers are allocated once during probe. */
> +		if (!hws->scratch_vid[ch].cpu)
> +			continue;
> +
> +		/* 2) Program 64-bit BAR remap entry for this channel */
> +		{
> +			dma_addr_t p = hws->scratch_vid[ch].dma;
> +			u32 lo = lower_32_bits(p) & addr_mask;
> +			u32 hi = upper_32_bits(p);
> +			u32 pci_addr_low = lower_32_bits(p) & addr_low_mask;
> +
> +			writel_relaxed(hi,
> +				       hws->bar0_base + PCI_ADDR_TABLE_BASE +
> +				       table);
> +			writel_relaxed(lo,
> +				       hws->bar0_base + PCI_ADDR_TABLE_BASE +
> +				       table + PCIE_BARADDROFSIZE);
> +
> +			/* 3) Per-channel AXI base + PCI low */
> +			writel_relaxed((ch + 1) * PCIEBAR_AXI_BASE +
> +				       pci_addr_low,
> +				       hws->bar0_base + CVBS_IN_BUF_BASE +
> +				       ch * PCIE_BARADDROFSIZE);
> +
> +			/* 4) Half-frame length in /16 units.
> +			 * Prefer the current channel’s computed half_size if available.
> +			 * Fall back to half of the preallocated scratch buffer.
> +			 */
> +			{
> +				u32 half_bytes = hws->video[ch].pix.half_size ?
> +				    hws->video[ch].pix.half_size :
> +				    (hws->scratch_vid[ch].size / 2);
> +				writel_relaxed(half_bytes / 16,
> +					       hws->bar0_base +
> +					       CVBS_IN_BUF_BASE2 +
> +					       ch * PCIE_BARADDROFSIZE);
> +			}
> +		}
> +	}
> +
> +	/* Post writes so device sees them before we move on */
> +	(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
> +}
> +
> +static void hws_ack_all_irqs(struct hws_pcie_dev *hws)
> +{
> +	u32 st = readl(hws->bar0_base + HWS_REG_INT_STATUS);
> +
> +	if (st) {
> +		writel(st, hws->bar0_base + HWS_REG_INT_STATUS);	/* W1C */
> +		(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
> +	}
> +}
> +
> +static void hws_open_irq_fabric(struct hws_pcie_dev *hws)
> +{
> +	/* Route all sources to vector 0 (same value you’re already using) */
> +	writel(0x00000000, hws->bar0_base + PCIE_INT_DEC_REG_BASE);
> +	(void)readl(hws->bar0_base + PCIE_INT_DEC_REG_BASE);
> +
> +	/* Turn on the bridge if your IP needs it */
> +	writel(0x00000001, hws->bar0_base + PCIEBR_EN_REG_BASE);
> +	(void)readl(hws->bar0_base + PCIEBR_EN_REG_BASE);
> +
> +	/* Open the global/bridge gate (legacy 0x3FFFF) */
> +	writel(HWS_INT_EN_MASK, hws->bar0_base + INT_EN_REG_BASE);
> +	(void)readl(hws->bar0_base + INT_EN_REG_BASE);
> +}
> +
> +void hws_init_video_sys(struct hws_pcie_dev *hws, bool enable)
> +{
> +	int i;
> +
> +	if (hws->start_run && !enable)
> +		return;
> +
> +	/* 1) reset the decoder mode register to 0 */
> +	writel(0x00000000, hws->bar0_base + HWS_REG_DEC_MODE);
> +	hws_seed_dma_windows(hws);
> +
> +	/* 3) on a full reset, clear all per-channel status and indices */
> +	if (!enable) {
> +		for (i = 0; i < hws->max_channels; i++) {
> +			/* helpers to arm/disable capture engines */
> +			hws_enable_video_capture(hws, i, false);
> +		}
> +	}
> +
> +	/* 4) “Start run”: set bit31, wait a bit, then program low 24 bits */
> +	writel(0x80000000, hws->bar0_base + HWS_REG_DEC_MODE);
> +	// udelay(500);
> +	writel(0x80FFFFFF, hws->bar0_base + HWS_REG_DEC_MODE);
> +	writel(0x13, hws->bar0_base + HWS_REG_DEC_MODE);
> +	hws_ack_all_irqs(hws);
> +	hws_open_irq_fabric(hws);
> +	/* 6) record that we're now running */
> +	hws->start_run = true;
> +}
> +
> +int hws_check_card_status(struct hws_pcie_dev *hws)
> +{
> +	u32 status;
> +
> +	if (!hws || !hws->bar0_base)
> +		return -ENODEV;
> +
> +	status = readl(hws->bar0_base + HWS_REG_SYS_STATUS);
> +
> +	/* Common “device missing” pattern */
> +	if (unlikely(status == 0xFFFFFFFF)) {
> +		hws->pci_lost = true;
> +		dev_err(&hws->pdev->dev, "PCIe device not responding\n");
> +		return -ENODEV;
> +	}
> +
> +	/* If RUN/READY bit (bit0) isn’t set, (re)initialize the video core */
> +	if (!(status & BIT(0))) {
> +		dev_dbg(&hws->pdev->dev,
> +			"SYS_STATUS not ready (0x%08x), reinitializing\n",
> +			status);
> +		hws_init_video_sys(hws, true);
> +		/* Optional: verify the core cleared its busy bit, if you have one */
> +		/* int ret = hws_check_busy(hws); */
> +		/* if (ret) return ret; */
> +	}
> +
> +	return 0;
> +}
> +
> +void check_video_format(struct hws_pcie_dev *pdx)
> +{
> +	int i;
> +
> +	for (i = 0; i < pdx->cur_max_video_ch; i++) {
> +		if (!hws_update_active_interlace(pdx, i)) {
> +			/* No active video; optionally feed neutral frames to keep streaming. */
> +			if (pdx->video[i].signal_loss_cnt == 0)
> +				pdx->video[i].signal_loss_cnt = 1;
> +			if (READ_ONCE(pdx->video[i].cap_active))
> +				hws_force_no_signal_frame(&pdx->video[i],
> +							  "monitor_nosignal");
> +		} else {
> +			if (pdx->hw_ver > 0)
> +				handle_hwv2_path(pdx, i);
> +			else
> +				/* Legacy path stub; see handle_legacy_path() comment. */
> +				handle_legacy_path(pdx, i);
> +
> +			update_live_resolution(pdx, i);
> +			pdx->video[i].signal_loss_cnt = 0;
> +		}
> +	}
> +}
> +
> +static inline void hws_write_if_diff(struct hws_pcie_dev *hws, u32 reg_off,
> +				     u32 new_val)
> +{
> +	void __iomem *addr;
> +	u32 old;
> +
> +	if (!hws || !hws->bar0_base)
> +		return;
> +
> +	addr = hws->bar0_base + reg_off;
> +
> +	old = readl(addr);
> +	/* Treat all-ones as device gone; avoid writing garbage. */
> +	if (unlikely(old == 0xFFFFFFFF)) {
> +		hws->pci_lost = true;
> +		return;
> +	}
> +
> +	if (old != new_val) {
> +		writel(new_val, addr);
> +		/* Post the write on some bridges / enforce ordering. */
> +		(void)readl(addr);
> +	}
> +}
> +
> +static bool hws_update_active_interlace(struct hws_pcie_dev *pdx,
> +					unsigned int ch)
> +{
> +	u32 reg;
> +	bool active, interlace;
> +
> +	if (ch >= pdx->cur_max_video_ch)
> +		return false;
> +
> +	reg = readl(pdx->bar0_base + HWS_REG_ACTIVE_STATUS);
> +	active = !!(reg & BIT(ch));
> +	interlace = !!(reg & BIT(8 + ch));
> +
> +	if (pdx->video[ch].hotplug_detect_control) {
> +		v4l2_ctrl_lock(pdx->video[ch].hotplug_detect_control);
> +		__v4l2_ctrl_s_ctrl(pdx->video[ch].hotplug_detect_control,
> +				   active);
> +		v4l2_ctrl_unlock(pdx->video[ch].hotplug_detect_control);
> +	}
> +
> +	WRITE_ONCE(pdx->video[ch].pix.interlaced, interlace);
> +	return active;
> +}
> +
> +/* Modern hardware path: keep HW registers in sync with current per-channel
> + * software state. Adjust the OUT_* bits below to match your HW contract.
> + */
> +static void handle_hwv2_path(struct hws_pcie_dev *hws, unsigned int ch)
> +{
> +	struct hws_video *vid;
> +	u32 reg, in_fps, cur_out_res, want_out_res;
> +
> +	if (!hws || !hws->bar0_base || ch >= hws->max_channels)
> +		return;
> +
> +	vid = &hws->video[ch];
> +
> +	/* 1) Input frame rate (read-only; log or export via debugfs if wanted) */
> +	in_fps = readl(hws->bar0_base + HWS_REG_FRAME_RATE(ch));
> +	if (in_fps)
> +		vid->current_fps = in_fps;
> +	/* dev_dbg(&hws->pdev->dev, "ch%u input fps=%u\n", ch, in_fps); */
> +
> +	/* 2) Output resolution programming
> +	 * If your HW expects a separate “scaled” size, add fields to track it.
> +	 * For now, mirror the current format (fmt_curr) to OUT_RES.
> +	 */
> +	want_out_res = (vid->pix.height << 16) | vid->pix.width;
> +	cur_out_res = readl(hws->bar0_base + HWS_REG_OUT_RES(ch));
> +	if (cur_out_res != want_out_res)
> +		hws_write_if_diff(hws, HWS_REG_OUT_RES(ch), want_out_res);
> +
> +	/* 3) Output FPS: only program if you actually track a target.
> +	 * Example heuristic (disabled by default):
> +	 *
> +	 *   u32 out_fps = (vid->fmt_curr.height >= 1080) ? 60 : 30;
> +	 *   hws_write_if_diff(hws, HWS_REG_OUT_FRAME_RATE(ch), out_fps);
> +	 */
> +
> +	/* 4) BCHS controls: pack from per-channel current_* fields */
> +	reg = readl(hws->bar0_base + HWS_REG_BCHS(ch));
> +	{
> +		u8 br = reg & 0xFF;
> +		u8 co = (reg >> 8) & 0xFF;
> +		u8 hu = (reg >> 16) & 0xFF;
> +		u8 sa = (reg >> 24) & 0xFF;
> +
> +		if (br != vid->current_brightness ||
> +		    co != vid->current_contrast || hu != vid->current_hue ||
> +		    sa != vid->current_saturation) {
> +			u32 packed = (vid->current_saturation << 24) |
> +			    (vid->current_hue << 16) |
> +			    (vid->current_contrast << 8) |
> +			    vid->current_brightness;
> +			hws_write_if_diff(hws, HWS_REG_BCHS(ch), packed);
> +		}
> +	}
> +
> +	/* 5) HDCP detect: read only (no cache field in your structs today) */
> +	reg = readl(hws->bar0_base + HWS_REG_HDCP_STATUS);
> +	/* bool hdcp = !!(reg & BIT(ch)); // use if you later add a field/control */
> +}
> +
> +static void handle_legacy_path(struct hws_pcie_dev *hws, unsigned int ch)
> +{
> +	/*
> +	 * Legacy (hw_ver == 0) expected behavior:
> +	 * - A per-channel SW FPS accumulator incremented on each VDONE.
> +	 * - A once-per-second poll mapped the count to discrete FPS:
> +	 *   >55*2 => 60, >45*2 => 50, >25*2 => 30, >20*2 => 25, else 60,
> +	 *   then reset the accumulator to 0.
> +	 * - The *2 factor assumed VDONE fired per-field; if legacy VDONE is
> +	 *   per-frame, drop the factor.
> +	 *
> +	 * Current code keeps this path as a no-op; vid->current_fps stays at the
> +	 * default or mode-derived value. If accurate legacy FPS reporting is
> +	 * needed (V4L2 g_parm/timeperframe), reintroduce the accumulator in the
> +	 * IRQ path and perform the mapping/reset here.
> +	 *
> +	 * No-op by default. If you introduce a SW FPS accumulator, map it here.
> +	 *
> +	 * Example skeleton:
> +	 *
> +	 *   u32 sw_rate = READ_ONCE(hws->sw_fps[ch]); // incremented elsewhere
> +	 *   if (sw_rate > THRESHOLD) {
> +	 *       u32 fps = pick_fps_from_rate(sw_rate);
> +	 *       hws_write_if_diff(hws, HWS_REG_OUT_FRAME_RATE(ch), fps);
> +	 *       WRITE_ONCE(hws->sw_fps[ch], 0);
> +	 *   }
> +	 */
> +	(void)hws;
> +	(void)ch;
> +}
> +
> +static void hws_video_apply_mode_change(struct hws_pcie_dev *pdx,
> +					unsigned int ch, u16 w, u16 h,
> +					bool interlaced)
> +{
> +	struct hws_video *v = &pdx->video[ch];
> +	unsigned long flags;
> +	u32 new_size;
> +	bool queue_busy;
> +	struct list_head done;
> +	struct hwsvideo_buffer *b, *tmp;
> +
> +	if (!pdx || !pdx->bar0_base)
> +		return;
> +	if (ch >= pdx->max_channels)
> +		return;
> +	if (!w || !h || w > MAX_VIDEO_HW_W ||
> +	    (!interlaced && h > MAX_VIDEO_HW_H) ||
> +	    (interlaced && (h * 2) > MAX_VIDEO_HW_H))
> +		return;
> +
> +	if (!mutex_trylock(&v->state_lock))
> +		return;
> +
> +	INIT_LIST_HEAD(&done);
> +
> +	WRITE_ONCE(v->stop_requested, true);
> +	WRITE_ONCE(v->cap_active, false);
> +	/* Publish software stop first so the IRQ completion path sees the stop
> +	 * before we touch MMIO or the lists. Pairs with READ_ONCE() checks in the
> +	 * VDONE handler and hws_arm_next() to prevent completions while modes
> +	 * change.
> +	 */
> +	smp_wmb();
> +
> +	hws_enable_video_capture(pdx, ch, false);
> +	readl(pdx->bar0_base + HWS_REG_INT_STATUS);
> +
> +	if (v->parent && v->parent->irq >= 0)
> +		synchronize_irq(v->parent->irq);
> +
> +	spin_lock_irqsave(&v->irq_lock, flags);
> +	hws_video_collect_done_locked(v, &done);
> +	spin_unlock_irqrestore(&v->irq_lock, flags);
> +
> +	/* Update software pixel state */
> +	v->pix.width = w;
> +	v->pix.height = h;
> +	v->pix.interlaced = interlaced;
> +	hws_set_current_dv_timings(v, w, h, interlaced);
> +	/* Try to reflect the live frame rate if HW reports it; otherwise default
> +	 * to common rates (50 Hz for 576p, else 60 Hz).
> +	 */
> +	{
> +		u32 fps = readl(pdx->bar0_base + HWS_REG_FRAME_RATE(ch));
> +
> +		if (fps)
> +			v->current_fps = fps;
> +		else
> +			v->current_fps = (h == 576) ? 50 : 60;
> +	}
> +
> +	new_size = hws_calc_sizeimage(v, w, h, interlaced);
> +	v->window_valid = false;
> +	queue_busy = vb2_is_busy(&v->buffer_queue);
> +
> +	/* Mode changes require userspace to renegotiate buffers and restart
> +	 * streaming. Complete every queued buffer with an error, surface a
> +	 * SOURCE_CHANGE event, and leave the queue in an error state until the
> +	 * next streamoff/reqbufs cycle.
> +	 */
> +	if (queue_busy) {
> +		struct v4l2_event ev = {
> +			.type = V4L2_EVENT_SOURCE_CHANGE,
> +		};
> +
> +		ev.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION;
> +		v4l2_event_queue(v->video_device, &ev);
> +		vb2_queue_error(&v->buffer_queue);
> +	} else {
> +		v->alloc_sizeimage = PAGE_ALIGN(new_size);
> +	}
> +
> +	/* Program HW with new resolution */
> +	hws_write_if_diff(pdx, HWS_REG_OUT_RES(ch), (h << 16) | w);
> +
> +	/* Legacy half-buffer programming */
> +	writel(v->pix.half_size / 16,
> +	       pdx->bar0_base + CVBS_IN_BUF_BASE2 + ch * PCIE_BARADDROFSIZE);
> +	(void)readl(pdx->bar0_base + CVBS_IN_BUF_BASE2 +
> +		    ch * PCIE_BARADDROFSIZE);
> +
> +	/* Reset per-channel toggles/counters */
> +	WRITE_ONCE(v->last_buf_half_toggle, 0);
> +	atomic_set(&v->sequence_number, 0);
> +
> +	mutex_unlock(&v->state_lock);
> +
> +	list_for_each_entry_safe(b, tmp, &done, list) {
> +		list_del_init(&b->list);
> +		vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +	}
> +}
> +
> +static void update_live_resolution(struct hws_pcie_dev *pdx, unsigned int ch)
> +{
> +	u32 reg = readl(pdx->bar0_base + HWS_REG_IN_RES(ch));
> +	u16 res_w = reg & 0xFFFF;
> +	u16 res_h = (reg >> 16) & 0xFFFF;
> +	bool interlace = READ_ONCE(pdx->video[ch].pix.interlaced);
> +
> +	bool within_hw = (res_w <= MAX_VIDEO_HW_W) &&
> +	    ((!interlace && res_h <= MAX_VIDEO_HW_H) ||
> +	     (interlace && (res_h * 2) <= MAX_VIDEO_HW_H));
> +
> +	if (!within_hw)
> +		return;
> +
> +	if (res_w != pdx->video[ch].pix.width ||
> +	    res_h != pdx->video[ch].pix.height) {
> +		hws_video_apply_mode_change(pdx, ch, res_w, res_h, interlace);
> +	}
> +}
> +
> +static int hws_open(struct file *file)
> +{
> +	return v4l2_fh_open(file);
> +}
> +
> +static const struct v4l2_file_operations hws_fops = {
> +	.owner = THIS_MODULE,
> +	.open = hws_open,
> +	.release = vb2_fop_release,
> +	.poll = vb2_fop_poll,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap = vb2_fop_mmap,
> +};
> +
> +static int hws_subscribe_event(struct v4l2_fh *fh,
> +			       const struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_SOURCE_CHANGE:
> +		return v4l2_src_change_event_subscribe(fh, sub);
> +	case V4L2_EVENT_CTRL:
> +		return v4l2_ctrl_subscribe_event(fh, sub);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct v4l2_ioctl_ops hws_ioctl_fops = {
> +	/* Core caps/info */
> +	.vidioc_querycap = hws_vidioc_querycap,
> +
> +	/* Pixel format: still needed to report YUYV etc. */
> +	.vidioc_enum_fmt_vid_cap = hws_vidioc_enum_fmt_vid_cap,
> +	.vidioc_enum_frameintervals = hws_vidioc_enum_frameintervals,
> +	.vidioc_g_fmt_vid_cap = hws_vidioc_g_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap = hws_vidioc_s_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap = hws_vidioc_try_fmt_vid_cap,
> +
> +	/* Buffer queueing / streaming */
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +
> +	/* Inputs */
> +	.vidioc_enum_input = hws_vidioc_enum_input,
> +	.vidioc_g_input = hws_vidioc_g_input,
> +	.vidioc_s_input = hws_vidioc_s_input,
> +
> +	/* DV timings (HDMI/DVI/VESA modes) */
> +	.vidioc_query_dv_timings = hws_vidioc_query_dv_timings,
> +	.vidioc_enum_dv_timings = hws_vidioc_enum_dv_timings,
> +	.vidioc_g_dv_timings = hws_vidioc_g_dv_timings,
> +	.vidioc_s_dv_timings = hws_vidioc_s_dv_timings,
> +	.vidioc_dv_timings_cap = hws_vidioc_dv_timings_cap,
> +
> +	.vidioc_log_status = v4l2_ctrl_log_status,
> +	.vidioc_subscribe_event = hws_subscribe_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +	.vidioc_g_parm = hws_vidioc_g_parm,
> +	.vidioc_s_parm = hws_vidioc_s_parm,
> +};
> +
> +static u32 hws_calc_sizeimage(struct hws_video *v, u16 w, u16 h,
> +			      bool interlaced)
> +{
> +	/* example for packed 16bpp (YUYV); replace with your real math/align */
> +	u32 lines = h;		/* full frame lines for sizeimage */
> +	u32 bytesperline = ALIGN(w * 2, 64);
> +	u32 sizeimage, half0;
> +
> +	/* publish into pix, since we now carry these in-state */
> +	v->pix.bytesperline = bytesperline;
> +	sizeimage = bytesperline * lines;
> +
> +	half0 = sizeimage / 2;
> +
> +	v->pix.sizeimage = sizeimage;
> +	v->pix.half_size = half0;	/* first half; second = sizeimage - half0 */
> +	v->pix.field = interlaced ? V4L2_FIELD_INTERLACED : V4L2_FIELD_NONE;
> +
> +	return v->pix.sizeimage;
> +}
> +
> +static int hws_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
> +			   unsigned int *nplanes, unsigned int sizes[],
> +			   struct device *alloc_devs[])
> +{
> +	struct hws_video *vid = q->drv_priv;
> +
> +	(void)num_buffers;
> +	(void)alloc_devs;
> +
> +	if (!vid->pix.sizeimage) {
> +		vid->pix.bytesperline = ALIGN(vid->pix.width * 2, 64);
> +		vid->pix.sizeimage = vid->pix.bytesperline * vid->pix.height;
> +	}
> +	if (*nplanes) {
> +		if (sizes[0] < vid->pix.sizeimage)
> +			return -EINVAL;
> +	} else {
> +		*nplanes = 1;
> +		sizes[0] = PAGE_ALIGN(vid->pix.sizeimage);
> +	}
> +
> +	vid->alloc_sizeimage = PAGE_ALIGN(vid->pix.sizeimage);
> +	return 0;
> +}
> +
> +static int hws_buffer_prepare(struct vb2_buffer *vb)
> +{
> +	struct hws_video *vid = vb->vb2_queue->drv_priv;
> +	struct hws_pcie_dev *hws = vid->parent;
> +	size_t need = vid->pix.sizeimage;
> +	dma_addr_t dma_addr;
> +
> +	if (vb2_plane_size(vb, 0) < need)
> +		return -EINVAL;
> +
> +	/* Validate DMA address alignment */
> +	dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
> +	if (dma_addr & 0x3F) {	/* 64-byte alignment required */
> +		dev_err(&hws->pdev->dev,
> +			"Buffer DMA address 0x%llx not 64-byte aligned\n",
> +			(unsigned long long)dma_addr);
> +		return -EINVAL;
> +	}
> +
> +	vb2_set_plane_payload(vb, 0, need);
> +	return 0;
> +}
> +
> +static void hws_buffer_queue(struct vb2_buffer *vb)
> +{
> +	struct hws_video *vid = vb->vb2_queue->drv_priv;
> +	struct hwsvideo_buffer *buf = to_hwsbuf(vb);
> +	struct hws_pcie_dev *hws = vid->parent;
> +	unsigned long flags;
> +
> +	dev_dbg(&hws->pdev->dev,
> +		"buffer_queue(ch=%u): vb=%p sizeimage=%u q_active=%d\n",
> +		vid->channel_index, vb, vid->pix.sizeimage,
> +		READ_ONCE(vid->cap_active));
> +
> +	/* Initialize buffer slot */
> +	buf->slot = 0;
> +
> +	spin_lock_irqsave(&vid->irq_lock, flags);
> +	list_add_tail(&buf->list, &vid->capture_queue);
> +	vid->queued_count++;
> +
> +	/* If streaming and no in-flight buffer, prime HW immediately */
> +	if (READ_ONCE(vid->cap_active) && !vid->active) {
> +		dma_addr_t dma_addr;
> +
> +		dev_dbg(&hws->pdev->dev,
> +			"buffer_queue(ch=%u): priming first vb=%p\n",
> +			vid->channel_index, &buf->vb.vb2_buf);
> +		list_del_init(&buf->list);
> +		vid->queued_count--;
> +		vid->active = buf;
> +
> +		dma_addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> +		hws_program_dma_for_addr(vid->parent, vid->channel_index,
> +					 dma_addr);
> +		iowrite32(lower_32_bits(dma_addr),
> +			  hws->bar0_base + HWS_REG_DMA_ADDR(vid->channel_index));
> +
> +		wmb(); /* ensure descriptors visible before enabling capture */
> +		hws_enable_video_capture(hws, vid->channel_index, true);
> +		hws_prime_next_locked(vid);
> +	} else if (READ_ONCE(vid->cap_active) && vid->active) {
> +		hws_prime_next_locked(vid);
> +	}
> +	spin_unlock_irqrestore(&vid->irq_lock, flags);
> +}
> +
> +static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct hws_video *v = q->drv_priv;
> +	struct hws_pcie_dev *hws = v->parent;
> +	struct hwsvideo_buffer *to_program = NULL;	/* local copy */
> +	struct vb2_buffer *prog_vb2 = NULL;
> +	unsigned long flags;
> +	int ret;
> +
> +	dev_dbg(&hws->pdev->dev, "start_streaming: ch=%u count=%u\n",
> +		v->channel_index, count);
> +
> +	ret = hws_check_card_status(hws);
> +	if (ret) {
> +		struct hwsvideo_buffer *b, *tmp;
> +		unsigned long f;
> +		LIST_HEAD(queued);
> +
> +		spin_lock_irqsave(&v->irq_lock, f);
> +		if (v->active) {
> +			list_add_tail(&v->active->list, &queued);
> +			v->active = NULL;
> +		}
> +		if (v->next_prepared) {
> +			list_add_tail(&v->next_prepared->list, &queued);
> +			v->next_prepared = NULL;
> +		}
> +		while (!list_empty(&v->capture_queue)) {
> +			b = list_first_entry(&v->capture_queue,
> +					     struct hwsvideo_buffer, list);
> +			list_move_tail(&b->list, &queued);
> +		}
> +		spin_unlock_irqrestore(&v->irq_lock, f);
> +
> +		list_for_each_entry_safe(b, tmp, &queued, list) {
> +			list_del_init(&b->list);
> +			vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
> +		}
> +		return ret;
> +	}
> +	(void)hws_update_active_interlace(hws, v->channel_index);
> +
> +	lockdep_assert_held(&v->state_lock);
> +	/* init per-stream state */
> +	WRITE_ONCE(v->stop_requested, false);
> +	WRITE_ONCE(v->cap_active, true);
> +	WRITE_ONCE(v->half_seen, false);
> +	WRITE_ONCE(v->last_buf_half_toggle, 0);
> +
> +	/* Try to prime a buffer, but it's OK if none are queued yet */
> +	spin_lock_irqsave(&v->irq_lock, flags);
> +	if (!v->active && !list_empty(&v->capture_queue)) {
> +		to_program = list_first_entry(&v->capture_queue,
> +					      struct hwsvideo_buffer, list);
> +		list_del_init(&to_program->list);
> +		v->queued_count--;
> +		v->active = to_program;
> +		prog_vb2 = &to_program->vb.vb2_buf;
> +		dev_dbg(&hws->pdev->dev,
> +			"start_streaming: ch=%u took buffer %p\n",
> +			v->channel_index, to_program);
> +	}
> +	spin_unlock_irqrestore(&v->irq_lock, flags);
> +
> +	/* Only program/enable HW if we actually have a buffer */
> +	if (to_program) {
> +		if (!prog_vb2)
> +			prog_vb2 = &to_program->vb.vb2_buf;
> +		{
> +			dma_addr_t dma_addr;
> +
> +			dma_addr = vb2_dma_contig_plane_dma_addr(prog_vb2, 0);
> +			hws_program_dma_for_addr(hws, v->channel_index, dma_addr);
> +			iowrite32(lower_32_bits(dma_addr),
> +				  hws->bar0_base +
> +				  HWS_REG_DMA_ADDR(v->channel_index));
> +			dev_dbg(&hws->pdev->dev,
> +				"start_streaming: ch=%u programmed buffer %p dma=0x%08x\n",
> +				v->channel_index, to_program,
> +				lower_32_bits(dma_addr));
> +			(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
> +		}
> +
> +		wmb(); /* ensure descriptors visible before enabling capture */
> +		hws_enable_video_capture(hws, v->channel_index, true);
> +		{
> +			unsigned long pf;
> +
> +			spin_lock_irqsave(&v->irq_lock, pf);
> +			hws_prime_next_locked(v);
> +			spin_unlock_irqrestore(&v->irq_lock, pf);
> +		}
> +	} else {
> +		dev_dbg(&hws->pdev->dev,
> +			"start_streaming: ch=%u no buffer yet (will arm on QBUF)\n",
> +			v->channel_index);
> +	}
> +
> +	return 0;
> +}
> +
> +static void hws_log_video_state(struct hws_video *v, const char *action,
> +				const char *phase)
> +{
> +	struct hws_pcie_dev *hws = v->parent;
> +	unsigned long flags;
> +	unsigned int queued = 0;
> +	unsigned int tracked = 0;
> +	unsigned int seq = 0;
> +	struct hwsvideo_buffer *b;
> +	bool streaming = vb2_is_streaming(&v->buffer_queue);
> +	bool cap_active;
> +	bool stop_requested;
> +	struct hwsvideo_buffer *active;
> +	struct hwsvideo_buffer *next_prepared;
> +
> +	spin_lock_irqsave(&v->irq_lock, flags);
> +	list_for_each_entry(b, &v->capture_queue, list)
> +		queued++;
> +	cap_active = READ_ONCE(v->cap_active);
> +	stop_requested = READ_ONCE(v->stop_requested);
> +	active = v->active;
> +	next_prepared = v->next_prepared;
> +	tracked = v->queued_count;
> +	seq = (u32)atomic_read(&v->sequence_number);
> +	spin_unlock_irqrestore(&v->irq_lock, flags);
> +
> +	dev_dbg(&hws->pdev->dev,
> +		"video:%s:%s ch=%u streaming=%d cap=%d stop=%d active=%p next=%p queued=%u tracked=%u seq=%u\n",
> +		action, phase, v->channel_index, streaming, cap_active,
> +		stop_requested, active, next_prepared, queued, tracked, seq);
> +}
> +
> +static void hws_stop_streaming(struct vb2_queue *q)
> +{
> +	struct hws_video *v = q->drv_priv;
> +	struct hws_pcie_dev *hws = v->parent;
> +	unsigned long flags;
> +	struct hwsvideo_buffer *b, *tmp;
> +	LIST_HEAD(done);
> +	unsigned int done_cnt = 0;
> +	u64 start_ns = ktime_get_mono_fast_ns();
> +
> +	hws_log_video_state(v, "streamoff", "begin");
> +
> +	/* 1) Quiesce SW/HW first */
> +	lockdep_assert_held(&v->state_lock);
> +	WRITE_ONCE(v->cap_active, false);
> +	WRITE_ONCE(v->stop_requested, true);
> +
> +	hws_enable_video_capture(v->parent, v->channel_index, false);
> +
> +	/* 2) Collect in-flight + queued under the IRQ lock */
> +	spin_lock_irqsave(&v->irq_lock, flags);
> +	hws_video_collect_done_locked(v, &done);
> +	spin_unlock_irqrestore(&v->irq_lock, flags);
> +
> +	/* 3) Complete outside the lock */
> +	list_for_each_entry_safe(b, tmp, &done, list) {
> +		/* Unlink from 'done' before completing */
> +		list_del_init(&b->list);
> +		vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +		done_cnt++;
> +	}
> +	dev_dbg(&hws->pdev->dev,
> +		"video:streamoff:done ch=%u completed=%u (%lluus)\n",
> +		v->channel_index, done_cnt,
> +		(unsigned long long)((ktime_get_mono_fast_ns() - start_ns) / 1000));
> +	hws_log_video_state(v, "streamoff", "end");
> +}
> +
> +static const struct vb2_ops hwspcie_video_qops = {
> +	.queue_setup = hws_queue_setup,
> +	.buf_prepare = hws_buffer_prepare,
> +	.buf_init = hws_buf_init,
> +	.buf_finish = hws_buf_finish,
> +	.buf_cleanup = hws_buf_cleanup,
> +	// .buf_finish = hws_buffer_finish,

Can be dropped, seems to be a left-over.

> +	.buf_queue = hws_buffer_queue,
> +	.start_streaming = hws_start_streaming,
> +	.stop_streaming = hws_stop_streaming,
> +};
> +
> +int hws_video_register(struct hws_pcie_dev *dev)
> +{
> +	int i, ret;
> +
> +	ret = v4l2_device_register(&dev->pdev->dev, &dev->v4l2_device);
> +	if (ret) {
> +		dev_err(&dev->pdev->dev, "v4l2_device_register failed: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < dev->cur_max_video_ch; i++) {
> +		struct hws_video *ch = &dev->video[i];
> +		struct video_device *vdev;
> +		struct vb2_queue *q;
> +
> +		/* hws_video_init_channel() should have set:
> +		 * - ch->parent, ch->channel_index
> +		 * - locks (state_lock, irq_lock)
> +		 * - capture_queue (INIT_LIST_HEAD)
> +		 * - control_handler + controls
> +		 * - fmt_curr (width/height)
> +		 * Don’t reinitialize any of those here.
> +		 */
> +
> +		vdev = video_device_alloc();
> +		if (!vdev) {
> +			dev_err(&dev->pdev->dev,
> +				"video_device_alloc ch%u failed\n", i);
> +			ret = -ENOMEM;
> +			goto err_unwind;
> +		}
> +		ch->video_device = vdev;
> +
> +		/* Basic V4L2 node setup */
> +		snprintf(vdev->name, sizeof(vdev->name), "%s-hdmi%u",
> +			 KBUILD_MODNAME, i);
> +		vdev->v4l2_dev = &dev->v4l2_device;
> +		vdev->fops = &hws_fops;	/* your file_ops */
> +		vdev->ioctl_ops = &hws_ioctl_fops;	/* your ioctl_ops */
> +		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +		vdev->lock = &ch->state_lock;	/* serialize file ops */
> +		vdev->ctrl_handler = &ch->control_handler;
> +		vdev->vfl_dir = VFL_DIR_RX;
> +		vdev->release = video_device_release;
> +		if (ch->control_handler.error) {
> +			ret = ch->control_handler.error;
> +			goto err_unwind;
> +		}
> +		video_set_drvdata(vdev, ch);
> +
> +		/* vb2 queue init (dma-contig) */
> +		q = &ch->buffer_queue;
> +		memset(q, 0, sizeof(*q));
> +		q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +		q->io_modes = VB2_MMAP | VB2_DMABUF;
> +		q->drv_priv = ch;
> +		q->buf_struct_size = sizeof(struct hwsvideo_buffer);
> +		q->ops = &hwspcie_video_qops;	/* your vb2_ops */
> +		q->mem_ops = &vb2_dma_contig_memops;
> +		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +		q->lock = &ch->state_lock;
> +		q->min_queued_buffers = 1;
> +		q->dev = &dev->pdev->dev;
> +
> +		ret = vb2_queue_init(q);
> +		vdev->queue = q;
> +		if (ret) {
> +			dev_err(&dev->pdev->dev,
> +				"vb2_queue_init ch%u failed: %d\n", i, ret);
> +			goto err_unwind;
> +		}
> +
> +		/* Make controls live (no-op if none or already set up) */
> +		if (ch->control_handler.error) {
> +			ret = ch->control_handler.error;
> +			dev_err(&dev->pdev->dev,
> +				"ctrl handler ch%u error: %d\n", i, ret);
> +			goto err_unwind;
> +		}
> +		v4l2_ctrl_handler_setup(&ch->control_handler);
> +		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +		if (ret) {
> +			dev_err(&dev->pdev->dev,
> +				"video_register_device ch%u failed: %d\n", i,
> +				ret);
> +			goto err_unwind;
> +		}
> +
> +		ret = hws_resolution_create(vdev);
> +		if (ret) {
> +			dev_err(&dev->pdev->dev,
> +				"device_create_file(resolution) ch%u failed: %d\n",
> +				i, ret);
> +			goto err_unwind;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_unwind:
> +	for (; i >= 0; i--) {
> +		struct hws_video *ch = &dev->video[i];
> +
> +		if (video_is_registered(ch->video_device))
> +			hws_resolution_remove(ch->video_device);
> +		if (video_is_registered(ch->video_device))
> +			vb2_video_unregister_device(ch->video_device);
> +		if (ch->video_device) {
> +			/* If not registered, we must free the alloc’d vdev ourselves */
> +			if (!video_is_registered(ch->video_device))
> +				video_device_release(ch->video_device);
> +			ch->video_device = NULL;
> +		}
> +	}
> +	v4l2_device_unregister(&dev->v4l2_device);
> +	return ret;
> +}
> +
> +void hws_video_unregister(struct hws_pcie_dev *dev)
> +{
> +	int i;
> +
> +	if (!dev)
> +		return;
> +
> +	for (i = 0; i < dev->cur_max_video_ch; i++) {
> +		struct hws_video *ch = &dev->video[i];
> +
> +		if (ch->video_device)
> +			hws_resolution_remove(ch->video_device);
> +		if (ch->video_device) {
> +			vb2_video_unregister_device(ch->video_device);
> +			ch->video_device = NULL;
> +		}
> +		v4l2_ctrl_handler_free(&ch->control_handler);
> +	}
> +	v4l2_device_unregister(&dev->v4l2_device);
> +}
> +
> +int hws_video_quiesce(struct hws_pcie_dev *hws, const char *reason)
> +{
> +	int i, ret = 0;
> +	u64 start_ns = ktime_get_mono_fast_ns();
> +
> +	dev_dbg(&hws->pdev->dev, "video:%s:begin channels=%u\n", reason,
> +		hws->cur_max_video_ch);
> +	for (i = 0; i < hws->cur_max_video_ch; i++) {
> +		struct hws_video *vid = &hws->video[i];
> +		struct vb2_queue *q = &vid->buffer_queue;
> +		u64 ch_start_ns = ktime_get_mono_fast_ns();
> +		bool streaming;
> +
> +		if (!q || !q->ops) {
> +			dev_dbg(&hws->pdev->dev,
> +				"video:%s:ch=%d skipped queue-unavailable\n",
> +				reason, i);
> +			continue;
> +		}
> +
> +		streaming = vb2_is_streaming(q);
> +		hws_log_video_state(vid, reason, "channel");
> +		if (streaming) {
> +			/* Stop via vb2 (runs your .stop_streaming) */
> +			int r = vb2_streamoff(q, q->type);
> +
> +			dev_dbg(&hws->pdev->dev,
> +				"video:%s:ch=%d streamoff ret=%d (%lluus)\n",
> +				reason, i, r, (unsigned long long)
> +				((ktime_get_mono_fast_ns() - ch_start_ns) / 1000));
> +			if (r && !ret)
> +				ret = r;
> +		} else {
> +			dev_dbg(&hws->pdev->dev,
> +				"video:%s:ch=%d idle (%lluus)\n",
> +				reason, i, (unsigned long long)
> +				((ktime_get_mono_fast_ns() - ch_start_ns) / 1000));
> +		}
> +	}
> +	dev_dbg(&hws->pdev->dev, "video:%s:done ret=%d (%lluus)\n", reason,
> +		ret,
> +		(unsigned long long)((ktime_get_mono_fast_ns() - start_ns) / 1000));
> +	return ret;
> +}
> +
> +void hws_video_pm_resume(struct hws_pcie_dev *hws)
> +{
> +	/* Nothing mandatory to do here for vb2 — userspace will STREAMON again.
> +	 * If you track per-channel 'auto-restart' policy, re-arm it here.
> +	 */
> +}
> diff --git a/drivers/media/pci/hws/hws_video.h b/drivers/media/pci/hws/hws_video.h
> new file mode 100644
> index 000000000000..d02cfb2cdeb3
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_video.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef HWS_VIDEO_H
> +#define HWS_VIDEO_H
> +
> +struct hws_video;
> +
> +int hws_video_register(struct hws_pcie_dev *dev);
> +void hws_video_unregister(struct hws_pcie_dev *dev);
> +void hws_enable_video_capture(struct hws_pcie_dev *hws,
> +			      unsigned int chan,
> +			      bool on);
> +void hws_prime_next_locked(struct hws_video *vid);
> +
> +int hws_video_init_channel(struct hws_pcie_dev *pdev, int ch);
> +void hws_video_cleanup_channel(struct hws_pcie_dev *pdev, int ch);
> +void check_video_format(struct hws_pcie_dev *pdx);
> +int hws_check_card_status(struct hws_pcie_dev *hws);
> +void hws_init_video_sys(struct hws_pcie_dev *hws, bool enable);
> +
> +void hws_program_dma_for_addr(struct hws_pcie_dev *hws,
> +			      unsigned int ch,
> +			      dma_addr_t dma);
> +void hws_set_dma_doorbell(struct hws_pcie_dev *hws, unsigned int ch,
> +			  dma_addr_t dma, const char *tag);
> +
> +int hws_video_quiesce(struct hws_pcie_dev *hws, const char *reason);
> +void hws_video_pm_resume(struct hws_pcie_dev *hws);
> +
> +#endif // HWS_VIDEO_H

Regards,

	Hans

