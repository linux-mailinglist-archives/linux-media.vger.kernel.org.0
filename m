Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5E8369F7B
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237371AbhDXGrs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:36096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233677AbhDXGqU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 710AC6162F;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=caAPk+MCL8dn2GoVy6dPupvi3+StYvHdRWjGpSc7psI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O5lG2fTrSUv+Klvp/Y/ju1Ap7wYlUlfzX426Y10b3zlY+91Yl/C/1Gh4RpdvJDHxp
         gOscYp9c5RCFxGJdYI+Bg25WLO+s7QT+V/ncbyGqzCPoep2Dy7vpG7I4veqsrBW/y9
         058m/SwQt+gcuQyossGkAWLZCH1Exi9JGMlI0ScjPdqK66C8xJfqgZ/unqjbTq/7A3
         g+B/q8c9RLGWMXpQ5F4mHt2+fKYWhVFfwWEj1xE3H3waPI9TO9HetyAKClMkJH4Ft8
         giroIscp+nBeEUHWDaJ7uyAkvrhivWr62h0na6wY/HPgRGiL1wVKWf2fjko4l74uT5
         Zo23ozxOFtgig==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jgf-LY; Sat, 24 Apr 2021 08:45:32 +0200
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
Subject: [PATCH 61/78] media: camss-csiphy: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:11 +0200
Message-Id: <134315407c8289ee207f2ffd554d0bd4ee70793d.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/qcom/camss/camss-csiphy.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index b3c3bf19e522..8e18b8e668cf 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -197,11 +197,9 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 	if (on) {
 		int ret;
 
-		ret = pm_runtime_get_sync(dev);
-		if (ret < 0) {
-			pm_runtime_put_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = csiphy_set_clock_rates(csiphy);
 		if (ret < 0) {
-- 
2.30.2

