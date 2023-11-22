Return-Path: <linux-media+bounces-827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFB87F4927
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BACD1281713
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 14:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DE64E609;
	Wed, 22 Nov 2023 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gvxTVU+J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDAEB1AC;
	Wed, 22 Nov 2023 06:42:50 -0800 (PST)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0579929A;
	Wed, 22 Nov 2023 15:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700664137;
	bh=Q1F0LY9V1uh3EhSCWJsd/th8ziEnKGSJDEVMKi83lT0=;
	h=From:Subject:Date:To:Cc:From;
	b=gvxTVU+JDNsoybOx5RQzECQarcc7Hp5qvNLOPHn7tudo37KR43SqZT+WqnvbHgXc9
	 QWYcKkYO1nh+MfFJIJzs1DBQj8EcH9+oS8aY7pXLNXEPgjq3QpvxXlZuGt7gN2sO4b
	 19WKPYB0Dz4jNbAQm9CzcTcO2ISKr8zt8pnL9yGY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/2] media: rkisp1: Fix memory leaks
Date: Wed, 22 Nov 2023 16:42:21 +0200
Message-Id: <20231122-rkisp-fixes-v1-0-1958af371e39@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE0TXmUC/x3LQQqAIBBA0avIrBNyQqKuEi1ExxoCEwciEO+et
 Hx8fgWhwiSwqgqFHha+U4cZFPjTpYM0h27AESdjEHW5WLKO/JJoj/NivYvBWYR+5EJ/6MO2t/Y
 Bn3o7/10AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=587;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Q1F0LY9V1uh3EhSCWJsd/th8ziEnKGSJDEVMKi83lT0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlXhNi6mGmzFhiwH8XScOyZRSpdoZWu7l19VDPm
 +NTh/PUYw6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZV4TYgAKCRD6PaqMvJYe
 9TJlEACtzRXltazs9OpEwit3KlmQqsXxumZIs9MDHWKt1ZVCffsxlBDMisG0iIfdcN5UATuJZls
 1QdO2nYLHp8hCbXwzQGYeEo2TZGmbPc7xNM+RfINEHCgBdRF2tOB1sA2DyvqdNqaywW7RmNrxoA
 sCw/IsPGQQ5OfiJoPVV/E6Ch6EfokJayyoWtDt9/9iv1fr+4rEmoc/cwiwPjcZWnc6y043sI092
 29EvdmvEDq6UXKTtj72N8cCTmMFN24DIj0AO8bcUGzsUjfkGRgKvvs7YV2d/15GlJiaIqMLBNLX
 P46dOH1xLXFm6anWeUE1cNGoNzs7hrXyOfAWoGL5rfPkgWKSetxCPt2TrsRY76rW7vB3ISlsJdr
 PxLrP4NjFVPEJkKBDHoVPsgv06Fn3Gro7CCfzRk4t3oCoIbkJhkCHzeZHiteWbx5h6wCA0B5blF
 td0bIFXGhnSVtztPYLQrQdWF94jCKJzIV3N/XoRnQpzYsLWBwL7qaVOkG3AbbpKDfzK63FjRyYr
 PhYCnrhhVb8Xa1wYPpm0AEiXjKozx6gR+n0xJOTiSJEIHPOrBOGFIFcTF34hAwDt/CSzyNOPuHP
 y3yIE5JCEJMrKITlqJLbROl+nv8VqY2y8EBxWDAB5nHoULrED1TzmUg13abKHqv1Cqce5wHhdNd
 7oq1wifnplUL3uw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Fix two memory leaks in rkisp1 driver.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (2):
      media: rkisp1: Fix media device memory leak
      media: rkisp1: Fix memory leaks in rkisp1_isp_unregister()

 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 1 +
 2 files changed, 4 insertions(+)
---
base-commit: 1865913dd590ca6d5e3207b15099a1210dd62f29
change-id: 20231122-rkisp-fixes-c2795cafda52

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


