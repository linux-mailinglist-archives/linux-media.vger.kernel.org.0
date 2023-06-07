Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E41B7251FD
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 04:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240706AbjFGCMW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 22:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240710AbjFGCMV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 22:12:21 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9652319A4
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 19:12:19 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 31F1F6606EF4;
        Wed,  7 Jun 2023 03:12:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1686103938;
        bh=7i3xDdpR5V7CYfQEDPt1HyY5RZ3HDruT3ILH20+KXyg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YXvwIC7OAMovcdB4DG2z5PBK3p+XoaWgpGRMYSnPSq0lgLSS8c3YXALnNNr6c24OK
         SgNOzbAQGPg02NZX4t97woltcZiLz/2Q577bXXc+ucmmyS8yrNCbTcYR+62BtpJHyV
         4rGMm6Jkm+QiXEAi0azFOCBaxMrWUXiXif2DYGSDp2dqWeJJ8nC8riy90jNNbs/4hH
         s400kSh6lU+R2KUe+psMBYug4+SCFCkmPwG3OMF23O2x4DCvNo/Yh+6NyAVqnMMqGp
         kI1ybvAwYYzEN6m5FylJfhhjst27jrlb2ox3dmdtSJPq7S/tSwp2gbgzmnNrXEsRCR
         F+08O6eTMFMoQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 3/4] v4l2-tracer: stringify target in v4l2_selection
Date:   Tue,  6 Jun 2023 19:11:57 -0700
Message-Id: <6ba577331303022b419d58fcbfaeba7b2459a5b5.1686102391.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686102391.git.deborah.brouwer@collabora.com>
References: <cover.1686102391.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The struct v4l2_selection has a member "target" that is currently being
traced as an integer.  Since the "target" values are defines, convert them
to strings to make the trace easier to read.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/v4l2-tracer-gen.pl | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index f3eb87bb..4db204e3 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -246,7 +246,9 @@ sub get_val_def_name {
 	if ($member eq "audmode") {
 		return "tuner_audmode_val_def";
 	}
-	return "";
+	if ($member eq "target" && $struct_name eq "v4l2_selection") {
+		return "selection_target_val_def";
+	}
 }
 
 sub get_flag_def_name {
@@ -974,6 +976,11 @@ while (<>) {
 	if (grep {/^#define\s+(MEDIA_REQUEST_IOC\w*)\s*.*/} $_) {
 		push (@ioctls, $_);
 	}
+	if (grep {/^#define V4L2_SEL_TGT_CROP\s+/} $_) {
+		printf $fh_common_info_h "constexpr val_def selection_target_val_def[] = {\n";
+		val_def_gen("V4L2_SEL_TGT_COMPOSE_PADDED");
+		next;
+	}
 }
 
 printf $fh_common_info_h "constexpr val_def control_val_def[] = {\n";
-- 
2.40.1

