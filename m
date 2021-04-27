Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF5036C3B2
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238446AbhD0K3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:48140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235743AbhD0K20 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1E1B61445;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=ilbYi39Wp/s1IHEjQb8NZRh7PLiRnT42XXdFX8lFSpw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E1V4ib0zbZH+kCUd5H/K3zfdYxnn6eIkc1o8FSQsvNaEok8VvLUUH3V9QiLL7DUEQ
         dN9W7MRaY2i3s+ixNN13NayXIcIBJcsrxVQQRqyUc36hl2fIR0pxBuN0XmkLsXUnCE
         R2Z1r0hX+Tfy1uGelCFiFXxgFeQFrYyf2NuxURXOX37gzThSFqOlSJdoazXrYdstXu
         6CCdBuM2PC1AIti1Hg/1pJXrtHFtG3etjGFzlHWSamm/J3Z7yrWfdgCytXqIxDc31k
         zeDVLsgxC4qnAUxhELuCUJU6AAt9nCNSo4MS1RQT1jxHOCWBioubSk9uZC0BbweNuV
         Gc3epVSD6SYYQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvw-000o0W-Cu; Tue, 27 Apr 2021 12:27:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 27/79] staging: media: vi: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:17 +0200
Message-Id: <4ee32d7287e0839f23f18e8b9bf1829328411a67.1619519080.git.mchehab+huawei@kernel.org>
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/tegra-video/vi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7a09061cda57..1298740a9c6c 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -297,10 +297,9 @@ static int tegra_channel_start_streaming(struct vb2_queue *vq, u32 count)
 	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
 	int ret;
 
-	ret = pm_runtime_get_sync(chan->vi->dev);
+	ret = pm_runtime_resume_and_get(chan->vi->dev);
 	if (ret < 0) {
 		dev_err(chan->vi->dev, "failed to get runtime PM: %d\n", ret);
-		pm_runtime_put_noidle(chan->vi->dev);
 		return ret;
 	}
 
-- 
2.30.2

