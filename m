Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2FB4474ED
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 19:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236089AbhKGSWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 13:22:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235313AbhKGSWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Nov 2021 13:22:15 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ADD3C061570;
        Sun,  7 Nov 2021 10:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=fHQ3hLhnx2iC17GdxikYXzcGJvvgG2UhHz0QtgEdxAk=; b=IrgCsF8iKUsCVm+TUJOoAiPStv
        ARs/pc014nroI+TLFEvK0+DIJFtNpYBLYoqPOmCE+A2PZduuU+IGoKcOe1pNXyJ7qL3cu7JglaPuU
        UNpwNDw8sbB9KsBE/FIeKdYtgqoApYtFa3xLf0uEMioe0IO2sbIX3zX2dPlCqec0BVhk8+mYPqMxu
        GDyXiipoXVh95soZPW6mQmY2YB+H/JvuyfVag4jMx3eZrWXLzsWNwRi+qaTGcigC7/EnNrRZOTIgv
        VeqvLQrRBRKNYk2snXwbarhntDVz3oPOIOfX1oZMdYHOrVD+5G1jNxoPRGi7oVLd+iGZ6kJDhyJBv
        l7GMAeeA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=merlin.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mjmlN-008e92-SQ; Sun, 07 Nov 2021 18:19:30 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: correct MEDIA_TEST_SUPPORT help text
Date:   Sun,  7 Nov 2021 10:19:23 -0800
Message-Id: <20211107181923.17351-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix grammar/wording in the help text for MEDIA_TEST_SUPPORT.

Fixes: 4b32216adb01 ("media: split test drivers from platform directory")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 drivers/media/Kconfig |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- lnx-515.orig/drivers/media/Kconfig
+++ lnx-515/drivers/media/Kconfig
@@ -141,10 +141,10 @@ config MEDIA_TEST_SUPPORT
 	prompt "Test drivers" if MEDIA_SUPPORT_FILTER
 	default y if !MEDIA_SUPPORT_FILTER
 	help
-	  Those drivers should not be used on production Kernels, but
-	  can be useful on debug ones. It enables several dummy drivers
-	  that simulate a real hardware. Very useful to test userspace
-	  applications and to validate if the subsystem core is doesn't
+	  These drivers should not be used on production kernels, but
+	  can be useful on debug ones. This option enables several dummy drivers
+	  that simulate real hardware. Very useful to test userspace
+	  applications and to validate if the subsystem core doesn't
 	  have regressions.
 
 	  Say Y if you want to use some virtual test driver.
