Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2340A9BEE
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 09:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731893AbfIEHdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 03:33:46 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59757 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731791AbfIEHdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 03:33:46 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 5mGyiVQ6750xT5mH2ipZ2h; Thu, 05 Sep 2019 09:33:44 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Jiunn Chang <c0d1n61at3@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] cec/cec-adap.c: use new UI_CMD defines
Date:   Thu,  5 Sep 2019 09:33:40 +0200
Message-Id: <20190905073340.8474-3-hverkuil-cisco@xs4all.nl>
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

Instead of hardcoding the UI Command key values, use the new
defines.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-adap.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index 5ef7daeb8cbd..284f9b845161 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -1976,7 +1976,7 @@ static int cec_receive_notify(struct cec_adapter *adap, struct cec_msg *msg,
 		 * Play function, this message can have variable length
 		 * depending on the specific play function that is used.
 		 */
-		case 0x60:
+		case CEC_OP_UI_CMD_PLAY_FUNCTION:
 			if (msg->len == 2)
 				rc_keydown(adap->rc, RC_PROTO_CEC,
 					   msg->msg[2], 0);
@@ -1993,8 +1993,12 @@ static int cec_receive_notify(struct cec_adapter *adap, struct cec_msg *msg,
 		 * For the time being these messages are not processed by the
 		 * framework and are simply forwarded to the user space.
 		 */
-		case 0x56: case 0x57:
-		case 0x67: case 0x68: case 0x69: case 0x6a:
+		case CEC_OP_UI_CMD_SELECT_BROADCAST_TYPE:
+		case CEC_OP_UI_CMD_SELECT_SOUND_PRESENTATION:
+		case CEC_OP_UI_CMD_TUNE_FUNCTION:
+		case CEC_OP_UI_CMD_SELECT_MEDIA_FUNCTION:
+		case CEC_OP_UI_CMD_SELECT_AV_INPUT_FUNCTION:
+		case CEC_OP_UI_CMD_SELECT_AUDIO_INPUT_FUNCTION:
 			break;
 		default:
 			rc_keydown(adap->rc, RC_PROTO_CEC, msg->msg[2], 0);
-- 
2.23.0.rc1

