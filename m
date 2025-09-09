Return-Path: <linux-media+bounces-42100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A395B4AC27
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 13:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 396EA3ADF12
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4282322C6A;
	Tue,  9 Sep 2025 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QalU/jgS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534EE321F5F;
	Tue,  9 Sep 2025 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417546; cv=none; b=INDaOqZagjIPlRx6TgESX357BZybfbSJLPxh+RV5/wssjPGFVey4MFJbGl1YjkXDgMNQbYGk/IMGfOUD6LR3aZ3R8F4RuEbZdmBaDpefFnMFLd8rlIwZp4h1RpH8+3WLUHx//VbSclOi5i55OtLqK1rYPZRacCd3RQTQyD9jLY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417546; c=relaxed/simple;
	bh=KRzR8r8BeT5xD/6KhCb3zT3gx2m5v+Kj9I632ozOs3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZfRwfrlYlu8IJbRLcu6nAXPnm5cBw0uxCNnLd97xPntDyEHy2S6+6QYFiP8dA+yPZ/FHOA5oQ8ELVjsSJaCpJ5gLxPtNx/7jT4E8gpuwLSdh+zDJKAMVPHg65LrSBgqL6FCZT0px3tC//Uf/R0XnX+DQ032G9StihYcJJoeneA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QalU/jgS; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b042cc39551so988202566b.0;
        Tue, 09 Sep 2025 04:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757417543; x=1758022343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1QaFJuKV/gfh2JhnrBLCvARK0KuZzT1gdOOA133AKI=;
        b=QalU/jgSjxbLziKc3yTq94Ixg+glbyawGH5f7yGSTLgmkjxuGdJ45nJyF1KfyEgtnZ
         47O7/LLWpoEd7Q3XJfFnqO+LHm5QibLq0ST6jEGm1YvC8ArmBuYU3PMjYx363NIi5X7a
         RVmxBhnZPomTJ0IOI+MBYg12zi2cGFfOVRo5Wot7/Ga5uAd1zqfkTIzQkfyxzig+wNfk
         A9pDbOvTeBlW4uoyhkxrFLWs6FCJRBf/ur98R4MmW53ntg+L00S4V0RJiXted9XstVOO
         BwB87jUFVALOUKx9TuQN1Vw9qvY8Zig7GbmnUKDfs7vzXGtWSCtdUK4STJPN8lE5HhzO
         UG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757417543; x=1758022343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1QaFJuKV/gfh2JhnrBLCvARK0KuZzT1gdOOA133AKI=;
        b=jiwzEpPc+PDkFvVh1L0M4AzaWJ5yPDtP18zw5nu1P1UuSEt71PQaUYc3MSHZOizXJe
         zBhIlPLx9IqelWjFU68Zxjt3uC8LQ0JhmM4Ts1f4A7d9j6w7EA+JsEUl0qqljr9BA7Ic
         3BprrzCkRwDAh1ok6+Nps4BuK6lAEyEr1HfWMueZq5YkkJuxiX1IP7/iJOVirGuZNxLt
         93B1y2LBJW6pkfEcZyG+5zUndChKMa6fsgADAsCSBrN+xqS7WYJBCvqSQS0TbGgX4VYI
         Ke+mGx52XNPabJKNKDSuCZzlInCJTLpZXk+LnZoDqV4G3giMdunOycCeZRgDE6SHR2jt
         brcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV33ToCm5E8I6nr/1el88snBZhT/NB0kaZG0Y60tPnYlw4jUg+1K4NPPYfO0J4tYz37UGKAymk1k7Xzx7VT@vger.kernel.org, AJvYcCX82xxYvPe+VOS/W1WYNKcb4NfCgyq06s/cVuhUrH9lm/AOhB4nIRD6hoY0nVKSW6Au1j7xmj7k5r3j@vger.kernel.org
X-Gm-Message-State: AOJu0YwhfJ2coHCgUcCrnlr+mkosB01jFDP562/aQkOKRSLv7dT14nO3
	LiDA4RJPeKoArUGd1th1YVu3ggDI2+LLnqKuXjdWIYy0uX5jedpBsLsdrlv0AeUY
X-Gm-Gg: ASbGnct5JmTWRiLeN7+tE3rE+xWjseX86aHlzXpfQ+ZY3c5wxGE4ouLCVm+iD0ozODc
	eR4PkClZi+5DyrqBuimKvH4oK24ZkYp1S2tOawvzaK7h1xACRsH8sQbvr1iy3tEkCzXRrJzGyHn
	uSV1ynvrUlbWtYCgPiteJFDt9O2iGIzT/VY2I8vEFYogwgPbI7SRmw8iaUfXLqNzGr7qwANMUMx
	G179KO5xmOY4O7Npxmy2x6+b/HTJQWMCFEABww7qT05rLwKRCAbugS6DcvXoBs80zM3NJHRXV8I
	MNHzwgtw1crfT/uYgEWS+O4a6u85oX+aJU343lH0oMs/JvhX0KDsrphqda/4ajJALSfS1CYxwAu
	xTDvLMqf+jyUcaKBrdmduAXAPH1UAr/XGqK2A9Jauo5mtfy2sj8Psdw==
X-Google-Smtp-Source: AGHT+IFE2sxJJyaaTeRLsdQ+I6NGE0gVad42SR2GNVoth72iEB1lZI9F+rd0Uv5evXSmSNYyZX10PQ==
X-Received: by 2002:a17:906:55a:b0:b04:c373:2833 with SMTP id a640c23a62f3a-b04c373294amr762397066b.32.1757417542359;
        Tue, 09 Sep 2025 04:32:22 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:4bd8:5793:1d49:8ea3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040f1cf4b9sm2289497066b.29.2025.09.09.04.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:32:22 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	michael.roeder@avnet.eu,
	martin.hecht@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: alliedvision,alvium-csi2
Date: Tue,  9 Sep 2025 13:32:15 +0200
Message-ID: <20250909113218.2595516-2-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909113218.2595516-1-mhecht73@gmail.com>
References: <20250909113218.2595516-1-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change from my company email address to gmail.com.

Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
 .../devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
index d3329e991d16..ae48dd4ab589 100644
--- a/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
@@ -8,7 +8,7 @@ title: Allied Vision Alvium Camera
 
 maintainers:
   - Tommaso Merciai <tomm.merciai@gmail.com>
-  - Martin Hecht <martin.hecht@avnet.eu>
+  - Martin Hecht <mhecht73@gmail.com>
 
 allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#
-- 
2.43.0


