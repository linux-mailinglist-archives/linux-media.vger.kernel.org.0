Return-Path: <linux-media+bounces-37546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEF4B02C8E
	for <lists+linux-media@lfdr.de>; Sat, 12 Jul 2025 21:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3ED34A1713
	for <lists+linux-media@lfdr.de>; Sat, 12 Jul 2025 19:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C7728DB54;
	Sat, 12 Jul 2025 19:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5EWwh63"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C91275875;
	Sat, 12 Jul 2025 19:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752347634; cv=none; b=Xz1XcRT5WIoPMKVUmlSU838omeAc49TGO7OVIE5HWo9naxcRPQnftNBT9OJh8F8/rNLOa6iwmpE7MZODZZMfEOtu4fKLAKQcKh7+1KWh0WOW54LI6rpPbtbRXY5Wc/gIqz5MhwrfWlok0p2I9pjYr895n+8fnoSd+W9B2OK0q/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752347634; c=relaxed/simple;
	bh=gVkFMLfDZNAcblb5dwn0J3mL9GjMWVi400R+BI3nj1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IOZK8WRej5dcb6xF2h0lQt2O6nFcE+VDEfvmf1XkJkYPsl3KgL51qnxWfmtRzTQfTnz+dEoTLu9DXZPQofUH+1fOF2c6gJLOjKwhLHhMA1Y3nVpRzL+lwJ2GhFmUDMHrVuwlrY5OpsOqmpVoQB33wBuXk+tYvDmpL0+S3e8Q/fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5EWwh63; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so421357f8f.0;
        Sat, 12 Jul 2025 12:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752347631; x=1752952431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WgcUUdQRBquLpdf5eq5AqmAdjxeq8xvK3pQY9lcVSM=;
        b=B5EWwh63yuTQoC7l0Fsli29CgbnHS/hkV+uIE6bfTQ54O7xuI/J5umJ2nG/g4RBChc
         6Ez+r+N6bGxe5ecuXX4lK1ikq1T8ZRLfFGexFmhHh+265jzmWaxh0Xl4xIwF62CP3obi
         F6DJjqr0ZCMXcsm+11IqXHa5/vkr0BC2PWl3P34u334D6OYYQVp/4R77Rf76sgkJgJHQ
         pWvttQSLvgyyEUPjisdccTzr34bVXVySYpvQZN0gc2NR9YQjAfnkn2P97NYvDjwC2++q
         ezySJVBtA4FP8vx4fwEXL8bExWEUkbd79TQBVxo8D6a9VJwkvs0tePz5KHc143Z3LhO3
         UEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752347631; x=1752952431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WgcUUdQRBquLpdf5eq5AqmAdjxeq8xvK3pQY9lcVSM=;
        b=WhSadh7peV30JvTzP5hSFw1GOSFqj7Vl7FEI7kXhSfPK+P6HKCutfkgauhyMbmNJJT
         5VWje/mYr6EUsDBej/Y1fCjvsTosB/NchYBUvm2gN59tJOf6eE73Qc5bFTEhDSWacI0W
         Idiz/bw44xiUT1WHx2L3OWHiyXyQgPJYkuml5am8Lpz9Ic/kdPpGJmSagKtKKmlJBy4X
         xf+PbWveKR+QSzHghWqdX0b/05vXpk6k2HaBtKv4NrsouJBHgKrAo+jv4+2RH4Y/CUOM
         ruYnb1JKP4mU9HuDcNMS5mCARdJnmfbfTOsC0Qv2bTuGWa7J/asOor8XOWf5EH21dU15
         Z5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYPU1GQIVPW7Sz4D16ciE/zVS5d7r4x3dfB/K0tI631Tso5Qkqqw3Izd3JAIgDoW+GneK9kupCY1vpSQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOa5yNRblC5BQskrncEGtIDWAgYDVUa4zOep8aZDjEfG0RcuzA
	sPW5cTN4zPbU3TatrEK3/1KzljJy5zJZT0QsQ18hvAl0d0ubUdfdjNMl+zp94w==
X-Gm-Gg: ASbGncu/UfmMm/9x8PGVC3CRvtb6uP94yWy03vmswgfCaMuOXhwqridKjPV2Fg7shBA
	nVLYqLcuA/u3XhODbmSWgew2BHrreVl2B6UUaYX6kL/U0I1C1oumNWU3dh5hPI2EzzB37coMAem
	oJXV0L6JducGGqrdQ1BUXwP7gKx77uoDy2jBQdysiCo2wDzI7lX/mrceaQCItikxf2oA9wQ3zi+
	UBr5L2zPzaP7ulfX9TKO+2G1H9Y4sNw8Rk+zEbR4lBpuZ7k/vehW8k5VRYkHSp4d9rwKTehbUf5
	NZ4ADD9VXQfBXFtwukJcfx+P4wRIiUwmFu8Xlgs+u3Vs+8zwO3jA4MP2Sk9uaZSC15yWykF7TSP
	yRoJeDn+qFq1YDfraPRPuGWt3POUGkTj/3TyOKq1PS40pGqKuLNUMh/XdqA==
X-Google-Smtp-Source: AGHT+IEiXGKJd934lZQw1ynm98/xMBFQxAUGyeTUudLL41WEikCMOr9VQ1P1QDGRYsdZvXZZHfjwkg==
X-Received: by 2002:a05:6000:2502:b0:3a4:dd00:9ac3 with SMTP id ffacd0b85a97d-3b5f2e3e6a3mr2219628f8f.12.1752347630394;
        Sat, 12 Jul 2025 12:13:50 -0700 (PDT)
Received: from localhost.localdomain ([102.42.96.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26ff9sm7947939f8f.93.2025.07.12.12.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 12:13:50 -0700 (PDT)
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
Subject: [PATCH 1/3] staging: media: atomisp: return early on hmm_bo_device_init() failure
Date: Sat, 12 Jul 2025 22:13:23 +0300
Message-Id: <20250712191325.132666-2-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
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


