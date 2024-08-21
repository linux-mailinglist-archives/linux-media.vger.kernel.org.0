Return-Path: <linux-media+bounces-16569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFC1959EBE
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 15:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F11CB1C20924
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 13:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB2219ABDE;
	Wed, 21 Aug 2024 13:34:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6936219ABBC
	for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724247258; cv=none; b=XgxjL1m0OeibvX4HFBLjMAFuLkyRcvP5iqsdu8hPDoX392AGI0IzLuY1/HPZtUxuQphdWPiYB3yQeJ7Ci13S5ZEqxGDy0Rlm0Zazv9q8IkN+toMR6EXFwfsb7JpTEITFx+BX8F57AUbJa08XvzJmaeuOli2esT0vi1C16v6723E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724247258; c=relaxed/simple;
	bh=xT/llsrxKLo1HZlHIGAzTXHZTbd7TXXRCd0d9DVxnAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OD2jJn5Zzg9ynOjhQVTFkI3Hz6d6A4YRWSSz29opkh0vrWVGazVNC4p3D9aXJXmg4i2qonYXgY3K7v8xwvfE9zy57WR6PJbydmrWaM+O/ah87SeDuSp+1Ecy85uwuTtZ7NWuxU7gXaSinqO39BLpG3lke8C6J0ObKyhBO+y92tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EA9C32782;
	Wed, 21 Aug 2024 13:34:17 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [RFC PATCH 0/3] media: mc: add manual request completion support
Date: Wed, 21 Aug 2024 15:14:00 +0200
Message-ID: <cover.1724246043.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RFC for now, it looks like it works well, but I want feedback before
making this official.

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
patch adds this to vicodec (not sure if I want this committed,
visl might be a better place for it, but I needed something to test
the code), and the last patch is an updated old patch of mine that
adds debugfs code to check if all requests and request objects are
properly freed.

I think I need to clean up that last patch a bit more, and then
I would like to get that in. Without it it is really hard to
verify that there are no dangling requests or objects.

Regards,

	Hans

Hans Verkuil (3):
  media: mc: add manual request completion
  vicodec: add support for manual completion
  media: mc: add debugfs node to keep track of requests

 drivers/media/mc/mc-device.c                  | 31 ++++++++++++++++
 drivers/media/mc/mc-devnode.c                 | 16 +++++++++
 drivers/media/mc/mc-request.c                 | 36 +++++++++++++++++--
 .../media/test-drivers/vicodec/vicodec-core.c | 14 ++++++--
 include/media/media-device.h                  |  9 +++++
 include/media/media-devnode.h                 |  4 +++
 include/media/media-request.h                 | 35 +++++++++++++++++-
 7 files changed, 140 insertions(+), 5 deletions(-)

-- 
2.43.0


