Return-Path: <linux-media+bounces-52662-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JU0Fo/+jWm0+AAAu9opvQ
	(envelope-from <linux-media+bounces-52662-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:23:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F9A12F579
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BFC53046D9C
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 16:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BB7344DB8;
	Thu, 12 Feb 2026 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BV6L1RM7"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596822F3609;
	Thu, 12 Feb 2026 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913418; cv=none; b=dthqXigDAtOo+pOw0Prnb2PHxRXLNuY6PhWZsEHTld+FFwdtjC+wsSqF5O1EUBfVizP/roJND52o3m6bG9xF4w0LjyWTNTwLGtdFx/CpV9nSews6Y8FzKrclvBt6PA8xNDMsYk+NtJ00uh2CydrVn9rF8yPqUd0VrsDbKCALOpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913418; c=relaxed/simple;
	bh=vKHba+1je6XUmekM9HNLXtq/mx/vqDtmehn8UfltiBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RTRoK6o023mC6YmD/oXpU32Ln0+IRZ6Hbg7iPMeBTIsxS1Z/uw9xZT/uiXl5NkPgEuFdOtO0/BZioreKBaibFPX3rzrKEn/QqQziz5Z8OxaizpQf4mKxeqOMH9tnTElT5189uxj43EEjddIdeISb4BsXeogBn+KVyajVjtOTJ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BV6L1RM7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770913415;
	bh=vKHba+1je6XUmekM9HNLXtq/mx/vqDtmehn8UfltiBQ=;
	h=From:To:Cc:Subject:Date:From;
	b=BV6L1RM7tudUID6t9OgTGsWiwr2lskE7NWHxi4W6Lr6n2nSvM4wVO4E9CYC132khh
	 ARFAh1JU/HM3Nz6eXUPe+9/PE5n6NeDpRVpWiR1XCNJoA22t+/c1AiCLNTVZv6TvDq
	 Yo6kqhtRdOzeDmJb++jYN+e9Hnw03YumVzdL3kSA8zlAeVv8Fx2C9fvq+8mzcDRN9c
	 4KXiOIcxy1h3GkgJFyhXGKBGVKEqrOIxjANCL/wK4Mqv1lEZI+FIwa9BJHbcVn/eHI
	 71DLd9qVpeNng3sCRbONSgBhL2GcId/ixi6DGWNHt+VsdHV7wWmkOMJaAzi03sppug
	 WuNobTvOZOjXw==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 285EA17E0E6A;
	Thu, 12 Feb 2026 17:23:32 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavan Bobba <opensource206@gmail.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Ma Ke <make24@iscas.ac.cn>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 00/11] v4l2: Add tracing for stateless codecs
Date: Thu, 12 Feb 2026 11:23:17 -0500
Message-ID: <20260212162328.192217-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52662-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,sntech.de,goodmis.org,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C9F9A12F579
X-Rspamd-Action: no action

Hi !

This patchset aims to improve codec event tracing in v4l2.

The traces added in visl by Daniel Almeida are moved to the global trace
events and slightly reworked to be printed in a more consistent format.

To each trace are also added a tgid and fd fields, helping userspace track
different decoding sessions (contexts) based on the given file descriptor
used by the given process id.

Also for better tracking, stream on and stream off events are added as
well as HW run and HW done events to track decoder core usage.

Finally, add a show_fdinfo callback on video device files, allowing drivers
to expose usage information.
Currently only used for frame buffer memory usage.

The main focus is to be able to generate perfetto traces to show VPU usage,
a perfetto producer using this can be found at [1].

[1]: https://gitlab.collabora.com/detlev/hantro-perf/-/tree/hantro-improved-info

Detlev Casanova (11):
  media: Move visl traces to v4l2-core
  media: Reformat v4l2-requests trace event printk
  media: Add tgid and fd fields in v4l2_fh struct
  media: Add tgid and fd to the v4l2-requests trace fields
  media: Add missing types to v4l2_ctrl_ptr
  media: Trace the stateless controls when set in v4l2-ctrls-core.c
  media: Add stream on/off traces and run them in the ioctl
  media: Add HW run/done trace events
  media: hantro: Add v4l2_hw run/done traces
  media: v4l2: Add callback for show_fdinfo
  media: hantro: Add fdinfo callback

 drivers/media/platform/verisilicon/hantro.h   |    2 +
 .../media/platform/verisilicon/hantro_drv.c   |   25 +
 .../media/platform/verisilicon/hantro_v4l2.c  |   10 +-
 .../verisilicon/rockchip_vpu981_regs.h        |    1 +
 .../platform/verisilicon/rockchip_vpu_hw.c    |    4 +
 drivers/media/test-drivers/visl/Makefile      |    2 +-
 drivers/media/test-drivers/visl/visl-dec.c    |   76 -
 .../media/test-drivers/visl/visl-trace-av1.h  |  314 ---
 .../media/test-drivers/visl/visl-trace-fwht.h |   66 -
 .../media/test-drivers/visl/visl-trace-h264.h |  349 ----
 .../media/test-drivers/visl/visl-trace-hevc.h |  464 -----
 .../test-drivers/visl/visl-trace-mpeg2.h      |   99 -
 .../test-drivers/visl/visl-trace-points.c     |   11 -
 .../media/test-drivers/visl/visl-trace-vp8.h  |  156 --
 .../media/test-drivers/visl/visl-trace-vp9.h  |  292 ---
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |   10 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  114 +
 drivers/media/v4l2-core/v4l2-dev.c            |   10 +
 drivers/media/v4l2-core/v4l2-fh.c             |    1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   37 +-
 drivers/media/v4l2-core/v4l2-trace.c          |   48 +
 include/media/v4l2-ctrls.h                    |   19 +
 include/media/v4l2-dev.h                      |    1 +
 include/media/v4l2-fh.h                       |    4 +
 include/trace/events/v4l2.h                   |   58 +
 include/trace/events/v4l2_requests.h          | 1836 +++++++++++++++++
 26 files changed, 2178 insertions(+), 1831 deletions(-)
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-av1.h
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-fwht.h
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-h264.h
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-hevc.h
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-mpeg2.h
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-points.c
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-vp8.h
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-vp9.h
 create mode 100644 include/trace/events/v4l2_requests.h

-- 
2.53.0


