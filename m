Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D683A9A64
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbhFPMay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:30:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:49302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232620AbhFPMaq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:30:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A353613CB;
        Wed, 16 Jun 2021 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623846520;
        bh=nBySG9GXlvUgri5A+5P6So4wWVqRbxFEOGnkkfBp9EU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CCcXMRBVhARM2ANw/W7/WRNnQtye4EnwW+IasEd+/pfCkOUxjPJZsgL4oi1KXmoJc
         7VIoxryt4qcIWfa8AIAn8BS1xxYNsIKtHUntksfBrVkC53hi8p5TkdDa6agEH4h2PB
         sm7iR/TywQYIvfUFT6ISKgluK81W+wwNVZghEFLzF1GabvIsSn40HftwT1VvCY/UE6
         QGZbo+sfOkwsq9s97EJVxkO8Tos+xD6F73y3+lZkG5Qq8TCP02Kth6gSIF90P7cjbL
         66daJgmUr/eRo4g5WQ7mP+CW+cirUOclKBlRFj3AazGhHng/OFL0n/7CSwPq+XdyFB
         5yczfHRUtSsSg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltUes-004oin-DV; Wed, 16 Jun 2021 14:28:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Stuardo Diaz <nicolasstuardodiaz@gmail.com>,
        Sean Young <sean@mess.org>, Ye Bin <yebin10@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 07/11] media: siano: fix device register error path
Date:   Wed, 16 Jun 2021 14:28:33 +0200
Message-Id: <73a7f08bb84ce2bd27045822fb66ad1f9c372dde.1623846327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623846327.git.mchehab+huawei@kernel.org>
References: <cover.1623846327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As reported by smatch:
	drivers/media/common/siano/smsdvb-main.c:1231 smsdvb_hotplug() warn: '&client->entry' not removed from list

If an error occur at the end of the registration logic, it won't
drop the device from the list.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/common/siano/smsdvb-main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
index b8a163a47d09..f80caaa333da 100644
--- a/drivers/media/common/siano/smsdvb-main.c
+++ b/drivers/media/common/siano/smsdvb-main.c
@@ -1212,6 +1212,10 @@ static int smsdvb_hotplug(struct smscore_device_t *coredev,
 	return 0;
 
 media_graph_error:
+	mutex_lock(&g_smsdvb_clientslock);
+	list_del(&client->entry);
+	mutex_unlock(&g_smsdvb_clientslock);
+
 	smsdvb_debugfs_release(client);
 
 client_error:
-- 
2.31.1

