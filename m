Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D5F304CD3
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 23:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731022AbhAZW42 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:56:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728776AbhAZWZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 17:25:16 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E79C061756
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 14:24:36 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id q6so47692ooo.8
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 14:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1ikuMteTikjN+nS/9X2TtyJ7Ju5HqPFdonWETOx56iY=;
        b=p/6msXi3a5Exjr8WuwIzY8yBKmBDvl+nAaaNli7XqXRNfGki8wjsYWW/2vwjDKzswi
         slnGt23L6ZXVKy20UUrt9nPvsx+1HOL1gJSR6ywK3QtuDBsJO08FNLLR8FrnDPcwjLgw
         osxXmOo3rRFS4MmcsRzeEYetMgitG/IkFZO6EAtp2kZx5y8KER2ggS0YmkpuUa2g5T7Q
         otAzBjPd/NcqWw84Qnh6Pn8y4VKEZeRy4ZCm55/D+QLb8S+7cYgglXaoQA9qDQhk8/wk
         TqNkZBPoLbD3VDIxzC2r7oeXPZq1S3FByyQiWl5AzU2OR3zKkzIKuovVOk2tLPpJwONJ
         hYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ikuMteTikjN+nS/9X2TtyJ7Ju5HqPFdonWETOx56iY=;
        b=beEsO+IGyQOu/4mUjNFivVCM/zDj5Eat2lr0/6bLVAmwnaJWdYeJwYpvBzH0WU8omz
         NBDvQ2bEAy2ePGmL82UDpLUMXBNyX0EdL6VZFce6+sETMgelua40s95nTXzpQlEpgu08
         Q+aZVbC3RTRc6rFcRJ5v3kmiAzxhgLIuaTmL5hDYHRPgvA7pua4PJwZtZaLyCithOTYn
         98zLvMoJ5c4k65ROn4uEIK4YWbceAgxPLUjPLTQ8HlPsDijAt8AKD37vjwVNXtmGtRdi
         +XOEOn0yB7vx2NokR2Ri6LZpsHM5RaKS34Pn0W8tapnfYUj88wHHTDBjq9ZJ7p1dsDwE
         YrpA==
X-Gm-Message-State: AOAM530hpr87tdioeLhW36rxpUY7XVIXS8PmB6wBiW9PUL5fqtv0f0bX
        WmbWcTojr1melHgMACqwYy3jxEPDcWDfcb7L
X-Google-Smtp-Source: ABdhPJwPeP0NBCMSTKtcZXsc2/jo4nMYVkTr3HcM0/KZuoyJRUFkP3RlBtkmCwqyicKyMVV1iYLPfg==
X-Received: by 2002:a4a:3b4f:: with SMTP id s76mr5438609oos.29.1611699875328;
        Tue, 26 Jan 2021 14:24:35 -0800 (PST)
Received: from localhost (66-90-181-52.dyn.grandenetworks.net. [66.90.181.52])
        by smtp.gmail.com with ESMTPSA id f10sm63378oom.18.2021.01.26.14.24.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jan 2021 14:24:34 -0800 (PST)
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4al.nl
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH] cx23885: Fix various Hauppauge device analog capture inputs
Date:   Mon, 25 Jan 2021 22:52:06 -0600
Message-Id: <20210126045206.19517-2-brad@nextdimension.cc>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126045206.19517-1-brad@nextdimension.cc>
References: <20210126045206.19517-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reports indicated S-Video capture did not work on HVR1265_K4, so all
devices on hand were audited and corrected to become fully
functional.

ImpactVCB-e
- Remove extraneous composite inputs
- Fix S-Video inputs

HVR5525
- Add routing and config for composite capture
- Add routing and config for S-Video capture
- Add routing for audio on both composite/S-Video

HVR1265_K4
- Remove non-existent composite capture
- Add routing and config for S-Video capture

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
 drivers/media/pci/cx23885/cx23885-cards.c | 28 +++++++++++------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-cards.c b/drivers/media/pci/cx23885/cx23885-cards.c
index 03eee606af91..052199990d63 100644
--- a/drivers/media/pci/cx23885/cx23885-cards.c
+++ b/drivers/media/pci/cx23885/cx23885-cards.c
@@ -657,14 +657,11 @@ struct cx23885_board cx23885_boards[] = {
 		.porta		= CX23885_ANALOG_VIDEO,
 		.input          = {{
 			.type   = CX23885_VMUX_COMPOSITE1,
-			.vmux   = CX25840_VIN7_CH3 |
-				  CX25840_VIN4_CH2 |
-				  CX25840_VIN6_CH1,
+			.vmux   = CX25840_VIN6_CH1,
 			.amux   = CX25840_AUDIO7,
 		}, {
 			.type   = CX23885_VMUX_SVIDEO,
-			.vmux   = CX25840_VIN7_CH3 |
-				  CX25840_VIN4_CH2 |
+			.vmux   = CX25840_VIN4_CH2 |
 				  CX25840_VIN8_CH1 |
 				  CX25840_SVIDEO_ON,
 			.amux   = CX25840_AUDIO7,
@@ -715,6 +712,16 @@ struct cx23885_board cx23885_boards[] = {
 					CX25840_VIN2_CH1 |
 					CX25840_DIF_ON,
 			.amux   = CX25840_AUDIO8,
+		}, {
+			.type   = CX23885_VMUX_COMPOSITE1,
+			.vmux   = CX25840_VIN6_CH1,
+			.amux   = CX25840_AUDIO7,
+		}, {
+			.type   = CX23885_VMUX_SVIDEO,
+			.vmux   = CX25840_VIN7_CH3 |
+				  CX25840_VIN8_CH1 |
+				  CX25840_SVIDEO_ON,
+			.amux   = CX25840_AUDIO7,
 		} },
 	},
 	[CX23885_BOARD_VIEWCAST_260E] = {
@@ -822,17 +829,10 @@ struct cx23885_board cx23885_boards[] = {
 					CX25840_VIN2_CH1 |
 					CX25840_DIF_ON,
 			.amux   = CX25840_AUDIO8,
-		}, {
-			.type   = CX23885_VMUX_COMPOSITE1,
-			.vmux   =	CX25840_VIN7_CH3 |
-					CX25840_VIN4_CH2 |
-					CX25840_VIN6_CH1,
-			.amux   = CX25840_AUDIO7,
 		}, {
 			.type   = CX23885_VMUX_SVIDEO,
-			.vmux   =	CX25840_VIN7_CH3 |
-					CX25840_VIN4_CH2 |
-					CX25840_VIN8_CH1 |
+			.vmux   =	CX25840_VIN4_CH2 |
+					CX25840_VIN6_CH1 |
 					CX25840_SVIDEO_ON,
 			.amux   = CX25840_AUDIO7,
 		} },
-- 
2.28.0

