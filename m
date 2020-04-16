Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5BE1ABF89
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 13:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633628AbgDPLhQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 07:37:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:38608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2506441AbgDPLhB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 07:37:01 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8ECC321D7F;
        Thu, 16 Apr 2020 11:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587037017;
        bh=oU9vHFsJgKh2goYQCM4HsG47VtXKYTeS6/Dj+CidDT8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SV7DGoz1d6/D2uX9zd+zPP1z/iS49p0rtq5AGVNe4gSHgEzyMfQA96r3oYHOr4vpb
         L3SvGTl65NV9Y/fspFTxGGec13JdRBYZ0XJZdcgOb4EDVM9pqADngQGMK5uitNPQIM
         4K69jZHTqt/VSUYpCpquHf1Fw+vhVL0dj1B5W7js=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jP2pD-007SZF-36; Thu, 16 Apr 2020 13:36:55 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 2/4] media: admin-guide: update em28xx cardlist
Date:   Thu, 16 Apr 2020 13:36:51 +0200
Message-Id: <9b47bca9c526e736c9a76fbfc8d2faf36e03cd74.1587036920.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587036920.git.mchehab+huawei@kernel.org>
References: <cover.1587036920.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A new em28xx card was added upstream. Update cards list
accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/em28xx-cardlist.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/admin-guide/media/em28xx-cardlist.rst b/Documentation/admin-guide/media/em28xx-cardlist.rst
index cb2e693a56a2..a5f0e6d22a1a 100644
--- a/Documentation/admin-guide/media/em28xx-cardlist.rst
+++ b/Documentation/admin-guide/media/em28xx-cardlist.rst
@@ -430,3 +430,7 @@ EM28xx cards list
      - Magix USB Videowandler-2
      - em2861
      - 1b80:e349
+   * - 104
+     - PCTV DVB-S2 Stick (461e v2)
+     - em28178
+     - 2013:0461, 2013:0259
-- 
2.25.2

