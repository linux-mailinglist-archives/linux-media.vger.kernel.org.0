Return-Path: <linux-media+bounces-64719-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l2hDDg5BLGqiOQQAu9opvQ
	(envelope-from <linux-media+bounces-64719-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 19:25:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A4467B4E9
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 19:25:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=URnLanFu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64719-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64719-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E2C430B36E9
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4883405869;
	Fri, 12 Jun 2026 17:25:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0132DF717;
	Fri, 12 Jun 2026 17:25:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285124; cv=pass; b=g+R1ZrisUAKmIhBBqLel0rpkueQ28qSqsaOc8HFQCNKkFJfUBBLx/ORKaeFtg/gz70+U4UqQsykNswTLMLuCQpisyQnaOPHFw70qgfJjPhvzoARcwNsTe2kDA4GhCxTxtLchyRPhFhpZ1E1whh82R2OIwtww12hBxJ2ofTMcEnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285124; c=relaxed/simple;
	bh=4cURpMK3QQXpTF2gpONN7pJN8waoiDf3cy2VfuoNe8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/9q3997iAyxp1OcK/EaULsbhQ4ZsIKNGx6OIfL2g/FKqmXs5sK6k47XEWx4TJUvQVCCEDYYyYqpZEu9WXqMRKIE2Q9Nc2GlZflGJwMe8UJmcrbbaP3CxjCIKOpivFFWEx8pioTlApbhNs99h6yBqMHZhPUYNJ7cpe51c/2oX/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=URnLanFu; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal: i=1; a=rsa-sha256; t=1781285107; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ie9SB7+6RIDCVKRsL7F8dgbNefcEZWZU3VgvWJqIcjQQWL4WIxbEAHqvkaBcai3EaTWp5N5mBVf2HSQaF4UfTbQp0fHwrFlEF4Q7OhQ/F6C5/TBw90tqh6LVpBmA7ZAuGj0Pw1k8oCIQWK5/+suedcNMELBYK7gv8f/OBH4ELCg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781285107; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YBrJ3CWYtlE5Lt5wfHrabjrVt1O9sxm+jNwBrYb+diw=; 
	b=IRV5WzdNW/QSC0202dWqSYV9Ef229++uh6gQmv4IU17HoYLmM05/qYO7LnUXfbN0mEzHer0kI3U75Jxmm8/5XuYCOSWAcNCfAwA9N6IMuXSRZgnopXSzcgn7bld1TqqdPp+OqHX85iaX8HhRSYi2pGQhCr8tP83bEKU/P7VqxnM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781285107;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YBrJ3CWYtlE5Lt5wfHrabjrVt1O9sxm+jNwBrYb+diw=;
	b=URnLanFuO8mcbhqA1deOArbyp+PclOyqIdETvtM8oYjM6ZB+ep/tjdIFIIZJlhZf
	2yWLTl3N6AGKJ292v/KtPdfGbb1aORXrd7cbtTv75zjgw4XXk3R0iO/YvuVtO1zF75e
	w0YXrd/309XydfSAcekO2ZlRYUbPJNwJUFYGWXQY=
Received: by mx.zohomail.com with SMTPS id 1781285104387254.58725887548405;
	Fri, 12 Jun 2026 10:25:04 -0700 (PDT)
Message-ID: <cece4025-950f-4081-af3a-a1548f9df0a1@collabora.com>
Date: Fri, 12 Jun 2026 13:25:02 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: hantro: add per-context fdinfo usage stats
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Christopher Healy <healych@amazon.com>
References: <20260612-v4l2-add-fdinfo-v1-0-723211abc861@collabora.com>
 <20260612-v4l2-add-fdinfo-v1-3-723211abc861@collabora.com>
 <a83b7ce30ffc423128e3a3b7d5a03baa8cba6216.camel@collabora.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <a83b7ce30ffc423128e3a3b7d5a03baa8cba6216.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64719-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nicolas.dufresne@collabora.com,m:mchehab@kernel.org,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:healych@amazon.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2A4467B4E9

Hi Nicolas,

On 6/12/26 11:18, Nicolas Dufresne wrote:
> Hi,
>
> Le vendredi 12 juin 2026 à 10:26 -0400, Detlev Casanova a écrit :
>> From: Christopher Healy <healych@amazon.com>
>>
>> Add per-file-descriptor hardware utilization tracking to the Hantro
>> VPU stateless codec driver, exposed via /proc/<pid>/fdinfo/<fd>.
>>
>> Record a ktime timestamp when each job is submitted to hardware in
>> device_run(), and accumulate the elapsed nanoseconds when the job
>> completes in hantro_job_finish(). Report the accumulated time along
>> with the current clock frequency through the new V4L2 show_fdinfo
>> callback.
>>
>> The output uses a media- key prefix with the following keys:
>>    media-driver:           driver name
>>    media-engine-<eng>:     accumulated busy time in nanoseconds
>>    media-maxfreq-<eng>:    maximum engine frequency in Hz
>>    media-curfreq-<eng>:    current engine frequency in Hz
>>
>> Where <eng> is "decoder" or "encoder" depending on the context.
>>
>> This enables userspace monitoring tools to compute per-process decoder
>> and encoder utilization. The current and max frequency keys report the
>> same value today since the driver lacks devfreq support, but will
>> diverge once DVFS is added, allowing userspace to approximate true
>> capacity utilization without any fdinfo code changes. A future series
>> can add hardware cycle counter support (via media-cycles-<eng>) for
>> exact utilization under DVFS, with no changes to the existing uAPI.
>>
>> Signed-off-by: Christopher Healy <healych@amazon.com>
>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> ---
>>   drivers/media/platform/verisilicon/hantro.h     |  5 +++++
>>   drivers/media/platform/verisilicon/hantro_drv.c | 22 ++++++++++++++++++++++
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
>> index 0353de154a1e..10287e5cebac 100644
>> --- a/drivers/media/platform/verisilicon/hantro.h
>> +++ b/drivers/media/platform/verisilicon/hantro.h
>> @@ -16,6 +16,7 @@
>>   #include <linux/videodev2.h>
>>   #include <linux/wait.h>
>>   #include <linux/clk.h>
>> +#include <linux/ktime.h>
>>   #include <linux/reset.h>
>>   
>>   #include <media/v4l2-ctrls.h>
>> @@ -268,6 +269,10 @@ struct hantro_ctx {
>>   	struct hantro_postproc_ctx postproc;
>>   	bool need_postproc;
>>   
>> +	/* Statistics for debugging and performance measurements. */
>> +	ktime_t start_time;
>> +	u64 total_ns;
>> +
>>   	/* Specific for particular codec modes. */
>>   	union {
>>   		struct hantro_h264_dec_hw_ctx h264_dec;
>> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
>> index 2e81877f640f..139c2e6a83aa 100644
>> --- a/drivers/media/platform/verisilicon/hantro_drv.c
>> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
>> @@ -90,6 +90,8 @@ static void hantro_job_finish(struct hantro_dev *vpu,
>>   			      struct hantro_ctx *ctx,
>>   			      enum vb2_buffer_state result)
>>   {
>> +	ctx->total_ns += ktime_to_ns(ktime_sub(ktime_get(), ctx->start_time));
>> +
>>   	pm_runtime_put_autosuspend(vpu->dev);
>>   
>>   	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
>> @@ -186,6 +188,8 @@ static void device_run(void *priv)
>>   
>>   	v4l2_m2m_buf_copy_metadata(src, dst);
>>   
>> +	ctx->start_time = ktime_get();
>> +
>>   	if (ctx->codec_ops->run(ctx))
>>   		goto err_cancel_job;
>>   
>> @@ -701,10 +705,28 @@ static int hantro_release(struct file *filp)
>>   	return 0;
>>   }
>>   
>> +static void hantro_show_fdinfo(struct seq_file *m, struct file *f)
>> +{
>> +	struct hantro_ctx *ctx = file_to_ctx(f);
>> +	struct hantro_dev *vpu = ctx->dev;
>> +
>> +	seq_printf(m, "media-driver:\t%s\n", DRIVER_NAME);
>> +	seq_printf(m, "media-engine-%s:\t%llu ns\n",
>> +		   ctx->is_encoder ? "encoder" : "decoder",
>> +		   ctx->total_ns);
>> +	seq_printf(m, "media-maxfreq-%s:\t%lu Hz\n",
>> +		   ctx->is_encoder ? "encoder" : "decoder",
>> +		   clk_get_rate(vpu->clocks[0].clk));
>> +	seq_printf(m, "media-curfreq-%s:\t%lu Hz\n",
>> +		   ctx->is_encoder ? "encoder" : "decoder",
>> +		   clk_get_rate(vpu->clocks[0].clk));
> Similar to what was done in DRM helpers, I would create a common structure,
> maybe in a v4l2-stats library (or some better name). The driver would fill that
> structure directly, or through helpers (such as software timer helper, cycle
> count translation helper), and finally, this show_fd_info() would be a one
> liners, just like DRM do.
>
> This will ensure full consistency in the trace, and avoid possible future
> unresolvable compatibility issue due to past mistakes. If we ever let a bug
> through (of course we won't :-D) all driver will have the same bug, and it will
> be easier to not break userspace.
Yes, that makes a lot of sense actually, And will also help with the 
ftrace HW info if we have stats and debug info centralized in v4l2
> Nicolas
>
>> +}
>> +
>>   static const struct v4l2_file_operations hantro_fops = {
>>   	.owner = THIS_MODULE,
>>   	.open = hantro_open,
>>   	.release = hantro_release,
>> +	.show_fdinfo = hantro_show_fdinfo,
>>   	.poll = v4l2_m2m_fop_poll,
>>   	.unlocked_ioctl = video_ioctl2,
>>   	.mmap = v4l2_m2m_fop_mmap,


