Return-Path: <linux-media+bounces-21288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD759C5217
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 10:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2BB828771E
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 09:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F0720DD78;
	Tue, 12 Nov 2024 09:33:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF18E1ABEC2
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 09:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731404002; cv=none; b=uYFs3OxUGrgwFJ61WenK1a8yeM7lT6ND9T14G3fAyNeiYtlioSBIrLi9NdQ/Y7gp1IADIIhreujZYu7ll5OfYz4Tg6vt5NSwwev8Eo6vXojd0/5PNWNQzf0mkuureZ6Zyn2enB6IDP3TB1vyj9ctJ8nJh5M266VWONjNLtPV/u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731404002; c=relaxed/simple;
	bh=zSMiZ5Tk5VoAjk+Jq3FJHl2bCW3e2lDIA/YMjKASt1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V+Z3EWDxmgE9K/NexfAp8KAR6PU3ZvDwzicuGw89vVjTZv6KJ1n4E7iTNDRII1dUpyTui/ZPxbqlUPRHJPTpY9cM2WMYm7lakdZZU0fjYb34pVcz4TjEc01dKqLpgVNPnfCuyqCFVyXYeKbaZJ+NKLvM4xsKj1G6VNiVrjLv9L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B597C4CECD;
	Tue, 12 Nov 2024 09:33:21 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCHv2 0/5] media: add min/rec_num_buffers + queue_info op
Date: Tue, 12 Nov 2024 10:22:11 +0100
Message-ID: <cover.1731403336.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series supersedes these older RFC patches:

https://patchwork.linuxtv.org/project/linux-media/patch/6b303108-6ab6-43c9-9c7b-7776ef64fb06@xs4all.nl/
https://patchwork.linuxtv.org/project/linux-media/list/?series=13889
https://patchwork.linuxtv.org/project/linux-media/patch/bba26f7c-2a36-4e93-b292-59484dd2ed98@xs4all.nl/

The first two patches add support for reporting min_num_buffers and
rec_num_buffers.

The third patch renames the vb2_queue field min_reqbufs_allocation to
rec_num_buffers, which makes much more sense as a name, and syncs up
nicely with the new v4l2_createbuffers field.

The next patch adds support for a queue_info op to replace the
existing queue_setup op, and the last patch implements that for vivid.

As you can see, the new op is a lot easier to use, and it also prevents
drivers from messing with the buffer count. Instead they can just set
rec_num_buffers according to what they need.

If these changes are accepted (esp. the first two patches), then the
next step will be to go through all drivers that fiddle with the
count value in queue_setup. Ideally I'd like to replace queue_setup
by queue_info as well, but that's an optional step and depends one
whether the queue_info proposal is accepted.

Regards,

	Hans

Hans Verkuil (5):
  media: vb2: add support for min/rec_num_buffers
  Documentation: media: document min/rec_num_buffers
  media: vb2: rename min_reqbufs_allocation to rec_num_buffers
  media: vb2: introduce queue_info to replace queue_setup
  media: vivid: convert queue_setup to queue_info

 .../media/v4l/vidioc-create-bufs.rst          | 34 +++++--
 .../media/v4l/vidioc-reqbufs.rst              |  6 ++
 .../media/common/videobuf2/videobuf2-core.c   | 96 +++++++++++++------
 .../media/common/videobuf2/videobuf2-v4l2.c   | 19 +++-
 .../media/test-drivers/vicodec/vicodec-core.c |  4 +-
 .../media/test-drivers/vimc/vimc-capture.c    |  2 +-
 drivers/media/test-drivers/vivid/vivid-core.c |  4 +-
 .../media/test-drivers/vivid/vivid-meta-cap.c | 17 +---
 .../media/test-drivers/vivid/vivid-meta-out.c | 27 ++----
 .../media/test-drivers/vivid/vivid-sdr-cap.c  | 16 ++--
 .../test-drivers/vivid/vivid-touch-cap.c      | 18 +---
 .../media/test-drivers/vivid/vivid-vbi-cap.c  | 13 +--
 .../media/test-drivers/vivid/vivid-vbi-out.c  | 13 +--
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 39 +++-----
 .../media/test-drivers/vivid/vivid-vid-out.c  | 37 ++-----
 include/media/videobuf2-core.h                | 22 ++++-
 include/uapi/linux/videodev2.h                | 20 +++-
 17 files changed, 208 insertions(+), 179 deletions(-)

-- 
2.45.2


