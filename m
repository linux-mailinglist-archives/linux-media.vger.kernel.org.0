Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDEA0A9BEC
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 09:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731847AbfIEHdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 03:33:46 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:52207 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726032AbfIEHdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 03:33:45 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 5mGyiVQ6750xT5mH2ipZ2Y; Thu, 05 Sep 2019 09:33:44 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Jiunn Chang <c0d1n61at3@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] uapi/linux/cec.h: add defines for the CEC UI Command Operand
Date:   Thu,  5 Sep 2019 09:33:39 +0200
Message-Id: <20190905073340.8474-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190905073340.8474-1-hverkuil-cisco@xs4all.nl>
References: <20190905073340.8474-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMS8HxhvTvWT2ytbv0HAz+WSIO5WqUtT82XxzPWln2TpdLe+nny8r3YdRGlJBkW/ra1Tdw/Ro2sV0/+O2LnPq0uge4bRYXX8FaBbYirBk5ZB5IpDxbGY
 28bBmBOJWiKA/ohk1PMMAbDNqEtpCfOGO/Wv5y8T2RTM4LWr8spuPQ0tPzzCD31/itn8XY0+aP6eicg2+6C8rQxs45c/jdoyHJ+PCvKWo0QURXNus5EHy8qa
 6gTiszQAkRypLK43X61pXw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These defines were never added to this CEC header, likely due
to laziness on the part of the original author, i.e. me.

But it is useful to have them, so add them.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/uapi/linux/cec.h | 89 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 5704fa0292b5..4771576fc3d0 100644
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
+#define CEC_OP_UI_CMD_F1_BLUE_				0x71
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

