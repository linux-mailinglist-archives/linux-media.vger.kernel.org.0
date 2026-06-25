Return-Path: <linux-media+bounces-65654-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mN+VC/xAPWpM0QgAu9opvQ
	(envelope-from <linux-media+bounces-65654-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:53:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CBD6C6D9E
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:53:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b="hOXJDn/A";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65654-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65654-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C68633021727
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 14:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179DA35BDA4;
	Thu, 25 Jun 2026 14:53:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4BC31716D;
	Thu, 25 Jun 2026 14:53:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782399209; cv=pass; b=PxWEoDtxaJQ4tdwvze1xMiSxaxyRWW36kFvG7v+7yqRvn9GtnoLfVjZVZPSZfySL7QReLDhwDR0AQBaif9cDyGw7b6h0IWn/8BBKYMUjzsIVKzbxXoLRtXVx+PfaqlEFG79G6EYqmOb5hnjroEgEuUOwwxhVAJaHkeejMoHasVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782399209; c=relaxed/simple;
	bh=1gKLjkT0kp6ffbIq3jvCv/eBhJLYMNQVsL9ljwXU41Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=om/O8Kcu6MiKeNVCx1G7yNX4o9QTbwZYgLQeLJ66SlpXUpY1Jdj4bMVPhWk0eMlJ2a9ydQnDpj+vfC0y9hA/ZjqsnVTI6ER1TbeSA6Zl2TA/WdHT8NE3QBMf1TI+5zrMS/MtoBX5r5OZNpAqpPJuta7NliJccoYgd1VrKKgqq/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=hOXJDn/A; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal: i=1; a=rsa-sha256; t=1782399188; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WmuNy7DOl2kIWdkDhViAxrZRU/cJ7wBTa322xVY1CK8Pk3C40ur0DO9M6N4ZjPGTD0+iQnhwR1PF0Sa2vTRB0xrIj55SAKZqTGBx8xI7ysmrTmnOHij9ya09zNNzEp5LnNgvW0kM0TMbwuEnuhH4YN2erVpMp8qtXF2WWAZxThM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782399188; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MbrQiqoxsl8WhIHD+LeV4P6XnZdN+WMJ7f67o9JPdMA=; 
	b=I/XIghwJuqB8wvNCKRiqFyu79Tew0PoHDAeKlWpsQdVhRMxVWQm+EHNGmpJBqgSmTjDvRAqCZN6VKLq8jCZt90rNTzuuUztzXkct5Y/2Hfa0+MJYdgoyQbUfE7azsJwct6qmi09oUOmMz/Nza1VAmbl2tjnMN2waUEQxJIvQod8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782399188;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MbrQiqoxsl8WhIHD+LeV4P6XnZdN+WMJ7f67o9JPdMA=;
	b=hOXJDn/A/Xkc15506+TTFkdBmzhPbTOkiy6iKSZfl5moM/WdDs70DEqW+K7O8dUg
	Wzl2YLMDRZLJCM+DFIP3NFf9sPkek9llYc00LGEQYt8GBJFCa7PYEFk9KJzq1H+dyTQ
	X9qn3rVNHHZG/3FVJ25yQOb6dx3d2bGWOOfZijx0=
Received: by mx.zohomail.com with SMTPS id 1782399185495703.3163955828122;
	Thu, 25 Jun 2026 07:53:05 -0700 (PDT)
Message-ID: <4787dfe9-edec-4983-9ecb-6ac60502afd7@collabora.com>
Date: Thu, 25 Jun 2026 10:53:03 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] media: v4l2-core: Add v4l2-stats interface
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
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
 <0d2576f8-7773-419e-be0f-0bb37a776bc0@kernel.org>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <0d2576f8-7773-419e-be0f-0bb37a776bc0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65654-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil+cisco@kernel.org,m:mchehab@kernel.org,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:ezequiel@vanguardiasur.com.ar,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:linux-arm-kernel@lists.infradead.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04CBD6C6D9E

Hi Hans,

On 6/19/26 09:05, Hans Verkuil wrote:
> On 17/06/2026 20:10, Detlev Casanova wrote:
>> Provide helpers for media drivers to set fdinfo data and print the
>> key:value pairs in a standard way.
>>
>> User drivers can set stats values with helpers like:
>>   - v4l2_stats_update_hw_usage
>>   - v4l2_stats_set_media_dev_type
>>
>> And also call the show helpers from their show_fdinfo callback with:
>>   - v4l2_stats_show -- Shows the values set previously
>>   - v4l2_stats_show_clock -- Shows the main clock state.
>>
>> The show_clock helper is used instead of updating a clock value in
>> v4l2_stats for the following reasons:
>>   - Clocks are at the device level, this is not a per-fd information
>>   - This avoids having clock references in v4l2-core
>>   - Drivers can use different approaches to manage clocks
>>     (e.g.: bulk_data or not: A set helper wouldn't please all drivers)
>>   - Arguably, clocks could be exposed elsewhere (like a debugfs), but we
>>     want something close to what DRM does and centralizing information has
>>     its advantages for userspace tooling.
>>
>> In DRM the key:value pair format for clocks is documented and each driver
>> can write them directly based on that.
>> In this case, provide a helper and document the format.
>>
>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> ---
>>   drivers/media/v4l2-core/Makefile     |  2 +-
>>   drivers/media/v4l2-core/v4l2-dev.c   |  2 ++
>>   drivers/media/v4l2-core/v4l2-fh.c    |  3 ++
>>   drivers/media/v4l2-core/v4l2-stats.c | 65 ++++++++++++++++++++++++++++++++++++
>>   include/media/v4l2-fh.h              |  2 ++
>>   include/media/v4l2-stats.h           | 44 ++++++++++++++++++++++++
>>   6 files changed, 117 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
>> index 329f0eadce99..20e1ab74ac09 100644
>> --- a/drivers/media/v4l2-core/Makefile
>> +++ b/drivers/media/v4l2-core/Makefile
>> @@ -9,7 +9,7 @@ ccflags-y += -I$(srctree)/drivers/media/tuners
>>   tuner-objs	:=	tuner-core.o
>>   
>>   videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
>> -			v4l2-event.o v4l2-subdev.o v4l2-common.o \
>> +			v4l2-event.o v4l2-subdev.o v4l2-common.o v4l2-stats.o \
>>   			v4l2-ctrls-core.o v4l2-ctrls-api.o \
>>   			v4l2-ctrls-request.o v4l2-ctrls-defs.o
>>   
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index 3878fa2ff73e..3e7a6876dffd 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -486,6 +486,8 @@ static void v4l2_show_fdinfo(struct seq_file *m, struct file *filp)
>>   {
>>   	struct video_device *vdev = video_devdata(filp);
>>   
>> +	seq_printf(m, "media-driver:\t%s\n", vdev->v4l2_dev->name);
>> +
>>   	if (vdev->fops->show_fdinfo)
>>   		vdev->fops->show_fdinfo(m, filp);
>>   }
>> diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
>> index b184bed8aca9..1b655672c718 100644
>> --- a/drivers/media/v4l2-core/v4l2-fh.c
>> +++ b/drivers/media/v4l2-core/v4l2-fh.c
>> @@ -17,6 +17,7 @@
>>   #include <media/v4l2-event.h>
>>   #include <media/v4l2-ioctl.h>
>>   #include <media/v4l2-mc.h>
>> +#include <media/v4l2-stats.h>
>>   
>>   void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
>>   {
>> @@ -38,6 +39,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
>>   	INIT_LIST_HEAD(&fh->subscribed);
>>   	fh->sequence = -1;
>>   	mutex_init(&fh->subscribe_lock);
>> +	v4l2_stats_init(&fh->stats);
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_fh_init);
>>   
>> @@ -88,6 +90,7 @@ void v4l2_fh_exit(struct v4l2_fh *fh)
>>   	v4l2_event_unsubscribe_all(fh);
>>   	mutex_destroy(&fh->subscribe_lock);
>>   	fh->vdev = NULL;
>> +	v4l2_stats_exit(&fh->stats);
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_fh_exit);
>>   
>> diff --git a/drivers/media/v4l2-core/v4l2-stats.c b/drivers/media/v4l2-core/v4l2-stats.c
>> new file mode 100644
>> index 000000000000..93e64ef2e7bb
>> --- /dev/null
>> +++ b/drivers/media/v4l2-core/v4l2-stats.c
>> @@ -0,0 +1,65 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * v4l2-stats.c
>> + *
>> + * V4L2 statistics management.
>> + *
>> + * Maintain a per-file handle list of statistics about the hardware and handle
>> + * exposing it in the fdinfo.
>> + *
>> + * Copyright (C) 2026 Collabora.
>> + *
>> + * Contact: Detlev Casanova <detlev.casanova@collabora.com>
>> + */
>> +
>> +#include <linux/types.h>
>> +#include <linux/seq_file.h>
>> +#include <linux/clk.h>
>> +#include <media/v4l2-stats.h>
>> +
>> +static const char * const dev_type_name[] = {
>> +	[MEDIA_DEV_TYPE_V4L2] = "media",
>> +	[MEDIA_DEV_TYPE_V4L2_STATELESS_ENCODER] = "encoder",
>> +	[MEDIA_DEV_TYPE_V4L2_STATELESS_DECODER] = "decoder",
>> +};
>> +
>> +void v4l2_stats_init(struct v4l2_stats *stats)
>> +{
>> +	stats->hw_usage_time = 0;
>> +	stats->media_dev_type = MEDIA_DEV_TYPE_V4L2;
>> +}
>> +
>> +void v4l2_stats_exit(struct v4l2_stats *stats)
>> +{
>> +}
>> +
>> +void v4l2_stats_update_hw_usage(struct v4l2_stats *stats, u64 usage_time)
>> +{
>> +	stats->hw_usage_time += usage_time;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_stats_update_hw_usage);
>> +
>> +void v4l2_stats_set_media_dev_type(struct v4l2_stats *stats, enum v4l2_media_dev_type type)
>> +{
>> +	if (type >= MEDIA_DEV_TYPE_COUNT)
>> +		return;
>> +
>> +	stats->media_dev_type = type;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_stats_set_media_dev_type);
>> +
>> +void v4l2_stats_show(struct v4l2_stats *stats, struct seq_file *m)
>> +{
>> +	seq_printf(m, "media-type:\t%s\n", dev_type_name[stats->media_dev_type]);
>> +	seq_printf(m, "media-engine-usage:\t%llu ns\n", stats->hw_usage_time);
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_stats_show);
>> +
>> +void v4l2_stats_show_clock(struct seq_file *m, struct clk *clk)
>> +{
>> +	seq_printf(m, "media-maxfreq:\t%lu Hz\n",
>> +		   clk_get_rate(clk));
>> +	seq_printf(m, "media-curfreq:\t%lu Hz\n",
>> +		   clk_get_rate(clk));
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_stats_show_clock);
>> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
>> index aad4b3689d7e..ae6688722bee 100644
>> --- a/include/media/v4l2-fh.h
>> +++ b/include/media/v4l2-fh.h
>> @@ -17,6 +17,7 @@
>>   #include <linux/kconfig.h>
>>   #include <linux/list.h>
>>   #include <linux/videodev2.h>
>> +#include <media/v4l2-stats.h>
>>   
>>   struct video_device;
>>   struct v4l2_ctrl_handler;
>> @@ -43,6 +44,7 @@ struct v4l2_fh {
>>   	struct list_head	list;
>>   	struct video_device	*vdev;
>>   	struct v4l2_ctrl_handler *ctrl_handler;
>> +	struct v4l2_stats	stats;
>>   	enum v4l2_priority	prio;
>>   
>>   	/* Events */
>> diff --git a/include/media/v4l2-stats.h b/include/media/v4l2-stats.h
>> new file mode 100644
>> index 000000000000..d580933c4181
>> --- /dev/null
>> +++ b/include/media/v4l2-stats.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * v4l2-stats.h
>> + *
>> + * V4L2 statistics management.
>> + *
>> + * Maintain a per-file handle list of statistics about the hardware and handle
>> + * exposing it in the fdinfo.
>> + *
>> + * Copyright (C) 2026 Collabora.
>> + *
>> + * Contact: Detlev Casanova <detlev.casanova@collabora.com>
>> + */
>> +#ifndef V4L2_STATS_H
>> +#define V4L2_STATS_H
>> +
>> +#include <linux/types.h>
>> +
>> +struct clk;
>> +struct seq_file;
>> +
>> +enum v4l2_media_dev_type {
>> +	MEDIA_DEV_TYPE_V4L2 = 0,
>> +	MEDIA_DEV_TYPE_V4L2_STATELESS_ENCODER,
>> +	MEDIA_DEV_TYPE_V4L2_STATELESS_DECODER,
>> +
>> +	MEDIA_DEV_TYPE_COUNT,
> I'm a bit unhappy about introducing yet another type. Do we need it?
I didn't want it either, but this will extend to other kind of drivers 
and I couldn't find a type enum to rule them all.
Maybe just using Device Capabilities Flags ?

It still won't differentiate encoder from decoder.
I wouldn't super mad if we loose that information (userspace can simply 
see it as a capture device) but it'd still be nice to have it.
>
>> +};
>> +
>> +struct v4l2_stats {
> Poor name, and it conflicts with ISP statistics.
>
> How about v4l2_pdinfo? And v4l2-fdinfo.h etc. That avoids any confusion and
> also clearly says what this is about.
As mentioned in the other patch, "v4l2_metrics" is more accurate.

Detlev.
>
>> +	u64 hw_usage_time;
>> +	enum v4l2_media_dev_type media_dev_type;
> This should be the first field.
>
>> +};
>> +
>> +void v4l2_stats_init(struct v4l2_stats *stats);
>> +void v4l2_stats_exit(struct v4l2_stats *stats);
>> +
>> +void v4l2_stats_update_hw_usage(struct v4l2_stats *stats, u64 usage_time);
>> +void v4l2_stats_set_media_dev_type(struct v4l2_stats *stats, enum v4l2_media_dev_type type);
>> +
>> +void v4l2_stats_show(struct v4l2_stats *stats, struct seq_file *m);
>> +void v4l2_stats_show_clock(struct seq_file *m, struct clk *clk);
>> +
>> +#endif /* V4L2_STATS_H */
>>
> Regards,
>
> 	Hans


