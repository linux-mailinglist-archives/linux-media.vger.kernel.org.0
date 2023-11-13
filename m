Return-Path: <linux-media+bounces-309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF27EA6A7
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 00:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85BCC1C20963
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 23:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5153D99C;
	Mon, 13 Nov 2023 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbmSPI1T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF103D963;
	Mon, 13 Nov 2023 23:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2347CC433C9;
	Mon, 13 Nov 2023 23:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699916667;
	bh=zgSX9vFpMcVmLhIltMi1/nDB0fG5nWoN7nvBlrOL3Mk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LbmSPI1TV4hBxHa2KF+uRqVs2yo10cDmJCzCLje51pQnkTzElZIZM8haLdDzME93C
	 WWmwflRqfGZdXRNegu4QZw5f74WKJ6ac88cmJbRpQzKVg8NLlZmNB6OqpAEHxrCSrk
	 /jPZwH8aNDSq9xs9xofZslzy25Q961wqKxtSd88rxoJ2WShNV0Z2/wyyn29/dWmW7V
	 HbyuthL6pxPzN3JIuNewxKffGVTS6MeH2KLEWrOa2i0q0W5RSj06t46PJTj31Bh+iX
	 lrwnoY/DMM9lysA6HCODWewyL2pXO/FIv8opY44rmG5ow8+4gjaq1pvQoSfft+X+x9
	 UMpUFpFUXweJQ==
Received: by mercury (Postfix, from userid 1000)
	id 335341063240; Tue, 14 Nov 2023 00:04:22 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] media: v4l: async: Drop useless list move operation
Date: Mon, 13 Nov 2023 23:57:24 +0100
Message-ID: <20231113230421.226808-6-sre@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113230421.226808-1-sre@kernel.org>
References: <20231113230421.226808-1-sre@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_async_unbind_subdev_one(), which is called in the line
following the list_move() operation contains list_move_tail()
for the same entry and overrides anything list_move() did.
Thus it can be removed.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/media/v4l2-core/v4l2-async.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 8cfd593d293d..3ec323bd528b 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -876,9 +876,6 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 	if (sd->asc_list.next) {
 		list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
 					 asc_subdev_entry) {
-			list_move(&asc->asc_entry,
-				  &asc->notifier->waiting_list);
-
 			v4l2_async_unbind_subdev_one(asc->notifier, asc);
 		}
 	}
-- 
2.42.0


