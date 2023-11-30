Return-Path: <linux-media+bounces-1403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5BC7FEFB2
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 14:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7222DB20EA3
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 13:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534813C079;
	Thu, 30 Nov 2023 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC32938DE0
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 13:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502A2C433C8;
	Thu, 30 Nov 2023 13:03:46 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: "Dr . David Alan Gilbert" <dave@treblig.org>,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 0/3] media: bttv: three post-vb2 fixes
Date: Thu, 30 Nov 2023 13:58:09 +0100
Message-ID: <cover.1701349092.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dave, thank you for your detailed bttv bug report:

https://lore.kernel.org/linux-media/ZVK_3UmvmOaCv1tc@gallifrey/

It was very helpful and I managed to reproduce these issues.

This patch series fixes them.

The first patch is unrelated, just something I noticed while
debugging this.

The second patch adds back the old bttv behavior of storing the
frame counter in the last 4 bytes of the vbi payload when using
read().

The final patch fixes the vbi read() behavior where it was
alternating between valid data and a zeroed buffer.

I'd appreciate it if you can test this before Dec 11 since I
plan to merge on Dec 11 if I don't hear anything.

Regards,

	Hans

Hans Verkuil (3):
  media: bttv: start_streaming should return a proper error code
  media: bttv: add back vbi hack
  media: videobuf2: request more buffers for vb2_read

 .../media/common/videobuf2/videobuf2-core.c   |  9 +++++--
 drivers/media/pci/bt8xx/bttv-driver.c         | 27 ++++++++++++++++---
 drivers/media/pci/bt8xx/bttv-vbi.c            |  8 +++---
 3 files changed, 33 insertions(+), 11 deletions(-)

-- 
2.42.0


