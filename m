Return-Path: <linux-media+bounces-52503-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOXNC0n5imlSPAAAu9opvQ
	(envelope-from <linux-media+bounces-52503-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:24:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A56118D66
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66D93304E82E
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2AE340D86;
	Tue, 10 Feb 2026 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b="KywBmqDW"
X-Original-To: linux-media@vger.kernel.org
Received: from s.wfbtzhsw.outbound-mail.sendgrid.net (s.wfbtzhsw.outbound-mail.sendgrid.net [159.183.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B11B33F390
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.183.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715438; cv=none; b=qVAgmoKUrU1MAehZfqp57/Qq8KoRirC2a2J6Asg32w+cZg0FfalRNiO7FgPT5Fd0QQZsD+Jgdk/WZOafx4Jv3Z5phGzk+9+dJ1+uoAQkbTLVp3XbTbVleP8wzGijNJjE0iMfOaKeDf+yDV6IL1fA9fo2WRvnB92bpJpquS/6z4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715438; c=relaxed/simple;
	bh=e3tnrhU2WWQV4tzlMrOhm3+ZfchRekUzK45FwPsdrbI=;
	h=From:Subject:Date:Message-ID:MIME-Version:To:Cc:Content-Type; b=Q3kkkgRNy47y0h2aQoF8zOeCGcbk9aAQBe9SXwwUCSOZgBje0dhGVjOpmdRxYnijIDVFWaTbDkgGugvC0a3+aQTCRZngw2QU0rpcctN/cS0v0qjyoTgj+hElbI+o4jQi1t7RIeZ0aIvanqD4N8MzFXCrvToRBt7Z8Jv9Kebt5wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net; spf=pass smtp.mailfrom=em431.mattwardle.net; dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b=KywBmqDW; arc=none smtp.client-ip=159.183.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em431.mattwardle.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattwardle.net;
	h=from:subject:date:mime-version:to:cc:content-transfer-encoding:
	content-type:cc:content-type:date:from:subject:to;
	s=s1; bh=a3lliGT1ClyKInWlMgfue2ry7gl/2QxUj9xD6roeLiQ=;
	b=KywBmqDWeIcx+3YYKqAD+/uhJBSckY+PIHKEdFFd5tYpxTrXG/oRHXelRwE6VC9aHExj
	Gi2terAP0A7a4p0+J9SE7sCiepNLD/vLFWXkOBjJoYm3Rvc8uyLIT9B6ujnO0NKqiJn8w1
	GdvfVnRQnSIDoARNooH3AFZJL2o478pHKuAqmocfaBkh0NcFMyYzEiyZIFVq33HEIUkpzt
	jWwmAS0UMCICFOzS7cOsC63qwcJVZh/MK7N7AvF5qBeJnSNqPj1x7TtzbK+H5pazkeed/6
	D0ghbwMbRyWA+myHR1zcT7A/S3LmI0uOIbBE24YUfu849Uitpbrp5ZzxuoafgbSw==
Received: by recvd-canary-7cf988d8f6-zmwhk with SMTP id recvd-canary-7cf988d8f6-zmwhk-1-698AF92A-1C
	2026-02-10 09:23:54.502465973 +0000 UTC m=+5299.866422509
Received: from mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (unknown)
	by geopod-ismtpd-0 (SG) with ESMTP
	id oevtbXT0T1K2NE3fLb7K4g
	Tue, 10 Feb 2026 09:23:54.008 +0000 (UTC)
Authentication-Results: mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net; dmarc=fail (p=reject dis=none) header.from=mattwardle.net
Received: from thinkpad (unknown [161.142.117.49])
	by mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (Postfix) with ESMTPSA id 2DB5940E37;
	Tue, 10 Feb 2026 09:23:53 +0000 (UTC)
From: Matt Wardle <matt@mattwardle.net>
Subject: [PATCH 0/3] staging: media: atomisp: Fix style issues
Date: Tue, 10 Feb 2026 09:23:54 +0000 (UTC)
Message-ID: <20260210092243.294732-1-matt@mattwardle.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2EFlbIg1=2FBrpD1HWcEBlj1tgh=2F0VDwewqbkmeZ1SFD9tLmzlDepFYnLmfnO?=
 =?us-ascii?Q?moWHy7n5HdVZTdyWWeMojZeck4brYOZU6=2Fl2TRZ?=
 =?us-ascii?Q?fFgNnVNO1q5b60i7K0d1=2F9ASuQDgZz1RTRjSZjG?=
 =?us-ascii?Q?GrBFNs8Xit+qOsR2OcybvqhZxs6tNhKStKuil8r?=
 =?us-ascii?Q?6zqXlBDL5YBETuw+5HVUr8APN3yd9xEJ+QxVxrl?=
 =?us-ascii?Q?dM5jE0mHLs2xNLgxE64vLrcMYqEYQSjA63kCCi+?= =?us-ascii?Q?=2FPoo?=
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Matt Wardle
	<matt@mattwardle.net>
X-Entity-ID: u001.OAl4HwJfzvoR6h5DRlrySA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mattwardle.net,reject];
	R_DKIM_ALLOW(-0.20)[mattwardle.net:s=s1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mattwardle.net:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52503-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@mattwardle.net,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mattwardle.net:mid,mattwardle.net:dkim,checkpatch.pl:url]
X-Rspamd-Queue-Id: A5A56118D66
X-Rspamd-Action: no action

This patch fixes errors and warnings reported by checkpatch.pl to
conform to kernel coding style.

Matt Wardle (3):
  staging: media: atomisp: Remove braces for single statement blocks
  staging: media: atomisp: Fix function indentation and braces
  staging: media: atomisp: Fix braces on incorrect lines

 .../base/circbuf/interface/ia_css_circbuf.h   |   3 +-
 .../circbuf/interface/ia_css_circbuf_desc.h   |   3 +-
 .../atomisp/pci/base/refcount/src/refcount.c  |   3 +-
 .../pci/camera/pipe/src/pipe_stagedesc.c      |   9 +-
 .../atomisp/pci/camera/pipe/src/pipe_util.c   |   3 +-
 .../host/isys_stream2mmio_private.h           |   3 +-
 .../host/event_fifo_private.h                 |   3 +-
 .../host/input_formatter.c                    |   3 +-
 .../hive_isp_css_common/host/input_system.c   |  14 +--
 .../pci/hive_isp_css_common/host/irq.c        |  30 ++---
 .../pci/hive_isp_css_common/host/mmu.c        |   3 +-
 .../pci/hive_isp_css_common/host/vmem.c       |   4 +-
 .../isp/kernels/anr/anr_2/ia_css_anr2.host.c  |   3 +-
 .../pci/isp/kernels/bnlm/ia_css_bnlm.host.c   |   6 +-
 .../isp/kernels/ctc/ctc2/ia_css_ctc2.host.c   |   7 +-
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |  14 +--
 .../isp/kernels/eed1_8/ia_css_eed1_8.host.c   |  13 +-
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.c |   7 +-
 .../isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c |   3 +-
 .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |   6 +-
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |  13 +-
 .../isp/kernels/vf/vf_1.0/ia_css_vf.host.c    |  25 ++--
 .../atomisp/pci/runtime/binary/src/binary.c   | 111 +++++++-----------
 .../pci/runtime/debug/src/ia_css_debug.c      |   6 +-
 .../pci/runtime/isp_param/src/isp_param.c     |  24 ++--
 .../pci/runtime/isys/src/virtual_isys.c       |   3 +-
 .../pci/runtime/pipeline/src/pipeline.c       |   3 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |   6 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  12 +-
 29 files changed, 134 insertions(+), 209 deletions(-)

-- 
2.53.0


