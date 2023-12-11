Return-Path: <linux-media+bounces-2094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D1180CA69
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 14:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51D431F2164F
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 13:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1693D98F;
	Mon, 11 Dec 2023 13:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BmxCJ8mZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35445127;
	Mon, 11 Dec 2023 05:00:25 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3716922;
	Mon, 11 Dec 2023 13:59:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702299580;
	bh=zV/RIEdgSrvIS1kxne2Y4K//Y+viiimnpU5CN163GOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BmxCJ8mZlLxROcoDIpc4daiKA/1PPC02aFqo2RmKA50OPJLZ6M38kdGTYyfuHzpUk
	 P0wdmSUmWyoQs2dMaUnW5p1ADX6qEXt6qvEaMDeOTCM2ILzXFWYv6SNW8XxH28hRdQ
	 rRik7C39Q39KKZv3GqdG3Phd2IBKTueS+rLbe6EQ=
From: Umang Jain <umang.jain@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: "Paul J . Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 6/7] media: i2c: imx335: Fix hblank min/max values
Date: Mon, 11 Dec 2023 18:29:48 +0530
Message-ID: <20231211125950.108092-7-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211125950.108092-1-umang.jain@ideasonboard.com>
References: <20231211125950.108092-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

The V4L2_CID_HBLANK control is marked as readonly and can only be a
single value.

Set the minimum and maximum value to match the mode value.

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index a924b7222ca3..f353647a0d4e 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1043,8 +1043,8 @@ static int imx335_init_controls(struct imx335 *imx335)
 	imx335->hblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
 						&imx335_ctrl_ops,
 						V4L2_CID_HBLANK,
-						IMX335_REG_MIN,
-						IMX335_REG_MAX,
+						mode->hblank,
+						mode->hblank,
 						1, mode->hblank);
 	if (imx335->hblank_ctrl)
 		imx335->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-- 
2.41.0


