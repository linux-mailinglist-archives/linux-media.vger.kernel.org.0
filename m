Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6D0369F66
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237552AbhDXGrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:36128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233206AbhDXGqP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 736B2616EB;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=zSIZIJdKOUAGnyfSOuoxDI+Bj1QIKcCsJeDd9evgSr0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B62keZdvIxZEHCpDtpikVj6zVPW6jo6BxVQp9FjXZD7T6E/ex7SmLEELIGv/dq3cl
         2OWKfTLZZPA56M6K5E91XC3sdEtWxfo1FxGkCZKMlh+hgVP3vUuEH3VgCO7i2R1kJX
         KRTzOLvAj7Vl7Dat7wNwntP3zE6O1mXhZbWtBfFw5jR5d73ivRALa0Dte8tDso+C1L
         7RJD+5aopP9t6aOjqIogpempFpiebJwjYsCEtlGw9YpoN4NH0chrtch3EmXCEwHziv
         2KrtFLlj3SjWxuaCI8n49vhfbIHkvsy56LKRXKiLZ5RcGPEsE+D0Z9R6gwmINXlb7g
         PsNyJoJbKsOKQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jgc-Ke; Sat, 24 Apr 2021 08:45:32 +0200
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
Subject: [PATCH 60/78] media: camss-csid: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:10 +0200
Message-Id: <080d8d9e0ff6c82cacf3bf728c7bc0f658b43ce6.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/qcom/camss/camss-csid.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index cc11fbfdae13..d2a7f2a64f26 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -156,11 +156,9 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	int ret;
 
 	if (on) {
-		ret = pm_runtime_get_sync(dev);
-		if (ret < 0) {
-			pm_runtime_put_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = regulator_enable(csid->vdda);
 		if (ret < 0) {
-- 
2.30.2

