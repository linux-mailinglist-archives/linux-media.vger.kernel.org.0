Return-Path: <linux-media+bounces-34826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E094ADA25F
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 17:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79E75188E1CC
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 15:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894C527BF6E;
	Sun, 15 Jun 2025 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b="edFlzizT"
X-Original-To: linux-media@vger.kernel.org
Received: from devloop.tasossah.com (devloop.tasossah.com [145.239.141.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E227A121
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 15:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.141.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001884; cv=none; b=thJp04KwGeeo7VxBaojYBADhrpTnFyRJX0PZeeJiZZsenx7uRIQkBbVyb5iVYh07/I6zETDOd+zCcp4ER5fvFk7vxZ0OubuOyGlaI9PApXDVnoxe6PCl0Y1XNKeKEq3mCp0ByHzzsa4N4+tguZIqM9S3SiVcKNe4qlR/I5ZCDD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001884; c=relaxed/simple;
	bh=MpbOXqQU5ZMOE6kKfhQvZ9JDIdfc5UNFq4lW8h+779E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJ2rFI5EKjFtSY69Ss0HYeY4b9jOf8iCX7dGCgeLYVARnj41Kuuf5rVHdhW6rSDU6Wl8dxLC9q9zrYdV9iHE2AfQPvsgGSuhKMTfyMVXyTAG0ZM96ZYF8mIys6ssVObkZC1XsGOOg/JphJ04ySYRgxqwSzRCtVzs0BoOOZ0muGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com; spf=pass smtp.mailfrom=tasossah.com; dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b=edFlzizT; arc=none smtp.client-ip=145.239.141.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tasossah.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tasossah.com; s=devloop; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7+dh4w10Y78hmGSr2LIQYisuwsfJz9AF3zHDDZOUkAo=; b=edFlzizTla0asN6z+yQ2WXXyTz
	oftFdUKE+E8XvWwj75uZ9L+JHS6XGqofFzHdR1j33vIjAw3dgw7Gl0xA5gyaahAX9CKaVGbdIBBmT
	VgaUCxmxFduNdXa+PspPdaL/PtpiX5KU8/2oI99nH1nI4tySOxbJ1EAzhEPx1xgbJKzermkdcPaai
	11nuwT8mGGE7q+kUre2IztZ5PHeutXh+QxlZ/3D7/eJ5q8ZFXpiSFaErDAYjacKxIPBjWsm8z8X03
	rjft6bdNgCOZSRnq7QQLBLemI+E8c4yLIwyzM2fxVVj4HxjRarhERJN5dm1I0dDheecct1bPviil3
	eXsuA6Na55/FGzjSH9cAJLxEIS6Ou5yi4lijOzU/E+S/dOIOuM8hFOPGzDzYeri3Ku/SPWda9e8uv
	u2x6/h/3vkc0AZQL0I/g4zxJv6FUT1hCtULliyHgAhJMR7Mi7GzqJZmd9s+CKogbfVgWumgS+ZQA3
	YwmsBJIDkMAN3SWjVAPqgccqCqGVHB2YFPV6ILUgIfhqtLtEzJXpig5h/mAy6oCK8sDeF3Lvo4bY1
	C8aFGQVQE2+f8EED5S6L32p7HNXsRKEGR/Nspi51tSpDPW/AugWNbHYy4U2G5rxpgL9ERggf/myKQ
	Gv3F1T6Z1fQM3MiVcks5SfDBNKvC0EWFlFLXmMK8o=;
Received: from [2a02:587:6a09:4a00:d0fc:27f9:c172:9792] (helo=localhost.localdomain)
	by devloop.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <tasos@tasossah.com>)
	id 1uQpQl-0000000HJaM-47IH;
	Sun, 15 Jun 2025 18:38:00 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: linux-media@vger.kernel.org
Cc: Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH tvtime 4/4] Fix out of bounds access in MMX scanline blit
Date: Sun, 15 Jun 2025 18:21:15 +0300
Message-ID: <20250615153751.1707298-5-tasos@tasossah.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250615153751.1707298-1-tasos@tasossah.com>
References: <20250615153751.1707298-1-tasos@tasossah.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are three loops in
quarter_blit_vertical_packed422_scanline_mmxext().

The first one processes the scanline in chunks of 16. The width is then
masked to process the remaining pixels in chunks of 4. It is then
masked again to process any remaining pixels.

The last mask is set incorrectly, which results in the last loop
running even if all pixels have been processed by the previous one.

Resolve it by setting the correct mask (divisor - 1) for the last loop.

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 src/speedy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/speedy.c b/src/speedy.c
index 2c85dc4..7883b86 100644
--- a/src/speedy.c
+++ b/src/speedy.c
@@ -1617,7 +1617,7 @@ static void quarter_blit_vertical_packed422_scanline_mmxext( uint8_t *output, ui
         one += 8;
         three += 8;
     }
-    width = width & 0x7;
+    width = width & 0x3;
 
     /* Handle last few pixels. */
     for( i = width * 2; i; --i ) {
-- 
2.43.0


