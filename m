Return-Path: <linux-media+bounces-28997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E015EA75C5E
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B0483A970B
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5172E1E0B86;
	Sun, 30 Mar 2025 21:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMwBWX2Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0755C1DF271;
	Sun, 30 Mar 2025 21:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368886; cv=none; b=HuLuG+fUCKXx8k8a03zmPFskJEXGuletVagS1DJV04Jsb7ofzQDpaTfM6XyolzriKfx+T7mS0FE18ERFz7zbVlcPclUdWf+o6F5mvu5tQpe9Iz8vHZuCpYr0B9Jvv1AD5C89G1VX6+QMSTufo65YT51IcrmSCJd+pZwwlf8qmDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368886; c=relaxed/simple;
	bh=6zHKw+mGMmUqTeRHVQTAWr5/wYPFxUw0NToMwPd0oHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e55lBcxbNvcLmpLrlWbbjlmi878pQBtjBd7AJsU5vFCTtw7u7BZhKCmKaSwZ0MHT6rgqJ+jxuRrkhB7jKuyc25A9LKyDaKycwdo5c4Ac/BzxKi790ovMstEXfkLOWG71hY7QXTWNLBKRdyba84/MrT7OKuEhZ87Et1WUfxVeLFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMwBWX2Z; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39143200ddaso2459479f8f.1;
        Sun, 30 Mar 2025 14:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368883; x=1743973683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vTBT3737aSuDNs+ola3oxIAKOS4UTwGBTcz64tioVY=;
        b=gMwBWX2ZbuF5IIp7PdfpKHynMvZvtbWA9CPmIV9m538i2zNecQk317rDWnesuXcwwY
         tUIXjmYkYnM5tx7y9hnkP40rLv9XljugS/L62F3laBbrsrPAzk/UhkqwJz5z2g+/DV11
         sRMwH1P1moCGTaRul9D/mHNFjA+9XvBfCdcQOrRbxlb1q7HaPBCVVRqKDzSQmxzltDo5
         vqLUx8IE73OGwpSdF9N8kLOywm356JyvLICDVqFbmC9OIBu2bK1GNna90gwETkNZPIrP
         OzIV/Ucb+j2mEjs3Bi9vA//Q4G22+Xb85ROLXgRQql+Dbn2M1vebojiyQn3RYlY6cj7R
         vTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368883; x=1743973683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vTBT3737aSuDNs+ola3oxIAKOS4UTwGBTcz64tioVY=;
        b=DNJ+M6M6BEe+q8ZPgIUjUJGutWncO1CPmwYFbw0KXmCU/nMs2xOZEXYNGJN+tEFrcK
         U590j9UzGs7en1g5HvKgldAIqqoExc/R04D1sIcAzZ+JrTZb9Sv5XsXm9now14bO7YHT
         Q4qwtBkFVpQWvwVjP8MugC2BpstTUw1gxotaLkNXX5Tkw+qwH3Dts2ERb55RlzIkfECt
         PEUjiIL02Ess4YlDFD/pyZhxpRf6FIJSacvtG2s1e5BY30LVUnUb2X4rpPgWIUIfDMx7
         dZGu1ga8qudDKiV8bGJMlahWEeKfYWwykAcv4mphoZjeIkTdRAQTf2s0JB1fHNPqiQY5
         NSUA==
X-Forwarded-Encrypted: i=1; AJvYcCUQYfBAHDLSrwNd3xS3xCMiJ6LKIw/K/8uMMy7oz8s1Sv4iwFp0Akh+i5MSOh3oP36g2jKUijAQgmRzpMXQxHXj6fE=@vger.kernel.org, AJvYcCVBTge4zg2qNGvfdVDlMu2FND541gHJd9Zh7R5mQwDe6R1mHnux5iXF8jCUKB4kDcQe79wdImaxGmKtRrp6@vger.kernel.org, AJvYcCVNGKdcEZ6TElQhocvMSgTQRLtJDXgSdTFNQX9pkV/L05Mmexi5r2RKcKn6YIPxsnVlV45DJHniHmM=@vger.kernel.org, AJvYcCWEzcpF5fzVmzroFU6o3mmt9udbRvJ9kFPRPgLNVNWvkiocC+cTbKUJjYkI6xkv+2Sw2waBgnmyKHZtDwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY2LnTm6Cbv+zZw+qEnPZwTpgOCCnOZFnU2xZfisa6pATnV/EP
	oG6JQJe92msbLDLUcrJzXGmmzfbX2+BHLaw6R/zPr/+pGKkh3d/C
X-Gm-Gg: ASbGncuxvFXh4hfD9AivBow19I0YZNUdRltmqjWhikuRGce+cCtMr73wpKGuAyWtNYE
	s2As/tVfJkNmohwtvkNyQAwxb2OnUFAqbIkwwk7Nc4O3LNRcht3N9B4Z99lHKA7vR42F9wUEhvi
	XF1/JovdyWxkyyozOHtIKfqguGnulbY4wJqsA6vCP4SBTaX2P8r3FY56lceEbUqxdrtSOJ9QpPl
	Dakl6fHGHN70AscWpDaE3XgAtdBnbnw0UAIAN/q3RSjDwrWA/4R4UZ6lrkxC2zMfl50XFQ1AT+T
	qaa2so4scLHXSVzsp5FsT65S1CwHkZS9q8t5NF8i9K2Vi9dbk3+7b579I8nDdM/YRDNVxg==
X-Google-Smtp-Source: AGHT+IHQsy3dGnn4PJPKW9Qk0fQrgUmMfhOTVtZ7Cn0IlFh8K3+cLohuNZC3LL4GbLtSEhtdTHgUQA==
X-Received: by 2002:a05:6000:40ce:b0:391:47d8:de3a with SMTP id ffacd0b85a97d-39c1211d34fmr4741118f8f.53.1743368883311;
        Sun, 30 Mar 2025 14:08:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 03/17] media: dt-bindings: media: renesas,vsp1: Document RZ/V2H(P)
Date: Sun, 30 Mar 2025 22:06:59 +0100
Message-ID: <20250330210717.46080-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The VSPD block on the RZ/V2H(P) SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
as a fallback compatible string on the RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 1a03e67462a4..9d03b972f522 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - renesas,r9a07g043u-vsp2   # RZ/G2UL
               - renesas,r9a07g054-vsp2    # RZ/V2L
+              - renesas,r9a09g057-vsp2    # RZ/V2H(P)
           - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
 
   reg:
-- 
2.49.0


