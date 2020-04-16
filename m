Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B8F1AB686
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 06:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgDPEKy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 00:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgDPEKu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 00:10:50 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156C8C061A0C
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 21:10:50 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id p8so1041452pgi.5
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 21:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/gqrlehxu2Sttsbo1Az6ANa5ftbUuvjB3PHh6ElaiAU=;
        b=SVEPbau1QnkdwI9VAcHDPQ2e/hEfOlGpYje8u9G0Nup6Mms+cMsTyHHBSRD3aj4dcs
         +pNpXFwz8ObIIHUDalnEmEu9m3c2jczAavaeyFuhQRuVEzc6n0pUOJoTpp9FajxN3XZX
         AbCpaxirx2MOdw6QbpANwEacIOvgT2H3RB1OVvjOZUKM2AdwfYOD/DS+nbKhEn33i5N1
         vxhrUmuzxxUJZLLmGGpos/iVsKX3X87ttAiehqdyq3+y31KM9/rVZLXT3DIPilDBrrDJ
         0tBmNiq3/n/8PF3WPD/CWM2jUyMyHeh/FAjp1hLAvUqTQJgc1/W+5+Bng8fQMnK13sS+
         fNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/gqrlehxu2Sttsbo1Az6ANa5ftbUuvjB3PHh6ElaiAU=;
        b=AAFQnqSECAqJdL1tO3EOxw8Q7lhU7nMfgilbw1qJ+dsSLN2gyBZz6pwd99uwxz460p
         0t0PwrwBm6S4Ib/nAwPWEsqVuTSfViw6s//5VoJmYrmdBuS/tYCzwGmaQC9sfMALAU1V
         4itMMdapYjQzJTRHFJhkB5CXZQ6utyubH+6zJnat4cWoerzt8OC7hknf2FwXlu4I8Qbc
         +dtzFloKi8Wh4aw5AComCrrIW4GQlHXjKJzbL/Ow5cyvjV28bko7MJjXlVyJU2JPX2gS
         Wr98mzltCmxE1uDXbRgEmLom6Wiz0FbYCUAbhVdRqSsaHNCYz9lF0TK+vD1C041bc3l5
         kudg==
X-Gm-Message-State: AGi0Puak3BuaiUbW+wEICU3g5VdvpQDxcpApADL4a++wduaokxIDWEjn
        Ou8Jg4Csu3PfKPVV4Js6yYlIHqPe
X-Google-Smtp-Source: APiQypLbj6zbYzR5/Ok1PcAn5HtL6t/l0DAtH8eQZoOXmdPbfK04YHCCZHNTxc/3ixogqKWABys9Dw==
X-Received: by 2002:a63:f45:: with SMTP id 5mr28859843pgp.31.1587010249215;
        Wed, 15 Apr 2020 21:10:49 -0700 (PDT)
Received: from localhost.localdomain (astound-69-42-19-227.ca.astound.net. [69.42.19.227])
        by smtp.gmail.com with ESMTPSA id b11sm15454977pfr.155.2020.04.15.21.10.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 21:10:48 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] utils: checks for empty instead of size in if
Date:   Wed, 15 Apr 2020 21:10:46 -0700
Message-Id: <20200416041046.389060-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with clang-tidy's readability-container-size-empty

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-ctl/cec-ctl.cpp           |  2 +-
 utils/rds-ctl/rds-ctl.cpp           |  2 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp  |  4 ++--
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp | 10 +++++-----
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index b64a42b5..ae668806 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -2309,7 +2309,7 @@ int main(int argc, char **argv)
 		return 1;
 	}
 
-	if (msgs.size())
+	if (!msgs.empty())
 		warn_if_unconfigured = true;
 
 	if (store_pin && analyze_pin) {
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 17d3e203..b1e076fb 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -992,7 +992,7 @@ int main(int argc, char **argv)
 	if (!params.options[OptSetDevice]) {
 		/* check the system for RDS capable devices */
 		dev_vec devices = list_devices();
-		if (devices.size() == 0) {
+		if (devices.empty()) {
 			fprintf(stderr, "No RDS-capable device found\n");
 			exit(1);
 		}
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index ac294dd1..e3c2602c 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -1007,7 +1007,7 @@ void common_set(cv4l_fd &_fd)
 				}
 				continue;
 			}
-			if (iter->second.size()) {
+			if (!iter->second.empty()) {
 				ctrls.which = iter->first;
 				ctrls.count = iter->second.size();
 				ctrls.controls = &iter->second[0];
@@ -1133,7 +1133,7 @@ void common_get(cv4l_fd &_fd)
 				}
 				continue;
 			}
-			if (iter->second.size()) {
+			if (!iter->second.empty()) {
 				ctrls.which = iter->first;
 				ctrls.count = iter->second.size();
 				ctrls.controls = &iter->second[0];
diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
index 4eca772b..162248bc 100644
--- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
@@ -395,9 +395,9 @@ static void do_try_set_overlay(struct v4l2_format &fmt, int fd)
 	if (((set_overlay_fmt & FmtWidth) && win.w.width != overlay_fmt.fmt.win.w.width) ||
 	    ((set_overlay_fmt & FmtHeight) && win.w.height != overlay_fmt.fmt.win.w.height))
 		keep_old_bitmap = keep_old_clip = false;
-	if (options[OptClearBitmap] || bitmap_rects.size())
+	if (options[OptClearBitmap] || !bitmap_rects.empty())
 		keep_old_bitmap = false;
-	if (options[OptClearClips] || clips.size())
+	if (options[OptClearClips] || !clips.empty())
 		keep_old_clip = false;
 
 	win.bitmap = NULL;
@@ -428,11 +428,11 @@ static void do_try_set_overlay(struct v4l2_format &fmt, int fd)
 		win.w.height = overlay_fmt.fmt.win.w.height;
 	if (set_overlay_fmt & FmtField)
 		win.field = overlay_fmt.fmt.win.field;
-	if (clips.size()) {
+	if (!clips.empty()) {
 		win.clipcount = clips.size();
 		win.clips = &clips[0];
 	}
-	if (bitmap_rects.size()) {
+	if (!bitmap_rects.empty()) {
 		free(bitmap);
 		stride = (win.w.width + 7) / 8;
 		bitmap = (unsigned char *)calloc(1, stride * win.w.height);
@@ -471,7 +471,7 @@ void overlay_set(cv4l_fd &_fd)
 
 	if ((options[OptSetOverlayFormat] || options[OptTryOverlayFormat]) &&
 			(set_overlay_fmt || options[OptClearClips] || options[OptClearBitmap] ||
-			 bitmap_rects.size() || clips.size())) {
+			 !bitmap_rects.empty() || !clips.empty())) {
 		struct v4l2_format fmt;
 
 		memset(&fmt, 0, sizeof(fmt));
-- 
2.25.2

