Return-Path: <linux-media+bounces-829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D8E7F492C
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E9A281566
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 14:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48914E621;
	Wed, 22 Nov 2023 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="spfS8koB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6257112;
	Wed, 22 Nov 2023 06:42:53 -0800 (PST)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79BB66EF;
	Wed, 22 Nov 2023 15:42:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700664139;
	bh=wDApJOipWXJ+xO5p79TRPJampy6N0curdFUvhOlG9C8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=spfS8koB6mCbx7EhQk1ISAX2p3QSybUi0pbr19778oBsJflJ0yThy5u5r5t71CLZQ
	 jEoucs1JkhRIbFdu3ilEeFBOLfaQKl4kSvtxdS9OHr0UIfA5g85pk+oPu+3aLkV6Mi
	 IdwjQOMOFsNsAswnIfMz7SvJ9PN4f4djMHyIMcfY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 22 Nov 2023 16:42:23 +0200
Subject: [PATCH 2/2] media: rkisp1: Fix memory leaks in
 rkisp1_isp_unregister()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-rkisp-fixes-v1-2-1958af371e39@ideasonboard.com>
References: <20231122-rkisp-fixes-v1-0-1958af371e39@ideasonboard.com>
In-Reply-To: <20231122-rkisp-fixes-v1-0-1958af371e39@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=818;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=wDApJOipWXJ+xO5p79TRPJampy6N0curdFUvhOlG9C8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlXhNmgT8hYQq0m2LhNw8VE3d0LARdJLpZ7YXOc
 3uaZhEN2WmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZV4TZgAKCRD6PaqMvJYe
 9WGNEACKacCv9FjzmAG3l2lCX0fir2y+MhLqtxC1Jsnj7YopQk4rTwfSQzZXg9PEfiy2f4fSflN
 28bMxNG9sr34UIWHOBeyNAxD2Xb8AN3cuok6AIj991pdsMcA88h8nWxb72fnXGu3AzAyx/HtTOz
 r5qdofYP2p4eu2JfBNVAOaVaiUw6xIbO2c52fm2GFjGjSEhgQtLBGBNiyrMlBlLlcGwSVnDUJpx
 ajoy3/UItSDX+EJYmf15AxlDNIjuki7C/WgkczFq/keNxOyOBZ1O+PC5tf3Ku8FiIw15sK7VxiC
 jm5YurJpFkCawaNvDTtAbnjbw3HEQp40cuj/gSfw/fuA6SwtVJKYbTmHEluebdyheBmzwuR+tZf
 lwbZQNLpmhVuSU1JoLsu18A6TD47IiCmwx0UPhOlaMWmL7L2XS6iknsBGqg2aYbXzb/fmMqzm3x
 Q1wRCbiLENJS+sJs3jc07Tahuvvo1dvAMUpqChhx4ffxljxXuIlqq+ki7ANcf6BfA2b3hs7ahaw
 35p1vtea7ygv0vwaPGPRt65L8EIagUeZVJuL4o6r3DKhL+ll0FPZb32rjn6J9onvNmcuVFfD5dj
 RMIO+y/lGcJFpQVnsHFoJuxq1dBSQCITMzxc0ACIGuWMrPpWIIwgNppHEtOXb+MLiSgv/tqOg3d
 BRwiyZMnnVf5m8A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add missing call to v4l2_subdev_cleanup() to fix memory leak.

Fixes: 2cce0a369dbd ("media: rkisp1: isp: Use V4L2 subdev active state")
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


