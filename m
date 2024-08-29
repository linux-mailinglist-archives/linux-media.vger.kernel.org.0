Return-Path: <linux-media+bounces-17125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E297896426D
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 12:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E29E1F277F4
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 10:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD0618DF91;
	Thu, 29 Aug 2024 10:58:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B67D158A33
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929103; cv=none; b=jQUF91BzEIO3Y4lGYUj59EHM1fxJPmlm/oowW07qrD/wHFGRPjhm737AEyWsIPq9ZeTCe4jdcja1Wr0j8jZzWlSSbFOqGiP09XR+8vaEAHFPp2RLvSjF2YC0ps5hGQhQlyt/fFRAqFOzlr/vLqYk9xjQxYFsLr+mEYtpnJI+Q8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929103; c=relaxed/simple;
	bh=BuTtJUyGMnr9h3gwONwxzkTs/i7h6+19eJ9xXEq/AtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tm3BPJd1MUW7Tb2qkE/ziKbJnN+1w/WU27TSfgJ+HwziqxEJalFOVEWQ8wKdVWCGgLKxjq+DYnPvO/CKVhjhhRjRY02UyANWdBQXa5lxXuaR216cXUkNrB/Yw47EDPNpLFBRjp67hq+33+I0hJFM9XtsyWzzNWU/iz34MGEF41U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C236DC4CEC1;
	Thu, 29 Aug 2024 10:58:21 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: [PATCHv3 0/3] media: mc: add manual request completion support
Date: Thu, 29 Aug 2024 12:55:36 +0200
Message-ID: <cover.1724928939.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Normally a request contains one or more request objects, and once all
objects are marked as 'completed' the request itself is completed and
userspace gets a signal that the request is complete.

Calling vb2_buffer_done will complete a buffer object, and
v4l2_ctrl_request_complete will complete a control handler object.

In some cases (e.g. VP9 codecs) there is only a buffer object, so
as soon as the buffer is marked done, the request is marked as
completed. But in the case of mediatek, while the buffer is done
(i.e. the data is consumed by the hardware), the request isn't
completed yet as the data is still being processed. Once the
data is fully processed, the driver wants to call
v4l2_ctrl_request_complete() which will either update an existing
control handler object, or add a new control handler object to the
request containing the latest control values. But since the
request is already completed, calling v4l2_ctrl_request_complete()
will fail.

One option is to simply postpone calling vb2_buffer_done() and do
it after the call to v4l2_ctrl_request_complete(). However, in some
use-cases (e.g. secure memory) the number of available buffers is
very limited and you really want to return a buffer as soon as
possible.

In that case you want to postpone request completion until you
know the request is really ready.

Originally I thought the best way would be to make a dummy request
object, but that turned out to be overly complicated. So instead
I just add a bool manual_completion, which you set to true in
req_queue, and you call media_request_manual_complete() when you
know the request is complete. That was a lot less complicated.

The first patch adds this new manual completion code, the second
patch adds this to vicodec so it is included in regression testing,
and the last patch is an updated old patch of mine that adds debugfs
code to check if all requests and request objects are properly freed.
Without it it is really hard to verify that there are no dangling
requests or objects.

I prefer to merge this third patch as well, but if there are
objections, then I can live without it.

Regards,

	Hans

Changes since v2:
- fixed use-after-free bug in the third patch in media_request_object_release().

Changes since the RFC:

- Added WARN_ONs
- vicodec was calling media_request_manual_complete() without
  checking that it was the stateless output queue first.
- Some minor cleanups in patch 3.

Hans Verkuil (3):
  media: mc: add manual request completion
  media: vicodec: add support for manual completion
  media: mc: add debugfs node to keep track of requests

 drivers/media/mc/mc-device.c                  | 30 +++++++++++++
 drivers/media/mc/mc-devnode.c                 |  5 +++
 drivers/media/mc/mc-request.c                 | 44 ++++++++++++++++++-
 .../media/test-drivers/vicodec/vicodec-core.c | 21 +++++++--
 include/media/media-device.h                  |  9 ++++
 include/media/media-devnode.h                 |  4 ++
 include/media/media-request.h                 | 38 +++++++++++++++-
 7 files changed, 144 insertions(+), 7 deletions(-)

-- 
2.43.0


