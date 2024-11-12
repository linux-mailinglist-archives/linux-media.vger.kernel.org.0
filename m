Return-Path: <linux-media+bounces-21286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC339C5067
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 09:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34C02B251CC
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 08:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF7A20B21D;
	Tue, 12 Nov 2024 08:17:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC98F20B1E1
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 08:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731399450; cv=none; b=SviVnz8bZCxhni1cl5J3RnnOF+/ySksVkRpv+8qtq7Yx30+XykPQPn1ZSCvKpDnBpO4WdVeJvHTSJ8m536cZQldNaW7oI0IMj3tGrICnJWUP5GHYDZGUUH3LY5uw06Gf910+cFl0vv2jADKbdSKT8UTBolU72xQ6NtJ5XeHJ66g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731399450; c=relaxed/simple;
	bh=spmzTwrmpHVIyiJNTiHclYWXpg6U1fi5RfwLTJIpB9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhI4yfRVcT4W3watTFUrxk/ELZBwVz4Kng0fT/JQfWJZC9RR2o4StX3MHG7YsUFPQPbHMen09Js+KVMOl3++1cHpxE1F9+SRZFsiMrHDBfzBeljXRl5oxKgL4OFoF8v45WQ3ZRL+bgc8r3JRloncqOTe5KqblFBnOd2z47gaaAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB623C4CED4;
	Tue, 12 Nov 2024 08:17:29 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv3 1/2] media: staging: tegra-video: postpone v4l2_ctrl_add_handler
Date: Tue, 12 Nov 2024 09:14:37 +0100
Message-ID: <a01da964b8328afe041f05343af8bc4a4b7004f3.1731399278.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731399278.git.hverkuil@xs4all.nl>
References: <cover.1731399278.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_ctrl_add_handler call should be done after all local
controls are added. This ensures that local controls override
any controls inherited from another handler.

This will be checked and a WARN will be issued if this happens,
so fix this behavior in this driver.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/staging/media/tegra-video/vi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index ad481b35e618..32db6a36d058 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -980,6 +980,11 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	if (!subdev)
 		return -ENODEV;
 
+	if (chan->vi->soc->has_h_v_flip) {
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
+	}
+
 	ret = v4l2_ctrl_add_handler(&chan->ctrl_handler, subdev->ctrl_handler,
 				    NULL, true);
 	if (ret < 0) {
@@ -989,12 +994,6 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		v4l2_ctrl_handler_free(&chan->ctrl_handler);
 		return ret;
 	}
-
-	if (chan->vi->soc->has_h_v_flip) {
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
-
 #endif
 
 	/* setup the controls */
-- 
2.45.2


