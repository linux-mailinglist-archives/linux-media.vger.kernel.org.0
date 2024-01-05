Return-Path: <linux-media+bounces-3225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9954582506C
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 10:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DA201F21235
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 09:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA5522EF8;
	Fri,  5 Jan 2024 09:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="y1Uo+XmO"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C351225D0
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704445246;
	bh=8tzA5/AQN6xGkg2C1SoHDNnNznUrKgezg2S+pqhrvg0=;
	h=From:To:Cc:Subject:Date:From;
	b=y1Uo+XmOVq3XDFcvj7pUhkTN7aXphLOpWy13KCxaXDua62P9OHFxpdei7JMQsjT8H
	 FkC8LCpsoNIMjzcvtWWy65mUEgPz8taIoknG4cNWgxovlRrrNK7k5IsF0Hd67RHHz5
	 xf14cFQzTDaSI7vdP4svHy7EfsEctHXHIR+NArd5nBDLF2ls+Y/iO+TgMJ6Mrdp80J
	 Y/W3pWURRM4x7H7d8Qzu5v4GXNtNXah7ygFdODwzOuxQHAiWOj9Oa16iR2FyWEJ7XB
	 o1YZdDXdtAmVXlHUSZP1OwhX5BxNtQAAjmgOk1cx7597hWTSR3YsOYRyoVGmMqExOm
	 2/X4XRuXY54cw==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DF53437801C1;
	Fri,  5 Jan 2024 09:00:45 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: j-luthra@ti.com,
	mchehab@kernel.org,
	mripard@kernel.org,
	sakari.ailus@linux.intel.com
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v3 0/5] misc improvements for j721e-csi2rx
Date: Fri,  5 Jan 2024 10:00:20 +0100
Message-ID: <20240105090025.1245112-1-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change in V3:
- patch 1/5 change the Fixes tag and commit message as suggested by Sakari

RGB patches 4, 5 have been tested with the MAX96714F pattern generator.

This small series:
- Fix media link issue when the remote subdevice has multiple output ports
- add support for Grey format patch 2 and 3
- add support for RGB formats patch 4 and 5

Jai Luthra (2):
  media: cadence: csi2rx: add support for RGB formats
  media: ti: j721e-csi2rx: add support for RGB formats

Julien Massot (3):
  media: cadence: csi2rx: use match fwnode for media link
  media: cadence: csi2rx: add Y8_1X8 format
  media: ti: j721e-csi2rx: add GREY format

 drivers/media/platform/cadence/cdns-csi2rx.c  |  6 ++++-
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 24 +++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.43.0


