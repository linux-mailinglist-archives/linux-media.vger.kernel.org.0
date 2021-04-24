Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25A29369F82
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237186AbhDXGsC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:35724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231836AbhDXGqY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4B0061938;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=SctF1EnznGEIIpIjxgpYNPSyfgvGAqEmSYB5mfWpmqw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=arwgI/cDLDju5CZsvLz/7iYTgKUDGxX9A+Kk8KAMtCPdRBDsaDwpqF+i50mMhZD5i
         QIyFlokd9FKVUQd2NoUp2O7O1HysEp4aHcLWnJ/yzKRRf1jywxKFfcBXiQE/1tlTgE
         rSqdu6+3CcLe3SNqlVyKKmKFMdvf9LCYlNQ+l9Vxs3gYFSPBinX/Dc2JLgT8fq70hm
         WioKYLsPMR4AA+9xb63r6TMIe7Epexj3Lu9aZcxKxLsR3gcLsNVZWUFfntipsTVZ/e
         KmDWrxUpldB372ZDyOmb45LEnlfX82lRSY1MSQqMR9tyqO35zucG5jLZohKuS5fQmS
         uIXfBg+LKtWWA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jgl-NU; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 63/78] media: camss-vfe: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:13 +0200
Message-Id: <925188c1bbe50a14b21bfcc8886e9419a55f9b62.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/qcom/camss/camss-vfe.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 15695fd466c4..cf743e61f798 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -584,9 +584,9 @@ static int vfe_get(struct vfe_device *vfe)
 		if (ret < 0)
 			goto error_pm_domain;
 
-		ret = pm_runtime_get_sync(vfe->camss->dev);
+		ret = pm_runtime_resume_and_get(vfe->camss->dev);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_domain_off;
 
 		ret = vfe_set_clock_rates(vfe);
 		if (ret < 0)
@@ -620,6 +620,7 @@ static int vfe_get(struct vfe_device *vfe)
 
 error_pm_runtime_get:
 	pm_runtime_put_sync(vfe->camss->dev);
+error_domain_off:
 	vfe->ops->pm_domain_off(vfe);
 
 error_pm_domain:
-- 
2.30.2

