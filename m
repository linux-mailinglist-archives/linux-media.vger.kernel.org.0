Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1963A9A5C
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbhFPMat (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:30:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:49238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231812AbhFPMaq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:30:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89F22613B9;
        Wed, 16 Jun 2021 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623846520;
        bh=CSld2s/3tHC+Jh6gkwfRLXdviGut2t9E50vJJvDQ1A4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dYGXaBhaFZk2fxz4aSbTx5GpCXeLb7MdS6tVsUZZexzYIFVrVlsMaNKZQIHDNGtrW
         oeHkiYmliklw8HBxUwxu21lnz38Y6U6tQKMAjZzo8R6N4w/5r7/7RotuGLkZNr/bWS
         EE+8qZu2B/0f+gNO4FTlNuZO4l9YSTDNPn4azOvSMPjlq/MRVk7/4Rl8wulyiYRQ11
         pVrcYDl04PvTDPUzoHmBdNibWU9weVAE8t73wHlC+icegaueEgOJ1gdqFpkIncHE0o
         ZL4CgnHoXDaNRDC2iG/zLbAvTVrjFhjV1QXWJ7HFyKJaZHSrIBH2AfPQMyFRYoCJZe
         IDK7zL+SX48KA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltUes-004oib-AH; Wed, 16 Jun 2021 14:28:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Yong Deng <yong.deng@magewell.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: [PATCH 04/11] media: sun6i-csi: add a missing return code
Date:   Wed, 16 Jun 2021 14:28:30 +0200
Message-Id: <525bad50008338d96fb71e724675061ffa07ff87.1623846327.git.mchehab+huawei@kernel.org>
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

As pointed by smatch, there's a missing return code:

	drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c:485 sun6i_video_open() warn: missing error code 'ret'

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index 3181d0781b61..07b2161392d2 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -481,8 +481,10 @@ static int sun6i_video_open(struct file *file)
 		goto fh_release;
 
 	/* check if already powered */
-	if (!v4l2_fh_is_singular_file(file))
+	if (!v4l2_fh_is_singular_file(file)) {
+		ret = -EBUSY;
 		goto unlock;
+	}
 
 	ret = sun6i_csi_set_power(video->csi, true);
 	if (ret < 0)
-- 
2.31.1

