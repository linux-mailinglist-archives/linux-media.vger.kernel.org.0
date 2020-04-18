Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC531AEB6F
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 11:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgDRJoe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 05:44:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:57322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgDRJod (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 05:44:33 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB9DD2220A;
        Sat, 18 Apr 2020 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587203073;
        bh=Bf24aj2REE76UygHFzbm/IZGbbQGM6VTdorc3YSPfiE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H2ywHhzqVlSiQjILGKHMH6XR7I+vcLgaj+uXWrYPTcQbqO4zC7dkgmpH4TxgjpeaM
         8sILhQTHF/0j+hqd1Zt20QAdMKAveKcR6zFZQRb4sC6/0l632a+08UQCUSTJaY/d5e
         RJRtgW8MT9u+ALQw0i2PQwN7R9oCMX2RTOTFyjDo=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPk1W-0081OU-Dp; Sat, 18 Apr 2020 11:44:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 9/9] media: admin-guide: add test-drivers
Date:   Sat, 18 Apr 2020 11:44:29 +0200
Message-Id: <990991deabadaa970adefc91b30af31fb0c9cda7.1587202259.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587202259.git.mchehab+huawei@kernel.org>
References: <cover.1587202259.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While test drivers is probably something that normal users
won't bother, it doesn't hurt to add them to the card list.

This way, all drivers, except for the ones under staging,
would be listed there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index 99f6a43910b7..b90a506965ee 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -680,3 +680,19 @@ xc5000        Xceive XC5000 silicon tuner
 
 	tuner-cardlist
 	frontend-cardlist
+
+Test drivers
+============
+
+In order to test userspace applications, there's a number of virtual
+drivers, with provide test functionality, simulating real hardware
+devices:
+
+=======  ======================================
+Driver   Name
+=======  ======================================
+vicodec  Virtual Codec Driver
+vim2m    Virtual Memory-to-Memory Driver
+vimc     Virtual Media Controller Driver (VIMC)
+vivid    Virtual Video Test Driver
+=======  ======================================
-- 
2.25.2

