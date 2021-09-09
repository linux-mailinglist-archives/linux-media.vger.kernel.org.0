Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7690404E94
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 14:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242269AbhIIMMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 08:12:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:48310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345252AbhIIMHF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Sep 2021 08:07:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C47D261994;
        Thu,  9 Sep 2021 11:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631188057;
        bh=vJf/hOLRbSjBB5md0JjqiGgNpfTuhUqJ4jPhXj65f/0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sj5CLv192c2vSJG3G2pk5+OG2KMjpZvWbpo1S7P+T7w3J+Hyrk6ykuJfuZYRtKPBm
         1SZXsF3T8EofG7RCGGxLE66VP7Brv/uJO5z+rPc7AWMS0AQdZP8pN5B+UuzaL+xPiq
         ydX+mWxQjdlh6I7O6J+uSFmja8sV9MSdVhqh5iQbUhFx4cb3yj+ly52spewCrg4bMj
         LndA8TfL5hC/rB4FUGhkBAD/iyuQtQh4ucEBvYJlRGJU0OpqAYZp0xos8IbdA2JaZZ
         d5HKkEpDdw9NOL0pqZcapYlm41HnER5ddT5r/YvTV71aPkP8zmCu9p8FWeDRDrFndb
         YrJcb7QcxzBUw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yang Yingliang <yangyingliang@huawei.com>,
        Hulk Robot <hulkci@huawei.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.13 048/219] media: atomisp: pci: fix error return code in atomisp_pci_probe()
Date:   Thu,  9 Sep 2021 07:43:44 -0400
Message-Id: <20210909114635.143983-48-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114635.143983-1-sashal@kernel.org>
References: <20210909114635.143983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yang Yingliang <yangyingliang@huawei.com>

[ Upstream commit d14e272958bdfdc40dcafb827d24ba6fdafa9d52 ]

If init_atomisp_wdts() fails, atomisp_pci_probe() need return
error code.

Link: https://lore.kernel.org/linux-media/20210617072329.1233662-1-yangyingliang@huawei.com
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 02f774ed80c8..fa1bd99cd6f1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1763,7 +1763,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	if (err < 0)
 		goto register_entities_fail;
 	/* init atomisp wdts */
-	if (init_atomisp_wdts(isp) != 0)
+	err = init_atomisp_wdts(isp);
+	if (err != 0)
 		goto wdt_work_queue_fail;
 
 	/* save the iunit context only once after all the values are init'ed. */
-- 
2.30.2

