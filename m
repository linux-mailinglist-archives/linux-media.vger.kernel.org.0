Return-Path: <linux-media+bounces-25138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD08FA19323
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 14:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A4BE7A2AE1
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 13:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA17214203;
	Wed, 22 Jan 2025 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PwVCmiJB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512E4213E6C
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554357; cv=none; b=YUYy7oKFK31RyuohkrLlAhspnoxlCtLdo28HQX1dIpdf70OGYtoLUi5SAZhtp+XdGe56hQNa8tVAO5Mn9Cbcs8fdzNAB1WBBnakXhgILvDFgWwDwMJ/He6//MqXeu4fgfpUGsT0YMU2RdfCmGSjKBF4gKlYEXvX5UwYf8WK9xkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554357; c=relaxed/simple;
	bh=ob4HxZ0bC3ayi8oRbNy5QXvP29My3cf/b3Pb9js8qIY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nLMUUyrMJqqUMv7L+ypRDfK4X/o4HUtOJOnKzzsuxN5o4RJw0bfSVwW663ktp7RzJ+bS87PHeIMynTb1qTMaIHK/MepzcQFB1G7LlMb21PZANlAvo0X8adHhyc4PTZTf8GWb07r7DIDmZvlCToee19rB6ghQgxyRsgE9JbHBvDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PwVCmiJB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso3702779f8f.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 05:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737554352; x=1738159152; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GCK1JKe2ZK0bAyJjP9ZoAIohmsbMcH2iCBmdiLRqWmo=;
        b=PwVCmiJBnuiGVcM0b43mlCtsFd8YjMo9F+Yk7IOH0OpEtvLZ5B1Rn1FM4siDz19gNo
         6h2QGEj+sVtm38UEjDzAE3MUJJwPPsPnoohFSw8Cw3XxCxb5v0C6RHdoy7lu1gqrcX5J
         xXh62TnQaq2pKWMCryRmk1V+Hdt84RHqmNRXHJKuEVEHWdyeHUwRMITua9z4RuCNncbB
         dp/2OmmtrjFezsxwJzZPi1rO/51zZi8Kpy2AT2B8SvdihSBjnAHU+PXbbJhhZakdETaa
         vTfE7ssPzfah4bCVZoB5rWhKh0dS0f0eTQdmfsFh960u4MbDDQfxAcNYdBpFn0JTxAW5
         RQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737554352; x=1738159152;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCK1JKe2ZK0bAyJjP9ZoAIohmsbMcH2iCBmdiLRqWmo=;
        b=tdKnP96ULpd1plzzTj2G1MaYnfwLXvgCh2qqbDjXQrWiiBjYWdn25SRlOjkrdTlDis
         0uggBjUJop56euwZ9ghp9901occtF9ulXRGrfadOeCeY6Tf1khLeNsvv8BRuQYk2Xx7r
         5wxO+SwAz9YUQy5Tz/5MAJ7D9slhjdAxAvNjAGh1B+9G/8/BdwevvoolVZzUO6nIPbAl
         MDgeWlXVKcTMhCBAibw7OwSgtIg1aWNqqGtO+OdntmbrCfT4tjIukbKOBPwp26dLGQ7T
         pDKw12HsDCcBlIJ/7Rduyc65zIJQkdaL6FsILseTs2hgf0cXbssdHPhyVItC0mrcyWxm
         qFaw==
X-Gm-Message-State: AOJu0Yx/wChKhbp5WRbBEVGFjlyjNo8Ufj7mYXmGau2dWNKJjrvOd4Gl
	+oaMudwO7gaTx/2sH9uJ2rEahfO1hMiqkEJtHL+MABShxvJ3SYuN1FReTkUbzkM=
X-Gm-Gg: ASbGncthWurw9SdEWXUUA5h44iN3KEVAauGE7fOeogkaLdQUtoo0pAdIdjbYPAJCxlR
	ln0ifGB360kUYQXg+mBud6X0aCxCjBQGn4iaPkFFb+bF5jUBTlneYpiJL9M56D+nNUjnCiobyO7
	neciSs+a1Q3xRAyabvdd+dhQQb4F57VlWN6ajUWgY31cdL0hBBAfH0OT6a3WDM0eNE4WkEZwx40
	TmOFRWYjhgUDbIHS8PRTrSR7/z0Q7M1a6LUMVlQEnXx7zDqCsfg7OZV3qfUvvunPs4u4nlv/cAa
	qEX9HV4Nf0Wimk8TT2XNPAd9znbyxS25zKIOnjOCZmYDFEcv3KvC4n1x1TPqHFAZYsiVbAa4/Mo
	=
X-Google-Smtp-Source: AGHT+IHWF3nO5p5fYa1wUcc11MSGstbqFgrOBJA9XIo/6RP2eDA4+qf2JAiaGGM9QBwZIAEKJMGZEg==
X-Received: by 2002:a5d:5f4e:0:b0:38a:9f27:82f2 with SMTP id ffacd0b85a97d-38bf59eff10mr21554379f8f.49.1737554352559;
        Wed, 22 Jan 2025 05:59:12 -0800 (PST)
Received: from [192.168.42.0] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3278f06sm16418985f8f.70.2025.01.22.05.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 05:59:12 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v8 0/5] Add Mediatek ISP3.0
Date: Wed, 22 Jan 2025 14:59:09 +0100
Message-Id: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK35kGcC/4XO0Q6CIBSA4VdxXEcDRJCueo/WBR4wWaUOzOWc7
 x540VrLxd1/tvMdZhSsdzagQzYjb0cXXNfGKHcZgka3F4udiY0YYZxIwrE2Bt+HK3ahxzkmODz
 6vvMD1qTUSpagIRcobvfe1u65yqdz7MaFofPTemgs0vS/ORYxqhrSKywweqz0dHOVt3vo7iixo
 /igmNqmRAzIJQdlCQjJflDyTVHK6DYl068IN6AEJYKqL2pZlhe+U5X4VwEAAA==
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

Changes in v8:
For the whole series:
- rebase  on v6.13-rc1 --> drop iommu_present and use device_iommu_mapped instead
- apply new trailers
- fix several coding style issues reported by Laurent and CK
- fix warnings and errors reported by media-ci:
  https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/66966282/artifacts/report.htm

Camsv bindings:
- sort header alphabetically

Seninf driver:
- remove test pattern generator, as it was legacy untested code
- use v4l2_subdev_enable_streams/v4l2_subdev_disable_streams instead of
  v4l2_subdev_call(s_stream)
- simplify mtk_seninf_v4l2_register: correctly split the media device
  and seninf subdev initialization. Create an seninf_subdev_init
function and drop mtk_seninf_media_init which was confusing
- Fix several style issues

Camsv driver:
- remove the "30" suffix: renaming camsv30 to camsv (file name and
  function name)
- add comment to properly describe the fbc mechanism
- reduce spin_lock region in isp_irq_camsv function
- remove pm operation from mtk_camsv_fbc_inc
- call mtk_camsv_fbc_inc at the beginning of streaming or only when
  streaming: buf_queue touch the hw only if streaming
- remove op_lock and rely on the video device lock
- implement .link_validate() and drop mtk_cam_verify_format
- use video_device_pipeline_start instead of media_pipeline_start
- remove useless stream_count counter
- add various defines for constants
- merge content of mtk_camsv.c into mtk_camsv_video.c as suggested by CK
- merge mtk_cam_mbus_formats and mtk_cam_format_info intpo a single
  struct, and extend it with fields to remove the fmt_to_sparams() function.

- Link to v7: https://lore.kernel.org/r/20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com

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
 drivers/media/platform/mediatek/isp/Kconfig        |   36 +
 drivers/media/platform/mediatek/isp/Makefile       |    8 +
 drivers/media/platform/mediatek/isp/mtk_camsv.h    |  152 ++
 drivers/media/platform/mediatek/isp/mtk_camsv_hw.c |  440 ++++++
 drivers/media/platform/mediatek/isp/mtk_camsv_hw.h |   19 +
 .../media/platform/mediatek/isp/mtk_camsv_reg.h    |   90 ++
 .../media/platform/mediatek/isp/mtk_camsv_video.c  | 1017 ++++++++++++++
 drivers/media/platform/mediatek/isp/mtk_seninf.c   | 1454 ++++++++++++++++++++
 .../media/platform/mediatek/isp/mtk_seninf_reg.h   |  114 ++
 15 files changed, 3834 insertions(+)
---
base-commit: 414788dae5ac03f80234629c6d140a38fb1fbf9d
change-id: 20240704-add-mtk-isp-3-0-support-a08a978cac36

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


