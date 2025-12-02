Return-Path: <linux-media+bounces-48043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 841F8C9A8F3
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE0783A5DDB
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F44302CB4;
	Tue,  2 Dec 2025 07:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sefxXJqm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408FD2FDC43
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661952; cv=none; b=CNpwuOjMgI0jgUadiSbj2qh7/+uhtYCpD4bnk+wUhLiUmnCGOLb4jV+E735v3MjD0XVeFY4xK13P4UdcUhnx80zscWVbUpi3eq3l0CE0H42F6+hGPfN7D1WutQd05EG4EGuCxJO4TOQJSjxGCMRFF+P2+XHLXuolsrwR+M75/Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661952; c=relaxed/simple;
	bh=nDFNgRCrkKgcSsFpK7bwh+l4OH3KGzniGWO/xMhgaPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mqn+DsxrzzXyBnKEV2oq8IYs4X+00dhuqyt2chH8cqg7fpiezWCtZVeyUKcejjOmeS+MUovwLBZrglUL4xN5fMSjs3fJQ7J1Pq4453Fjx/kaqDXXN0Lg57PjHFpo7pFe65quLw7ciBocTlDNMpk9qcqA0rQ4KyLf0sIKZgo0ZLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sefxXJqm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2ADC4CEF1;
	Tue,  2 Dec 2025 07:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661952;
	bh=nDFNgRCrkKgcSsFpK7bwh+l4OH3KGzniGWO/xMhgaPw=;
	h=From:To:Cc:Subject:Date:From;
	b=sefxXJqm7HaWQo70AWaIujH9WxUqOk1WH3Ta5EwubIK2bfW3GGQCf7nj0l3eyiuwS
	 GmWFKkwCOw0CNdfw3HEuUOchk9hGM0MDvSsyHewzQyrJaOj6skN3PP9NreA6fzZh1J
	 HMcbrZRhvvarBt3bqzHkpb03tyAD/UZ/VZw35XFpYFpfXHjy8p/QmWIUBBho/0YctJ
	 u5XC9eJxUmvX2CgAP5J7LnqQN5vKSiI8ntDs95XkbFNuQS8cM6bzjBw+RMUtpUJJji
	 I72miAkvLZqWPZmb0WK1pMtHTX6ypm1/hy5IO6qcz8Df2luan0CIQNyaKAhJgC8lDb
	 yPa5Mn94FnqUA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCHv3 00/12] media: omap3isp: v4l2-compliance fixes
Date: Tue,  2 Dec 2025 08:51:08 +0100
Message-ID: <cover.1764661880.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When I worked on the patch series to remove the vb2 wait_prepare/finish
callbacks, I had to test that series on my Beagle xM board with a
Leopard Imaging li5m03 camera.

Since I wanted to use v4l2-compliance to test the vb2 change, I first had
to fix a bunch of other compliance problems in this driver so it would
actually be able to run the streaming tests.

This series contains the fixes I made to get to that point.

It depends on one sensor driver fix (posted separately):

https://patchwork.linuxtv.org/project/linux-media/patch/554fb9d7-374b-4868-b91b-959b8fd69b4d@kernel.org/

This series doesn't fix all compliance problems, but at least it is
a lot better now.

Regards,

        Hans

Changes since v2:
- restored the first patch ("configure entity functions") that I
  accidentally dropped in v2.

Changes since v1:
- Simplify isp_video_enum_format by checking for duplicate pixelformats
- Drop -ENOTTY to -EINVAL change in isp_video_try_format.


Hans Verkuil (12):
  media: omap3isp: configure entity functions
  media: omap3isp: add V4L2_CAP_IO_MC and don't set bus_info
  media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus fixes
  media: omap3isp: implement enum_fmt_vid_cap/out
  media: omap3isp: use V4L2_COLORSPACE_SRGB instead of _JPEG
  media: omap3isp: set initial format
  media: omap3isp: rework isp_video_try/set_format
  media: omap3isp: implement create/prepare_bufs
  media: omap3isp: better VIDIOC_G/S_PARM handling
  media: omap3isp: support ctrl events for isppreview
  media: omap3isp: ispccp2: always clamp in ccp2_try_format()
  media: omap3isp: isppreview: always clamp in preview_try_format()

 drivers/media/platform/ti/omap3isp/ispccdc.c  |   1 +
 drivers/media/platform/ti/omap3isp/ispccp2.c  |   3 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c  |   1 +
 .../media/platform/ti/omap3isp/isppreview.c   |  26 ++-
 .../media/platform/ti/omap3isp/ispresizer.c   |   3 +-
 drivers/media/platform/ti/omap3isp/ispstat.c  |   1 +
 drivers/media/platform/ti/omap3isp/ispvideo.c | 178 +++++++++++++-----
 7 files changed, 152 insertions(+), 61 deletions(-)

-- 
2.51.0


