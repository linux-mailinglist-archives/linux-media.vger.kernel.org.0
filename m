Return-Path: <linux-media+bounces-48040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5564DC9A8D5
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37DC73A63CA
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF720303C8A;
	Tue,  2 Dec 2025 07:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrUKIokB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29338302CDF
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661756; cv=none; b=HPdeAK8uAMdJWWvdUPxMkwoBKPRPotbx2e3YWgp9xszEzyODoDN60T0njhu5aIfchwIE1QzCuFGixpK2eca0d2jJQmnjXeatSlMJcHCl/brTK69M+DKKeHM0Nllg2GYrv6aaAH9a4Yrku1/cQPylfTMC8HQvQxX1VnRScuvv2D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661756; c=relaxed/simple;
	bh=C7ootcnL7QfM8wI0XC3E8FPE0PMm8dJpRUQlffTfmMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Phx27JO5GkB1/zjPNSrfIR95jQT9lUYLSLtYfQPIHqKEol5RRppFpltErL7k1cWYQh2ppNrasm9tJTTgw7Tzwhkqrt1+/mA9oFXXJZn0rXhLVoz+u7vn5w7oggMlkkngLcFifLw4etymv+IRsafrfO9V/H5TWrfl6nFVBWd5uX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrUKIokB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABE8C4CEF1;
	Tue,  2 Dec 2025 07:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661755;
	bh=C7ootcnL7QfM8wI0XC3E8FPE0PMm8dJpRUQlffTfmMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DrUKIokBZ5o+85yZUK1+VOD/FucpjX5Ene7gLTzAcLMmd8X10mR5scf21mH8SipDj
	 uVMjbEpNzOc8F1beLYWBKaLY4L2Tjhz8E74j/8ER75LDxQwYKGm2TggL2auFkrxS2Y
	 xzLhdJWiPIxpoUknj9J1PEedSw5QMQUnJP2jnic1KmnrsgjTVw+JceROD3yeHivss+
	 aCM4rK/WiEgY9/4RNY5YQCyBVLQaUpiYnJ7NWVTeNwuu9YM4+SwDv6ZObygpwARfCC
	 W4ZQTYkU89o1UT7TOkNCBT6CJ85z0FwWWHuqFIxENDpmK+xTWM6VjddovatrDUE08X
	 RIjbWkAOiaesg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 09/11] media: omap3isp: support ctrl events for isppreview
Date: Tue,  2 Dec 2025 08:48:10 +0100
Message-ID: <3ab23ce101608a05b49c233b88fdbac52fb446b8.1764661692.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661692.git.hverkuil+cisco@kernel.org>
References: <cover.1764661692.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The preview subdev device was missing V4L2_SUBDEV_FL_HAS_EVENTS,
and that prevented VIDIOC_SUBSCRIBE_EVENT from working.

Fixes a v4l2-compliance error:

	fail: v4l2-test-controls.cpp(1128): subscribe event for control 'User Controls' failed
test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/isppreview.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap3isp/isppreview.c b/drivers/media/platform/ti/omap3isp/isppreview.c
index 31b0eda975e8..8720c6b38e79 100644
--- a/drivers/media/platform/ti/omap3isp/isppreview.c
+++ b/drivers/media/platform/ti/omap3isp/isppreview.c
@@ -2277,7 +2277,7 @@ static int preview_init_entities(struct isp_prev_device *prev)
 	strscpy(sd->name, "OMAP3 ISP preview", sizeof(sd->name));
 	sd->grp_id = 1 << 16;	/* group ID for isp subdevs */
 	v4l2_set_subdevdata(sd, prev);
-	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	v4l2_ctrl_handler_init(&prev->ctrls, 2);
 	v4l2_ctrl_new_std(&prev->ctrls, &preview_ctrl_ops, V4L2_CID_BRIGHTNESS,
-- 
2.51.0


