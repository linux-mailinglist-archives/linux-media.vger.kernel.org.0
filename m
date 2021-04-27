Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24DD036C365
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235408AbhD0K2X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:48142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235527AbhD0K2D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44087613E8;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=Dz4yuaAkE3G30hsowoZG+/b+CgXUAS8PpNDZLkNm+lU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kv/J9/steJcTqO8nJRpeW2trfh9u8CPl3/FlD9pDCYy3oFFq9TwdC/8UdC/b8tthy
         tO+6NQ5BQs2c2p14Rsug7nm4aWJZeToE8tNmu6Wle7Fk+AbX+ojI8lNpScGLESYoEV
         6fkVGMnRr7mQIaFUjEcAWR75isiOnfJXZjgxK85XJAYcgzogijs4PbuaiClzVxRLPy
         +CR6v63b97SiRCFxaxB4N8FvWPeBU20sggTlarzsyBN5VjuK+xMfWYoCzpmtFFcx49
         r5oXsNi6hA5RLOKB6RCcF1aLN6/njkl8wl97gcEwNtQCeJSjbAgEAxI/P1j8hKZVco
         WLoU977jpqt6w==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvu-000nzI-Sq; Tue, 27 Apr 2021 12:27:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 02/79] media: i2c: ccs-core: return the right error code at suspend
Date:   Tue, 27 Apr 2021 12:25:52 +0200
Message-Id: <e03d631b36c39299d13c42838836dac445628ef6.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
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

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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

