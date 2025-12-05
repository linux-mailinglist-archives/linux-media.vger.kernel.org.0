Return-Path: <linux-media+bounces-48330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 015C3CA7AF3
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 14:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D57F13140B7A
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 13:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D691325492;
	Fri,  5 Dec 2025 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4b7ZAN+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A27032C327
	for <linux-media@vger.kernel.org>; Fri,  5 Dec 2025 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764939972; cv=none; b=G+RZpiA9R76BhVPaIJ95fvs27mJdLFF8Pa9ckg54lnYnQK16WW0M8Q8wTSfcQeZPcNMfO4RWGY5o1BjDP0uJomQJwmFTFRoq6lTF5yp4T/N1ljg81hjRw/oEPoj7A+xLw0byq4GcsK22WaRPQ6tX9U/mxqr6Q7sLw0AjTOS39XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764939972; c=relaxed/simple;
	bh=pkiLUcd5lMA2ghEDaPhmFGvnSCD9uXVXplAFWew63L4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dTpfZIKBdNW+1k43923S77OhwyjkglQ/8zagdEQ1HreDMnU4FZQsYKCqhRD5hmEC2A0tv1wgGjSHPhiV+Tw6iKHWz6VfRPNgJsr8Yygu1tvzqZOkeND/Evyz5iw/diu3KQGh9jhoQho0Jeg7pRImymJjiPOqz+rTMeEMdMvbvEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4b7ZAN+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42f762198cbso1381828f8f.3
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 05:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764939967; x=1765544767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFWFQJyqNEArb97bML7scQOt1LXkeAlqXlQJNt06ohg=;
        b=P4b7ZAN+2PGx/w7w0Vp+FPCrTbV6ff7FlCJ+bIonLMZ/qjWH5Z70AeAO2NMRaWWEcF
         jPU+PprsLVIR90FzNyFXEUcBWpxfkWkgaqLHvDG0OpL731IxHxl0WHy1KA43jHTuZc/q
         b7N0uuvi5qyLOOJUim7GQIcOdDJGtzpfjuR0F5QYHx2gFvV0uWebfRWfmfBltfhxdCGK
         xP+UeRfcRlR99GOoiDF/hsu5gWy9Nek76mDIAlRc+CD8W+Uj6iqehQyC4P/aICZEBBsQ
         iiFi2/OZYT6KnoE2pfHKGpYd8VcBZNqikPhXvbC/AYhv99wrCQc3dpJYdIOe3tAA5p30
         7p/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764939967; x=1765544767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFWFQJyqNEArb97bML7scQOt1LXkeAlqXlQJNt06ohg=;
        b=Rbj4HHgruC8WlQIV6rdfsEuq/y1LTIt9rJJz7DWMCXXMI7LUBuqoch6A+NaxZVyKA+
         cSw2QtP2KDFwlQkDF2TRvaCuVsxS+9O6nu8EnFEAdJ2brxEBtVcsH3Knpfi/+mHrMHLS
         gqXBaTxtJTHN4DvwQgp+6rbxaV3L/HCselG7nSpQpnNBHLJ7JHqnhF02qkMlZDILijQ1
         m8JdHWcbi/H0lgDJ4g/UU6C5rUlaU+uvxou+ttKpNqzXCa90EacoLzRNFerT+gGd5PPG
         fgrX51m5iQXC08YNIouNDVMi/puooIZ50ilHKGsekiXG5ar+Ch0aGsZIsjenHnDRQ1fa
         Evjg==
X-Forwarded-Encrypted: i=1; AJvYcCWqkrrVlgCeE0Q9dbbcWPpERA1Xu73tnODQPwXSmk9iTSEi06sj9C/p7iLjrmD3uyAZZAhVe6OuW4ex9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx88vONIVBosJ9l7zFmUb3A6LSAOLCcG923T1VmJRggKiQ1lNQ1
	o4cRO4lJM/oX0nPBrlVsiCxq+V/olUx4DEhg7T8fvRPhq+tjQ8fNpMwM6O5sg/ra
X-Gm-Gg: ASbGncsktWuDUSErc6JxW/8hdFmPv3DCrjy4e8VRUttQWTcdhdcYRHCGc5vncAECAw/
	LEoXmfEk1hEdVzvrajvg0V9GrdcdwoypKaE5KcJDt9qhtDmPSpAGWUvd4THy6wWsxzKeRzaCHRQ
	2WS81kKNf7Yd8vvc0691AMy1Qj1TeaouVc5XV3wFwOLjKX7zGH4Qw/UEY8wrrP1tTlIkT75ncx/
	6AHlFAawA1VObyErfI5QonIyRaknkV29C4b/myVyr1kiRMuBsHRxvH24XNj5UIML19FrOBixZEC
	6zDjx8orIYHGz+fh0NQqGXPVFAoGw4aRoiA85ilwGNF5Z9KOW2AZHKXax6ryLBax+pBnxFvAM+i
	gxvd4xH6ELJ/qnDhB2oC9P0iVK9ORH0yY5QQxTs2ORHQHUKUTtFjs6RRd1zgwouqAep+aljIhdn
	4+RDRN6w2G0g2aDYKbIqI+mT5ECsfkIoewCKg=
X-Google-Smtp-Source: AGHT+IGfxlBIT32x6zSESU365lwi7/s5pKbkYUArsltfwJzJNeozJNoe1Bd0XdZLIEre56SlNK+6Tw==
X-Received: by 2002:a05:6000:60f:b0:42b:38b1:e32e with SMTP id ffacd0b85a97d-42f79852017mr6685668f8f.46.1764939966620;
        Fri, 05 Dec 2025 05:06:06 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15a5:6d00:a241:8e44:3926:5306])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f8bsm8914491f8f.43.2025.12.05.05.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 05:06:06 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: matthew.auld@intel.com,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	simona.vetter@ffwll.ch,
	michael.j.ruhl@intel.com
Subject: [PATCH 2/2] dma-buf: enable DMABUF_DEBUG by default on DEBUG kernels
Date: Fri,  5 Dec 2025 14:06:04 +0100
Message-ID: <20251205130604.1582-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205130604.1582-1-christian.koenig@amd.com>
References: <20251205130604.1582-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The overhead of enforcing the DMA-buf rules for importers is now so low
that it save to enable it by default on DEBUG kernels.

This will hopefully result in fixing more issues in importers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index b46eb8a552d7..fdd823e446cc 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -55,7 +55,7 @@ config DMABUF_MOVE_NOTIFY
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
-	default y if DMA_API_DEBUG
+	default y if DEBUG
 	help
 	  This option enables additional checks for DMA-BUF importers and
 	  exporters. Specifically it validates that importers do not peek at the
-- 
2.43.0


