Return-Path: <linux-media+bounces-7596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DCF8868F9
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 10:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 729572870CB
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 09:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA6C3E47B;
	Fri, 22 Mar 2024 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a5QMxR3O"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAC6224CF;
	Fri, 22 Mar 2024 09:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711098766; cv=none; b=Zto5X7X6OnKspzP+6p3ISWGSjm3QkqZKPGCvUGFBwcIfiVLU3JyM9tcvsDy6kiiWT37cweUZTX2AkKAFtiIdD0mlidHGnr1XnRn7VCH3HxvjMgPxu4uqfYbmKQI7Z/U+HP/M/8GBV+SK0gtpO0QUxEkrsLzFz6qYiKuGU6zMOGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711098766; c=relaxed/simple;
	bh=z2ZaLm52MTZ/6IxJzuG5Bzu3c/lyqbb4ISrKxikSWZg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y28vy/QW5hN4tKlDEjYYtAY7S6tOX3HRCqf0pbjgv2MBh57xfhIEm4sEAeqePWxqead0uDgxT3d07cbXQu2JnrMTAmG3izDnKoUBfLnc/1IcP0aslcSm+WPdow0v0pU3bsNrmKhvrEp1Ib6zy3p5V7bcDzzIJRRZ3eGx4saVGjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=a5QMxR3O; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5232a530e82c11ee935d6952f98a51a9-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=D90IpDuiRkZ2VElRCOSMl6WQG52MAQH00jESrYAeQLQ=;
	b=a5QMxR3Olhbb/PDdfEBe5ifvDTCnjqnwD/pPBq6wZ0iVJno8ETGShSZQVZ1f9br9Rd1SJdpNCs7No92PyswixDCZLvaY+hS7Cfiaiqe8Vn75NpY8QwQhilS0ynJdPN42OVx5OAqJVI/fwNXogZXx2JUpE44GDu61e2PKddmFIVY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:c6dcfcaf-b856-4b63-b639-ee2482826dd5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:7347b690-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5232a530e82c11ee935d6952f98a51a9-20240322
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 289813932; Fri, 22 Mar 2024 17:12:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 17:12:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 17:12:33 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v5 00/14] Rename mtk_drm_* to mtk_*
Date: Fri, 22 Mar 2024 17:12:18 +0800
Message-ID: <20240322091232.26387-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.176100-8.000000
X-TMASE-MatchedRID: llTo18AJfvE/5uXNh96gfjl/LoO+pjoA1cuIRwt/4Mjb6Y+fnTZUL80U
	/azwU24yYfroVIh1m0C4hZmY35M3T0FKjjgcgwapaK+MsTwM+1mH7D1bP/FcOjRCaZSKE/Os4+n
	0olV+QL9dLrRNHKRnTPYqYU8vzTMop11fUZKoS3wD2WXLXdz+AXcF/0kiqyh4WEBoeOCrJbXnU/
	zlxreh3uLzNWBegCW2wgn7iDBesS28QIu4z6HhEH7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.176100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	8A0A66182036D317C5888BA94D5703FDE618A200F98EA02E9DCEEF6437B83D4F2000:8
X-MTK: N

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename some unnecessary  "mtk_drm_*" to "mtk_*" to:
- Lower the matches when searching the native drm_* codes
- Reduce the code size

Changes in v5:
- Fix typo in the commit message

Changes in v4:
- Fix patch error

Changes in v3:
- Fix typo and patch error

Changes in v2:
- Sort header files alphabetically
- Seperate patches for renaming .c files to avoid conflicts

This series is based on c958e86e9cc1b of mediatek-drm-next.


Hsiao Chien Sung (14):
  drm/mediatek: Rename "mtk_drm_crtc" to "mtk_crtc"
  drm/mediatek: Rename "mtk_drm_ddp_comp" to "mtk_ddp_comp"
  drm/mediatek: Rename "mtk_drm_plane" to "mtk_plane"
  drm/mediatek: Rename "mtk_drm_gem" to "mtk_gem"
  drm/mediatek: Rename "mtk_drm_hdmi" to "mtk_hdmi"
  drm/mediatek: Rename files "mtk_drm_crtc.h" to "mtk_crtc.h"
  drm/mediatek: Rename files "mtk_drm_crtc.c" to "mtk_crtc.c"
  drm/mediatek: Rename files "mtk_drm_ddp_comp.h" to "mtk_ddp_comp.h"
  drm/mediatek: Rename files "mtk_drm_ddp_comp.c" to "mtk_ddp_comp.c"
  drm/mediatek: Rename files "mtk_drm_plane.h" to "mtk_plane.h"
  drm/mediatek: Rename files "mtk_drm_plane.c" to "mtk_plane.c"
  drm/mediatek: Rename files "mtk_drm_gem.h" to "mtk_gem.h"
  drm/mediatek: Rename files "mtk_drm_gem.c" to "mtk_gem.c"
  drm/mediatek: Rename mtk_ddp_comp functions

 drivers/gpu/drm/mediatek/Makefile             |  12 +-
 .../mediatek/{mtk_drm_crtc.c => mtk_crtc.c}   | 210 +++++++++---------
 drivers/gpu/drm/mediatek/mtk_crtc.h           |  28 +++
 .../{mtk_drm_ddp_comp.c => mtk_ddp_comp.c}    |  51 +++--
 .../{mtk_drm_ddp_comp.h => mtk_ddp_comp.h}    |   9 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c       |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |   4 +-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   4 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |  30 ---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  32 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   6 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c          |   4 +-
 .../drm/mediatek/{mtk_drm_gem.c => mtk_gem.c} |  65 +++---
 .../drm/mediatek/{mtk_drm_gem.h => mtk_gem.h} |  23 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  14 +-
 drivers/gpu/drm/mediatek/mtk_padding.c        |   4 +-
 .../mediatek/{mtk_drm_plane.c => mtk_plane.c} |  26 +--
 .../mediatek/{mtk_drm_plane.h => mtk_plane.h} |   4 +-
 26 files changed, 275 insertions(+), 283 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_crtc.c => mtk_crtc.c} (82%)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_crtc.h
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.c => mtk_ddp_comp.c} (94%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.h => mtk_ddp_comp.h} (98%)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_crtc.h
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.c => mtk_gem.c} (76%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.h => mtk_gem.h} (62%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.c => mtk_plane.c} (94%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.h => mtk_plane.h} (95%)

--
2.18.0


