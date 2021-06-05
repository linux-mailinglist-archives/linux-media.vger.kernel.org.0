Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6A639C868
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 15:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhFENU1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 09:20:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:34976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230010AbhFENUZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 5 Jun 2021 09:20:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D75D61415;
        Sat,  5 Jun 2021 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622899117;
        bh=g/jdZT1gBnuTDgjFzAjtVYT0Hs6V9Xjuv7stn/cXdzE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r4jN4LsrytPjXP7z0aqH6AuFHB1P6tQYJW/LsFIYDz1x+AVlJ+bQqkARpX2yaJBHI
         Mf3/qlGX2RwCoQ05lL4eSvptOf5aJpk/4VwoIpi1GcgFyJFR3zZOwGS6WXJr51frgW
         jFPrSfB+6Ky8lVRrPx8CnopIEWJFI/rwpBXv40uNEuKlU/ZBuc+y7D8r3w6KzZjtwp
         8WP4jsdJQM9JnSOjFqjNTrQiJWNb67Baolzu+HwoYdpGNC77rEaxacTjXkOHjUVEiv
         yTPYcTOzYa4C5y+1LpnWTqeYnMzFEnb/fKsVnfmNBmc11V53HYtCY1sgTRZPeTIevU
         SN3WDKrdPJkaw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lpWCB-008GEj-DL; Sat, 05 Jun 2021 15:18:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 04/34] media: userspace-api: avoid using ReST :doc:`foo` markup
Date:   Sat,  5 Jun 2021 15:18:03 +0200
Message-Id: <171b182bff6227293bb0581b209b4f8b4d8d6362.1622898327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622898327.git.mchehab+huawei@kernel.org>
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The :doc:`foo` tag is auto-generated via automarkup.py.
So, use the filename at the sources, instead of :doc:`foo`.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/glossary.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
index cb165d7176b7..96a360edbf3b 100644
--- a/Documentation/userspace-api/media/glossary.rst
+++ b/Documentation/userspace-api/media/glossary.rst
@@ -116,7 +116,7 @@ Glossary
 	  - :term:`RC API`; and
 	  - :term:`V4L2 API`.
 
-	See :doc:`index`.
+	See Documentation/userspace-api/media/index.rst.
 
     MC API
 	**Media Controller API**
-- 
2.31.1

