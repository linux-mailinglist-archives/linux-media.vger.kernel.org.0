Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA8DC07DB
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 16:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfI0Oqb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 10:46:31 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:44617 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727213AbfI0Oqb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 10:46:31 -0400
Received: from [IPv6:2001:420:44c1:2577:2521:77be:ff76:8085] ([IPv6:2001:420:44c1:2577:2521:77be:ff76:8085])
        by smtp-cloud8.xs4all.net with ESMTPA
        id DrVniYE7eKKNGDrVsiEL6f; Fri, 27 Sep 2019 16:46:28 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 1/2] uapi/linux/cec.h: add defines for the CEC UI Command
 Operand
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <bcc5087e-a047-b062-edf8-5e11d035f076@xs4all.nl>
Date:   Fri, 27 Sep 2019 16:46:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOSfFU6O9EgQH6sOroN6lAmz1lrbrYD5oF60IRRKmGX2ln6zYj9EgZ+An6nPDeZsJ/hxE9Xfyv7PmuOXSgaK4ZI73R7HMhPcYvjSoo6wXZzXxUG6FQKD
 9ArkRpLXpuZgbQ46StFUVmaKZ5am8i8zXDRJcPwL1S2HacuDG+gvRby0YV484xTVXUMGawu+AeVBrCz0c3oLZ/jHb9aNbeZ7b0O4TevbCIWu4s+rNRsFXuFh
 f/ep3PxU/YwVdIX5CldnnKnXIbZaG+H0JojstZxif+1tYZpDmp3+mZVcbJ6kWY2P
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These defines were never added to this CEC header, likely due
to laziness on the part of the original author, i.e. me.

But it is useful to have them, so add them.

Also update the cec.h.rst.exceptions file to avoid errors when
building the documentation.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes since v1:

- add the new defines to cec.h.rst.exceptions
- the CEC_OP_UI_CMD_F1_BLUE define had a spurious _ at the end, this was removed.
---
 Documentation/media/cec.h.rst.exceptions | 89 ++++++++++++++++++++++++
 include/uapi/linux/cec.h                 | 89 ++++++++++++++++++++++++
 2 files changed, 178 insertions(+)

diff --git a/Documentation/media/cec.h.rst.exceptions b/Documentation/media/cec.h.rst.exceptions
index 014816d04b9e..d83790ccac8e 100644
--- a/Documentation/media/cec.h.rst.exceptions
+++ b/Documentation/media/cec.h.rst.exceptions
@@ -335,6 +335,95 @@ ignore define CEC_OP_MENU_STATE_DEACTIVATED

 ignore define CEC_MSG_USER_CONTROL_PRESSED

+ignore define CEC_OP_UI_CMD_SELECT
+ignore define CEC_OP_UI_CMD_UP
+ignore define CEC_OP_UI_CMD_DOWN
+ignore define CEC_OP_UI_CMD_LEFT
+ignore define CEC_OP_UI_CMD_RIGHT
+ignore define CEC_OP_UI_CMD_RIGHT_UP
+ignore define CEC_OP_UI_CMD_RIGHT_DOWN
+ignore define CEC_OP_UI_CMD_LEFT_UP
+ignore define CEC_OP_UI_CMD_LEFT_DOWN
+ignore define CEC_OP_UI_CMD_DEVICE_ROOT_MENU
+ignore define CEC_OP_UI_CMD_DEVICE_SETUP_MENU
+ignore define CEC_OP_UI_CMD_CONTENTS_MENU
+ignore define CEC_OP_UI_CMD_FAVORITE_MENU
+ignore define CEC_OP_UI_CMD_BACK
+ignore define CEC_OP_UI_CMD_MEDIA_TOP_MENU
+ignore define CEC_OP_UI_CMD_MEDIA_CONTEXT_SENSITIVE_MENU
+ignore define CEC_OP_UI_CMD_NUMBER_ENTRY_MODE
+ignore define CEC_OP_UI_CMD_NUMBER_11
+ignore define CEC_OP_UI_CMD_NUMBER_12
+ignore define CEC_OP_UI_CMD_NUMBER_0_OR_NUMBER_10
+ignore define CEC_OP_UI_CMD_NUMBER_1
+ignore define CEC_OP_UI_CMD_NUMBER_2
+ignore define CEC_OP_UI_CMD_NUMBER_3
+ignore define CEC_OP_UI_CMD_NUMBER_4
+ignore define CEC_OP_UI_CMD_NUMBER_5
+ignore define CEC_OP_UI_CMD_NUMBER_6
+ignore define CEC_OP_UI_CMD_NUMBER_7
+ignore define CEC_OP_UI_CMD_NUMBER_8
+ignore define CEC_OP_UI_CMD_NUMBER_9
+ignore define CEC_OP_UI_CMD_DOT
+ignore define CEC_OP_UI_CMD_ENTER
+ignore define CEC_OP_UI_CMD_CLEAR
+ignore define CEC_OP_UI_CMD_NEXT_FAVORITE
+ignore define CEC_OP_UI_CMD_CHANNEL_UP
+ignore define CEC_OP_UI_CMD_CHANNEL_DOWN
+ignore define CEC_OP_UI_CMD_PREVIOUS_CHANNEL
+ignore define CEC_OP_UI_CMD_SOUND_SELECT
+ignore define CEC_OP_UI_CMD_INPUT_SELECT
+ignore define CEC_OP_UI_CMD_DISPLAY_INFORMATION
+ignore define CEC_OP_UI_CMD_HELP
+ignore define CEC_OP_UI_CMD_PAGE_UP
+ignore define CEC_OP_UI_CMD_PAGE_DOWN
+ignore define CEC_OP_UI_CMD_POWER
+ignore define CEC_OP_UI_CMD_VOLUME_UP
+ignore define CEC_OP_UI_CMD_VOLUME_DOWN
+ignore define CEC_OP_UI_CMD_MUTE
+ignore define CEC_OP_UI_CMD_PLAY
+ignore define CEC_OP_UI_CMD_STOP
+ignore define CEC_OP_UI_CMD_PAUSE
+ignore define CEC_OP_UI_CMD_RECORD
+ignore define CEC_OP_UI_CMD_REWIND
+ignore define CEC_OP_UI_CMD_FAST_FORWARD
+ignore define CEC_OP_UI_CMD_EJECT
+ignore define CEC_OP_UI_CMD_SKIP_FORWARD
+ignore define CEC_OP_UI_CMD_SKIP_BACKWARD
+ignore define CEC_OP_UI_CMD_STOP_RECORD
+ignore define CEC_OP_UI_CMD_PAUSE_RECORD
+ignore define CEC_OP_UI_CMD_ANGLE
+ignore define CEC_OP_UI_CMD_SUB_PICTURE
+ignore define CEC_OP_UI_CMD_VIDEO_ON_DEMAND
+ignore define CEC_OP_UI_CMD_ELECTRONIC_PROGRAM_GUIDE
+ignore define CEC_OP_UI_CMD_TIMER_PROGRAMMING
+ignore define CEC_OP_UI_CMD_INITIAL_CONFIGURATION
+ignore define CEC_OP_UI_CMD_SELECT_BROADCAST_TYPE
+ignore define CEC_OP_UI_CMD_SELECT_SOUND_PRESENTATION
+ignore define CEC_OP_UI_CMD_AUDIO_DESCRIPTION
+ignore define CEC_OP_UI_CMD_INTERNET
+ignore define CEC_OP_UI_CMD_3D_MODE
+ignore define CEC_OP_UI_CMD_PLAY_FUNCTION
+ignore define CEC_OP_UI_CMD_PAUSE_PLAY_FUNCTION
+ignore define CEC_OP_UI_CMD_RECORD_FUNCTION
+ignore define CEC_OP_UI_CMD_PAUSE_RECORD_FUNCTION
+ignore define CEC_OP_UI_CMD_STOP_FUNCTION
+ignore define CEC_OP_UI_CMD_MUTE_FUNCTION
+ignore define CEC_OP_UI_CMD_RESTORE_VOLUME_FUNCTION
+ignore define CEC_OP_UI_CMD_TUNE_FUNCTION
+ignore define CEC_OP_UI_CMD_SELECT_MEDIA_FUNCTION
+ignore define CEC_OP_UI_CMD_SELECT_AV_INPUT_FUNCTION
+ignore define CEC_OP_UI_CMD_SELECT_AUDIO_INPUT_FUNCTION
+ignore define CEC_OP_UI_CMD_POWER_TOGGLE_FUNCTION
+ignore define CEC_OP_UI_CMD_POWER_OFF_FUNCTION
+ignore define CEC_OP_UI_CMD_POWER_ON_FUNCTION
+ignore define CEC_OP_UI_CMD_F1_BLUE
+ignore define CEC_OP_UI_CMD_F2_RED
+ignore define CEC_OP_UI_CMD_F3_GREEN
+ignore define CEC_OP_UI_CMD_F4_YELLOW
+ignore define CEC_OP_UI_CMD_F5
+ignore define CEC_OP_UI_CMD_DATA
+
 ignore define CEC_OP_UI_BCAST_TYPE_TOGGLE_ALL
 ignore define CEC_OP_UI_BCAST_TYPE_TOGGLE_DIG_ANA
 ignore define CEC_OP_UI_BCAST_TYPE_ANALOGUE
diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 5704fa0292b5..d8c04eb79d89 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -820,6 +820,95 @@ struct cec_event {
 #define CEC_OP_MENU_STATE_DEACTIVATED			0x01

 #define CEC_MSG_USER_CONTROL_PRESSED			0x44
+/* UI Command Operand (ui_cmd) */
+#define CEC_OP_UI_CMD_SELECT				0x00
+#define CEC_OP_UI_CMD_UP				0x01
+#define CEC_OP_UI_CMD_DOWN				0x02
+#define CEC_OP_UI_CMD_LEFT				0x03
+#define CEC_OP_UI_CMD_RIGHT				0x04
+#define CEC_OP_UI_CMD_RIGHT_UP				0x05
+#define CEC_OP_UI_CMD_RIGHT_DOWN			0x06
+#define CEC_OP_UI_CMD_LEFT_UP				0x07
+#define CEC_OP_UI_CMD_LEFT_DOWN				0x08
+#define CEC_OP_UI_CMD_DEVICE_ROOT_MENU			0x09
+#define CEC_OP_UI_CMD_DEVICE_SETUP_MENU			0x0a
+#define CEC_OP_UI_CMD_CONTENTS_MENU			0x0b
+#define CEC_OP_UI_CMD_FAVORITE_MENU			0x0c
+#define CEC_OP_UI_CMD_BACK				0x0d
+#define CEC_OP_UI_CMD_MEDIA_TOP_MENU			0x10
+#define CEC_OP_UI_CMD_MEDIA_CONTEXT_SENSITIVE_MENU	0x11
+#define CEC_OP_UI_CMD_NUMBER_ENTRY_MODE			0x1d
+#define CEC_OP_UI_CMD_NUMBER_11				0x1e
+#define CEC_OP_UI_CMD_NUMBER_12				0x1f
+#define CEC_OP_UI_CMD_NUMBER_0_OR_NUMBER_10		0x20
+#define CEC_OP_UI_CMD_NUMBER_1				0x21
+#define CEC_OP_UI_CMD_NUMBER_2				0x22
+#define CEC_OP_UI_CMD_NUMBER_3				0x23
+#define CEC_OP_UI_CMD_NUMBER_4				0x24
+#define CEC_OP_UI_CMD_NUMBER_5				0x25
+#define CEC_OP_UI_CMD_NUMBER_6				0x26
+#define CEC_OP_UI_CMD_NUMBER_7				0x27
+#define CEC_OP_UI_CMD_NUMBER_8				0x28
+#define CEC_OP_UI_CMD_NUMBER_9				0x29
+#define CEC_OP_UI_CMD_DOT				0x2a
+#define CEC_OP_UI_CMD_ENTER				0x2b
+#define CEC_OP_UI_CMD_CLEAR				0x2c
+#define CEC_OP_UI_CMD_NEXT_FAVORITE			0x2f
+#define CEC_OP_UI_CMD_CHANNEL_UP			0x30
+#define CEC_OP_UI_CMD_CHANNEL_DOWN			0x31
+#define CEC_OP_UI_CMD_PREVIOUS_CHANNEL			0x32
+#define CEC_OP_UI_CMD_SOUND_SELECT			0x33
+#define CEC_OP_UI_CMD_INPUT_SELECT			0x34
+#define CEC_OP_UI_CMD_DISPLAY_INFORMATION		0x35
+#define CEC_OP_UI_CMD_HELP				0x36
+#define CEC_OP_UI_CMD_PAGE_UP				0x37
+#define CEC_OP_UI_CMD_PAGE_DOWN				0x38
+#define CEC_OP_UI_CMD_POWER				0x40
+#define CEC_OP_UI_CMD_VOLUME_UP				0x41
+#define CEC_OP_UI_CMD_VOLUME_DOWN			0x42
+#define CEC_OP_UI_CMD_MUTE				0x43
+#define CEC_OP_UI_CMD_PLAY				0x44
+#define CEC_OP_UI_CMD_STOP				0x45
+#define CEC_OP_UI_CMD_PAUSE				0x46
+#define CEC_OP_UI_CMD_RECORD				0x47
+#define CEC_OP_UI_CMD_REWIND				0x48
+#define CEC_OP_UI_CMD_FAST_FORWARD			0x49
+#define CEC_OP_UI_CMD_EJECT				0x4a
+#define CEC_OP_UI_CMD_SKIP_FORWARD			0x4b
+#define CEC_OP_UI_CMD_SKIP_BACKWARD			0x4c
+#define CEC_OP_UI_CMD_STOP_RECORD			0x4d
+#define CEC_OP_UI_CMD_PAUSE_RECORD			0x4e
+#define CEC_OP_UI_CMD_ANGLE				0x50
+#define CEC_OP_UI_CMD_SUB_PICTURE			0x51
+#define CEC_OP_UI_CMD_VIDEO_ON_DEMAND			0x52
+#define CEC_OP_UI_CMD_ELECTRONIC_PROGRAM_GUIDE		0x53
+#define CEC_OP_UI_CMD_TIMER_PROGRAMMING			0x54
+#define CEC_OP_UI_CMD_INITIAL_CONFIGURATION		0x55
+#define CEC_OP_UI_CMD_SELECT_BROADCAST_TYPE		0x56
+#define CEC_OP_UI_CMD_SELECT_SOUND_PRESENTATION		0x57
+#define CEC_OP_UI_CMD_AUDIO_DESCRIPTION			0x58
+#define CEC_OP_UI_CMD_INTERNET				0x59
+#define CEC_OP_UI_CMD_3D_MODE				0x5a
+#define CEC_OP_UI_CMD_PLAY_FUNCTION			0x60
+#define CEC_OP_UI_CMD_PAUSE_PLAY_FUNCTION		0x61
+#define CEC_OP_UI_CMD_RECORD_FUNCTION			0x62
+#define CEC_OP_UI_CMD_PAUSE_RECORD_FUNCTION		0x63
+#define CEC_OP_UI_CMD_STOP_FUNCTION			0x64
+#define CEC_OP_UI_CMD_MUTE_FUNCTION			0x65
+#define CEC_OP_UI_CMD_RESTORE_VOLUME_FUNCTION		0x66
+#define CEC_OP_UI_CMD_TUNE_FUNCTION			0x67
+#define CEC_OP_UI_CMD_SELECT_MEDIA_FUNCTION		0x68
+#define CEC_OP_UI_CMD_SELECT_AV_INPUT_FUNCTION		0x69
+#define CEC_OP_UI_CMD_SELECT_AUDIO_INPUT_FUNCTION	0x6a
+#define CEC_OP_UI_CMD_POWER_TOGGLE_FUNCTION		0x6b
+#define CEC_OP_UI_CMD_POWER_OFF_FUNCTION		0x6c
+#define CEC_OP_UI_CMD_POWER_ON_FUNCTION			0x6d
+#define CEC_OP_UI_CMD_F1_BLUE				0x71
+#define CEC_OP_UI_CMD_F2_RED				0x72
+#define CEC_OP_UI_CMD_F3_GREEN				0x73
+#define CEC_OP_UI_CMD_F4_YELLOW				0x74
+#define CEC_OP_UI_CMD_F5				0x75
+#define CEC_OP_UI_CMD_DATA				0x76
 /* UI Broadcast Type Operand (ui_bcast_type) */
 #define CEC_OP_UI_BCAST_TYPE_TOGGLE_ALL			0x00
 #define CEC_OP_UI_BCAST_TYPE_TOGGLE_DIG_ANA		0x01
-- 
2.23.0.rc1


