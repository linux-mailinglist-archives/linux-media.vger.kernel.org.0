Return-Path: <linux-media+bounces-15353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E63093CEDE
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 09:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 521931F226CC
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 07:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F241F17625B;
	Fri, 26 Jul 2024 07:31:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B69F175568;
	Fri, 26 Jul 2024 07:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721979117; cv=none; b=r6Fn1OyD0JN1ALmLq3i4o9ADLjja3b9EL55VTu3d5HBhMRY+9B6VR/03/jV0QqqgF/hphA6PijCRDrky0jImqi804tEyQBEsrwHEvQ58flBSP5PLe4fXOba+1Nc6pmBA0Q1B7iXApjPyn5qVBzZHAhoqFLOVLbBpl4sumAaeuR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721979117; c=relaxed/simple;
	bh=wizgaX8bVKCtAjlagtQiA7uk0rd5sy0wKoNtzjoYfTc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ENLzNlOuXB5/mshSXdSh5fTZuplnHWG0UdMsrYLhXWqzJTYJKl8mKyNscu1+Ug34RpT+U0IZc35Z5gjOS0jkm59VLB8rKSprQTXsYVakTCR+lVRSI0Es+XjSa99EVNqVpDHk1dNYt9J8lG1aUHdZMweL/KB3xdaXTXpYumt0vvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowABnTTjUUKNmns0gAQ--.65077S2;
	Fri, 26 Jul 2024 15:31:33 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] staging: media: omap4iss: add check for media_pad_remote_pad_first
Date: Fri, 26 Jul 2024 15:28:14 +0800
Message-Id: <20240726072814.3534601-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABnTTjUUKNmns0gAQ--.65077S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr4DJF4xZr13Xr47uw4kWFg_yoWDJrb_Ga
	navF4fWryktFykGw4Yqa47Zry5ZayqvrZYqanYqa9xAay3uF15JrWv9r13X397J3s2vFy7
	Awn5Gr98Kw1UJjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUtVW8ZwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUljgxUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Add check for the return value of media_pad_remote_pad_first() and
return the error if it fails in order to avoid NULL pointer dereference.

Fixes: b2e44430b634 ("media: mc-entity: Rename media_entity_remote_pad() to media_pad_remote_pad_first()")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/staging/media/omap4iss/iss_csi2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/omap4iss/iss_csi2.c b/drivers/staging/media/omap4iss/iss_csi2.c
index 0e6c5bd81930..43851bbd0cc3 100644
--- a/drivers/staging/media/omap4iss/iss_csi2.c
+++ b/drivers/staging/media/omap4iss/iss_csi2.c
@@ -539,6 +539,9 @@ static int csi2_configure(struct iss_csi2_device *csi2)
 		return -EBUSY;
 
 	pad = media_pad_remote_pad_first(&csi2->pads[CSI2_PAD_SINK]);
+	if (!pad)
+		return -EPIPE;
+
 	sensor = media_entity_to_v4l2_subdev(pad->entity);
 	pdata = sensor->host_priv;
 
-- 
2.25.1


