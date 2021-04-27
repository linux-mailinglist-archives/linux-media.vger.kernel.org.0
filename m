Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E2336C2D9
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235410AbhD0KQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:34660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235745AbhD0KPJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:15:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E67F61948;
        Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518433;
        bh=4l0wYnfzYi1h956EsgOdlzJmS/W0qfvo5eSm9fSkn9o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dTj5/2g+IuretA4WWeKDmoFHFHBjS15TGHAABgAT6vT1tjWvN2eyDuu49l3Gwt2da
         TOXSj3AYurMZUu47PRrPLR35UWjYK1oTF2OQDM0SVSYM+x/rcSfkQUw/n+2AfIlvJU
         sCDCyJRycpNzbyQygvFVMBA1eNdadXIBsGULVeG/GTQzugoKvlBwSoKD+dE4938M9e
         qu9YoMveKc1YY7XA2veI4VIhBc7zsPnRTgp6zqZshJN77GRIa3/Tn4TlwACTv9yljW
         bZGUqzbVtPGxv4fSb7BDDauM28XU+hupk7UJ6AmARKC7KIgEvXMxMmo6sLbaYu3QeI
         NhNi5KFGegjVA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj1-000j7v-R6; Tue, 27 Apr 2021 12:13:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 69/79] media: rcar-fcp: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:36 +0200
Message-Id: <64bb917e946815f1c77bf2bb36614ff950a98631.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/rcar-fcp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index 5c03318ae07b..de76af58013c 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -101,11 +101,9 @@ int rcar_fcp_enable(struct rcar_fcp_device *fcp)
 	if (!fcp)
 		return 0;
 
-	ret = pm_runtime_get_sync(fcp->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(fcp->dev);
+	ret = pm_runtime_resume_and_get(fcp->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.30.2

