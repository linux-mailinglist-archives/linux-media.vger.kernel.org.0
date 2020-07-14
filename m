Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B246921E7BA
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 07:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbgGNF7k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 01:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgGNF7j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 01:59:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77745C061755
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 22:59:39 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 879F8564;
        Tue, 14 Jul 2020 07:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594706377;
        bh=WDoRO9NPR4MOKJ4HxQQ9ebMJzu2nlO4yiSFWk8VgQgo=;
        h=From:To:Cc:Subject:Date:From;
        b=v7fgZ4jziq42OLOHzqHfJB5HMdiqDbqKum6DS0uqMXivH+D6wOUnoaccrlgNDydy0
         Gc9NRbpKSvEA0LRggJseafIVtxoCPctPvMqPV/pkCurQ8pt+XUEV492nAk1yJVFhER
         wHekxDJcirkwhQnXBofxVQ5B3LSRPerHbC32fRqo=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v4 1/7] configure.ac: Export git commit count
Date:   Tue, 14 Jul 2020 14:59:09 +0900
Message-Id: <20200714055915.640438-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Export the git commit count from configure.ac to append to version
numbers in the various utils.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
New in v4
---
 configure.ac | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure.ac b/configure.ac
index 36fa6ec8..b3b090f2 100644
--- a/configure.ac
+++ b/configure.ac
@@ -574,6 +574,9 @@ CPPFLAGS="-I\$(top_srcdir)/lib/include -Wall -Wpointer-arith -D_GNU_SOURCE $CPPF
 # Obtain git SHA of HEAD
 AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -d \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse HEAD ; else printf '\"not available\"'; fi)"])
 
+# Obtain git commit count of HEAD
+AC_SUBST(GIT_COMMIT_CNT, ["-DGIT_COMMIT_CNT=\$(shell if test -d \$(top_srcdir)/.git ; then printf '-'; git -C \$(top_srcdir) rev-list --count HEAD ; fi)"])
+
 AM_COND_IF([WITH_LIBDVBV5], [USE_LIBDVBV5="yes"], [USE_LIBDVBV5="no"])
 AM_COND_IF([WITH_DVBV5_REMOTE], [USE_DVBV5_REMOTE="yes"
 				 AC_DEFINE([HAVE_DVBV5_REMOTE], [1], [Usage of DVBv5 remote enabled])],
-- 
2.27.0

