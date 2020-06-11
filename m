Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277F11F600F
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 04:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgFKCem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 22:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgFKCem (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 22:34:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A643C08C5C1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 19:34:42 -0700 (PDT)
Received: from emerald.amanokami.net (fs76eef344.knge213.ap.nuro.jp [118.238.243.68])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DAF826A;
        Thu, 11 Jun 2020 04:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591842878;
        bh=CjEU4yH4AYS/BxdXjH9o+wM/IOzom8tqMwO1m6Cm7a8=;
        h=From:To:Cc:Subject:Date:From;
        b=SPjJjLqQhwPcneJozR9tLuLYWjhBwk/cmgHVaafSsOzZUhw0geB9teRwnirmZPJ3X
         +RY42nxFbb769NswVou4OUU+Q5MFDviF64RKGl4P08b6RQo/7/7jvHTL2yS0C/hrv+
         dHd9lnExF3AfrohnbFb+oKU9dccxyVCatHEMEwhc=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH] v4l2-ctl: Fix test_ioctl cmd type
Date:   Thu, 11 Jun 2020 11:34:14 +0900
Message-Id: <20200611023414.4702-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

test_ioctl uses int for the ioctl cmd, while it should be unsigned long.
Fix this.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 utils/v4l2-ctl/v4l2-ctl.cpp | 2 +-
 utils/v4l2-ctl/v4l2-ctl.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index e7b270cd..4972591e 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -306,7 +306,7 @@ static void usage_all()
        edid_usage();
 }
 
-int test_ioctl(int fd, int cmd, void *arg)
+int test_ioctl(int fd, unsigned long cmd, void *arg)
 {
 	return options[OptUseWrapper] ? v4l2_ioctl(fd, cmd, arg) : ioctl(fd, cmd, arg);
 }
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index b31be7f5..28e50471 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -300,7 +300,7 @@ typedef struct {
 
 // v4l2-ctl.cpp
 int doioctl_name(int fd, unsigned long int request, void *parm, const char *name);
-int test_ioctl(int fd, int cmd, void *arg);
+int test_ioctl(int fd, unsigned long cmd, void *arg);
 int parse_subopt(char **subs, const char * const *subopts, char **value);
 __u32 parse_field(const char *s);
 __u32 parse_colorspace(const char *s);
-- 
2.25.1

