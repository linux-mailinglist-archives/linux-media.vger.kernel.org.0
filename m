Return-Path: <linux-media+bounces-60002-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMcTFrNI8mm1pQEAu9opvQ
	(envelope-from <linux-media+bounces-60002-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:06:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBA0498927
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32576303791F
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 18:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3526818A92F;
	Wed, 29 Apr 2026 18:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkqJL3rm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6242C3CA4A3
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 18:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777485776; cv=none; b=Nm8xZ0WwjUzP3sVqr/SLh86uDKVTAGlAwfprQI/xvuph4+tyVbzy7BovXpJdkBLVKO4KJiPqLhnKJddtvb5kvuA2uP8QRkuKpqru8zhWZdid41Z1deazgAcVEyboQY4ngQEqbt+C0EFuFtsiFIJ7uNWfMk43Fp3XWgCLMxUmCrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777485776; c=relaxed/simple;
	bh=uLVEIPwqWzxjK4dmir2rj8E7ndD1cjUKSSZ8yXCQuiw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kbZ+8txGgRt5bLA536B4a/BG1WynKa8GBE7+RIxNuAxhf3XP8uMzDjEIjSnA3frfrprdXo6NKIYjEBIbWLCbhqfWuPh1sXBymA/ruDnioQu6TaFMy+LGAhCnZMrThMdNZ6sj2PQ7NGG8koHeBJAXx0JqEKG4vxTBTeMXP0D0moA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkqJL3rm; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c637089ccso35949c88.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 11:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777485774; x=1778090574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EwC21Ix9lFUTGf8usPBb6lkawYvA9xdVs2jYHSayj4g=;
        b=hkqJL3rm1ygsnKOrClHZTKlUh1Slv9K+VmIUA3OOJsPkV3I78qR6cVLjH9eKP19znA
         U7nupkp9HIEeHDDnHPrOPtJt6K1poZKVM135szcLKFnplWeN3aw4qlmZg0NLCtrzRz0J
         A5TWB6CEu93HAWNEfn8RWiPYFpKmHnCz7s/wVJfrz8ceUcVJbRsKN1ZQmNuopegruQaM
         Uql/opCZpb+Cn5kN4+U/FGZ/4lGSmZ3hHE1Gr95AiRlujFQhScJAeZF+r0oY4Rr8l9oZ
         XqDdv2P8vClcjjzzxBKnImyKCKvWtrROk03+QJHkjrg3ClAzwblhIP8rTAGSmkcRQHkb
         Ucow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777485774; x=1778090574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwC21Ix9lFUTGf8usPBb6lkawYvA9xdVs2jYHSayj4g=;
        b=ETytirWIes2PaHtRkzVuF2iVIg3mlfQd1l7cC+zL+kxvbCpBMW3PKwzJM7O9Kcwrd6
         SmJmEh15QiYfHPCfSr+17N2Nch7S5LIQ+SR5tjitWw9VlKJu3c5dzCSVAXLUpSf4h5fK
         uXHZajycGj53qUIKjlHVQZfdJlMYEBASv9fY+K4MIo7n5xJusloWzLUEazXWoBRE99D0
         Lq2kd/TxOi8mfiH/nESIvDtXM2UbPYPGNpNwGPaQa+FWwncFy3y44VXe3JUmU89OX2Xy
         D0ytWMWC2EUvD9uWwof3KxugLylu/VS2qa+j8WocZSKkLQ9vyqS6+xJDHTciwWxH+Oib
         O6vg==
X-Forwarded-Encrypted: i=1; AFNElJ8u17/eTcjpVwWWIxvcZlcDYVzkorp0E/VX33CvScy66lhLDum/7/xVOzgktm89vpYI2kkFNu5eCkEQ6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy2YnCbvCWPDQd9B9NMmDTWe4l1OsyBhyqPwhtwY8i1bjiqWGh
	j2GLJEfPxNhjWabsjYhunxeYp9PHbgXaEnxYFNjESchfBl+A3OOEVY+Q
X-Gm-Gg: AeBDieuY2KpECDdGFRhc1rvoM0RaK4tZ+9LvQeaxRdeo4hhN5tTSjF102jTMy9lfN2R
	eUGK5tTj9g/GceIbvujBqYgousMSGMJyUzMYSuYgR5aF1U3tnrSmA5RTM4H0eQ9bUHo75T/eR0u
	7Wcot8wal9E2JESV1SuBvqaYEir57F4ypkRfBz5A7mh5D0FWhm4mxKRARp1rTZeszSnomjI6R8V
	aRqzdrYIigbHUFSo6GJc2orHIcw36RI6Zy27GslXtCYZIfGQ70SB2ChX244GcbIR7CSYV+RYwR/
	kBEVurl0sJkZ8eCvIO4mkY/wlH7qwVs0O5aWGKV+a2O2QwnK+ALTWhG8EH9u4+IckVhYSs8H1Hf
	j+sy0IdJKqcaO74XZiY8223HomTy3HSug1hE8sOSW/Q1NOCka1mjPXc32OB4T/oaTlyeL8SohfG
	xqlj9efZ1W7qB3ud3RdddDvnP41FX2xdesRPyY8x/vOGhbr4BsdAsT8QyxXNwr0yd+IlFA
X-Received: by 2002:a05:7022:128d:b0:11a:4016:44a5 with SMTP id a92af1059eb24-12ddd9d9d75mr4129744c88.24.1777485774105;
        Wed, 29 Apr 2026 11:02:54 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:cdc9:3f29:858c:a856])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef842f12sm23199806d6.44.2026.04.29.11.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:02:53 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: ia_css_isp_states: fix typo in ia_css_isp_states.c
Date: Wed, 29 Apr 2026 14:01:48 -0400
Message-Id: <20260429180148.6581-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CDBA0498927
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-60002-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahamaryamjavaid@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Fix spelling mistake: commmit -> commit

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_isp_states.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
index af1765040464..cb3c2af91c51 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
@@ -3,7 +3,7 @@
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
  */
-/* Generated code: do not edit or commmit. */
+/* Generated code: do not edit or commit. */
 
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_states.h"
-- 
2.34.1


