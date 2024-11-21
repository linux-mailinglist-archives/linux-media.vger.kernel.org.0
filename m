Return-Path: <linux-media+bounces-21723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2198A9D4936
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 09:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D38A2282DE4
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 08:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9B81CB322;
	Thu, 21 Nov 2024 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OHpv3M/s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B6782890
	for <linux-media@vger.kernel.org>; Thu, 21 Nov 2024 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732179201; cv=none; b=NdZY5wv6N/Du5VMwv/mWwY1cj5LDGKtMZJPgfuIoIMzK+SCoNCbYDQbPGwFA2rL12kEelqgMXez2/n690iPFRC3F8Uozn+uTRNcpwO0WRV8NrAPjokiJoZXK1J1yh7PMqVaNgwvy7OFldk5BRv0EeiqyA/qWw8dn/uaGg1uY9Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732179201; c=relaxed/simple;
	bh=RVthPaOFUFAyNDfWX0Ae/vkAX2xGQtPjbnfsX0e3Ol0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hq0TEhyrviHRWNhZy1FwawVxC2/8fbdYBg8csZ+zo55zoIVWmOswdJ+qweO4re2cdy1exfY5ayNzd5dvgXwY9EJ5c7lUAhDuz6RA18WpQNk4XD/LqZYE/EJFrFbTXaNiZDTqrY61HD1pkqqnTttYhjqO+lRnTb9xbZjnl8UzvWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OHpv3M/s; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3822ba3cdbcso446927f8f.0
        for <linux-media@vger.kernel.org>; Thu, 21 Nov 2024 00:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732179197; x=1732783997; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGgcMQOyoNutpsDucpx7WNm5gsRWQCIIP5hQUFlLet0=;
        b=OHpv3M/spAY48/9qvcmrp/kyKnlEUXpX8C7Y8D3EbCB3hax3Unf5hTmL0bpEWVNKsq
         vIPeKYY2CYR+v2HpQcvcV3ND2QrSlTguNXXjR0f54+JJpUx0MiQKO31Ug6LGGOi5gPIB
         MquFotLo/nJh9EInW5HIl6BCdyQZR1lTLz4q7VNJVIaouPe7w9YOKq7j7yapP4muakvE
         Fg7pdXE5feN/NG9oEER0IfJWfohSfNaxDLc+dN/gHsntwpLBNTfoNMhPNVYKozlQtHnq
         uPFWF8lFMUzlqMdy8kCMx3XSKsYGYJevAmQCXgcjbyiWNAVDkkSFjFazb+qd+QK0O6W6
         wNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732179197; x=1732783997;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGgcMQOyoNutpsDucpx7WNm5gsRWQCIIP5hQUFlLet0=;
        b=b38R/x8lfFcnFdg1uXfTuym7VvsaEexVY7ZoDwsFco/dYUgLTga6iz30+yatx60+pi
         lLDLiLmnd+SCTgwCcFP1oQLJey3qkGTuTAXgKyvFrNFQyP/ccn1AF3n4KXGxK+ZgT25y
         v06Cz5EhJRPuPUM9Tk27O/3DdIH5YPDmtoPUniUdbTacn3QLLrWbQCLnqyrXvH94kKB9
         XJ9EkEOW3Sue37ckgskUvq0j8gH7XEAG7hAtUx1ThFCayzOdBn8tjskLbSLD8ulfCNCq
         U4iUYTa84nu90YkG+TgwGM8rR/ERHNCRdjcLwQgy8nCL20BCnT5K4i1SJmONUh15GhH7
         Ikfw==
X-Gm-Message-State: AOJu0YyBekgTS6zS6gHZyUf+bc9qgvln/jxwDC7jW/iMK2XLIbVb6X3C
	8EYxXrGTtO8sfk5yQDw8pjPg7NOgfnQbxaH3TMnvLyL8+Akau7i9KVBn87UZ/ag=
X-Google-Smtp-Source: AGHT+IFAFaehgq7cVhvvJuZ5zckDS9xKRaW5l8I8upDHgvwQgsaiHiJYFMDXc+q7s2hhmQYqh9r+Dw==
X-Received: by 2002:a5d:5849:0:b0:382:4c36:e072 with SMTP id ffacd0b85a97d-38254afab8cmr3715943f8f.30.1732179196734;
        Thu, 21 Nov 2024 00:53:16 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382549111fdsm4219900f8f.58.2024.11.21.00.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 00:53:16 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v7 0/5] Add Mediatek ISP3.0
Date: Thu, 21 Nov 2024 09:53:14 +0100
Message-Id: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPr0PmcC/4XNwQ6CMAyA4VcxOzszB2zgyfcwHkYp0ihs2XCRE
 N7dwcmYGHv7m/TrzAJ6wsBOu5l5jBTIDin0fsegM8MNOTWpmRQyF1rk3DQN78c7p+B4xgUPT+e
 sH7kRpal0CQYyxdK189jSa5Mv19QdhdH6aXsUi3X734xFirqFdQoEeTzXZnpQ7fEAtmcrG9UHJ
 avflEoBmc6hQgFKyy9qWZY358tdBQwBAAA=
X-Change-ID: 20240704-add-mtk-isp-3-0-support-a08a978cac36
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
X-Mailer: b4 0.14.2

This series adds the support of the Mediatek ISP3.0 found on some
Mediatek SoCs such as the mt8365. The driver is divided into 2 parts:

* SENINF: the sensor interface
* CAMSV: this driver provides a path to bypass the SoC ISP so that image
  data coming from the SENINF can go directly into memory without any
  image processing. This allows the use of an external ISP or camera
  sensor directly.

The SENINF driver is based on previous work done by Louis Kuo available
as an RFC here: https://lore.kernel.org/all/20200708104023.3225-1-louis.kuo@mediatek.com/

Changes in v7:
- fix several comments from Laurent Pinchart and CK about style issues,
  such as: sort Kconfig and Makefile alphabetically, remove unneeded headers,
  use 80 char limits ...
- add back I/O accessors around readl/writel
- use enable_streams/disable_streams instead of s_stream
- use v4l2_subdev_init_finalize and don't store active format
- remove mtk_camsv30_regs.h file to merge it inside mtk_camsv30_hw.c
- adding reviewed-by tag from robh and angelo
- implement .has_pad_interdep callback to fix multistream error
- fix mtk_seninf_get_clk_divider to give the correct pad number. This
  caused an issue for multi camera
- use hardware FBC (framce buffer control) instead of dummy buffer to
  deal with underrruns
- simplify directory architecture and remove isp_30, camsv and seninf
  directories

- Link to v6: https://lore.kernel.org/r/20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com

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
      media: platform: mediatek: isp: add mediatek ISP3.0 sensor interface

Phi-bang Nguyen (2):
      dt-bindings: media: add mediatek ISP3.0 camsv
      media: platform: mediatek: isp: add mediatek ISP3.0 camsv

 .../bindings/media/mediatek,mt8365-camsv.yaml      |  109 ++
 .../bindings/media/mediatek,mt8365-seninf.yaml     |  259 ++++
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |  125 ++
 drivers/media/platform/mediatek/Kconfig            |    1 +
 drivers/media/platform/mediatek/Makefile           |    1 +
 drivers/media/platform/mediatek/isp/Kconfig        |   35 +
 drivers/media/platform/mediatek/isp/Makefile       |    9 +
 drivers/media/platform/mediatek/isp/mtk_camsv.c    |  275 ++++
 drivers/media/platform/mediatek/isp/mtk_camsv.h    |  170 ++
 .../media/platform/mediatek/isp/mtk_camsv30_hw.c   |  539 +++++++
 .../media/platform/mediatek/isp/mtk_camsv_video.c  |  701 +++++++++
 drivers/media/platform/mediatek/isp/mtk_seninf.c   | 1636 ++++++++++++++++++++
 .../media/platform/mediatek/isp/mtk_seninf_reg.h   |  114 ++
 14 files changed, 3983 insertions(+)
---
base-commit: 00873e6fe91b77e9bbc82012fe6103080066fbfc
change-id: 20240704-add-mtk-isp-3-0-support-a08a978cac36

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


