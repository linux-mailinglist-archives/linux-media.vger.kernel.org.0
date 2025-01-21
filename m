Return-Path: <linux-media+bounces-25038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8375EA17B85
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 11:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E95B1880462
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 10:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4021F1929;
	Tue, 21 Jan 2025 10:25:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C851DEFF8
	for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455107; cv=none; b=p+c7gcZj7I96v+kOM/jI4v5UD/EHMCsC5hwMNfayos9ff4P1IRhAs+h+PASsgibSgPfsZe2Z6j2ucul6foNEQQDf3+kDToOmqHUxJnwdpr9H0kphSrlGTMTc0iMSG3lj/5kR2S/f0QQGjwd1H6TeSLnoh1AvYq42/ylaTNeeXjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455107; c=relaxed/simple;
	bh=vHyZCL553cK5IQ29n+d+bfU+cD4MB5tVKarHlF33vYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0XzhwNp3lNVfQDGPcR0jDOJH1bNWqy/sczN8lEBIJxQHAR7KndBOgLTGD5m5n+4hD4KvZICnE6QRZyNg4PD+qBu/iBZbRP6JjPUVvyhYvZbQ5Fd7+bCxEE/t+Qut0wbiuoZ5EWeFm5o3CnxUakdHqGJFy1sikJKJ5ZHaXW0gzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA025C4CEE4;
	Tue, 21 Jan 2025 10:25:05 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 2/2] media: adv7511-v4l2: add support for the EEODB
Date: Tue, 21 Jan 2025 11:21:42 +0100
Message-ID: <d37d317572d77eb7df8dd6016b07d812fcab068b.1737454902.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1737454902.git.hverkuil@xs4all.nl>
References: <cover.1737454902.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the HDMI Forum EDID Extension Override Data Block
by using the new v4l2_num_edid_blocks helper function.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/i2c/adv7511-v4l2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 4036972af3a6..f95a99d85360 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1664,7 +1664,9 @@ static bool adv7511_check_edid_status(struct v4l2_subdev *sd)
 		if (!err) {
 			adv7511_dbg_dump_edid(2, debug, sd, segment, &state->edid.data[segment * 256]);
 			if (segment == 0) {
-				state->edid.blocks = state->edid.data[0x7e] + 1;
+				state->edid.blocks =
+					v4l2_num_edid_blocks(state->edid.data,
+							     EDID_MAX_SEGM * 2);
 				v4l2_dbg(1, debug, sd, "%s: %d blocks in total\n",
 					 __func__, state->edid.blocks);
 			}
@@ -1682,7 +1684,7 @@ static bool adv7511_check_edid_status(struct v4l2_subdev *sd)
 		/* one more segment read ok */
 		state->edid.segments = segment + 1;
 		v4l2_ctrl_s_ctrl(state->have_edid0_ctrl, 0x1);
-		if (((state->edid.data[0x7e] >> 1) + 1) > state->edid.segments) {
+		if (state->edid.blocks > state->edid.segments * 2) {
 			/* Request next EDID segment */
 			v4l2_dbg(1, debug, sd, "%s: request segment %d\n", __func__, state->edid.segments);
 			adv7511_wr(sd, 0xc9, 0xf);
-- 
2.45.2


