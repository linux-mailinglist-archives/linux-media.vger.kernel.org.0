Return-Path: <linux-media+bounces-60163-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNVfEA369GnmGgIAu9opvQ
	(envelope-from <linux-media+bounces-60163-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 21:07:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9984AF0B5
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 21:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B1193002B00
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 19:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56ABE3EF67E;
	Fri,  1 May 2026 19:07:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2228E316905;
	Fri,  1 May 2026 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777662474; cv=none; b=cLLioInSLeuGYK37BAHnpHsmgML/vFECyPACyrdZxbjENJnj5MdAe9g5G2i0TOvZjUYPNlhFM3FT60XJXXj00/u4v+MwGf8uFzZb3aO+JQcg3jzj9dtEwSaVslsZVir7TOqYgms0wkFCsci2UNRu6p/zRAKKlKRGCbQq9vxYzfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777662474; c=relaxed/simple;
	bh=nC4Hpifpq/y79S2kr1v96k5enNp3JCMeIJWnqGn9mF0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UIUTMU5W3xmOpKpapnVaC3ukV6/rgS6kXEqFjXP39Jk+gqt/Zu/jDGs6dHG1saI7j+8Cc5T3dL2urHMIlL5/uy4UY+obAfWgIMhSBUeuG4xJ29PwqhK7sgdxZqmYE8pnNtzC3rE0n6rjwEfOCUW82nmoY3DL0FvY9ZNukTNNuas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 991E2A020D;
	Fri,  1 May 2026 19:07:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id 769B32002A;
	Fri,  1 May 2026 19:07:43 +0000 (UTC)
Date: Fri, 1 May 2026 15:07:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Daniel Almeida <daniel.almeida@collabora.com>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Ricardo
 Ribalda <ribalda@chromium.org>, Yunke Cao <yunkec@google.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, Ma Ke <make24@iscas.ac.cn>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally
 <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 01/11] media: Move visl traces to v4l2-core
Message-ID: <20260501150744.065081ac@gandalf.local.home>
In-Reply-To: <20260212162328.192217-2-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
	<20260212162328.192217-2-detlev.casanova@collabora.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ukwp7o711oh9hqdcagr83o8ipbi84ubz
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18DLft44k2YZeX2Udu1SeE+L6rSwk5PnC0=
X-HE-Tag: 1777662463-242147
X-HE-Meta: U2FsdGVkX18HZ+JhHq9zIZprVHj8AGRMlv1oqYmjfGya9vaHea71t0EKjSn80nvm9Il4U7tne7/JdmHSroYcDA55tm7YVqGnxZtHrugibYTMD1JUiRqPTwQ5j9dkCF503SnUMmQ3WkDZXk8giuSr8g1YOaufsDbgX4Zn/1l1PRfIYZFetI5mngS6Wj7K76RpbuZJBRevihBBniFKGJxL575k0aJI8SevXXAClsYrRFmSQjHzLWFOCNllh/V4Q/pLW/FbuV0Qoj2JmWxeW2ulqkSJwE0aOcIhwqtqwDqnDO4NtURAcY8QIN20NCLerIUhVriTtPJHRfRzKlDs5JQJMKd3wDWbGC/PbxGfQEEGX3lZfBAUGJdgyqIEJKZyCnp/MFj37lOeNTKJSXwLFxCbz7j6ig0eE/an8d3WIfZQaXfgcgHFeLMFZuMiA8THIp57
X-Rspamd-Queue-Id: BD9984AF0B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60163-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,collabora.com,pengutronix.de,kernel.org,sntech.de,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:email]


Sorry, I didn't look at these patches at the time they were posted, but
when I saw you reply recently with:

 "On the userspace side, each trace events can be enabled separately and 
  even filtered (although I'm not sure filtering is good for performance, 
  has it has to match each event with a regex)."

I had to see what you meant by regex, because no tracer should be using
regex for filtering.

On Thu, 12 Feb 2026 11:23:18 -0500
Detlev Casanova <detlev.casanova@collabora.com> wrote:

> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_sequence *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_sequence, s)),
> +	TP_fast_assign(__entry->s = *s;),

What the heck! You are copying an entire structure onto the ring buffer to
print just a portion of it? This is really a waste of ring buffer, and also
prevents you from doing any real filtering.

You do realize that you can filter on fields (if they are defined as normal
fields).

 For example, 

  # cd /sys/kernel/tracing
  # echo 'height > 20 && width > 30' > events/visl_fwht_controls/v4l2_ctrl_fwht_params/filter
  # echo 1 > events/visl_fwht_controls/v4l2_ctrl_fwht_params/enable

And that will only trace that event where the height field is greater than
20 and the width field is greater than 30. It's converted into a fast array
to do the filtering. No regex involved.

Also, there's a library to read the raw events from the ring buffers where
you can do filtering on the read side too:

  https://trace-cmd.org/Documentation/libtracefs/
  https://trace-cmd.org/Documentation/libtraceevent/

-- Steve

> +	TP_printk("\nhorizontal_size %u\nvertical_size %u\nvbv_buffer_size %u\n"
> +		  "profile_and_level_indication %u\nchroma_format %u\nflags %s\n",
> +		  __entry->s.horizontal_size,
> +		  __entry->s.vertical_size,
> +		  __entry->s.vbv_buffer_size,
> +		  __entry->s.profile_and_level_indication,
> +		  __entry->s.chroma_format,
> +		  __print_flags(__entry->s.flags, "|",
> +		  {V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE, "PROGRESSIVE"})
> +	)
> +);
> +

