Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08C56C4921
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 10:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbfJBIEU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 04:04:20 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:33315 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726162AbfJBIEU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 04:04:20 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id FZcMiuu96op0AFZcQi3UL8; Wed, 02 Oct 2019 10:04:18 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cec-funcs.h: use new CEC_OP_UI_CMD defines
Message-ID: <e9f43126-e5ce-10d2-bafa-29f5de64ff94@xs4all.nl>
Date:   Wed, 2 Oct 2019 10:04:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNbDpo3cVNIpxDcpeFr6iHdZO4OFdpey39EPzTknef9tR9weGHaCF9mfYolnomYl0bvL45MRua7wJQcr5f9ifCVE9uP0kCUIHy7m/ACAIfod9x5S1Wy7
 j9YFIL4renMyex63ARoIpqP3VGTmGe4rSFoYhADsj4aLb5L2IwAe7EGgSEqiAChIFDPF/o+4PTr95Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the new CEC_OP_UI_CMD defines were added I forgot to update this header
to use these new defines. This is now fixed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/uapi/linux/cec-funcs.h b/include/uapi/linux/cec-funcs.h
index 8997d5068c08..a5e579f7e86b 100644
--- a/include/uapi/linux/cec-funcs.h
+++ b/include/uapi/linux/cec-funcs.h
@@ -1302,17 +1302,17 @@ static inline void cec_msg_user_control_pressed(struct cec_msg *msg,
 	if (!ui_cmd->has_opt_arg)
 		return;
 	switch (ui_cmd->ui_cmd) {
-	case 0x56:
-	case 0x57:
-	case 0x60:
-	case 0x68:
-	case 0x69:
-	case 0x6a:
+	case CEC_OP_UI_CMD_SELECT_BROADCAST_TYPE:
+	case CEC_OP_UI_CMD_SELECT_SOUND_PRESENTATION:
+	case CEC_OP_UI_CMD_PLAY_FUNCTION:
+	case CEC_OP_UI_CMD_SELECT_MEDIA_FUNCTION:
+	case CEC_OP_UI_CMD_SELECT_AV_INPUT_FUNCTION:
+	case CEC_OP_UI_CMD_SELECT_AUDIO_INPUT_FUNCTION:
 		/* The optional operand is one byte for all these ui commands */
 		msg->len++;
 		msg->msg[3] = ui_cmd->play_mode;
 		break;
-	case 0x67:
+	case CEC_OP_UI_CMD_TUNE_FUNCTION:
 		msg->len += 4;
 		msg->msg[3] = (ui_cmd->channel_identifier.channel_number_fmt << 2) |
 			      (ui_cmd->channel_identifier.major >> 8);
@@ -1331,17 +1331,17 @@ static inline void cec_ops_user_control_pressed(const struct cec_msg *msg,
 	if (msg->len == 3)
 		return;
 	switch (ui_cmd->ui_cmd) {
-	case 0x56:
-	case 0x57:
-	case 0x60:
-	case 0x68:
-	case 0x69:
-	case 0x6a:
+	case CEC_OP_UI_CMD_SELECT_BROADCAST_TYPE:
+	case CEC_OP_UI_CMD_SELECT_SOUND_PRESENTATION:
+	case CEC_OP_UI_CMD_PLAY_FUNCTION:
+	case CEC_OP_UI_CMD_SELECT_MEDIA_FUNCTION:
+	case CEC_OP_UI_CMD_SELECT_AV_INPUT_FUNCTION:
+	case CEC_OP_UI_CMD_SELECT_AUDIO_INPUT_FUNCTION:
 		/* The optional operand is one byte for all these ui commands */
 		ui_cmd->play_mode = msg->msg[3];
 		ui_cmd->has_opt_arg = 1;
 		break;
-	case 0x67:
+	case CEC_OP_UI_CMD_TUNE_FUNCTION:
 		if (msg->len < 7)
 			break;
 		ui_cmd->has_opt_arg = 1;
