Return-Path: <linux-media+bounces-42720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB32B84CCD
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 15:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 070ED1B28367
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 13:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94230308F3B;
	Thu, 18 Sep 2025 13:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gTjEDjUo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3BD2FF655
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 13:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202082; cv=none; b=YtjFc3AM8snIKbUa1LA3inwlmjs5fPB4ABiU30u84FbrLuoUgz6m05L3/svlzfrELGk18SMmMsn/bHqEumBaKyONB0lASItd4ZVbCRo39FBiapDiHSxVXAK27rehdBETFFAVtJVdXexLipWjALHTRSYvvqcJi+ucd5gGyp8fDpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202082; c=relaxed/simple;
	bh=RBGn6+pSH93YSmbwSEmiBK96+k6d+Q7lLerU0T3U7NM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e1ynUG9qlA/k+Ohafd4vjvhRiydTzycodfOL9Ut7kJz4EVOZrgrJSTyefQY855EdpHqMeCY6EzaKQZ5hJF4Mwha0w+hNvyaEUrniuQRE5zx8HLO4gMroBZ7+FbCKIBeJ+SlxqZxyicCTl1qOKNaZMxJ81NzxWOJVRn84LKG7bQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gTjEDjUo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from Monstersaurus.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0BFB55A;
	Thu, 18 Sep 2025 15:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758201997;
	bh=RBGn6+pSH93YSmbwSEmiBK96+k6d+Q7lLerU0T3U7NM=;
	h=From:To:Cc:Subject:Date:From;
	b=gTjEDjUohm4qGBdXVQe3rkwiFT2zI6OiDu3URIJvwBj/PfH1aX5JIrnDzmtw9jCm6
	 xr1Lu9IaKa0cZM9yhotPhJC+nW2rSpllx1RmsFhLdDrebJcSR0TxyAJKh84zv9U7eM
	 uorHLDyKilsfsoX0lnoV+8nN3AW4FNKOuepVbonk=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/3] drivers: media: imx283 improvements
Date: Thu, 18 Sep 2025 14:27:50 +0100
Message-ID: <20250918132753.3154059-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes have been tested on a Raspberry Pi 5 and an i.MX8MP
platform and fix issues detected with handling exposure on blanking
updates and correction of the formats supported and cropping.


Kieran Bingham (1):
  media: i2c: imx283: Recalculate SHR on blanking changes

Stefan Klug (2):
  media: i2c: imx283: Report correct V4L2_SEL_TGT_CROP
  media: i2c: imx283: Fix handling of unsupported mbus codes

 drivers/media/i2c/imx283.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

-- 
2.50.1


