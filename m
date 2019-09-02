Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE72A5B98
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 18:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfIBQ7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 12:59:22 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:41068 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfIBQ7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 12:59:22 -0400
Received: by mail-ot1-f47.google.com with SMTP id o101so14114954ota.8
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2019 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=alVUoroUMW33M6IWQiBAn6D5mNiIbnYaIpT/IYmBMmg=;
        b=FZNorPC2RaG66N+GreYYahZArGv3vWSZDsrkm8EgpFc2qCsdSxxlh4UGJN9fDE8baR
         ipqyqi+K4NIsJzFe6DNtGmZNoAJojb0KZzyUY0zpKGcrrF6X5TEX33Xk3Nqd+oKM7qNg
         hyJ+GeiAAFe/jfeb8o6oWCd937oAfG0ps/IObbCzIbZ91hZBzLBY1xQwztSkuiWlKJTe
         NR/PXRZR8g730Ak0gwRuAWpVW3hhdbTBUBD+3RnGsvJGDXNRgLh8tdYqWF/2ZcktJp9n
         xHq+fSJpA8W0KmIaCkZo9YQiATTBvzsG8w+3/METHzgiQ+7VPvnHezvke24L4xDgjwQ0
         IHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=alVUoroUMW33M6IWQiBAn6D5mNiIbnYaIpT/IYmBMmg=;
        b=ONyTZfxZb0ci8KrI62SBcf7oM32MW2Gi+Y+xnpoHVsMFbfZU+i7CaEdy/BeypJJEnh
         kgSgj+Jk9z839+0HgS7WqqRFSw/KDhIhvH5duo8shRGbwM3jn1Vi9CPcEgEFVqJoNBF+
         XwyvChpNIUHXMXigwuuCsUQOWYDmzci/IdAOeRrhxpNjieu2QlJXbBgNMgA/UUsCKsYb
         R9PwTuTDKP9m5qXv/tLsY1sa561dBLI/G4i7l7qFZL6Z9yhnQcnGiPwPzHU3pavOJBIF
         tZu44WjMGLm5MtrafJt2xHjgTCkyGa07R9EFLKi7TdvnMoR0flzF8IdZYwqgPO90quqL
         BO+A==
X-Gm-Message-State: APjAAAVHeW57ArWyPAYoSfu/NbzqR1ltxPsvRCiwol1LFdS3zTEGcbKy
        rIEKd8+QU9d4Lg5yA3GX/RZnlh6x
X-Google-Smtp-Source: APXvYqyTFK3B8LR4skrYwBea6jUxxWiXOcSDMhYk9XLV2BT1OOGxQJAUoBFsDZmYy4f3aawojKe/dQ==
X-Received: by 2002:a05:6830:2305:: with SMTP id u5mr1655758ote.299.1567443561390;
        Mon, 02 Sep 2019 09:59:21 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id x140sm2353586oix.42.2019.09.02.09.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 09:59:20 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v2] cec-compliance: system audio control tests
Date:   Mon,  2 Sep 2019 11:59:20 -0500
Message-Id: <20190902165920.17812-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190902093346.20041-1-c0d1n61at3@gmail.com>
References: <20190902093346.20041-1-c0d1n61at3@gmail.com>
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

Changes made since v2:
 - change node->state.mute to boolean

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

