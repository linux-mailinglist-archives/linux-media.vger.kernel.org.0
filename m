Return-Path: <linux-media+bounces-6296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C59EC86F5CF
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 16:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8103428528F
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 15:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3014B67C47;
	Sun,  3 Mar 2024 15:27:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C60167A1F
	for <linux-media@vger.kernel.org>; Sun,  3 Mar 2024 15:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709479631; cv=none; b=rOFDI+gtJaCIWJKOCfg357ylUcUMGiZTkciue1u8mBQU4lClzUCwgNAKBl4+zfmqz3sLr+es0WwrhJtvSgWDdfZSv996vEsqc9aDEYY4zOqKfBdmb6NcokSmWEqu7qLUzDwLkGRt1uflwZSGp9ml9rlMqNFtkc2TfnagEvcUDPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709479631; c=relaxed/simple;
	bh=ZZy95dNQ5uPEjxgHUb5ZLDQ20oDossCvsAgZvcsny7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3bWVJ4YgAw2xnv1PYsEmEBesaRYPjGnA+ZCcg+8WsQBRvor/usgWBW0kjOUljGflnoiBYCD1TKfVTehwSGgsThFLf++vcfb9WxUITMKRD50qqzfTrqGBcdwylQ8k8T0NtKNxP0x22mZUGLEMFjvr7gVNPaHHrHeo61XDYBkMLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from localhost.rmail.be (unknown [10.238.9.208])
	by mail.rmail.be (Postfix) with ESMTP id 228BF4C078;
	Sun,  3 Mar 2024 16:27:07 +0100 (CET)
From: Maarten Vanraes <maarten@rmail.be>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.org>,
	Maarten Vanraes <maarten@rmail.be>
Subject: [RFC PATCH 01/13] staging: mmal-vchiq: Avoid use of bool in structures
Date: Sun,  3 Mar 2024 16:09:56 +0100
Message-ID: <20240303152635.2762696-2-maarten@rmail.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240303152635.2762696-1-maarten@rmail.be>
References: <20240303152635.2762696-1-maarten@rmail.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Fixes up a checkpatch error "Avoid using bool structure members
because of possible alignment issues".

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Maarten Vanraes <maarten@rmail.be>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 890669f874d9..2e616604943d 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1983,7 +1983,7 @@ int vchiq_mmal_component_enable(struct vchiq_mmal_instance *instance,
 
 	ret = enable_component(instance, component);
 	if (ret == 0)
-		component->enabled = true;
+		component->enabled = 1;
 
 	mutex_unlock(&instance->vchiq_mutex);
 
-- 
2.41.0


