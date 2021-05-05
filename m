Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B608E3737C7
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbhEEJnS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:48284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232160AbhEEJnQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDA71613EC;
        Wed,  5 May 2021 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207738;
        bh=EG1Xkz5icS6rCKpEKVZN/X2JADr2Ee/ss00sHCZahe0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NCJ17ww5difLY2RZykFODFD3vD68DbAG+YfiIBCcZvlK8erqQD8mJQrDXZHXxOpbu
         QOhrHl4QnNKgRnJljipxYLtGoES9n/kGUi1ZwMmmgZn5EPhr0rtCe7Oq7HjQgOpPQW
         o4REwkYpeCvtJ0HW58KM7G9dHDAoHWhN+gDELxc3wcNW8QWBMj8TGXjI9SkpBSf9TI
         KZxjQZkiLAEL/diYAuBAayXmnxFrkraTwyN7EhWd8CyzXVff2ZgYPxRE9Y6zKt37z/
         TFXAlKWup2YHP8W+ljUo1OSeHbkB8hFVn2nCUo/FMmtnlkxBVpkPG2JwPfuVyFEf3i
         sJCZMjLbKzfcg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2q-00AHw0-OX; Wed, 05 May 2021 11:42:16 +0200
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
Subject: [PATCH 04/25] media: s5p_cec: decrement usage count if disabled
Date:   Wed,  5 May 2021 11:41:54 +0200
Message-Id: <a1c4c8a65061897f66ef119ddfd8ae858eec8a6d.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
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

