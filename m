Return-Path: <linux-media+bounces-14636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6F5927740
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 15:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 271F51F23697
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 13:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06D51AED5B;
	Thu,  4 Jul 2024 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2xXxZlGy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231831AED29
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720100206; cv=none; b=LuCuwRDO0C1nQppyDYcvZ5/dBYT0+ZP/AU2MgZRtz+ZoHdWXfsXKxnH4Ozc4IP3tUo8uJ1JyenszMnTjk26SCNJ7h7BiWG4TlO/cPFYRiwrZyd4Dc3YLohVe9lWf8ewcN0rt5c544QEerIPwqD3ZQpCT0ySlgqxBtoAf8/QVv48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720100206; c=relaxed/simple;
	bh=5BBSDi8TvQ9AY5QuY/Aj2OoWuzfPdYtoGL+k8OgWvEY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eMc2gECqYaGo0COhGgoMtLkwrwhrmom05B7c7swO1nKYD/trJDAVfL0jJlX1t01DCFIaoxuBweVNXYvGvHZywXcRhAbogIJwshV35T2iYYClY2oBsIGqK/N6JdJBjBjxd0jpTEH1xbQDL1a8Al9/eobFvAyNsHhcc2LNb+OHHNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2xXxZlGy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-425809eef0eso4218835e9.3
        for <linux-media@vger.kernel.org>; Thu, 04 Jul 2024 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720100201; x=1720705001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HmDEGcYVnqW29UdeleiXLs3oBwwnPw6cUkNXeZbqtPw=;
        b=2xXxZlGy4rBpkkmQ/k7hkXjOKZzuKHVn4TwdqrBQYoRBZbssmlE1xEerEdQYyRksZB
         rjyC131x0zFFhZmfCu5vFiCpVggNbfy+D4Uc9JVuqWrRBZqz5HHS02U2fOAeguVWKacv
         ZT93KeiQFwWDLO8opOHFVzQ49C5RjuEA2LoD1dlzrlw+VyVQ6B4iasiu+1O6I3dJTUw2
         PncAYjU9TBtknfPhlwRI/VJQ4jI0EuSFPdoA3JD7LIlVjryEUUpuvznRRwW8/bO4Bl96
         IAZczWeN/uNPePM79++2UBAAIzVXiIRBzS398jGehwh0N202Egbo+UuwAk/cpCylkHEE
         /zUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720100201; x=1720705001;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmDEGcYVnqW29UdeleiXLs3oBwwnPw6cUkNXeZbqtPw=;
        b=PXNcysFjmXMTY2WfDiHZj+nfyCh3X1MWiSe2/mX1wdzB0D81pIQjMUnHFGnn2lSJXr
         xn4mqWAQSkhNiwIVQEDF0ILJ6E48bQRdkmjyt2BoVcpV2YybKdIgLblRwV9X3skSBKBU
         rJgksqANXgboD48irOq9gChIQ+BSI1wXFslj+IbdGL9dVVeRMIypBO4/l1Csmp2kP5Ea
         LR8nuRdHi4IoUC2Udcm+BusaWVLRKgWfmsKctIGSjUWXkIS23WPdDKhkGUMv0Q0idlRE
         3NI3xQAJ/oyI1NnTv5pY5YbzKDiokLMSxy7P5lW2x+Un2CK2twNZd6Wsb9Z6Tro23Zjs
         zY9A==
X-Gm-Message-State: AOJu0YxZuVHe/0hSg7+8QytLMl4O4CM7MdLy4lxs0rIsthnLEneTsa7o
	7sckn24gsvK/DvW3Iw1wofaEmz5E5O/hiso/9o2ph3Nfmqn72+2cwNPBjO9YVbM=
X-Google-Smtp-Source: AGHT+IEnwsl0E+g8xdryhGuWa8dY3VAhuYEKnIZxskaLPzsW6LR0drF4Cil6yfo52blmMWh71oq3DA==
X-Received: by 2002:a1c:4b0d:0:b0:424:a2ad:69a with SMTP id 5b1f17b1804b1-4264a3e877fmr13123835e9.23.1720100201352;
        Thu, 04 Jul 2024 06:36:41 -0700 (PDT)
Received: from [192.168.42.0] ([2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2ca5d5sm25382025e9.30.2024.07.04.06.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 06:36:40 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v5 0/5] Add Mediatek ISP3.0
Date: Thu, 04 Jul 2024 15:36:39 +0200
Message-Id: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGelhmYC/x3MwQqDMAyA4VeRnBcI6rTbqwwPoY0axrQ0KkLx3
 S07fof/z2CSVAzeVYYkh5quS8HzUYGfeZkENRRDTXVLPbXIIeBv+6JaxAYJbY9xTRsyOX71zrN
 vOih1TDLq+T9/huu6AaTgnvNpAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Julien Stephan <jstephan@baylibre.com>, 
 Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>, 
 Florian Sylvestre <fsylvestre@baylibre.com>, 
 Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.13.0

This series adds the support of the Mediatek ISP3.0 found on some
Mediatek SoCs such as the mt8365. The driver is divided into 2 parts:

* SENINF: the sensor interface
* CAMSV: this driver provides a path to bypass the SoC ISP so that image
  data coming from the SENINF can go directly into memory without any
  image processing. This allows the use of an external ISP or camera
  sensor directly.

The SENINF driver is based on previous work done by Louis Kuo available
as an RFC here: https://lore.kernel.org/all/20200708104023.3225-1-louis.kuo@mediatek.com/

This series depends on the following series for the phy [1]

Changes on v5:
drivers:
- rebase on 6.10-rc1
- fix various comments from all reviews (mostly style issues and minor
  code refactor)
- add a function to calculate the clock divider for the master sensor
  clock: NOTE: setting this register seems to have no effect at all,
  currently checking with mediatek apps engineer (OOO until 17/04)

bindings:
- camsv: update description
- seninf: fix phy definition and example indentation
- use generic name for node example

dts:
- sort nodes by addresses
- use lower case for hexadecimal

Changes in v4:
- fix suspend/resume deadlock
- fix various locking issues reported by Laurent Pinchart on v3
- run LOCKDEP
- add missing include reported by kernel-test-robot for non mediatek arch and COMPILE_TEST=y
- use atomic poll inside mtk_camsv30_setup
- drop second lane support as it was not used
- remove useless members in structs
- fix media entity initialization
- initialize correct pad for camsv video device
- add isp support in mt8365.dtsi
- rebase on 6.7

Changes in v3:
- fix a lot of formatting issues/coding style issues found in camsv/seninf reported by Angelo on v2
- fix camsv/seninf binding file error reported by Rob

Changes in v2:
- renamed clock `cam_seninf` to `camsys`
- renamed clock `top_mux_seninf` to `top_mux`
- moved phy properties from port nodes to top level
- remove patternProperties
- specify power management dependency in the cover letter description to fix
  missing include in dt-binding example
- change '$ref' properties on some endpoint nodes from
  '$ref: video-interfaces.yaml#' to '$ref: /schemas/graph.yaml#/$defs/endpoint-base'
 where applicable

Best
Julien Stephan

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Julien Stephan (1):
      arm64: dts: mediatek: mt8365: Add support for camera

Louis Kuo (2):
      dt-bindings: media: add mediatek ISP3.0 sensor interface
      media: platform: mediatek: isp_30: add mediatek ISP3.0 sensor interface

Phi-bang Nguyen (2):
      dt-bindings: media: add mediatek ISP3.0 camsv
      media: platform: mediatek: isp_30: add mediatek ISP3.0 camsv

 .../bindings/media/mediatek,mt8365-camsv.yaml      |  109 ++
 .../bindings/media/mediatek,mt8365-seninf.yaml     |  275 ++++
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |  125 ++
 drivers/media/platform/mediatek/Kconfig            |    1 +
 drivers/media/platform/mediatek/Makefile           |    1 +
 drivers/media/platform/mediatek/isp/Kconfig        |    2 +
 drivers/media/platform/mediatek/isp/Makefile       |    3 +
 drivers/media/platform/mediatek/isp/isp_30/Kconfig |   35 +
 .../media/platform/mediatek/isp/isp_30/Makefile    |    4 +
 .../platform/mediatek/isp/isp_30/camsv/Makefile    |    7 +
 .../platform/mediatek/isp/isp_30/camsv/mtk_camsv.c |  327 ++++
 .../platform/mediatek/isp/isp_30/camsv/mtk_camsv.h |  196 +++
 .../mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c     |  413 +++++
 .../mediatek/isp/isp_30/camsv/mtk_camsv30_regs.h   |   60 +
 .../mediatek/isp/isp_30/camsv/mtk_camsv_video.c    |  750 ++++++++++
 .../platform/mediatek/isp/isp_30/seninf/Makefile   |    5 +
 .../mediatek/isp/isp_30/seninf/mtk_seninf.c        | 1576 ++++++++++++++++++++
 .../mediatek/isp/isp_30/seninf/mtk_seninf_reg.h    |  117 ++
 19 files changed, 4016 insertions(+)
---
base-commit: 99b9aaac4abdf30968b2ce9c9848951290fbde92
change-id: 20240704-add-mtk-isp-3-0-support-a08a978cac36

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


