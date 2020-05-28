Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966B61E6229
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 15:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390309AbgE1N0s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 09:26:48 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47464 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390283AbgE1N0o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 09:26:44 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04SDQcqv044454;
        Thu, 28 May 2020 08:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590672398;
        bh=L/yiPOBagfz8wPQbjlNHBugPa8Jb7cZfiONvNDsbqvw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=lqmne1OSKRg6NIJqjVCMYfJeGQ0X3EsOKHXCNbwGFECDRpqq19I56h8jBP9FtG+1O
         ybHUAzbBroa1AK6ShTMQH4zzppZYmHjz82J33Fa62U46JPhVFe0JMG0m8ZeaBjxQ2S
         EE2LzBu2HUWkz1jnZDx4l9QpX1qLREc8vVlC2cPY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04SDQbHg071464
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 28 May 2020 08:26:38 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 May 2020 08:26:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 May 2020 08:26:37 -0500
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04SDQWxS130696;
        Thu, 28 May 2020 08:26:37 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 1/2] media: v4l2-rect.h: add enclosed rectangle helper
Date:   Thu, 28 May 2020 08:26:04 -0500
Message-ID: <20200528132605.18339-2-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200528132605.18339-1-bparrot@ti.com>
References: <20200528132605.18339-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a helper function to check if one rectangle is enclosed inside
another.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 include/media/v4l2-rect.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/media/v4l2-rect.h b/include/media/v4l2-rect.h
index 8800a640c224..bd587d0c0dc3 100644
--- a/include/media/v4l2-rect.h
+++ b/include/media/v4l2-rect.h
@@ -184,4 +184,24 @@ static inline bool v4l2_rect_overlap(const struct v4l2_rect *r1,
 	return true;
 }
 
+/**
+ * v4l2_rect_enclosed() - is r1 enclosed in r2?
+ * @r1: rectangle.
+ * @r2: rectangle.
+ *
+ * Returns true if @r1 is enclosed in @r2.
+ */
+static inline bool v4l2_rect_enclosed(struct v4l2_rect *r1,
+				      struct v4l2_rect *r2)
+{
+	if (r1->left < r2->left || r1->top < r2->top)
+		return false;
+	if (r1->left + r1->width > r2->left + r2->width)
+		return false;
+	if (r1->top + r1->height > r2->top + r2->height)
+		return false;
+
+	return true;
+}
+
 #endif
-- 
2.17.1

