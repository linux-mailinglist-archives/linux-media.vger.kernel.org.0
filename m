Return-Path: <linux-media+bounces-17017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 240F6962794
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4D62284B33
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC74817799F;
	Wed, 28 Aug 2024 12:46:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AFB156C4B
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849160; cv=none; b=gtXCwihc1QkWvz8jPCCq2O44CV+ggqQmb6FVu0M+6htZg7yRKIgtDwLxIh820grTrEtURNOaJgGsd6IlPDv+c5gL2GP4EyCQA+CZGajUifrLSJWPQEL640F/0XY3aMCyMtWIaCuYa8GekmQllFcrlOH6O/PG1KDfmdeetDGKEI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849160; c=relaxed/simple;
	bh=3GXqPrttu9tQeF+We0bTUH9btHaqjvi5mmaLwrOrUwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F2AKQXf+qWtE6Op9NX7IDxMxRak8+Ha+cxalvJmJRJNO9IQURqb8fVhYgIIQAVcCRQnVWQ6foZ4C2jJkYM1QOwa9tGGbiPl+dimwMulZLeSbevpVnGfFLM+p/A7kWoiJsd4sVLexSUJw/yxK51Ky2/Y74NiKKWLQhKuHm+CjAUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A151C4AF62;
	Wed, 28 Aug 2024 12:45:59 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: [PATCH 0/4] media: mc: add manual request completion support
Date: Wed, 28 Aug 2024 14:37:36 +0200
Message-ID: <cover.1724848660.git.hverkuil-cisco@xs4all.nl>
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
patch adds this to vicodec and the last patch is an updated old
patch of mine that adds debugfs code to check if all requests and
request objects are properly freed. Without it it is really hard to
verify that there are no dangling requests or objects.

Regards,

	Hans

Hans Verkuil (4):
  media: mc: add manual request completion
  media: vicodec: add support for manual completion
  media: mc: add media_debugfs_root()
  media: mc: add debugfs node to keep track of requests

 drivers/media/mc/mc-device.c                  | 28 ++++++++++++
 drivers/media/mc/mc-devnode.c                 | 16 +++++++
 drivers/media/mc/mc-request.c                 | 43 ++++++++++++++++++-
 .../media/test-drivers/vicodec/vicodec-core.c | 21 +++++++--
 include/media/media-device.h                  |  9 ++++
 include/media/media-devnode.h                 | 15 +++++++
 include/media/media-request.h                 | 38 +++++++++++++++-
 7 files changed, 163 insertions(+), 7 deletions(-)

-- 
2.43.0


