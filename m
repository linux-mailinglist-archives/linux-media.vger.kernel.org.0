Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02E4DBA4E2
	for <lists+linux-media@lfdr.de>; Sun, 22 Sep 2019 20:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407958AbfIVSwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Sep 2019 14:52:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:51798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407951AbfIVSwj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Sep 2019 14:52:39 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7B272190F;
        Sun, 22 Sep 2019 18:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569178358;
        bh=6Ktj9zXXi9b3bAjU5OSe3uz1uAckroEcPDIgl37r6dk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nRqTN3aa9ZdL3Bf0BSBuNaXRGdJktWG5ShIE0eo5Q+9uw3KCaOpceWLseGJ7SmwJ/
         D5MAxBDIlkRUWZhJhfRwDa1w+NjO9fZ6J2AWpKawPIWqaM/NvmcXEJYehYwkzlZ7sE
         AWVhIPwpK1RyIP0YehKDrJu+kDD5Sl7qad5aGZRU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Wenwen Wang <wenwen@cs.uga.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 113/185] media: saa7146: add cleanup in hexium_attach()
Date:   Sun, 22 Sep 2019 14:48:11 -0400
Message-Id: <20190922184924.32534-113-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922184924.32534-1-sashal@kernel.org>
References: <20190922184924.32534-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Wenwen Wang <wenwen@cs.uga.edu>

[ Upstream commit 42e64117d3b4a759013f77bbcf25ab6700e55de7 ]

If saa7146_register_device() fails, no cleanup is executed, leading to
memory/resource leaks. To fix this issue, perform necessary cleanup work
before returning the error.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/pci/saa7146/hexium_gemini.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/saa7146/hexium_gemini.c b/drivers/media/pci/saa7146/hexium_gemini.c
index dca20a3d98e25..f962269306707 100644
--- a/drivers/media/pci/saa7146/hexium_gemini.c
+++ b/drivers/media/pci/saa7146/hexium_gemini.c
@@ -292,6 +292,9 @@ static int hexium_attach(struct saa7146_dev *dev, struct saa7146_pci_extension_d
 	ret = saa7146_register_device(&hexium->video_dev, dev, "hexium gemini", VFL_TYPE_GRABBER);
 	if (ret < 0) {
 		pr_err("cannot register capture v4l2 device. skipping.\n");
+		saa7146_vv_release(dev);
+		i2c_del_adapter(&hexium->i2c_adapter);
+		kfree(hexium);
 		return ret;
 	}
 
-- 
2.20.1

