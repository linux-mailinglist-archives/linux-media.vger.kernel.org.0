Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31AED1AEB6E
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 11:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgDRJod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 05:44:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:57294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgDRJod (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 05:44:33 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB6E222202;
        Sat, 18 Apr 2020 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587203073;
        bh=nGE9OPCbyb+hqq7hmks8zOjg8Ql/B28QsRusWLKfgxg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bP6NQQZgOavWdx6QhLxNR8QR0jFwJGTG5WsLd70xkBd2HjLDisVcF/XyWGR+lEk+g
         JdzuIQ3JKBxIvr4ijpnd1LyjbgTFuMIzdUgBFAdhSBJ5J5a5R2nDNukCXwvzz1RCGW
         NnxSfIyLjBBZtzzG0bfQZiJDJL43YtUGJUbG0axQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPk1W-0081OK-BN; Sat, 18 Apr 2020 11:44:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 7/9] media: admin-guide: add SPI cards to platform drivers
Date:   Sat, 18 Apr 2020 11:44:27 +0200
Message-Id: <1c0e1fc6341bd416972a586213370bb8d2309adc.1587202259.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587202259.git.mchehab+huawei@kernel.org>
References: <cover.1587202259.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The SPI cards are also under the concept of "platform" drivers
as defined at the section introduction.

So, add a SPI card list there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index ec0e0afd8fb2..cd00154ea623 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -329,6 +329,15 @@ xilinx-video       Xilinx Video IP (EXPERIMENTAL)
 xilinx-vtc         Xilinx Video Timing Controller
 =================  ============================================================
 
+MMC/SDIO DVB adapters
+---------------------
+
+=======  ===========================================
+Driver   Name
+=======  ===========================================
+smssdio  Siano SMS1xxx based MDTV via SDIO interface
+=======  ===========================================
+
 I²C drivers
 ===========
 
-- 
2.25.2

