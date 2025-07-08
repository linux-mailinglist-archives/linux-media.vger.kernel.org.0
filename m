Return-Path: <linux-media+bounces-37142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF0FAFD294
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 18:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0252485A25
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 16:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90562E5B13;
	Tue,  8 Jul 2025 16:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTXDv3no"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CB92E54B5;
	Tue,  8 Jul 2025 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751993100; cv=none; b=G6t5SKuob8IROf6gzu7SSwR5gxpouZAk/XzaNuvuJMFA8/2nOPykAF66grbVecmZ/aeQr7djN6a5JUid4WAK4pJwqmZLyPGyAg2wspYqD2nmLdNo8EJhMUTTcG0zVLjDmSrdpdC6PvrAgqn5k/1HuxM17I+/n3Iqguc2anrIeQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751993100; c=relaxed/simple;
	bh=2qlDEyFAGz06h5bAsvaaZmniCKqNsSeizj0Fh5XlviE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MJA1L4GJj3mNTTC+RNExOrdqXTHuT884LJ7eO+OhkrxpPxAWzSpzYOjQojjuESBIaWvBnT5L62IW+vcCdO5Pvw9InB147fZa8PB4SCMBvaACKRxj+Yzi1HiyYQW0t8+60cg5bkLNeaWdpVqxo6lBfeMtHo+9QjbJG8LhyKFXRKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTXDv3no; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45306976410so1580345e9.3;
        Tue, 08 Jul 2025 09:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751993097; x=1752597897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g2HnDWqyfDRxi2RCwBhlO2r9sxygmtugxTgL2uqFKsQ=;
        b=BTXDv3noN0O6J7ZseWzTVoRocOFDRCHLC8Y7wvUW2/tW3FwkUcikxnwvWwpXB2Bw//
         O0zEDpiMINS1WiGDGjFXueJLP0hZL0cjZNqyGjFsM3Q9rRGHQTK2OPQbAQpdn/GOiebN
         rjodvBhd/L9sdKyutq8lLZr6pKJ6/FF59hETAnVgIR+Gqt2eACNNPRUdDDkaepcae1QK
         Yo/CLJS0E8DS7jBcRqMOtyeYMNUjxJlNBDCtQVbzKa4j04hrEmXKCSxjAPWQloMtbigd
         9ayjMDEfoccbT44EhsWksxV3plxJg1vDncFakvgCG/sLn5ozbpokOANMW0KD0L0+Iwoc
         xdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751993097; x=1752597897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2HnDWqyfDRxi2RCwBhlO2r9sxygmtugxTgL2uqFKsQ=;
        b=q8mchbJE90h3fJvLtAfo5TLosiZlmtwnm0eRq1/ViP/LBwVpeGslQQoTewPwaQDhL/
         bLFldd6+tGFhBsy/Xxl+5/1cvx1upJR4ZxCirBYHAaRDe/36rwfgOZeCLh6eUUR0H45A
         +VvYG/pZV2CTGSXfM+5H7ppQCwiUjyxPQ9KW1hq1EpnQqdtQg1ALJypnDvRirp71OGAT
         FJTNgTvg5FlRBhhW+LZDgPyw96D4aSiVkPDG4lTyhBoedDy0AcoihdNKkbLnLAFSb2ju
         rCdWL9jdFB+/8mOunkhPyeblhofgnXt8NjR9UHCaL/1MKU4Bp6tiCFnOp3ZZDdoZSHqA
         Cgeg==
X-Forwarded-Encrypted: i=1; AJvYcCWff3tHdpWvcmvgazkRMuoqkwX3LnKkPbDnpwy0sCP/qZao5UuE7h0CBw/IJPBjD2ZLXEhqEhjckKfy6C0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuxf040ReTLU4EzUZJAWIJvIYX6Ib3i3tR/JH0Jn1dyGWwoRi3
	GWTjcxFE8LtoJ5EMp61mNwvpVznTlOt0tt/1LYtm9HDkkDFEFqQpemHh
X-Gm-Gg: ASbGnctbax3deP4eY4v8x+H5r4shPUOWN2ig84W4gp/E/FYVX+/pCu+uMMGbaUEq/US
	GibjTOlKtsPzYin7gTUlIHrbB3njG2fWJSfC1KFGu2jc8w6inKst8ERoswTNGjw9Nz0VcSFBY/v
	D9/7rqFw2cJXkWgSHutIZ831JTjzLKbGe/Q1eXASUEWZREJHtrcsRMTKA3dTyey96GOzibFMrhh
	LVJQLDIBI/KwAmpysKwkV1YzRkDCVtkaV2qPaDouAg5xde6bTtiuoCVkacaqSNHCCnjI0gP+Czu
	52xd/cOR/z/NVEz5ow8X2kmgsgstQoqnHkZWjVFeDtXcMbpxszyNBYN0/VJRvchBAp2uoMMgTv+
	1fEjQ4fxmvWK0YYdaAOQNQQ==
X-Google-Smtp-Source: AGHT+IHZTbKVb8PLWEN7pGyYFCbChkvmnPSm5GR4cp+8geTvUxYjlQXs8GquqISkwXm+J3CEJJlEmA==
X-Received: by 2002:a05:600c:a06:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-454bc6af52emr43110395e9.5.1751993096480;
        Tue, 08 Jul 2025 09:44:56 -0700 (PDT)
Received: from localhost.localdomain ([156.208.8.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030bd42sm13184563f8f.5.2025.07.08.09.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:44:56 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2 1/2] staging: media: atomisp: return early on hmm_bo_device_init() failure
Date: Tue,  8 Jul 2025 19:44:07 +0300
Message-Id: <20250708164408.79863-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hmm_init() would continue execution even if hmm_bo_device_init() failed,
potentially leading to bad behaviour when calling hmm_alloc().

- returns the error immediately if hmm_bo_device_init() fails.

Tested by:
- Building the Driver.
- Applying to media-committers [1] tree.

Link: https://gitlab.freedesktop.org/linux-media/media-committers.git [1]
Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v2:
- put brackets around block code.

v1: https://lore.kernel.org/all/20250707140923.58935-2-abdelrahmanfekry375@gmail.com/
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f90c4..97c7ce970aef 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -34,8 +34,10 @@ int hmm_init(void)
 
 	ret = hmm_bo_device_init(&bo_device, &sh_mmu_mrfld,
 				 ISP_VM_START, ISP_VM_SIZE);
-	if (ret)
+	if (ret) {
 		dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
+		return ret;
+	}
 
 	hmm_initialized = true;
 
@@ -48,7 +50,7 @@ int hmm_init(void)
 	 */
 	dummy_ptr = hmm_alloc(1);
 
-	return ret;
+	return 0;
 }
 
 void hmm_cleanup(void)
-- 
2.25.1


