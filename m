Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C99DF255758
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 11:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbgH1JQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 05:16:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:48540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728444AbgH1JQy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 05:16:54 -0400
Received: from mail.kernel.org (unknown [95.90.213.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2EB31208FE;
        Fri, 28 Aug 2020 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598606213;
        bh=IBVeh1zZx2EXVnY8k4/KBmTXmlSvBkhFzMjL+yHXBoo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SaEHHr49V5B5ntZjzcgf9tyQrDbYvKNTQwlowVmIQAijvkRK/AJ3AH+FqENYdFt+l
         YtjBHDfuvvRxO297CzfX/h1Fctd+vTMrMXTVGoASQmyTX9yskbEv75/yjaGp9Q7A9k
         CJ3hB3exaiWWeG5mnFyn2iSjq+Id1QPxNGKQXZiI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kBaV9-0047AD-8f; Fri, 28 Aug 2020 11:16:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v11 2/4] media: open.rst: remove the minor number range
Date:   Fri, 28 Aug 2020 11:16:48 +0200
Message-Id: <e9835a51c2305b10d64231f9df2ec7fa6276030b.1598606093.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598606093.git.mchehab+huawei@kernel.org>
References: <cover.1598606093.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

minor numbers use to range between 0 to 255, but that
was changed a long time ago. While it still applies when
CONFIG_VIDEO_FIXED_MINOR_RANGES, when the minor number is
dynamically allocated, this may not be true. In any case,
this is not relevant, as udev will take care of it.

So, remove this useless misinformation.

Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/open.rst | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/open.rst b/Documentation/userspace-api/media/v4l/open.rst
index 7f1ff8a77059..4928f636c576 100644
--- a/Documentation/userspace-api/media/v4l/open.rst
+++ b/Documentation/userspace-api/media/v4l/open.rst
@@ -26,11 +26,10 @@ helper functions and a common application interface specified in this
 document.
 
 Each driver thus loaded registers one or more device nodes with major
-number 81 and a minor number between 0 and 255. Minor numbers are
-allocated dynamically unless the kernel is compiled with the kernel
-option CONFIG_VIDEO_FIXED_MINOR_RANGES. In that case minor numbers
-are allocated in ranges depending on the device node type (video, radio,
-etc.).
+number 81. Minor numbers are allocated dynamically unless the kernel
+is compiled with the kernel option CONFIG_VIDEO_FIXED_MINOR_RANGES.
+In that case minor numbers are allocated in ranges depending on the
+device node type.
 
 The device nodes supported by the Video4Linux subsystem are:
 
-- 
2.26.2

