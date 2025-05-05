Return-Path: <linux-media+bounces-31768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06600AAAE37
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6D7B172664
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F072D7ADA;
	Mon,  5 May 2025 22:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0T17SaI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164FE36AD01;
	Mon,  5 May 2025 22:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485192; cv=none; b=GWKL0sIqaQ93JIdf1AxsA76psFLQKnU8mh990pdk3lY3V6qP+UXdpNYGvCMtMJJC2Quvc1QC/FU09oN9VNBFoNfStNTMj9pBt7/K/icD4/iGOAZFfyWD/Of95vaAm2TI0qLqvCLiw5K/flG+rs+t9deMhbgAeRjo4yHD+O3+H38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485192; c=relaxed/simple;
	bh=wxrYziaHvHD4g27gI9lEQ96DcRoUY+dEeU7cwjvuTl0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X/U78HgiRZ0myq71QUVwRIA6W+C2G1kLf/NM3KPq5iJF/B/8jvRfU+7rNvg0XGALwxJs5nVsfyuzmaaQYTZahOo6dGWuV+p6Cl2BTzeMPDxa3JqRlmzelBzUJstB+Raase9KxhHuVfZ5vpVZ9TlXr3jURdfm/PAOenLSom3qVq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0T17SaI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEFCC4CEE4;
	Mon,  5 May 2025 22:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485192;
	bh=wxrYziaHvHD4g27gI9lEQ96DcRoUY+dEeU7cwjvuTl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W0T17SaIr3eBEquxW2dSEWgTDz6coZgGuigJPVMZw8cHxwueDDKwMnb5GTQduZ0h1
	 NrXnGtly5s+NZJlwHOX4UF0q7dWpdzkc6/WL3GR39fX3s5UqRCE08qXACuTgtOelh/
	 gsHpkaGAoigcug6asGcLV32J/vBZoBgi2/wMBoz6wXpB9gUN49qE1SbBcfWjIone1I
	 MTYVlTz7gVOpN/dvDcsQvVrWM/NliVQpmcNOXNOygo9dWxK41JlLEVmO5TeyCSNnmv
	 PSEjCfmLWqVJDm7iGgfq+A+F9WhwCOWBdUXtYZkGepLMtlVc32TavEh6f9VgRCu3Rj
	 zXytkkqqcrUBw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	christophe.jaillet@wanadoo.fr,
	ribalda@chromium.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 203/486] media: cx231xx: set device_caps for 417
Date: Mon,  5 May 2025 18:34:39 -0400
Message-Id: <20250505223922.2682012-203-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@xs4all.nl>

[ Upstream commit a79efc44b51432490538a55b9753a721f7d3ea42 ]

The video_device for the MPEG encoder did not set device_caps.

Add this, otherwise the video device can't be registered (you get a
WARN_ON instead).

Not seen before since currently 417 support is disabled, but I found
this while experimenting with it.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/cx231xx/cx231xx-417.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index abb967c8bd352..6cb130eb32d58 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1722,6 +1722,8 @@ static void cx231xx_video_dev_init(
 	vfd->lock = &dev->lock;
 	vfd->release = video_device_release_empty;
 	vfd->ctrl_handler = &dev->mpeg_ctrl_handler.hdl;
+	vfd->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+			   V4L2_CAP_VIDEO_CAPTURE;
 	video_set_drvdata(vfd, dev);
 	if (dev->tuner_type == TUNER_ABSENT) {
 		v4l2_disable_ioctl(vfd, VIDIOC_G_FREQUENCY);
-- 
2.39.5


