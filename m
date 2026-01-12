Return-Path: <linux-media+bounces-50385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 52714D10AA7
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 06:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 934D130208EC
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 05:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B873530F946;
	Mon, 12 Jan 2026 05:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HtvoYrOq"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15D022D78A;
	Mon, 12 Jan 2026 05:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768197588; cv=none; b=B9eehJhOGsJBS4vq+QPB/ST/qAO8ul0FX9pRfuiJ6ol06b7H1Yz0Bye3AsrKev0AftJvmyzHSObRZjeZiD9EoKXSg/lr759GU9FqsrwJihttE532Vn/MEBMltXATmbOdlNioNWeN4wzsqLLns27sgRgHUb9IHkFT+fu6z3eBV7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768197588; c=relaxed/simple;
	bh=5RIurkaK8dS85D/jjNvFNPzCjhIJov3iHP7sMQTTBJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ifP1QePZyYheGsekzoRTv2EcAB6AnHdRq088KZ0WJGLAaOXOfZi/h6WcuaEr8e7p8Ze6ZC9WAt+sdWDIrSsbu94bTUeER95nNGFHTQjkfI7gbpgovP+naRL/yzZO87kuj3XoFQXJqO0VAr1514h6nh4M82hbuLfqZU3IYNqk0Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HtvoYrOq; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=oH
	HaD4r3o5dEo8jo5v+j8eqWhGhcYStQHqww1Eiz2NI=; b=HtvoYrOqAzmtqOTgls
	ltv/YR3FIAUuQGL8cZ3Ih6g+Co6/+31smUNvu990zT5Zk/4pRHcjNINutlXz1af0
	6Hqdn6YHuMTZf2u0j03ufSCy7dhvTFIE1rZW6bzqAdHohFd3C+SiStmu5DW6IQo5
	AS42ugEhY1/KdoXvGAiYqxQ04=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAH8dm8jWRpUh11Kw--.25S2;
	Mon, 12 Jan 2026 13:59:26 +0800 (CST)
From: "jempty.liang" <imntjempty@163.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"jempty.liang" <imntjempty@163.com>
Subject: [PATCH] media: vivid: Simplify fb_vblank init in fb_blank
Date: Mon, 12 Jan 2026 05:59:21 +0000
Message-Id: <20260112055921.118009-1-imntjempty@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAH8dm8jWRpUh11Kw--.25S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr15Wry8ur1xXF4xuF4kWFg_yoWDurb_uw
	1vqr1I9F15Zr1Fqr1DAr4xZF9agFWDuws7ZFWqqrWrZryDCF1rA34jvr17W3WUWa1FgFy3
	GFn8JF1Syr4xGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRt-eO7UUUUU==
X-CM-SenderInfo: hlpq3yxhps35i6rwjhhfrp/xtbC+B4GB2lkjb750gAA3y

Adjust struct fb_vblank declaration scope and use aggregate init
instead of memset for cleaner FBIOGET_VBLANK handling.

Signed-off-by: jempty.liang <imntjempty@163.com>
---
 drivers/media/test-drivers/vivid/vivid-osd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-osd.c b/drivers/media/test-drivers/vivid/vivid-osd.c
index 91ad9b314f2e..566f870b56a6 100644
--- a/drivers/media/test-drivers/vivid/vivid-osd.c
+++ b/drivers/media/test-drivers/vivid/vivid-osd.c
@@ -73,12 +73,10 @@ void vivid_fb_clear(struct vivid_dev *dev)
 static int vivid_fb_ioctl(struct fb_info *info, unsigned cmd, unsigned long arg)
 {
 	struct vivid_dev *dev = (struct vivid_dev *)info->par;
+	struct fb_vblank vblank = {};
 
 	switch (cmd) {
 	case FBIOGET_VBLANK: {
-		struct fb_vblank vblank;
-
-		memset(&vblank, 0, sizeof(vblank));
 		vblank.flags = FB_VBLANK_HAVE_COUNT | FB_VBLANK_HAVE_VCOUNT |
 			FB_VBLANK_HAVE_VSYNC;
 		vblank.count = 0;
-- 
2.25.1


