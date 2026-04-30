Return-Path: <linux-media+bounces-60097-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK27EClZ82lfzwEAu9opvQ
	(envelope-from <linux-media+bounces-60097-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 15:29:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A334A3714
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 15:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4B5A304F22F
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 13:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6196B42669E;
	Thu, 30 Apr 2026 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHM0XmCE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987FF423A9D
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555637; cv=pass; b=RWU8kiHsT/XfBc872b8grp+EhVHadA/2Qy3iCQdnepXniBRBLVQ5L2CeQbSdC1gv6N0+Q7b9E0VoeMmi6i9hvOPrq8PwrHeXLQS6BCqTN7+/ZpB450Pow3C0DvqFD1xeh0o4f3r/VEW9kPo2/jsWOMLGhmjqWOM+azqWOngkmvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555637; c=relaxed/simple;
	bh=4rfq1h9uMskhjIH6JVolKK/xNL9T9yodm7UVm2yonwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e70b1K8aVkWCqDHhCiBIyG/ST3oM659On0Q+H3C1JJLa5CtYbcm8+zp1qyjs4G6CsnU+fKZBd4eVZpSWgwD3RRcKTzM580brNDURXhDiYjzBY63owOClP6I0I+kWvwoDjwu9ctLJUcyaJ3lFXrB/Y2/Xb3XOuXfscOGTzvsUoIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHM0XmCE; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c637089ccso1618842c88.1
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 06:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777555631; cv=none;
        d=google.com; s=arc-20240605;
        b=gDr8h4F0Wk2ipwOGS5qA6aysIZHKX+74RtCmi1KJUnq8szIH+IsCnTgWA4Mxi+1SPL
         X2CbUkDrxDbv3m1gT7bKjND0fXw/EXkZdThVJw5tBL9u6LaSFUfg5ziwKkRKqOwPhtsS
         eVjHMiaWZQnmUwwbROYqNXGIcQnOAIfAANXtnQrv3tDur/ZNGnBuv0FlItIwKbvEg8mc
         hW46HJpGGV+hXAzxo0Mh85ESGK/ZOMZcF5sYm4LqXdHYMHKkQD05NfaW+LOlMQJAM/pq
         XLCKW7sxVIwYFhvEGDui3U4ew6DYWZijcl3ZZEQqEZD2NYyvsELoh7W78bS+OEE49Fwd
         Jq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dbxfY2CTsWQ13H6bQ7SgHp4Psys5F1f+nfrQhjLQpN8=;
        fh=KyMVhmxHyOctCInlzK5ud7bvADlyX4D6QL/EnaM0c1M=;
        b=IMc6WdTEvAcfs2AxTwKwgUqZ2QV+MASWtFtP7bglyJ5NEfqWk/Nyrm2IERR2svXkLv
         +CaZRetjeNdjRRFe4BkLWDUHhhap8yNxKNDeJTfXzvouwCf6I6tnEtE24Yh4DiyfHLM9
         1+v08JC1TghiXPpyL9Ad18agehL6Zuy6+Tv62t7NRgEcCJ8tioVP2IJFdFBk7BPLnLyY
         rx14J2qK2Ouzt6ALi9UL0Kxiti4cfBSX/NpU7Fg7/7ip7omMgnJStRAia5teXmvXS3VX
         kB1EcD2hZUWbALbBupguOcdcajQwHorC94lwb2kvQ/ATnFlBODFWddbyhe+MoguAucsQ
         uFbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777555631; x=1778160431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbxfY2CTsWQ13H6bQ7SgHp4Psys5F1f+nfrQhjLQpN8=;
        b=VHM0XmCEXdFY561/eHF2cw1aluROdS7VfsYRKNrLZS4mxx+9WAAS6965qBoMttXZ8n
         2nKMjyusyziUt12vwnrG/j8++eM//AVC/5myo5x4UDMau8PfZ9TsbsEeXHzFxH15Pa1z
         r37ZTi5L2syL9h73aJ6cSQTb929z2NsEtpGif5EC6LvyUvp8k+/ecQeFR54hI1hgXx58
         zz2eEeVjqHGIPJiJNHm8HPea6jD+mcjY8WAUkGJDXrDuxUbKGc497Vus/Yv+RBzsHe63
         uH+SWqqX4zsJP6mY7JeY4HaL8q32Lq2YpbAf4iH+m+WZGYMylk9AjIfyZLFi2LXDFABL
         H7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555631; x=1778160431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dbxfY2CTsWQ13H6bQ7SgHp4Psys5F1f+nfrQhjLQpN8=;
        b=MK592yh6nNk2uhhUnhh9Hhi2IYCPLEP8nRRIwuRXqYbUGcmDPgH5KnLd8N8WMS/vwN
         05Sct6GEXxmD7jz/6mnCm4SzvxE2NBWba2bN8r6VdDImz66wQp2sisKUT2HAHyxV3zFI
         q09+qdx6ygMBI8gWq+Q/8qIIiNgeDYpM3S0GAN+fa8UFJCh2cMI5TZT1Gq5tYOi6DF3V
         H/R503QHoGbyULYTGqx5KHnT8VS74TOHKsl5mHByQke2hKlFpyFAJUZH5EdOJHhu50K/
         Mx6Y2JwGBG/cRfaTTT4B7fKMRonRJlYgyDvwlNoDOBXKgxHycM7C/B6uoiZ4zRp5m1kg
         Ag+g==
X-Gm-Message-State: AOJu0YzVxe541mIL+NPBTzoGI/wGb9/S+bQZEZx87BfmMoPghgNdX9fV
	XHmXiFmC5vmeui4TSiK+K30NblAkWh4Vfg4D8wUOPUb0lPREDapNxd7nmSR8ALrlYTQOaBnrEsF
	lC29v9XFu8GqJyiupZpzPkd++A+nwZknHT/sb
X-Gm-Gg: AeBDiet8Z/X2/B5ZeZw+r/4uqwsuvVTmi+hvoyQZ0MugCa6ZmJrZyVm+CM0cz4+SD2T
	ltvnaubqXOkyU3IPZLCkZAzJMJGtrZ/g0+iD/xmb2xFEZh9GfxJUDjJd95/MDrfiAFDizX8n5un
	S5l6UwcD1s9wWswihFX/rVQUYTdg86bQUVjypa3C3BH33qwXszpXTvmw4+nrT+I/1LHtwpW++lr
	rwLPMVOSvUCBGxZRazi+4/VvHFONTrB0XActcPVlKlFgay0pLo5jL1i2s0wpegG6dA9Usem/2py
	vQTs3OVIfHCMQdU6
X-Received: by 2002:a05:7022:68a9:b0:128:dbbf:fd35 with SMTP id
 a92af1059eb24-12deacc8a65mr1400443c88.28.1777555629415; Thu, 30 Apr 2026
 06:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330233636.381969-1-hoff.benjamin.k@gmail.com> <20260403135709.46163-1-hoff.benjamin.k@gmail.com>
In-Reply-To: <20260403135709.46163-1-hoff.benjamin.k@gmail.com>
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Thu, 30 Apr 2026 09:26:57 -0400
X-Gm-Features: AVHnY4LNPvQ0aQYEarzUplCdQKCjO0NEjXjdgogP4w-UhjEEmR1tDQW5jjVwG3g
Message-ID: <CAMSzxxTxSEk7USB4vDqQ5wdtXS8TXvrdhJ4hbpj0z+mi_0maHg@mail.gmail.com>
Subject: Re: [PATCH v5] media: pci: add AVMatrix HWS capture driver
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org, 
	hverkuil+cisco@kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E4A334A3714
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60097-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,roeck-us.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,avmatrix.com:email,mail.gmail.com:mid]

Just wanted to follow up on this patch:
[PATCH v5] media: pci: add AVMatrix HWS capture driver

I haven=E2=80=99t seen feedback yet=E2=80=94just checking if there are any
concerns or if I should prepare a v6.

Happy to address review comments or rebase if needed.

Thanks!
Ben

On Fri, Apr 3, 2026 at 9:57=E2=80=AFAM <hoff.benjamin.k@gmail.com> wrote:
>
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
> - clean the imported sources for checkpatch and W=3D1 builds
>
> Validation:
> - build-tested with W=3D1 against a local kernel build tree
> - compiled the driver with ARCH=3Di386 allmodconfig and verified the
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
> Closes: https://lore.kernel.org/oe-kbuild-all/202604020522.z22eZuW8-lkp@i=
ntel.com/
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
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3fe46d7c4bc..2c5511d740f2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7471,6 +7471,12 @@ S:       Maintained
>  F:     Documentation/admin-guide/media/mgb4.rst
>  F:     drivers/media/pci/mgb4/
>
> +AVMATRIX HWS DRIVER
> +M:     Ben Hoff <hoff.benjamin.k@gmail.com>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +F:     drivers/media/pci/hws/
> +
>  DIOLAN U2C-12 I2C DRIVER
>  M:     Guenter Roeck <linux@roeck-us.net>
>  L:     linux-i2c@vger.kernel.org
> diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
> index eebb16c58f3d..bfdb200f85a3 100644
> --- a/drivers/media/pci/Kconfig
> +++ b/drivers/media/pci/Kconfig
> @@ -13,6 +13,7 @@ if MEDIA_PCI_SUPPORT
>  if MEDIA_CAMERA_SUPPORT
>         comment "Media capture support"
>
> +source "drivers/media/pci/hws/Kconfig"
>  source "drivers/media/pci/mgb4/Kconfig"
>  source "drivers/media/pci/solo6x10/Kconfig"
>  source "drivers/media/pci/tw5864/Kconfig"
> diff --git a/drivers/media/pci/Makefile b/drivers/media/pci/Makefile
> index 02763ad88511..c4508b6723a9 100644
> --- a/drivers/media/pci/Makefile
> +++ b/drivers/media/pci/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_VIDEO_CX23885) +=3D cx23885/
>  obj-$(CONFIG_VIDEO_CX25821) +=3D cx25821/
>  obj-$(CONFIG_VIDEO_CX88) +=3D cx88/
>  obj-$(CONFIG_VIDEO_DT3155) +=3D dt3155/
> +obj-$(CONFIG_VIDEO_HWS) +=3D hws/
>  obj-$(CONFIG_VIDEO_IVTV) +=3D ivtv/
>  obj-$(CONFIG_VIDEO_MGB4) +=3D mgb4/
>  obj-$(CONFIG_VIDEO_SAA7134) +=3D saa7134/
> diff --git a/drivers/media/pci/hws/Kconfig b/drivers/media/pci/hws/Kconfi=
g
> new file mode 100644
> index 000000000000..b606d5ffadef
> --- /dev/null
> +++ b/drivers/media/pci/hws/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_HWS
> +       tristate "AVMatrix HWS capture driver"
> +       depends on VIDEO_DEV && PCI
> +       select VIDEOBUF2_DMA_CONTIG
> +       help
> +         This is a Video4Linux2 driver for AVMatrix HWS PCIe capture car=
ds.
> +         It provides a PCIe capture interface with V4L2 streaming, DV ti=
mings,
> +         and per-input controls for the supported HWS boards.
> +
> +         To compile this driver as a module, choose M here: the module w=
ill
> +         be called hws.
> diff --git a/drivers/media/pci/hws/Makefile b/drivers/media/pci/hws/Makef=
ile
> new file mode 100644
> index 000000000000..a66aebd348e5
> --- /dev/null
> +++ b/drivers/media/pci/hws/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +hws-objs :=3D hws_pci.o hws_irq.o hws_video.o hws_v4l2_ioctl.o
> +
> +obj-$(CONFIG_VIDEO_HWS) +=3D hws.o
> diff --git a/drivers/media/pci/hws/hws.h b/drivers/media/pci/hws/hws.h
> new file mode 100644
> index 000000000000..ebc8cc0daf36
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws.h
> @@ -0,0 +1,174 @@
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
> +#include <linux/spinlock.h>
> +#include <linux/sizes.h>
> +#include <linux/atomic.h>
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-dv-timings.h>
> +#include <media/videobuf2-dma-sg.h>
> +
> +#include "hws_reg.h"
> +
> +struct hwsmem_param {
> +       u32 index;
> +       u32 type;
> +       u32 status;
> +};
> +
> +struct hws_pix_state {
> +       u32 width;
> +       u32 height;
> +       u32 fourcc;             /* V4L2_PIX_FMT_* (YUYV only here) */
> +       u32 bytesperline;       /* stride */
> +       u32 sizeimage;          /* full frame */
> +       enum v4l2_field field;  /* V4L2_FIELD_NONE or INTERLACED */
> +       enum v4l2_colorspace colorspace;        /* e.g., REC709 */
> +       enum v4l2_ycbcr_encoding ycbcr_enc;     /* V4L2_YCBCR_ENC_DEFAULT=
 */
> +       enum v4l2_quantization quantization;    /* V4L2_QUANTIZATION_LIM_=
RANGE */
> +       enum v4l2_xfer_func xfer_func;  /* V4L2_XFER_FUNC_DEFAULT */
> +       bool interlaced;        /* cached hardware state */
> +       u32 half_size;          /* optional: if your HW needs it */
> +};
> +
> +#define        UNSET   (-1U)
> +
> +struct hws_pcie_dev;
> +struct hws_adapter;
> +struct hws_video;
> +
> +struct hwsvideo_buffer {
> +       struct vb2_v4l2_buffer vb;
> +       struct list_head list;
> +       int slot;               /* for two-buffer approach */
> +};
> +
> +struct hws_video {
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 linkage =E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       struct hws_pcie_dev *parent;    /* parent device */
> +       struct video_device *video_device;
> +
> +       struct vb2_queue buffer_queue;
> +       struct list_head capture_queue;
> +       struct hwsvideo_buffer *active;
> +       struct hwsvideo_buffer *next_prepared;
> +
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 locking =E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       struct mutex state_lock;        /* primary state */
> +       spinlock_t irq_lock;    /* ISR-side */
> +
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 indices =E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       int channel_index;
> +
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 colour controls =
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       int current_brightness;
> +       int current_contrast;
> +       int current_saturation;
> +       int current_hue;
> +
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 V4L2 controls =
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       struct v4l2_ctrl_handler control_handler;
> +       struct v4l2_ctrl *ctrl_brightness;
> +       struct v4l2_ctrl *ctrl_contrast;
> +       struct v4l2_ctrl *ctrl_saturation;
> +       struct v4l2_ctrl *ctrl_hue;
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 capture queue st=
atus =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       struct hws_pix_state pix;
> +       struct v4l2_dv_timings cur_dv_timings; /* last configured/notifie=
d DV timings */
> +       u32 current_fps; /* Hz, updated by mode changes, not by read-only=
 queries */
> +       u32 alloc_sizeimage;
> +
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 per-channel capt=
ure state =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       bool cap_active;
> +       bool stop_requested;
> +       u8 last_buf_half_toggle;
> +       bool half_seen;
> +       atomic_t sequence_number;
> +       u32 queued_count;
> +
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 timeout and erro=
r handling =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       u32 timeout_count;
> +       u32 error_count;
> +
> +       bool window_valid;
> +       u32 last_dma_hi;
> +       u32 last_dma_page;
> +       u32 last_pci_addr;
> +       u32 last_half16;
> +
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 misc counters =
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       int signal_loss_cnt;
> +};
> +
> +static inline void hws_set_current_dv_timings(struct hws_video *vid,
> +                                             u32 width, u32 height,
> +                                             bool interlaced)
> +{
> +       if (!vid)
> +               return;
> +
> +       vid->cur_dv_timings =3D (struct v4l2_dv_timings) {
> +               .type =3D V4L2_DV_BT_656_1120,
> +               .bt =3D {
> +                       .width =3D width,
> +                       .height =3D height,
> +                       .interlaced =3D interlaced,
> +               },
> +       };
> +}
> +
> +struct hws_scratch_dma {
> +       void *cpu;
> +       dma_addr_t dma;
> +       size_t size;
> +};
> +
> +struct hws_pcie_dev {
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 core objects =E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       struct pci_dev *pdev;
> +       struct hws_video video[MAX_VID_CHANNELS];
> +
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 BAR & workqueues=
 =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       void __iomem *bar0_base;
> +
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 device identity =
/ capabilities =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       u16 vendor_id;
> +       u16 device_id;
> +       u16 device_ver;
> +       u16 hw_ver;
> +       u32 sub_ver;
> +       u32 port_id;
> +       // TriState, used in `set_video_format_size`
> +       u32 support_yv12;
> +       u32 max_hw_video_buf_sz;
> +       u8 max_channels;
> +       u8 cur_max_video_ch;
> +       bool start_run;
> +
> +       bool buf_allocated;
> +
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 V4L2 framework o=
bjects =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       struct v4l2_device v4l2_device;
> +
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 kernel thread =
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       struct task_struct *main_task;
> +       struct hws_scratch_dma scratch_vid[MAX_VID_CHANNELS];
> +
> +       bool suspended;
> +       int irq;
> +
> +       /* =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 error flags =E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 */
> +       int pci_lost;
> +
> +};
> +
> +#endif
> diff --git a/drivers/media/pci/hws/hws_irq.c b/drivers/media/pci/hws/hws_=
irq.c
> new file mode 100644
> index 000000000000..0747dfb7ab97
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
> +                "Read toggle registers in IRQ handler for debug logging"=
);
> +
> +static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
> +{
> +       struct hws_video *v =3D &hws->video[ch];
> +       unsigned long flags;
> +       struct hwsvideo_buffer *buf;
> +
> +       dev_dbg(&hws->pdev->dev,
> +               "arm_next(ch=3D%u): stop=3D%d cap=3D%d queued=3D%d\n",
> +               ch, READ_ONCE(v->stop_requested), READ_ONCE(v->cap_active=
),
> +               !list_empty(&v->capture_queue));
> +
> +       if (READ_ONCE(hws->suspended)) {
> +               dev_dbg(&hws->pdev->dev, "arm_next(ch=3D%u): suspended\n"=
, ch);
> +               return -EBUSY;
> +       }
> +
> +       if (READ_ONCE(v->stop_requested) || !READ_ONCE(v->cap_active)) {
> +               dev_dbg(&hws->pdev->dev,
> +                       "arm_next(ch=3D%u): stop=3D%d cap=3D%d -> cancel\=
n", ch,
> +                       v->stop_requested, v->cap_active);
> +               return -ECANCELED;
> +       }
> +
> +       spin_lock_irqsave(&v->irq_lock, flags);
> +       if (list_empty(&v->capture_queue)) {
> +               spin_unlock_irqrestore(&v->irq_lock, flags);
> +               dev_dbg(&hws->pdev->dev, "arm_next(ch=3D%u): queue empty\=
n", ch);
> +               return -EAGAIN;
> +       }
> +
> +       buf =3D list_first_entry(&v->capture_queue, struct hwsvideo_buffe=
r, list);
> +       list_del_init(&buf->list);      /* keep buffer safe for later cle=
anup */
> +       if (v->queued_count)
> +               v->queued_count--;
> +       v->active =3D buf;
> +       spin_unlock_irqrestore(&v->irq_lock, flags);
> +       dev_dbg(&hws->pdev->dev, "arm_next(ch=3D%u): picked buffer %p\n",=
 ch,
> +               buf);
> +
> +       /* Publish descriptor(s) before doorbell/MMIO kicks. */
> +       wmb();
> +
> +       /* Avoid MMIO during suspend */
> +       if (READ_ONCE(hws->suspended)) {
> +               unsigned long f;
> +
> +               dev_dbg(&hws->pdev->dev,
> +                       "arm_next(ch=3D%u): suspended after pick\n", ch);
> +               spin_lock_irqsave(&v->irq_lock, f);
> +               if (v->active) {
> +                       list_add(&buf->list, &v->capture_queue);
> +                       v->queued_count++;
> +                       v->active =3D NULL;
> +               }
> +               spin_unlock_irqrestore(&v->irq_lock, f);
> +               return -EBUSY;
> +       }
> +
> +       /* Also program the DMA address register directly */
> +       {
> +               dma_addr_t dma_addr =3D
> +                   vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> +               hws_program_dma_for_addr(hws, ch, dma_addr);
> +               iowrite32(lower_32_bits(dma_addr),
> +                         hws->bar0_base + HWS_REG_DMA_ADDR(ch));
> +       }
> +
> +       dev_dbg(&hws->pdev->dev, "arm_next(ch=3D%u): programmed buffer %p=
\n", ch,
> +               buf);
> +       spin_lock_irqsave(&v->irq_lock, flags);
> +       hws_prime_next_locked(v);
> +       spin_unlock_irqrestore(&v->irq_lock, flags);
> +       return 0;
> +}
> +
> +static void hws_video_handle_vdone(struct hws_video *v)
> +{
> +       struct hws_pcie_dev *hws =3D v->parent;
> +       unsigned int ch =3D v->channel_index;
> +       struct hwsvideo_buffer *done;
> +       unsigned long flags;
> +       bool promoted =3D false;
> +
> +       dev_dbg(&hws->pdev->dev,
> +               "bh_video(ch=3D%u): stop=3D%d cap=3D%d active=3D%p\n",
> +               ch, READ_ONCE(v->stop_requested), READ_ONCE(v->cap_active=
),
> +               v->active);
> +
> +       int ret;
> +
> +       dev_dbg(&hws->pdev->dev,
> +               "bh_video(ch=3D%u): entry stop=3D%d cap=3D%d\n", ch,
> +               v->stop_requested, v->cap_active);
> +       if (READ_ONCE(hws->suspended))
> +               return;
> +
> +       if (READ_ONCE(v->stop_requested) || !READ_ONCE(v->cap_active))
> +               return;
> +
> +       spin_lock_irqsave(&v->irq_lock, flags);
> +       done =3D v->active;
> +       if (done && v->next_prepared) {
> +               v->active =3D v->next_prepared;
> +               v->next_prepared =3D NULL;
> +               promoted =3D true;
> +       }
> +       spin_unlock_irqrestore(&v->irq_lock, flags);
> +
> +       /* 1) Complete the buffer the HW just finished (if any) */
> +       if (done) {
> +               struct vb2_v4l2_buffer *vb2v =3D &done->vb;
> +               size_t expected =3D v->pix.sizeimage;
> +               size_t plane_size =3D vb2_plane_size(&vb2v->vb2_buf, 0);
> +
> +               if (expected > plane_size) {
> +                       dev_warn_ratelimited(&hws->pdev->dev,
> +                                            "bh_video(ch=3D%u): sizeimag=
e %zu > plane %zu, dropping seq=3D%u\n",
> +                                            ch, expected, plane_size,
> +                                            (u32)atomic_read(&v->sequenc=
e_number) + 1);
> +                       vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_ERR=
OR);
> +                       goto arm_next;
> +               }
> +               vb2_set_plane_payload(&vb2v->vb2_buf, 0, expected);
> +
> +               dma_rmb();      /* device writes visible before userspace=
 sees it */
> +
> +               vb2v->sequence =3D (u32)atomic_inc_return(&v->sequence_nu=
mber);
> +               vb2v->vb2_buf.timestamp =3D ktime_get_ns();
> +               dev_dbg(&hws->pdev->dev,
> +                       "bh_video(ch=3D%u): DONE buf=3D%p seq=3D%u half_s=
een=3D%d toggle=3D%u\n",
> +                       ch, done, vb2v->sequence, v->half_seen,
> +                       v->last_buf_half_toggle);
> +
> +               if (!promoted)
> +                       v->active =3D NULL;       /* channel no longer ow=
ns this buffer */
> +               vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
> +       }
> +
> +       if (READ_ONCE(hws->suspended))
> +               return;
> +
> +       if (promoted) {
> +               dev_dbg(&hws->pdev->dev,
> +                       "bh_video(ch=3D%u): promoted pre-armed buffer act=
ive=3D%p\n",
> +                       ch, v->active);
> +               spin_lock_irqsave(&v->irq_lock, flags);
> +               hws_prime_next_locked(v);
> +               spin_unlock_irqrestore(&v->irq_lock, flags);
> +               return;
> +       }
> +
> +arm_next:
> +       /* 2) Immediately arm the next queued buffer (if present) */
> +       ret =3D hws_arm_next(hws, ch);
> +       if (ret =3D=3D -EAGAIN) {
> +               dev_dbg(&hws->pdev->dev,
> +                       "bh_video(ch=3D%u): no queued buffer to arm\n", c=
h);
> +               return;
> +       }
> +       dev_dbg(&hws->pdev->dev,
> +               "bh_video(ch=3D%u): armed next buffer, active=3D%p\n", ch=
,
> +               v->active);
> +       /* On success the engine now points at v->active=E2=80=99s DMA ad=
dress */
> +}
> +
> +irqreturn_t hws_irq_handler(int irq, void *info)
> +{
> +       struct hws_pcie_dev *pdx =3D info;
> +       u32 int_state;
> +
> +       dev_dbg(&pdx->pdev->dev, "irq: entry\n");
> +       if (pdx->bar0_base) {
> +               dev_dbg(&pdx->pdev->dev,
> +                       "irq: INT_EN=3D0x%08x INT_STATUS=3D0x%08x\n",
> +                       readl(pdx->bar0_base + INT_EN_REG_BASE),
> +                       readl(pdx->bar0_base + HWS_REG_INT_STATUS));
> +       }
> +
> +       /* Fast path: if suspended, quietly ack and exit */
> +       if (READ_ONCE(pdx->suspended)) {
> +               int_state =3D readl_relaxed(pdx->bar0_base + HWS_REG_INT_=
STATUS);
> +               if (int_state) {
> +                       writel(int_state, pdx->bar0_base + HWS_REG_INT_ST=
ATUS);
> +                       (void)readl_relaxed(pdx->bar0_base + HWS_REG_INT_=
STATUS);
> +               }
> +               return int_state ? IRQ_HANDLED : IRQ_NONE;
> +       }
> +       // u32 sys_status =3D readl(pdx->bar0_base + HWS_REG_SYS_STATUS);
> +
> +       int_state =3D readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
> +       if (!int_state || int_state =3D=3D 0xFFFFFFFF) {
> +               dev_dbg(&pdx->pdev->dev,
> +                       "irq: spurious or device-gone int_state=3D0x%08x\=
n",
> +                       int_state);
> +               return IRQ_NONE;
> +       }
> +       dev_dbg(&pdx->pdev->dev, "irq: entry INT_STATUS=3D0x%08x\n", int_=
state);
> +
> +       /* Loop until all pending bits are serviced (max 100 iterations) =
*/
> +       for (u32 cnt =3D 0; int_state && cnt < MAX_INT_LOOPS; ++cnt) {
> +               for (unsigned int ch =3D 0; ch < pdx->cur_max_video_ch; +=
+ch) {
> +                       u32 vbit =3D HWS_INT_VDONE_BIT(ch);
> +
> +                       if (!(int_state & vbit))
> +                               continue;
> +
> +                       if (READ_ONCE(pdx->video[ch].cap_active) &&
> +                           !READ_ONCE(pdx->video[ch].stop_requested)) {
> +                               if (hws_toggle_debug) {
> +                                       u32 toggle =3D
> +                                           readl_relaxed(pdx->bar0_base =
+
> +                                                 HWS_REG_VBUF_TOGGLE(ch)=
) & 0x01;
> +                                       WRITE_ONCE(pdx->video[ch].last_bu=
f_half_toggle,
> +                                                  toggle);
> +                               }
> +                               dma_rmb();
> +                               WRITE_ONCE(pdx->video[ch].half_seen, true=
);
> +                               dev_dbg(&pdx->pdev->dev,
> +                                       "irq: VDONE ch=3D%u toggle=3D%u h=
andling inline (cap=3D%d)\n",
> +                                       ch,
> +                                       READ_ONCE(pdx->video[ch].last_buf=
_half_toggle),
> +                                       READ_ONCE(pdx->video[ch].cap_acti=
ve));
> +                               hws_video_handle_vdone(&pdx->video[ch]);
> +                       } else {
> +                               dev_dbg(&pdx->pdev->dev,
> +                                       "irq: VDONE ch=3D%u ignored (cap=
=3D%d stop=3D%d)\n",
> +                                       ch,
> +                                       READ_ONCE(pdx->video[ch].cap_acti=
ve),
> +                                       READ_ONCE(pdx->video[ch].stop_req=
uested));
> +                       }
> +
> +                       writel(vbit, pdx->bar0_base + HWS_REG_INT_STATUS)=
;
> +                       (void)readl_relaxed(pdx->bar0_base + HWS_REG_INT_=
STATUS);
> +               }
> +
> +               /* Re=E2=80=90read in case new interrupt bits popped whil=
e processing */
> +               int_state =3D readl_relaxed(pdx->bar0_base + HWS_REG_INT_=
STATUS);
> +               dev_dbg(&pdx->pdev->dev,
> +                       "irq: loop cnt=3D%u new INT_STATUS=3D0x%08x\n", c=
nt,
> +                       int_state);
> +               if (cnt + 1 =3D=3D MAX_INT_LOOPS)
> +                       dev_warn_ratelimited(&pdx->pdev->dev,
> +                                            "IRQ storm? status=3D0x%08x\=
n",
> +                                            int_state);
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> diff --git a/drivers/media/pci/hws/hws_irq.h b/drivers/media/pci/hws/hws_=
irq.h
> new file mode 100644
> index 000000000000..a42867aa0c46
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_irq.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef HWS_INTERRUPT_H
> +#define HWS_INTERRUPT_H
> +
> +#include <linux/pci.h>
> +#include "hws.h"
> +
> +irqreturn_t hws_irq_handler(int irq, void *info);
> +
> +#endif /* HWS_INTERRUPT_H */
> diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_=
pci.c
> new file mode 100644
> index 000000000000..e4e8e682f8a5
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_pci.c
> @@ -0,0 +1,865 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/pci.h>
> +#include <linux/types.h>
> +#include <linux/iopoll.h>
> +#include <linux/bitfield.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/kthread.h>
> +#include <linux/interrupt.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/ktime.h>
> +#include <linux/math64.h>
> +#include <linux/pm.h>
> +#include <linux/freezer.h>
> +#include <linux/pci_regs.h>
> +
> +#include <media/v4l2-ctrls.h>
> +
> +#include "hws.h"
> +#include "hws_reg.h"
> +#include "hws_video.h"
> +#include "hws_irq.h"
> +#include "hws_v4l2_ioctl.h"
> +
> +#define DRV_NAME "hws"
> +#define HWS_BUSY_POLL_DELAY_US 10
> +#define HWS_BUSY_POLL_TIMEOUT_US 1000000
> +
> +static unsigned long long hws_elapsed_us(u64 start_ns)
> +{
> +       return div_u64(ktime_get_mono_fast_ns() - start_ns, 1000);
> +}
> +
> +/* register layout inside HWS_REG_DEVICE_INFO */
> +#define DEVINFO_VER GENMASK(7, 0)
> +#define DEVINFO_SUBVER GENMASK(15, 8)
> +#define DEVINFO_YV12 GENMASK(31, 28)
> +#define DEVINFO_HWKEY GENMASK(27, 24)
> +#define DEVINFO_PORTID GENMASK(25, 24) /* low 2 bits of HW-key */
> +
> +#define MAKE_ENTRY(__vend, __chip, __subven, __subdev, __configptr) \
> +       { .vendor =3D (__vend),                                       \
> +         .device =3D (__chip),                                       \
> +         .subvendor =3D (__subven),                                  \
> +         .subdevice =3D (__subdev),                                  \
> +         .driver_data =3D (unsigned long)(__configptr) }
> +
> +/*
> + * PCI IDs for HWS family cards.
> + *
> + * The subsystem IDs are fixed at 0x8888:0x0007 for this family. Some bo=
ards
> + * enumerate with vendor ID 0x8888 or 0x1f33. Exact SKU names are not fu=
lly
> + * pinned down yet; update these comments when vendor documentation or I=
NF
> + * strings are available.
> + */
> +static const struct pci_device_id hws_pci_table[] =3D {
> +       /* HWS family, SKU unknown. */
> +       MAKE_ENTRY(0x8888, 0x9534, 0x8888, 0x0007, NULL),
> +       MAKE_ENTRY(0x1F33, 0x8534, 0x8888, 0x0007, NULL),
> +       MAKE_ENTRY(0x1F33, 0x8554, 0x8888, 0x0007, NULL),
> +
> +       /* HWS 2x2 HDMI family. */
> +       MAKE_ENTRY(0x8888, 0x8524, 0x8888, 0x0007, NULL),
> +       /* HWS 2x2 SDI family. */
> +       MAKE_ENTRY(0x1F33, 0x6524, 0x8888, 0x0007, NULL),
> +
> +       /* HWS X4 HDMI family. */
> +       MAKE_ENTRY(0x8888, 0x8504, 0x8888, 0x0007, NULL),
> +       /* HWS X4 SDI family. */
> +       MAKE_ENTRY(0x8888, 0x6504, 0x8888, 0x0007, NULL),
> +
> +       /* HWS family, SKU unknown. */
> +       MAKE_ENTRY(0x8888, 0x8532, 0x8888, 0x0007, NULL),
> +       MAKE_ENTRY(0x8888, 0x8512, 0x8888, 0x0007, NULL),
> +       MAKE_ENTRY(0x8888, 0x8501, 0x8888, 0x0007, NULL),
> +       MAKE_ENTRY(0x1F33, 0x6502, 0x8888, 0x0007, NULL),
> +
> +       /* HWS X4 HDMI family (alternate vendor ID). */
> +       MAKE_ENTRY(0x1F33, 0x8504, 0x8888, 0x0007, NULL),
> +       /* HWS 2x2 HDMI family (alternate vendor ID). */
> +       MAKE_ENTRY(0x1F33, 0x8524, 0x8888, 0x0007, NULL),
> +
> +       {}
> +};
> +
> +static void enable_pcie_relaxed_ordering(struct pci_dev *dev)
> +{
> +       pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_RELA=
X_EN);
> +}
> +
> +static void hws_configure_hardware_capabilities(struct hws_pcie_dev *hde=
v)
> +{
> +       u16 id =3D hdev->device_id;
> +
> +       /* select per-chip channel counts */
> +       switch (id) {
> +       case 0x9534:
> +       case 0x6524:
> +       case 0x8524:
> +       case 0x8504:
> +       case 0x6504:
> +               hdev->cur_max_video_ch =3D 4;
> +               break;
> +       case 0x8532:
> +               hdev->cur_max_video_ch =3D 2;
> +               break;
> +       case 0x8512:
> +       case 0x6502:
> +               hdev->cur_max_video_ch =3D 2;
> +               break;
> +       case 0x8501:
> +               hdev->cur_max_video_ch =3D 1;
> +               break;
> +       default:
> +               hdev->cur_max_video_ch =3D 4;
> +               break;
> +       }
> +
> +       /* universal buffer capacity */
> +       hdev->max_hw_video_buf_sz =3D MAX_MM_VIDEO_SIZE;
> +
> +       /* decide hardware-version and program DMA max size if needed */
> +       if (hdev->device_ver > 121) {
> +               if (id =3D=3D 0x8501 && hdev->device_ver =3D=3D 122) {
> +                       hdev->hw_ver =3D 0;
> +               } else {
> +                       hdev->hw_ver =3D 1;
> +                       u32 dma_max =3D (u32)(MAX_VIDEO_SCALER_SIZE / 16)=
;
> +
> +                       writel(dma_max, hdev->bar0_base + HWS_REG_DMA_MAX=
_SIZE);
> +                       /* readback to flush posted MMIO write */
> +                       (void)readl(hdev->bar0_base + HWS_REG_DMA_MAX_SIZ=
E);
> +               }
> +       } else {
> +               hdev->hw_ver =3D 0;
> +       }
> +}
> +
> +static void hws_stop_device(struct hws_pcie_dev *hws);
> +
> +static void hws_log_lifecycle_snapshot(struct hws_pcie_dev *hws,
> +                                      const char *action,
> +                                      const char *phase)
> +{
> +       struct device *dev;
> +       u32 int_en, int_status, vcap, sys_status, dec_mode;
> +
> +       if (!hws || !hws->pdev)
> +               return;
> +
> +       dev =3D &hws->pdev->dev;
> +       if (!hws->bar0_base) {
> +               dev_dbg(dev,
> +                       "lifecycle:%s:%s bar0-unmapped suspended=3D%d sta=
rt_run=3D%d pci_lost=3D%d irq=3D%d\n",
> +                       action, phase, READ_ONCE(hws->suspended), hws->st=
art_run,
> +                       hws->pci_lost, hws->irq);
> +               return;
> +       }
> +
> +       int_en =3D readl(hws->bar0_base + INT_EN_REG_BASE);
> +       int_status =3D readl(hws->bar0_base + HWS_REG_INT_STATUS);
> +       vcap =3D readl(hws->bar0_base + HWS_REG_VCAP_ENABLE);
> +       sys_status =3D readl(hws->bar0_base + HWS_REG_SYS_STATUS);
> +       dec_mode =3D readl(hws->bar0_base + HWS_REG_DEC_MODE);
> +
> +       dev_dbg(dev,
> +               "lifecycle:%s:%s suspended=3D%d start_run=3D%d pci_lost=
=3D%d irq=3D%d INT_EN=3D0x%08x INT_STATUS=3D0x%08x VCAP=3D0x%08x SYS=3D0x%0=
8x DEC=3D0x%08x\n",
> +               action, phase, READ_ONCE(hws->suspended), hws->start_run,
> +               hws->pci_lost, hws->irq, int_en, int_status, vcap,
> +               sys_status, dec_mode);
> +}
> +
> +static int read_chip_id(struct hws_pcie_dev *hdev)
> +{
> +       u32 reg;
> +       /* mirror PCI IDs for later switches */
> +       hdev->device_id =3D hdev->pdev->device;
> +       hdev->vendor_id =3D hdev->pdev->vendor;
> +
> +       reg =3D readl(hdev->bar0_base + HWS_REG_DEVICE_INFO);
> +
> +       hdev->device_ver =3D FIELD_GET(DEVINFO_VER, reg);
> +       hdev->sub_ver =3D FIELD_GET(DEVINFO_SUBVER, reg);
> +       hdev->support_yv12 =3D FIELD_GET(DEVINFO_YV12, reg);
> +       hdev->port_id =3D FIELD_GET(DEVINFO_PORTID, reg);
> +
> +       hdev->max_hw_video_buf_sz =3D MAX_MM_VIDEO_SIZE;
> +       hdev->max_channels =3D 4;
> +       hdev->buf_allocated =3D false;
> +       hdev->main_task =3D NULL;
> +       hdev->start_run =3D false;
> +       hdev->pci_lost =3D 0;
> +
> +       writel(0x00, hdev->bar0_base + HWS_REG_DEC_MODE);
> +       writel(0x10, hdev->bar0_base + HWS_REG_DEC_MODE);
> +
> +       hws_configure_hardware_capabilities(hdev);
> +
> +       dev_info(&hdev->pdev->dev,
> +                "chip detected: ver=3D%u subver=3D%u port=3D%u yv12=3D%u=
\n",
> +                hdev->device_ver, hdev->sub_ver, hdev->port_id,
> +                hdev->support_yv12);
> +
> +       return 0;
> +}
> +
> +static int main_ks_thread_handle(void *data)
> +{
> +       struct hws_pcie_dev *pdx =3D data;
> +
> +       set_freezable();
> +
> +       while (!kthread_should_stop()) {
> +               /* If we=E2=80=99re suspending, don=E2=80=99t touch hardw=
are; just sleep/freeeze */
> +               if (READ_ONCE(pdx->suspended)) {
> +                       try_to_freeze();
> +                       schedule_timeout_interruptible(msecs_to_jiffies(1=
000));
> +                       continue;
> +               }
> +
> +               /* avoid MMIO when suspended (guarded above) */
> +               check_video_format(pdx);
> +
> +               try_to_freeze(); /* cooperate with freezer each loop */
> +
> +               /* Sleep 1s or until signaled to wake/stop */
> +               schedule_timeout_interruptible(msecs_to_jiffies(1000));
> +       }
> +
> +       dev_dbg(&pdx->pdev->dev, "%s: exiting\n", __func__);
> +       return 0;
> +}
> +
> +static void hws_stop_kthread_action(void *data)
> +{
> +       struct hws_pcie_dev *hws =3D data;
> +       struct task_struct *t;
> +       u64 start_ns;
> +
> +       if (!hws)
> +               return;
> +
> +       t =3D READ_ONCE(hws->main_task);
> +       if (!IS_ERR_OR_NULL(t)) {
> +               start_ns =3D ktime_get_mono_fast_ns();
> +               dev_dbg(&hws->pdev->dev,
> +                       "lifecycle:kthread-stop:begin task=3D%s[%d]\n",
> +                       t->comm, t->pid);
> +               WRITE_ONCE(hws->main_task, NULL);
> +               kthread_stop(t);
> +               dev_dbg(&hws->pdev->dev,
> +                       "lifecycle:kthread-stop:done (%lluus)\n",
> +                       hws_elapsed_us(start_ns));
> +       }
> +}
> +
> +static int hws_alloc_seed_buffers(struct hws_pcie_dev *hws)
> +{
> +       int ch;
> +       /* 64 KiB is plenty for a safe dummy; align to 64 for your HW */
> +       const size_t need =3D ALIGN(64 * 1024, 64);
> +
> +       for (ch =3D 0; ch < hws->cur_max_video_ch; ch++) {
> +#if defined(CONFIG_HAS_DMA) /* normal on PCIe platforms */
> +               void *cpu =3D dma_alloc_coherent(&hws->pdev->dev, need,
> +                                              &hws->scratch_vid[ch].dma,
> +                                              GFP_KERNEL);
> +#else
> +               void *cpu =3D NULL;
> +#endif
> +               if (!cpu) {
> +                       dev_warn(&hws->pdev->dev,
> +                                "scratch: dma_alloc_coherent failed ch=
=3D%d\n", ch);
> +                       /* not fatal: free earlier ones and continue with=
out seeding */
> +                       while (--ch >=3D 0) {
> +                               if (hws->scratch_vid[ch].cpu)
> +                                       dma_free_coherent(&hws->pdev->dev=
,
> +                                                         hws->scratch_vi=
d[ch].size,
> +                                                         hws->scratch_vi=
d[ch].cpu,
> +                                                         hws->scratch_vi=
d[ch].dma);
> +                               hws->scratch_vid[ch].cpu =3D NULL;
> +                               hws->scratch_vid[ch].size =3D 0;
> +                       }
> +                       return -ENOMEM;
> +               }
> +               hws->scratch_vid[ch].cpu  =3D cpu;
> +               hws->scratch_vid[ch].size =3D need;
> +       }
> +       return 0;
> +}
> +
> +static void hws_free_seed_buffers(struct hws_pcie_dev *hws)
> +{
> +       int ch;
> +
> +       for (ch =3D 0; ch < hws->cur_max_video_ch; ch++) {
> +               if (hws->scratch_vid[ch].cpu) {
> +                       dma_free_coherent(&hws->pdev->dev,
> +                                         hws->scratch_vid[ch].size,
> +                                         hws->scratch_vid[ch].cpu,
> +                                         hws->scratch_vid[ch].dma);
> +                       hws->scratch_vid[ch].cpu =3D NULL;
> +                       hws->scratch_vid[ch].size =3D 0;
> +               }
> +       }
> +}
> +
> +static void hws_seed_channel(struct hws_pcie_dev *hws, int ch)
> +{
> +       dma_addr_t paddr =3D hws->scratch_vid[ch].dma;
> +       u32 lo =3D lower_32_bits(paddr);
> +       u32 hi =3D upper_32_bits(paddr);
> +       u32 pci_addr =3D lo & PCI_E_BAR_ADD_LOWMASK;
> +
> +       lo &=3D PCI_E_BAR_ADD_MASK;
> +
> +       /* Program 64-bit BAR remap entry for this channel (table @ 0x208=
 + ch * 8) */
> +       writel_relaxed(hi, hws->bar0_base +
> +                           PCI_ADDR_TABLE_BASE + 0x208 + ch * 8);
> +       writel_relaxed(lo, hws->bar0_base +
> +                           PCI_ADDR_TABLE_BASE + 0x208 + ch * 8 +
> +                           PCIE_BARADDROFSIZE);
> +
> +       /* Program capture engine per-channel base/half */
> +       writel_relaxed((ch + 1) * PCIEBAR_AXI_BASE + pci_addr,
> +                      hws->bar0_base + CVBS_IN_BUF_BASE +
> +                      ch * PCIE_BARADDROFSIZE);
> +
> +       /* half size: use either the current format=E2=80=99s half or hal=
f of scratch */
> +       {
> +               u32 half =3D hws->video[ch].pix.half_size ?
> +                       hws->video[ch].pix.half_size :
> +                       (u32)(hws->scratch_vid[ch].size / 2);
> +
> +               writel_relaxed(half / 16,
> +                              hws->bar0_base + CVBS_IN_BUF_BASE2 +
> +                              ch * PCIE_BARADDROFSIZE);
> +       }
> +
> +       (void)readl(hws->bar0_base + HWS_REG_INT_STATUS); /* flush posted=
 writes */
> +}
> +
> +static void hws_seed_all_channels(struct hws_pcie_dev *hws)
> +{
> +       int ch;
> +
> +       for (ch =3D 0; ch < hws->cur_max_video_ch; ch++) {
> +               if (hws->scratch_vid[ch].cpu)
> +                       hws_seed_channel(hws, ch);
> +       }
> +}
> +
> +static void hws_irq_mask_gate(struct hws_pcie_dev *hws)
> +{
> +       writel(0x00000000, hws->bar0_base + INT_EN_REG_BASE);
> +       (void)readl(hws->bar0_base + INT_EN_REG_BASE);
> +}
> +
> +static void hws_irq_unmask_gate(struct hws_pcie_dev *hws)
> +{
> +       writel(HWS_INT_EN_MASK, hws->bar0_base + INT_EN_REG_BASE);
> +       (void)readl(hws->bar0_base + INT_EN_REG_BASE);
> +}
> +
> +static void hws_irq_clear_pending(struct hws_pcie_dev *hws)
> +{
> +       u32 st =3D readl(hws->bar0_base + HWS_REG_INT_STATUS);
> +
> +       if (st) {
> +               writel(st, hws->bar0_base + HWS_REG_INT_STATUS); /* W1C *=
/
> +               (void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
> +       }
> +}
> +
> +static void hws_block_hotpaths(struct hws_pcie_dev *hws)
> +{
> +       WRITE_ONCE(hws->suspended, true);
> +       if (hws->irq >=3D 0)
> +               disable_irq(hws->irq);
> +
> +       if (!hws->bar0_base)
> +               return;
> +
> +       hws_irq_mask_gate(hws);
> +       hws_irq_clear_pending(hws);
> +}
> +
> +static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *p=
ci_id)
> +{
> +       struct hws_pcie_dev *hws;
> +       int i, ret, irq;
> +       unsigned long irqf =3D 0;
> +       bool v4l2_registered =3D false;
> +
> +       /* devres-backed device object */
> +       hws =3D devm_kzalloc(&pdev->dev, sizeof(*hws), GFP_KERNEL);
> +       if (!hws)
> +               return -ENOMEM;
> +
> +       hws->pdev =3D pdev;
> +       hws->irq =3D -1;
> +       hws->suspended =3D false;
> +       pci_set_drvdata(pdev, hws);
> +
> +       /* 1) Enable device + bus mastering (managed) */
> +       ret =3D pcim_enable_device(pdev);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret, "pcim_enable_device=
\n");
> +       pci_set_master(pdev);
> +
> +       /* 2) Map BAR0 (managed) */
> +       ret =3D pcim_iomap_regions(pdev, BIT(0), KBUILD_MODNAME);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret, "pcim_iomap_regions=
 BAR0\n");
> +       hws->bar0_base =3D pcim_iomap_table(pdev)[0];
> +
> +       ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> +       if (ret) {
> +               dev_warn(&pdev->dev,
> +                        "64-bit DMA mask unavailable, falling back to 32=
-bit (%d)\n",
> +                        ret);
> +               ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MAS=
K(32));
> +               if (ret)
> +                       return dev_err_probe(&pdev->dev, ret,
> +                                            "No suitable DMA configurati=
on\n");
> +       } else {
> +               dev_dbg(&pdev->dev, "Using 64-bit DMA mask\n");
> +       }
> +
> +       /* 3) Optional PCIe tuning (same as before) */
> +       enable_pcie_relaxed_ordering(pdev);
> +#ifdef CONFIG_ARCH_TI816X
> +       pcie_set_readrq(pdev, 128);
> +#endif
> +
> +       /* 4) Identify chip & capabilities */
> +       read_chip_id(hws);
> +       dev_info(&pdev->dev, "Device VID=3D0x%04x DID=3D0x%04x\n",
> +                pdev->vendor, pdev->device);
> +       hws_init_video_sys(hws, false);
> +
> +       /* 5) Init channels (video state, locks, vb2, ctrls) */
> +       for (i =3D 0; i < hws->max_channels; i++) {
> +               ret =3D hws_video_init_channel(hws, i);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "video channel init failed (c=
h=3D%d)\n", i);
> +                       goto err_unwind_channels;
> +               }
> +       }
> +
> +       /* 6) Allocate scratch DMA and seed BAR table + channel base/half=
 (legacy SetDMAAddress) */
> +       ret =3D hws_alloc_seed_buffers(hws);
> +       if (!ret)
> +               hws_seed_all_channels(hws);
> +
> +       /* 7) Start-run sequence (like InitVideoSys) */
> +       hws_init_video_sys(hws, false);
> +
> +       /* A) Force legacy INTx; legacy used request_irq(pdev->irq, ..., =
IRQF_SHARED) */
> +       pci_intx(pdev, 1);
> +       irqf =3D IRQF_SHARED;
> +       irq =3D pdev->irq;
> +       hws->irq =3D irq;
> +       dev_info(&pdev->dev, "IRQ mode: legacy INTx (shared), irq=3D%d\n"=
, irq);
> +
> +       /* B) Mask the device's global/bridge gate (INT_EN_REG_BASE) */
> +       hws_irq_mask_gate(hws);
> +
> +       /* C) Clear any sticky pending interrupt status (W1C) before we a=
rm the line */
> +       hws_irq_clear_pending(hws);
> +
> +       /* D) Request the legacy shared interrupt line (no vectors/MSI/MS=
I-X) */
> +       ret =3D devm_request_irq(&pdev->dev, irq, hws_irq_handler, irqf,
> +                              dev_name(&pdev->dev), hws);
> +       if (ret) {
> +               dev_err(&pdev->dev, "request_irq(%d) failed: %d\n", irq, =
ret);
> +               goto err_unwind_channels;
> +       }
> +
> +       /* E) Set the global interrupt enable bit in main control registe=
r */
> +       {
> +               u32 ctl_reg =3D readl(hws->bar0_base + HWS_REG_CTL);
> +
> +               ctl_reg |=3D HWS_CTL_IRQ_ENABLE_BIT;
> +               writel(ctl_reg, hws->bar0_base + HWS_REG_CTL);
> +               (void)readl(hws->bar0_base + HWS_REG_CTL); /* flush write=
 */
> +               dev_info(&pdev->dev, "Global IRQ enable bit set in contro=
l register\n");
> +       }
> +
> +       /* F) Open the global gate just like legacy did */
> +       hws_irq_unmask_gate(hws);
> +       dev_info(&pdev->dev, "INT_EN_GATE readback=3D0x%08x\n",
> +                readl(hws->bar0_base + INT_EN_REG_BASE));
> +
> +       /* 11) Register V4L2 */
> +       ret =3D hws_video_register(hws);
> +       if (ret) {
> +               dev_err(&pdev->dev, "video_register: %d\n", ret);
> +               goto err_unwind_channels;
> +       }
> +       v4l2_registered =3D true;
> +
> +       /* 12) Background monitor thread (managed) */
> +       hws->main_task =3D kthread_run(main_ks_thread_handle, hws, "hws-m=
on");
> +       if (IS_ERR(hws->main_task)) {
> +               ret =3D PTR_ERR(hws->main_task);
> +               hws->main_task =3D NULL;
> +               dev_err(&pdev->dev, "kthread_run: %d\n", ret);
> +               goto err_unregister_va;
> +       }
> +       ret =3D devm_add_action_or_reset(&pdev->dev, hws_stop_kthread_act=
ion, hws);
> +       if (ret) {
> +               dev_err(&pdev->dev, "devm_add_action kthread_stop: %d\n",=
 ret);
> +               goto err_unregister_va; /* reset already stopped the thre=
ad */
> +       }
> +
> +       /* 13) Final: show the line is armed */
> +       dev_info(&pdev->dev, "irq handler installed on irq=3D%d\n", irq);
> +       return 0;
> +
> +err_unregister_va:
> +       hws_stop_device(hws);
> +       hws_video_unregister(hws);
> +       hws_free_seed_buffers(hws);
> +       return ret;
> +err_unwind_channels:
> +       hws_free_seed_buffers(hws);
> +       if (!v4l2_registered) {
> +               while (--i >=3D 0)
> +                       hws_video_cleanup_channel(hws, i);
> +       }
> +       return ret;
> +}
> +
> +static int hws_check_busy(struct hws_pcie_dev *pdx)
> +{
> +       void __iomem *reg =3D pdx->bar0_base + HWS_REG_SYS_STATUS;
> +       u32 val;
> +       int ret;
> +
> +       /* poll until !(val & BUSY_BIT), sleeping HWS_BUSY_POLL_DELAY_US =
between reads */
> +       ret =3D readl_poll_timeout(reg, val, !(val & HWS_SYS_DMA_BUSY_BIT=
),
> +                                HWS_BUSY_POLL_DELAY_US,
> +                                HWS_BUSY_POLL_TIMEOUT_US);
> +       if (ret) {
> +               dev_err(&pdx->pdev->dev,
> +                       "SYS_STATUS busy bit never cleared (0x%08x)\n", v=
al);
> +               return -ETIMEDOUT;
> +       }
> +
> +       return 0;
> +}
> +
> +static void hws_stop_dsp(struct hws_pcie_dev *hws)
> +{
> +       u32 status;
> +
> +       /* Read the decoder mode/status register */
> +       status =3D readl(hws->bar0_base + HWS_REG_DEC_MODE);
> +       dev_dbg(&hws->pdev->dev, "%s: status=3D0x%08x\n", __func__, statu=
s);
> +
> +       /* If the device looks unplugged/stuck, bail out */
> +       if (status =3D=3D 0xFFFFFFFF)
> +               return;
> +
> +       /* Tell the DSP to stop */
> +       writel(0x10, hws->bar0_base + HWS_REG_DEC_MODE);
> +
> +       if (hws_check_busy(hws))
> +               dev_warn(&hws->pdev->dev, "DSP busy timeout on stop\n");
> +       /* Disable video capture engine in the DSP */
> +       writel(0x0, hws->bar0_base + HWS_REG_VCAP_ENABLE);
> +}
> +
> +/* Publish stop so ISR/BH won=E2=80=99t touch video buffers anymore. */
> +static void hws_publish_stop_flags(struct hws_pcie_dev *hws)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < hws->cur_max_video_ch; ++i) {
> +               struct hws_video *v =3D &hws->video[i];
> +
> +               WRITE_ONCE(v->cap_active,     false);
> +               WRITE_ONCE(v->stop_requested, true);
> +       }
> +
> +       smp_wmb(); /* make flags visible before we touch MMIO/queues */
> +}
> +
> +/* Drain engines + ISR/BH after flags are published. */
> +static void hws_drain_after_stop(struct hws_pcie_dev *hws)
> +{
> +       u32 ackmask =3D 0;
> +       unsigned int i;
> +       u64 start_ns =3D ktime_get_mono_fast_ns();
> +
> +       /* Mask device enables: no new DMA starts. */
> +       writel(0x0, hws->bar0_base + HWS_REG_VCAP_ENABLE);
> +       (void)readl(hws->bar0_base + HWS_REG_INT_STATUS); /* flush */
> +
> +       /* Let any in-flight DMAs finish (best-effort). */
> +       (void)hws_check_busy(hws);
> +
> +       /* Ack any latched VDONE. */
> +       for (i =3D 0; i < hws->cur_max_video_ch; ++i)
> +               ackmask |=3D HWS_INT_VDONE_BIT(i);
> +       if (ackmask) {
> +               writel(ackmask, hws->bar0_base + HWS_REG_INT_STATUS);
> +               (void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
> +       }
> +
> +       /* Ensure no hard IRQ is still running. */
> +       if (hws->irq >=3D 0)
> +               synchronize_irq(hws->irq);
> +
> +       dev_dbg(&hws->pdev->dev, "lifecycle:drain-after-stop:done (%lluus=
)\n",
> +               hws_elapsed_us(start_ns));
> +}
> +
> +static void hws_stop_device(struct hws_pcie_dev *hws)
> +{
> +       u32 status =3D readl(hws->bar0_base + HWS_REG_SYS_STATUS);
> +       u64 start_ns =3D ktime_get_mono_fast_ns();
> +       bool live =3D status !=3D 0xFFFFFFFF;
> +
> +       dev_dbg(&hws->pdev->dev, "%s: status=3D0x%08x\n", __func__, statu=
s);
> +       if (!live) {
> +               hws->pci_lost =3D true;
> +               goto out;
> +       }
> +       hws_log_lifecycle_snapshot(hws, "stop-device", "begin");
> +
> +       /* Make ISR/BH a no-op, then drain engines/IRQ. */
> +       hws_publish_stop_flags(hws);
> +       hws_drain_after_stop(hws);
> +
> +       /* 1) Stop the on-board DSP */
> +       hws_stop_dsp(hws);
> +
> +out:
> +       hws->start_run =3D false;
> +       if (live)
> +               hws_log_lifecycle_snapshot(hws, "stop-device", "end");
> +       else
> +               dev_dbg(&hws->pdev->dev, "lifecycle:stop-device:device-lo=
st\n");
> +       dev_dbg(&hws->pdev->dev, "lifecycle:stop-device:done (%lluus)\n",
> +               hws_elapsed_us(start_ns));
> +       dev_dbg(&hws->pdev->dev, "%s: complete\n", __func__);
> +}
> +
> +static int hws_quiesce_for_transition(struct hws_pcie_dev *hws,
> +                                     const char *action,
> +                                     bool stop_thread)
> +{
> +       struct device *dev =3D &hws->pdev->dev;
> +       u64 start_ns =3D ktime_get_mono_fast_ns();
> +       u64 step_ns;
> +       int vret;
> +
> +       hws_log_lifecycle_snapshot(hws, action, "begin");
> +
> +       step_ns =3D ktime_get_mono_fast_ns();
> +       hws_block_hotpaths(hws);
> +       dev_dbg(dev, "lifecycle:%s:block-hotpaths (%lluus)\n", action,
> +               hws_elapsed_us(step_ns));
> +       hws_log_lifecycle_snapshot(hws, action, "blocked");
> +
> +       if (stop_thread) {
> +               step_ns =3D ktime_get_mono_fast_ns();
> +               hws_stop_kthread_action(hws);
> +               dev_dbg(dev, "lifecycle:%s:stop-kthread (%lluus)\n", acti=
on,
> +                       hws_elapsed_us(step_ns));
> +       }
> +
> +       step_ns =3D ktime_get_mono_fast_ns();
> +       vret =3D hws_video_quiesce(hws, action);
> +       dev_dbg(dev, "lifecycle:%s:video-quiesce ret=3D%d (%lluus)\n", ac=
tion,
> +               vret, hws_elapsed_us(step_ns));
> +       if (vret)
> +               dev_warn(dev, "lifecycle:%s video quiesce returned %d\n",
> +                        action, vret);
> +
> +       step_ns =3D ktime_get_mono_fast_ns();
> +       hws_stop_device(hws);
> +       dev_dbg(dev, "lifecycle:%s:stop-device (%lluus)\n", action,
> +               hws_elapsed_us(step_ns));
> +       hws_log_lifecycle_snapshot(hws, action, "end");
> +       dev_dbg(dev, "lifecycle:%s:quiesce-done ret=3D%d (%lluus)\n", act=
ion,
> +               vret, hws_elapsed_us(start_ns));
> +
> +       return vret;
> +}
> +
> +static void hws_remove(struct pci_dev *pdev)
> +{
> +       struct hws_pcie_dev *hws =3D pci_get_drvdata(pdev);
> +       u64 start_ns;
> +
> +       if (!hws)
> +               return;
> +
> +       start_ns =3D ktime_get_mono_fast_ns();
> +       dev_info(&pdev->dev, "lifecycle:remove begin\n");
> +       hws_log_lifecycle_snapshot(hws, "remove", "begin");
> +
> +       /* Stop the monitor thread before tearing down V4L2/vb2 objects. =
*/
> +       hws_block_hotpaths(hws);
> +       hws_stop_kthread_action(hws);
> +
> +       /* Stop hardware / capture cleanly (your helper) */
> +       hws_stop_device(hws);
> +
> +       /* Unregister subsystems you registered */
> +       hws_video_unregister(hws);
> +
> +       /* Release seeded DMA buffers */
> +       hws_free_seed_buffers(hws);
> +       /* kthread is stopped by the devm action you added in probe */
> +       hws_log_lifecycle_snapshot(hws, "remove", "end");
> +       dev_info(&pdev->dev, "lifecycle:remove done (%lluus)\n",
> +                hws_elapsed_us(start_ns));
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int hws_pm_suspend(struct device *dev)
> +{
> +       struct pci_dev *pdev =3D to_pci_dev(dev);
> +       struct hws_pcie_dev *hws =3D pci_get_drvdata(pdev);
> +       int vret;
> +       u64 start_ns =3D ktime_get_mono_fast_ns();
> +       u64 step_ns;
> +
> +       dev_info(dev, "lifecycle:pm_suspend begin\n");
> +       vret =3D hws_quiesce_for_transition(hws, "pm_suspend", false);
> +
> +       step_ns =3D ktime_get_mono_fast_ns();
> +       pci_save_state(pdev);
> +       pci_clear_master(pdev);
> +       pci_disable_device(pdev);
> +       pci_set_power_state(pdev, PCI_D3hot);
> +       dev_dbg(dev, "lifecycle:pm_suspend:pci-d3hot (%lluus)\n",
> +               hws_elapsed_us(step_ns));
> +       dev_info(dev, "lifecycle:pm_suspend done ret=3D%d (%lluus)\n", vr=
et,
> +                hws_elapsed_us(start_ns));
> +
> +       return 0;
> +}
> +
> +static int hws_pm_resume(struct device *dev)
> +{
> +       struct pci_dev *pdev =3D to_pci_dev(dev);
> +       struct hws_pcie_dev *hws =3D pci_get_drvdata(pdev);
> +       int ret;
> +       u64 start_ns =3D ktime_get_mono_fast_ns();
> +       u64 step_ns;
> +
> +       dev_info(dev, "lifecycle:pm_resume begin\n");
> +
> +       /* Back to D0 and re-enable the function */
> +       step_ns =3D ktime_get_mono_fast_ns();
> +       pci_set_power_state(pdev, PCI_D0);
> +
> +       ret =3D pci_enable_device(pdev);
> +       if (ret) {
> +               dev_err(dev, "pci_enable_device: %d\n", ret);
> +               return ret;
> +       }
> +       pci_restore_state(pdev);
> +       pci_set_master(pdev);
> +       dev_dbg(dev, "lifecycle:pm_resume:pci-enable (%lluus)\n",
> +               hws_elapsed_us(step_ns));
> +
> +       /* Reapply any PCIe tuning lost across D3 */
> +       enable_pcie_relaxed_ordering(pdev);
> +
> +       /* Reinitialize chip-side capabilities / registers */
> +       step_ns =3D ktime_get_mono_fast_ns();
> +       read_chip_id(hws);
> +       /* Re-seed BAR remaps/DMA windows and restart the capture core */
> +       hws_seed_all_channels(hws);
> +       hws_init_video_sys(hws, true);
> +       hws_irq_clear_pending(hws);
> +       dev_dbg(dev, "lifecycle:pm_resume:chip-reinit (%lluus)\n",
> +               hws_elapsed_us(step_ns));
> +
> +       /* IRQs can be re-enabled now that MMIO is sane */
> +       step_ns =3D ktime_get_mono_fast_ns();
> +       if (hws->irq >=3D 0)
> +               enable_irq(hws->irq);
> +
> +       WRITE_ONCE(hws->suspended, false);
> +       dev_dbg(dev, "lifecycle:pm_resume:irq-unsuspend (%lluus)\n",
> +               hws_elapsed_us(step_ns));
> +
> +       /* vb2: nothing mandatory; userspace will STREAMON again when rea=
dy */
> +       step_ns =3D ktime_get_mono_fast_ns();
> +       hws_video_pm_resume(hws);
> +       dev_dbg(dev, "lifecycle:pm_resume:video-resume (%lluus)\n",
> +               hws_elapsed_us(step_ns));
> +       hws_log_lifecycle_snapshot(hws, "pm_resume", "end");
> +       dev_info(dev, "lifecycle:pm_resume done (%lluus)\n",
> +                hws_elapsed_us(start_ns));
> +
> +       return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(hws_pm_ops, hws_pm_suspend, hws_pm_resume);
> +# define HWS_PM_OPS (&hws_pm_ops)
> +#else
> +# define HWS_PM_OPS NULL
> +#endif
> +
> +static void hws_shutdown(struct pci_dev *pdev)
> +{
> +       struct hws_pcie_dev *hws =3D pci_get_drvdata(pdev);
> +       int vret =3D 0;
> +       u64 start_ns =3D ktime_get_mono_fast_ns();
> +       u64 step_ns;
> +
> +       if (!hws)
> +               return;
> +
> +       dev_info(&pdev->dev, "lifecycle:pci_shutdown begin\n");
> +       vret =3D hws_quiesce_for_transition(hws, "pci_shutdown", true);
> +
> +       step_ns =3D ktime_get_mono_fast_ns();
> +       pci_clear_master(pdev);
> +       dev_dbg(&pdev->dev, "lifecycle:pci_shutdown:clear-master (%lluus)=
\n",
> +               hws_elapsed_us(step_ns));
> +       dev_info(&pdev->dev, "lifecycle:pci_shutdown done ret=3D%d (%lluu=
s)\n",
> +                vret, hws_elapsed_us(start_ns));
> +}
> +
> +static struct pci_driver hws_pci_driver =3D {
> +       .name =3D KBUILD_MODNAME,
> +       .id_table =3D hws_pci_table,
> +       .probe =3D hws_probe,
> +       .remove =3D hws_remove,
> +       .shutdown =3D hws_shutdown,
> +       .driver =3D {
> +               .pm =3D HWS_PM_OPS,
> +       },
> +};
> +
> +MODULE_DEVICE_TABLE(pci, hws_pci_table);
> +
> +static int __init pcie_hws_init(void)
> +{
> +       return pci_register_driver(&hws_pci_driver);
> +}
> +
> +static void __exit pcie_hws_exit(void)
> +{
> +       pci_unregister_driver(&hws_pci_driver);
> +}
> +
> +module_init(pcie_hws_init);
> +module_exit(pcie_hws_exit);
> +
> +MODULE_DESCRIPTION(DRV_NAME);
> +MODULE_AUTHOR("Ben Hoff <hoff.benjamin.k@gmail.com>");
> +MODULE_AUTHOR("Sales <sales@avmatrix.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("DMA_BUF");
> diff --git a/drivers/media/pci/hws/hws_reg.h b/drivers/media/pci/hws/hws_=
reg.h
> new file mode 100644
> index 000000000000..e4fb4af44434
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_reg.h
> @@ -0,0 +1,136 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _HWS_PCIE_REG_H
> +#define _HWS_PCIE_REG_H
> +
> +#include <linux/bits.h>
> +#include <linux/sizes.h>
> +
> +#define XDMA_CHANNEL_NUM_MAX (1)
> +#define MAX_NUM_ENGINES (XDMA_CHANNEL_NUM_MAX * 2)
> +
> +#define  PCIE_BARADDROFSIZE 4u
> +
> +#define PCI_BUS_ACCESS_BASE       0x00000000U
> +#define INT_EN_REG_BASE           (PCI_BUS_ACCESS_BASE + 0x0134U)
> +#define PCIEBR_EN_REG_BASE        (PCI_BUS_ACCESS_BASE + 0x0148U)
> +#define PCIE_INT_DEC_REG_BASE     (PCI_BUS_ACCESS_BASE + 0x0138U)
> +
> +#define HWS_INT_EN_MASK           0x0003FFFFU
> +
> +#define PCIEBAR_AXI_BASE 0x20000000U
> +
> +#define CTL_REG_ACC_BASE 0x0
> +#define PCI_ADDR_TABLE_BASE CTL_REG_ACC_BASE
> +
> +#define CVBS_IN_BASE              0x00004000U
> +#define CVBS_IN_BUF_BASE          (CVBS_IN_BASE + (16U * PCIE_BARADDROFS=
IZE))
> +#define CVBS_IN_BUF_BASE2         (CVBS_IN_BASE + (50U * PCIE_BARADDROFS=
IZE))
> +
> +/* 2 Mib */
> +#define MAX_L_VIDEO_SIZE            0x200000U
> +
> +#define PCI_E_BAR_PAGE_SIZE 0x20000000
> +#define PCI_E_BAR_ADD_MASK 0xE0000000
> +#define PCI_E_BAR_ADD_LOWMASK 0x1FFFFFFF
> +
> +#define MAX_VID_CHANNELS            4
> +
> +#define MAX_MM_VIDEO_SIZE            SZ_4M
> +
> +#define MAX_VIDEO_HW_W 1920
> +#define MAX_VIDEO_HW_H 1080
> +#define MAX_VIDEO_SCALER_SIZE     (1920U * 1080U * 2U)
> +
> +#define MIN_VAMP_BRIGHTNESS_UNITS   0
> +#define MAX_VAMP_BRIGHTNESS_UNITS   0xff
> +
> +#define MIN_VAMP_CONTRAST_UNITS     0
> +#define MAX_VAMP_CONTRAST_UNITS     0xff
> +
> +#define MIN_VAMP_SATURATION_UNITS   0
> +#define MAX_VAMP_SATURATION_UNITS   0xff
> +
> +#define MIN_VAMP_HUE_UNITS          0
> +#define MAX_VAMP_HUE_UNITS          0xff
> +
> +#define HWS_BRIGHTNESS_DEFAULT       0x80
> +#define HWS_CONTRAST_DEFAULT         0x80
> +#define HWS_SATURATION_DEFAULT       0x80
> +#define HWS_HUE_DEFAULT              0x00
> +
> +/* Core/global status. */
> +#define HWS_REG_SYS_STATUS            (CVBS_IN_BASE +  0 * PCIE_BARADDRO=
FSIZE)
> +/* bit3: DMA busy, bit2: int, ... */
> +
> +#define HWS_SYS_DMA_BUSY_BIT          BIT(3) /* 0x08 =3D DMA busy flag *=
/
> +
> +#define HWS_REG_DEC_MODE       (CVBS_IN_BASE +  0 * PCIE_BARADDROFSIZE)
> +/* Main control register */
> +#define HWS_REG_CTL            (CVBS_IN_BASE +  4 * PCIE_BARADDROFSIZE)
> +#define HWS_CTL_IRQ_ENABLE_BIT BIT(0)   /* Global interrupt enable bit *=
/
> +/*  Write 0x00 to fully reset decoder,
> + *  set bit 31=3D1 to "start run",
> + *  low byte=3D0x13 selects YUYV/BT.709/etc,
> + *  in ReadChipId() we also write 0x00 and 0x10 here for chip-ID sequenc=
ing.
> + */
> +
> +/* Per-channel done flags. */
> +#define HWS_REG_INT_STATUS            (CVBS_IN_BASE +  1 * PCIE_BARADDRO=
FSIZE)
> +#define HWS_SYS_BUSY_BIT          BIT(2)      /* matches old 0x04 test  =
 */
> +
> +/* Capture enable switches. */
> +/* bit0-3: CH0-CH3 video enable */
> +#define HWS_REG_VCAP_ENABLE           (CVBS_IN_BASE +  2 * PCIE_BARADDRO=
FSIZE)
> +/* bits0-3: signal present, bits8-11: interlace */
> +#define HWS_REG_ACTIVE_STATUS          (CVBS_IN_BASE +  5  * PCIE_BARADD=
ROFSIZE)
> +/* bits0-3: HDCP detected */
> +#define HWS_REG_HDCP_STATUS            (CVBS_IN_BASE +  8  * PCIE_BARADD=
ROFSIZE)
> +#define HWS_REG_DMA_MAX_SIZE   (CVBS_IN_BASE +  9 * PCIE_BARADDROFSIZE)
> +
> +/* Buffer addresses (written once during init/reset). */
> +/* Base of host-visible buffer. */
> +#define HWS_REG_VBUF1_ADDR            (CVBS_IN_BASE + 25 * PCIE_BARADDRO=
FSIZE)
> +/* Per-channel DMA address. */
> +#define HWS_REG_DMA_ADDR(ch)          (CVBS_IN_BASE + (26 + (ch)) * PCIE=
_BARADDROFSIZE)
> +
> +/* Per-channel live buffer toggles (read-only). */
> +#define HWS_REG_VBUF_TOGGLE(ch)       (CVBS_IN_BASE + (32 + (ch)) * PCIE=
_BARADDROFSIZE)
> +/*
> + * Returns 0 or 1 =3D which half of the video ring the DMA engine is
> + * currently filling for channel *ch* (0-3).
> + */
> +
> +/* Per-interrupt bits (video 0-3). */
> +#define HWS_INT_VDONE_BIT(ch)     BIT(ch)         /* 0x01,0x02,0x04,0x08=
  */
> +
> +#define HWS_REG_INT_ACK           (CVBS_IN_BASE + 0x4000 + 1 * PCIE_BARA=
DDROFSIZE)
> +
> +/* 16-bit W | 16-bit H. */
> +#define HWS_REG_IN_RES(ch)             (CVBS_IN_BASE + (90  + (ch) * 2) =
* PCIE_BARADDROFSIZE)
> +/* B|C|H|S packed bytes. */
> +#define HWS_REG_BCHS(ch)               (CVBS_IN_BASE + (91  + (ch) * 2) =
* PCIE_BARADDROFSIZE)
> +
> +/* Input fps. */
> +#define HWS_REG_FRAME_RATE(ch)         (CVBS_IN_BASE + (110 + (ch))    *=
 PCIE_BARADDROFSIZE)
> +/* Programmed out W|H. */
> +#define HWS_REG_OUT_RES(ch)            (CVBS_IN_BASE + (120 + (ch))    *=
 PCIE_BARADDROFSIZE)
> +/* Programmed out fps. */
> +#define HWS_REG_OUT_FRAME_RATE(ch)     (CVBS_IN_BASE + (130 + (ch))    *=
 PCIE_BARADDROFSIZE)
> +
> +/* Device version/port ID/subversion register. */
> +#define HWS_REG_DEVICE_INFO   (CVBS_IN_BASE +  88 * PCIE_BARADDROFSIZE)
> +/*
> + * Reading this 32-bit word returns:
> + *   bits 7:0   =3D "device version"
> + *   bits 15:8  =3D "device sub-version"
> + *   bits 23:24 =3D "HW key / port ID" etc.
> + *   bits 31:28 =3D "support YV12" flags
> + */
> +
> +/* Convenience aliases for individual channels. */
> +#define HWS_REG_VBUF_TOGGLE_CH0       HWS_REG_VBUF_TOGGLE(0)
> +#define HWS_REG_VBUF_TOGGLE_CH1       HWS_REG_VBUF_TOGGLE(1)
> +#define HWS_REG_VBUF_TOGGLE_CH2       HWS_REG_VBUF_TOGGLE(2)
> +#define HWS_REG_VBUF_TOGGLE_CH3       HWS_REG_VBUF_TOGGLE(3)
> +
> +#endif /* _HWS_PCIE_REG_H */
> diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.c b/drivers/media/pci/h=
ws/hws_v4l2_ioctl.c
> new file mode 100644
> index 000000000000..9c0826c0f9f9
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_v4l2_ioctl.c
> @@ -0,0 +1,924 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +#include <linux/pci.h>
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +#include <linux/math64.h>
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
> +       struct v4l2_dv_timings timings;
> +       u32 refresh_hz;
> +};
> +
> +static const struct hws_dv_mode *
> +hws_find_dv_by_wh(u32 w, u32 h, bool interlaced);
> +static const struct hws_dv_mode *
> +hws_find_dv_by_wh_fps(u32 w, u32 h, bool interlaced, u32 fps);
> +static u32 hws_get_live_fps(struct hws_video *vid);
> +static u32 hws_input_status(struct hws_video *vid);
> +static int hws_fill_dv_timings(u32 w, u32 h, bool interlace, u32 fps,
> +                              struct v4l2_dv_timings *timings);
> +
> +static const struct hws_dv_mode hws_dv_modes[] =3D {
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 1920,
> +                               .height =3D 1080,
> +                               .hfrontporch =3D 88,
> +                               .hsync =3D 44,
> +                               .hbackporch =3D 148,
> +                               .vfrontporch =3D 4,
> +                               .vsync =3D 5,
> +                               .vbackporch =3D 36,
> +                               .pixelclock =3D 148500000,
> +                               .polarities =3D V4L2_DV_VSYNC_POS_POL |
> +                                             V4L2_DV_HSYNC_POS_POL,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               60,
> +       },
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 1920,
> +                               .height =3D 1080,
> +                               .hfrontporch =3D 88,
> +                               .hsync =3D 44,
> +                               .hbackporch =3D 148,
> +                               .vfrontporch =3D 4,
> +                               .vsync =3D 5,
> +                               .vbackporch =3D 36,
> +                               .pixelclock =3D 74250000,
> +                               .polarities =3D V4L2_DV_VSYNC_POS_POL |
> +                                             V4L2_DV_HSYNC_POS_POL,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               30,
> +       },
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 1280,
> +                               .height =3D 720,
> +                               .hfrontporch =3D 110,
> +                               .hsync =3D 40,
> +                               .hbackporch =3D 220,
> +                               .vfrontporch =3D 5,
> +                               .vsync =3D 5,
> +                               .vbackporch =3D 20,
> +                               .pixelclock =3D 74250000,
> +                               .polarities =3D V4L2_DV_VSYNC_POS_POL |
> +                                             V4L2_DV_HSYNC_POS_POL,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               60,
> +       },
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 720,
> +                               .height =3D 480,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               60,
> +       },
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 720,
> +                               .height =3D 576,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               50,
> +       },
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 800,
> +                               .height =3D 600,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               60,
> +       },
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 640,
> +                               .height =3D 480,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               60,
> +       },
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 1024,
> +                               .height =3D 768,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               60,
> +       },
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 1280,
> +                               .height =3D 768,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               60,
> +       },
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 1280,
> +                               .height =3D 800,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               60,
> +       },
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 1280,
> +                               .height =3D 1024,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               60,
> +       },
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 1360,
> +                               .height =3D 768,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               60,
> +       },
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 1440,
> +                               .height =3D 900,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               60,
> +       },
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 1680,
> +                               .height =3D 1050,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               60,
> +       },
> +       /* Portrait */
> +       {
> +               {
> +                       .type =3D V4L2_DV_BT_656_1120,
> +                       .bt =3D {
> +                               .width =3D 1080,
> +                               .height =3D 1920,
> +                               .interlaced =3D 0,
> +                       },
> +               },
> +               60,
> +       },
> +};
> +
> +static const size_t hws_dv_modes_cnt =3D ARRAY_SIZE(hws_dv_modes);
> +
> +/* YUYV: 16 bpp; align to 64 as you did elsewhere */
> +static inline u32 hws_calc_bpl_yuyv(u32 w)     { return ALIGN(w * 2, 64)=
; }
> +static inline u32 hws_calc_size_yuyv(u32 w, u32 h) { return hws_calc_bpl=
_yuyv(w) * h; }
> +static inline u32 hws_calc_half_size(u32 sizeimage)
> +{
> +       return sizeimage / 2;
> +}
> +
> +static inline void hws_hw_write_bchs(struct hws_pcie_dev *hws, unsigned =
int ch,
> +                                    u8 br, u8 co, u8 hu, u8 sa)
> +{
> +       u32 packed =3D (sa << 24) | (hu << 16) | (co << 8) | br;
> +
> +       if (!hws || !hws->bar0_base || ch >=3D hws->max_channels)
> +               return;
> +       writel_relaxed(packed, hws->bar0_base + HWS_REG_BCHS(ch));
> +       (void)readl(hws->bar0_base + HWS_REG_BCHS(ch)); /* post write */
> +}
> +
> +/* Helper: find a supported DV mode by W/H + interlace flag */
> +static const struct hws_dv_mode *
> +hws_match_supported_dv(const struct v4l2_dv_timings *req)
> +{
> +       const struct v4l2_bt_timings *bt;
> +       u32 fps;
> +
> +       if (!req || req->type !=3D V4L2_DV_BT_656_1120)
> +               return NULL;
> +
> +       bt =3D &req->bt;
> +       fps =3D 0;
> +       if (bt->pixelclock) {
> +               u32 total_w =3D bt->width + bt->hfrontporch + bt->hsync +
> +                             bt->hbackporch;
> +               u32 total_h =3D bt->height + bt->vfrontporch + bt->vsync =
+
> +                             bt->vbackporch;
> +
> +               if (total_w && total_h)
> +                       fps =3D DIV_ROUND_CLOSEST_ULL((u64)bt->pixelclock=
,
> +                                                   (u64)total_w * total_=
h);
> +       }
> +       if (fps) {
> +               const struct hws_dv_mode *exact =3D
> +                       hws_find_dv_by_wh_fps(bt->width, bt->height,
> +                                             !!bt->interlaced, fps);
> +               if (exact)
> +                       return exact;
> +       }
> +       return hws_find_dv_by_wh(bt->width, bt->height, !!bt->interlaced)=
;
> +}
> +
> +/* Helper: find a supported DV mode by W/H + interlace flag */
> +static const struct hws_dv_mode *
> +hws_find_dv_by_wh(u32 w, u32 h, bool interlaced)
> +{
> +       size_t i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(hws_dv_modes); i++) {
> +               const struct hws_dv_mode *t =3D &hws_dv_modes[i];
> +               const struct v4l2_bt_timings *bt =3D &t->timings.bt;
> +
> +               if (t->timings.type !=3D V4L2_DV_BT_656_1120)
> +                       continue;
> +
> +               if (bt->width =3D=3D w && bt->height =3D=3D h &&
> +                   !!bt->interlaced =3D=3D interlaced)
> +                       return t;
> +       }
> +       return NULL;
> +}
> +
> +static const struct hws_dv_mode *
> +hws_find_dv_by_wh_fps(u32 w, u32 h, bool interlaced, u32 fps)
> +{
> +       size_t i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(hws_dv_modes); i++) {
> +               const struct hws_dv_mode *t =3D &hws_dv_modes[i];
> +               const struct v4l2_bt_timings *bt =3D &t->timings.bt;
> +
> +               if (t->timings.type !=3D V4L2_DV_BT_656_1120)
> +                       continue;
> +
> +               if (bt->width =3D=3D w && bt->height =3D=3D h &&
> +                   !!bt->interlaced =3D=3D interlaced &&
> +                   t->refresh_hz =3D=3D fps)
> +                       return t;
> +       }
> +       return NULL;
> +}
> +
> +static bool hws_get_live_dv_geometry(struct hws_video *vid,
> +                                    u32 *w, u32 *h, bool *interlaced)
> +{
> +       struct hws_pcie_dev *pdx;
> +       u32 reg;
> +
> +       if (!vid)
> +               return false;
> +
> +       pdx =3D vid->parent;
> +       if (!pdx || !pdx->bar0_base)
> +               return false;
> +
> +       reg =3D readl(pdx->bar0_base + HWS_REG_IN_RES(vid->channel_index)=
);
> +       if (!reg || reg =3D=3D 0xFFFFFFFF)
> +               return false;
> +
> +       if (w)
> +               *w =3D reg & 0xFFFF;
> +       if (h)
> +               *h =3D (reg >> 16) & 0xFFFF;
> +       if (interlaced) {
> +               reg =3D readl(pdx->bar0_base + HWS_REG_ACTIVE_STATUS);
> +               *interlaced =3D !!(reg & BIT(8 + vid->channel_index));
> +       }
> +       return true;
> +}
> +
> +static u32 hws_get_live_fps(struct hws_video *vid)
> +{
> +       struct hws_pcie_dev *pdx;
> +       u32 fps;
> +
> +       if (!vid)
> +               return 0;
> +
> +       pdx =3D vid->parent;
> +       if (!pdx || !pdx->bar0_base)
> +               return 0;
> +
> +       fps =3D readl(pdx->bar0_base + HWS_REG_FRAME_RATE(vid->channel_in=
dex));
> +       if (!fps || fps =3D=3D 0xFFFFFFFF || fps > 240)
> +               return 0;
> +
> +       return fps;
> +}
> +
> +static u32 hws_pick_fps_from_mode(u32 w, u32 h, bool interlaced)
> +{
> +       const struct hws_dv_mode *m =3D hws_find_dv_by_wh(w, h, interlace=
d);
> +
> +       if (m && m->refresh_hz)
> +               return m->refresh_hz;
> +       /* Fallback to a sane default */
> +       return 60;
> +}
> +
> +static int hws_fill_dv_timings(u32 w, u32 h, bool interlace, u32 fps,
> +                              struct v4l2_dv_timings *timings)
> +{
> +       const struct hws_dv_mode *m;
> +
> +       m =3D fps ? hws_find_dv_by_wh_fps(w, h, interlace, fps) : NULL;
> +       if (!m)
> +               m =3D hws_find_dv_by_wh(w, h, interlace);
> +       if (!m)
> +               return -ENOLINK;
> +
> +       *timings =3D m->timings;
> +       return 0;
> +}
> +
> +static u32 hws_input_status(struct hws_video *vid)
> +{
> +       struct hws_pcie_dev *pdx;
> +       u32 reg;
> +
> +       if (!vid)
> +               return V4L2_IN_ST_NO_SIGNAL;
> +
> +       pdx =3D vid->parent;
> +       if (!pdx || !pdx->bar0_base)
> +               return V4L2_IN_ST_NO_SIGNAL;
> +
> +       reg =3D readl(pdx->bar0_base + HWS_REG_ACTIVE_STATUS);
> +       if (reg =3D=3D 0xffffffff)
> +               return V4L2_IN_ST_NO_SIGNAL;
> +
> +       return (reg & BIT(vid->channel_index)) ? 0 : V4L2_IN_ST_NO_SIGNAL=
;
> +}
> +
> +/* Query the *current detected* DV timings on the input.
> + * If you have a real hardware detector, call it here; otherwise we
> + * derive from the cached pix state and map to the closest supported DV =
mode.
> + */
> +int hws_vidioc_query_dv_timings(struct file *file, void *fh,
> +                               struct v4l2_dv_timings *timings)
> +{
> +       struct hws_video *vid =3D video_drvdata(file);
> +       u32 w, h;
> +       u32 fps;
> +       bool interlace;
> +
> +       if (!timings)
> +               return -EINVAL;
> +
> +       w =3D vid->pix.width;
> +       h =3D vid->pix.height;
> +       interlace =3D vid->pix.interlaced;
> +       (void)hws_get_live_dv_geometry(vid, &w, &h, &interlace);
> +       fps =3D hws_get_live_fps(vid);
> +       if (!fps)
> +               fps =3D vid->current_fps ? vid->current_fps :
> +                     hws_pick_fps_from_mode(w, h, interlace);
> +
> +       return hws_fill_dv_timings(w, h, interlace, fps, timings);
> +}
> +
> +/* Enumerate the Nth supported DV timings from our static table. */
> +int hws_vidioc_enum_dv_timings(struct file *file, void *fh,
> +                              struct v4l2_enum_dv_timings *edv)
> +{
> +       struct hws_video *vid =3D video_drvdata(file);
> +       const struct hws_dv_mode *m;
> +       u32 w, h;
> +       u32 fps;
> +       bool interlace;
> +
> +       if (!edv)
> +               return -EINVAL;
> +
> +       if (edv->pad)
> +               return -EINVAL;
> +
> +       w =3D 0;
> +       h =3D 0;
> +       interlace =3D false;
> +       if (hws_get_live_dv_geometry(vid, &w, &h, &interlace)) {
> +               fps =3D hws_get_live_fps(vid);
> +               if (!fps)
> +                       fps =3D vid->current_fps ? vid->current_fps :
> +                             hws_pick_fps_from_mode(w, h, interlace);
> +               m =3D fps ? hws_find_dv_by_wh_fps(w, h, interlace, fps) :=
 NULL;
> +               if (!m)
> +                       m =3D hws_find_dv_by_wh(w, h, interlace);
> +               if (m) {
> +                       if (edv->index)
> +                               return -EINVAL;
> +                       edv->timings =3D m->timings;
> +                       return 0;
> +               }
> +       }
> +
> +       if (edv->index >=3D hws_dv_modes_cnt)
> +               return -EINVAL;
> +
> +       edv->timings =3D hws_dv_modes[edv->index].timings;
> +       return 0;
> +}
> +
> +/* Get the *currently configured* DV timings. */
> +int hws_vidioc_g_dv_timings(struct file *file, void *fh,
> +                           struct v4l2_dv_timings *timings)
> +{
> +       struct hws_video *vid =3D video_drvdata(file);
> +       u32 w, h;
> +       u32 fps;
> +       bool interlace;
> +
> +       if (!timings)
> +               return -EINVAL;
> +
> +       w =3D vid->pix.width;
> +       h =3D vid->pix.height;
> +       interlace =3D vid->pix.interlaced;
> +       if (hws_get_live_dv_geometry(vid, &w, &h, &interlace)) {
> +               fps =3D hws_get_live_fps(vid);
> +               if (!fps)
> +                       fps =3D vid->current_fps ? vid->current_fps :
> +                             hws_pick_fps_from_mode(w, h, interlace);
> +               return hws_fill_dv_timings(w, h, interlace, fps, timings)=
;
> +       }
> +
> +       *timings =3D vid->cur_dv_timings;
> +       return 0;
> +}
> +
> +static inline void hws_set_colorimetry_state(struct hws_pix_state *p)
> +{
> +       bool sd =3D p->height <=3D 576;
> +
> +       p->colorspace   =3D sd ? V4L2_COLORSPACE_SMPTE170M : V4L2_COLORSP=
ACE_REC709;
> +       p->ycbcr_enc    =3D V4L2_YCBCR_ENC_DEFAULT;
> +       p->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +       p->xfer_func    =3D V4L2_XFER_FUNC_DEFAULT;
> +}
> +
> +/* Set DV timings: must match one of our supported modes.
> + * If buffers are queued and this implies a size change, we reject with =
-EBUSY.
> + * Otherwise we update pix state and (optionally) reprogram the HW.
> + */
> +int hws_vidioc_s_dv_timings(struct file *file, void *fh,
> +                           struct v4l2_dv_timings *timings)
> +{
> +       struct hws_video *vid =3D video_drvdata(file);
> +       const struct hws_dv_mode *m;
> +       const struct v4l2_bt_timings *bt;
> +       u32 new_w, new_h;
> +       bool interlaced;
> +       int ret =3D 0;
> +       unsigned long was_busy;
> +       u32 live_w, live_h;
> +       u32 live_fps;
> +       bool live_interlaced;
> +       bool live_present;
> +
> +       if (!timings)
> +               return -EINVAL;
> +
> +       m =3D hws_match_supported_dv(timings);
> +       if (!m)
> +               return -EINVAL;
> +
> +       bt =3D &m->timings.bt;
> +       if (bt->interlaced)
> +               return -EINVAL; /* only progressive modes are advertised =
*/
> +       new_w =3D bt->width;
> +       new_h =3D bt->height;
> +       interlaced =3D false;
> +
> +       lockdep_assert_held(&vid->state_lock);
> +       live_present =3D hws_get_live_dv_geometry(vid, &live_w, &live_h,
> +                                               &live_interlaced);
> +
> +       /* If vb2 has active buffers and size would change, reject. */
> +       was_busy =3D vb2_is_busy(&vid->buffer_queue);
> +       if (was_busy &&
> +           (new_w !=3D vid->pix.width || new_h !=3D vid->pix.height ||
> +            interlaced !=3D vid->pix.interlaced)) {
> +               ret =3D -EBUSY;
> +               return ret;
> +       }
> +
> +       /* When a live input signal is present, the receiver owns the tim=
ing.
> +        * Allow setting the already-active timings so v4l2-compliance ca=
n
> +        * round-trip them, but reject attempts to retime the live source=
.
> +        */
> +       if (live_present) {
> +               live_fps =3D hws_get_live_fps(vid);
> +               if (!live_fps)
> +                       live_fps =3D vid->current_fps ? vid->current_fps =
:
> +                               hws_pick_fps_from_mode(live_w, live_h,
> +                                                      live_interlaced);
> +               if (live_w =3D=3D new_w && live_h =3D=3D new_h &&
> +                   live_interlaced =3D=3D interlaced &&
> +                   m->refresh_hz =3D=3D live_fps)
> +                       return 0;
> +               return -EBUSY;
> +       }
> +
> +       /* Update software pixel state (and recalc sizes) */
> +       vid->pix.width      =3D new_w;
> +       vid->pix.height     =3D new_h;
> +       vid->pix.field      =3D interlaced ? V4L2_FIELD_INTERLACED
> +                                        : V4L2_FIELD_NONE;
> +       vid->pix.interlaced =3D interlaced;
> +       vid->pix.fourcc     =3D V4L2_PIX_FMT_YUYV;
> +
> +       hws_set_colorimetry_state(&vid->pix);
> +
> +       /* Recompute stride/sizeimage/half_size using your helper */
> +       vid->pix.bytesperline =3D hws_calc_bpl_yuyv(new_w);
> +       vid->pix.sizeimage    =3D hws_calc_size_yuyv(new_w, new_h);
> +       vid->pix.half_size    =3D hws_calc_half_size(vid->pix.sizeimage);
> +       vid->cur_dv_timings   =3D m->timings;
> +       vid->current_fps      =3D m->refresh_hz;
> +       if (!was_busy)
> +               vid->alloc_sizeimage =3D vid->pix.sizeimage;
> +       return ret;
> +}
> +
> +/* Report DV timings capability: advertise BT.656/1120 with
> + * the min/max WxH derived from our table and basic progressive support.
> + */
> +int hws_vidioc_dv_timings_cap(struct file *file, void *fh,
> +                             struct v4l2_dv_timings_cap *cap)
> +{
> +       u32 min_w =3D ~0U, min_h =3D ~0U;
> +       u32 max_w =3D 0,       max_h =3D 0;
> +       size_t i, n =3D 0;
> +
> +       if (!cap)
> +               return -EINVAL;
> +
> +       memset(cap, 0, sizeof(*cap));
> +       cap->type =3D V4L2_DV_BT_656_1120;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(hws_dv_modes); i++) {
> +               const struct v4l2_bt_timings *bt =3D &hws_dv_modes[i].tim=
ings.bt;
> +
> +               if (hws_dv_modes[i].timings.type !=3D V4L2_DV_BT_656_1120=
)
> +                       continue;
> +               n++;
> +
> +               if (bt->width  < min_w)
> +                       min_w =3D bt->width;
> +               if (bt->height < min_h)
> +                       min_h =3D bt->height;
> +               if (bt->width  > max_w)
> +                       max_w =3D bt->width;
> +               if (bt->height > max_h)
> +                       max_h =3D bt->height;
> +       }
> +
> +       /* If the table was empty, fail gracefully. */
> +       if (!n || min_w =3D=3D U32_MAX)
> +               return -ENODATA;
> +
> +       cap->bt.min_width  =3D min_w;
> +       cap->bt.max_width  =3D max_w;
> +       cap->bt.min_height =3D min_h;
> +       cap->bt.max_height =3D max_h;
> +
> +       /* We support both CEA-861- and VESA-style modes in the list. */
> +       cap->bt.standards =3D
> +               V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT | V4L2_DV_BT_S=
TD_CVT;
> +
> +       /* Progressive only, unless your table includes interlaced entrie=
s. */
> +       cap->bt.capabilities =3D V4L2_DV_BT_CAP_PROGRESSIVE;
> +
> +       /* Leave pixelclock/porch limits unconstrained (0) for now. */
> +       return 0;
> +}
> +
> +static int hws_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct hws_video *vid =3D
> +               container_of(ctrl->handler, struct hws_video, control_han=
dler);
> +       struct hws_pcie_dev *pdx =3D vid->parent;
> +       bool program =3D false;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_BRIGHTNESS:
> +               vid->current_brightness =3D ctrl->val;
> +               program =3D true;
> +               break;
> +       case V4L2_CID_CONTRAST:
> +               vid->current_contrast =3D ctrl->val;
> +               program =3D true;
> +               break;
> +       case V4L2_CID_SATURATION:
> +               vid->current_saturation =3D ctrl->val;
> +               program =3D true;
> +               break;
> +       case V4L2_CID_HUE:
> +               vid->current_hue =3D ctrl->val;
> +               program =3D true;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       if (program) {
> +               hws_hw_write_bchs(pdx, vid->channel_index,
> +                                 (u8)vid->current_brightness,
> +                                 (u8)vid->current_contrast,
> +                                 (u8)vid->current_hue,
> +                                 (u8)vid->current_saturation);
> +       }
> +       return 0;
> +}
> +
> +const struct v4l2_ctrl_ops hws_ctrl_ops =3D {
> +       .s_ctrl =3D hws_s_ctrl,
> +};
> +
> +int hws_vidioc_querycap(struct file *file, void *priv, struct v4l2_capab=
ility *cap)
> +{
> +       struct hws_video *vid =3D video_drvdata(file);
> +       int vi_index =3D vid->channel_index + 1; /* keep it simple */
> +
> +       strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
> +       snprintf(cap->card, sizeof(cap->card),
> +                "AVMatrix HWS Capture %d", vi_index);
> +       return 0;
> +}
> +
> +int hws_vidioc_enum_fmt_vid_cap(struct file *file, void *priv_fh, struct=
 v4l2_fmtdesc *f)
> +{
> +       if (f->index !=3D 0)
> +               return -EINVAL; /* only one format */
> +
> +       f->pixelformat =3D V4L2_PIX_FMT_YUYV;
> +       return 0;
> +}
> +
> +int hws_vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fo=
rmat *fmt)
> +{
> +       struct hws_video *vid =3D video_drvdata(file);
> +
> +       fmt->fmt.pix.width        =3D vid->pix.width;
> +       fmt->fmt.pix.height       =3D vid->pix.height;
> +       fmt->fmt.pix.pixelformat  =3D V4L2_PIX_FMT_YUYV;
> +       fmt->fmt.pix.field        =3D vid->pix.field;
> +       fmt->fmt.pix.bytesperline =3D vid->pix.bytesperline;
> +       fmt->fmt.pix.sizeimage    =3D vid->pix.sizeimage;
> +       fmt->fmt.pix.colorspace   =3D vid->pix.colorspace;
> +       fmt->fmt.pix.ycbcr_enc    =3D vid->pix.ycbcr_enc;
> +       fmt->fmt.pix.quantization =3D vid->pix.quantization;
> +       fmt->fmt.pix.xfer_func    =3D vid->pix.xfer_func;
> +       return 0;
> +}
> +
> +static inline void hws_set_colorimetry_fmt(struct v4l2_pix_format *p)
> +{
> +       bool sd =3D p->height <=3D 576;
> +
> +       p->colorspace   =3D sd ? V4L2_COLORSPACE_SMPTE170M : V4L2_COLORSP=
ACE_REC709;
> +       p->ycbcr_enc    =3D V4L2_YCBCR_ENC_DEFAULT;
> +       p->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +       p->xfer_func    =3D V4L2_XFER_FUNC_DEFAULT;
> +}
> +
> +int hws_vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_=
format *f)
> +{
> +       struct hws_video *vid =3D file ? video_drvdata(file) : NULL;
> +       struct hws_pcie_dev *pdev =3D vid ? vid->parent : NULL;
> +       struct v4l2_pix_format *pix =3D &f->fmt.pix;
> +       u32 req_w =3D pix->width, req_h =3D pix->height;
> +       u32 w, h, min_bpl, bpl;
> +       size_t size; /* wider than u32 for overflow check */
> +       size_t max_frame =3D pdev ? pdev->max_hw_video_buf_sz : MAX_MM_VI=
DEO_SIZE;
> +
> +       /* Only YUYV */
> +       pix->pixelformat =3D V4L2_PIX_FMT_YUYV;
> +
> +       /* Defaults then clamp */
> +       w =3D (req_w ? req_w : 640);
> +       h =3D (req_h ? req_h : 480);
> +       if (w > MAX_VIDEO_HW_W)
> +               w =3D MAX_VIDEO_HW_W;
> +       if (h > MAX_VIDEO_HW_H)
> +               h =3D MAX_VIDEO_HW_H;
> +       if (!w)
> +               w =3D 640; /* hard fallback in case macros are odd */
> +       if (!h)
> +               h =3D 480;
> +
> +       /* Field policy */
> +       pix->field =3D V4L2_FIELD_NONE;
> +
> +       /* Stride policy for packed 16bpp, 64B align */
> +       min_bpl =3D ALIGN(w * 2, 64);
> +
> +       /* Bound requested bpl to something sane, then align */
> +       bpl =3D pix->bytesperline;
> +       if (bpl < min_bpl) {
> +               bpl =3D min_bpl;
> +       } else {
> +               /* Cap at 16x width to avoid silly values that overflow s=
izeimage */
> +               u32 max_bpl =3D ALIGN(w * 2 * 16, 64);
> +
> +               if (bpl > max_bpl)
> +                       bpl =3D max_bpl;
> +               bpl =3D ALIGN(bpl, 64);
> +       }
> +       if (h && max_frame) {
> +               size_t max_bpl_hw =3D max_frame / h;
> +
> +               if (max_bpl_hw < min_bpl)
> +                       return -ERANGE;
> +               max_bpl_hw =3D rounddown(max_bpl_hw, 64);
> +               if (!max_bpl_hw)
> +                       return -ERANGE;
> +               if (bpl > max_bpl_hw) {
> +                       if (pdev)
> +                               dev_dbg(&pdev->pdev->dev,
> +                                       "try_fmt: clamp bpl %u -> %zu due=
 to hw buf cap %zu\n",
> +                                       bpl, max_bpl_hw, max_frame);
> +                       bpl =3D (u32)max_bpl_hw;
> +               }
> +       }
> +       size =3D (size_t)bpl * (size_t)h;
> +       if (size > max_frame)
> +               return -ERANGE;
> +
> +       pix->width        =3D w;
> +       pix->height       =3D h;
> +       pix->bytesperline =3D bpl;
> +       pix->sizeimage    =3D (u32)size; /* logical size, not page-aligne=
d */
> +
> +       hws_set_colorimetry_fmt(pix);
> +       if (pdev)
> +               dev_dbg(&pdev->pdev->dev,
> +                       "try_fmt: w=3D%u h=3D%u bpl=3D%u size=3D%u field=
=3D%u\n",
> +                       pix->width, pix->height, pix->bytesperline,
> +                       pix->sizeimage, pix->field);
> +       return 0;
> +}
> +
> +int hws_vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_=
format *f)
> +{
> +       struct hws_video *vid =3D video_drvdata(file);
> +       int ret;
> +
> +       if (f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +               return -EINVAL;
> +
> +       /* Normalize the request */
> +       ret =3D hws_vidioc_try_fmt_vid_cap(file, priv, f);
> +       if (ret)
> +               return ret;
> +
> +       /* Don't allow buffer layout changes while buffers are queued. */
> +       if (vb2_is_busy(&vid->buffer_queue)) {
> +               if (f->fmt.pix.width  !=3D vid->pix.width  ||
> +                   f->fmt.pix.height !=3D vid->pix.height ||
> +                   f->fmt.pix.bytesperline !=3D vid->pix.bytesperline)
> +                       return -EBUSY;
> +       }
> +
> +       /* Apply to driver state */
> +       vid->pix.width        =3D f->fmt.pix.width;
> +       vid->pix.height       =3D f->fmt.pix.height;
> +       vid->pix.fourcc       =3D V4L2_PIX_FMT_YUYV;
> +       vid->pix.field        =3D f->fmt.pix.field;
> +       vid->pix.colorspace   =3D f->fmt.pix.colorspace;
> +       vid->pix.ycbcr_enc    =3D f->fmt.pix.ycbcr_enc;
> +       vid->pix.quantization =3D f->fmt.pix.quantization;
> +       vid->pix.xfer_func    =3D f->fmt.pix.xfer_func;
> +
> +       /* Update sizes (use helper if you prefer strict alignment math) =
*/
> +       vid->pix.bytesperline =3D f->fmt.pix.bytesperline; /* aligned */
> +       vid->pix.sizeimage    =3D f->fmt.pix.sizeimage;    /* logical */
> +       vid->pix.half_size    =3D hws_calc_half_size(vid->pix.sizeimage);
> +       vid->pix.interlaced   =3D false;
> +       /* S_FMT negotiates buffer layout only. Keep detector-owned DV ti=
ming
> +        * state unchanged so a harmless restart cannot clobber the live =
FPS.
> +        */
> +       /* Or:
> +        * hws_calc_sizeimage(vid, vid->pix.width, vid->pix.height, false=
);
> +        */
> +
> +       /* Refresh vb2 watermark when idle */
> +       if (!vb2_is_busy(&vid->buffer_queue))
> +               vid->alloc_sizeimage =3D PAGE_ALIGN(vid->pix.sizeimage);
> +       dev_dbg(&vid->parent->pdev->dev,
> +               "s_fmt:   w=3D%u h=3D%u bpl=3D%u size=3D%u alloc=3D%u\n",
> +               vid->pix.width, vid->pix.height, vid->pix.bytesperline,
> +               vid->pix.sizeimage, vid->alloc_sizeimage);
> +
> +       return 0;
> +}
> +
> +int hws_vidioc_g_parm(struct file *file, void *fh, struct v4l2_streampar=
m *param)
> +{
> +       struct hws_video *vid =3D video_drvdata(file);
> +       u32 fps;
> +
> +       if (param->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +               return -EINVAL;
> +
> +       fps =3D hws_get_live_fps(vid);
> +       if (!fps)
> +               fps =3D vid->current_fps ? vid->current_fps : 60;
> +
> +       /* HDMI receivers report the detected frame period, they don't se=
t it. */
> +       param->parm.capture.capability           =3D 0;
> +       param->parm.capture.capturemode          =3D 0;
> +       param->parm.capture.timeperframe.numerator   =3D 1;
> +       param->parm.capture.timeperframe.denominator =3D fps;
> +       param->parm.capture.extendedmode         =3D 0;
> +       param->parm.capture.readbuffers          =3D 0;
> +
> +       return 0;
> +}
> +
> +int hws_vidioc_enum_input(struct file *file, void *priv,
> +                         struct v4l2_input *input)
> +{
> +       struct hws_video *vid =3D video_drvdata(file);
> +
> +       if (input->index)
> +               return -EINVAL;
> +       input->type         =3D V4L2_INPUT_TYPE_CAMERA;
> +       strscpy(input->name, KBUILD_MODNAME, sizeof(input->name));
> +       input->capabilities =3D V4L2_IN_CAP_DV_TIMINGS;
> +       input->status       =3D hws_input_status(vid);
> +
> +       return 0;
> +}
> +
> +int hws_vidioc_g_input(struct file *file, void *priv, unsigned int *inde=
x)
> +{
> +       *index =3D 0;
> +       return 0;
> +}
> +
> +int hws_vidioc_s_input(struct file *file, void *priv, unsigned int i)
> +{
> +       return i ? -EINVAL : 0;
> +}
> diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.h b/drivers/media/pci/h=
ws/hws_v4l2_ioctl.h
> new file mode 100644
> index 000000000000..53044f78d6fa
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_v4l2_ioctl.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef HWS_V4L2_IOCTL_H
> +#define HWS_V4L2_IOCTL_H
> +
> +#include <media/v4l2-ctrls.h>
> +#include <linux/fs.h>
> +
> +extern const struct v4l2_ctrl_ops hws_ctrl_ops;
> +
> +int hws_vidioc_querycap(struct file *file, void *priv, struct v4l2_capab=
ility *cap);
> +int hws_vidioc_enum_fmt_vid_cap(struct file *file, void *priv_fh, struct=
 v4l2_fmtdesc *f);
> +int hws_vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fo=
rmat *fmt);
> +int hws_vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_=
format *f);
> +int hws_vidioc_g_std(struct file *file, void *priv, v4l2_std_id *tvnorms=
);
> +int hws_vidioc_s_std(struct file *file, void *priv, v4l2_std_id tvnorms)=
;
> +int hws_vidioc_g_parm(struct file *file, void *fh, struct v4l2_streampar=
m *setfps);
> +int hws_vidioc_enum_input(struct file *file, void *priv, struct v4l2_inp=
ut *i);
> +int hws_vidioc_g_input(struct file *file, void *priv, unsigned int *i);
> +int hws_vidioc_s_input(struct file *file, void *priv, unsigned int i);
> +int hws_vidioc_g_ctrl(struct file *file, void *fh, struct v4l2_control *=
a);
> +int hws_vidioc_s_ctrl(struct file *file, void *fh, struct v4l2_control *=
a);
> +int hws_vidioc_dv_timings_cap(struct file *file, void *fh,
> +                             struct v4l2_dv_timings_cap *cap);
> +int hws_vidioc_s_dv_timings(struct file *file, void *fh,
> +                           struct v4l2_dv_timings *timings);
> +
> +int hws_vidioc_queryctrl(struct file *file, void *fh, struct v4l2_queryc=
trl *a);
> +int hws_vidioc_g_dv_timings(struct file *file, void *fh,
> +                           struct v4l2_dv_timings *timings);
> +int hws_vidioc_enum_dv_timings(struct file *file, void *fh,
> +                              struct v4l2_enum_dv_timings *edv);
> +int hws_vidioc_query_dv_timings(struct file *file, void *fh,
> +                               struct v4l2_dv_timings *timings);
> +int hws_vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_=
format *f);
> +
> +#endif
> diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hw=
s_video.c
> new file mode 100644
> index 000000000000..9c81af6e7d7f
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_video.c
> @@ -0,0 +1,1506 @@
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
> +#include <linux/math64.h>
> +#include <linux/interrupt.h>
> +#include <linux/moduleparam.h>
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
> +#define HWS_REMAP_SLOT_OFF(ch)   (0x208 + (ch) * 8)    /* one 64-bit slo=
t per ch */
> +#define HWS_BUF_BASE_OFF(ch)     (CVBS_IN_BUF_BASE  + (ch) * PCIE_BARADD=
ROFSIZE)
> +#define HWS_HALF_SZ_OFF(ch)      (CVBS_IN_BUF_BASE2 + (ch) * PCIE_BARADD=
ROFSIZE)
> +
> +static void update_live_resolution(struct hws_pcie_dev *pdx, unsigned in=
t ch,
> +                                  bool interlace);
> +static bool hws_read_active_state(struct hws_pcie_dev *pdx, unsigned int=
 ch,
> +                                 bool *interlace);
> +static void handle_hwv2_path(struct hws_pcie_dev *hws, unsigned int ch);
> +static void handle_legacy_path(struct hws_pcie_dev *hws, unsigned int ch=
);
> +static u32 hws_calc_sizeimage(struct hws_video *v, u16 w, u16 h,
> +                             bool interlaced);
> +
> +/* DMA helper functions */
> +static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma=
);
> +static struct hwsvideo_buffer *
> +hws_take_queued_buffer_locked(struct hws_video *vid);
> +
> +static unsigned long long hws_elapsed_us(u64 start_ns)
> +{
> +       return div_u64(ktime_get_mono_fast_ns() - start_ns, 1000);
> +}
> +
> +static inline bool list_node_unlinked(const struct list_head *n)
> +{
> +       return n->next =3D=3D LIST_POISON1 || n->prev =3D=3D LIST_POISON2=
;
> +}
> +
> +static bool dma_window_verify;
> +module_param_named(dma_window_verify, dma_window_verify, bool, 0644);
> +MODULE_PARM_DESC(dma_window_verify,
> +                "Read back DMA window registers after programming (debug=
)");
> +
> +void hws_set_dma_doorbell(struct hws_pcie_dev *hws, unsigned int ch,
> +                         dma_addr_t dma, const char *tag)
> +{
> +       iowrite32(lower_32_bits(dma), hws->bar0_base + HWS_REG_DMA_ADDR(c=
h));
> +       dev_dbg(&hws->pdev->dev, "dma_doorbell ch%u: dma=3D0x%llx tag=3D%=
s\n", ch,
> +               (u64)dma, tag ? tag : "");
> +}
> +
> +static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma=
)
> +{
> +       const u32 addr_mask =3D PCI_E_BAR_ADD_MASK;       // 0xE0000000
> +       const u32 addr_low_mask =3D PCI_E_BAR_ADD_LOWMASK;        // 0x1F=
FFFFFF
> +       struct hws_pcie_dev *hws =3D vid->parent;
> +       unsigned int ch =3D vid->channel_index;
> +       u32 table_off =3D HWS_REMAP_SLOT_OFF(ch);
> +       u32 lo =3D lower_32_bits(dma);
> +       u32 hi =3D upper_32_bits(dma);
> +       u32 pci_addr =3D lo & addr_low_mask;      // low 29 bits inside 5=
12MB window
> +       u32 page_lo =3D lo & addr_mask;   // bits 31..29 only (page bits)
> +
> +       bool wrote =3D false;
> +
> +       /* Remap entry only when DMA crosses into a new 512 MB page */
> +       if (!vid->window_valid || vid->last_dma_hi !=3D hi ||
> +           vid->last_dma_page !=3D page_lo) {
> +               writel(hi, hws->bar0_base + PCI_ADDR_TABLE_BASE + table_o=
ff);
> +               writel(page_lo,
> +                      hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off +
> +                      PCIE_BARADDROFSIZE);
> +               vid->last_dma_hi =3D hi;
> +               vid->last_dma_page =3D page_lo;
> +               wrote =3D true;
> +       }
> +
> +       /* Base pointer only needs low 29 bits */
> +       if (!vid->window_valid || vid->last_pci_addr !=3D pci_addr) {
> +               writel((ch + 1) * PCIEBAR_AXI_BASE + pci_addr,
> +                      hws->bar0_base + HWS_BUF_BASE_OFF(ch));
> +               vid->last_pci_addr =3D pci_addr;
> +               wrote =3D true;
> +       }
> +
> +       /* Half-size only changes when resolution changes */
> +       if (!vid->window_valid || vid->last_half16 !=3D vid->pix.half_siz=
e / 16) {
> +               writel(vid->pix.half_size / 16,
> +                      hws->bar0_base + HWS_HALF_SZ_OFF(ch));
> +               vid->last_half16 =3D vid->pix.half_size / 16;
> +               wrote =3D true;
> +       }
> +
> +       vid->window_valid =3D true;
> +
> +       if (dma_window_verify && wrote) {
> +               u32 r_hi =3D
> +                   readl(hws->bar0_base + PCI_ADDR_TABLE_BASE + table_of=
f);
> +               u32 r_lo =3D
> +                   readl(hws->bar0_base + PCI_ADDR_TABLE_BASE + table_of=
f +
> +                         PCIE_BARADDROFSIZE);
> +               u32 r_base =3D readl(hws->bar0_base + HWS_BUF_BASE_OFF(ch=
));
> +               u32 r_half =3D readl(hws->bar0_base + HWS_HALF_SZ_OFF(ch)=
);
> +
> +               dev_dbg(&hws->pdev->dev,
> +                       "ch%u remap verify: hi=3D0x%08x page_lo=3D0x%08x =
exp_page=3D0x%08x base=3D0x%08x exp_base=3D0x%08x half16B=3D0x%08x exp_half=
=3D0x%08x\n",
> +                       ch, r_hi, r_lo, page_lo, r_base,
> +                       (ch + 1) * PCIEBAR_AXI_BASE + pci_addr, r_half,
> +                       vid->pix.half_size / 16);
> +       } else if (wrote) {
> +               /* Flush posted writes before arming DMA */
> +               readl_relaxed(hws->bar0_base + HWS_HALF_SZ_OFF(ch));
> +       }
> +}
> +
> +static struct hwsvideo_buffer *
> +hws_take_queued_buffer_locked(struct hws_video *vid)
> +{
> +       struct hwsvideo_buffer *buf;
> +
> +       if (!vid || list_empty(&vid->capture_queue))
> +               return NULL;
> +
> +       buf =3D list_first_entry(&vid->capture_queue,
> +                              struct hwsvideo_buffer, list);
> +       list_del_init(&buf->list);
> +       if (vid->queued_count)
> +               vid->queued_count--;
> +       return buf;
> +}
> +
> +void hws_prime_next_locked(struct hws_video *vid)
> +{
> +       struct hws_pcie_dev *hws;
> +       struct hwsvideo_buffer *next;
> +       dma_addr_t dma;
> +
> +       if (!vid)
> +               return;
> +
> +       hws =3D vid->parent;
> +       if (!hws || !hws->bar0_base)
> +               return;
> +
> +       if (!READ_ONCE(vid->cap_active) || !vid->active || vid->next_prep=
ared)
> +               return;
> +
> +       next =3D hws_take_queued_buffer_locked(vid);
> +       if (!next)
> +               return;
> +
> +       vid->next_prepared =3D next;
> +       dma =3D vb2_dma_contig_plane_dma_addr(&next->vb.vb2_buf, 0);
> +       hws_program_dma_for_addr(hws, vid->channel_index, dma);
> +       iowrite32(lower_32_bits(dma),
> +                 hws->bar0_base + HWS_REG_DMA_ADDR(vid->channel_index));
> +       dev_dbg(&hws->pdev->dev,
> +               "ch%u pre-armed next buffer %p dma=3D0x%llx\n",
> +               vid->channel_index, next, (u64)dma);
> +}
> +
> +static bool hws_force_no_signal_frame(struct hws_video *v, const char *t=
ag)
> +{
> +       struct hws_pcie_dev *hws;
> +       unsigned long flags;
> +       struct hwsvideo_buffer *buf =3D NULL, *next =3D NULL;
> +       bool have_next =3D false;
> +       bool doorbell =3D false;
> +
> +       if (!v)
> +               return false;
> +       hws =3D v->parent;
> +       if (!hws || READ_ONCE(v->stop_requested) || !READ_ONCE(v->cap_act=
ive))
> +               return false;
> +       spin_lock_irqsave(&v->irq_lock, flags);
> +       if (v->active) {
> +               buf =3D v->active;
> +               v->active =3D NULL;
> +               buf->slot =3D 0;
> +       } else if (!list_empty(&v->capture_queue)) {
> +               buf =3D list_first_entry(&v->capture_queue,
> +                                      struct hwsvideo_buffer, list);
> +               list_del_init(&buf->list);
> +               if (v->queued_count)
> +                       v->queued_count--;
> +               buf->slot =3D 0;
> +       }
> +       if (v->next_prepared) {
> +               next =3D v->next_prepared;
> +               v->next_prepared =3D NULL;
> +               next->slot =3D 0;
> +               v->active =3D next;
> +               have_next =3D true;
> +       } else if (!list_empty(&v->capture_queue)) {
> +               next =3D list_first_entry(&v->capture_queue,
> +                                       struct hwsvideo_buffer, list);
> +               list_del_init(&next->list);
> +               if (v->queued_count)
> +                       v->queued_count--;
> +               next->slot =3D 0;
> +               v->active =3D next;
> +               have_next =3D true;
> +       } else {
> +               v->active =3D NULL;
> +       }
> +       spin_unlock_irqrestore(&v->irq_lock, flags);
> +       if (!buf)
> +               return false;
> +       /* Complete buffer with a neutral frame so dequeuers keep running=
. */
> +       {
> +               struct vb2_v4l2_buffer *vb2v =3D &buf->vb;
> +               void *dst =3D vb2_plane_vaddr(&vb2v->vb2_buf, 0);
> +
> +               if (dst)
> +                       memset(dst, 0x10, v->pix.sizeimage);
> +               vb2_set_plane_payload(&vb2v->vb2_buf, 0, v->pix.sizeimage=
);
> +               vb2v->sequence =3D (u32)atomic_inc_return(&v->sequence_nu=
mber);
> +               vb2v->vb2_buf.timestamp =3D ktime_get_ns();
> +               vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
> +       }
> +       if (have_next && next) {
> +               dma_addr_t dma =3D
> +                   vb2_dma_contig_plane_dma_addr(&next->vb.vb2_buf, 0);
> +               hws_program_dma_for_addr(hws, v->channel_index, dma);
> +               hws_set_dma_doorbell(hws, v->channel_index, dma,
> +                                    tag ? tag : "nosignal_zero");
> +               doorbell =3D true;
> +       }
> +       if (doorbell) {
> +               wmb(); /* ensure descriptors visible before enabling capt=
ure */
> +               hws_enable_video_capture(hws, v->channel_index, true);
> +       }
> +       return true;
> +}
> +
> +static int hws_ctrls_init(struct hws_video *vid)
> +{
> +       struct v4l2_ctrl_handler *hdl =3D &vid->control_handler;
> +
> +       /* Create BCHS controls. */
> +       v4l2_ctrl_handler_init(hdl, 4);
> +
> +       vid->ctrl_brightness =3D v4l2_ctrl_new_std(hdl, &hws_ctrl_ops,
> +                                                V4L2_CID_BRIGHTNESS,
> +                                                MIN_VAMP_BRIGHTNESS_UNIT=
S,
> +                                                MAX_VAMP_BRIGHTNESS_UNIT=
S, 1,
> +                                                HWS_BRIGHTNESS_DEFAULT);
> +
> +       vid->ctrl_contrast =3D
> +           v4l2_ctrl_new_std(hdl, &hws_ctrl_ops, V4L2_CID_CONTRAST,
> +                             MIN_VAMP_CONTRAST_UNITS, MAX_VAMP_CONTRAST_=
UNITS,
> +                             1, HWS_CONTRAST_DEFAULT);
> +
> +       vid->ctrl_saturation =3D v4l2_ctrl_new_std(hdl, &hws_ctrl_ops,
> +                                                V4L2_CID_SATURATION,
> +                                                MIN_VAMP_SATURATION_UNIT=
S,
> +                                                MAX_VAMP_SATURATION_UNIT=
S, 1,
> +                                                HWS_SATURATION_DEFAULT);
> +
> +       vid->ctrl_hue =3D v4l2_ctrl_new_std(hdl, &hws_ctrl_ops, V4L2_CID_=
HUE,
> +                                         MIN_VAMP_HUE_UNITS,
> +                                         MAX_VAMP_HUE_UNITS, 1,
> +                                         HWS_HUE_DEFAULT);
> +       if (hdl->error) {
> +               int err =3D hdl->error;
> +
> +               v4l2_ctrl_handler_free(hdl);
> +               return err;
> +       }
> +       return 0;
> +}
> +
> +int hws_video_init_channel(struct hws_pcie_dev *pdev, int ch)
> +{
> +       struct hws_video *vid;
> +
> +       /* basic sanity */
> +       if (!pdev || ch < 0 || ch >=3D pdev->max_channels)
> +               return -EINVAL;
> +
> +       vid =3D &pdev->video[ch];
> +
> +       /* hard reset the per-channel struct (safe here since we init eve=
rything next) */
> +       memset(vid, 0, sizeof(*vid));
> +
> +       /* identity */
> +       vid->parent =3D pdev;
> +       vid->channel_index =3D ch;
> +
> +       /* locks & lists */
> +       mutex_init(&vid->state_lock);
> +       spin_lock_init(&vid->irq_lock);
> +       INIT_LIST_HEAD(&vid->capture_queue);
> +       atomic_set(&vid->sequence_number, 0);
> +       vid->active =3D NULL;
> +
> +       /* DMA watchdog removed; retain counters for diagnostics */
> +       vid->timeout_count =3D 0;
> +       vid->error_count =3D 0;
> +
> +       vid->queued_count =3D 0;
> +       vid->window_valid =3D false;
> +
> +       /* default format (adjust to your HW) */
> +       vid->pix.width =3D 1920;
> +       vid->pix.height =3D 1080;
> +       vid->pix.fourcc =3D V4L2_PIX_FMT_YUYV;
> +       vid->pix.bytesperline =3D ALIGN(vid->pix.width * 2, 64);
> +       vid->pix.sizeimage =3D vid->pix.bytesperline * vid->pix.height;
> +       vid->pix.field =3D V4L2_FIELD_NONE;
> +       vid->pix.colorspace =3D V4L2_COLORSPACE_REC709;
> +       vid->pix.ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> +       vid->pix.quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +       vid->pix.xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> +       vid->pix.interlaced =3D false;
> +       vid->pix.half_size =3D vid->pix.sizeimage / 2;
> +       vid->alloc_sizeimage =3D vid->pix.sizeimage;
> +       hws_set_current_dv_timings(vid, vid->pix.width,
> +                                  vid->pix.height, vid->pix.interlaced);
> +       vid->current_fps =3D 60;
> +
> +       /* color controls default (mid-scale) */
> +       vid->current_brightness =3D 0x80;
> +       vid->current_contrast =3D 0x80;
> +       vid->current_saturation =3D 0x80;
> +       vid->current_hue =3D 0x80;
> +
> +       /* capture state */
> +       vid->cap_active =3D false;
> +       vid->stop_requested =3D false;
> +       vid->last_buf_half_toggle =3D 0;
> +       vid->half_seen =3D false;
> +       vid->signal_loss_cnt =3D 0;
> +
> +       /* Create BCHS + DV power-present as modern controls */
> +       {
> +               int err =3D hws_ctrls_init(vid);
> +
> +               if (err) {
> +                       dev_err(&pdev->pdev->dev,
> +                               "v4l2 ctrl init failed on ch%d: %d\n", ch=
, err);
> +                       return err;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static void hws_video_drain_queue_locked(struct hws_video *vid)
> +{
> +       /* Return in-flight first */
> +       if (vid->active) {
> +               vb2_buffer_done(&vid->active->vb.vb2_buf, VB2_BUF_STATE_E=
RROR);
> +               vid->active =3D NULL;
> +       }
> +
> +       /* Then everything queued */
> +       while (!list_empty(&vid->capture_queue)) {
> +               struct hwsvideo_buffer *b =3D
> +                   list_first_entry(&vid->capture_queue,
> +                                    struct hwsvideo_buffer,
> +                                    list);
> +               list_del_init(&b->list);
> +               vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +       }
> +}
> +
> +static void hws_video_release_registration(struct hws_video *vid)
> +{
> +       if (vid->buffer_queue.ops) {
> +               vb2_queue_release(&vid->buffer_queue);
> +               vid->buffer_queue.ops =3D NULL;
> +       }
> +
> +       if (!vid->video_device)
> +               return;
> +
> +       if (video_is_registered(vid->video_device))
> +               vb2_video_unregister_device(vid->video_device);
> +       else
> +               video_device_release(vid->video_device);
> +       vid->video_device =3D NULL;
> +}
> +
> +static void hws_video_collect_done_locked(struct hws_video *vid,
> +                                         struct list_head *done)
> +{
> +       struct hwsvideo_buffer *b;
> +
> +       if (vid->active) {
> +               if (!list_node_unlinked(&vid->active->list)) {
> +                       list_move_tail(&vid->active->list, done);
> +               } else {
> +                       INIT_LIST_HEAD(&vid->active->list);
> +                       list_add_tail(&vid->active->list, done);
> +               }
> +               vid->active =3D NULL;
> +       }
> +
> +       if (vid->next_prepared) {
> +               if (!list_node_unlinked(&vid->next_prepared->list)) {
> +                       list_move_tail(&vid->next_prepared->list, done);
> +               } else {
> +                       INIT_LIST_HEAD(&vid->next_prepared->list);
> +                       list_add_tail(&vid->next_prepared->list, done);
> +               }
> +               vid->next_prepared =3D NULL;
> +       }
> +
> +       while (!list_empty(&vid->capture_queue)) {
> +               b =3D list_first_entry(&vid->capture_queue, struct hwsvid=
eo_buffer,
> +                                    list);
> +               list_move_tail(&b->list, done);
> +       }
> +
> +       vid->queued_count =3D 0;
> +}
> +
> +void hws_video_cleanup_channel(struct hws_pcie_dev *pdev, int ch)
> +{
> +       struct hws_video *vid;
> +       unsigned long flags;
> +
> +       if (!pdev || ch < 0 || ch >=3D pdev->max_channels)
> +               return;
> +
> +       vid =3D &pdev->video[ch];
> +
> +       /* 1) Stop HW best-effort for this channel */
> +       hws_enable_video_capture(vid->parent, vid->channel_index, false);
> +
> +       /* 2) Flip software state so IRQ/BH will be no-ops if they run */
> +       WRITE_ONCE(vid->stop_requested, true);
> +       WRITE_ONCE(vid->cap_active, false);
> +
> +       /* 3) Ensure the IRQ handler finished any in-flight completions *=
/
> +       if (vid->parent && vid->parent->irq >=3D 0)
> +               synchronize_irq(vid->parent->irq);
> +
> +       /* 4) Drain SW capture queue & in-flight under lock */
> +       spin_lock_irqsave(&vid->irq_lock, flags);
> +       hws_video_drain_queue_locked(vid);
> +       spin_unlock_irqrestore(&vid->irq_lock, flags);
> +
> +       /* 5) Release VB2 queue if initialized */
> +       hws_video_release_registration(vid);
> +
> +       /* 6) Free V4L2 controls */
> +       v4l2_ctrl_handler_free(&vid->control_handler);
> +
> +       /* 8) Reset simple state (don=E2=80=99t memset the whole struct h=
ere) */
> +       mutex_destroy(&vid->state_lock);
> +       INIT_LIST_HEAD(&vid->capture_queue);
> +       vid->active =3D NULL;
> +       vid->stop_requested =3D false;
> +       vid->last_buf_half_toggle =3D 0;
> +       vid->half_seen =3D false;
> +       vid->signal_loss_cnt =3D 0;
> +}
> +
> +/* Convenience cast */
> +static inline struct hwsvideo_buffer *to_hwsbuf(struct vb2_buffer *vb)
> +{
> +       return container_of(to_vb2_v4l2_buffer(vb), struct hwsvideo_buffe=
r, vb);
> +}
> +
> +static int hws_buf_init(struct vb2_buffer *vb)
> +{
> +       struct hwsvideo_buffer *b =3D to_hwsbuf(vb);
> +
> +       INIT_LIST_HEAD(&b->list);
> +       return 0;
> +}
> +
> +static void hws_buf_finish(struct vb2_buffer *vb)
> +{
> +       /* vb2 core handles cache maintenance for dma-contig buffers */
> +       (void)vb;
> +}
> +
> +static void hws_buf_cleanup(struct vb2_buffer *vb)
> +{
> +       struct hwsvideo_buffer *b =3D to_hwsbuf(vb);
> +
> +       if (!list_empty(&b->list))
> +               list_del_init(&b->list);
> +}
> +
> +void hws_program_dma_for_addr(struct hws_pcie_dev *hws, unsigned int ch,
> +                             dma_addr_t dma)
> +{
> +       struct hws_video *vid =3D &hws->video[ch];
> +
> +       hws_program_dma_window(vid, dma);
> +}
> +
> +void hws_enable_video_capture(struct hws_pcie_dev *hws, unsigned int cha=
n,
> +                             bool on)
> +{
> +       u32 status;
> +
> +       if (!hws || hws->pci_lost || chan >=3D hws->max_channels)
> +               return;
> +
> +       status =3D readl(hws->bar0_base + HWS_REG_VCAP_ENABLE);
> +       status =3D on ? (status | BIT(chan)) : (status & ~BIT(chan));
> +       writel(status, hws->bar0_base + HWS_REG_VCAP_ENABLE);
> +       (void)readl(hws->bar0_base + HWS_REG_VCAP_ENABLE);
> +
> +       WRITE_ONCE(hws->video[chan].cap_active, on);
> +
> +       dev_dbg(&hws->pdev->dev, "vcap %s ch%u (reg=3D0x%08x)\n",
> +               on ? "ON" : "OFF", chan, status);
> +}
> +
> +static void hws_seed_dma_windows(struct hws_pcie_dev *hws)
> +{
> +       const u32 addr_mask =3D PCI_E_BAR_ADD_MASK;
> +       const u32 addr_low_mask =3D PCI_E_BAR_ADD_LOWMASK;
> +       u32 table =3D 0x208;      /* one 64-bit entry per channel */
> +       unsigned int ch;
> +
> +       if (!hws || !hws->bar0_base)
> +               return;
> +
> +       /* If cur_max_video_ch isn=E2=80=99t set yet, default to max_chan=
nels */
> +       if (!hws->cur_max_video_ch || hws->cur_max_video_ch > hws->max_ch=
annels)
> +               hws->cur_max_video_ch =3D hws->max_channels;
> +
> +       for (ch =3D 0; ch < hws->cur_max_video_ch; ch++, table +=3D 8) {
> +               if (!hws->scratch_vid[ch].cpu)
> +                       continue;
> +
> +               /* Program 64-bit BAR remap entry for this channel */
> +               {
> +                       dma_addr_t p =3D hws->scratch_vid[ch].dma;
> +                       u32 lo =3D lower_32_bits(p) & addr_mask;
> +                       u32 hi =3D upper_32_bits(p);
> +                       u32 pci_addr_low =3D lower_32_bits(p) & addr_low_=
mask;
> +
> +                       writel_relaxed(hi,
> +                                      hws->bar0_base + PCI_ADDR_TABLE_BA=
SE +
> +                                      table);
> +                       writel_relaxed(lo,
> +                                      hws->bar0_base + PCI_ADDR_TABLE_BA=
SE +
> +                                      table + PCIE_BARADDROFSIZE);
> +
> +                       /* Per-channel AXI base + PCI low */
> +                       writel_relaxed((ch + 1) * PCIEBAR_AXI_BASE +
> +                                      pci_addr_low,
> +                                      hws->bar0_base + CVBS_IN_BUF_BASE =
+
> +                                      ch * PCIE_BARADDROFSIZE);
> +
> +                       /* Half-frame length in /16 units.
> +                        * Prefer the current channel=E2=80=99s computed =
half_size if available.
> +                        * Fall back to half of the probe-owned scratch b=
uffer.
> +                        */
> +                       {
> +                               u32 half_bytes =3D hws->video[ch].pix.hal=
f_size ?
> +                                   hws->video[ch].pix.half_size :
> +                                   (u32)(hws->scratch_vid[ch].size / 2);
> +                               writel_relaxed(half_bytes / 16,
> +                                              hws->bar0_base +
> +                                              CVBS_IN_BUF_BASE2 +
> +                                              ch * PCIE_BARADDROFSIZE);
> +                       }
> +               }
> +       }
> +
> +       /* Post writes so device sees them before we move on */
> +       (void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
> +}
> +
> +static void hws_ack_all_irqs(struct hws_pcie_dev *hws)
> +{
> +       u32 st =3D readl(hws->bar0_base + HWS_REG_INT_STATUS);
> +
> +       if (st) {
> +               writel(st, hws->bar0_base + HWS_REG_INT_STATUS);        /=
* W1C */
> +               (void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
> +       }
> +}
> +
> +static void hws_open_irq_fabric(struct hws_pcie_dev *hws)
> +{
> +       /* Route all sources to vector 0 (same value you=E2=80=99re alrea=
dy using) */
> +       writel(0x00000000, hws->bar0_base + PCIE_INT_DEC_REG_BASE);
> +       (void)readl(hws->bar0_base + PCIE_INT_DEC_REG_BASE);
> +
> +       /* Turn on the bridge if your IP needs it */
> +       writel(0x00000001, hws->bar0_base + PCIEBR_EN_REG_BASE);
> +       (void)readl(hws->bar0_base + PCIEBR_EN_REG_BASE);
> +
> +       /* Open the global/bridge gate (legacy 0x3FFFF) */
> +       writel(HWS_INT_EN_MASK, hws->bar0_base + INT_EN_REG_BASE);
> +       (void)readl(hws->bar0_base + INT_EN_REG_BASE);
> +}
> +
> +void hws_init_video_sys(struct hws_pcie_dev *hws, bool enable)
> +{
> +       int i;
> +
> +       if (hws->start_run && !enable)
> +               return;
> +
> +       /* 1) reset the decoder mode register to 0 */
> +       writel(0x00000000, hws->bar0_base + HWS_REG_DEC_MODE);
> +       hws_seed_dma_windows(hws);
> +
> +       /* 3) on a full reset, clear all per-channel status and indices *=
/
> +       if (!enable) {
> +               for (i =3D 0; i < hws->max_channels; i++) {
> +                       /* helpers to arm/disable capture engines */
> +                       hws_enable_video_capture(hws, i, false);
> +               }
> +       }
> +
> +       /* 4) =E2=80=9CStart run=E2=80=9D: set bit31, wait a bit, then pr=
ogram low 24 bits */
> +       writel(0x80000000, hws->bar0_base + HWS_REG_DEC_MODE);
> +       // udelay(500);
> +       writel(0x80FFFFFF, hws->bar0_base + HWS_REG_DEC_MODE);
> +       writel(0x13, hws->bar0_base + HWS_REG_DEC_MODE);
> +       hws_ack_all_irqs(hws);
> +       hws_open_irq_fabric(hws);
> +       /* 6) record that we're now running */
> +       hws->start_run =3D true;
> +}
> +
> +int hws_check_card_status(struct hws_pcie_dev *hws)
> +{
> +       u32 status;
> +
> +       if (!hws || !hws->bar0_base)
> +               return -ENODEV;
> +
> +       status =3D readl(hws->bar0_base + HWS_REG_SYS_STATUS);
> +
> +       /* Common =E2=80=9Cdevice missing=E2=80=9D pattern */
> +       if (status =3D=3D 0xFFFFFFFF) {
> +               hws->pci_lost =3D true;
> +               dev_err(&hws->pdev->dev, "PCIe device not responding\n");
> +               return -ENODEV;
> +       }
> +
> +       /* If RUN/READY bit (bit0) isn=E2=80=99t set, (re)initialize the =
video core */
> +       if (!(status & BIT(0))) {
> +               dev_dbg(&hws->pdev->dev,
> +                       "SYS_STATUS not ready (0x%08x), reinitializing\n"=
,
> +                       status);
> +               hws_init_video_sys(hws, true);
> +               /* Optional: verify the core cleared its busy bit, if you=
 have one */
> +               /* int ret =3D hws_check_busy(hws); */
> +               /* if (ret) return ret; */
> +       }
> +
> +       return 0;
> +}
> +
> +void check_video_format(struct hws_pcie_dev *pdx)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < pdx->cur_max_video_ch; i++) {
> +               bool interlace =3D false;
> +
> +               if (!hws_read_active_state(pdx, i, &interlace)) {
> +                       /* No active video; optionally feed neutral frame=
s to keep streaming. */
> +                       if (pdx->video[i].signal_loss_cnt =3D=3D 0)
> +                               pdx->video[i].signal_loss_cnt =3D 1;
> +                       if (READ_ONCE(pdx->video[i].cap_active))
> +                               hws_force_no_signal_frame(&pdx->video[i],
> +                                                         "monitor_nosign=
al");
> +               } else {
> +                       if (pdx->hw_ver > 0)
> +                               handle_hwv2_path(pdx, i);
> +                       else
> +                               /* Legacy path stub; see handle_legacy_pa=
th() comment. */
> +                               handle_legacy_path(pdx, i);
> +
> +                       update_live_resolution(pdx, i, interlace);
> +                       pdx->video[i].signal_loss_cnt =3D 0;
> +               }
> +       }
> +}
> +
> +static inline void hws_write_if_diff(struct hws_pcie_dev *hws, u32 reg_o=
ff,
> +                                    u32 new_val)
> +{
> +       void __iomem *addr;
> +       u32 old;
> +
> +       if (!hws || !hws->bar0_base)
> +               return;
> +
> +       addr =3D hws->bar0_base + reg_off;
> +
> +       old =3D readl(addr);
> +       /* Treat all-ones as device gone; avoid writing garbage. */
> +       if (old =3D=3D 0xFFFFFFFF) {
> +               hws->pci_lost =3D true;
> +               return;
> +       }
> +
> +       if (old !=3D new_val) {
> +               writel(new_val, addr);
> +               /* Post the write on some bridges / enforce ordering. */
> +               (void)readl(addr);
> +       }
> +}
> +
> +static bool hws_read_active_state(struct hws_pcie_dev *pdx, unsigned int=
 ch,
> +                                 bool *interlace)
> +{
> +       u32 reg;
> +       bool active;
> +
> +       if (ch >=3D pdx->cur_max_video_ch)
> +               return false;
> +
> +       reg =3D readl(pdx->bar0_base + HWS_REG_ACTIVE_STATUS);
> +       active =3D !!(reg & BIT(ch));
> +       if (interlace)
> +               *interlace =3D !!(reg & BIT(8 + ch));
> +       return active;
> +}
> +
> +/* Modern hardware path: keep HW registers in sync with current per-chan=
nel
> + * software state. Adjust the OUT_* bits below to match your HW contract=
.
> + */
> +static void handle_hwv2_path(struct hws_pcie_dev *hws, unsigned int ch)
> +{
> +       struct hws_video *vid;
> +       u32 reg, in_fps, cur_out_res, want_out_res;
> +
> +       if (!hws || !hws->bar0_base || ch >=3D hws->max_channels)
> +               return;
> +
> +       vid =3D &hws->video[ch];
> +
> +       /* 1) Input frame rate (read-only; log or export via debugfs if w=
anted) */
> +       in_fps =3D readl(hws->bar0_base + HWS_REG_FRAME_RATE(ch));
> +       /* dev_dbg(&hws->pdev->dev, "ch%u input fps=3D%u\n", ch, in_fps);=
 */
> +       (void)in_fps;
> +
> +       /* 2) Output resolution programming
> +        * If your HW expects a separate =E2=80=9Cscaled=E2=80=9D size, a=
dd fields to track it.
> +        * For now, mirror the current format (fmt_curr) to OUT_RES.
> +        */
> +       want_out_res =3D (vid->pix.height << 16) | vid->pix.width;
> +       cur_out_res =3D readl(hws->bar0_base + HWS_REG_OUT_RES(ch));
> +       if (cur_out_res !=3D want_out_res)
> +               hws_write_if_diff(hws, HWS_REG_OUT_RES(ch), want_out_res)=
;
> +
> +       /* 3) Output FPS: only program if you actually track a target.
> +        * Example heuristic (disabled by default):
> +        *
> +        *   u32 out_fps =3D (vid->fmt_curr.height >=3D 1080) ? 60 : 30;
> +        *   hws_write_if_diff(hws, HWS_REG_OUT_FRAME_RATE(ch), out_fps);
> +        */
> +
> +       /* 4) BCHS controls: pack from per-channel current_* fields */
> +       reg =3D readl(hws->bar0_base + HWS_REG_BCHS(ch));
> +       {
> +               u8 br =3D reg & 0xFF;
> +               u8 co =3D (reg >> 8) & 0xFF;
> +               u8 hu =3D (reg >> 16) & 0xFF;
> +               u8 sa =3D (reg >> 24) & 0xFF;
> +
> +               if (br !=3D vid->current_brightness ||
> +                   co !=3D vid->current_contrast || hu !=3D vid->current=
_hue ||
> +                   sa !=3D vid->current_saturation) {
> +                       u32 packed =3D (vid->current_saturation << 24) |
> +                           (vid->current_hue << 16) |
> +                           (vid->current_contrast << 8) |
> +                           vid->current_brightness;
> +                       hws_write_if_diff(hws, HWS_REG_BCHS(ch), packed);
> +               }
> +       }
> +
> +       /* 5) HDCP detect: read only (no cache field in your structs toda=
y) */
> +       reg =3D readl(hws->bar0_base + HWS_REG_HDCP_STATUS);
> +       /* bool hdcp =3D !!(reg & BIT(ch)); // use if you later add a fie=
ld/control */
> +}
> +
> +static void handle_legacy_path(struct hws_pcie_dev *hws, unsigned int ch=
)
> +{
> +       /*
> +        * Legacy (hw_ver =3D=3D 0) expected behavior:
> +        * - A per-channel SW FPS accumulator incremented on each VDONE.
> +        * - A once-per-second poll mapped the count to discrete FPS:
> +        *   >55*2 =3D> 60, >45*2 =3D> 50, >25*2 =3D> 30, >20*2 =3D> 25, =
else 60,
> +        *   then reset the accumulator to 0.
> +        * - The *2 factor assumed VDONE fired per-field; if legacy VDONE=
 is
> +        *   per-frame, drop the factor.
> +        *
> +        * Current code keeps this path as a no-op; vid->current_fps stay=
s at the
> +        * default or mode-derived value. If accurate legacy FPS reportin=
g is
> +        * needed (V4L2 g_parm/timeperframe), reintroduce the accumulator=
 in the
> +        * IRQ path and perform the mapping/reset here.
> +        *
> +        * No-op by default. If you introduce a SW FPS accumulator, map i=
t here.
> +        *
> +        * Example skeleton:
> +        *
> +        *   u32 sw_rate =3D READ_ONCE(hws->sw_fps[ch]); // incremented e=
lsewhere
> +        *   if (sw_rate > THRESHOLD) {
> +        *       u32 fps =3D pick_fps_from_rate(sw_rate);
> +        *       hws_write_if_diff(hws, HWS_REG_OUT_FRAME_RATE(ch), fps);
> +        *       WRITE_ONCE(hws->sw_fps[ch], 0);
> +        *   }
> +        */
> +       (void)hws;
> +       (void)ch;
> +}
> +
> +static void hws_video_apply_mode_change(struct hws_pcie_dev *pdx,
> +                                       unsigned int ch, u16 w, u16 h,
> +                                       bool interlaced, u32 fps)
> +{
> +       struct hws_video *v =3D &pdx->video[ch];
> +       unsigned long flags;
> +       u32 new_size;
> +       bool queue_busy;
> +       bool geometry_changed;
> +       struct list_head done;
> +       struct hwsvideo_buffer *b, *tmp;
> +
> +       if (!pdx || !pdx->bar0_base)
> +               return;
> +       if (ch >=3D pdx->max_channels)
> +               return;
> +       if (!w || !h || w > MAX_VIDEO_HW_W ||
> +           (!interlaced && h > MAX_VIDEO_HW_H) ||
> +           (interlaced && (h * 2) > MAX_VIDEO_HW_H))
> +               return;
> +       if (!fps || fps =3D=3D 0xFFFFFFFF || fps > 240)
> +               fps =3D (h =3D=3D 576) ? 50 : 60;
> +
> +       geometry_changed =3D w !=3D v->pix.width || h !=3D v->pix.height =
||
> +               interlaced !=3D v->pix.interlaced;
> +       if (!geometry_changed && fps =3D=3D v->current_fps)
> +               return;
> +
> +       if (!geometry_changed) {
> +               /* Refresh cached live timing state, but don't emit a res=
olution
> +                * change event when only the frame rate changes.
> +                */
> +               mutex_lock(&v->state_lock);
> +               v->pix.interlaced =3D interlaced;
> +               v->pix.field =3D interlaced ? V4L2_FIELD_INTERLACED :
> +                                           V4L2_FIELD_NONE;
> +               hws_set_current_dv_timings(v, w, h, interlaced);
> +               v->current_fps =3D fps;
> +               mutex_unlock(&v->state_lock);
> +               return;
> +       }
> +
> +       if (!mutex_trylock(&v->state_lock))
> +               return;
> +
> +       INIT_LIST_HEAD(&done);
> +       queue_busy =3D vb2_is_busy(&v->buffer_queue);
> +
> +       WRITE_ONCE(v->stop_requested, true);
> +       WRITE_ONCE(v->cap_active, false);
> +       /* Publish software stop first so the IRQ completion path sees th=
e stop
> +        * before we touch MMIO or the lists. Pairs with READ_ONCE() chec=
ks in the
> +        * VDONE handler and hws_arm_next() to prevent completions while =
modes
> +        * change.
> +        */
> +       smp_wmb();
> +
> +       hws_enable_video_capture(pdx, ch, false);
> +       readl(pdx->bar0_base + HWS_REG_INT_STATUS);
> +
> +       if (v->parent && v->parent->irq >=3D 0)
> +               synchronize_irq(v->parent->irq);
> +
> +       spin_lock_irqsave(&v->irq_lock, flags);
> +       hws_video_collect_done_locked(v, &done);
> +       spin_unlock_irqrestore(&v->irq_lock, flags);
> +
> +       /* Update software pixel state */
> +       v->pix.width =3D w;
> +       v->pix.height =3D h;
> +       v->pix.interlaced =3D interlaced;
> +       hws_set_current_dv_timings(v, w, h, interlaced);
> +       v->current_fps =3D fps;
> +
> +       new_size =3D hws_calc_sizeimage(v, w, h, interlaced);
> +       v->window_valid =3D false;
> +
> +       /* Geometry changes require userspace renegotiation once buffers =
exist.
> +        * Emit SOURCE_CHANGE, mark the queue in error, and let userspace
> +        * STREAMOFF/REQBUFS/STREAMON rather than trying to restart captu=
re
> +        * with partially drained in-flight state.
> +        */
> +       if (queue_busy) {
> +               struct v4l2_event ev =3D {
> +                       .type =3D V4L2_EVENT_SOURCE_CHANGE,
> +               };
> +
> +               ev.u.src_change.changes =3D V4L2_EVENT_SRC_CH_RESOLUTION;
> +               v4l2_event_queue(v->video_device, &ev);
> +               vb2_queue_error(&v->buffer_queue);
> +       } else {
> +               v->alloc_sizeimage =3D PAGE_ALIGN(new_size);
> +               WRITE_ONCE(v->stop_requested, false);
> +       }
> +
> +       /* Program HW with new resolution */
> +       hws_write_if_diff(pdx, HWS_REG_OUT_RES(ch), (h << 16) | w);
> +
> +       /* Legacy half-buffer programming */
> +       writel(v->pix.half_size / 16,
> +              pdx->bar0_base + CVBS_IN_BUF_BASE2 + ch * PCIE_BARADDROFSI=
ZE);
> +       (void)readl(pdx->bar0_base + CVBS_IN_BUF_BASE2 +
> +                   ch * PCIE_BARADDROFSIZE);
> +
> +       /* Reset per-channel toggles/counters */
> +       WRITE_ONCE(v->last_buf_half_toggle, 0);
> +       atomic_set(&v->sequence_number, 0);
> +
> +       mutex_unlock(&v->state_lock);
> +
> +       list_for_each_entry_safe(b, tmp, &done, list) {
> +               list_del_init(&b->list);
> +               vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +       }
> +}
> +
> +static void update_live_resolution(struct hws_pcie_dev *pdx, unsigned in=
t ch,
> +                                  bool interlace)
> +{
> +       u32 reg =3D readl(pdx->bar0_base + HWS_REG_IN_RES(ch));
> +       u32 fps =3D readl(pdx->bar0_base + HWS_REG_FRAME_RATE(ch));
> +       u16 res_w =3D reg & 0xFFFF;
> +       u16 res_h =3D (reg >> 16) & 0xFFFF;
> +       struct hws_video *vid =3D &pdx->video[ch];
> +       bool geometry_changed;
> +       bool fps_changed;
> +
> +       bool within_hw =3D (res_w <=3D MAX_VIDEO_HW_W) &&
> +           ((!interlace && res_h <=3D MAX_VIDEO_HW_H) ||
> +            (interlace && (res_h * 2) <=3D MAX_VIDEO_HW_H));
> +
> +       if (!within_hw)
> +               return;
> +
> +       geometry_changed =3D res_w !=3D vid->pix.width ||
> +               res_h !=3D vid->pix.height ||
> +               interlace !=3D vid->pix.interlaced;
> +       fps_changed =3D fps && fps !=3D 0xFFFFFFFF && fps <=3D 240 &&
> +               fps !=3D vid->current_fps;
> +
> +       if (geometry_changed || fps_changed)
> +               hws_video_apply_mode_change(pdx, ch, res_w, res_h, interl=
ace,
> +                                           fps);
> +}
> +
> +static int hws_open(struct file *file)
> +{
> +       return v4l2_fh_open(file);
> +}
> +
> +static const struct v4l2_file_operations hws_fops =3D {
> +       .owner =3D THIS_MODULE,
> +       .open =3D hws_open,
> +       .release =3D vb2_fop_release,
> +       .poll =3D vb2_fop_poll,
> +       .unlocked_ioctl =3D video_ioctl2,
> +       .mmap =3D vb2_fop_mmap,
> +};
> +
> +static int hws_subscribe_event(struct v4l2_fh *fh,
> +                              const struct v4l2_event_subscription *sub)
> +{
> +       switch (sub->type) {
> +       case V4L2_EVENT_SOURCE_CHANGE:
> +               return v4l2_src_change_event_subscribe(fh, sub);
> +       case V4L2_EVENT_CTRL:
> +               return v4l2_ctrl_subscribe_event(fh, sub);
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static const struct v4l2_ioctl_ops hws_ioctl_fops =3D {
> +       /* Core caps/info */
> +       .vidioc_querycap =3D hws_vidioc_querycap,
> +
> +       /* Pixel format: still needed to report YUYV etc. */
> +       .vidioc_enum_fmt_vid_cap =3D hws_vidioc_enum_fmt_vid_cap,
> +       .vidioc_g_fmt_vid_cap =3D hws_vidioc_g_fmt_vid_cap,
> +       .vidioc_s_fmt_vid_cap =3D hws_vidioc_s_fmt_vid_cap,
> +       .vidioc_try_fmt_vid_cap =3D hws_vidioc_try_fmt_vid_cap,
> +
> +       /* Buffer queueing / streaming */
> +       .vidioc_reqbufs =3D vb2_ioctl_reqbufs,
> +       .vidioc_prepare_buf =3D vb2_ioctl_prepare_buf,
> +       .vidioc_create_bufs =3D vb2_ioctl_create_bufs,
> +       .vidioc_querybuf =3D vb2_ioctl_querybuf,
> +       .vidioc_qbuf =3D vb2_ioctl_qbuf,
> +       .vidioc_dqbuf =3D vb2_ioctl_dqbuf,
> +       .vidioc_expbuf =3D vb2_ioctl_expbuf,
> +       .vidioc_streamon =3D vb2_ioctl_streamon,
> +       .vidioc_streamoff =3D vb2_ioctl_streamoff,
> +
> +       /* Inputs */
> +       .vidioc_enum_input =3D hws_vidioc_enum_input,
> +       .vidioc_g_input =3D hws_vidioc_g_input,
> +       .vidioc_s_input =3D hws_vidioc_s_input,
> +
> +       /* DV timings (HDMI/DVI/VESA modes) */
> +       .vidioc_query_dv_timings =3D hws_vidioc_query_dv_timings,
> +       .vidioc_enum_dv_timings =3D hws_vidioc_enum_dv_timings,
> +       .vidioc_g_dv_timings =3D hws_vidioc_g_dv_timings,
> +       .vidioc_s_dv_timings =3D hws_vidioc_s_dv_timings,
> +       .vidioc_dv_timings_cap =3D hws_vidioc_dv_timings_cap,
> +
> +       .vidioc_log_status =3D v4l2_ctrl_log_status,
> +       .vidioc_subscribe_event =3D hws_subscribe_event,
> +       .vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
> +       .vidioc_g_parm =3D hws_vidioc_g_parm,
> +};
> +
> +static u32 hws_calc_sizeimage(struct hws_video *v, u16 w, u16 h,
> +                             bool interlaced)
> +{
> +       /* example for packed 16bpp (YUYV); replace with your real math/a=
lign */
> +       u32 lines =3D h;          /* full frame lines for sizeimage */
> +       u32 bytesperline =3D ALIGN(w * 2, 64);
> +       u32 sizeimage, half0;
> +
> +       /* publish into pix, since we now carry these in-state */
> +       v->pix.bytesperline =3D bytesperline;
> +       sizeimage =3D bytesperline * lines;
> +
> +       half0 =3D sizeimage / 2;
> +
> +       v->pix.sizeimage =3D sizeimage;
> +       v->pix.half_size =3D half0;       /* first half; second =3D sizei=
mage - half0 */
> +       v->pix.field =3D interlaced ? V4L2_FIELD_INTERLACED : V4L2_FIELD_=
NONE;
> +
> +       return v->pix.sizeimage;
> +}
> +
> +static int hws_queue_setup(struct vb2_queue *q, unsigned int *num_buffer=
s,
> +                          unsigned int *nplanes, unsigned int sizes[],
> +                          struct device *alloc_devs[])
> +{
> +       struct hws_video *vid =3D q->drv_priv;
> +
> +       (void)num_buffers;
> +       (void)alloc_devs;
> +
> +       if (!vid->pix.sizeimage) {
> +               vid->pix.bytesperline =3D ALIGN(vid->pix.width * 2, 64);
> +               vid->pix.sizeimage =3D vid->pix.bytesperline * vid->pix.h=
eight;
> +       }
> +       if (*nplanes) {
> +               if (sizes[0] < vid->pix.sizeimage)
> +                       return -EINVAL;
> +       } else {
> +               *nplanes =3D 1;
> +               sizes[0] =3D PAGE_ALIGN(vid->pix.sizeimage);
> +       }
> +
> +       vid->alloc_sizeimage =3D PAGE_ALIGN(vid->pix.sizeimage);
> +       return 0;
> +}
> +
> +static int hws_buffer_prepare(struct vb2_buffer *vb)
> +{
> +       struct hws_video *vid =3D vb->vb2_queue->drv_priv;
> +       struct hws_pcie_dev *hws =3D vid->parent;
> +       size_t need =3D vid->pix.sizeimage;
> +       dma_addr_t dma_addr;
> +
> +       if (vb2_plane_size(vb, 0) < need)
> +               return -EINVAL;
> +
> +       /* Validate DMA address alignment */
> +       dma_addr =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> +       if (dma_addr & 0x3F) {  /* 64-byte alignment required */
> +               dev_err(&hws->pdev->dev,
> +                       "Buffer DMA address 0x%llx not 64-byte aligned\n"=
,
> +                       (unsigned long long)dma_addr);
> +               return -EINVAL;
> +       }
> +
> +       vb2_set_plane_payload(vb, 0, need);
> +       return 0;
> +}
> +
> +static void hws_buffer_queue(struct vb2_buffer *vb)
> +{
> +       struct hws_video *vid =3D vb->vb2_queue->drv_priv;
> +       struct hwsvideo_buffer *buf =3D to_hwsbuf(vb);
> +       struct hws_pcie_dev *hws =3D vid->parent;
> +       unsigned long flags;
> +
> +       dev_dbg(&hws->pdev->dev,
> +               "buffer_queue(ch=3D%u): vb=3D%p sizeimage=3D%u q_active=
=3D%d\n",
> +               vid->channel_index, vb, vid->pix.sizeimage,
> +               READ_ONCE(vid->cap_active));
> +
> +       /* Initialize buffer slot */
> +       buf->slot =3D 0;
> +
> +       spin_lock_irqsave(&vid->irq_lock, flags);
> +       list_add_tail(&buf->list, &vid->capture_queue);
> +       vid->queued_count++;
> +
> +       /* If streaming and no in-flight buffer, prime HW immediately */
> +       if (READ_ONCE(vid->cap_active) && !vid->active) {
> +               dma_addr_t dma_addr;
> +
> +               dev_dbg(&hws->pdev->dev,
> +                       "buffer_queue(ch=3D%u): priming first vb=3D%p\n",
> +                       vid->channel_index, &buf->vb.vb2_buf);
> +               list_del_init(&buf->list);
> +               vid->queued_count--;
> +               vid->active =3D buf;
> +
> +               dma_addr =3D vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_b=
uf, 0);
> +               hws_program_dma_for_addr(vid->parent, vid->channel_index,
> +                                        dma_addr);
> +               iowrite32(lower_32_bits(dma_addr),
> +                         hws->bar0_base + HWS_REG_DMA_ADDR(vid->channel_=
index));
> +
> +               wmb(); /* ensure descriptors visible before enabling capt=
ure */
> +               hws_enable_video_capture(hws, vid->channel_index, true);
> +               hws_prime_next_locked(vid);
> +       } else if (READ_ONCE(vid->cap_active) && vid->active) {
> +               hws_prime_next_locked(vid);
> +       }
> +       spin_unlock_irqrestore(&vid->irq_lock, flags);
> +}
> +
> +static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +       struct hws_video *v =3D q->drv_priv;
> +       struct hws_pcie_dev *hws =3D v->parent;
> +       struct hwsvideo_buffer *to_program =3D NULL;      /* local copy *=
/
> +       struct vb2_buffer *prog_vb2 =3D NULL;
> +       unsigned long flags;
> +       int ret;
> +
> +       dev_dbg(&hws->pdev->dev, "start_streaming: ch=3D%u count=3D%u\n",
> +               v->channel_index, count);
> +
> +       ret =3D hws_check_card_status(hws);
> +       if (ret) {
> +               struct hwsvideo_buffer *b, *tmp;
> +               unsigned long f;
> +               LIST_HEAD(queued);
> +
> +               spin_lock_irqsave(&v->irq_lock, f);
> +               if (v->active) {
> +                       list_add_tail(&v->active->list, &queued);
> +                       v->active =3D NULL;
> +               }
> +               if (v->next_prepared) {
> +                       list_add_tail(&v->next_prepared->list, &queued);
> +                       v->next_prepared =3D NULL;
> +               }
> +               while (!list_empty(&v->capture_queue)) {
> +                       b =3D list_first_entry(&v->capture_queue,
> +                                            struct hwsvideo_buffer, list=
);
> +                       list_move_tail(&b->list, &queued);
> +               }
> +               spin_unlock_irqrestore(&v->irq_lock, f);
> +
> +               list_for_each_entry_safe(b, tmp, &queued, list) {
> +                       list_del_init(&b->list);
> +                       vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_QUE=
UED);
> +               }
> +               return ret;
> +       }
> +       (void)hws_read_active_state(hws, v->channel_index,
> +                                      &v->pix.interlaced);
> +
> +       lockdep_assert_held(&v->state_lock);
> +       /* init per-stream state */
> +       WRITE_ONCE(v->stop_requested, false);
> +       WRITE_ONCE(v->cap_active, true);
> +       WRITE_ONCE(v->half_seen, false);
> +       WRITE_ONCE(v->last_buf_half_toggle, 0);
> +
> +       /* Try to prime a buffer, but it's OK if none are queued yet */
> +       spin_lock_irqsave(&v->irq_lock, flags);
> +       if (!v->active && !list_empty(&v->capture_queue)) {
> +               to_program =3D list_first_entry(&v->capture_queue,
> +                                             struct hwsvideo_buffer, lis=
t);
> +               list_del_init(&to_program->list);
> +               v->queued_count--;
> +               v->active =3D to_program;
> +               prog_vb2 =3D &to_program->vb.vb2_buf;
> +               dev_dbg(&hws->pdev->dev,
> +                       "start_streaming: ch=3D%u took buffer %p\n",
> +                       v->channel_index, to_program);
> +       }
> +       spin_unlock_irqrestore(&v->irq_lock, flags);
> +
> +       /* Only program/enable HW if we actually have a buffer */
> +       if (to_program) {
> +               if (!prog_vb2)
> +                       prog_vb2 =3D &to_program->vb.vb2_buf;
> +               {
> +                       dma_addr_t dma_addr;
> +
> +                       dma_addr =3D vb2_dma_contig_plane_dma_addr(prog_v=
b2, 0);
> +                       hws_program_dma_for_addr(hws, v->channel_index, d=
ma_addr);
> +                       iowrite32(lower_32_bits(dma_addr),
> +                                 hws->bar0_base +
> +                                 HWS_REG_DMA_ADDR(v->channel_index));
> +                       dev_dbg(&hws->pdev->dev,
> +                               "start_streaming: ch=3D%u programmed buff=
er %p dma=3D0x%08x\n",
> +                               v->channel_index, to_program,
> +                               lower_32_bits(dma_addr));
> +                       (void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
> +               }
> +
> +               wmb(); /* ensure descriptors visible before enabling capt=
ure */
> +               hws_enable_video_capture(hws, v->channel_index, true);
> +               {
> +                       unsigned long pf;
> +
> +                       spin_lock_irqsave(&v->irq_lock, pf);
> +                       hws_prime_next_locked(v);
> +                       spin_unlock_irqrestore(&v->irq_lock, pf);
> +               }
> +       } else {
> +               dev_dbg(&hws->pdev->dev,
> +                       "start_streaming: ch=3D%u no buffer yet (will arm=
 on QBUF)\n",
> +                       v->channel_index);
> +       }
> +
> +       return 0;
> +}
> +
> +static void hws_log_video_state(struct hws_video *v, const char *action,
> +                               const char *phase)
> +{
> +       struct hws_pcie_dev *hws =3D v->parent;
> +       unsigned long flags;
> +       unsigned int queued =3D 0;
> +       unsigned int tracked =3D 0;
> +       unsigned int seq =3D 0;
> +       struct hwsvideo_buffer *b;
> +       bool streaming =3D vb2_is_streaming(&v->buffer_queue);
> +       bool cap_active;
> +       bool stop_requested;
> +       struct hwsvideo_buffer *active;
> +       struct hwsvideo_buffer *next_prepared;
> +
> +       spin_lock_irqsave(&v->irq_lock, flags);
> +       list_for_each_entry(b, &v->capture_queue, list)
> +               queued++;
> +       cap_active =3D READ_ONCE(v->cap_active);
> +       stop_requested =3D READ_ONCE(v->stop_requested);
> +       active =3D v->active;
> +       next_prepared =3D v->next_prepared;
> +       tracked =3D v->queued_count;
> +       seq =3D (u32)atomic_read(&v->sequence_number);
> +       spin_unlock_irqrestore(&v->irq_lock, flags);
> +
> +       dev_dbg(&hws->pdev->dev,
> +               "video:%s:%s ch=3D%u streaming=3D%d cap=3D%d stop=3D%d ac=
tive=3D%p next=3D%p queued=3D%u tracked=3D%u seq=3D%u\n",
> +               action, phase, v->channel_index, streaming, cap_active,
> +               stop_requested, active, next_prepared, queued, tracked, s=
eq);
> +}
> +
> +static void hws_stop_streaming(struct vb2_queue *q)
> +{
> +       struct hws_video *v =3D q->drv_priv;
> +       struct hws_pcie_dev *hws =3D v->parent;
> +       unsigned long flags;
> +       struct hwsvideo_buffer *b, *tmp;
> +       LIST_HEAD(done);
> +       unsigned int done_cnt =3D 0;
> +       u64 start_ns =3D ktime_get_mono_fast_ns();
> +
> +       hws_log_video_state(v, "streamoff", "begin");
> +
> +       /* 1) Quiesce SW/HW first */
> +       lockdep_assert_held(&v->state_lock);
> +       WRITE_ONCE(v->cap_active, false);
> +       WRITE_ONCE(v->stop_requested, true);
> +
> +       hws_enable_video_capture(v->parent, v->channel_index, false);
> +
> +       /* 2) Collect in-flight + queued under the IRQ lock */
> +       spin_lock_irqsave(&v->irq_lock, flags);
> +       hws_video_collect_done_locked(v, &done);
> +       spin_unlock_irqrestore(&v->irq_lock, flags);
> +
> +       /* 3) Complete outside the lock */
> +       list_for_each_entry_safe(b, tmp, &done, list) {
> +               /* Unlink from 'done' before completing */
> +               list_del_init(&b->list);
> +               vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +               done_cnt++;
> +       }
> +       dev_dbg(&hws->pdev->dev,
> +               "video:streamoff:done ch=3D%u completed=3D%u (%lluus)\n",
> +               v->channel_index, done_cnt, hws_elapsed_us(start_ns));
> +       hws_log_video_state(v, "streamoff", "end");
> +}
> +
> +static const struct vb2_ops hwspcie_video_qops =3D {
> +       .queue_setup =3D hws_queue_setup,
> +       .buf_prepare =3D hws_buffer_prepare,
> +       .buf_init =3D hws_buf_init,
> +       .buf_finish =3D hws_buf_finish,
> +       .buf_cleanup =3D hws_buf_cleanup,
> +       .buf_queue =3D hws_buffer_queue,
> +       .start_streaming =3D hws_start_streaming,
> +       .stop_streaming =3D hws_stop_streaming,
> +};
> +
> +int hws_video_register(struct hws_pcie_dev *dev)
> +{
> +       int i, ret;
> +
> +       ret =3D v4l2_device_register(&dev->pdev->dev, &dev->v4l2_device);
> +       if (ret) {
> +               dev_err(&dev->pdev->dev, "v4l2_device_register failed: %d=
\n",
> +                       ret);
> +               return ret;
> +       }
> +
> +       for (i =3D 0; i < dev->cur_max_video_ch; i++) {
> +               struct hws_video *ch =3D &dev->video[i];
> +               struct video_device *vdev;
> +               struct vb2_queue *q;
> +
> +               /* hws_video_init_channel() should have set:
> +                * - ch->parent, ch->channel_index
> +                * - locks (state_lock, irq_lock)
> +                * - capture_queue (INIT_LIST_HEAD)
> +                * - control_handler + controls
> +                * - fmt_curr (width/height)
> +                * Don=E2=80=99t reinitialize any of those here.
> +                */
> +
> +               vdev =3D video_device_alloc();
> +               if (!vdev) {
> +                       dev_err(&dev->pdev->dev,
> +                               "video_device_alloc ch%u failed\n", i);
> +                       ret =3D -ENOMEM;
> +                       goto err_unwind;
> +               }
> +               ch->video_device =3D vdev;
> +
> +               /* Basic V4L2 node setup */
> +               snprintf(vdev->name, sizeof(vdev->name), "%s-hdmi%u",
> +                        KBUILD_MODNAME, i);
> +               vdev->v4l2_dev =3D &dev->v4l2_device;
> +               vdev->fops =3D &hws_fops; /* your file_ops */
> +               vdev->ioctl_ops =3D &hws_ioctl_fops;      /* your ioctl_o=
ps */
> +               vdev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_S=
TREAMING;
> +               vdev->lock =3D &ch->state_lock;   /* serialize file ops *=
/
> +               vdev->ctrl_handler =3D &ch->control_handler;
> +               vdev->vfl_dir =3D VFL_DIR_RX;
> +               vdev->release =3D video_device_release;
> +               if (ch->control_handler.error) {
> +                       ret =3D ch->control_handler.error;
> +                       goto err_unwind;
> +               }
> +               video_set_drvdata(vdev, ch);
> +
> +               /* vb2 queue init (dma-contig) */
> +               q =3D &ch->buffer_queue;
> +               memset(q, 0, sizeof(*q));
> +               q->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +               q->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +               q->drv_priv =3D ch;
> +               q->buf_struct_size =3D sizeof(struct hwsvideo_buffer);
> +               q->ops =3D &hwspcie_video_qops;   /* your vb2_ops */
> +               q->mem_ops =3D &vb2_dma_contig_memops;
> +               q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +               q->lock =3D &ch->state_lock;
> +               q->min_queued_buffers =3D 1;
> +               q->dev =3D &dev->pdev->dev;
> +
> +               ret =3D vb2_queue_init(q);
> +               vdev->queue =3D q;
> +               if (ret) {
> +                       dev_err(&dev->pdev->dev,
> +                               "vb2_queue_init ch%u failed: %d\n", i, re=
t);
> +                       goto err_unwind;
> +               }
> +
> +               /* Make controls live (no-op if none or already set up) *=
/
> +               if (ch->control_handler.error) {
> +                       ret =3D ch->control_handler.error;
> +                       dev_err(&dev->pdev->dev,
> +                               "ctrl handler ch%u error: %d\n", i, ret);
> +                       goto err_unwind;
> +               }
> +               v4l2_ctrl_handler_setup(&ch->control_handler);
> +               ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +               if (ret) {
> +                       dev_err(&dev->pdev->dev,
> +                               "video_register_device ch%u failed: %d\n"=
, i,
> +                               ret);
> +                       goto err_unwind;
> +               }
> +       }
> +
> +       return 0;
> +
> +err_unwind:
> +       for (; i >=3D 0; i--) {
> +               struct hws_video *ch =3D &dev->video[i];
> +
> +               hws_video_release_registration(ch);
> +       }
> +       v4l2_device_unregister(&dev->v4l2_device);
> +       return ret;
> +}
> +
> +void hws_video_unregister(struct hws_pcie_dev *dev)
> +{
> +       int i;
> +
> +       if (!dev)
> +               return;
> +
> +       for (i =3D 0; i < dev->cur_max_video_ch; i++) {
> +               struct hws_video *ch =3D &dev->video[i];
> +
> +               hws_video_release_registration(ch);
> +               v4l2_ctrl_handler_free(&ch->control_handler);
> +       }
> +       v4l2_device_unregister(&dev->v4l2_device);
> +}
> +
> +int hws_video_quiesce(struct hws_pcie_dev *hws, const char *reason)
> +{
> +       int i, ret =3D 0;
> +       u64 start_ns =3D ktime_get_mono_fast_ns();
> +
> +       dev_dbg(&hws->pdev->dev, "video:%s:begin channels=3D%u\n", reason=
,
> +               hws->cur_max_video_ch);
> +       for (i =3D 0; i < hws->cur_max_video_ch; i++) {
> +               struct hws_video *vid =3D &hws->video[i];
> +               struct vb2_queue *q =3D &vid->buffer_queue;
> +               u64 ch_start_ns =3D ktime_get_mono_fast_ns();
> +               bool streaming;
> +
> +               if (!q || !q->ops) {
> +                       dev_dbg(&hws->pdev->dev,
> +                               "video:%s:ch=3D%d skipped queue-unavailab=
le\n",
> +                               reason, i);
> +                       continue;
> +               }
> +
> +               streaming =3D vb2_is_streaming(q);
> +               hws_log_video_state(vid, reason, "channel");
> +               if (streaming) {
> +                       /* Stop via vb2 (runs your .stop_streaming) */
> +                       int r =3D vb2_streamoff(q, q->type);
> +
> +                       dev_dbg(&hws->pdev->dev,
> +                               "video:%s:ch=3D%d streamoff ret=3D%d (%ll=
uus)\n",
> +                               reason, i, r, hws_elapsed_us(ch_start_ns)=
);
> +                       if (r && !ret)
> +                               ret =3D r;
> +               } else {
> +                       dev_dbg(&hws->pdev->dev,
> +                               "video:%s:ch=3D%d idle (%lluus)\n",
> +                               reason, i, hws_elapsed_us(ch_start_ns));
> +               }
> +       }
> +       dev_dbg(&hws->pdev->dev, "video:%s:done ret=3D%d (%lluus)\n", rea=
son,
> +               ret, hws_elapsed_us(start_ns));
> +       return ret;
> +}
> +
> +void hws_video_pm_resume(struct hws_pcie_dev *hws)
> +{
> +       /* Nothing mandatory to do here for vb2 =E2=80=94 userspace will =
STREAMON again.
> +        * If you track per-channel 'auto-restart' policy, re-arm it here=
.
> +        */
> +}
> diff --git a/drivers/media/pci/hws/hws_video.h b/drivers/media/pci/hws/hw=
s_video.h
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
> +                             unsigned int chan,
> +                             bool on);
> +void hws_prime_next_locked(struct hws_video *vid);
> +
> +int hws_video_init_channel(struct hws_pcie_dev *pdev, int ch);
> +void hws_video_cleanup_channel(struct hws_pcie_dev *pdev, int ch);
> +void check_video_format(struct hws_pcie_dev *pdx);
> +int hws_check_card_status(struct hws_pcie_dev *hws);
> +void hws_init_video_sys(struct hws_pcie_dev *hws, bool enable);
> +
> +void hws_program_dma_for_addr(struct hws_pcie_dev *hws,
> +                             unsigned int ch,
> +                             dma_addr_t dma);
> +void hws_set_dma_doorbell(struct hws_pcie_dev *hws, unsigned int ch,
> +                         dma_addr_t dma, const char *tag);
> +
> +int hws_video_quiesce(struct hws_pcie_dev *hws, const char *reason);
> +void hws_video_pm_resume(struct hws_pcie_dev *hws);
> +
> +#endif // HWS_VIDEO_H
> --
> 2.53.0
>

