Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8601AEBD6
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 12:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgDRKg4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 06:36:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:40726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgDRKg4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 06:36:56 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95F6722202;
        Sat, 18 Apr 2020 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587206215;
        bh=W74xYnqrQ0poiHD+2YrRZlrtHU0MYIFjCYEobpBZfO4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pIsocd9ULYLwvsDkg6kKyDuw0OLaliXJ34dDjHEkoGGEKDFQXONRo75zJFaXUr64p
         hpgpjjIgmARU3c2HqN/H8Nlpf2CUPmTEhX9+i+6uBYDETS5Wt9BLa/yomPMbunXH/p
         jDACucwSMyB/+GxXbc3ZpH+QpB/01wBOWhk6ZkUg=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPkqD-00838T-JO; Sat, 18 Apr 2020 12:36:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 1/3] media: admin-guide: bt8xx.rst: fix a broken cross-reference
Date:   Sat, 18 Apr 2020 12:36:50 +0200
Message-Id: <103cae7815c66d25c2b8df408b5cf5eaac84ff19.1587206071.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587206071.git.mchehab+huawei@kernel.org>
References: <cover.1587206071.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The old cards.rst file doesn't exist anymore. Also, it is not
the right reference there, as it should be pointing to the
bttv-specific cardlist.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/bt8xx.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/bt8xx.rst b/Documentation/admin-guide/media/bt8xx.rst
index a55f4f5af042..d6cf81d83d61 100644
--- a/Documentation/admin-guide/media/bt8xx.rst
+++ b/Documentation/admin-guide/media/bt8xx.rst
@@ -18,7 +18,7 @@ General information
 This class of cards has a bt878a as the PCI interface, and require the bttv driver
 for accessing the i2c bus and the gpio pins of the bt8xx chipset.
 
-Please see :doc:`cards` for a complete list of Cards based on the
+Please see :doc:`bttv-cardlist` for a complete list of Cards based on the
 Conexant Bt8xx PCI bridge supported by the Linux Kernel.
 
 In order to be able to compile the kernel, some config options should be
-- 
2.25.2

