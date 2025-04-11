Return-Path: <linux-media+bounces-30063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D99E4A865B3
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 20:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3576C8C16BF
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 18:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B9226988E;
	Fri, 11 Apr 2025 18:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDC+XyPP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B60A25C701;
	Fri, 11 Apr 2025 18:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744397041; cv=none; b=M23I6A39Gb8sFQaD+IYwmyNr6z/mjxiA7TqUgTdos8Q1CI0SAzcL2pSdtbRaWNR2w/Pt8CzHJKSrtB3poRxn+B04f4x4kTOnnfxknJ3WHlSkpvlqRBozd8Fh7BxZngrDKRbU8laG5AVWPd5VQQZUuXy8pfBszTT7A3NJ2sDo/G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744397041; c=relaxed/simple;
	bh=kgjQf8y2fsDl2cERY7ssFICfIIUab9DmorfjOz0mMFU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Th8kBhPhOVvVg1qfW2s2vfyd+YcHaWcFMI1AExY6ST6JgUjv2V0pIPpflu8zzsgrSdoFE4340RLmDJZ8LvhAkUPPVtieuYLkIYO2cmbgpjT+GJoodUULAbpbiB53SAWZ03m1trwPhq0TSly0Lo3jtbC66ew+Ou8d3ME6F6gRhko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDC+XyPP; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47745b4b9aaso3411771cf.0;
        Fri, 11 Apr 2025 11:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744397039; x=1745001839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1c24mcR0MAwfqOuLCNg8Xa5hRklPPeSKrwMB8oTX5TU=;
        b=EDC+XyPPd0I6KBG7Io13N2g6EzWKUYueq6iitrD3JjAYny5U0c55+e7TnDPqtaQV30
         nulEvTqIkXaAwnMqWM4VVaeoNZ8ygr60CUzQ720yj1T5NcCiK6NkYPS1VofhbBCL8W2e
         w2FwmNS/RmbscO0B/JQG5AgxpbWzvW4PJ0LJtrmKvSAXoreEplr3DuMPLCP49PzVfZGa
         iel2khGVzbZ65YEWcghvbyGeK1KextK5aDZl8AqXnGFriWQxoOfsLNhG/4x4gClSgS8U
         aAMacU8Qwmxde/ckDwLYdbjqOWdYfiMQ/DRCOpAA1wX0eJNlKm3XM48hk2hU/We4GlFk
         H78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744397039; x=1745001839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1c24mcR0MAwfqOuLCNg8Xa5hRklPPeSKrwMB8oTX5TU=;
        b=Dbq3YQTmxTeC9hnMFWFEOuDieCvTijg1w5ZrpxkX2WHgcDCK3H511TZLixCK3pFBv6
         TwsQdWelViHJYdzUjt3y5xUuzmXR69wNisRmCCK9HZ1p2vZ47F097UBPaFD05SdtzTz0
         DZNAD5vAGEidbAPUlNZDPvTzlsyNrV7yTcbXPZwOYfH9pZ6Cs56dM/Eint2zOUcUb8mU
         ngqpfa/LZyYo6+U5T5LbtFd7ia6vIrVLW9t3h+aspo9s1ziIdOXrccKiWeZjF3RtXi4N
         R5eAJfXX5NTXU5ywgt3W1fq3dJZxiWayPOp8NfjWNebUIA4NUi76ml75TLYFxGCrO6Ix
         9rJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWGxGFRLxV8pcOid9ZVVsX+oOhuGLWYG/3gTYU57Ce5hUGmrtPftJ63vHkrKNCZWBMLGUfa3pk5dm4jAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi4Z+Y/UScACR3QnIr7PsKtxzmu15QzMFpRdIJ3EnoPCWf0Uhg
	PuG+gl83clEvafjpbwPTUujlGST4fR1xCkdDEYBwY9wMua3kJ48=
X-Gm-Gg: ASbGncvyt1ZCpkwEB+uj9v28n+I1inAvU9ouoU3zp27g38q98bkOML0X1/yFOmt7FjV
	rCJLyYrPIJmK86/VFZEqENzI+E4OrLmRepotPmJGss/Ja1TJJmRYiksSr8oSytI3OgAgmtTGGed
	0ZVTcOWIIvwyCDJGSRIsiQXj+bkl92TXFvzcwrZ3NSXaF90doJb61waeyCnR8qFd7aOQWot4LUY
	W2bpKKdyWs/GXrW80pRaBcUl1rfgOJh63iuRC8UQH7sAIxQ0IBsKUyQjpx/HS7T/B4kSH7I6ccI
	7+y/8dp8y9pFo+ZBdSB67JFVoT14Dq8yMxuQtg==
X-Google-Smtp-Source: AGHT+IGPUK4zfeGuDOgD1NGrDnKZjAKRI77hZ4iYyuQD2YfMk+TeQwf0Iu68iT8mUX/jQh+V4j947g==
X-Received: by 2002:a05:622a:60a:b0:471:f437:2973 with SMTP id d75a77b69052e-479775dcd09mr16869491cf.14.1744397039144;
        Fri, 11 Apr 2025 11:43:59 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0dd06sm297820885a.95.2025.04.11.11.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:43:58 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: ming.qian@nxp.com,
	eagle.zhou@nxp.com,
	mchehab@kernel.org,
	shijie.qin@nxp.com,
	hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] media: amphion: fix potential NULL deref in vpu_core_parse_dt()
Date: Fri, 11 Apr 2025 13:43:56 -0500
Message-Id: <20250411184356.2910366-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The result of memremap() may be NULL on failure, leading to a null
dereference in the subsequent memset(). Add explicit checks after
each memremap() call: if the firmware region fails to map, return
immediately; if the RPC region fails, unmap the firmware window before
returning.

This is similar to the commit 966d47e1f27c
("efi: fix potential NULL deref in efi_mem_reserve_persistent").

This is found by our static analysis tool KNighter.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
---
 drivers/media/platform/amphion/vpu_core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index 8df85c14ab3f..26568987586d 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -586,7 +586,18 @@ static int vpu_core_parse_dt(struct vpu_core *core, struct device_node *np)
 	}
 
 	core->fw.virt = memremap(core->fw.phys, core->fw.length, MEMREMAP_WC);
+	if (!core->fw.virt) {
+		dev_err(core->dev, "failed to remap fw region\n");
+		of_node_put(node);
+		return -ENOMEM;
+	}
 	core->rpc.virt = memremap(core->rpc.phys, core->rpc.length, MEMREMAP_WC);
+	if (!core->rpc.virt) {
+		dev_err(core->dev, "failed to remap rpc region\n");
+		memunmap(core->fw.virt);
+		of_node_put(node);
+		return -ENOMEM;
+	}
 	memset(core->rpc.virt, 0, core->rpc.length);
 
 	ret = vpu_iface_check_memory_region(core, core->rpc.phys, core->rpc.length);
-- 
2.34.1


