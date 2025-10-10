Return-Path: <linux-media+bounces-44160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AA812BCC725
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 977884E3022
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 09:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B454B2D027F;
	Fri, 10 Oct 2025 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHnzJWfa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C57820A5EA
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760090254; cv=none; b=TnCnL50sop9kunNGYOaIf/HMMN1t4+AyAyjO6drOQ6G/AimKvBkpBZRm3J3aGjynjF1KgqYi02BpoOr9GHGQFWhD/MCKFcWXz4eK2V9jOZ82plfPNYz9sidv5MIaUET834000HBPbPkXKF5oHc3QJXL0itCHjNbP7LmlmZFPyDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760090254; c=relaxed/simple;
	bh=qOTMb1hNGnhFiWf/BPV990LmiEIYuhIS3gVTzAmtvI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AVTfJeHuPyuc5jiCw0G7QGja4g5J/2GXY+hofWJIFqNi0FkNh+VlS/8DmFGHTftUuYwnq4elQHiT+RUZSFdVGqOzbOPT64kaYxCOM94KBlWtz05kko666HU72Q97eAh4bq6YAQsIiuD0IFvdmoUrDdWOdAK3VdDfYyQId4PpxVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHnzJWfa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A482C4CEF1;
	Fri, 10 Oct 2025 09:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760090253;
	bh=qOTMb1hNGnhFiWf/BPV990LmiEIYuhIS3gVTzAmtvI8=;
	h=From:To:Cc:Subject:Date:From;
	b=oHnzJWfagoMQFWW11rGXiDP4CLFS+tN3AvqfFisYuAD1W08eLUWRXMWFa10eC9SWQ
	 dkxoaSBm3sXHAGIjiwPnMJYihxWzMaln2W88ThsSdIW8W6UlxOwTDXCOB08NujhGau
	 Fg2AIvbje+mpCuCmyDphaZMM3wlR3Jvg57EXz+KC8xH55Lz4iKcJuxraSeUUM8NgQz
	 XCORrb4RMVdDUjE9s3Kpe0q5dxNRlf0ufNdpnZaTykpBz/rXq8WI/xz+gASNDMPMF+
	 Oup08YOLTlBpUr0KXdx5fLQnFnQeHrFBZDurchrznqLtasl6gV0yqM+iS6sGMAKWAe
	 p03FKIG2IyoFA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [RFC PATCH 0/5] media: events: add new flags
Date: Fri, 10 Oct 2025 11:54:05 +0200
Message-ID: <cover.1760090050.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note: this patch series sits on top of this patch:

https://patchwork.linuxtv.org/project/linux-media/patch/063bd6f7-e9c0-4dfa-babe-cd004cfc4552@kernel.org/

However, it can be rebased if needed without that patch.

This series adds a flags field for v4l2_event and adds two flags:
one to indicate that the event is the initial event as requested
by V4L2_EVENT_SUB_FL_SEND_INITIAL, and one flag to indicate that
the event is a merger multiple events, meaning that some history
is lost.

This information is particularly useful when debugging event
issues.

Regards,

	Hans

Hans Verkuil (5):
  media: videodev2.h: add flags field to v4l2_event
  media: videodev2.h: add new v4l2_event flags
  media: v4l2-event: add support for V4L2_EVENT_FL_MULTIPLE
  media: v4l2-ctrls: set the new V4L2_EVENT_FL_INITIAL flag
  Documentation: media: document new event flags

 .../media/v4l/vidioc-dqevent.rst              | 29 +++++++++++++++++--
 .../media/v4l/vidioc-subscribe-event.rst      |  6 ++--
 .../media/videodev2.h.rst.exceptions          |  7 +++--
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  8 +++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  1 +
 drivers/media/v4l2-core/v4l2-event.c          |  3 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +--
 include/uapi/linux/videodev2.h                |  6 +++-
 8 files changed, 52 insertions(+), 12 deletions(-)

-- 
2.51.0


