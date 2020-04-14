Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8F21A768B
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437129AbgDNIve (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:52298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437090AbgDNIvQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:16 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34D5D2166E;
        Tue, 14 Apr 2020 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854269;
        bh=hGIYZuo1/EwFQnPQkALnB47QjS1z9Wht6he665ef13Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kq4q7Z28x5Rv5aLYIlNOBA1O3ZYeqCfonI45aMp9ZJdTnABHHqn/t6WrOGAAapzso
         FFLPv/CJVF9EJE6sjDtV2h0pcUwy1c7O9P/95SES0jLRxU7n7RDiFnvMFbCu4T80iK
         MurgkEQRhDPuxO6uhKwgpCSrq5v5gzSoGD7iw7l0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHf-002wzp-EY; Tue, 14 Apr 2020 10:51:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 14/19] media: docs: Add a master topic for the index file
Date:   Tue, 14 Apr 2020 10:51:00 +0200
Message-Id: <eb1b789365a5469915a6441d0f1dac320fb7919d.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now, both V4L and Digital TV are shown as main titles.

Instead, add a main title, in order to better display its
output.

While here, simplify the file, as we don't need to add
a title for the indexes, nor we need copyright info, as
everything there is GPL, as stated by the SPDX tags.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../driver-api/media/drivers/index.rst        | 37 ++++---------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/index.rst b/Documentation/driver-api/media/drivers/index.rst
index aafff51f7e0e..0df85fc96605 100644
--- a/Documentation/driver-api/media/drivers/index.rst
+++ b/Documentation/driver-api/media/drivers/index.rst
@@ -2,15 +2,12 @@
 
 .. include:: <isonum.txt>
 
-################################################
-Video4Linux (V4L)  driver-specific documentation
-################################################
+===================================
+Media driver-specific documentation
+===================================
 
-.. only:: html
-
-    .. class:: toc-title
-
-        Table of Contents
+Video4Linux (V4L) drivers
+=========================
 
 .. toctree::
 	:maxdepth: 5
@@ -30,28 +27,8 @@ Video4Linux (V4L)  driver-specific documentation
 	vimc-devel
 
 
-##############################################
-Linux Digital TV driver-specific documentation
-##############################################
-
-**Copyright** |copy| 2001-2016 : LinuxTV Developers
-
-This documentation is free software; you can redistribute it and/or modify it
-under the terms of the GNU General Public License as published by the Free
-Software Foundation version 2 of the License.
-
-This program is distributed in the hope that it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
-more details.
-
-For more details see the file COPYING in the source distribution of Linux.
-
-.. only:: html
-
-   .. class:: toc-title
-
-	Table of Contents
+Digital TV drivers
+==================
 
 .. toctree::
 	:maxdepth: 5
-- 
2.25.2

