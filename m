Return-Path: <linux-media+bounces-39994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF46B28540
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 19:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3C7BAE4771
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 17:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1339431770D;
	Fri, 15 Aug 2025 17:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rt5LeOsJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0433176FF;
	Fri, 15 Aug 2025 17:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755279505; cv=none; b=Nq1N/jjBqcdrXa47+I0DZOp2ylyR4mi/aTCxheicr98kpMoZKMk5z3Rgf9oX29/Q4tQKgvOEOTtSer+GbjrCNCtM4fKNAILybuKA3cy+/zWFUAvL7kDH9M/dPqvGPrNU2014jenuATkdxaN6RYV4oYKxzNNeJpTH7ksmqxEsIOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755279505; c=relaxed/simple;
	bh=gVkFMLfDZNAcblb5dwn0J3mL9GjMWVi400R+BI3nj1o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CPsBszQ+QLlvLUI/M7n1vkkRNjubMF2FznFd1uFAOfmJ0koHjUo3GrOnO/h6mE5tH4i5FBrlUcH/n51yn4LDuWLU5Vpo3VZo86Rb9ReLQ1pRRGetI2sZbwze6jr61sLJXRm1Kdnjh7BrMH9QnVTvBSuTJ0S86MhYsJunOuyX53o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rt5LeOsJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9e411f79dso215930f8f.1;
        Fri, 15 Aug 2025 10:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755279502; x=1755884302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1WgcUUdQRBquLpdf5eq5AqmAdjxeq8xvK3pQY9lcVSM=;
        b=Rt5LeOsJWce7UYZAR2dNVmMzZDmz0Us+KlGaLibTWfg+9XKtKfcornLXUFrruWdwa6
         ZvV3ZHrWlBqwx7PTg6aieP+wqrg/kPx5o6oPP6yUjiwcdwFFp7oftm/IArGjp2kmboz5
         ZdLk7BhEqxnrN54smLIkEtaOw37CAvbyI9xsCbPsDCSPczFx92lNXUkjSkThK1vCQAFy
         ZUwOKDMCJt4SLrjvwvXQkCJjhOllpJyFChsGpj8C+0s0acUhmmiWHLLaRiuGWliNgm5z
         d6b6cPrEyb0SnwTbXo4SGJ2uAW+61Wsq1AnikJHl+D2qvYxbKdw333ELddNRcsCgHrLh
         u/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755279502; x=1755884302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WgcUUdQRBquLpdf5eq5AqmAdjxeq8xvK3pQY9lcVSM=;
        b=oV0WRUHKa1cnn3JeggUngc6LcswrziXwZM+hdZABRQ7nTZdK/yyBZTBg+yDqAshYS8
         0gCQS7zzNiexd1v+myFVmE7ETjAoZgRRqC3tZAtrUHV4HA2/FWg2B5+sP3WqBw0Qf/D0
         EJ4Mcck0bNfVJeS5q7B9xHOkynHG6Db+kLZjTnHPBP9jhhxgLMO96sCfUmAhHq9thFyy
         m5yPnWBZ741ntxyikqCIyx67NKgRhNp19M/SjWEbGU2LCv6DcsrfOnMbTX7V3/Ma1ECx
         5YntKKun58oYrxN93HeR14UmgoiUkwMrC/NNQrmK8IJmafW7eid0JvJ5cBcCcFhYt7Hi
         TraQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWIns3aKtBOld0gbo7oR9eLqdNulpSHd8AilBLZ+CJlsys5f17bsZJYUSMqyQiB2Afnl2KH9lC/vZsRRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHcHxV9+cT9rt1vSxuK5xVKGItVV0DZGyDh4+fuRLsQCwTpq8v
	6rqSnrA+zuiP+i/b3PjtDsLsJChYbVbJSsf1Yq3+HjDjqPVOqm5fg2Pd
X-Gm-Gg: ASbGncu89TOo3LG8oOKuem+sw6jdpTkyOqAj4u6EXFkeVCvh8XUYDL/zBFgiSySsRPv
	MHSGj+L2q+JjfqKQv6hHOKOc9KCjxAkEUgjewIRT8fa0PJy+rJBTi4jCCzB1bJ5skTsMTDKe0Jk
	Ajgc4YRKSj1/sAI1bfx//wfmtWZjlRUHfXiwQcINBtv06nqNdUZ0Ha7GgWhR6ZYVzArTO6btXo1
	RvOOpz+S14GYJLlBoZhprDpBzAOqfQ6XD81SW3YVX9ph0Atwg4oStkEpcegwgmcMTib+ajAjC9j
	mb3FVKmtfx+YkRkN3HRB5EdDvQi4AnkQMte7MU9hhUT7egmM4bKbATAFahrL9vAg9HzgYxeT/4T
	3bASeXNYC6iOKtEIPZwPwRaG/tpo3bxWtkrfWVmDVmCNfn7JQ9xfJy2rXkbqzztYLrHKeT9/UEy
	MFloPUtw==
X-Google-Smtp-Source: AGHT+IFj2gq8k5qF+dxuqCn3M4gO6wawzpjQxzbfBk8qGD/2kEHqMYN5fr5izKW5sZXJSKKkcDgkEA==
X-Received: by 2002:a05:6000:26d3:b0:3a4:f7d9:9617 with SMTP id ffacd0b85a97d-3bb639d4521mr1070777f8f.0.1755279501969;
        Fri, 15 Aug 2025 10:38:21 -0700 (PDT)
Received: from localhost.localdomain ([154.182.175.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c96dasm2597432f8f.43.2025.08.15.10.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 10:38:21 -0700 (PDT)
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
Subject: [PATCH] staging: media: atomisp: return early on hmm_bo_device_init() failure
Date: Fri, 15 Aug 2025 20:37:55 +0300
Message-Id: <20250815173755.33254-1-abdelrahmanfekry375@gmail.com>
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

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
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


