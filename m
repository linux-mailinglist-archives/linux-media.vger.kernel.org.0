Return-Path: <linux-media+bounces-60158-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOfgKBXs9GkaFwIAu9opvQ
	(envelope-from <linux-media+bounces-60158-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 20:08:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 500694AEBB9
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 20:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCCA0300D774
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 18:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226263B0AD4;
	Fri,  1 May 2026 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="JdfSBTxM"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C883F1658;
	Fri,  1 May 2026 18:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777658886; cv=pass; b=ScYxOZTrLrnNesiJ2ede6difzZQIx9Rd7zwy85hvMe946xHZLRRZFejno2kEn0iLlJsbMHl469uAGYvMsIQr1kAZgWRDBGjIzSCJAyWKt6Phyo5nzpUIzLyb3eqF1aq0aIV8UFyVKuSoEQeSFXDO3NBrS42lKwQmGtOdeH1bZS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777658886; c=relaxed/simple;
	bh=fN+ZG+8NilPm/rxbW3LLpPBx8r3HRXyqgUBvxacQ7Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtKAZQ11Y4VvCdhoQldsIvOeBtFtWd5edcjLpLIumFkff04JedHBgafF5xYc6pjKkf12h1jaSyO8kZtoNX+z70zPQI3EqQf6TaPmR7nvgZuE06WtTy7Z/J+KLCjMFeeKAezRhplzlZDU099q+PMXLUj7DSNQYCoacaxZyPgAuGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=JdfSBTxM; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1777658833; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dl5c7rTWjII5aXf3h1OrxYhT6Z4RcS4GUC6n4XRgH0niMNf/NQT+5bQwRzBMOaRaSyRuvm93lOTRM/v7Yf+0EzB8EFvsTJuA/5EjDOwdjYPpyvEZkJPNFuEj5codHDjMTyLY/bfXez3MB7YD2UMn2RqnJ3XTe+GsYftPHEHInhU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777658833; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v2qT8iGqCyDUVNGJGaIVKYxqpEwJngIId3tCvvdJ+vs=; 
	b=HpQ9xTBTPADN6xhKFxCkLqD2GAMLeOl4S5FhltMJcURXji/Xa/CXzMzbOoGba2XFQXUMnC0ZUt4e65mKDD9DDgvTrrc0vGJcpZ4ha4OaNYwHX8pU7fH1+XMgg1rHn4xj6AkuJQVzV38Ht6b7CifSNRlKSGFY3lr213G6VyrHEGc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777658833;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=v2qT8iGqCyDUVNGJGaIVKYxqpEwJngIId3tCvvdJ+vs=;
	b=JdfSBTxM1BrXS5ExaImTfG+yWQQPv1Zl1UdiEmXpMO1TJ4pNffJ8SDVygIieu6MQ
	9owWaZSV/+K3dY+Ge1tZ3MWr8vhp1bPAkl6fzO8QXD6yfv6Si+Nosw8u3eMWAZBNSnu
	pw94Xnm9up3bf4b0uytloY28NvYRJr+NEKpEgoJY=
Received: by mx.zohomail.com with SMTPS id 1777658831566825.2211426215802;
	Fri, 1 May 2026 11:07:11 -0700 (PDT)
Message-ID: <23206161-3d25-432f-9461-4f5454d98d08@collabora.com>
Date: Fri, 1 May 2026 14:07:08 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] v4l2: Add tracing for stateless codecs
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Yunke Cao <yunkec@google.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, Ma Ke <make24@iscas.ac.cn>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, kernel@collabora.com
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
 <4c216c195d237e71188dfbdd54bbc1e234eff434.camel@collabora.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <4c216c195d237e71188dfbdd54bbc1e234eff434.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Queue-Id: 500694AEBB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60158-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,sntech.de,goodmis.org,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hi Nicolas,

On 4/28/26 15:52, Nicolas Dufresne wrote:
> Le jeudi 12 février 2026 à 11:23 -0500, Detlev Casanova a écrit :
>> Hi !
>>
>> This patchset aims to improve codec event tracing in v4l2.
>>
>> The traces added in visl by Daniel Almeida are moved to the global trace
>> events and slightly reworked to be printed in a more consistent format.
>>
>> To each trace are also added a tgid and fd fields, helping userspace track
>> different decoding sessions (contexts) based on the given file descriptor
>> used by the given process id.
>>
>> Also for better tracking, stream on and stream off events are added as
>> well as HW run and HW done events to track decoder core usage.
>>
>> Finally, add a show_fdinfo callback on video device files, allowing drivers
>> to expose usage information.
>> Currently only used for frame buffer memory usage.
>>
>> The main focus is to be able to generate perfetto traces to show VPU usage,
>> a perfetto producer using this can be found at [1].
>>
>> [1]:
>> https://gitlab.collabora.com/detlev/hantro-perf/-/tree/hantro-improved-info
> I would recommend renaming this repo, as its not really evolving toward
> something truly hantro specific anymore, same goes for the code below appart
> from the run/done traces and the fdinfo that has to be opted in.
Yes, hantro was the first focus, but I've also been integrating rkvdec 
into this.
>
> There is effectively a bit of an overlap with the v4l2-tracer, but there is also
> advantages having it in the kernel, as you source all the event, for the entire
> system, in one place, so I'm fine with that. Considering the possible large
> overhead of the full trace, I'd like to see the ability to filter what we want
> to trace, with some level of granularity.
Tracing is by default disable and and has a really small performance 
footprint when disabled.
On the userspace side, each trace events can be enabled separately and 
even filtered (although I'm not sure filtering is good for performance, 
has it has to match each event with a regex).
> Maybe we only need decode_params for
> specific use case to be debugged, and don't care about large scaling list/matrix
> ? I would also like to see some Documentation on the tracing, so that its usage
> is not only explained in a tool.
Agreed.
> To Hans, there is nice tools idea in there, the perfetto producer is simply C++,
> and the v4l2top utility is Rust. Would you see these as tools v4l2-utils ? For
> the rust part, we can either leave the build independent, and cargo would be
> used to build and run, or we can implement a meson wrapper around cargo. But I
> don't believe its a good idea to use native rustc support in meson for that one
> because of the large number of third party crate needed.
>
> I like the direction, hope the feedback suite you well.
>
> Nicolas
>
>> Detlev Casanova (11):
>>    media: Move visl traces to v4l2-core
>>    media: Reformat v4l2-requests trace event printk
>>    media: Add tgid and fd fields in v4l2_fh struct
>>    media: Add tgid and fd to the v4l2-requests trace fields
>>    media: Add missing types to v4l2_ctrl_ptr
>>    media: Trace the stateless controls when set in v4l2-ctrls-core.c
>>    media: Add stream on/off traces and run them in the ioctl
>>    media: Add HW run/done trace events
>>    media: hantro: Add v4l2_hw run/done traces
>>    media: v4l2: Add callback for show_fdinfo
>>    media: hantro: Add fdinfo callback
>>
>>   drivers/media/platform/verisilicon/hantro.h   |    2 +
>>   .../media/platform/verisilicon/hantro_drv.c   |   25 +
>>   .../media/platform/verisilicon/hantro_v4l2.c  |   10 +-
>>   .../verisilicon/rockchip_vpu981_regs.h        |    1 +
>>   .../platform/verisilicon/rockchip_vpu_hw.c    |    4 +
>>   drivers/media/test-drivers/visl/Makefile      |    2 +-
>>   drivers/media/test-drivers/visl/visl-dec.c    |   76 -
>>   .../media/test-drivers/visl/visl-trace-av1.h  |  314 ---
>>   .../media/test-drivers/visl/visl-trace-fwht.h |   66 -
>>   .../media/test-drivers/visl/visl-trace-h264.h |  349 ----
>>   .../media/test-drivers/visl/visl-trace-hevc.h |  464 -----
>>   .../test-drivers/visl/visl-trace-mpeg2.h      |   99 -
>>   .../test-drivers/visl/visl-trace-points.c     |   11 -
>>   .../media/test-drivers/visl/visl-trace-vp8.h  |  156 --
>>   .../media/test-drivers/visl/visl-trace-vp9.h  |  292 ---
>>   drivers/media/v4l2-core/v4l2-ctrls-api.c      |   10 +
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c     |  114 +
>>   drivers/media/v4l2-core/v4l2-dev.c            |   10 +
>>   drivers/media/v4l2-core/v4l2-fh.c             |    1 +
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |   37 +-
>>   drivers/media/v4l2-core/v4l2-trace.c          |   48 +
>>   include/media/v4l2-ctrls.h                    |   19 +
>>   include/media/v4l2-dev.h                      |    1 +
>>   include/media/v4l2-fh.h                       |    4 +
>>   include/trace/events/v4l2.h                   |   58 +
>>   include/trace/events/v4l2_requests.h          | 1836 +++++++++++++++++
>>   26 files changed, 2178 insertions(+), 1831 deletions(-)
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-av1.h
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-fwht.h
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-h264.h
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-hevc.h
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-mpeg2.h
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-points.c
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-vp8.h
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-vp9.h
>>   create mode 100644 include/trace/events/v4l2_requests.h


