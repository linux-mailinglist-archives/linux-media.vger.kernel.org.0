Return-Path: <linux-media+bounces-2538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 360D1816A47
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 10:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1E70281BDF
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 09:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F9E125B1;
	Mon, 18 Dec 2023 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lbZsAvi5"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989C3125A1
	for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702893398;
	bh=+MkyDZDAIVUH/lBbrCe+yf16ZRT/yjmRWwcMBEmX5hI=;
	h=From:To:Cc:Subject:Date:From;
	b=lbZsAvi5ViJY0+hfLrnlka+kUCLYf92Z3k0JSwKuXV1GiWG1C4nUdETrwpmybFB2u
	 n2lskmW5rf/v033G9MZM5gWeN8HnwjtZHYnx0GalVCObLmQiZdikqG/9pAG+B0ss0t
	 WOSMnklwD9q/U3uNOMTg5/TGbWI7YqXNNY9+9yxSNy0nCynn2aSKLHefXHIPCaZhk3
	 VXbDrBxg1aXG7Q2IGDVTlTp7TCPUcUsV8ntrMoHUpngRHRviv46mjhWaxPNNbXjwvk
	 2kKB1PHKGr+SxFXJ7PgVWjzGqTx0wLn2mnq63lj30uEPjNi4IixMLeHNFVx6Eb4zZi
	 umV5O6EpXpgbw==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4266C37813DA;
	Mon, 18 Dec 2023 09:56:38 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: j-luthra@ti.com,
	mchehab@kernel.org,
	mripard@kernel.org,
	sakari.ailus@linux.intel.com
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 0/5] misc improvements for j721e-csi2rx
Date: Mon, 18 Dec 2023 10:55:59 +0100
Message-ID: <20231218095604.1950737-1-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change in V2:

- Add Fixes tag for patch 1 as suggested by Jai
- Add RGB patches from Jai

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


