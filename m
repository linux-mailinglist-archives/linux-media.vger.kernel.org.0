Return-Path: <linux-media+bounces-61998-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBThHXcTC2o5/wQAu9opvQ
	(envelope-from <linux-media+bounces-61998-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:26:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 020DC56D955
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A8A5301D96C
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C548481250;
	Mon, 18 May 2026 13:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzshHVzt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B2964AA4
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779110766; cv=none; b=lFyj0S0uLs4VVyrq6YlZA2uPzu6Cq+OsYY7Lue2JbyUHTD9GbEtfeVlSoxXiOwXUtRJ5y6AqMmC+4x2NdEntb/A/U2C0yDUaWLRM0vTynCsQqfVRcePdstGkf8eGLNB/Cu732SthjIR/KKMDUUCPwifwUbaNC5ZSbIY4u6KFR1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779110766; c=relaxed/simple;
	bh=aYYtkakSthLNbLE32vvN8SQxQ+0QZFQ+RUUJhPN+qlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UOkLj1NuaIhUTqiGq04PlUZ+sU8ii4nnmfkmB0bKWH725t54aLL91GOlY6WbsBygIesDnN7MAxS9BU4RtnQ+ptPcqFTphcu6aCJsVcvMxhl74E4R2JImepu9OqPxTIL4u+7KTZWtvp6PBfGruY21oYmPg+PEO0WwSrZqB8Y3shM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzshHVzt; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bdeed4f717so4319295ad.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779110765; x=1779715565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OgGqZu/lBvzHJtzf9xCysSkNq9jit1BxS4Kzrlj9Hvc=;
        b=mzshHVzty1MHn21iZbE9hfeT/Vpjcdv6b1n/hQGUosfQRZdWQqycT1G6rm/HK/OH9x
         q5Ik5j6fMCziZEOQhlKnsSL2jVeW9uIjGVuST1DxIJZyrd7HTktYKOZ4v8PP9++e6A1C
         9PG7lLq7kFhLptmoIUiZlsW9mVU0UWwHHFtcu2YuViKOTdoJWwUfXrvxpqiATEJpbSdL
         sPcaxYKpZs7/b6Lzp6Au7feh+pX8j5j0jfpCke5c00826csjmGtKQ2cwi044pzviZKJE
         6pesmO/piVkBHM2RLCEzfJvY2wOUrRkGAXApFCEFllTU+ykNfT0+Lx232TDZVEVEk2vG
         wVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779110765; x=1779715565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgGqZu/lBvzHJtzf9xCysSkNq9jit1BxS4Kzrlj9Hvc=;
        b=PJmUY0G2Y4FrdDsWs2x/01KZLXOLZgtvEJb23Emtt0iKjIBVDg3LUR3QoQxulv5d40
         ZXEI61lOZ96ZjdXbeUJD4xsK7LlyglJM2L4taE6+igunNjKepmR4QKO3oEsPyDWkS8QF
         tlZ7fVF9OpHOEsWIBb8tkbLKtIRutVnLE9vnx9Nwt7IAGhcXAP/gJ6X0cpPfRHzLldeZ
         MvIG0h0lb2APH14ZyRbpsbHX8z9L9k4szfFSJqjLPpOrrV6jiO5Pp7cix6ipO+dx/Sh0
         xUHMAPZ0NRQ2bG40GcO/v8tPOfGxaXUd/HgS3s8xFn8dgi9y7pk0xptJt2xFOsjDa3JW
         eoWw==
X-Forwarded-Encrypted: i=1; AFNElJ8q1n8j3u+PWITOjV3wDseVvECNGITj6lMLwAuumWy/fyORP1/vwA3exckduBj1+W75RGRhW+hxzwmbGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqdFPtS6NfDw6VsbCbCFIJTzYr4SHoa1loHo6ppYBfq4iUw4A5
	HR7/ymHHGeGeN+1IXhc8t8w/aG6gOezRZC7kPLr1niVjoF+NVignJW5I
X-Gm-Gg: Acq92OHS0o4r3G5RJABMqMf+16NcDTfnzM6yN23/xTYbaHaVtD0uF5H6GzgpRuhnuxz
	vFP1NFnK4hLasps0sBehPvtGJ5rPXXwpnGPiLMCA96pDSc/XNjOIOREIhE+wRJ+/VcWjVB/TBq3
	yE/EJuik3tDz7hwifsZTVxL/Zh6HbebfVIJqYNsoo4ltvGq/QA+ugepR03DZDEjahnybKT/RH7Q
	pExxGxyuqnun+l5aRCdG3aaoc+aj8oI5p7gveFr1MPztZShCBREeojtlhgtjj9vkR2S9JJkn58E
	+UmQjme3w7WOb43hBKb/NJbDSv+NYvV6thFyedEtLIghGG0IxpfcZq3r+EKQzxcbt/HDVuC4zVJ
	Ke6l494Z9+iOZUe95tg8rYRdgXPdYJrjoON+NEVlhLbfkhw6xshfzXd9Hf1NnLwjSpfA4krlxO7
	YywYVaZQ==
X-Received: by 2002:a17:903:3ba4:b0:2b2:4029:d781 with SMTP id d9443c01a7336-2bd7e8c6819mr166862835ad.20.1779110764953;
        Mon, 18 May 2026 06:26:04 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2cesm153402635ad.14.2026.05.18.06.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:26:04 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yannick Fertre <yannick.fertre@st.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: stm32: dcmi: avoid double free on video register failure
Date: Mon, 18 May 2026 21:23:44 +0800
Message-ID: <20260518132344.1008402-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 020DC56D955
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61998-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com,st.com,cisco.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

dcmi_probe() allocates a video_device with video_device_alloc() and
releases it from the err_device_release error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  dcmi_probe()
    -> err_device_release
       -> video_device_release(dcmi->vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free dcmi->vdev through vdev->release().
dcmi_probe() then releases dcmi->vdev exactly once from
err_device_release. Restore video_device_release() after successful
registration so the registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 37404f91ef8b ("[media] stm32-dcmi: STM32 DCMI camera interface driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 13762861b769..a6918fc618fb 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1990,7 +1990,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	dcmi->vdev->v4l2_dev = &dcmi->v4l2_dev;
 	dcmi->vdev->queue = &dcmi->queue;
 	strscpy(dcmi->vdev->name, KBUILD_MODNAME, sizeof(dcmi->vdev->name));
-	dcmi->vdev->release = video_device_release;
+	dcmi->vdev->release = video_device_release_empty;
 	dcmi->vdev->ioctl_ops = &dcmi_ioctl_ops;
 	dcmi->vdev->lock = &dcmi->lock;
 	dcmi->vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
@@ -2012,6 +2012,7 @@ static int dcmi_probe(struct platform_device *pdev)
 		dev_err(dcmi->dev, "Failed to register video device\n");
 		goto err_media_entity_cleanup;
 	}
+	dcmi->vdev->release = video_device_release;
 
 	dev_dbg(dcmi->dev, "Device registered as %s\n",
 		video_device_node_name(dcmi->vdev));
-- 
2.43.0


