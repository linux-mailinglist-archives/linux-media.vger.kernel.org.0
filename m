Return-Path: <linux-media+bounces-36849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7613BAF9726
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 17:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DF4B1C85D6D
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 15:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821A12F85D1;
	Fri,  4 Jul 2025 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/2SaKiS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3276E2EAD0C;
	Fri,  4 Jul 2025 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643674; cv=none; b=g7Hs5ajGAeR85J6j4ca5VG2dtltm6uINnL7STP7CxnNKZn1nxAMJrX/6CPi/6cUCLHVcI40nwFX0Wg7OzfmxyT0ZDkwzMkQjqER0Xb7QiGLGNs7ihQQmhdU8nvVxowSr3ypvBRQ5fRSZB3BbuKAdZ4VW0KZKe/ByKkM4F2JMlJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643674; c=relaxed/simple;
	bh=xYLbV2QqFNHa8jDpZ/vCY1TRrrpjjetgD4nLJ1JjhaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kmUxESco2BkpZiE2HvesNjShQsAu7MNdwiYIYvra+1K/OO0w3NQLm9aRzwTSHnZahlMXwBMsYDsAt2tWFYYurldbSGo/z4OySiFM4BdHT/6IyBsK3tF3fXQfyE8LMStUm2HFIKCWBQkRoHi8Qy8RL/k7p4AjuXaZcmnmUeN5D/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/2SaKiS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234f17910d8so9316815ad.3;
        Fri, 04 Jul 2025 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751643672; x=1752248472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9FXgo4kOOsPzZWvaw6DLbnFb2GiAYv+/FkUIxgcH20=;
        b=M/2SaKiS1GQcvVwRUxDQocsMxlrCGS8udfeJHszxgwuLllKrxgneYVQPHAUQoKd7gh
         GQoiBqlC7HNqZAX2ekmTeL+JnxJEmEwBdwLZr7UcfXk3YvfpgfrPIQrgnX9RplJEf9rP
         P3upEYYD8cJhCzZ0Oh0WeSnG56O3B+zM0oJ0XfeIu/A3b32ylTPmF2Lqe7qFMamBADLc
         /VTYJhwvS7rGYPz4txRAwdC/e9aZbKCphaltSC2ajk4fXpU4r5fkb8WTwGUuOUMcH6Ji
         AknLstZsGxvUE7Mou9HM/epr/XwqBDUtLMkcUuhm1KVQlLPt91iXSiYdg9jVdaFgIati
         LAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643672; x=1752248472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9FXgo4kOOsPzZWvaw6DLbnFb2GiAYv+/FkUIxgcH20=;
        b=DdOe4r8OQdI643vLEBpXf7jc2iYx5q70TDy0R66p734wJXEPnraPGVFAtx5C4t1W/v
         RSr3riBNSbLIgSvwqLKsKsuvlMgaVvvucC0xna1nhy9FwsUPLhVV5GXNUgd2Vstkb3Kt
         nXPH8f3WWpv8alNu9uMBvMgW2Evf2Pam73zgE3FANDQoyeQ7cENbsIzvDB6DC7n+G3o6
         VdlSLA9KCYdLkeYuN1Erw5x9HX8xGprw+mkGbrFataoVRIpg7kORt/m5BWIJsAHbzH85
         9nXrj0AZj+HOagR0tnHX3D21HWM1iJeW3XvqE3RS1qImINEpfImtsKTGVLVHAWNh0C7w
         fDow==
X-Forwarded-Encrypted: i=1; AJvYcCW+RVV1jMJd2n00sY9nCrwDrQgOnL9A0ZS6UlPzyB2ApR4xD2BjP2EOzt7O/YTobCFLEfNrH8P19gVMbUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsoD557o/Xg6JGmVfzCDXfeCp+TlepjO0iEkS8yqdrmXR8XNaU
	NI7c11qf+HAdsQTzRlUM/OKgAx6rmZuDlEVKI5gUUsT8wpmke9JdcU1J
X-Gm-Gg: ASbGncsog23wA5vSxH0vCfoLzUHzc3HZHeRV9p2BG9AUrU3kVZsxGka0WEf2jl4FNq4
	jzg9i+HqzqMrVFRsnWRurP9rdrJmNOhhxa5eL6STxXNxoM6EQ0zRXd7G0oWD25W99hKI3OlAZaY
	TKzmYtbDPQTNsp2QwekQt0EXvNTSGQZncY817qTxoXlEH/xpdbmu92ZOR4A2XQGsINcmF1vBReC
	4FpZyQDhnw45iN8QuDaD7i1aEsZd4dfVHncY9TIwTG5vvP8oV9fwWwB1lpMdxLrsM/bQriQV2GC
	uaBnx9f1ILjjLygSXUD1j/DKJeGIZkUQUY2m5LjAu17qlksRYaQwWGDw6mWroHqdPAAybVkZNgt
	8zTQVO6eAytHYwKWi5l8PxEhCaSGBWyoSYx2ltw0Z7ujndLrTKA==
X-Google-Smtp-Source: AGHT+IG/P76dOfXnU1KF02O5kxsvQJC3lmARtg+FeImu9RcqMS9TTJhq19ARbgLlFkg6O+xe1izNwA==
X-Received: by 2002:a17:903:41c6:b0:235:f3df:bc26 with SMTP id d9443c01a7336-23c8606baf1mr47935955ad.3.1751643672356;
        Fri, 04 Jul 2025 08:41:12 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a4b6sm21912375ad.29.2025.07.04.08.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:41:11 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 04 Jul 2025 23:40:52 +0800
Subject: [PATCH v8 1/3] staging: media: atomisp: fix indentation in aa
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-new_atomisp-v8-1-2a8560cbd9be@gmail.com>
References: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com>
In-Reply-To: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751643666; l=1280;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=xYLbV2QqFNHa8jDpZ/vCY1TRrrpjjetgD4nLJ1JjhaU=;
 b=0l97E4GtpF151G5Q/EOBzlk5pBjplayMLCl1wJKdXl+23Lrop3GD5ubW4+Ry8pPMZ4mt1eEOQ
 y3BDtRB4uvFBCcuW+KIzM+JP/Dqe5WJCroZEPT/zQBdyyG65qhjcyfj
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch fixes tab/space indentation issues in aa
following kernel coding style guidelines.

No functional logic changes were made.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/all/CAHp75VcPzq9XrFD29+uZ1rbFcDxb4UbXNkv_QZ=3iyVm3dxyPg@mail.gmail.com/
Suggested-by: Hans de Goede <hansg@kernel.org>
Link: https://lore.kernel.org/all/e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org/
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
index 2f568a7062da726397f55b1e73dadd27fcd1f2f8..edca987ee20931cc124a9af74a14698ec12419e5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
@@ -30,7 +30,7 @@
  *     ISP2: BAA2 is used.
  */
 struct ia_css_aa_config {
-	u16 strength;	/** Strength of the filter.
+	u16 strength; /** Strength of the filter.
 					u0.13, [0,8191],
 					default/ineffective 0 */
 };

-- 
2.43.0


