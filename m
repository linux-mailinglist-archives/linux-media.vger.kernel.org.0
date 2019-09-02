Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 513ADA52DB
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 11:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731115AbfIBJdu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 05:33:50 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33558 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729887AbfIBJdt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 05:33:49 -0400
Received: by mail-oi1-f195.google.com with SMTP id l2so10031048oil.0
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2019 02:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Psm3mHEa09YDN/9bY/P25wWiX+oqflBSR0FSp2UxIc=;
        b=cBT7U2n0p5IgSysnMDHieETKnwiMtmeDGgy9QRD7fpRG60uT7Ynjom2uG2QGSRnZjn
         yi8ziEqf9yOpmLBlsX5XzjVGHMzCoprYTa64uhcGS7w0goeAjHmpQbOqdwfSaU2De5+z
         jkffdfg6Vevhk0pNmtnplpaA2Jr3c264c/w1IKPh2Ji0iEghtcJMVeAsTqofR/onLgGZ
         S/RYKTDrS25H6mY4aVNpOQ6KFmL4w6Z+nqLks1886V7IKtRN3dAp69W1vgr56eBbTWky
         4SIQ88I5kqKjDv0jJePkSe9XqNxpJKkYuE+rMNUKJiE3sZBaAtYCBVAHr6ECrN9GQZL1
         Vt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Psm3mHEa09YDN/9bY/P25wWiX+oqflBSR0FSp2UxIc=;
        b=SQOO6FeavSLwE1BEKBN7ZkINtUIlWOW2epdw3d2mYF+2FOXbFKbzOy7az/hXsR2OR9
         5XkAoWFHX0XyCoAagLCFpjZ7fvCNT/eK02ZRXVehgxv/z5aC7Ugai7e1QdnZF3Zpsyhi
         SSh5E5UAK2qDQNSeaHxx9GVgJC0viOOIuGlFDcR8kUq2eRGOX3LJqWjcuf9g5xbY5jNh
         T3Wtb1TR7cZTLTCwFs2vzDIYqrA18kFHl70onaKnMzuNC/DPIPqlimy2aF+KX89CG6mi
         tan1ZX9GGyptc3SxoOtY8QIE+UkaCVnl+pOYxf3X3higOmSb4GqR+7O9SGsEr5fUCPA9
         uJ8A==
X-Gm-Message-State: APjAAAWPgG7imeWbRupRwv4g4zQHG1BytMcV3BPY8E1BmaBJReo1jNse
        PSxhzEbp7zVXQwkpRC43sZE=
X-Google-Smtp-Source: APXvYqw0J6UtH07Jc3zgMM8FHcalSOvSwMFhgJjfwM/Tqdh5NYnsH3l/24vQ1BMjfkrsczq3ACFHuw==
X-Received: by 2002:aca:111a:: with SMTP id 26mr19044196oir.20.1567416828116;
        Mon, 02 Sep 2019 02:33:48 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id 10sm2625359oix.48.2019.09.02.02.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 02:33:47 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     rainer.auran@gmail.com, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH] cec-compliance: system audio control tests
Date:   Mon,  2 Sep 2019 04:33:46 -0500
Message-Id: <20190902093346.20041-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add user control press operands:
 - Mute Function
 - Restore Volume Function

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-compliance/cec-test-audio.cpp | 32 +++++++++++++++++++++++++
 utils/cec-follower/cec-processing.cpp   |  6 +++++
 2 files changed, 38 insertions(+)

diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 8611350e..872bb9ad 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -673,6 +673,32 @@ static int sac_user_control_press_mute(struct node *node, unsigned me, unsigned
 	return 0;
 }
 
+static int sac_user_control_press_mute_function(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	__u8 ret;
+
+	if ((ret = sac_util_send_user_control_press(node, me, la, 0x65)))
+		return ret;
+	fail_on_test_v2(node->remote[la].cec_version,
+			la == CEC_LOG_ADDR_AUDIOSYSTEM &&
+			node->remote[la].mute == CEC_OP_AUD_MUTE_STATUS_ON);
+
+	return 0;
+}
+
+static int sac_user_control_press_restore_volume_function(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	__u8 ret;
+
+	if ((ret = sac_util_send_user_control_press(node, me, la, 0x66)))
+		return ret;
+	fail_on_test_v2(node->remote[la].cec_version,
+			la == CEC_LOG_ADDR_AUDIOSYSTEM &&
+			node->remote[la].mute == CEC_OP_AUD_MUTE_STATUS_OFF);
+
+	return 0;
+}
+
 static int sac_user_control_release(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
@@ -763,6 +789,12 @@ struct remote_subtest sac_subtests[] = {
 	{ "User Control Pressed (Mute)",
 	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
 	  sac_user_control_press_mute },
+	{ "User Control Pressed (Restore Volume Function)",
+	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
+	  sac_user_control_press_restore_volume_function },
+	{ "User Control Pressed (Mute Function)",
+	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
+	  sac_user_control_press_mute_function },
 	{ "User Control Released",
 	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
 	  sac_user_control_release },
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 27172560..c6d88647 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -516,6 +516,12 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		case 0x43:
 			node->state.mute = !node->state.mute;
 			break;
+		case 0x65:
+			node->state.mute = CEC_OP_AUD_MUTE_STATUS_ON;
+			break;
+		case 0x66:
+			node->state.mute = CEC_OP_AUD_MUTE_STATUS_OFF;
+			break;
 		case 0x6B:
 			if (!enter_standby(node))
 				exit_standby(node);
-- 
2.23.0

