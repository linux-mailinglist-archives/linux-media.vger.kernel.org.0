Return-Path: <linux-media+bounces-5079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B9E853285
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 15:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CE351F2537B
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 14:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA8757872;
	Tue, 13 Feb 2024 14:02:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563D056B98;
	Tue, 13 Feb 2024 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707832975; cv=none; b=JKIdEYjQGtuRlhxlFvJ4BELRMs2Wp1d+w264Acx6G6MzyUrNmdCdikkQ0WskZgt7zz1N2uFzoGcBFHcn7evO+Otj1FSSyIvZymT6mdMAATpo6hZ34te4WxBIHaygwHWRB0TgBTh5D2Z2BQfbjXF7bkPpceWZPfGdIWhkKBb+QWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707832975; c=relaxed/simple;
	bh=tWB0mHt6YKn4C8c0bRiQpKs3vHMNwlXAAGEP+yiBsg4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XvmjzI52+yjkQ1HAW1ABAiku2d2f/SzyMKALuXS5m1NjUZ2pATjw6ZoSMGoGQFheFm1dQQpJRs2sAxxqA8i4ZlKxKkUfPHsMsXc7tq61ejbLITMiwpnj+SqWAPZBKRJ97A9Su6FdjZsYPTZ4pZDglp5cKUtF+W8Hq8vnnmv1XpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,157,1705330800"; 
   d="scan'208";a="193787612"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Feb 2024 23:02:45 +0900
Received: from localhost.localdomain (unknown [10.226.93.58])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 231494003EA8;
	Tue, 13 Feb 2024 23:02:42 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] Fix OV5645 capture issue with 400kHz i2c bus frequency
Date: Tue, 13 Feb 2024 14:02:38 +0000
Message-Id: <20240213140240.159057-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to fix OV5645 capture issue with 400kHz i2c bus
frequency observed on RZ/G2L SMARC EVK platform.

Testing OV5645 with i2c bus frequency @400kHz on RZ/G2L SMARC EVL platform
shows issues like the captured image is either greenish or it is not
capturing the image at all. However, It is working ok when the i2c
frequency is 100kHz. From this, it is clear that we have a timing issue
at high speed. The testing also shows that if we add a delay >= 1 msec
after register write {0x3008, 0x82}, then the captured image is always
good.

Since OV5645 is showing issues @400kHz, it makes sense to add a small
delay after register writes for settling the register values. So introduce
a small delay by adding a read() after write() and also add a debug code
for data mismatch.

Biju Das (2):
  media: i2c: ov5645: Move the register 0x3008 from
    ov5645_global_init_setting
  media: i2c: ov5645: Add a small delay after writes in
    ov5645_set_register_array()

 drivers/media/i2c/ov5645.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

-- 
2.25.1


