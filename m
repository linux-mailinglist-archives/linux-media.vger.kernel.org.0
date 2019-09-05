Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A311AA0C5
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 13:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388023AbfIELBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 07:01:34 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48310 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfIELBd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 07:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Gd5Si23CQTkjXHrd1kfDMwHId0XN7lelZ5t8iFh3FtY=; b=siCmQcbRBU1+a6LPDnLeI+LN/p
        uF+ApHOVakeqBxbCBMBZwDoLmgufJ81HdrUihZtcPe5S6KEWqVNV3oc5UOileqPOfagquF2TlEiMN
        +pQz2Ixl5/yy4+HIc/SDNs0XofIZM1HwJsmoliA35trjpswlq17SCovLc10tjyzz+5gkEqZKbp5Hp
        huh0bEpWI7NQOe2hg6Mv9EPS1DyYZbLvnng53LZfbS3z6X2pMxvjM+COAgUw6UVhUtLxh8i4S2Kyz
        yvOZo+4U51vnVQRLBmwX2D0rjXGblveF8ARgij8vSj5QIPwcabhjLVZtG9leHpulrZFNucttxnAS6
        9+TclA9A==;
Received: from 177.17.137.173.dynamic.adsl.gvt.net.br ([177.17.137.173] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5pW8-0003ac-Uc; Thu, 05 Sep 2019 11:01:32 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.1)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i5pW6-00030x-Jb; Thu, 05 Sep 2019 08:01:30 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 1/3] docs: sphinx: add SPDX header for some sphinx extensions
Date:   Thu,  5 Sep 2019 08:01:27 -0300
Message-Id: <d1331081c206afb4ba71e07d5b11a67896cbd99f.1567681249.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905075028.643f4b9d@coco.lan>
References: <20190905075028.643f4b9d@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Those extensions are released under GPLv2, as stated at the
:license: markup tag.

Add the corresponding SPDX tags for such license.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/sphinx/kernel_include.py | 1 +
 Documentation/sphinx/rstFlatTable.py   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/sphinx/kernel_include.py b/Documentation/sphinx/kernel_include.py
index f523aa68a36b..7aaea4e31f78 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -1,5 +1,6 @@
 #!/usr/bin/env python3
 # -*- coding: utf-8; mode: python -*-
+# SPDX-License-Identifier: GPL-2.0
 # pylint: disable=R0903, C0330, R0914, R0912, E0401
 
 u"""
diff --git a/Documentation/sphinx/rstFlatTable.py b/Documentation/sphinx/rstFlatTable.py
index 2019a55f6b18..15769d01831b 100755
--- a/Documentation/sphinx/rstFlatTable.py
+++ b/Documentation/sphinx/rstFlatTable.py
@@ -1,5 +1,6 @@
 #!/usr/bin/env python3
 # -*- coding: utf-8; mode: python -*-
+# SPDX-License-Identifier: GPL-2.0
 # pylint: disable=C0330, R0903, R0912
 
 u"""
-- 
2.21.0

