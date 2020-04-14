Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99501A7675
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437105AbgDNIvO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:52008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437090AbgDNIvJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:09 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5D3F2078A;
        Tue, 14 Apr 2020 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854268;
        bh=KgQvU9VVZ455GFnTQYGrhOREcaRmNuOAHZPwHxAUlOg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZwwsahgCLRoLU8Id+YE5RUF6NMsw6UrT7yS/J8RxF2IyxpthETH9SURaQEqXdT9xF
         qfBmUwT6ttNKUhB8OBj6qX79JMLGpcR/hEpFPC0pCZ9sYVoMO8O5ILC2t88bL2uLEe
         c3uOmLYDgSoo9aOmq8gY+tlAemvbVso3TMpFybv0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHe-002wym-QY; Tue, 14 Apr 2020 10:51:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 01/19] media: docs: update cardlists
Date:   Tue, 14 Apr 2020 10:50:47 +0200
Message-Id: <73df97e3061215126fa359288c53fa0217dbf2bb.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There were some changes at the drivers adding support for
more cards. Update cardlists accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cx23885-cardlist.rst | 4 ++++
 Documentation/admin-guide/media/cx88-cardlist.rst    | 4 ++++
 Documentation/admin-guide/media/em28xx-cardlist.rst  | 6 +++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/cx23885-cardlist.rst b/Documentation/admin-guide/media/cx23885-cardlist.rst
index ddff8da98eeb..0415b8e0be6f 100644
--- a/Documentation/admin-guide/media/cx23885-cardlist.rst
+++ b/Documentation/admin-guide/media/cx23885-cardlist.rst
@@ -261,3 +261,7 @@ cx23885 cards list
    * - 61
      - Hauppauge WinTV-QuadHD-ATSC(885)
      -
+
+   * - 62
+     - AVerMedia CE310B
+     - 1461:3100
diff --git a/Documentation/admin-guide/media/cx88-cardlist.rst b/Documentation/admin-guide/media/cx88-cardlist.rst
index 56ee08028106..4524dfb13d18 100644
--- a/Documentation/admin-guide/media/cx88-cardlist.rst
+++ b/Documentation/admin-guide/media/cx88-cardlist.rst
@@ -377,3 +377,7 @@ CX88 cards list
    * - 90
      - Leadtek TV2000 XP Global (XC4100)
      - 107d:6f43
+
+   * - 91
+     - NotOnlyTV LV3H
+     -
diff --git a/Documentation/admin-guide/media/em28xx-cardlist.rst b/Documentation/admin-guide/media/em28xx-cardlist.rst
index 2956cbdc28e0..cb2e693a56a2 100644
--- a/Documentation/admin-guide/media/em28xx-cardlist.rst
+++ b/Documentation/admin-guide/media/em28xx-cardlist.rst
@@ -393,7 +393,7 @@ EM28xx cards list
    * - 94
      - PCTV tripleStick (292e)
      - em28178
-     - 2013:025f, 2013:0264, 2040:0264, 2040:8264, 2040:8268, 2040:8268
+     - 2013:025f, 2013:0264, 2040:0264, 2040:8264, 2040:8268
    * - 95
      - Leadtek VC100
      - em2861
@@ -426,3 +426,7 @@ EM28xx cards list
      - :ZOLID HYBRID TV STICK
      - em2882
      -
+   * - 103
+     - Magix USB Videowandler-2
+     - em2861
+     - 1b80:e349
-- 
2.25.2

