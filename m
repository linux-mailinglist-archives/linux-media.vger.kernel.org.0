Return-Path: <linux-media+bounces-17316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE5A968218
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CB73283736
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 08:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F309D2AE99;
	Mon,  2 Sep 2024 08:35:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A98A183092
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 08:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725266158; cv=none; b=d1rLC1KghmryUro+Re0noXTFc/WU4q6jgEFOZV0Zb9OsakLhFQX3DzFXgM3JUxDt53y3yHG+qYXELLa8f32fNFzgmWgNFV/JaOesa2A4E7zTbVETfQpV7NwjNrZ4DzoN8ssQcaqk9NFP5secQEVNWjqYXmn5x8fDgx92aNzgJZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725266158; c=relaxed/simple;
	bh=yFHmYFP/TSKuPVo4IplA+XOzXiPlN0804T596Rnmf14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kLO9LEdfP2qQKAM15Dwkb93i+z1rYiucOhAGlubloUNggiD2n6Mvp+UXGmUjmqEQiWlDbtTekLjKhxp/9e4022FUeyoTVt+8gpX4dlH3C07Q4GkCOfSomb2c71eTNb50ewd0XQKmanz/2AzrvKz0vGk+xAlUQLfqRVFfk5KcHL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07B4C4CEC2;
	Mon,  2 Sep 2024 08:35:56 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/4] media: add missing wait_prepare/finish ops
Date: Mon,  2 Sep 2024 10:31:20 +0200
Message-ID: <cover.1725265884.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without these ops the v4l2-compliance blocking wait test will fail.
These ops are required to ensure that when VIDIOC_DQBUF has to
wait for buffers to arrive, the queue lock is correctly released
and retaken. Otherwise the wait for a buffer would block all other
queue ioctls.

I would appreciate it if these patches can be tested.

I also updated v4l2-compliance so that it executes the blocking wait
test even if the '-s' option was not specified. This should improve
coverage since not everyone uses that option.

After this series is (hopefully) applied I plan to make changes to
avoid the need to set these two ops, unless you need a custom
implementation (omap3isp).

Regards,

	Hans

Hans Verkuil (4):
  media: atomisp: add missing wait_prepare/finish ops
  media: omap3isp: add missing wait_prepare/finish ops
  media: pisp_be: add missing wait_prepare/finish ops
  media: venus: add missing wait_prepare/finish ops

 drivers/media/platform/qcom/venus/vdec.c       |  2 ++
 drivers/media/platform/qcom/venus/venc.c       |  2 ++
 .../platform/raspberrypi/pisp_be/pisp_be.c     |  2 ++
 drivers/media/platform/ti/omap3isp/ispvideo.c  | 18 ++++++++++++++++++
 .../staging/media/atomisp/pci/atomisp_fops.c   |  2 ++
 5 files changed, 26 insertions(+)

-- 
2.43.0


