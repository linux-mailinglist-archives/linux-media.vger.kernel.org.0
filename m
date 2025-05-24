Return-Path: <linux-media+bounces-33319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF32AC2F91
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 13:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB77A7B8F8A
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591511EB197;
	Sat, 24 May 2025 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IiOX/wh+"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505EA1E51EA;
	Sat, 24 May 2025 11:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087530; cv=none; b=fdb5jb9OqQpctk+5IXNkb7vr0FoE2hgPAM9HoaZN8R7AZQMF8YZykwu3XFN1NV02h2KUOO2paosEtAXRwXkiOhHr5oDRZdQObtuK7hD4P09+10UoBkf3Q21UiShjd21xEoL7JG3wcz08ebBWeOf2nOMLiAaii6tBXPSxO0EIKx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087530; c=relaxed/simple;
	bh=vvEShNy0WMcjGdNZqIfmzh+B8d0rIP9nKdvt8N8KCf0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PNyaX1Z0oDbyL/B/Hq6YlDEIiXcIIl82h3kQ8xdnS4v6m987Hr5MSzUEesgl+kAYs65mlQ0PQw0q8cFhqqnSpBQlDAxJrYmdvafowT2GbZgabzg392FRQIm5hq5e9QPWmJXg4IFXqik5Qb24jbutEP8MszNrgrZh09S3uUf0Tog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IiOX/wh+; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7a615c3a389511f0813e4fe1310efc19-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2uctqsBOVfw44286a8eWc49jMtIazpf2BUO8MAhx3po=;
	b=IiOX/wh+PWxF4m1N9XLBhDPnR2iySx25re6hWJ/9uOMoM4EL1pD/jVB4pXXw9t4kTVvsPpScSE+r2fJAoYkV37Bee7XFUoPaYiS8qYECEoma4rAWcBeIxI4Rp3/lVcoJnztd0ykgSJrLg2ug2eV5iMRmpXhziXo1vgrtPK6gsM0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b504a654-5cf1-45bc-855b-e6af9af319e3,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:51bb3bf1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7a615c3a389511f0813e4fe1310efc19-20250524
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 167223835; Sat, 24 May 2025 19:51:50 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 24 May 2025 19:51:47 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 24 May 2025 19:51:47 +0800
From: Olivia Wen <olivia.wen@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Olivia Wen <olivia.wen@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>
Subject: [PATCH v1 00/10] Add MediaTek ISP7 Image Syatem driver
Date: Sat, 24 May 2025 19:49:52 +0800
Message-ID: <20250524115144.3832748-1-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Dear Maintainers,

I am pleased to submit this patch series that introduces the MediaTek
ISP7 Image System driver. This series consists of ten patches that
collectively add support for various components and functionalities of
the ISP7 architecture. The patches include device tree bindings, user
API definitions, V4L2 flow support, LARB device integration, CMDQ
support, SCP support, and image processing flows.

MediaTek's Image System (ImgSys), also known as ISP Pass2, is a
memory-to-memory hardware device designed for advanced image processing
tasks. ImgSys includes multiple hardware components such as TRAW, DIP,
PQDIP, ME, and WPE.

- **TRAW (Tile RAW)**:
  Provides multiple downscaled resizers for multi-scale noise reduction
  and supports RAW/RGB format conversion.

- **DIP (Digital Image Processing) and PQDIP (Picture Quality DIP)**:
  Supports temporal and spatial noise reduction (TNR/SNR), edge
  enhancement (EE), sharpness (SHP), image scaling, and rotation.

- **ME (Motion Estimation)**:
  Supports motion estimation between consecutive frames.

- **WPE (Warping Engine)**:
  Handles image warping and de-warping processes.

ImgSys utilizes Multi-Frame Combined Noise Reduction (MCNR) technology to
enhance image quality.

Below is a simplified architecture of the ImgSys driver:
User -> V4L2 Framework -> ImgSys Driver
     -> SCP (It packages the hardware settings into commands)
     -> ImgSys Driver
     -> CMDQ (The packaged commands are sent to the hardware via GCE)
     -> Hardware

Thease patches are base on linux-next/master, tag: next-20250523
Thank you for reviewing these patches.

Olivia Wen (10):
  dt-bindings: media: Add MediaTek mt8188 ImgSys components
  dt-bindings: media: Add MT8188 ImgSys's LARB
  uapi: linux: Add MediaTek Imgsys user API
  media: mediatek: isp: Add V4L2 flow support for ImgSys driver
  media: mediatek: isp: Add the Imgsys LARBs device
  media: mediatek: isp: Add module operations structure for ImgSys
  media: mediatek: isp: Add CMDQ support for ImgSys driver
  media: mediatek: isp: Add SCP support for ImgSys driver
  media: mediatek: isp: Add image processing flow
  media: mediatek: isp: Add normal data dump flow

 .../bindings/media/mediatek,imgsys-larbs.yaml |   75 +
 .../bindings/media/mediatek,imgsys.yaml       |  180 ++
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/isp/Kconfig   |   23 +
 .../platform/mediatek/isp/isp_7x/Makefile     |    6 +
 .../mediatek/isp/isp_7x/imgsys/Makefile       |   25 +
 .../imgsys/modules/mtk_dip_v4l2_vnode.h       |  594 +++++
 .../isp_7x/imgsys/modules/mtk_imgsys-dip.c    |  162 ++
 .../isp_7x/imgsys/modules/mtk_imgsys-dip.h    |   21 +
 .../isp/isp_7x/imgsys/modules/mtk_imgsys-me.c |   65 +
 .../isp/isp_7x/imgsys/modules/mtk_imgsys-me.h |   30 +
 .../isp_7x/imgsys/modules/mtk_imgsys-pqdip.c  |  165 ++
 .../isp_7x/imgsys/modules/mtk_imgsys-pqdip.h  |   20 +
 .../isp_7x/imgsys/modules/mtk_imgsys-traw.c   |  120 ++
 .../isp_7x/imgsys/modules/mtk_imgsys-traw.h   |   20 +
 .../isp_7x/imgsys/modules/mtk_imgsys-wpe.c    |  176 ++
 .../isp_7x/imgsys/modules/mtk_imgsys-wpe.h    |   20 +
 .../isp_7x/imgsys/modules/mtk_me_v4l2_vnode.h |  386 ++++
 .../imgsys/modules/mtk_pqdip_v4l2_vnode.h     |  149 ++
 .../imgsys/modules/mtk_traw_v4l2_vnode.h      |  371 ++++
 .../imgsys/modules/mtk_wpe_v4l2_vnode.h       |  317 +++
 .../mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h  |  151 ++
 .../isp/isp_7x/imgsys/mtk_header_desc.h       |  129 ++
 .../isp/isp_7x/imgsys/mtk_imgsys-cmdq-plat.h  |  502 +++++
 .../isp/isp_7x/imgsys/mtk_imgsys-cmdq.c       |  690 ++++++
 .../isp/isp_7x/imgsys/mtk_imgsys-cmdq.h       |   29 +
 .../isp/isp_7x/imgsys/mtk_imgsys-dev.c        |  299 +++
 .../isp/isp_7x/imgsys/mtk_imgsys-dev.h        |  570 +++++
 .../isp/isp_7x/imgsys/mtk_imgsys-formats.c    |  139 ++
 .../isp/isp_7x/imgsys/mtk_imgsys-formats.h    |   72 +
 .../isp/isp_7x/imgsys/mtk_imgsys-gce_work.c   |   86 +
 .../isp/isp_7x/imgsys/mtk_imgsys-gce_work.h   |   37 +
 .../isp_7x/imgsys/mtk_imgsys-module_common.h  |  102 +
 .../isp_7x/imgsys/mtk_imgsys-module_main.c    |  187 ++
 .../isp_7x/imgsys/mtk_imgsys-module_main.h    |   17 +
 .../isp/isp_7x/imgsys/mtk_imgsys-module_ops.h |   64 +
 .../isp_7x/imgsys/mtk_imgsys-ndd_debugfs.c    |  342 +++
 .../isp_7x/imgsys/mtk_imgsys-ndd_debugfs.h    |   64 +
 .../isp/isp_7x/imgsys/mtk_imgsys-of.c         |   39 +
 .../isp/isp_7x/imgsys/mtk_imgsys-of.h         |   58 +
 .../isp/isp_7x/imgsys/mtk_imgsys-scp.c        |  349 +++
 .../isp/isp_7x/imgsys/mtk_imgsys-scp.h        |  194 ++
 .../isp/isp_7x/imgsys/mtk_imgsys-sys.c        |  556 +++++
 .../isp/isp_7x/imgsys/mtk_imgsys-sys.h        |   50 +
 .../isp/isp_7x/imgsys/mtk_imgsys-v4l2.c       | 1919 +++++++++++++++++
 .../isp/isp_7x/imgsys/mtk_imgsys-vnode_id.h   |  100 +
 .../isp/isp_7x/imgsys/mtk_imgsys-work_buf.c   |  113 +
 .../isp/isp_7x/imgsys/mtk_imgsys-work_buf.h   |   55 +
 .../isp/isp_7x/imgsys/mtk_imgsys_v4l2_vnode.h |  135 ++
 include/uapi/linux/mtkisp_imgsys.h            |  215 ++
 51 files changed, 10190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys.yaml
 create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_dip_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-me.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-me.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_me_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_pqdip_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_traw_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_wpe_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_header_desc.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq-plat.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-formats.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-formats.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_common.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-ndd_debugfs.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-ndd_debugfs.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-scp.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-scp.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-vnode_id.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-work_buf.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-work_buf.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys_v4l2_vnode.h
 create mode 100644 include/uapi/linux/mtkisp_imgsys.h

-- 
2.45.2


