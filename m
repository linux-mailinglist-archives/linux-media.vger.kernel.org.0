Return-Path: <linux-media+bounces-17085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D393963BD1
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 08:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E072CB21F6E
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 06:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D3915F3E2;
	Thu, 29 Aug 2024 06:45:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA53014A4C7;
	Thu, 29 Aug 2024 06:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724913917; cv=none; b=LeMP317C7M9OCU87kwhVCahYCggPZDFXUMVMjFgmA+FDSbn5tHEAxnX//NJk7FnxRR07gwoeok9jlDevxZb+EnOV0JmZ8naw9QopX2stCJj9bB7MLv1Jlc7socxH1k/cYg42QIoE8YBkRMW6nNxR5Z3t8oxInugjJbhG5rOwAJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724913917; c=relaxed/simple;
	bh=P+HR/UlXZ/E//803O1SlSgKE09rORKctBEiDpYD7rYs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JRMepteG2nAidQuDVIMaxDlSz2Qr6OqL4zl8Ck4Wast2QLtl56h0K9dsqJYF2otFrs8O0kNsyjoqUDMnz9e4IuDBBELSRqJWUy5Zw7ATI6LENmFx4nq6QULpqvYYESnfiTgE3fJ0KocT/iW1tyuClI0m/2XFbEvbiru+ZN0LjFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 29 Aug
 2024 14:45:08 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 29 Aug 2024 14:45:08 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <robh@kernel.org>, <conor+dt@kernel.org>, <eajames@linux.ibm.com>,
	<mchehab@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<hverkuil@xs4all.nl>, <pmenzel@molgen.mpg.de>, <krzk+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 0/2] media: aspeed: Allow to capture from SoC display (GFX)
Date: Thu, 29 Aug 2024 14:45:06 +0800
Message-ID: <20240829064508.3706672-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

 v6 changes:
  - Replace aspeed-video.txt with aspeed,video-engine.yaml.
 v5 changes:
  - Remove dts.
  - Add doc, aspeed,video.yaml.
  - Simplify aspeed_regmap_lookup.
 v4 changes:
  - Use scoped/cleanup to make aspeed_regmap_lookup simpler.
  - Update dts
 v3 changes:
  - Update for enum_input.
 v2 changes:
  - Update patch subject and comments.

Jammy Huang (2):
  dt-bindings: media: convert aspeed-video.txt to dt-schema
  media: aspeed: Allow to capture from SoC display (GFX)

 .../bindings/media/aspeed,video-engine.yaml   |  78 ++++++++
 .../bindings/media/aspeed-video.txt           |  33 ---
 drivers/media/platform/aspeed/aspeed-video.c  | 189 +++++++++++++++---
 include/uapi/linux/aspeed-video.h             |   7 +
 4 files changed, 246 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt


base-commit: 47ac09b91befbb6a235ab620c32af719f8208399
-- 
2.25.1


