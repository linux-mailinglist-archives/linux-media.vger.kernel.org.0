Return-Path: <linux-media+bounces-14722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC75A92AE6A
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 05:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7458DB20AA6
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 03:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C6543AD5;
	Tue,  9 Jul 2024 03:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEBslGGV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B108A47;
	Tue,  9 Jul 2024 03:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720494383; cv=none; b=OS1NRkkJUb9JAEjGA2DMHUafLiRsJO0izD7paMT22sBRdaIGUvsc3tIS0RbL8fFtuyrAuQdpRwR66LfPRyQMbK9zVkJJhehvFiijwhBTcm1EqLXvivMO9fKFDhiypV6M9/c8aTESwO007o8D6wWFSCAl93Kc5FKnnEh8YMeYltM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720494383; c=relaxed/simple;
	bh=d3srkMsg2KdxDzO3xlTrmynajVoZFXikx+M2zbMSD4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CEc1OeGG6DfENhtHDdtbBjRuRHOVFrbDzdneJkS0PLteGcgQQeSCw4CS/x+c/khuRas7zNlZaLJoNky8fVDj15kxsVOS6BsGrwITR1SMtDS07L6fOCXHmApS96swol8gtwnjVBXyxQ02YhUXwaGSybaUeLmeKoMVWuFSRlOlCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEBslGGV; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5c670e5469aso1035592eaf.1;
        Mon, 08 Jul 2024 20:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720494381; x=1721099181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Iooajm32+cbim4jJ3gpk2rpzqQgy6Cf493SBECgZQk=;
        b=lEBslGGVgaFXl7XA1sGVWdzo8zV/ttxTFcNhH9rB5BL0KLVB9VtDDHSIvy1R0W75lQ
         ueCOZWc1Idld8JzLSIrK2KM/o+oS7iUNW65rthH59j9ZQxwCUhXvy5Ecvngf6JXn0dqc
         BpQbLFycqXwddjWwrq7fZBs+cm5LVd9lIReLQLiZ0sAwDulwn3Gn7b36EpR4B/YDBfPK
         De1XvTxrr1jgqEA6SywwhJuDbr1iNB6b+vz6HszuuUFdz74fSmd6HD4uedcdYo+JRoHD
         TV+8ZmWiu7eV9drKwbKBoUTeS6JQUm7gm9Tt7tiPsGimjMHnvMmIqkzSZAsF3sW0aaZ+
         ugdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720494381; x=1721099181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Iooajm32+cbim4jJ3gpk2rpzqQgy6Cf493SBECgZQk=;
        b=ZRRmHrwsO0BTxwLBdt6KxiYhR2fcMAzDejrh9YPVH059qroDQl+DEmGK6wK8R4F0l7
         agkLHjfxN60qzw3nxRoQ+rph3xqVaveeX9pW/sI8WrkO7WzTd5etrldSMVeBZFcvVz6H
         LH0RDArCpPXhShyHRVzn6Gn9rQIuLz5Y9b6khuC+laj3UtHtoTYxS1ndgHd3qNf3QjAI
         WG3nuTW60izbIMz9q5Uevl4lxtdC9ZpoYwCs1feMRf4GfU3YiEKVNWSG5puxW5/6C0ko
         EbJKlj4cYXRgUoU7A0Cu7zXU5MnPmMfUTY1fueeeHjQN0vqVp+0xmaCe733IuoVlzCPz
         iTgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzKD38dVQfbBJZRZGlcfIzQr1jHHs+KLR0Jfyv2A0q0bXtXn+N/BDmPz9mGjXwePIxX8ySgkwaGxHJio/kR8nRMYOl6dEI6rWb5jDBmy9rrEK7iPQbk3m4DKEF8QAkcrgdko7IOU9hpENdHGBtv0hIC2n51fkDDLQ40nKToWuseGwYW7g=
X-Gm-Message-State: AOJu0YwjlOuLPd8e4xZb/olEpnNUlgkSn2RQCMDBmvHW1kTvzc/Bo/ST
	2uuwZ1fTLW5rPpJCVDstqb4MtY9hYa62UPRa4n38mzIwrFXI2p77
X-Google-Smtp-Source: AGHT+IEhHD+qwVHMhVIw9k8OzWe7UeTC/D40buUHZnfJUnXTtABu7BgCLngwzZXKIHWNK6QAsyWgyw==
X-Received: by 2002:a4a:b0ce:0:b0:5c6:6f69:7e7b with SMTP id 006d021491bc7-5c68e13ddefmr1381600eaf.3.1720494381220;
        Mon, 08 Jul 2024 20:06:21 -0700 (PDT)
Received: from shiv-machina.. (c-73-169-52-138.hsd1.co.comcast.net. [73.169.52.138])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c68cd9a919sm187717eaf.28.2024.07.08.20.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 20:06:20 -0700 (PDT)
From: Shivani Gupta <shivani07g@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: Shivani Gupta <shivani07g@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mathias.nyman@intel.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH] usb: xhci: Fix compiler warning in xhci.c
Date: Tue,  9 Jul 2024 03:06:04 +0000
Message-Id: <20240709030604.1347546-1-shivani07g@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following compiler warnings by changing the comment syntax
from "/**" to "/*" in the specified comments:

drivers/usb/host/xhci.c:1369: warning: Function parameter or struct member
'desc' not described in 'xhci_get_endpoint_index'

Signed-off-by: Shivani Gupta <shivani07g@gmail.com>
---
 drivers/usb/host/xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 37eb37b0affa..67168661aa52 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1355,7 +1355,7 @@ static void xhci_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
 		usb_hcd_unmap_urb_for_dma(hcd, urb);
 }
 
-/**
+/*
  * xhci_get_endpoint_index - Used for passing endpoint bitmasks between the core and
  * HCDs.  Find the index for an endpoint given its descriptor.  Use the return
  * value to right shift 1 for the bitmask.
-- 
2.34.1


