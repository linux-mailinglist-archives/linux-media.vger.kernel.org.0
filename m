Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C406AB161
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 05:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392145AbfIFDvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 23:51:32 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41203 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733221AbfIFDvc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 23:51:32 -0400
Received: by mail-ot1-f68.google.com with SMTP id o101so4458480ota.8
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2019 20:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FNKwvAQEG841b6gKiiREjmRG30eyzy4byZZM3hqpa08=;
        b=f7xAC92cK7eaHgkT6a1/xHIUdhufkhGhAIiwVbjsYcOONs4ooGlLAHX+G9SV1p44G+
         fKxUcGfbuXj0CNFtOM5sszbza1+lbbBnfSHbGo0tthsvJ/qL5xwZVTiEGauB8rlJOrMe
         OJpuIkzEPANh7JqD9nKJzm/ggsyHH8F4pUaucinyoBfHNRlk2cKr/lPk9A4ydPLJJsoO
         dGTpV4AXtBvYfCKMYMI2RiWb9A+T166D+MnMsMeXzPW+zZ8exD4J7I2W5CQbwlmV0i5o
         xEOrFyQIKDl7iJaLKh/r1yYiB6eTKyjRBkbnzFBY+jve8asWyOEkwunwyQ73SS7Rz80R
         J+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FNKwvAQEG841b6gKiiREjmRG30eyzy4byZZM3hqpa08=;
        b=Qq1agqz2aTLX0IR8X62S0ryda0Y9fTP4+vsIh3owKY8uvDRHCB0jnvwrfX8nJXQjP7
         70bcaIDUGkZp9v/2dhrEA583cPndKdxTVCECDggVI8Mjy544A2Go0jTHApffv5AYMvqZ
         LcIPPT0lOADgcp7jJKk1cU4CQa77iETon3ssiWD6P9hiEsWqenNVD2yUrlfoiyRMYYnA
         lOuQGXs8VzjwJzVCALsUj9ZJt2CgkE/i6da0TzVk8b6O9Y2xS3uzRuICnKkW/VwRxMtY
         YbKFNsW1ROXAFwZWPH2Yt8rzP73BwxOvQD+RliQQqk83CfP4n6bVY1IWfy7Mj/rkz+p+
         JJog==
X-Gm-Message-State: APjAAAWwyzpGMRVx6IXMsS3/pvmnUmSEBqhu0JxCiotpu1KjnR8htPzf
        ii9e/woKMiPK+Q+ONvySMBOCse9F
X-Google-Smtp-Source: APXvYqzNDoApEjIKo563JpM1QCO0y1XwZ6eIwZDZgG2Ev5z4REdyNlJrrnSJvzqQrPST3gFtqYTuZg==
X-Received: by 2002:a9d:4e11:: with SMTP id p17mr5872392otf.192.1567741891960;
        Thu, 05 Sep 2019 20:51:31 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id c93sm991732otb.22.2019.09.05.20.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 20:51:30 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v3] cec-compliance: system audio control tests
Date:   Thu,  5 Sep 2019 22:51:29 -0500
Message-Id: <20190906035129.18447-2-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190902165920.17812-1-c0d1n61at3@gmail.com>
References: <20190902165920.17812-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The HDMI CEC specification defines deterministic operands for
User Control Pressed that mute or unmute system audio.

Those being:
 - Mute Function for mute on
 - Restore Volume Function for mute off

This is different from the operand Mute which is a toggle.

This patch adds tests for these User Control Pressed operands.

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---

Changes made since v2:
 - add more details to commit message

Notes:

A patch series has been submitted by Hans Verkuil to add CEC UI command operands
to the cec header in the media tree from which v4l-utils copies it.  Once those
patches are applied, another patch will be submitted to leverage the new header
operand macros.

>8---------------------------------------------------------------------------8<

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
index 27172560..a38f664b 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -516,6 +516,12 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		case 0x43:
 			node->state.mute = !node->state.mute;
 			break;
+		case 0x65:
+			node->state.mute = true;
+			break;
+		case 0x66:
+			node->state.mute = false;
+			break;
 		case 0x6B:
 			if (!enter_standby(node))
 				exit_standby(node);
-- 
2.23.0

