Return-Path: <linux-media+bounces-16553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E1959571
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 09:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C21881F22114
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 07:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6201A2867;
	Wed, 21 Aug 2024 07:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiZshHNQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D3C1A2857;
	Wed, 21 Aug 2024 07:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224301; cv=none; b=oG5uBU/yaz3cIL7QXgMzXWp1Zlap9ru1M+Gj/foYIfUWhVwRU0s8xcxkwSPPRZAilRc/OO99olQfI+XAtIIo34WIAOif/HnLek+SPUxCd/Rw/FNR7geZA1yvSU7WkR5ZW/A+Ya4rUi06KB87oL5oKexMtdPnbJnZFvhCsZEIdlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224301; c=relaxed/simple;
	bh=YRVI7X+aWXhMFoX6xbVxHa7XSddm4uGFrQ+rnbjz0/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l+rr1dt5uAxgQmuZ41LCXmkiv8q+H33MDTjKAqxSx6wW+dY3URNwEjFc2FUdGbw6APLxQx9oYuK8LmLBtgX50cVxjqzS1yLchtSHElGhezWdmjYlXoAmyUxbyIBVgaNh9yB/kWE2uUxm3mSxPj805ZiZqFNA3GMah5t4QoG/eFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiZshHNQ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7141feed424so732911b3a.2;
        Wed, 21 Aug 2024 00:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724224299; x=1724829099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6XHLEEVfKEFZbe4gHXKNE7btizZL5TxAufqI7CmlNpY=;
        b=EiZshHNQJZodJxNpHGSheckH8uwTm4YoRtI0UM26PhoFiQ1LF4qo4nJN3RpFKONZvF
         3AeU+lraohZKHi4dBeCSg5QmtoSRK1RqJivZp8lXteZf51U0jx3vgtTytqVI1clannUp
         2WVyzPyW60F/zMCVn9MVZllNSTkpoDQa45/M+iLaCicEOhh7dfg9hCS2RN0HUc+gT7Zs
         r6kLw6OG7ZOvo8J1Qode5b6fzV2pCfu9BZ7SWzK9C8BVGp8E9EHcqq1aYpJAetD9qWPu
         VE3behlflnRofPKRtIwxI9U42oA+nX6XGKua0rWAJyXr6Q1vq1D5/DjkOeQYnfkQvK2P
         lhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724224299; x=1724829099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XHLEEVfKEFZbe4gHXKNE7btizZL5TxAufqI7CmlNpY=;
        b=NIAjA5lprL03FICYPF+hFu4Avr2dVWKOcgsQpYJqbWrrsOFq3jjvGGtpnVQVGjsce9
         PLSGN7BqCENPTbCl2V2PdeiILAJvWlTp8k9D4qP3V5NRtWfYu9DpcpZBZ3nCfwn/SWIn
         IUMEVHlFrRhIXyGDOOKc4b1Vpve9kLQ0WDGjOYHLc3Z03wyF8IYUsn1jrM9O9DfLfXlV
         jOiiPI2NfEpiLx7lw8pKVddXN7O4bNXGoz2eNwmM1Ya3vP8qMcdRq195uyMq1vR/2lBV
         sNGgnYJLSahtHPaongYdZniKwC1Jf8Bsrp2XFPmNJh22tJcI4YQARZfKt8q84N3WlDlp
         M8mA==
X-Forwarded-Encrypted: i=1; AJvYcCUYUk/TOf4r6aByAr/jDvsnxRjGwlrzHx91CwfNiqA7nDFLfVl+UCcDMNYBUxR+d57d2Db5yoSMKlsa@vger.kernel.org, AJvYcCUbYSJ3FlDynNFYU2sNuXkrg9AZC4p/H4ZndVA0/Hx4CuMm/AhwYAX7J7lYZpBs3hAw+wzp/HCkvzXHINhb@vger.kernel.org, AJvYcCXErBCK62CXpXFMud109Hmh+tTvJ4d+zTheUNfwjdnQpDjtw9fpm7D8nwGWCGzOdJEO8FHwCj8ySRyJksU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztC7SI51nPk2veXOGPXd1ecsonk2u2oipM+kG8Mr/z4D4+kDaq
	APJxG4SR4uFJV5w8XTE/VFuZwPNUh/xTM+2Vmy5bEzRn+MEIbYkj
X-Google-Smtp-Source: AGHT+IEWYZZmObSXmhFGqh/x0J/CjMh4owQPA8Y+I+83N4QUD5z+ARl4awvtakKaj7C1gklfFrVd5w==
X-Received: by 2002:a05:6a00:915b:b0:70d:281d:ee78 with SMTP id d2e1a72fcca58-71423462324mr1665273b3a.10.1724224299489;
        Wed, 21 Aug 2024 00:11:39 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd8b631303sm526667a12.9.2024.08.21.00.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 00:11:39 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v3 0/2] Add support for nuvoton ma35 nand controller
Date: Wed, 21 Aug 2024 07:11:30 +0000
Message-Id: <20240821071132.281018-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35 mtd nand driver.

v3:
  - Update ma35d1 mtd nand driver
    - Release IRQ handler.
    - Remove unused functions.
    - Remove '.owner'.

v2:
  - Update nuvoton,ma35d1-nand.yaml
    - Adjust the order and remove any unnecessary items.
    - Add 'nand-ecc-step-size' and 'nand-ecc-strength' to the required list.
  - Update ma35d1 mtd nand driver
    - Fix coding style.
    - Use 'devm_clk_get' instead of 'of_clk_get'.
    - Use 'dev_err_probe' instead of 'dev_err'.
    - Remove 'pr_info' and 'of_match_ptr'.
    - Remove 'module_init' and 'module_exit'.


Hui-Ping Chen (2):
  dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
  mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |   93 ++
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 1068 +++++++++++++++++
 4 files changed, 1170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1


