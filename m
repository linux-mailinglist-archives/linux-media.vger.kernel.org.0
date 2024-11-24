Return-Path: <linux-media+bounces-21906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 703A49D71B7
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6FAEB2A10C
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09471FF61E;
	Sun, 24 Nov 2024 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVBvnVsq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D20A1E1A05;
	Sun, 24 Nov 2024 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732453107; cv=none; b=rBgrh38ksh0luoboNkWfx9u8SBoGYqxXqYS82xEyTAsaq1fHClUXYlUdp/m0h3jQ/gCzp2FMirTvIwTl59/LyyRrfdzTSm8b4sfyl+KQEmQktcnRL/ejPsKrHXkYwfO+Rq0AzDNXGMhrafErR5XemNRYFDWoCg4b/9ufEakD1xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732453107; c=relaxed/simple;
	bh=Ydjwp7VIi8tTU/k6MwI+K/Tn6bGd9iArTR//eh3PBuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RV6d1G7znc79wJHcAz3zA13SIq06Cz669nZq239najrIOFrs2nqWAbINli9l/fFmGvieN8gRfCwqq9GARDQG5MiWHabtjCwXHDuZgZNcKkXN2rvrNJ5iX87HBMbZja8NicILiFyRxQS1YlZKo3b4lLlfYitYTNArEAfeirUSiYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVBvnVsq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06BBC4CED6;
	Sun, 24 Nov 2024 12:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732453107;
	bh=Ydjwp7VIi8tTU/k6MwI+K/Tn6bGd9iArTR//eh3PBuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bVBvnVsq9BTZ0tv4hY7XJxRfkOr2wrAQH7212jATbgpltsXWe7ygrlXc9YuSvsPtF
	 6j8kuoWg6qAPpViq580XUnnoCRpgvLfeJfnSODOOKDOH3wKJ+BDjwCAIngvT4dMks4
	 xXk4B7Ds7uK10j/x1G2EUXTLmwoA+7gLGFn20jI164FOuVvDX52MwSbW8a1MOMDthm
	 rrSlxubACk/PTyWNw0rfrMPsF936qN7bzq1JOR6+F8GqIFYrpYZd8OKPYJNPkSkZnc
	 Hu6JwgverdbGSMTWPOZVmaZIsyaZ37F2/8oZuSyUVmjCk+mu6+BR0P+d1RrEyoprGU
	 Q++0NyWC2pCRg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rohan Barar <rohan.barar@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	hverkuil@xs4all.nl,
	f.langufo.l@gmail.com,
	linux@treblig.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 3/5] media: cx231xx: Add support for Dexatek USB Video Grabber 1d19:6108
Date: Sun, 24 Nov 2024 07:58:03 -0500
Message-ID: <20241124125817.3341248-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125817.3341248-1-sashal@kernel.org>
References: <20241124125817.3341248-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.286
Content-Transfer-Encoding: 8bit

From: Rohan Barar <rohan.barar@gmail.com>

[ Upstream commit 61a830bc0ea69a05d8a4534f825c6aa618263649 ]

Add Dexatek Technology Ltd USB Video Grabber 1d19:6108 to the cx231xx
driver. This device is sold under the name "BAUHN DVD Maker (DK8723)" by
ALDI in Australia.

This device is similar to 1d19:6109, which is already included in cx231xx.

Both video and audio capture function correctly after installing the
patched cx231xx driver.

Patch Changelog
v1:
 - Initial submission.
v2:
 - Fix SoB + Improve subject.
v3:
 - Rephrase message to not exceed 75 characters per line.
 - Removed reference to external GitHub URL.

Signed-off-by: Rohan Barar <rohan.barar@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/cx231xx/cx231xx-cards.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index e123e74c549ed..49094b6b2a31e 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -994,6 +994,8 @@ const unsigned int cx231xx_bcount = ARRAY_SIZE(cx231xx_boards);
 
 /* table of devices that work with this driver */
 struct usb_device_id cx231xx_id_table[] = {
+	{USB_DEVICE(0x1D19, 0x6108),
+	.driver_info = CX231XX_BOARD_PV_XCAPTURE_USB},
 	{USB_DEVICE(0x1D19, 0x6109),
 	.driver_info = CX231XX_BOARD_PV_XCAPTURE_USB},
 	{USB_DEVICE(0x0572, 0x5A3C),
-- 
2.43.0


