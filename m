Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B89BAADB28
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 16:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbfIIO04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 10:26:56 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38256 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbfIIO04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 10:26:56 -0400
Received: by mail-oi1-f195.google.com with SMTP id 7so10671933oip.5
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2019 07:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mP0fRk/YhaxJL+vpDg0DeOYsx2YjD4Fw5w6e7jmISX8=;
        b=bHw7FeH5zFBxyHAuQRepOzNkibTNGvUMS6WfnDk82nrqD/0wGvXJ+moh9xNZgyAbRq
         afsYQe/LiZ3Zx6R34xesPbFUYZPYFIzCKPob0aML7SLYTLxzt/bXOMlu4RoL7HNCmY6a
         MteeKoghQTN+3liS8d0tyya5ucmxuYabwJvJKCFNAqGMfkEjCtpD1SLiQBrX/IsG5Fwe
         fJikrefdmXfpT8txGHQD6N649+UBL6PDWpaCLoVxnoKovIE3f2RU4h6RVVrtj4Rpphqj
         VIZ55mJeE6+Phhki2wgCRE905cbeo+Vwmx3pc1ARQTV6BpfU4cMKxWin8DZ3xID79qNy
         2soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mP0fRk/YhaxJL+vpDg0DeOYsx2YjD4Fw5w6e7jmISX8=;
        b=tvIyT2CiBTK1NrWkKtVhrHLPapGQRlVYHuOR5xTC3XazxpXnJz4L8R3WWnOtbj7cCh
         lVDY/NvRZ6nVNMaXPQ897x2dG/ujxhdw0Wcw1mClbX5HhLR9MMDw2tsNIE2F80O0sbVA
         6GR0MfhGDOL7xNEwZH/m5d5M/Pe58GztyjafVT8u3kDp/urMhqHKNOxBTVeKl5UGAFBp
         bosOgB7vh0dco3RLQ37GXdv8JK4r3ZxUUUSRvhJKpENFBJM44eHJWGMSVP/Nohel2ICf
         995HCTdxGThqidMsDXMRtyPI4vqqf1qvxBXGftMRMzTTpEc+fudTo1z8bEMlURyEN+tF
         YV0Q==
X-Gm-Message-State: APjAAAUGk8OUrX2dJw2PwrVxnFSKQI/U7KIN66ycKmMPtALYTyFXOcco
        ea079nlPUeqHMeE2v0R0L6OrAkQs
X-Google-Smtp-Source: APXvYqxFrLexKD70dIgrVw1xbQlkMYgRZFzeXY8drgH8xy60SdV5ns7JQtqCb4Lo7cBuT1Pmh7Fbiw==
X-Received: by 2002:aca:f48e:: with SMTP id s136mr17858660oih.57.1568039214824;
        Mon, 09 Sep 2019 07:26:54 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id l4sm341369oia.51.2019.09.09.07.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2019 07:26:54 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH] cec-compliance: rename has_arc_rx, has_arc_tx
Date:   Mon,  9 Sep 2019 09:26:53 -0500
Message-Id: <20190909142653.35823-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Renaming has_arc_rx and has_arc_tx to better match the macros defined in
cec.h:
- CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX
- CEC_OP_FEAT_DEV_SINK_HAS_ARC_TX

For devices on a HDMI ARC link, sources can only support receiver devices
and sinks can only support transmitter devices.

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp |  4 ++--
 utils/cec-compliance/cec-compliance.h   |  4 ++--
 utils/cec-compliance/cec-test-audio.cpp | 10 +++++-----
 utils/cec-follower/cec-follower.cpp     |  4 ++--
 utils/cec-follower/cec-follower.h       |  4 ++--
 utils/cec-follower/cec-processing.cpp   |  8 ++++----
 6 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 3818ce58..d89962f0 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -1038,9 +1038,9 @@ static void topology_probe_device(struct node *node, unsigned i, unsigned la)
 		node->remote[i].rc_profile = *rc_profile;
 		node->remote[i].dev_features = *dev_features;
 		node->remote[i].all_device_types = all_device_types;
-		node->remote[i].has_arc_rx =
+		node->remote[i].source_has_arc_rx =
 			(*dev_features & CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX) != 0;
-		node->remote[i].has_arc_tx =
+		node->remote[i].sink_has_arc_tx =
 			(*dev_features & CEC_OP_FEAT_DEV_SINK_HAS_ARC_TX) != 0;
 		node->remote[i].has_aud_rate =
 			(*dev_features & CEC_OP_FEAT_DEV_HAS_SET_AUDIO_RATE) != 0;
diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index d7460b62..023c34d4 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -137,8 +137,8 @@ struct remote {
 	bool has_text_view_on;
 	bool in_standby;
 	bool has_remote_control_passthrough;
-	bool has_arc_rx;
-	bool has_arc_tx;
+	bool source_has_arc_rx;
+	bool sink_has_arc_tx;
 	bool arc_initiated;
 	bool has_sys_audio_mode_req;
 	bool has_set_sys_audio_mode;
diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 872bb9ad..2bc24daf 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -165,17 +165,17 @@ static int arc_initiate_tx(struct node *node, unsigned me, unsigned la, bool int
 	cec_msg_initiate_arc(&msg, true);
 	fail_on_test(!transmit_timeout(node, &msg));
 	if (timed_out(&msg)) {
-		fail_on_test_v2(node->remote[la].cec_version, node->remote[la].has_arc_tx);
+		fail_on_test_v2(node->remote[la].cec_version, node->remote[la].sink_has_arc_tx);
 		warn("Timed out waiting for Report ARC Initiated/Terminated.\n");
 		return PRESUMED_OK;
 	}
 	if (unrecognized_op(&msg)) {
-		fail_on_test_v2(node->remote[la].cec_version, node->remote[la].has_arc_tx);
+		fail_on_test_v2(node->remote[la].cec_version, node->remote[la].sink_has_arc_tx);
 		return NOTSUPPORTED;
 	}
 	if (cec_msg_opcode(&msg) == CEC_MSG_REPORT_ARC_INITIATED) {
 		fail_on_test(!pa_are_adjacent(node->phys_addr, node->remote[la].phys_addr));
-		fail_on_test_v2(node->remote[la].cec_version, !node->remote[la].has_arc_tx);
+		fail_on_test_v2(node->remote[la].cec_version, !node->remote[la].sink_has_arc_tx);
 		node->remote[la].arc_initiated = true;
 	}
 	else if (cec_msg_opcode(&msg) == CEC_MSG_REPORT_ARC_TERMINATED)
@@ -248,11 +248,11 @@ static int arc_initiate_rx(struct node *node, unsigned me, unsigned la, bool int
 		}
 	}
 	if (unsupported) {
-		fail_on_test_v2(node->remote[la].cec_version, node->remote[la].has_arc_rx);
+		fail_on_test_v2(node->remote[la].cec_version, node->remote[la].source_has_arc_rx);
 		return NOTSUPPORTED;
 	}
 	fail_on_test(!pa_are_adjacent(node->phys_addr, node->remote[la].phys_addr));
-	fail_on_test_v2(node->remote[la].cec_version, !node->remote[la].has_arc_rx);
+	fail_on_test_v2(node->remote[la].cec_version, !node->remote[la].source_has_arc_rx);
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_report_arc_initiated(&msg);
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 77394ab0..dca0f627 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -450,8 +450,8 @@ int main(int argc, char **argv)
 			__u8 byte = laddrs.features[0][idx];
 
 			if (is_dev_feat) {
-				node.has_arc_rx = (byte & CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX) != 0;
-				node.has_arc_tx = (byte & CEC_OP_FEAT_DEV_SINK_HAS_ARC_TX) != 0;
+				node.source_has_arc_rx = (byte & CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX) != 0;
+				node.sink_has_arc_tx = (byte & CEC_OP_FEAT_DEV_SINK_HAS_ARC_TX) != 0;
 				node.has_aud_rate = (byte & CEC_OP_FEAT_DEV_HAS_SET_AUDIO_RATE) != 0;
 				node.has_deck_ctl = (byte & CEC_OP_FEAT_DEV_HAS_DECK_CONTROL) != 0;
 				node.has_rec_tv = (byte & CEC_OP_FEAT_DEV_HAS_RECORD_TV_SCREEN) != 0;
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 36496fdc..0998382c 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -64,8 +64,8 @@ struct node {
 	struct state state;
 	__u16 phys_addr;
 	__u8 cec_version;
-	bool has_arc_rx;
-	bool has_arc_tx;
+	bool source_has_arc_rx;
+	bool sink_has_arc_tx;
 	bool has_aud_rate;
 	bool has_deck_ctl;
 	bool has_rec_tv;
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index a38f664b..fa7687c9 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -753,7 +753,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		/* Audio Return Channel Control */
 
 	case CEC_MSG_INITIATE_ARC:
-		if (node->has_arc_tx) {
+		if (node->sink_has_arc_tx) {
 			if (!pa_is_upstream_from(node->phys_addr, remote_pa) ||
 			    !pa_are_adjacent(node->phys_addr, remote_pa)) {
 				cec_msg_reply_feature_abort(&msg, CEC_OP_ABORT_REFUSED);
@@ -769,7 +769,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		}
 		break;
 	case CEC_MSG_TERMINATE_ARC:
-		if (node->has_arc_tx) {
+		if (node->sink_has_arc_tx) {
 			if (!pa_is_upstream_from(node->phys_addr, remote_pa) ||
 			    !pa_are_adjacent(node->phys_addr, remote_pa)) {
 				cec_msg_reply_feature_abort(&msg, CEC_OP_ABORT_REFUSED);
@@ -785,7 +785,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		}
 		break;
 	case CEC_MSG_REQUEST_ARC_INITIATION:
-		if (node->has_arc_rx) {
+		if (node->source_has_arc_rx) {
 			if (pa_is_upstream_from(node->phys_addr, remote_pa) ||
 			    !pa_are_adjacent(node->phys_addr, remote_pa)) {
 				cec_msg_reply_feature_abort(&msg, CEC_OP_ABORT_REFUSED);
@@ -800,7 +800,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		}
 		break;
 	case CEC_MSG_REQUEST_ARC_TERMINATION:
-		if (node->has_arc_rx) {
+		if (node->source_has_arc_rx) {
 			if (pa_is_upstream_from(node->phys_addr, remote_pa) ||
 			    !pa_are_adjacent(node->phys_addr, remote_pa)) {
 				cec_msg_reply_feature_abort(&msg, CEC_OP_ABORT_REFUSED);
-- 
2.23.0

