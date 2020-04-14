Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357F71A767E
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbgDNIvZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:52228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437110AbgDNIvR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:17 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D329217BA;
        Tue, 14 Apr 2020 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854269;
        bh=ywI4pDm+WgzeD1iklsphJSQzijGWpqO0ruq/jVZ7Wh4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WA2LC6LIN+H7yPbAlgQneDAFOY64kvc8QD0VHnpGw5s3xfgrUXszMDcA8xq0Y5Y86
         ODEQh5TyZA5sr0G0Za78Yy4+UnzAL920YhgOHxMaX5muMTiXbOi2IbbRkd123rZpvS
         AecDIHoRQgAkEqmr2qRt75mn7TARCQhVcCs1y2I4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHf-002x09-KZ; Tue, 14 Apr 2020 10:51:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 18/19] media: docs: add GPLv2 for uAPI guide
Date:   Tue, 14 Apr 2020 10:51:04 +0200
Message-Id: <7c37b42885e687c483cd1bd7a3b2afe998cc327a.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Newer uAPI docs should be dual-licensed with both GPL
and GFDL. Add a text adding the GPLv2 license text there,
in order to be coherent with the included docs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/index.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/userspace-api/media/index.rst b/Documentation/userspace-api/media/index.rst
index 2c2c96a6f146..b20010f414b3 100644
--- a/Documentation/userspace-api/media/index.rst
+++ b/Documentation/userspace-api/media/index.rst
@@ -37,3 +37,20 @@ Linux Media Infrastructure userspace API
   any later version published by the Free Software Foundation, with no
   Invariant Sections. A copy of the license is included in the chapter
   entitled "GNU Free Documentation License".
+
+Please notice that some documents inside the media userspace API,
+when explicitly mentioned on its source code, are dual-licensed
+with GNU Free Documentation License  Version 1.1 and with the
+GNU General Public License::
+
+  This documentation is free software; you can redistribute it and/or modify it
+  under the terms of the GNU General Public License as published by the Free
+  Software Foundation; either version 2 of the License, or (at your option) any
+  later version.
+
+  This program is distributed in the hope that it will be useful, but WITHOUT
+  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
+  more details.
+
+  For more details see the file COPYING in the source distribution of Linux.
-- 
2.25.2

