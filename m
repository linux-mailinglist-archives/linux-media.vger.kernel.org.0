Return-Path: <linux-media+bounces-49871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B7BCF13BA
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 20:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36DD23001BFA
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 19:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50487314A76;
	Sun,  4 Jan 2026 19:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhC858iu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFE9238C33
	for <linux-media@vger.kernel.org>; Sun,  4 Jan 2026 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767553521; cv=none; b=lmfJj9i9NNYpCU1qWqRhMC209qU7EzV1yodsDd4oYlNYhZ1DvNDKkURuP5zA0Zbt4l1f2hhIMXTygoOI2KQWTp6ExAdwedONVl+832cZJKzbyT+WWS4saxLxLUTEtNELACSQQ+fUr9GuJvqgmcmeHUYr8ul3xNnk/HI04FdJeCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767553521; c=relaxed/simple;
	bh=6/zCJJXx9DZfY48PIkypH/UZeZ/cOMZ7xcc/kYBfYdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QoNmOLKM8250wxAIOKBUiCCtMIB+WC7qsxvxjKiRy7+dob2Oje5OTpQtFsVgA3x2woZuVgdlomTl0QO01evite8mJQ6pRxwsM3uHNLXRXhVuaalRBYR47K/QaAcxUhoVJnzNYrOvjtJWydn5KREEKQ44VbPtdEGF1jYxDqtWPU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhC858iu; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4775ae77516so139949045e9.1
        for <linux-media@vger.kernel.org>; Sun, 04 Jan 2026 11:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767553517; x=1768158317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kH7dAkCMy49tzMgoDi5R1yw9hpYDlkp4ghtVJ345QuA=;
        b=hhC858iucHyz0+Q8I9Ba+UpFCKBQsdHwZGuwEw1c+FAW1Ewp6YYRJle/yjh9w+rSWw
         8EAoVezVTP5L9kocI9W9OZ0/4N5vhgwn+qr9iYjOnKl63pGjIuJastdYWcKmEAT3Nzmu
         rGGLgL0FZ90kPR9MPxSD8okrobY351zAgJjien2BQ5HF3DpBoZg/PC5bXymz0XfopnG3
         1BIRL8NZ0a0I/HtSp26/rzlHSU8+PUzti1G8f1CYrGRrtf9KuK6aNlvwwNsETAOBc2hR
         +7wOyMPjCqEferFjDLYByDGwMYtRv4wDxE7SiTDh0axqpJZGEEFaeAmKsT7VkQk8vXAf
         YeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767553517; x=1768158317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH7dAkCMy49tzMgoDi5R1yw9hpYDlkp4ghtVJ345QuA=;
        b=qlkzV11yYQxBFciTSOnDvGz+OkrOEsKJ1rFJkZAaDJj0rCU4eIvD6UGh/zzCidCS47
         TDLgOfOV3QdxHSJBx7fpCI6azdHDZSEIVbllR6t1I1g6ZPtXtgHfe5hhlXBN3cSV0/Ca
         i79EafXJulZDGRK5uBC//ZWJHZy2kceMD7/JNf4BfkxM735zMc35jAk7PX8Y4dd04sQv
         2EcjW23aCUQHq8wo46bDnzGKSqGkIunl8MZPEk7GoTlFWjPAhtzz+u8m1EqUJ0UEi3YU
         Se75k3Mwtf5ct79aPrtPOoXmx70goy4485z68Fi8vysoP+3tWSYEnty2ERNBoMSkSNP5
         0H/w==
X-Forwarded-Encrypted: i=1; AJvYcCWuC68kzAp9cwPWlRcbbB9Mjso9mnQXCiG2WfxcfjDPbgU2fRxhlPzzcy5fERgUvQ3k6PpYKfxAJ8VZYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz91o6KKXs5C5/stfp0mqCZuidlayNFUs4++xYrwc6sd58dTF/d
	LqgtJSKvyIosn8QPdBPInF+ex2rZEgltkAQ7ns+0HOc7O/RpVYoZo+PJmKqhjeTB+Yg=
X-Gm-Gg: AY/fxX6M85+QHREUVWewTIuPpfqP+Cj50AJn9JnqRNq9crYCIVpiUqYZcr46qns+ym1
	YphU2vB81j4E0wZrC6j04IQDIl473LIT5Ldty+MzXlvdvKG40VqM+mRhiFKN+fP3KycK5yunsi8
	+j8FeVcYgixzvB2PzFA9MgujgJObtDrXVQu+bUqAMi/H5JwYEPmdBgZ0f73PdWWGVD+o9rsj/+r
	CkxuTtMvWPgUVGfMqKWHx43llA1ynOPbNDb5lG2ZYfVZbo49afapX3I7DR/PTPQbvcDYmw+QKsX
	EBo89rZAW4pWRJmimsPa65qVEYA5TbLHUD5BnMLpYqnILP251YHllyAP+Uj2zCMgEiJwzBzg221
	6+1ZoMynlmxc9Flc1zrUZwtBefRvUX1zV+UvIdqrTf+BRGEnUXJkBP8tbffl9WECE7G8d0jbxCW
	dKaTIp/uBWb4jIFXkTDfV/YFsgAvlAMB1XI0YItnw=
X-Google-Smtp-Source: AGHT+IHrVdiL/42Ek87wCD1+Dv/YGTDvseNRtk1LjSkqIgCTkDD3F5Hmvfq293naJjBGVzQPVVIIbg==
X-Received: by 2002:a05:600c:8b56:b0:479:3a86:dc1a with SMTP id 5b1f17b1804b1-47d5b21d77emr251472445e9.36.1767553516932;
        Sun, 04 Jan 2026 11:05:16 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm96505089f8f.42.2026.01.04.11.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 11:05:16 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] media: atomisp: Cleanup and documentation fixes for mmu_public.h
Date: Mon,  5 Jan 2026 00:05:04 +0500
Message-ID: <20260104190509.19683-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses multiple style and documentation issues in the
AtomISP staging driver, specifically in pci/hive_isp_css_include/host/mmu_public.h.

The series starts by fixing checkpatch warnings regarding redundant
return statements, function signature alignment, and block comment coding
style issues.

It then removes erroneous function documentation where additional parameters
were being shown but the actual function signature did not accept any
such parameters.

Finally, the Doxygen-style comments were converted to the standard
kernel-doc format to adhere to the Linux kernel standards.

Mahad Ibrahim (5):
  media: atomisp: Remove redundant return statement
  media: atomisp: Fix function signature alignment
  media: atomisp: Fix block comment coding style
  media: atomisp: Fix erroneous parameter descriptions
  media: atomisp: Convert comments to kernel-doc

 .../hive_isp_css_include/host/mmu_public.h    | 87 ++++++++-----------
 1 file changed, 38 insertions(+), 49 deletions(-)

-- 
2.47.3


