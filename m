Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2108F17FF37
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbgCJNnS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:43:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:37466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726595AbgCJNnR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:17 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E02E24684;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=dOWAitZcubJe6ZPphISgOg4R6FHQ0Ow7oKb4Q8yZYxg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hYv5OBlnmv1aEA+/6M1fIhAbDCr0otUGY2bk6nzhqBqJS1PsRFF+GeU089oxWwLP5
         URd6NnvayfPQm0fhE1hv2ZqLZDRakC3YYylSrjddCKwBXa1SPHFJ+XYqA8vovvemCM
         Hy0+/4mKU0hcr+yB7Npc8XNJsaxYtInQv8A0MIx8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAA-0005vM-Vr; Tue, 10 Mar 2020 14:43:14 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org
Subject: [PATCH v2 02/22] media: docs: move soc-camera.rst to staging
Date:   Tue, 10 Mar 2020 14:42:53 +0100
Message-Id: <17c44871c0153af5a065faaeec0f3184b850db81.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the entire soc_camera driver is on staging to be removed
soon, let's place there its documentation too.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/media/v4l-drivers/index.rst                        | 1 -
 .../staging/media/soc_camera}/soc-camera.rst                     | 0
 2 files changed, 1 deletion(-)
 rename {Documentation/media/v4l-drivers => drivers/staging/media/soc_camera}/soc-camera.rst (100%)

diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index b41fea23fe5d..eca22b82de94 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -61,7 +61,6 @@ For more details see the file COPYING in the source distribution of Linux.
 	si470x
 	si4713
 	si476x
-	soc-camera
 	uvcvideo
 	vimc
 	vivid
diff --git a/Documentation/media/v4l-drivers/soc-camera.rst b/drivers/staging/media/soc_camera/soc-camera.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/soc-camera.rst
rename to drivers/staging/media/soc_camera/soc-camera.rst
-- 
2.24.1

