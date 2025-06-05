Return-Path: <linux-media+bounces-34101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A587AACEE33
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 288C13AA2EB
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 10:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9DB218AA3;
	Thu,  5 Jun 2025 10:59:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8646F2E659
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749121156; cv=none; b=pegEpncD+kBWR0L2ykcWo7d0UTtdDHlGQcNvYqCeKtf5S/+LNZxT2Dyll1p3rurQkd342kv/JnTFV1yhuXnL1Z4Soi+VN5840rcvFeYKAZo2mj0C8uDwYc/+QDPHZyKDtj9ZApSNINt7fWJ7ZeUkgiq0l/Onw0LAlJpxU9oEk4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749121156; c=relaxed/simple;
	bh=LN+yeybMBvdCraK3QSd7nItTVvnF6IkBmWPJmBYZXCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eHhSArvcWLf+gZd/UdKDEHfxzv/6Juaq74tqvVYu4G1V7NzJu/fNl2xO0LVIRxMzTYHi3BrQYblH0B+c7YS9UE2OW3beVcoRQCyF2CqjdRTo+1cruOfzxUcFALqzrG8EwO+JVjC1XexH2bELATSV43nEdEs7kOrpXqbc0+nSMCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A61FC4CEE7;
	Thu,  5 Jun 2025 10:59:15 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 0/9] v4l-utils: dvb: add streaming support
Date: Thu,  5 Jun 2025 12:58:23 +0200
Message-ID: <cover.1749121112.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series picks up where Satendra left it back in 2017.

The original patch added support for streaming I/O in dvbv5-zap and
dvbv5-scan, but it was incomplete, especially for dvbv5-scan.

The patches on top fix a number of issues, mainly relating to
dvbv5-scan, allowing that utility to also use the streaming I/O if
the -R option was specified. Various bugs were addressed and
finally a test was added to test-media.

This was used to test the kernel patches that drop the
wait_prepare/finish callbacks:

https://patchwork.linuxtv.org/project/linux-media/list/?series=15715

The media CI test of the kernel patches + these v4l-utils patches
is here:

https://gitlab.freedesktop.org/linux-media/users/hverkuil/-/pipelines/1443147

Regards,

	Hans

Hans Verkuil (8):
  dvbv5: use proper dvb_v5 namespace
  dvb-vb2: add dvb_v5_stream_alloc/free
  libdvbv5: prepare for vb2 stream context
  dvbv5-scan: add -R streaming option
  libdvbv5/dvb-v5-std.c: add DTV_BANDWIDTH_HZ where possible
  libdvbv5/dvb-scan: always requeue after dvb_parse_section
  libdvbv5/dvb-scan: flush any pending bufs after dvb_dmx_stop
  test-media: add initial vidtv streaming test

Satendra Singh Thakur (1):
  dvbv5: streaming support using videobuf2 for DVR and auto-scan

 contrib/test/test-media        |  50 +++++
 lib/include/libdvbv5/dvb-dev.h |   8 +
 lib/include/libdvbv5/dvb-fe.h  |   5 +
 lib/include/libdvbv5/dvb-vb2.h | 161 +++++++++++++++
 lib/libdvbv5/dvb-fe-priv.h     |   2 +-
 lib/libdvbv5/dvb-scan.c        | 112 +++++++++--
 lib/libdvbv5/dvb-v5-std.c      |   7 +
 lib/libdvbv5/dvb-vb2.c         | 349 +++++++++++++++++++++++++++++++++
 lib/libdvbv5/meson.build       |   2 +
 utils/dvb/dvbv5-scan.c         |  13 ++
 utils/dvb/dvbv5-zap.c          |  30 ++-
 11 files changed, 718 insertions(+), 21 deletions(-)
 create mode 100644 lib/include/libdvbv5/dvb-vb2.h
 create mode 100644 lib/libdvbv5/dvb-vb2.c

-- 
2.47.2


