Return-Path: <linux-media+bounces-42377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A93B53976
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 18:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0BDCA078B3
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 16:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1D835AAB2;
	Thu, 11 Sep 2025 16:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHylLhz/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451E235A290
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 16:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757608850; cv=none; b=ZumGoVX+YHnCQTTPwEFzPor3ht3eU/R68FGKSEQSk6dw6HenynY8TAjsB8mVsHABbVgidli/eey8DLgwx4oEu2CIATqguMmiDgQ8jrVkeaNEPsSRtg/P2qmxlmYvC7NSU3of5ZO65rW4M6MoR1crsZRyzYFxvCjP15EVRetubQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757608850; c=relaxed/simple;
	bh=PGUYgHqS7CEbT5QLDYSKpf+raKUBoMSG/SoVXw8S0ZU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nollMXW612NNTf5DlV28oGSYW05t4qklmR5pOcRFv5YHM7SemiEbtoTaI35P/DK+dqdNGWcklENfmgT3q1+8Z2ebFBcGwW3SBmXALI5QpQAhFELOKKRD27mrILWKokW3HWALkdFg3CylFuGUa7VihPTINFN+NbzKP/KfrPEgGFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHylLhz/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso7829395e9.2
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757608847; x=1758213647; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iUkbXECYsNALn3AVpSeO9cAaZnIpWugEqcmf3/zSHD8=;
        b=AHylLhz/bswBbHNEEFgE4zATHDvY404L/0zDC+EnupsYaEprtkhCphMmRcqCRumgDQ
         rM0xhDzqoWT7BimokK0vZMxPXh5Sez4XbUFYOc66aNZVX11sdpV1pOslprO+qE2zzo+p
         dZSkEeKFaOoBWMOEMiIYJR5EPUUGPV6Zy0jFESgpFV9iNJfSdp1QLYNTvBRvHeOlPUVl
         +06YZaxrRuatW1evM0OV5mtH6fz7WmtLS3ZtLzxZogH/nNgz/7+BaBCuuRlOC1OjXRir
         BP68I4U4cgTAobECUVtK9/RoyUW2vRDSlWu08TujidOHw7rINhe+rK/3Zatctc6jwlXB
         m+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757608847; x=1758213647;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUkbXECYsNALn3AVpSeO9cAaZnIpWugEqcmf3/zSHD8=;
        b=O+o0hOOKNFBRc20HMnpVKxqEmP73l0V3ObCsj/r5MehF8E+Ors4FIZdgZUbFPV9Nqx
         /DrNoLUIC2LpS+QRwpzLKyNFJxko5dqiVP+yj/E8oLcQBFOCnDnm8f8LjZc6viNEBj/P
         QKNCR6yAfYY0B0d+bCQIVEWG8fRx+TUJnA0mxpzgTHCJ6Y8e0jfM3Z9/FHLi2PHKV79A
         KXBsYHf/1qaS7DZNfPcUC5PFXcoRlkLhR/Q9XK5HBhNPX345drII5/2WM8ftEiWj/Cc1
         i+QaZtuV/ZF1elhkLBDewrC7dW+kQhCWkhx4ppaA8TSmZ6HK0fAvJpmcnc30pfCPPQdY
         1v7A==
X-Forwarded-Encrypted: i=1; AJvYcCWmaRdjwuDBSv1f3WU2jpnSqMLOIO2oHqYkJ5xbih0w3vZ98DXMA0B+dmbR6Ti+Sf4D32aG85Uh4u1oSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLTlCtc446VPj07iaUO9j/hEfEMbtL7+O9WvfZ844FFuV/TvrI
	EO9FuWjDcsP5iVprVbw34uFNMAyb5M0oij6HUl6pPTEiyljhK7/3Wrtq
X-Gm-Gg: ASbGncvxEYEG++b6OCvIB49twIOwGH7aXybTu3iIQMj7YbT448oGWq6n0TlUKWTSLsu
	sKlfyQwJqXgLgqO3P9hxqanMA/MVnjiufhCyY5G2zQufLcIFWLanvpRgLxqHzGK+xhn6X6IxLMN
	U1jIeX5SY0m3A8Io/UVjKFyTOXCRYvQkLw93sjZhTs5CEtOnyY7EINlv8mqTWWrjgNbHQCgG0me
	suvw1/SFEFVn5B/sT+kY4bDLyzyQrIMRwCAiFDioJ04Ks6QUo9D5WT3dqwuLvFs9Wc8EpBr2+o3
	DGDrtlJtmYxjbpG08aQtmkKAt8PPiunrleVb9StIP+4eUrhW6VyuB1bh55ISVjHPtQNxCFR+Eou
	H+Xm2T3KS8lf2eSkqVVbk6UBDQ8bzxt/uyg==
X-Google-Smtp-Source: AGHT+IH+e4l4aKUISAkDkWhELbFiMdLI/yWf42i3aNGaNUM7NHoqldoqBTm7FI7Nsal5lPBry54xSg==
X-Received: by 2002:a05:600c:3b8d:b0:45d:dba1:b4d3 with SMTP id 5b1f17b1804b1-45f21185db1mr1793415e9.0.1757608846269;
        Thu, 11 Sep 2025 09:40:46 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e037b9215sm29772365e9.12.2025.09.11.09.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:40:45 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: [PATCH 0/4] STi drivers cleanup
Date: Thu, 11 Sep 2025 18:39:56 +0200
Message-Id: <20250911-master-v1-0-5d5d5ea9af22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFz7wmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwML3dzE4pLUIl3TZNNkSwuD5LQkA2MloOKCotS0zAqwQdGxtbUAm0b
 bTVgAAAA=
X-Change-ID: 20250908-master-5c5c980cfb03
To: Patrice Chotard <partice.chotard@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1840; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=PGUYgHqS7CEbT5QLDYSKpf+raKUBoMSG/SoVXw8S0ZU=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBowvt4M6eCDUbwniAvFsl7B6c6vFEZGtq6YBW2O
 Qvzkm+meM2JAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaML7eAAKCRDnIYpo1BLC
 tVZAEACJnq8EfqnB4N/xnh4xaA6NCv1zk6Axys6t8WWk9pLoeMLamXr9+zsfJ8YLhn+sTHNNtuF
 vV4zgzpXaotV5kWh9URYwYedts569Z3slS5u4TS9p4UBeFnyQaUzJFouhtCipwApOL+ghTccmNl
 BqzTj0bVxgu1CK6l4HuK5l9ZlsyQulqDDHXAGQHsGkdOdjixtND3iUtORyCL5wkNWW1XaYtxPCo
 oKLie0xb044BtXbtiON85ojR0dg4XVLk+mbPwDBqODW/7HqUUQa2EjCpg16+elAA0WQYkDoh0zT
 IjIT9LtBPEP1tU/diotyKuiBfbVkgcLKSoyxViMPM83xd3sKpjsyHAVssWIEfPvvng+Sr8D1iKl
 mVWWTuJkSsY4zXqoTgzMwJxylBu0l5s+nVlhao1zocKmk/sY+ZLCIQIMjufXWUnDWaauEcW2Ymg
 SesDSlR4fHfrTWCRnD3sqKobAnR2Z8jTucUwtGEmppu0kpnbcaKrMoH68y8z0KQwUguF8Gt+EQ3
 SGCvmD7PC6Qdy5004D5nHQQh0MvEjCxHhzxe0C83qeZa1U92VQwevkPsK9qpvUsXWpdM1k++2QD
 wXD9mdOwb7iAVSQdjlD3/Lavsoi3Ha5bte93wUXWmXKALdfkPAkA1KcimgEq9pEytPQJRXZp+lP
 sy74W8wCLcmL41w==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

With B2120 board removal[1] several drivers are left unused.

Remove the following compatibles:
- st,flexgen-stih407-a0
- st,flexgen-stih407-c0
- st,flexgen-stih407-d0
- st,stih407-c8sectpfe

[1] commit dee546e1adef ("ARM: sti: drop B2120 board support")

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Raphael Gallais-Pou (4):
      media: c8sectpfe: remove support of STi c8sectpfe driver
      dt-bindings: media: remove support of stih407-c8sectpfe
      clk: st: flexgen: remove unused compatible
      dt-bindings: clock: st: flexgen: remove deprecated compatibles

 .../devicetree/bindings/clock/st/st,flexgen.txt    |    3 -
 .../bindings/media/stih407-c8sectpfe.txt           |   88 --
 MAINTAINERS                                        |    1 -
 drivers/clk/st/clk-flexgen.c                       |   80 --
 drivers/media/platform/st/sti/Kconfig              |    1 -
 drivers/media/platform/st/sti/Makefile             |    1 -
 drivers/media/platform/st/sti/c8sectpfe/Kconfig    |   28 -
 drivers/media/platform/st/sti/c8sectpfe/Makefile   |   11 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-common.c   |  262 -----
 .../platform/st/sti/c8sectpfe/c8sectpfe-common.h   |   60 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     | 1158 --------------------
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.h     |  287 -----
 .../platform/st/sti/c8sectpfe/c8sectpfe-debugfs.c  |  244 -----
 .../platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h  |   23 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-dvb.c      |  235 ----
 .../platform/st/sti/c8sectpfe/c8sectpfe-dvb.h      |   17 -
 16 files changed, 2499 deletions(-)
---
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250908-master-5c5c980cfb03

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>


