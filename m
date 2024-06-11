Return-Path: <linux-media+bounces-12942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28988903A3C
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 13:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A86B7281C19
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 11:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407A317C7C6;
	Tue, 11 Jun 2024 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q6Y3sQ30"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099F017BB0A;
	Tue, 11 Jun 2024 11:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105577; cv=none; b=m8AiaQTy9ErKimKmTrpcNlCzvD7P+kuLOUZfvKgjoPfup/EefBI+dH5AY1ogVcZUHN8o61O6scamB+08ht5KWTMQ4pR/JaEr6FtSv9Jn2aVku4gGpK1ZiyGMxksbZXHH8ZZ00W/k3JPxUfOBx7WOentbYaYzWlHNeRUcWZdeYxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105577; c=relaxed/simple;
	bh=05kfyfA+1HW/19R9nKDQLxLwlI0VDXCoagdozz8+RPk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nNvdtQzDwwSec4000oQTEznMPGq2Qq5saowuZ9vYQDsMn0Bce/2R95ppLF4x878ERpz9wF66eq9t2KgrMXUGhNFNGW/kDdUiElq5Dp9YmcsGXCSpeW7JBeAXXKg/TFxn9+VHi51IkGtZNfIKAqtXsZnrVcdLJkNFgzcQkJxgYQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=q6Y3sQ30; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 548e59ce27e611efa22eafcdcd04c131-20240611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gZ+L3w0QZv+3dXASpa8etsuHp4Ejgx7CTnrEsKA4Jck=;
	b=q6Y3sQ30CzbVjSHSA+CcuxnWOaUDK+FValPmlYnrAGxiU47Co32KUp7XnFf+7n10+85xWkWRCj9dFNa99aiOpJm1H6QBoRYjyEdIdv644DAmnSxX8nyTOxrZsXODnLAvwRpwFwOkZTtGoCUPDnvd6WiuZI+dgArJbhZRgm5115s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:5c3d9a77-a3ce-4b5c-bbfa-d1b192fb7d8d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:393d96e,CLOUDID:0532db93-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 548e59ce27e611efa22eafcdcd04c131-20240611
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1356379596; Tue, 11 Jun 2024 19:32:48 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Jun 2024 19:32:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 11 Jun 2024 19:32:46 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: <mchehab@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <sakari.ailus@linux.intel.com>
CC: <laurent.pinchart@ideasonboard.com>, <shengnan.wang@mediatek.com>,
	<yaya.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yunkec@chromium.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jacopo.mondi@ideasonboard.com>,
	<zhi.mao@mediatek.com>, <10572168@qq.com>, <hverkuil-cisco@xs4all.nl>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <macromorgan@hotmail.com>,
	<linus.walleij@linaro.org>, <hdegoede@redhat.com>,
	<tomi.valkeinen@ideasonboard.com>, <gerald.loacker@wolfvision.net>,
	<andy.shevchenko@gmail.com>, <bingbu.cao@intel.com>,
	<dan.scally@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v6 0/3] media: i2c: Add support for GC05A2 sensor
Date: Tue, 11 Jun 2024 19:32:33 +0800
Message-ID: <20240611113236.16513-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N


This series adds YAML DT binding and V4L2 sub-device driver for Galaxycore's
GC05A2 5-megapixel 10-bit RAW CMOS 1/5" sensor, with an MIPI CSI-2 image data
interface and the I2C control bus.

The driver is implemented with V4L2 framework.
 - Async registered as a V4L2 sub-device.
 - As the first component of camera system including Seninf, ISP pipeline.
 - A media entity that provides one source pad in common.
 - Used in camera features on ChromeOS application.

Also this driver supports following features:
 - manual exposure and analog gain control support
 - vertical blanking control support
 - test pattern support
 - media controller support
 - runtime PM support
 - support resolution: 2592x1944@30fps, 1280x720@60fps

Previous versions of this patch-set can be found here:
v5:https://lore.kernel.org/all/20240605105540.17937-1-zhi.mao@mediatek.com/ 
v4:https://lore.kernel.org/all/20240427052233.8915-1-zhi.mao@mediatek.com/
v3:https://lore.kernel.org/linux-media/20240403033825.9072-1-zhi.mao@mediatek.com/
v2:https://lore.kernel.org/linux-media/20240323014751.4989-1-zhi.mao@mediatek.com/
v1:https://lore.kernel.org/linux-media/20240316025253.2300-1-zhi.mao@mediatek.com/
v0:https://lore.kernel.org/linux-media/20240313054409.8073-1-zhi.mao@mediatek.com/

This series is based on linux-next, tag: next-20240611
Changes in v6:
- use "dev_err_probe" API in probe function 

Thanks

Zhi Mao (3):
  media: dt-bindings: i2c: add GalaxyCore GC05A2 image sensor
  media: i2c: Add GC05A2 image sensor driver
  MAINTAINERS: Add entry for GC05A2 image sensor

 .../bindings/media/i2c/galaxycore,gc05a2.yaml |  112 ++
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/gc05a2.c                    | 1359 +++++++++++++++++
 5 files changed, 1489 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
 create mode 100644 drivers/media/i2c/gc05a2.c

-- 
2.25.1





