Return-Path: <linux-media+bounces-64455-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y1lvE4Z4KWp+XQMAu9opvQ
	(envelope-from <linux-media+bounces-64455-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:45:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB75866A5BA
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:45:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=eqNHc+Z8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64455-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64455-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AE7830500ED
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5577334104E;
	Wed, 10 Jun 2026 14:34:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227373C1086;
	Wed, 10 Jun 2026 14:34:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102053; cv=none; b=X3D5q9owGkD3ulzccqH71RM6r3chj6s+uSqa0UZ56Cmop94CpYemKKLLuE21K+D06UQmdPflxB7X7Hj8BWPzZhvxAWmMvC1E3gBsBsBXiQZOrgcF+3RjfxK804qJk5My2NgZHguCxVuXXRk3Y80mD7SdC6bRxpDsC+fge1L8ANA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102053; c=relaxed/simple;
	bh=nncoYMbLy5u1NQPFDhSMLiKTiqSyPaMakLjfc9HXMHE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yussu8vTbUS8ViW6qaqaRpQAOLJRVinJSmAENpNddL2RPtY44ktMuwZ8vE9xu4pwxM2CgOnfq7qMCAS87DxRt0cKRG3UQYN1lrLbZVdu2iM2xnnyit2f1uQJ+J1z+1WJsVqoLgX5dukmbw9OW3Gn12qK2S70O9AxWesP7p9N390=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eqNHc+Z8; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781102048;
	bh=nncoYMbLy5u1NQPFDhSMLiKTiqSyPaMakLjfc9HXMHE=;
	h=From:Subject:Date:To:Cc:From;
	b=eqNHc+Z816CnZPB+kGHXUypknfDDcDi+dCk1whzPCqdZEPZU35Xlu3WquMj/oqJj6
	 PjSBMs8JfaI+BUCAFITZCzMd3mb8B+C1GR96o6LR+cmaO36tvQrvp7uXAzA/8OQ8YI
	 K06mZrhkCU72A+q/GwUKV0R3EvrjhIz0W/k08c27cWWX97elfW0xqTEcX4CvZ3fCwm
	 1cmETf2EPPKyMDPeRN6ATY/XnOzLYg5k2CzMS2X1kS5BuBtV68t7QOWzn3GyYB5NkF
	 4n3OHmMZ2DVyloszABmWeeCuHQaQ0HBwQ77GDmqKdaRbkuYd8CP3kAojwXn3BwyotN
	 7xujcPd93rnXg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA9C017E0416;
	Wed, 10 Jun 2026 16:34:06 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 0/9] v4l2: Add tracing for stateless codecs
Date: Wed, 10 Jun 2026 10:33:30 -0400
Message-Id: <20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTsQQhnFq4iL6eSPjkhbklqE0
 rsbdfkt3tuoojgqnbuNClavPo0N8dCR3XW8gT01UwxRgoQTr/0zsqbEeSlqYIUJjlmCilGr5oL
 s79/xcv27voYHbPluaN8/68O1uHMAAAA=
X-Change-ID: 20260608-v4l2-add-ftrace-aec6e7f60a6c
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:mchehab@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:kernel@collabora.com,m:detlev.casanova@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-64455-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,collabora.com:url,collabora.com:from_mime,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB75866A5BA

Hi !

This patchset aims to improve codec event tracing in v4l2.

The traces added in visl by Daniel Almeida are moved to the global trace
events.
They are adapted to trace each each field separately and not just the
whole struct so that userspace can filter on different fields and
libraries like libtracefs and libtraceevent can be used to list the
fields instead of parsing the trace printk's.

The trace event templates are also reworked to avoid long lines, but
quoted string splits are kept as they don't cut words.

To each trace event are also added a tgid and fd fields, helping
userspace track different decoding sessions (contexts) based on the given
file descriptor used by the given process id.

Also for better tracking, stream on and stream off events are added as
well as HW run and HW done events to track decoder core usage.

The main focus is to be able to generate perfetto traces to show VPU usage,
a perfetto producer using this can be found at [1] (it will be renamed to
match the more generic approach than hantro).
Other controls can be traced later as well, this patch set only focuses on
mem2mem type drivers.

[1]:
https://gitlab.collabora.com/detlev/hantro-perf/-/tree/hantro-improved-info

Changes since v1:
- Don't modify the printk format
- Trace all fields of the structs instead of the whole struct as a buffer
- Remove fdinfo patches (they will come in another patch set)
- Fix long lines
- Rename v4l2_requests.h trace header to v4l2_controls.h
- Add basic documentation

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Detlev Casanova (9):
      media: Move visl traces to v4l2-core
      media: Map each struct field to its own trace field
      media: Add tgid and fd fields in v4l2_fh struct
      media: Add tgid and fd to the v4l2-requests trace fields
      media: Add missing types to v4l2_ctrl_ptr
      media: Trace the stateless controls when set in v4l2-ctrls-core.c
      media: Add stream on/off traces and run them in the ioctl
      media: Add HW run/done trace events
      media: hantro: Add v4l2_hw run/done traces

 drivers/media/platform/verisilicon/hantro.h        |    1 +
 drivers/media/platform/verisilicon/hantro_drv.c    |   10 +
 .../platform/verisilicon/rockchip_vpu981_regs.h    |    1 +
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |    4 +
 drivers/media/test-drivers/visl/Makefile           |    2 +-
 drivers/media/test-drivers/visl/visl-dec.c         |   76 -
 drivers/media/test-drivers/visl/visl-trace-av1.h   |  314 ---
 drivers/media/test-drivers/visl/visl-trace-fwht.h  |   66 -
 drivers/media/test-drivers/visl/visl-trace-h264.h  |  349 ---
 drivers/media/test-drivers/visl/visl-trace-hevc.h  |  464 ----
 drivers/media/test-drivers/visl/visl-trace-mpeg2.h |   99 -
 .../media/test-drivers/visl/visl-trace-points.c    |   11 -
 drivers/media/test-drivers/visl/visl-trace-vp8.h   |  156 --
 drivers/media/test-drivers/visl/visl-trace-vp9.h   |  292 ---
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   10 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  114 +
 drivers/media/v4l2-core/v4l2-fh.c                  |    1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   37 +-
 drivers/media/v4l2-core/v4l2-trace.c               |   48 +
 include/media/v4l2-ctrls.h                         |   19 +
 include/media/v4l2-fh.h                            |    4 +
 include/trace/events/v4l2.h                        |   77 +
 include/trace/events/v4l2_controls.h               | 2708 ++++++++++++++++++++
 23 files changed, 3033 insertions(+), 1830 deletions(-)
---
base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
change-id: 20260608-v4l2-add-ftrace-aec6e7f60a6c

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


