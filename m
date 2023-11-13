Return-Path: <linux-media+bounces-307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 369197EA69F
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 00:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3E92281956
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 23:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C083D969;
	Mon, 13 Nov 2023 23:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQsGB/JE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677603B78F;
	Mon, 13 Nov 2023 23:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DBBC433C7;
	Mon, 13 Nov 2023 23:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699916664;
	bh=PtRFUSAAq48UomziqLaEJ6jUBMz1qgN3VFvFSPG959c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LQsGB/JEWouZgDVrFnuKdeYzo1Gx2/PmNRF4qV41wqSwUXoEqKa04vRPz5u5b+oUu
	 Zu++Z4jlLOzlUdgIX7N5qLB+3pQkXQFoPp7H5EHYo28gGrETC2w8aBtxe5sxEwaZ4J
	 KZVYaGkKR4jn4kdmtJuwv9odSCaqn6pPlTX4HgAOBUV2C+jU6+gim+3q5PCkwBxW95
	 HcI/j1tBTF0XxkQ/V102K4T66l9GHs3Z76i1hcgVyAJVnR7LGM1gqsqOc59LF2AEco
	 jaUqkNsdOENTk140215smcZmxWt6Sz170Jl2RBeuPC8+7pMI9MW60qEKkd+ka9kxSE
	 A4oMO+B0B7w0Q==
Received: by mercury (Postfix, from userid 1000)
	id 30730106323F; Tue, 14 Nov 2023 00:04:22 +0100 (CET)
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
Subject: [PATCH v4 4/6] media: v4l: async: Fix duplicated list deletion
Date: Mon, 13 Nov 2023 23:57:23 +0100
Message-ID: <20231113230421.226808-5-sre@kernel.org>
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

The list deletion call dropped here is already called from the
helper function in the line before. Having a second list_del()
call results in either a warning (with CONFIG_DEBUG_LIST=y):

list_del corruption, c46c8198->next is LIST_POISON1 (00000100)

If CONFIG_DEBUG_LIST is disabled the operation results in a
kernel error due to NULL pointer dereference.

Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/media/v4l2-core/v4l2-async.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 091e8cf4114b..8cfd593d293d 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -880,7 +880,6 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 				  &asc->notifier->waiting_list);
 
 			v4l2_async_unbind_subdev_one(asc->notifier, asc);
-			list_del(&asc->asc_subdev_entry);
 		}
 	}
 
-- 
2.42.0


