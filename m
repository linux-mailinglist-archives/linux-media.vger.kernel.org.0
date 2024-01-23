Return-Path: <linux-media+bounces-4079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E42838E01
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 12:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5458AB21CA6
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 11:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08775D906;
	Tue, 23 Jan 2024 11:58:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D3F57892;
	Tue, 23 Jan 2024 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706011111; cv=none; b=ocNerRc6tKZ9p6Y6mq+8LUxixzFkSvfdUQBLZi6d9FnUmT/iV6bluHPQ/tCBSGrqkeOUBxbENTFt7XmN82O1C59YIMFzNEBFb4lR/FrAjZjVdBQ8jc9Nthri0MZLDLQbqyz2p/KKxWO2B00HftxH3nM9mU0htlxwND83XGPsv4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706011111; c=relaxed/simple;
	bh=XH7XSMta7a0DbzidxCBrO9M+sVeeKvBSPxw0TbL8ax8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MnGhnhYkCY+3fA81YDSABEjyGUuYf35oQlWngSVroh1seUUDFNuatd0oueuT4QTRkS6xU4WapVI++Swxdo7qn9M/TcocuY9oJFd66YP60/yAfXqt2SwUVK77foXyXFYJG43UljPNIlTUX4l59aR+bsBIJMeff+koH63aznX1/7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,214,1701097200"; 
   d="scan'208";a="195342057"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jan 2024 20:58:27 +0900
Received: from localhost.localdomain (unknown [10.226.93.36])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1A2A24001B60;
	Tue, 23 Jan 2024 20:58:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] RZ/G2L CSI/CRU Improvements
Date: Tue, 23 Jan 2024 11:58:17 +0000
Message-Id: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to sync the CSI/CRU driver code with the latest
hardware manual(R01UH0914EJ0140 Rev.1.40).

Biju Das (4):
  media: platform: rzg2l-cru: rzg2l-csi2: Switch to RUNTIME_PM_OPS()
  media: platform: rzg2l-cru: rzg2l-ip: Add delay after D-PHY reset
  media: platform: rzg2l-cru: rzg2l-video: Fix image processing
    initialization
  media: platform: rzg2l-cru: rzg2l-video: Restructure clk handling

 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 -
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 63 ++++++++++----
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 18 ++--
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 83 ++++++++-----------
 4 files changed, 88 insertions(+), 79 deletions(-)

-- 
2.25.1


