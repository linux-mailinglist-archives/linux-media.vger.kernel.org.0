Return-Path: <linux-media+bounces-56781-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DMDOBThwWlhXgQAu9opvQ
	(envelope-from <linux-media+bounces-56781-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 01:55:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4550A30012D
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 01:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A690E30210C5
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 00:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D0833B6FC;
	Tue, 24 Mar 2026 00:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SglrZmc0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5EF33A6EB
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 00:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774313742; cv=none; b=ZgFxkNKjWFEo0F2MhR6DZ4ODSatyJKgs1CCht00zdTEmYwXoNX8vRAjaP7fG+LyrkrwORU7DGynTv/Kph4G118mWF7TeZtiqVN8/VIjRMCTczxE86H2mjmJPvAJKPejoE0CoKast2Km5YrwhaeKFbsEf82WqHCaKsQQarp3D1+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774313742; c=relaxed/simple;
	bh=fOXRVJYkLwRZbioTX2rMq7tzlqCpWU027+pprA6w/9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aDqW2lW+q43Y4oe7rnNufUhZfgB8t/4xVp1HEnIcm+B8EYERLXDJ0heFvdWnZ2iVlfzmZSSEmncfxUgKGca2frZmW3EoznExxdP4Hlbt38EnUBZbbf0FX9dDDf0egO85HBEgd5g13Ly/4DIp/I/HFkRkRmWGO0Os5Jzselsy3og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SglrZmc0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5DCC2289;
	Tue, 24 Mar 2026 01:54:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774313662;
	bh=fOXRVJYkLwRZbioTX2rMq7tzlqCpWU027+pprA6w/9M=;
	h=Date:From:To:Cc:Subject:From;
	b=SglrZmc04GZjLDx9tiCT7oemfzFe3lU5HcyeMRbRXnm4nPIWd0o3tk2h9w8nHhLXw
	 5Bci7DMJn/1theT+QcG8KvhzfkXMe4CIe18fDakJzfGEJs4+/uJfmhKrueR3ACJMVM
	 ml5HMTj286yy2jIYRbg5ur5mummwkqGxy24QJCBY=
Date: Tue, 24 Mar 2026 02:55:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Oliver Collyer <ovcollyer@mac.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yogev Modlin <yogev.modlin@realsenseai.com>
Subject: [GIT PULL FOR v7.1] media: uvcvideo changes
Message-ID: <20260324005537.GA2352505@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,mac.com,chromium.org,realsenseai.com];
	TAGGED_FROM(0.00)[bounces-56781-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 4550A30012D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

The following changes since commit 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67:

  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30 (2026-03-19 08:18:36 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/next-media-uvc-20260324

for you to fetch changes up to 1c9c2fe9350e1b92f35bd295bf4bba0d72cfbde2:

  media: uvcvideo: Add support for P010 pixel format (2026-03-24 02:33:54 +0200)

----------------------------------------------------------------
Improvements to the uvcvideo driver:

- VB2_DMABUF and configurable buffer size support for metadata stream
- Intel RealSense D436 and D555 cameras support
- P010 pixel format

----------------------------------------------------------------
Oliver Collyer (1):
      media: uvcvideo: Add support for P010 pixel format

Ricardo Ribalda (4):
      media: uvcvideo: Enable VB2_DMABUF for metadata stream
      media: uvcvideo: uvc_queue_to_stream(): Support meta queues
      media: uvcvideo: Allow userspace to increase the meta buffersize
      media: uvcvideo: Add a stream backpointer in uvc_video_queue

Yogev Modlin (2):
      media: uvcvideo: Change comment to 'Intel RealSense'
      media: uvcvideo: Add D436 and D555 cameras metadata support

 drivers/media/common/uvc.c           |  4 ++++
 drivers/media/usb/uvc/uvc_driver.c   | 38 ++++++++++++++++++++++++++----------
 drivers/media/usb/uvc/uvc_isight.c   |  2 +-
 drivers/media/usb/uvc/uvc_metadata.c |  9 +++++++--
 drivers/media/usb/uvc/uvc_queue.c    | 23 +++++++++++-----------
 drivers/media/usb/uvc/uvc_v4l2.c     |  3 +++
 drivers/media/usb/uvc/uvcvideo.h     | 13 +++++-------
 include/linux/usb/uvc.h              |  3 +++
 8 files changed, 62 insertions(+), 33 deletions(-)

-- 
Regards,

Laurent Pinchart

