Return-Path: <linux-media+bounces-850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD35A7F4B96
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 16:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E604B20CFC
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668D556B94;
	Wed, 22 Nov 2023 15:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hwzEUySD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23310D42;
	Wed, 22 Nov 2023 07:50:33 -0800 (PST)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C84F2641;
	Wed, 22 Nov 2023 16:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700668199;
	bh=GWSvmigvhbqxxKwsO8s1wxYTODF1EHzXekCVLlbZGxI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hwzEUySDhdg7+rV4lAQv1SLbaMq4f5LP3XGp0v8sHnCVXjnUyl0SO7+KttWy3qd2V
	 ONCgstHK1hey+zQcUHwkd7jQB80umbQ68bN4Z1oIfOBPCFBF3Fb1GgBwHFHmMTjTby
	 0u85d2oWQM5WqA6W6rSwkwJa2jMvx9VPIjAT6N+I=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 22 Nov 2023 17:50:08 +0200
Subject: [PATCH v2 2/2] media: rkisp1: Fix memory leaks in
 rkisp1_isp_unregister()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-rkisp-fixes-v2-2-78bfb63cdcf8@ideasonboard.com>
References: <20231122-rkisp-fixes-v2-0-78bfb63cdcf8@ideasonboard.com>
In-Reply-To: <20231122-rkisp-fixes-v2-0-78bfb63cdcf8@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Jacob Chen <jacob2.chen@rock-chips.com>, 
 Yichong Zhong <zyc@rock-chips.com>, Shunqian Zheng <zhengsq@rock-chips.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Eddie Cai <eddie.cai.linux@gmail.com>, 
 Allon Huang <allon.huang@rock-chips.com>, 
 Jeffy Chen <jeffy.chen@rock-chips.com>, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=940;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=GWSvmigvhbqxxKwsO8s1wxYTODF1EHzXekCVLlbZGxI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlXiNCOLg/ZNZkH5JNt4+lP3cqdiX2JgWJ0yFPo
 ckl7sgXzkyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZV4jQgAKCRD6PaqMvJYe
 9fWRD/9StEmHs8CUsFrm3u/UhmQD6eVyKBwAImdgigY4oTPn41xWao/S59SXpr3e88F9bXGxcMZ
 6rnSXhmN7BDKXLKnWttYjjKhkYpLSaxegHh55Z4xtfr3u0wXzdWcC3NEH6HS94P48DjKHuHzzBU
 Gr04pONVTSW+ns9cdVhJynYL2qzL4V2BFb7hQYKS1rAazEYhCVoUaC1EfEs0xm6wt5nk2HQGlP0
 tIpbqw+/2Jld19VUWran31Omv5uB+Z0RjRLRodX4vu0505piKnTt78v4Kly6xUU73WgIlh7YCp+
 9rknI0dcamE4ZCdv+dlCjENspgLNgfP1/09L2urGYQTcd6ggOttdO2Qg0KBfzcDTbrBVp64qQMn
 qFF6wovam1VktcLAFtH9crxOKWo+ZP8OU53xXj9IqpVQDO0mKZ5kYhKBzjU6t6tzXu2Z2d5uWgk
 TuSwTAfKKFRgjBn23rCbc3xzX53yKDURqxeNH6ZbTmA54ulm0vAlKwKb8uXgk1axttXuXaNMkoe
 Qp0vaz6pijRptgcMSEjMpeKY0xgjMsz8cCWG377otml93uq9BKemmP0IAZMNLb5d4KBs40Vz725
 y81xyOlm4aUtZfRvZvRNkx8Y22HHL2YhtupQjAel9hxFF1W3kcuGso4wuqky0GaAz9Qqf0zHZEj
 5JAOoWZlF2PmAFw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add missing call to v4l2_subdev_cleanup() to fix memory leak.

Fixes: 2cce0a369dbd ("media: rkisp1: isp: Use V4L2 subdev active state")
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 88ca8b2283b7..45d1ab96fc6e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -933,6 +933,7 @@ void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
 		return;
 
 	v4l2_device_unregister_subdev(&isp->sd);
+	v4l2_subdev_cleanup(&isp->sd);
 	media_entity_cleanup(&isp->sd.entity);
 }
 

-- 
2.34.1


