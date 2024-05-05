Return-Path: <linux-media+bounces-10776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A56888BBF1F
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 05:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E309CB20B83
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 03:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7911860;
	Sun,  5 May 2024 03:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nE5Me4Xl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C5117C2;
	Sun,  5 May 2024 03:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714879782; cv=none; b=H7WIJZxLDN5OVrHJdzDCV0qD9/vl+JdIP3u0qnbnZLlP1E7fjGJbYJvuT+L2mfvUO1AfTYhHP7qbIrT5FpE6+NB41YDC/aUn3EYhiRe8YKD8rkqJJjGE9/f7ExX94CIWpQ0xMw72x5I2NuxrfkcGQiPFL1jAtYO3NgSdD0z9xKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714879782; c=relaxed/simple;
	bh=4i0Oujjns/PW7PTcWJ+RumP3mTxmEGwuf9DHk12FuN0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nv3X2rXoYdofmZIFeR2S+X/JxNwoDmKS3XIms6xm7PH9vF50tWzosX1y+p4Oa2Hz3NrezArPMIMz0/BGGvYRvUHvx5yHaOk2cpS8u8YltansUaG2OWbR3rNbFBtunObpENqNczy3wsNrNWEWcPw570HzODvzQrGRWxPMf2R7pHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nE5Me4Xl; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-23d3d092a1bso340887fac.1;
        Sat, 04 May 2024 20:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714879780; x=1715484580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2YoXNPfWEXlDGV6z3+1F8Nm/sflOvF+RNEkcMkhPNqA=;
        b=nE5Me4XlXJdW7nXSo8Net9fttaP5g3hU1HYSKAGfM0ZmJKfl1LsdY9CNIQwh+S5y5Y
         6H+UXpn7tmpVokC4kku8YKS61WWVVGtXjQro79nJB22EehnEwaNABtlgIKMRdjAWKuNf
         tWcXvnl2hFxU3DDhwwtK2L5qZ1dK5JP8IjexwVutjPHDhKKjhiv/JAgoUA2oLEISJR+B
         gYJpBTW2n6qN4zRxtFpJFTFyYDkm5bRtYbjYEgMzoNWzhUDLTYxaqxmAiLydq1Z1qnFc
         cw3L7hjFm9GydKZmY1DSZ7jiDzZrUiR0qNjwIKNf3hyUrvpihwJ2ZrnvhUtfC+F+clOG
         UiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714879780; x=1715484580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YoXNPfWEXlDGV6z3+1F8Nm/sflOvF+RNEkcMkhPNqA=;
        b=Hu/96pW27FGZCQTMGEe5HJPdNO3XzncWkSLuo0OMJrHwUlGZpzHyOVsijq1Agr8eMG
         3rxBZhptEkufrYfnhR4+URiHcv7+g+krfy0CoWAIVY/m7lbRfvqAxGPTimmZadAq0/xx
         X5piDj9atz+Ij13ENOVnpoez1UOkPwQ3eccoEmaNBHzDSX89MG1RySBt5+Jt5D2YkK0R
         qSEbrXx+v4Hg0Kl7UK09Me7/gZ8AXjljGuEGqKuS+QlqSkBNw6rQvgIWjBsvNhmLPf0L
         P/a3vMahh8w84zCLYwBD29OSGGZCON4pJ+tzkn5PapZu7Bu7LI1+R/WBm0Mp24rVQghq
         vOjg==
X-Forwarded-Encrypted: i=1; AJvYcCUFXeOv2J87ypLVY01Dz88678hX3KhQErY+fto4wBjphYgDLRNrUkxPYwz006LDkn8ksIY82O+mjjzGHxhZFDYUxql9JwzCbRRuLmd7Xo1B3rxcnkrNxFRrJaxjap1lr4CX4Gg4L4/j2Ps=
X-Gm-Message-State: AOJu0YxPvbu/mckpKJDZvFbE0g3R1nmXmglFrRSRe87owCO0SVbUoXw5
	nAQJFKHzCOc6rk1MVQK0LfI3wRpWL50m4jqR7D9tJvzJomJMP0LF
X-Google-Smtp-Source: AGHT+IGgYyTHvEoeGNOUKKiSnusw8L7aboGNcu3Rc8CQOJQ5HVKXu1tfogFDqqKmbBC+bzbIrZ1XMg==
X-Received: by 2002:a05:6870:508:b0:23c:7b6d:38d7 with SMTP id j8-20020a056870050800b0023c7b6d38d7mr8139676oao.36.1714879779645;
        Sat, 04 May 2024 20:29:39 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id w11-20020aa7858b000000b006eceb4cb828sm5384732pfn.180.2024.05.04.20.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 20:29:39 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: atomisp: Fix spelling mistake in ia_css_eed1_8.host.c
Date: Sun,  5 May 2024 09:14:30 +0545
Message-Id: <20240505032931.133879-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled calculating in
ia_css_eed1_8.host.c. This patch fixes the misspellings.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
index bfea78171f7c..e4fc90f88e24 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
@@ -161,7 +161,7 @@ ia_css_eed1_8_vmem_encode(
 		assert(fcinv_x[j] > fcinv_x[j - 1]);
 	}
 
-	/* The implementation of the calulating 1/x is based on the availability
+	/* The implementation of the calculating 1/x is based on the availability
 	 * of the OP_vec_shuffle16 operation.
 	 * A 64 element vector is split up in 4 blocks of 16 element. Each array is copied to
 	 * a vector 4 times, (starting at 0, 16, 32 and 48). All array elements are copied or
-- 
2.34.1


