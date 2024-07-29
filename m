Return-Path: <linux-media+bounces-15468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C019E93F89A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 16:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45D3A1F22718
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 14:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F4F155A57;
	Mon, 29 Jul 2024 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NliA7n3E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3041DFFC
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 14:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722264494; cv=none; b=AQq0hCvpDudu+EHo7tjGPGYo07T6fSUryng8XGrm+29DRy6su72U58pzec5kLE7iYC7MgEbORaYran0j2Q7DfgXA1b+R/hcJDuAqIpW++acaHQHCnlqh1MnbswL6zPA1VhOjpS96K+pSJ+vcF7W7wLk0o/ifi1wWx4UkTDBC90g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722264494; c=relaxed/simple;
	bh=ySWwjbdflwz6rIYs8Vpx3Qn+TK/ceOwnExEmWEHZ3+Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G8ghNSVVIMkX3UPX4/hcEY96RgnmuieA8gGtWEm82P+iDMSChQae3IS+ufCaFHa9cCJn8OqO1ga+M6zs7IPR91yxxQvzZxAxtpGajWqafTIJQXJdVWILGRUx/6jLZV1Mg5JiRsBMwirIMcIA/J3zqFCSOtFSIBxsUI8bY3Ecjjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NliA7n3E; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42819654737so12281205e9.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722264490; x=1722869290; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7VN27lnGUNsVwhKI93/YGx82K/xOtrW+XHUZkxMgX6Y=;
        b=NliA7n3EfM3D48Oc1FnCm7sOf1ZvnK29KKf4XGPehPfyiedYvKJCDnNLm0yf9DVKwo
         W2idXVoJdqRZVTlfES4U3r9+bDgcbnSP+sWeP8LtuMPJLi9tf6RacBjbBASDxjBATL8j
         TNj+EEqKmCxPbqTR5B1xQtEqyXvsNhOkSCBLQVt6xsLPwQYinlWxiqyJBuXT6FLPcZwA
         4XJqJzafy+o2wT3CCpi6KhXTvSFTXMUdqJ+0PYnscji4jpS2Bzlp+pHFBzHZV9evQsPQ
         2pBc/my3OBPLD9eDfVv05bWgyndu78ROhS/dsP8vh2AEXoPm8aEz+CX2SyDbVX44j6Fp
         yQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722264490; x=1722869290;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VN27lnGUNsVwhKI93/YGx82K/xOtrW+XHUZkxMgX6Y=;
        b=O3hmMz9mgofTWmwTVm1PYA+8ppMV6xCM4yjFGqEahk/cejvHGS7N2HFmpucUTa+5H6
         Yu47LXWgZWzKPIHlWcpKynMPZaczFKEdo9JFYA3MLpQQA6drCgmJgxcw2s3NpgCcmSnU
         MhkyJ8xTlOTfbcNlVler1PN0z/Ik32TInEotsA8+3HgAdZ0p+M1bSPFQWVi3VATN2mIz
         wEhJfcmHtbuoeYqpReJoGjgaRGTOnusa+w379FbdDClJAIBzCzdFBlIQ20hs++Hh3CGt
         3oOFCmF7MP7juGxT4PDABamm7ghbCoNgVYdaEvhpEcTxcL4+TXyW1RsSZcVCm1Ta6RcL
         1UAQ==
X-Gm-Message-State: AOJu0Yy77iaL8yU6IO6CmvLFtIvhGssju/EVkEKZUPk6nkY1QOBUttGS
	wnXbe/HVfu6eq+/tUI4sWZF33LNg+9yPyATeQ5I0okCgXN7CLT1ukODuVdJ82gw=
X-Google-Smtp-Source: AGHT+IGRl6/MNLY2ZSmQMwTK/Pc+WFeT2/juGGW0MYOhUlv5eI7dtyXMyHhwMeLTTvCkHpcOzEmo7w==
X-Received: by 2002:a05:600c:3511:b0:428:3b5:816b with SMTP id 5b1f17b1804b1-42811d6e2ddmr55999485e9.3.1722264489790;
        Mon, 29 Jul 2024 07:48:09 -0700 (PDT)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057b645dsm180091705e9.43.2024.07.29.07.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:48:09 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v6 0/5] Add Mediatek ISP3.0
Date: Mon, 29 Jul 2024 16:47:59 +0200
Message-Id: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKCrp2YC/4WNQQ6CMBBFr0Jm7ZhaKKAr72FYtGWQiUKbFomEc
 HcLF/Dv3k/++ytECkwRbtkKgWaO7MYE5SkD2+vxSchtYpBCFqISBeq2xWF6IUePOQqMH+9dmFC
 LWl+r2mqbl5DWPlDH38P8aBL3HCcXluNoVnv73zmrBKazexRZebkbvbzZBDpbN0CzbdsPq2hQX
 8EAAAA=
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

Changes in v6:
- remove unneeded "link" tag from commits

bindings:
- remove labels from example node
- remove complexity for phy and phy-name properties

driver:
- fix some comments from CK :
  - remove unneeded variables
  - rename irqlock to buf_list_lock for clarity
  - remove unneeded lock/unlock around hw_enable/hw_disable

- Link to v5: https://lore.kernel.org/r/20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com

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
 .../bindings/media/mediatek,mt8365-seninf.yaml     |  259 ++++
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
 .../platform/mediatek/isp/isp_30/camsv/mtk_camsv.h |  192 +++
 .../mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c     |  413 +++++
 .../mediatek/isp/isp_30/camsv/mtk_camsv30_regs.h   |   60 +
 .../mediatek/isp/isp_30/camsv/mtk_camsv_video.c    |  742 +++++++++
 .../platform/mediatek/isp/isp_30/seninf/Makefile   |    5 +
 .../mediatek/isp/isp_30/seninf/mtk_seninf.c        | 1576 ++++++++++++++++++++
 .../mediatek/isp/isp_30/seninf/mtk_seninf_reg.h    |  117 ++
 19 files changed, 3988 insertions(+)
---
base-commit: 99b9aaac4abdf30968b2ce9c9848951290fbde92
change-id: 20240704-add-mtk-isp-3-0-support-a08a978cac36

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


