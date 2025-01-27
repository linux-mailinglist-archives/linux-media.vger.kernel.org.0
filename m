Return-Path: <linux-media+bounces-25308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A32A1D514
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 12:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C2A4165E7D
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 11:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7597F1FE476;
	Mon, 27 Jan 2025 11:04:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D82C7603F
	for <linux-media@vger.kernel.org>; Mon, 27 Jan 2025 11:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737975866; cv=none; b=cp7GGrYlIycrKF61Lvb7cvOJcEoH/kvcLB6WlW4Xli47g+ODDMLJPVSCnJnY3PxQNDTMeA812ibQP9ULnVkFEYZ+KC2ChK2cjdgvXo2Gx+Ag2eWR90Wv3LuQ/SNBsQgNGqwaK2W636F+A+xMjdtr3DVywDqTIhhajGcPLA0Hh4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737975866; c=relaxed/simple;
	bh=vHyZCL553cK5IQ29n+d+bfU+cD4MB5tVKarHlF33vYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdL+jylbr+JqHzeZaGtEcol/P+y65p9wF209lNK5e9Kde+5LKcaqhEWbRrfcIaSeCD5LnEjJ9EkzeMrM0oF+O3EPcp6nuTZj/h6+7ZekUm4saBFiT8zwC+tjNZ1qZrjHi/RUu52D3elcevyrY7rphmGgOh4fFnaNvW3YEDuFGhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C05C4CEE2;
	Mon, 27 Jan 2025 11:04:24 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2 2/2] media: adv7511-v4l2: add support for the EEODB
Date: Mon, 27 Jan 2025 12:03:13 +0100
Message-ID: <e3e5b2d872771d0be8d67aa223452c1b25433343.1737975793.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1737975793.git.hverkuil@xs4all.nl>
References: <cover.1737975793.git.hverkuil@xs4all.nl>
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


