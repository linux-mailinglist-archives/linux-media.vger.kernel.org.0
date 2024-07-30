Return-Path: <linux-media+bounces-15547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D382E940BFF
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 10:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10D801C24129
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 08:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DA5193096;
	Tue, 30 Jul 2024 08:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7jVKJea"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E57192B77;
	Tue, 30 Jul 2024 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722328949; cv=none; b=ZhQvTMDrGgi1Et/5Hgms7vtWY+xQ4xaWQNFzCi0Z4IXuJ0YGfOpF8VNE/Zqo/SdL3RlsE+KI/GzNrJHGGhcUBCypdwE0G8Jouk3G/7XU/mCqAZnZMOkkO5lhFzgjV6zoLUHJfWOYsh7xGjDsEJ/fJtvlEiXPA+r2NrMTimav/ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722328949; c=relaxed/simple;
	bh=9f99ZshAdpMzhQgkOB08+VcEn19vXElnV5/Jww6jgHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NZixHfletxNNaZde25tu8ONnJHEjJTj6qc8W5Ai3eTYVYAJTBod0Zvcr1wkx8Kf/pLbJRqUT7GWwX53NUTgF6lLmRLAtws79N1qups9MvmPo/yjcpi40aRC1V0G/NRvnV3efKWitq96tstVcPxVDVJLX1ITX6kqAgVj+KDQ2C4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7jVKJea; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fd9e6189d5so30356805ad.3;
        Tue, 30 Jul 2024 01:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722328947; x=1722933747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ktc+zByxGCpNSn/SuzIQLblDhojXKqXPkfeQRZpAx7s=;
        b=X7jVKJeaY2QzKwQtIv9eR79jCdXxB0xInkbwtFZ3JfUakdqLPCy3iijwgzVio98BLd
         KJGCwMiRwXPUXrTn2dPONEjm8prdTCbbFYDUoEXuiADgU58bB6c4P4Xh3wemS9akgb7V
         +uYeYxym2LwG37cOvKhl2Fn83HIypb2bVs7pgkuHCl5/TUkHz2eK1lzCoRTFP6p4Xxcb
         p0EviaLT6mgmWd3g5/K8/xRtrA50onaFq7MzuFxY+o8lCXU5ICYqphfY2oE42e1LPOVN
         5iPDasxs0a9sfY8mU4RGG2+ZxyNVGcRvUYrO6eluevoW9A7cQPljHcQn32euwl7emw2a
         +85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722328947; x=1722933747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ktc+zByxGCpNSn/SuzIQLblDhojXKqXPkfeQRZpAx7s=;
        b=qbur3pCA6hEtgq7uQWY7G049WrdEQSubRyU7YmTNIh9RZ0LEbZhuHdLi1L4LVSEb+p
         OjRPmpbNfcmpiufCsG+2lo7795RAsJL9CY0b8urNaP78C7Pd6m+9NgdZ9Uhh2Box71wc
         bFm1micAkxGoU3F9BWeeMNQ50BD5i0XV9+jL1y8tyN5w52JXOxw1lfaO8bcZDNs6MZiV
         JWMinv+V8+7pnIeLz0qZF72RZa5AKniwfZQ1BTXL/57ABOM9gB9DygdLa+0zfZwTc7FD
         IobHguYzp9VJ0p6uIBrnjl2QO91Lk2a+T5d7uhgz+9ThdReYzYPhFfwEmdYd6vPWeAYi
         3GnA==
X-Forwarded-Encrypted: i=1; AJvYcCXd+sseYO7gY87fV46o1SaDjXaQgT8NCafgE2JRi9KUMejyO5iO7d6R1sgB6kTLdI7JkDwXZkmAqPMUmNYo9JIdudh7uVr7ePpsm9Lx/yA4V1DsOBBstANfN24x7g4Cs9TkwWTil5n/c1c=
X-Gm-Message-State: AOJu0YwIgndtzcvlgq3hZfA0LxQd+9jbeLlUg3dnJPAoOQH9WtTZ9CNO
	85w+gcFL4C6t66PTqvfzZthzq54sjqkvqIZGbBLyiBhazkgsu4qA
X-Google-Smtp-Source: AGHT+IFS5roklR7pqnpjyRBbYHJ/0G3WGJQkAF/eeS2Vklr8/2pmTx6NEMdxypvFZ67euCGuzjVM1A==
X-Received: by 2002:a17:902:f093:b0:1fd:8eaf:eaa9 with SMTP id d9443c01a7336-1ff04853333mr65520745ad.37.1722328947234;
        Tue, 30 Jul 2024 01:42:27 -0700 (PDT)
Received: from c4897d9ba637.debconf24.debconf.org ([210.110.131.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee889asm96193975ad.126.2024.07.30.01.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:42:26 -0700 (PDT)
From: Sakirnth Nagarasa <sakirnth@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com
Subject: [PATCH] media: atomisp: move trailing statement to next line.
Date: Tue, 30 Jul 2024 08:42:20 +0000
Message-Id: <20240730084220.38204-1-sakirnth@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <sakirnth@gmail.com>
References: <sakirnth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpath error "ERROR: trailing statements should be on next line"
in ia_css_fpn.host.c:46.

Signed-off-by: Sakirnth Nagarasa <sakirnth@gmail.com>

---

Hello, this is my first patch to the kernel.
---
 .../atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
index 57b5e11e1..8ccfa99c6 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
@@ -43,7 +43,8 @@ ia_css_fpn_dump(
     const struct sh_css_isp_fpn_params *fpn,
     unsigned int level)
 {
-	if (!fpn) return;
+	if (!fpn)
+		return;
 	ia_css_debug_dtrace(level, "Fixed Pattern Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "fpn_shift", fpn->shift);
-- 
2.20.1


