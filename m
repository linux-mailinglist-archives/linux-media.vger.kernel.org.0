Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3481826D48C
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 09:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgIQHVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 03:21:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:33068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726142AbgIQHVc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 03:21:32 -0400
Received: from mail.kernel.org (ip5f5ad5d2.dynamic.kabel-deutschland.de [95.90.213.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23DFD2072E;
        Thu, 17 Sep 2020 07:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600327292;
        bh=LsYu5+UKYtrBXVS97CR8fjSRbR1fmC3CDNoPwB+QyCY=;
        h=From:To:Cc:Subject:Date:From;
        b=UbJ4/WpmY7ZsQ1VuxhjCHTXz5/P5sRuN4aV27C6rbzCgScbeiUO+7oynHwexMMaWS
         L47G/OVYp5FzARmY/MD6brU3MAI0GslMIJH9zX00SPU+fck/ECj2Drtu3CdApOGMid
         YllTNNTkwHxlUxaTmPyGrR9VMAE13FC4zc8dhGZA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kIoET-0050wc-Ru; Thu, 17 Sep 2020 09:21:29 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     linux-media@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: uAPI: buffer.rst: remove a left-over documentation
Date:   Thu, 17 Sep 2020 09:21:26 +0200
Message-Id: <2fd3e12d82de1e0a1ee2f96dedc4d4cbe771c979.1600327262.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changeset 129134e5415d ("media: media/v4l2: remove V4L2_FLAG_MEMORY_NON_CONSISTENT flag")
reverted an uAPI flag, but it kept some left-overs at the documentation.

Drop them too. This should solve this warning:

	Documentation/userspace-api/media/v4l/buffer.rst:692: WARNING: The "flat-table" directive is empty; content required.

	.. flat-table::
	    :header-rows:  0
	    :stub-columns: 0
	    :widths:       3 1 4

Fixes: 129134e5415d ("media: media/v4l2: remove V4L2_FLAG_MEMORY_NON_CONSISTENT flag")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/buffer.rst | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 4f95496adc5b..da7366e0e317 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -682,20 +682,6 @@ Buffer Flags
 
 .. _memory-flags:
 
-Memory Consistency Flags
-========================
-
-.. tabularcolumns:: |p{7.0cm}|p{2.2cm}|p{8.3cm}|
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       3 1 4
-
-.. c:type:: v4l2_memory
-
 enum v4l2_memory
 ================
 
-- 
2.26.2

