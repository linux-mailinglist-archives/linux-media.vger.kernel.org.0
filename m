Return-Path: <linux-media+bounces-52411-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL9ZFFzwiWn4EQAAu9opvQ
	(envelope-from <linux-media+bounces-52411-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 15:34:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC6711072A
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 15:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEEE4306175D
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 14:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2264437AA91;
	Mon,  9 Feb 2026 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b="hEHJSNrx"
X-Original-To: linux-media@vger.kernel.org
Received: from s.wfbtzhsw.outbound-mail.sendgrid.net (s.wfbtzhsw.outbound-mail.sendgrid.net [159.183.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815BF37B3E9
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 14:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.183.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647347; cv=none; b=seeuf4wQpXREaOgIN5geBZ3BBvNQoA4eFKnqF9qVgY778k5hPJb0WPY40q/Dsyj2FO3rKFl79i5/2LfmqGFLSAglc+qzqMkz4BRk3N0xvVE2O9sg4EQlw25FqIkwurDEzbOvmhjDP12kadHBm0zAd9Jvz4sV+/GnC8O4kWZNyL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647347; c=relaxed/simple;
	bh=5/L5229BpWzXQiVp8/QJ2srUCb8Ci2bzCKn/rM5lQ1g=;
	h=From:Subject:Date:Message-ID:MIME-Version:To:Cc:Content-Type; b=Q/dfM6+K2DFIXeNX8QdAd5RkYcSIxF29FaRDOrjP2yq6e/55axK2xk24BywyG1yRAT6ms0Jtd6LJnOu7bgpiuIVnvvYT2LgUaJkUunmyml58Ns+gnfa5qTpNY69p4Ld78IlTLc5cB4U3w+wvORdpJD+/RmEHDr9qfkVNmstnf5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net; spf=pass smtp.mailfrom=em431.mattwardle.net; dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b=hEHJSNrx; arc=none smtp.client-ip=159.183.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em431.mattwardle.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattwardle.net;
	h=from:subject:date:mime-version:to:cc:content-transfer-encoding:
	content-type:cc:content-type:date:from:subject:to;
	s=s1; bh=0P+DWjqQhj5LQ2rv/HlAFWFP4TtVYVBwobZwKW7tEwg=;
	b=hEHJSNrx+QUAvVaeeyisXHquDyPyAUeApA6zXg0cfWuqeAc6bjebhqTI1iXWk6etwxgS
	3XWdsFTa8qB1MGcrX9So+h7xtwAY0EdYmHbsM3ftANKr1tO2GICi3li+vbAFATZqeJrYO6
	Gxis8szUULWXcfXSZUgZylgxDNxyp5PUrSdJXGTuFUPakWwMUkFnmq0uBJaFBF+s3KAddW
	2W5zzKbe6G2q6s8I9bofOHZwRr6BGBg1zrwK5yaOPnKsmmIcagrOLY/7XLiiO2DreobMei
	wj6Rh5eG7/FLvHfK5P5OfoRNy38cSvYLuSoLoSFvaV+WFLGDVhAriejZ2X2QCIMQ==
Received: by recvd-canary-b5f5db649-lzhkp with SMTP id recvd-canary-b5f5db649-lzhkp-1-6989EF30-1
	2026-02-09 14:29:04.007824533 +0000 UTC m=+111014.035825142
Received: from mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (unknown)
	by geopod-ismtpd-17 (SG) with ESMTP
	id f-lUy845TyOK4cwzLe2-gg
	Mon, 09 Feb 2026 14:29:03.644 +0000 (UTC)
Authentication-Results: mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net; dmarc=fail (p=reject dis=none) header.from=mattwardle.net
Received: from thinkpad (unknown [161.142.117.49])
	by mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (Postfix) with ESMTPSA id 661C341178;
	Mon,  9 Feb 2026 14:29:02 +0000 (UTC)
From: Matt Wardle <matt@mattwardle.net>
Subject: [PATCH 0/3] staging: media: atomisp: Fix brace style issues
Date: Mon, 09 Feb 2026 14:29:04 +0000 (UTC)
Message-ID: <20260209142820.650334-1-matt@mattwardle.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2EFlbIg1=2FBrpD1HWcEBlj1tgh=2F0VDwewqbkmeZ1SFD9tLmzlDepFYnLmfnO?=
 =?us-ascii?Q?moWHy7n5HdVZTdyWWeMojZeck4brR+dCOzEnjg9?=
 =?us-ascii?Q?yt4D81nQ9wi2jrC5hyClnuh1wVSgqD6kXk8778l?=
 =?us-ascii?Q?mV+AHbWS3BEgGsUo7Qhj5+Q4ni4zxnWF7NZMLYW?=
 =?us-ascii?Q?SYkihO=2FdrO+kdhvcrU+Io5fAx9aynH0Q=2FGNq6VI?=
 =?us-ascii?Q?QPGVkiR5LhlVT+beSw9Q3gMmOEOio2aty9MJU9b?= =?us-ascii?Q?3YH2?=
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
	TAGGED_FROM(0.00)[bounces-52411-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mattwardle.net:mid,mattwardle.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AAC6711072A
X-Rspamd-Action: no action

This patch fixes errors, warnings and checks reported by checkpatch.pl
to comply with kernel coding style.

Matt Wardle (3):
  staging: media: atomisp: Fix braces on incorrect lines
  staging: media: atomisp: Remove braces for single statement blocks
  staging: media: atomisp: Fix missing braces for statement blocks

 .../base/circbuf/interface/ia_css_circbuf.h   |  3 +-
 .../circbuf/interface/ia_css_circbuf_desc.h   |  3 +-
 .../atomisp/pci/base/refcount/src/refcount.c  | 10 +--
 .../pci/camera/pipe/src/pipe_stagedesc.c      |  9 +--
 .../atomisp/pci/camera/pipe/src/pipe_util.c   |  3 +-
 .../host/isys_stream2mmio_private.h           |  3 +-
 .../host/event_fifo_private.h                 |  3 +-
 .../host/input_formatter.c                    |  3 +-
 .../hive_isp_css_common/host/input_system.c   | 14 ++--
 .../pci/hive_isp_css_common/host/irq.c        | 30 +++----
 .../pci/hive_isp_css_common/host/mmu.c        |  3 +-
 .../pci/hive_isp_css_common/host/vmem.c       |  4 +-
 .../isp/kernels/anr/anr_2/ia_css_anr2.host.c  |  3 +-
 .../pci/isp/kernels/bnlm/ia_css_bnlm.host.c   |  6 +-
 .../isp/kernels/ctc/ctc2/ia_css_ctc2.host.c   |  7 +-
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |  6 +-
 .../isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 13 ++--
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.c |  6 +-
 .../isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c |  3 +-
 .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |  6 +-
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |  9 +--
 .../isp/kernels/vf/vf_1.0/ia_css_vf.host.c    |  9 ++-
 .../atomisp/pci/runtime/binary/src/binary.c   | 78 ++++++++-----------
 .../pci/runtime/debug/src/ia_css_debug.c      |  6 +-
 .../pci/runtime/isp_param/src/isp_param.c     | 12 +--
 .../media/atomisp/pci/runtime/isys/src/rx.c   |  6 +-
 .../pci/runtime/isys/src/virtual_isys.c       |  3 +-
 .../pci/runtime/pipeline/src/pipeline.c       |  3 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |  7 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 12 +--
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  3 +-
 31 files changed, 116 insertions(+), 170 deletions(-)

-- 
2.53.0


