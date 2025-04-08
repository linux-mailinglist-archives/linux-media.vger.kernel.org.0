Return-Path: <linux-media+bounces-29666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFDFA815D1
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87ED7466FE3
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 19:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4422505CE;
	Tue,  8 Apr 2025 19:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4uu0cMk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D53B245020;
	Tue,  8 Apr 2025 19:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744140738; cv=none; b=lSs1rW8c6wq3xRmYuQmQyoZXaVaaA+LotZUAQH4AuNi1PcosPDEF5UdmWpHmb9/ghXsMvRwk/GvxxbMi+FYELQYlz44vz+HrSPC5Qle8DPGz8WvkyOBsXVT6mgluLSB2JCt1ze0O3z5OPkKdbogadXEIOmiRjOomIIoOOgCAoYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744140738; c=relaxed/simple;
	bh=Rs8LZunHQ5AaFIrsoGF4LgS8gYKerotreDmsic+cXBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pbrt/AIx3UOQQkFE4rSLARJWUHRN9bXF0MEaIIivWybJsJeqXIs63ZnZ2QVe0+YW9BjOzXBKkkXUMMz6DNJjrlqR9WXTu4yYJOBzYNRWCG+fP1eY8EMsWnVeK8ucCYLUUW4sNzp0DFDNhvkTUcu1uSt2eQniQJFkoZlbuEDMG4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4uu0cMk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso55619595e9.2;
        Tue, 08 Apr 2025 12:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744140733; x=1744745533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmz7JgbiHGhDiZihWU8anv8Vm5wyRJYoszGCa44U2q8=;
        b=j4uu0cMktLU70QumydVjpukMVaDRRyrd7dUd+nb2hZ3rO+2ZJabWNbWe/ciL9zxVD1
         tqafMOKl6E/BhF1rLDzd0UxghH0HwLjFdi5Ke0CKhARemKk7a9X+tvShhy0MXNbzXJje
         LA3uI8WkjedOH51+21lpyURv6c7RtS+VQvgNo5o9eyDMI57/Ygu1+CcPoMBdEwmcuARy
         L99+ApQsbyUROgFedLPHzgN3xnkuIgrKEKznBRMX3mzik9hxlVbYzaCgRaCwKDoOc42r
         Socmlqty/1Sra/457Xu3fhOhQpvROxQTfXVHG0PVnrdsGMfo//znKMv7cwNOu7QpUIr2
         bgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744140733; x=1744745533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmz7JgbiHGhDiZihWU8anv8Vm5wyRJYoszGCa44U2q8=;
        b=a9mDhjgIhYnQf+ex/d8718ey3eSbAC7C1QF89AeyquhFPZ/ZJh4s5LEAF986u+bqKC
         1rLZmUKozX8DUq8VLOpFKgSUr2PoZkV1/LrEHkun0jrk9qBLZIHNoHIJIDs5hsUykJFh
         MyNVgCi9T1R5WxUOsgE3vvmE6wU4uJFZneaSAdRVXRD9T4aKsPBBs6hDOZetocq8LoNB
         iQPyUidCH6q9Oqdb2Cy+I9DggDQkm6wC2JCisMR1jR8WcD2fY5UQnpVc3eBqoklwe3rX
         nfkengNbBnk96+SsYRS9+1fFleOBAERxpCqMo6WvlrxVIUcYyuflkVp1SU2xJLPSx2VX
         wxiw==
X-Forwarded-Encrypted: i=1; AJvYcCW0iuht5GjMl5OqJzrZXikajxskwDfsKIuroAoA6zvqKdCAKldaEEOudJkUaMC1uTLEx7X026mNaLxZ@vger.kernel.org, AJvYcCWm4cmLrBZAt0esIAnO/PrV16W0BOe/t0okmHOhwbwPyNcM3JXmmoR0asMXb3yEpBtbjpwO+VaH0O/13/w=@vger.kernel.org, AJvYcCXJYT4I3S7bCbKyeIRXQd2WPuoTmU83RJFeczyFEURHan1RsLyouz0QX0VczmbOoPd+RPjM3WxChAPJHM93@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXob1TdsAFMT6ekO8HPVBEevwnmfbawVu9xUDdMTmWTeOyaAJ
	lBjTHY/aRUX+k+llt7UtoX9A+mF0zehP2w/AqzpacmKFlDUESYAT
X-Gm-Gg: ASbGnctAgwvgF2ucCMCeYxXfSIgm5fsj60UkSkxFN9hiLM21mst3JxhyEZZE2l3m4bC
	1zrRkCpnhh21u5Sy8G8VX6Db4Qr7Nj+klDZutQ5/s6YKg8f8VdS5qkrk9+s4atjAZqBQOmd56Gf
	Z7a3t1fADCKTZ+/q70NX8PlMi0UqBm+dRLeig1ZkEzED54AjQIdM127OXKF1fWtiEDZhMLufgKY
	Aw+hFtbj1eqtqpJOknPH4CCnsElWs9aUeHgmN7vtGA3m4NiIBURx7e2ZSkLAQsQHltNWTQ1QORB
	OSKiSHzYQwzVn6KMo8ZJSX9BOCasnTYUlBnB9DIg+NVp/vwkA5p9xUpiRxbhJD4ZOUYGSsNFUNc
	4Ksk=
X-Google-Smtp-Source: AGHT+IEcUIxkbYfvhYpWZWjRO71sBTa9EhPzleD95pRDpEif3mgfRqZMhgt/4XjAuKlfUhBd3uUaNQ==
X-Received: by 2002:a05:600c:1d26:b0:43c:e481:3353 with SMTP id 5b1f17b1804b1-43f1ecac7bamr2944715e9.17.1744140733318;
        Tue, 08 Apr 2025 12:32:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364ec90sm170209395e9.27.2025.04.08.12.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 12:32:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] media: dt-bindings: media: renesas,vsp1: Document RZ/V2H(P)
Date: Tue,  8 Apr 2025 20:31:57 +0100
Message-ID: <20250408193158.80936-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408193158.80936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408193158.80936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


