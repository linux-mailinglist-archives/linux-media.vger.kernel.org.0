Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA93F1F7950
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 16:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgFLOLg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 10:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgFLOLf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 10:11:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6177BC03E96F
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 07:11:35 -0700 (PDT)
Received: from jade.flets-east.jp (unknown [IPv6:2400:4051:61:600:b09c:6559:5445:7c98])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9215524F;
        Fri, 12 Jun 2020 16:11:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591971091;
        bh=A0wo2yVIKVCYRdr8z3MFmtSJsX7sKzG4wyuAVO7BbkE=;
        h=From:To:Cc:Subject:Date:From;
        b=oZp+wqEAtRWpwiVw2kPVtSQDnm5UK0wLmFVezWBh8aB/hmeF5xoYtOPHfkm63x9FT
         799qGAf8kL7ApiRtE1yPwGKkJD5Ns5dSyMfStxA3urJ4T/ohMZDBWvGQYKwcr2fw+K
         MCupiejva9oF/wK0aW7twcxMOP6/G5Xa6HLHD29A=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH] v4l2-compliance: Kill child after failed streamoff test blocks
Date:   Fri, 12 Jun 2020 23:11:07 +0900
Message-Id: <20200612141107.43344-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The test to test that a forked child process can do VIDIOC_STREAMOFF
without being blocked does not kill the child in the event of a failure
(ie. the child process blocks on VIDIOC_STREAMOFF). This causes the
video device node to still be in use even after v4l2-compliance
completes execution. Kill the child process after this test fails.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index fc49fff6..896e8e14 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -2282,6 +2282,8 @@ static int testBlockingDQBuf(struct node *node, cv4l_queue &q)
 	usleep(250000);
 	pid = waitpid(pid_streamoff, &wstatus_streamoff, WNOHANG);
 	kill(pid_dqbuf, SIGKILL);
+	if (pid != pid_streamoff)
+		kill(pid_streamoff, SIGKILL);
 	fail_on_test(pid != pid_streamoff);
 	/* Test that the second child exited properly */
 	if (!pid || !WIFEXITED(wstatus_streamoff)) {
-- 
2.27.0

