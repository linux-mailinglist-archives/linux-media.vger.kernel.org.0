Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040361A7679
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437114AbgDNIvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:52232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728400AbgDNIvM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:12 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8F05208FE;
        Tue, 14 Apr 2020 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854269;
        bh=KORHvO1IDCHSdvc9HLwPNskV7zu8NJdJvxQufH1OdCs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p1cZwtILqGr7k/5if1B3S3LmZLY3lv316vRZtwom22SLHN3X/M0qW/8q3oZAt9QlB
         vK5qK02FGxTUdzosmNKSJ8Vx35Z6xjC+E71+ho+ss7PEuuLFUAvNnLh7pOuvh7jD5f
         +yh/2nF0EUpP9sFxztBmkBp8d2FMIfOjpGUzy37s=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHf-002wzQ-5s; Tue, 14 Apr 2020 10:51:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 09/19] media: docs: cpia2.rst: do some cleanups
Date:   Tue, 14 Apr 2020 10:50:55 +0200
Message-Id: <1ec31c995451d166d3ec9116a9802b4eaa10d072.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Do some cleanups at the document in order to mark two
literal blocks as such.

While here, simplify two block markups, using the less
verbose option (::).

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cpia2.rst | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/media/cpia2.rst b/Documentation/admin-guide/media/cpia2.rst
index 6f4258aebbfe..f6ffef686462 100644
--- a/Documentation/admin-guide/media/cpia2.rst
+++ b/Documentation/admin-guide/media/cpia2.rst
@@ -51,7 +51,7 @@ available at compile time.
 Setup
 ~~~~~
 
-Use 'modprobe cpia2' to load and 'modprobe -r cpia2' to unload. This
+Use ``modprobe cpia2`` to load and ``modprobe -r cpia2`` to unload. This
 may be done automatically by your distribution.
 
 Driver options
@@ -79,16 +79,12 @@ Setting the options
 ~~~~~~~~~~~~~~~~~~~
 
 If you are using modules, edit /etc/modules.conf and add an options
-line like this:
-
-.. code-block:: none
+line like this::
 
 	options cpia2 num_buffers=3 buffer_size=65535
 
 If the driver is compiled into the kernel, at boot time specify them
-like this:
-
-.. code-block:: none
+like this::
 
 	cpia2.num_buffers=3 cpia2.buffer_size=65535
 
-- 
2.25.2

