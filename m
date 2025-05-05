Return-Path: <linux-media+bounces-31781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC8EAAAF7C
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 05:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E3887B8AF7
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 03:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85EB2FA7E1;
	Mon,  5 May 2025 23:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hi1ZSIi3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9AB2EE47B;
	Mon,  5 May 2025 23:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486564; cv=none; b=FdHMkoirLlMLuOaR5wukGQxUU5NcNdJlgK0bBDcfk/AG2cbzpFPTDbrWxitbzcstQuB5mIqsTa7mJoNmLosdvhF1r/TgSQ3QamETwLO2HKPG67drVJv9kXDhDZR4lRKE1uwnAbOf5R+MLb+QHn3Itny3F+Z1+Eg7jyGyX/Aofgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486564; c=relaxed/simple;
	bh=GXQQVWklXWNAEB0XwIb9nq+0BoP+bo7EBFoAE8e69kU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aD7J2Sja4YwLICNYH9YX9O2GKnIwDetNNm1EuJQToOWHFoB76tglA25JQ5mWPr4Wpwk0GuGnqV1TYxeYohRkJKbp/oIl4e5IJZNew7BBPSZ6NXgoxN7RrAlj24g6bQi25tavtSYwzz5BPloch6oqCe2CuXLvn+DWhRbxY8iOEDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hi1ZSIi3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDFCC4CEE4;
	Mon,  5 May 2025 23:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486563;
	bh=GXQQVWklXWNAEB0XwIb9nq+0BoP+bo7EBFoAE8e69kU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hi1ZSIi31YXG6wLGYgTxwXHyM7N0JekSFl7vUt0BsWEMPXOY0z3eh8D1IJhM9IXJ0
	 ElOi3QCnJ7b45OiNn5A9e097lp0LQ+pkQnHrfDx/iuOz/Y/6Qt0xtnNmzKO1cDFw/0
	 5+IUQH5uLMdLkOgakmLIoSMh/nLsxGpciM68Y1H7NEwQpquSome93+WedAa9NmAJYb
	 j4oqsgZrk2TxOK1eBn5Sy9fF2CyHr3d/RHjJa9dhU5uqZ0amgW8NLBShSsDSvOPRI+
	 FmnzCIR/MkC5xVt5HIXUwEk+iQ5KfUdvN8lKqRine6M1fh9roQKQ/gxLVZfXN0cA9l
	 PFp4zRCvXjyxQ==
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
Subject: [PATCH AUTOSEL 6.1 093/212] media: cx231xx: set device_caps for 417
Date: Mon,  5 May 2025 19:04:25 -0400
Message-Id: <20250505230624.2692522-93-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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
index c5e21785fafe2..02343e88cc618 100644
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


