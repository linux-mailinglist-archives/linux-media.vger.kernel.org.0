Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2A645CCD9
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350968AbhKXTQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:52486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350943AbhKXTQg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 794086101D;
        Wed, 24 Nov 2021 19:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781206;
        bh=oPubh2d4lwP9fKqCb4pNVElTBqmEvoM1817FlD5uu1Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=irJXrhhLIwRivfMQeCc7aAfVVCkb24cDUxA9Hj7NFCWbBnwunN9z3ASNrj9E6n3a9
         X13bRzxKuNGdJeN7+B7dSq3DNLtYHwgjFNz8HiUPJWE6+Vqu+/OCXS620D7fYXQpi3
         Wzv5FwxWn9gWdWVwY2YRH3giOK8umhhYXwDitIKdzXadq50/x6Y9Uz3C4ys7Netvsu
         ywPsOXmHr8ADYP6RvCMEB59d8IbAYgyjcfqdfizXZ2hhwvK6QdSjcHpfm2ccG6t3U3
         JQX0k6I2i0Lw9Y9JKJB5+Bg5ycfqi2+7iD+QskU1dCEbHvIoobjt3hk098W3DI+e15
         ffIjQ8sodAA1A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q5C-Gm; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 04/20] media: drxd: drop offset var from DownloadMicrocode()
Date:   Wed, 24 Nov 2021 20:13:07 +0100
Message-Id: <f4d081b88635e114d69cda30526fa04927be89d2.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The offset is not needed, and it is never used, as the pointer
itself is already incremented.

So, drop it, in order to solve a W=1 clang warning.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/dvb-frontends/drxd_hard.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxd_hard.c b/drivers/media/dvb-frontends/drxd_hard.c
index a7eb81df88c2..9860cae65f1c 100644
--- a/drivers/media/dvb-frontends/drxd_hard.c
+++ b/drivers/media/dvb-frontends/drxd_hard.c
@@ -914,44 +914,36 @@ static int DownloadMicrocode(struct drxd_state *state,
 	u32 Address;
 	u16 nBlocks;
 	u16 BlockSize;
-	u32 offset = 0;
 	int i, status = 0;
 
 	pSrc = (u8 *) pMCImage;
 	/* We're not using Flags */
 	/* Flags = (pSrc[0] << 8) | pSrc[1]; */
 	pSrc += sizeof(u16);
-	offset += sizeof(u16);
 	nBlocks = (pSrc[0] << 8) | pSrc[1];
 	pSrc += sizeof(u16);
-	offset += sizeof(u16);
 
 	for (i = 0; i < nBlocks; i++) {
 		Address = (pSrc[0] << 24) | (pSrc[1] << 16) |
 		    (pSrc[2] << 8) | pSrc[3];
 		pSrc += sizeof(u32);
-		offset += sizeof(u32);
 
 		BlockSize = ((pSrc[0] << 8) | pSrc[1]) * sizeof(u16);
 		pSrc += sizeof(u16);
-		offset += sizeof(u16);
 
 		/* We're not using Flags */
 		/* u16 Flags = (pSrc[0] << 8) | pSrc[1]; */
 		pSrc += sizeof(u16);
-		offset += sizeof(u16);
 
 		/* We're not using BlockCRC */
 		/* u16 BlockCRC = (pSrc[0] << 8) | pSrc[1]; */
 		pSrc += sizeof(u16);
-		offset += sizeof(u16);
 
 		status = WriteBlock(state, Address, BlockSize,
 				    pSrc, DRX_I2C_CLEARCRC);
 		if (status < 0)
 			break;
 		pSrc += BlockSize;
-		offset += BlockSize;
 	}
 
 	return status;
-- 
2.33.1

