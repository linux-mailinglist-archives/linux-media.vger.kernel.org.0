Return-Path: <linux-media+bounces-20623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E24AA9B760B
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 09:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 989D11F21D71
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 08:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649C214F123;
	Thu, 31 Oct 2024 08:08:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089A814F102
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730362120; cv=none; b=OiUagLeOneA3kmmQOY+b3y/5vp0EvJddkwArIIse8sOjhPWDcLVyxhP/mySE46frdGbCQ3hMokdw0FJW91OSHEeFBFvLkQvn8+RggJidfuNYS1MQj3oNaV+AELUL2nZ5wSDgOCEFCvWK4l4a01jQXy/KFojd1J0sQugMyCyhd1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730362120; c=relaxed/simple;
	bh=A/eRyJ8eBPWhw5IaLbZqK5AXx7PNIWEZK7pFifWLWiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u0KysbSwYQPf9CuQA9n2+Bq2dECGLPD8zfy+DbpqaPBZgXWNOFxa90WNoGiffr+S9lqQLy3e8QTx80TXb8efyJsUbfmm56ZJ8SWcWG4VazewPuQ24oLwg+3//TbEkZw44vsdWtM/o3+tdvV6wAqs0WxjuGVLD0hy/NmiQcewMMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BECC4CEC3;
	Thu, 31 Oct 2024 08:08:38 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: nicolas@ndufresne.ca,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>
Subject: [RFC PATCH 0/2] media: vb2: introduce queue_info
Date: Thu, 31 Oct 2024 08:59:25 +0100
Message-ID: <cover.1730361567.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vb2 queue_setup function is very confusing since it is
used for both VIDIOC_REQBUFS and VIDIOC_CREATE_BUFS. Drivers
often implement this incorrectly.

This short series adds a new queue_info callback to use as
a replacement of queue_setup.

The queue_info callback just returns the number of planes
and plane sizes of the current format (and optionally the
devices to use to allocate each plane).

After that vb2 uses that information to deal with everything
else. This means that drivers that use queue_info can no
longer fiddle with the number of buffers the caller wants
to allocate. This is entirely controlled by q->min_queued_buffers
and q->min_reqbufs_allocation.

It makes both the vb2 code and the driver code much simpler.

The first patch makes the vb2 changes, and the second patch
converts the vivid driver to the new queue_info.

Comments are very welcome.

Regards,

	Hans

Hans Verkuil (2):
  media: vb2: introduce queue_info to replace queue_setup
  media: vivid: convert queue_setup to queue_info

 .../media/common/videobuf2/videobuf2-core.c   | 82 ++++++++++++++-----
 .../media/test-drivers/vivid/vivid-meta-cap.c | 17 ++--
 .../media/test-drivers/vivid/vivid-meta-out.c | 27 +++---
 .../media/test-drivers/vivid/vivid-sdr-cap.c  | 16 ++--
 .../test-drivers/vivid/vivid-touch-cap.c      | 18 ++--
 .../media/test-drivers/vivid/vivid-vbi-cap.c  | 13 ++-
 .../media/test-drivers/vivid/vivid-vbi-out.c  | 13 ++-
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 39 +++------
 .../media/test-drivers/vivid/vivid-vid-out.c  | 37 ++-------
 include/media/videobuf2-core.h                | 10 +++
 10 files changed, 126 insertions(+), 146 deletions(-)

-- 
2.45.2


