Return-Path: <linux-media+bounces-33691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 150CBAC92AB
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 17:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F12D73B0D22
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115CD2356DD;
	Fri, 30 May 2025 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUNvE+KC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF10119F10A;
	Fri, 30 May 2025 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748619721; cv=none; b=To0gE4Gjp6E/94viPmkGiOihIkOEtH1+lsOA9xbOq9C1RgrJBLDqpzTFjPu6tMHlopVzH2D90fbuXl1Qc22xFu+CRr2mbagiDXHzvyvSyQ1MfFNDtO8wthbaCwM1oQgxvr5jNqSYkvnFBHRmlI1hsIdGDSKKEoU9cGr7ED2AKg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748619721; c=relaxed/simple;
	bh=ze0z/8XZ+GG6SjWltISDIJTk8msS40fbj1rNhtE3T60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8FV2yAztyXETITgJbazTEBr2v5SuGNQFb+ttj1Kc9d7HgmSrYv6TRNmcC9hcxRaApbPdqm5RhEtotiifoxbV73nCGi22RGgJPqCVgAdceQKKGT4U716d+wn9csM533yOACmATJKHK6PNN5wMhrYJwdKpjn1BCghvl0uwQV10BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUNvE+KC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442ea341570so15468805e9.1;
        Fri, 30 May 2025 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748619718; x=1749224518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYNeeR59/xW6QMSNjyAfJH3KfMXRmHmly4ur0ebVwu0=;
        b=fUNvE+KCBKxxdKC1lspKC6iSldjPp6JnUGWUWvweaWV3lMOaYAhHrU1V81l/SHWniG
         uP8DiX8kKqBAXtX2XeQYRTkeBSOoTV+SPpBc+iBUsNZxViR6zFl0f7yxVddsbxZ0qBWN
         2fHo/aj4tE1WAxvJ5C6RvNAum9XRlLWD9zvjdSSeqIx9JcCq+3hfJWDJzH/Mwj1hX6w7
         4hVe3+HlFmIJrLR19NaO2DgCLxglSIIZubBiCnI40uVPL0FlSokI/V0nQGGs/8zgWuAf
         fT4vQmBVhmhw1mmYz5CS1jcbYfiRm04bi6QEoNZFBgW6yTbjHRJwEvB1ah3STO6Ri2Y7
         qwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619718; x=1749224518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYNeeR59/xW6QMSNjyAfJH3KfMXRmHmly4ur0ebVwu0=;
        b=ZjBYuGmheLp+Yz2R0Scse3flMzIDq9oPaVC3CHzk4+RjFs6Xp16GzZ6O0m4kp8vMeb
         sQEy9FBvRNcQnip4KpGbpEjUCP767YO/UA4PTlk0zlEwO9CuftmRRYlVVi565Bi/TJ0N
         IJmUeMWhiF9ZuhhKtMzFcTY1BSh3tCZ0ONclKXx7CuxIR0ZucQ+PLnyFJ85Tr9fCFgY7
         f1xxQnAThT82g4nWxU+p9hy3HGDEw5oqHgK9Kcmcj9WncaISllXnp+aUY2wsILvbryJE
         ZAaMNKSm9eLFekwXOaAeFYLpwU4R3nvTdpF0ftuLuYIEMO4L40znutzMPdYOzZ+9jefH
         BjNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTeF7xzA5hjcyT9Ow5t1qPPPaPv/+4ZE4/tC9vybXc11cHSoNthz3ownDD9wsGuvcgWuzBqDQR0RZC@vger.kernel.org, AJvYcCWTr9kiLlRIuCo6zSSaYYjBQ/ffNhuFecUjRmTxkTIQCBSsq/9zZaBCCeLHfb2a0rjw1aENjSrN2tPQca3j@vger.kernel.org, AJvYcCXS1vtrXObEjn4TB0OxEJUxRELOGMZfvdZUENPD52WZ1iytGhptZZB4zEuNHTE4iQPFPgotA3vkT8Gfd3MBPWgqvYw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzie60WyuL1AgXcjXm7xgXdcNfpghPDWB5ViUf3i/Ru7+8ZLNv
	7bBvsKkatdLP5PrMQnix/1jeAOTwxVt7uEKeUemM09e/bDoRm/FuM74z
X-Gm-Gg: ASbGncsFo4eGi02hV0vJreRbF5QdHKSLsqzw7cByIVlqbXJJQRKIKzRYWln4MZVBPbf
	PpdebyTJEqVb72LkPBDMDZpXYh6mrA2CppaNIVYRgKk19jdtguibr/9BBS4I5wvVepzfL8z3hWX
	G2JxOxSI9k4axeqNlnpX0zmFcm2BQrFyFMHa0rK/fIimAKDM+80obCTv1FoYdn0ldAhqD1680DR
	K4pYw4v5gKlZpUVZfRXZrMvOpZzwmD+n26T0Z+4gDMLGRXe11WraV5UQQnB7Go0IoCxW+VE8/Q8
	QBmkRx4D5ThwN9ceQv7FTUPxlSWMLEQAqWNmfBaOL9NOSCTLNP1tH/hfRbJ4E/vObmpVG06+9Do
	LA86FZAi0Bw==
X-Google-Smtp-Source: AGHT+IG6qWJNjApjr4ZaAda1+/zQT2LNa5oE8oRWK+RFEtNGXFOc3vwHAZFmUnxHQBrSbcIrDCri8w==
X-Received: by 2002:a05:600c:3e83:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-450d8846c1dmr34932395e9.10.1748619717625;
        Fri, 30 May 2025 08:41:57 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8012adesm21507235e9.36.2025.05.30.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:41:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] media: dt-bindings: media: renesas,fcp: Document RZ/V2N SoC
Date: Fri, 30 May 2025 16:41:47 +0100
Message-ID: <20250530154148.374663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The FCPVD block on the RZ/V2N SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,fcpv` will be used as a
fallback compatible string on the RZ/V2N SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index 5ed9427fb757..074be99ca004 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -30,6 +30,7 @@ properties:
               - renesas,r9a07g043u-fcpvd # RZ/G2UL
               - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
               - renesas,r9a07g054-fcpvd # RZ/V2L
+              - renesas,r9a09g056-fcpvd # RZ/V2N
               - renesas,r9a09g057-fcpvd # RZ/V2H(P)
           - const: renesas,fcpv         # Generic FCP for VSP fallback
 
-- 
2.49.0


