Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653413737CE
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbhEEJnV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:48262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232136AbhEEJnQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA5EE613ED;
        Wed,  5 May 2021 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207738;
        bh=G+D62uYOeO3E6zIZOyRsLhX8wVEnwPFM5avER7onHgI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cGJFjveEllVyJRu+S+l9xNWE7UxP6WPat24ylQV7DVcJff2jOVkZaFQgX07UOdk2t
         tjfv6Nj36v+5JyX1KZlkgGiyq7wIocHJW8grZt+xZm2+8pyXj5WVtkzPP0xHdzHk+u
         CjgREtYNjvYZCXhCGJZ1n6Rgpslh05hAm0FFQxcp9BtwzpaH7o36raQM3vSw1YYCyf
         R6d5cJ5d5fXVZBrU5Ghq9Jz+nc9X+UNMPG79Ilj++jV5wIZc/nd9vkojWLTidm2Z4b
         GmXeFXCMMYbhqyQ1jyckcYCFcRYaztk9kV9kPQlo/AxpK25qcW5BeMAyiCCKBYdWym
         isb6YRYcS7NYA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2q-00AHw3-Ph; Wed, 05 May 2021 11:42:16 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 05/25] media: i2c: ccs-core: return the right error code at suspend
Date:   Wed,  5 May 2021 11:41:55 +0200
Message-Id: <92cb0f741d16d9eaa9f99f336d826f30ac7a2671.1620207353.git.mchehab+huawei@kernel.org>
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

If pm_runtime resume logic fails, return the error code
provided by it, instead of -EAGAIN, as, depending on what
caused it to fail, it may not be something that would be
recovered.

Fixes: cbba45d43631 ("[media] smiapp: Use runtime PM")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/ccs/ccs-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 9dc3f45da3dc..b05f409014b2 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3093,7 +3093,7 @@ static int __maybe_unused ccs_suspend(struct device *dev)
 	if (rval < 0) {
 		pm_runtime_put_noidle(dev);
 
-		return -EAGAIN;
+		return rval;
 	}
 
 	if (sensor->streaming)
-- 
2.30.2

