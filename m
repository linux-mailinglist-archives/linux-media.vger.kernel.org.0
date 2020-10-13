Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E9528CD07
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 13:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbgJML4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 07:56:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:57390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727668AbgJMLyt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:49 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52AD322512;
        Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=SAoiVBwj4frBK9DklH9xrVa7QCGUVVUYTNr2b3GBIpI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SS5Q7q/f9kTjn2X//6qRecceXdhEwvTLlyumJThvoIpJMln70z/g8N13Huc+Zvild
         q3a4wTstIL4Fir/RpF/qXSTLdPKtYSub3Yn5qLuISHesm1zGz5ncOMk+YRqYe8vdPq
         T3iJkH/BmBLMWc3OsC7YP2akcBVm3z4mj/HmmZSs=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt5-006CVe-6n; Tue, 13 Oct 2020 13:54:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v6 53/80] media: uAPI: buffer.rst: remove a left-over documentation
Date:   Tue, 13 Oct 2020 13:54:08 +0200
Message-Id: <22935a861fb7c76e5d7781c5e3dd77071ba5f4a2.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
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
index 8be62dcffbb2..7dbdfbb4a0a9 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -678,20 +678,6 @@ Buffer Flags
 
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

