Return-Path: <linux-media+bounces-16459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2681C9566C4
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 11:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45B311C21815
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 09:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A2315D5CF;
	Mon, 19 Aug 2024 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RN4XCMA4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B74715CD79;
	Mon, 19 Aug 2024 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724059244; cv=none; b=LCINbLpN41876ewe+f0bcg2ihqnRhOALfkJcNkEtJHhj7Ivq/I/w/gCgoC9ifrpW+UwENIGQ37HWv8D/Xtb0Ud2RUhLUDkz0wyv1zoxukFouIsg4VrhXIT3TdXwrXna/wgjuaI2FCr2ZmBRHHkCTD4/8zypCb8QlA9gjDcjyyU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724059244; c=relaxed/simple;
	bh=g0mPMURxP1/TdNiBnVUvRcKoHGetiGWMLeSPDcGIDS4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sSoOKpzQ03eOLnJBMQoBSoHgQ0kV2dqH18kh1HRYy/MTFGA8SGaIzsdQL9fUB0gUSOk2AYv10Zpgw8nRGxopwp6Z7FOOzQp5ZxSGJj1dqN6lnqeDqAPiWQubaoxdPHVjyu4JDhvtnvyJcH4xaaylpoZIysKWUUZIQKWqfAlK3CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RN4XCMA4; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d3d662631aso2666190a91.1;
        Mon, 19 Aug 2024 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724059243; x=1724664043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nbobm+SvJn90B7VhyfLGtuxVw/Xxjzt17uREQeGl98o=;
        b=RN4XCMA4OjlITjvGIu5bzysFGAZkB2BAdCHCjEJKiCsVcKGK2lxmC/jJhvWoCDwi+F
         CpvsgtfiPAKNPoNj1a2U1OW7D9wihgbBRIW3YAZAH3NuNAL7SJFsDcsa48YDo2JfowYc
         kym8A4RRAFaLYzOevE6bqEStkcQ9UpGkm5P8B2h3SWzWKLCdWAl+NMlUsWzFs3UZ1kjC
         EJTT/6oAr4u/5fkWKNM/b4emdnHlpt3jzXHijb/Zq6lBelF2rMKyKksGeiggg1D100ns
         UZv2jXy6m0KigU5WwPx7AZ4iaCGVxCIvmXC+mRXIDsoyXqBI2G/P2RfyJ0wM7WNY2VND
         bvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724059243; x=1724664043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nbobm+SvJn90B7VhyfLGtuxVw/Xxjzt17uREQeGl98o=;
        b=Wqlq9py5m9gLb1Wjb1PD4y6EF6vOaWVOIUMbzIQbB5Snc23FgkG7yJhu6fLpwy4+w7
         rmJsLm3DldbEnDxklCV3Y4EADDEALE/ayyZ2Cx+js7Mwwm45rzhyIg3NGh7kNO/u372/
         Zaj3WRIITblKRlEWcBBo3Ee8eekgkjQfSO0vPZjQUwLae9mq0C2fZHE6rZ3Mnoe1VgEK
         DuNdK0wWHkDQNxz3BluvyE3BbZjveRlpWeTCK89wE9DaHWqHql3XTyEoFBjowZ7X9eSa
         SAoInDra9hIjziOzkNJIXEwuhqn+WX9/91rFTBY2gwlUiqKilZQzA/6x5RAeAm62scQa
         y+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCNJWmEGw1l6ZqlERuw1YoXfx4AOsQ7L8UCBq8iQsxbK1lB6PzmjY9DmTeCKSNgEg2lj3WL00miJYj0y6u@vger.kernel.org, AJvYcCUgE/koVx22RJCNJR+I7JrvfE1tn9VIHV4fMUyzum0C/Hq4aBcQfl86AcKZTLum2H9mfDKGCWX8bYlZ@vger.kernel.org, AJvYcCVmdIer8K6aYkuSglP61DOSIjirFfZlrDh20WbsVfDA4iNiASSmquzZZiay23Tno/Y1YynyTlFAEHpJuJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Am0R83RqDZrZRBOX7IijbxQr4T8cPiZfVAUiyEk2GhTQnY16
	gp1YC9xgYJpaTdtw9JL/ir170hhNOKfW5ABOFE9AscKjrZaWbMhp
X-Google-Smtp-Source: AGHT+IHDa/2IA2Yd+H2It0zLuwLh7wv+zRrgCvpU/eheNHrt2fXxv3jnNWn//LpF09xkmOdVGCrL0w==
X-Received: by 2002:a17:90a:fa06:b0:2d3:da99:b41b with SMTP id 98e67ed59e1d1-2d3dffc6078mr10004128a91.17.1724059242482;
        Mon, 19 Aug 2024 02:20:42 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e3d97f2asm6750538a91.53.2024.08.19.02.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 02:20:42 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add support for nuvoton ma35 nand controller
Date: Mon, 19 Aug 2024 09:20:35 +0000
Message-Id: <20240819092037.110260-1-hpchen0nvt@gmail.com>
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
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 1070 +++++++++++++++++
 4 files changed, 1172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1


