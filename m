Return-Path: <linux-media+bounces-15541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9498F940BAE
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 10:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE5228B3F3
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 08:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0741946A3;
	Tue, 30 Jul 2024 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4dR5CkY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C35B187853;
	Tue, 30 Jul 2024 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722328055; cv=none; b=qro8XCucyb2RfXi6JBhuPiePkJOxxLFkeHaByGgSpUL4Pv+2bmHl9sIp9I4/8VHsfAVfZBMP0GOtyeHf91PcExFSAnz8t8VcRBAj8jgtoH8nyU0TK9A6rVKfkO4T7RWspnVhphhVqX9B/MTlWggeAnDEgQ9VP526aQXR2898e14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722328055; c=relaxed/simple;
	bh=RkMiwhOTcXkFp3tFZtI9rqPQrFrDjm7VNpQvY/1ltg8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FoCUL0v6Bg8HIAf1EKZh1RAIi64i7djiFOCsd/uMGiStyWkIoJQ+NG4Cc8yNLT5wEmLpvXK305SrvZTBv1WowZSB7TmNEt66i6dN6pMAttv3wde7g0orn2sPGaIZ+OELQ1POWzIW/JPGUepu4BrHWFKxDO6BrOAfX1beizktVWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4dR5CkY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fc587361b6so27497675ad.2;
        Tue, 30 Jul 2024 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722328052; x=1722932852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0C8gOjqrcr9qUGB3HJrE/AWdb1TKczBphAXEi6KgblU=;
        b=V4dR5CkYATnOlOepAUneGmwFtHnRkTjIlwDc2jXEzbiJPdT11D/T2bKpV0ZfS8yHcV
         A2A0t4lpX3NmCyss0GATOUHYsE/HRSoOb7zuUxn7qvwc06BgNGDH4UPgfQgpU/KEFLRM
         i3ilT4vdAtr20qLZ6AkhCRK35/bgmltWoSK0EI+UcLAKKr10KoM5KyEXyfQXwRx9Lq9r
         mihcrkCjSwT8J7dps9FQvrDp4U0SV/bdzIUH22G2bIl0n1asSdUfCcOn4RLm4V1LpDdb
         u7Y6PQSMR7bOW/fmlcVdri6oCjvxc8/RAwfWCUrag3Sv2KQntef8eL8BnJIHgKpkh0dn
         lnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722328052; x=1722932852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0C8gOjqrcr9qUGB3HJrE/AWdb1TKczBphAXEi6KgblU=;
        b=LiLjoP5NebijrRzt/qnb6afi8RoEYXIAe+jDKchTcCXZjW4v6bBh30jNYzho4m+RL1
         APtYI+0F6tUcn/IxyDAkIb2lMltQzNnxig6gfBq2WJbCOX4l5kUxNsRPlOM2VRbqnqhH
         O/vQQ17BbGN3q5tfKuYUpsdedp7LIGBMYvaePZQ4Eo1c4PLSWr5/Dl1vqnDUfEye4OOQ
         A5ArClIMpbSRRc3itzeYTuJLcX26kf28lDQIYjFIQ+f7ezZZruLkCjgld9le+D4/vrmc
         TLFDikNqQb3o9vFvqnQM6wdDlu5KL48lwYEaTD5ALaXMU2Yb6N/usUKim/EQWl0z+8J/
         kChQ==
X-Forwarded-Encrypted: i=1; AJvYcCWshr3emWkosu78bRzjgyQCkwCHVPveKQu11l+EYXO1Q9r10F4Xps87wNFFiOM13WbxyN1aUaW80/2rPvIimfLIHbxVBYdtZPofBcCPhFxYsbu4hkkoLbZD5m0DkXGmrmO7dkTN9s5lKeI=
X-Gm-Message-State: AOJu0YyeOLKSx+1qhxgcEMkdCrTlYH3tPKMUyrm3+0I6X0+k9WJIxgsC
	f9LG2whz5VOAKCBQoDufCluc344keCSV857VnUpcI/PYPIDBSJaUbAmYW2BkK4k=
X-Google-Smtp-Source: AGHT+IG/CA98Fq2bpUtZhi/Mp30dxyYK9WopLNARN3D0DweQX5pqwkFzUNS8XPiNowwLQbcjBncYLw==
X-Received: by 2002:a17:903:228d:b0:1fd:93d2:fba4 with SMTP id d9443c01a7336-1ff048e4f38mr83563235ad.48.1722328052208;
        Tue, 30 Jul 2024 01:27:32 -0700 (PDT)
Received: from 13444938e8c9.debconf24.debconf.org ([210.110.131.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d29228sm98473635ad.106.2024.07.30.01.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:27:31 -0700 (PDT)
From: Kathara Sasikumar <katharasasikumar007@gmail.com>
To: 
Cc: ~lkcamp/patches@lists.sr.ht,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	helen.koike@collabora.com
Subject: [PATCH] media: atomisp: Fix trailing statement in ia_css_de.host.c
Date: Tue, 30 Jul 2024 08:27:25 +0000
Message-Id: <20240730082725.2524-1-katharasasikumar007@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch diagostic of Error : Trailing statements should be on the
next line

Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>
---
Hi,  

This is my first patch for the kernel. 
Big thanks to Helen Koike for the guidance 
at her Debconf24 workshop.

Thank you,
Kathara
 .../media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
index 25e3f0822..e66faeda3 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
@@ -47,7 +47,8 @@ ia_css_de_dump(
     const struct sh_css_isp_de_params *de,
     unsigned int level)
 {
-	if (!de) return;
+	if (!de)
+		return;
 	ia_css_debug_dtrace(level, "Demosaic:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "de_pixelnoise", de->pixelnoise);
-- 
2.20.1


