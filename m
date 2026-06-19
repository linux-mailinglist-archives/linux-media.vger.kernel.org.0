Return-Path: <linux-media+bounces-65289-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tAXsF6E+NWpmpwYAu9opvQ
	(envelope-from <linux-media+bounces-65289-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 15:05:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D276A5EFC
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 15:05:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZvXN0zRL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65289-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65289-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC7D9301C952
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 13:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9EC3911A8;
	Fri, 19 Jun 2026 13:05:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5296D39099A;
	Fri, 19 Jun 2026 13:05:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874333; cv=none; b=eemLD+9LMDa+2TNYV0To1VPdBYpEvld+DFB3e6Fig6iK2OwILWLB6eeOYmkcV/DO1CcBdIMXCn4PAbNlDOGpVLHfldof07bpab9AK+7vIIAPuceVPODfsfB0RaKcpkAa0zsHWnD4eEVfg3uQUKpJeGuO7fPzRQcibXxyBdPjQNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874333; c=relaxed/simple;
	bh=GvqtglbzIP3iq+vn4upoamc5OAN0wZ3TMjk3a0HC+Go=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cDo2SQmW9KlZlFup4cN+nBdv62EaNaLeXs6O2dHxDNsTKhoL+4T9lKyT7Y+300RSKXndgxhUv2GZ9xBn+oJHgiaNySTA0GjGSDDrJ3nMfNnTO6wpEgDq2Axc4APrapw5+VuP8YSi2orV+rnRgSMRFWoAz/dyAGV1GeTeclSPqLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvXN0zRL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B9F1F000E9;
	Fri, 19 Jun 2026 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781874331;
	bh=fH/tWCYzp6t0Nqxfus1gFaX/ZUZOJR4U1u65xMeXIOA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=ZvXN0zRLiORKEjO5zii2FZ7fJlZNhnrpuFfnA4niFWBrP08J0jxQT+oVKQFHqaRvZ
	 VLgIin2AB+TQng7C69JYtM7wPBhGeEds/66FzMiHamuglkUKOAdNiUo3Ye8xyV8CtY
	 Hm0PYYr6zMRG0uf0SagO4dZL3LgKK2PkzZY6e4xLqB6/a7Di36rIeYKYIwUDPIdODL
	 U9VcbwHFjr11k2pGcdWaqbMyX8qeAo9np0E8IRkyjgyjZAQIFaM+wVLOlS3NYPhjo4
	 mqQ6x4gPCkHZCkksx6tAxMEcuegV4qOqajXq1hE+C5xLThLWR45cysHaBtM8EI/J+r
	 K5hrPM8ilSPuw==
Message-ID: <0d2576f8-7773-419e-be0f-0bb37a776bc0@kernel.org>
Date: Fri, 19 Jun 2026 15:05:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 3/5] media: v4l2-core: Add v4l2-stats interface
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
References: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
 <20260617-v4l2-add-fdinfo-v2-3-d298e98ce06a@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <20260617-v4l2-add-fdinfo-v2-3-d298e98ce06a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:detlev.casanova@collabora.com,m:mchehab@kernel.org,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:ezequiel@vanguardiasur.com.ar,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-65289-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,collabora.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1D276A5EFC

On 17/06/2026 20:10, Detlev Casanova wrote:
> Provide helpers for media drivers to set fdinfo data and print the
> key:value pairs in a standard way.
> 
> User drivers can set stats values with helpers like:
>  - v4l2_stats_update_hw_usage
>  - v4l2_stats_set_media_dev_type
> 
> And also call the show helpers from their show_fdinfo callback with:
>  - v4l2_stats_show -- Shows the values set previously
>  - v4l2_stats_show_clock -- Shows the main clock state.
> 
> The show_clock helper is used instead of updating a clock value in
> v4l2_stats for the following reasons:
>  - Clocks are at the device level, this is not a per-fd information
>  - This avoids having clock references in v4l2-core
>  - Drivers can use different approaches to manage clocks
>    (e.g.: bulk_data or not: A set helper wouldn't please all drivers)
>  - Arguably, clocks could be exposed elsewhere (like a debugfs), but we
>    want something close to what DRM does and centralizing information has
>    its advantages for userspace tooling.
> 
> In DRM the key:value pair format for clocks is documented and each driver
> can write them directly based on that.
> In this case, provide a helper and document the format.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  drivers/media/v4l2-core/Makefile     |  2 +-
>  drivers/media/v4l2-core/v4l2-dev.c   |  2 ++
>  drivers/media/v4l2-core/v4l2-fh.c    |  3 ++
>  drivers/media/v4l2-core/v4l2-stats.c | 65 ++++++++++++++++++++++++++++++++++++
>  include/media/v4l2-fh.h              |  2 ++
>  include/media/v4l2-stats.h           | 44 ++++++++++++++++++++++++
>  6 files changed, 117 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> index 329f0eadce99..20e1ab74ac09 100644
> --- a/drivers/media/v4l2-core/Makefile
> +++ b/drivers/media/v4l2-core/Makefile
> @@ -9,7 +9,7 @@ ccflags-y += -I$(srctree)/drivers/media/tuners
>  tuner-objs	:=	tuner-core.o
>  
>  videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
> -			v4l2-event.o v4l2-subdev.o v4l2-common.o \
> +			v4l2-event.o v4l2-subdev.o v4l2-common.o v4l2-stats.o \
>  			v4l2-ctrls-core.o v4l2-ctrls-api.o \
>  			v4l2-ctrls-request.o v4l2-ctrls-defs.o
>  
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 3878fa2ff73e..3e7a6876dffd 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -486,6 +486,8 @@ static void v4l2_show_fdinfo(struct seq_file *m, struct file *filp)
>  {
>  	struct video_device *vdev = video_devdata(filp);
>  
> +	seq_printf(m, "media-driver:\t%s\n", vdev->v4l2_dev->name);
> +
>  	if (vdev->fops->show_fdinfo)
>  		vdev->fops->show_fdinfo(m, filp);
>  }
> diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
> index b184bed8aca9..1b655672c718 100644
> --- a/drivers/media/v4l2-core/v4l2-fh.c
> +++ b/drivers/media/v4l2-core/v4l2-fh.c
> @@ -17,6 +17,7 @@
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-mc.h>
> +#include <media/v4l2-stats.h>
>  
>  void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
>  {
> @@ -38,6 +39,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
>  	INIT_LIST_HEAD(&fh->subscribed);
>  	fh->sequence = -1;
>  	mutex_init(&fh->subscribe_lock);
> +	v4l2_stats_init(&fh->stats);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fh_init);
>  
> @@ -88,6 +90,7 @@ void v4l2_fh_exit(struct v4l2_fh *fh)
>  	v4l2_event_unsubscribe_all(fh);
>  	mutex_destroy(&fh->subscribe_lock);
>  	fh->vdev = NULL;
> +	v4l2_stats_exit(&fh->stats);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fh_exit);
>  
> diff --git a/drivers/media/v4l2-core/v4l2-stats.c b/drivers/media/v4l2-core/v4l2-stats.c
> new file mode 100644
> index 000000000000..93e64ef2e7bb
> --- /dev/null
> +++ b/drivers/media/v4l2-core/v4l2-stats.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * v4l2-stats.c
> + *
> + * V4L2 statistics management.
> + *
> + * Maintain a per-file handle list of statistics about the hardware and handle
> + * exposing it in the fdinfo.
> + *
> + * Copyright (C) 2026 Collabora.
> + *
> + * Contact: Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include <linux/types.h>
> +#include <linux/seq_file.h>
> +#include <linux/clk.h>
> +#include <media/v4l2-stats.h>
> +
> +static const char * const dev_type_name[] = {
> +	[MEDIA_DEV_TYPE_V4L2] = "media",
> +	[MEDIA_DEV_TYPE_V4L2_STATELESS_ENCODER] = "encoder",
> +	[MEDIA_DEV_TYPE_V4L2_STATELESS_DECODER] = "decoder",
> +};
> +
> +void v4l2_stats_init(struct v4l2_stats *stats)
> +{
> +	stats->hw_usage_time = 0;
> +	stats->media_dev_type = MEDIA_DEV_TYPE_V4L2;
> +}
> +
> +void v4l2_stats_exit(struct v4l2_stats *stats)
> +{
> +}
> +
> +void v4l2_stats_update_hw_usage(struct v4l2_stats *stats, u64 usage_time)
> +{
> +	stats->hw_usage_time += usage_time;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_stats_update_hw_usage);
> +
> +void v4l2_stats_set_media_dev_type(struct v4l2_stats *stats, enum v4l2_media_dev_type type)
> +{
> +	if (type >= MEDIA_DEV_TYPE_COUNT)
> +		return;
> +
> +	stats->media_dev_type = type;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_stats_set_media_dev_type);
> +
> +void v4l2_stats_show(struct v4l2_stats *stats, struct seq_file *m)
> +{
> +	seq_printf(m, "media-type:\t%s\n", dev_type_name[stats->media_dev_type]);
> +	seq_printf(m, "media-engine-usage:\t%llu ns\n", stats->hw_usage_time);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_stats_show);
> +
> +void v4l2_stats_show_clock(struct seq_file *m, struct clk *clk)
> +{
> +	seq_printf(m, "media-maxfreq:\t%lu Hz\n",
> +		   clk_get_rate(clk));
> +	seq_printf(m, "media-curfreq:\t%lu Hz\n",
> +		   clk_get_rate(clk));
> +}
> +EXPORT_SYMBOL_GPL(v4l2_stats_show_clock);
> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
> index aad4b3689d7e..ae6688722bee 100644
> --- a/include/media/v4l2-fh.h
> +++ b/include/media/v4l2-fh.h
> @@ -17,6 +17,7 @@
>  #include <linux/kconfig.h>
>  #include <linux/list.h>
>  #include <linux/videodev2.h>
> +#include <media/v4l2-stats.h>
>  
>  struct video_device;
>  struct v4l2_ctrl_handler;
> @@ -43,6 +44,7 @@ struct v4l2_fh {
>  	struct list_head	list;
>  	struct video_device	*vdev;
>  	struct v4l2_ctrl_handler *ctrl_handler;
> +	struct v4l2_stats	stats;
>  	enum v4l2_priority	prio;
>  
>  	/* Events */
> diff --git a/include/media/v4l2-stats.h b/include/media/v4l2-stats.h
> new file mode 100644
> index 000000000000..d580933c4181
> --- /dev/null
> +++ b/include/media/v4l2-stats.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * v4l2-stats.h
> + *
> + * V4L2 statistics management.
> + *
> + * Maintain a per-file handle list of statistics about the hardware and handle
> + * exposing it in the fdinfo.
> + *
> + * Copyright (C) 2026 Collabora.
> + *
> + * Contact: Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +#ifndef V4L2_STATS_H
> +#define V4L2_STATS_H
> +
> +#include <linux/types.h>
> +
> +struct clk;
> +struct seq_file;
> +
> +enum v4l2_media_dev_type {
> +	MEDIA_DEV_TYPE_V4L2 = 0,
> +	MEDIA_DEV_TYPE_V4L2_STATELESS_ENCODER,
> +	MEDIA_DEV_TYPE_V4L2_STATELESS_DECODER,
> +
> +	MEDIA_DEV_TYPE_COUNT,

I'm a bit unhappy about introducing yet another type. Do we need it?

> +};
> +
> +struct v4l2_stats {

Poor name, and it conflicts with ISP statistics.

How about v4l2_pdinfo? And v4l2-fdinfo.h etc. That avoids any confusion and
also clearly says what this is about.

> +	u64 hw_usage_time;
> +	enum v4l2_media_dev_type media_dev_type;

This should be the first field.

> +};
> +
> +void v4l2_stats_init(struct v4l2_stats *stats);
> +void v4l2_stats_exit(struct v4l2_stats *stats);
> +
> +void v4l2_stats_update_hw_usage(struct v4l2_stats *stats, u64 usage_time);
> +void v4l2_stats_set_media_dev_type(struct v4l2_stats *stats, enum v4l2_media_dev_type type);
> +
> +void v4l2_stats_show(struct v4l2_stats *stats, struct seq_file *m);
> +void v4l2_stats_show_clock(struct seq_file *m, struct clk *clk);
> +
> +#endif /* V4L2_STATS_H */
> 

Regards,

	Hans

