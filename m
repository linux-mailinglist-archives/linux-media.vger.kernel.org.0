Return-Path: <linux-media+bounces-25903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 607A1A2EBAE
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB7031665D0
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47561F3D26;
	Mon, 10 Feb 2025 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESUpIAYo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD9F1F3FD7;
	Mon, 10 Feb 2025 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187989; cv=none; b=QxSUgtXjeLob/r/dl+kqDK83vh/Zgxqu6IrhhivRaHEtQFOKYTkh3lXhF0Wfw5OET9SUZObfHDHHjn6sJDdBcBzWHx2ep5Ufltbm15Z4YocDi6MyT2wqvBjSEOTUDYEL875ScOwvCDdMklFc6hDRZdxMBBLa1JKybAYq/I9BIAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187989; c=relaxed/simple;
	bh=XamZnLRlVYuN4lMtrYwd602NH5O3lnsVOuUr7CA4cUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FRETqmZGV7ZkkWuMH3DghHp3vHIRuoUbLvTOSoEszigqqZ3QeZJn7Xc6CMKXmFwiG5YJa8yZIDpOuQJwqWVKxE7HNLPF4Q82fO6T1WU8woipuZHs/zOgWSrDUwu3EwxVFHlfeit26xwbw7NTW/Ij+01RDkZBGyeb06jz5uOxXJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESUpIAYo; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7917fc0c2so501265466b.0;
        Mon, 10 Feb 2025 03:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739187986; x=1739792786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S/37MwR/DWmOrWf8urGZTxa08grfHR1QAdWmPOa4i8=;
        b=ESUpIAYoS2W+2940X7DcTVlWljxv+BAlN2Rt1dQHA9lRvADGtJF+9uNnQlPo267mh6
         p/0VK4BB+qv6xaCmHRFsST29rWuup5/45Fq5cDJ2xV4oA6lQPdFFqYsQWOR58Al/ev2Y
         zreqFjgjWh7/M7JB10tEbB9S2o+xbxS7Lq90DR06vfRzwkqQFZxOrs4mDAuM1Jc5roMA
         aVDnmXmmaL30BM/jSDu2P5xJaw7hp+wcTP+al5yh5MPmycFdlbt4kuUcJ8449+sDGK48
         IlMNVhB6pAJN1+hvvv3d3cDPXio8vQjLvI8oJvPWG4vgM5iS2/upw/GJ2wQbSHE2JTM8
         Af3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739187986; x=1739792786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+S/37MwR/DWmOrWf8urGZTxa08grfHR1QAdWmPOa4i8=;
        b=Qe4Qhxcl44BGuEbhHI/z+tGoIfYXYDvyLZPTLD5S3oTIu+NczYS2OzoO5LrmWn9MS0
         v4BMYIPM2YWayn/9C+6+lZpfoDDdpMxxgitXsXp9qVwis4eqGurstja2BdKVxJmtGec2
         tVg1vYjHiqj5I8WGNgULIduF15cGQmw7LJajO2IaDavB1wtTr3O3CItk9jWdYRkKNoVQ
         f9FMfzgQpjm8A6ZBD8MtDU4FF5STzUH8dKPPFy4GvwTk2czNIjQr2PAHtx+g2R8/NQ0R
         P9gOWwWkQAF4PV38TYBCXA6b1ASmINQk12c+UCNFC2u86y1R6NCPIAGdlP6ex4tlbR6p
         5Kzg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2nxoIkRg2BIKh39VtGgSyQax4enPLMcVAhZA7pdnq/YUA8YQPCtRTxF86mQ5b5cBHr5G+dTeW4Ga@vger.kernel.org, AJvYcCWmOFhR/J/EHDFVSybvN2/Ri9l2CzIrfRoEVsrriAwTZ8B+S0EDF+ZfjiPPTTrN/w6ALYcW9S4FC5gmLRQ=@vger.kernel.org, AJvYcCXVX2llmi+xGkbqDGaPP+L4AjTgPmO0+KBYlJdbo8WSXQ95fpR4X5CKT0KUbKurg5sjDKb1i+TVXbjwn8Im@vger.kernel.org
X-Gm-Message-State: AOJu0YyQcLQet+BmH7uP8KXBFjPlEpgM07tjm3saEssB2i+3FLWOWyma
	bZIGDQ1owbfeUE3t0Zw4jRi61q5qYgB2+ahnCisxfsjA1Cawo9aP
X-Gm-Gg: ASbGncvOicVhxa70vBFMXbcDNRUFI14+M+lU3xnChmVzTp0B3R+7YxAGS2c97ybdJ+C
	AU3nOF664luKsn5fkGgzpQJCtFiq7PFvpUufNEKOAI29ubGSqZCEmjdRCVGObiRQEuDSXIWDd9i
	9m6mV1qG8j3RF3sFaYiIzPghdX6JGjgvzLk1xhzjZnaRxlZCfcbW/N/UssoMfA/B9vJjBCqqELF
	Zl9kqA2UkuE0BlQIbo8LU/kAXXqaQITCiSWF2Y/u+KRWFztva06FGNZuRg3kxOJTrW9kPhpfsS2
	OXGFN674rlfv6VDDmnvtWW4oqLMOnMPtM7v6F57KLNEPqS/f1vEgIrga2AqyYL3VEHUmufqJ0so
	q4BtBrsZZW7d+aX7+tsgaPxVC84s=
X-Google-Smtp-Source: AGHT+IHi0y/3WYORyp57ukR7kPa0jCnPFXkpclrSAxXC35PxcOwc+4rPLMIMonNEZBTfSz5lgm7kzQ==
X-Received: by 2002:a17:907:608d:b0:ab7:94f9:89a with SMTP id a640c23a62f3a-ab794f908a9mr1365561066b.2.1739187985379;
        Mon, 10 Feb 2025 03:46:25 -0800 (PST)
Received: from tom-desktop.example.org (net-188-217-54-237.cust.vodafonedsl.it. [188.217.54.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a9e6e06fsm428948566b.80.2025.02.10.03.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:46:24 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
X-Google-Original-From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2 block
Date: Mon, 10 Feb 2025 12:45:35 +0100
Message-Id: <20250210114540.524790-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the CSI-2 block which is part of CRU found in Renesas RZ/G3E
SoC.

The CSI-2 block on the RZ/G3E SoC is identical to one found on the
RZ/V2H(P) SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../devicetree/bindings/media/renesas,rzg2l-csi2.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 0d07c55a3f35..ecc620e9ca52 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
@@ -25,6 +25,10 @@ properties:
               - renesas,r9a07g054-csi2 # RZ/V2L
           - const: renesas,rzg2l-csi2
 
+      - items:
+          - const: renesas,r9a09g047-csi2 # RZ/G3E
+          - const: renesas,r9a09g057-csi2
+
       - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
 
   reg:
-- 
2.34.1


