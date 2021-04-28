Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4558B36DA44
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240617AbhD1OzL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:36654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240390AbhD1Oxr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD41A6193D;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=EG1Xkz5icS6rCKpEKVZN/X2JADr2Ee/ss00sHCZahe0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oCHpn+fmwGV/kArmNSoUSn/jMNhaV6E/cELb1239AFp7tEHpXStLvOGkkClPlKqHs
         S7Qm6nNL7QYa6ulOnG4byCCfTYEem7BFawbiEPTRfzL7bx/AnCwg77yK0FW7b2ZG25
         OuBvkfQq1VMaaAzRwwV2KPZqEWGdoYalLtmAiKFIjXcFNilFv4IQA+gljSNBPDmclI
         Fp9MWk+QZqamavqShzSNyVX15Gt7jXrKM5+jwLX5Bb+QL7MSA1f13GVKKe1Dd3ziD/
         qufSXKj3aJNvEcWVz+MZc5fJCke6X8fF7Yrlott+4MqITcC6qdWAXSq0h3sPOIM/5W
         NTnDpyOaC0YSg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYP-001Dpf-JZ; Wed, 28 Apr 2021 16:52:41 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kamil Debski <kamil@wypas.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v4 02/79] media: s6p_cec: decrement usage count if disabled
Date:   Wed, 28 Apr 2021 16:51:23 +0200
Message-Id: <2c52c48533f6eafdb7b9c72ee2f02747e851a983.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's a bug at s5p_cec_adap_enable(): if called to
disable the device, it should call pm_runtime_put()
instead of pm_runtime_disable(), as the goal here is to
decrement the usage_count and not to disable PM runtime.

Reported-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Fixes: 1bcbf6f4b6b0 ("[media] cec: s5p-cec: Add s5p-cec driver")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/cec/platform/s5p/s5p_cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
index 2a3e7ffefe0a..3c7c4c3c798c 100644
--- a/drivers/media/cec/platform/s5p/s5p_cec.c
+++ b/drivers/media/cec/platform/s5p/s5p_cec.c
@@ -51,7 +51,7 @@ static int s5p_cec_adap_enable(struct cec_adapter *adap, bool enable)
 	} else {
 		s5p_cec_mask_tx_interrupts(cec);
 		s5p_cec_mask_rx_interrupts(cec);
-		pm_runtime_disable(cec->dev);
+		pm_runtime_put(cec->dev);
 	}
 
 	return 0;
-- 
2.30.2

