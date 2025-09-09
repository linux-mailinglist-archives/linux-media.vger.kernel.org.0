Return-Path: <linux-media+bounces-42090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DE4B4A8A8
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9CC116D29D
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 09:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9473090E5;
	Tue,  9 Sep 2025 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9jRYamW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FA4307AE1;
	Tue,  9 Sep 2025 09:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757411120; cv=none; b=mW+IJeK6AS9l26pGA/FVecFXUSpwOUatHZe0L/tfdsj2kgxPzTcZuKIeDUDBep57ELC6Y4i0SyoyQIfwpqPfxI1FheXypLqMQdkJIQZ2uXYW83dw1oV9qTey5XoEsxRlsum/OSrGV+nlYrloRrt5aJp6km4OkKJq6hlD1v0uZZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757411120; c=relaxed/simple;
	bh=KRzR8r8BeT5xD/6KhCb3zT3gx2m5v+Kj9I632ozOs3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/LkbR0XIYvlrzH/PAlT0Jdszg/R6tjPpWtHU+ZGMKohjk+A6dNkk7hEpRgW7G4t6+50PXMVnfgUZQX09aRQ3kr6n8wzvjOeIXt1xtB9KtzrBRbTu6PQNh4R+SWaTA3MJ3zHBhUvUj8NP4qlvw/YxjKPmAqZ2wtNO/+DOYjIkbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9jRYamW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b042eb09948so1045056066b.3;
        Tue, 09 Sep 2025 02:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757411114; x=1758015914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1QaFJuKV/gfh2JhnrBLCvARK0KuZzT1gdOOA133AKI=;
        b=P9jRYamW9ncbZITOtevC8Cn1F8RODe6Pr08GD07TsBghDN9xY11RLc7nVLNd0NSux7
         UfX3HZNSpE/ae9GChNG3X8susJCx5F0WDRC2mKbuldNxrn1oGbGqarEXB3kKgVVXc6gs
         dXEWnsEjIgO9btao5nYuTrJ3a3y926GDxbsnQ+qp87L6yt4VLFdh+U7BCyXb54r6T9Pj
         vrWe99IBe6AGykF4ywSK+WkE3h9mxZkp3C5cbSW2JV88eHg5YLg5WymPK10yfdZkDOln
         QxAcV+rZCwxACsLeq58ZdKy0PWv3syTSMDu/NyR8m+yEQ2ynP2AVJ1Qt4cWdr0NHAquZ
         xSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757411114; x=1758015914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1QaFJuKV/gfh2JhnrBLCvARK0KuZzT1gdOOA133AKI=;
        b=qcHO1TrIZu4YeGKBZOwrN9GpNiozLxj0DL5wnjwbZhiHrAtnk4ogifuE20PJtFRQvp
         Je4q5s+Oyr6i7rZPjq+qXDIeQLVOn0989f604qYUZT4pet6PFi7GLM8L4MWhEu2TIvLG
         b26nEe0n+/9bV1IhFapN2vOsrhM++uVV65ZngcG6uer8W5zisDwQPgdM0YbI1OaybnPo
         2z5evI/VhRAOl0RWA4uU4e6zgBBWQnAVsI+xZDra96giBRFhgUrO4ZBOAjT7pBBcwhec
         uw2zC92Lb96P6dbBTR62Qw4BqY9+pGADsB12aMXKk/m4YyJK+FDJhNLqkmADwKDnVYnI
         pYWg==
X-Forwarded-Encrypted: i=1; AJvYcCUNYyDaySzsmGGZpgyK3CEzFP+Hj0N1YYf30LJdGtNiNm9r3xPGGgp6JFuqAcgnaWM7Ujig1cdo5YwY@vger.kernel.org, AJvYcCWV58V0OT10NGbEb2DtgfGW6khev/qcUQgAE1lWET3Y1VJ9TC41+HXKC9sX4xGOfqKZAHSvpK8nzim8oplI@vger.kernel.org
X-Gm-Message-State: AOJu0YzodF2fe2fQK4iveCdB7E6PFGUB/z6u5LDzMVKoEvlYHepU61zV
	yy8uCvfMmS78xVRXqXpmq6982TJ7n075wN2XugpokQYzXlMX6B9gFl5Xbjp7ZhHM
X-Gm-Gg: ASbGncvw1zx+Ejgx7Ha/Lg7qm04LoXmItUS3hCd5/Zr/IckfnU+LEK0TeG9WXEI5w0C
	2nGU6sdu8pe76JtKYhVk0vkQxvHhcPiCqxHsfUa0QsPu+nlBtVWQiHicxlBsz42OdLl5GowXuo4
	ymA5OtwwaZlgGi1xWE+D0i50ZPqA9bQQQoWaDqhEQ1t16Ha7k+9X8aLYXghnbrycHpJDM7aD4so
	Tz8QYhSaK95FfMMet3J2Y3NJIsFNzoBDzz5GHBpK1nJdnbUyPpKudt8SnDOkEhQcVWj+vo582sc
	4Rz4kB7ff0B/Fc99Zzu8zu0S171/pEMUuTBKJ1cInvOG+Ihbs/FAvWgIF3tCiw/xZ9zEGyl5vSD
	PHiAauLDyCYv86OSGz8bt/dbnsHz+UPRH
X-Google-Smtp-Source: AGHT+IHTUBGME2CINKyQnFpxQi8MVkhzrzapRTgrvvIndIOV4OJONO2Zr37KaRHe9qIM2xvwQ920uw==
X-Received: by 2002:a17:907:97c9:b0:b04:1a1c:cb5b with SMTP id a640c23a62f3a-b04b13fd491mr1087979066b.7.1757411113600;
        Tue, 09 Sep 2025 02:45:13 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:4bd8:5793:1d49:8ea3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0971379esm2568706166b.102.2025.09.09.02.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:45:13 -0700 (PDT)
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
Subject: [PATCH v1 1/2] Documentation: devicetree: bindings: media: i2c: alliedvision,alvium-csi2
Date: Tue,  9 Sep 2025 11:44:49 +0200
Message-ID: <20250909094451.2262445-2-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909094451.2262445-1-mhecht73@gmail.com>
References: <20250909094451.2262445-1-mhecht73@gmail.com>
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


