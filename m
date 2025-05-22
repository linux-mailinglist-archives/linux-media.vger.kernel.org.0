Return-Path: <linux-media+bounces-33071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5F9AC04D9
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 08:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B35748C7F95
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 06:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813B4221FBB;
	Thu, 22 May 2025 06:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cti6Fn8I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D421A5BA8
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 06:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747896931; cv=none; b=g6ZOGHAcj22gZqL/sjDqqD7d8X9sgj6tMZjFw/DCs01oN/89PJ087WJE2C1yXjH3qo039C1lIDMhMBn7FJ087Gpz+Zl/QeVRQZgARLJRfzXMUZP2wCF1pz8bhBsH0pSKgeH5ZSIp0KQGmiWoCocLaAMBKKps7jNEnq9Yc1CwI6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747896931; c=relaxed/simple;
	bh=I42t90yixrOoWP5JYYdtz0IiajboH72fYmBz+KxKpUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjBqRx9RTYmUBLf7ltSuHM672eOUvfrS2wenOdGt1halr2NiYCslFI0gG4V7vM+U9g7AXrnOE3evvNWW3XTjJ8OruFSMa6JMqv70UBs7bE58+OV5+3XiCw6u1hoYcEfReachq+m5Gw1PSb/2VOgX8ODilzdfU0iDY/1alcVYJdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cti6Fn8I; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=3Z7SZmFSISd2bH
	b5yExGAn35YPe+IQVw3MZb3heqdRw=; b=cti6Fn8IxmcKEWQFy37JatDXaJjCHx
	OegVRU7qk4gVvXul4J28dG3a4QwbEqrKOAX54PUD9vBl2N7WPWMWF4tVI1CpN6dp
	c3uQ6UF3T7OhYCL3L50svry72rYpJVCELXgXVkIe4I/17wJDyxIKS3M1IymLs1LG
	8xiwAeFlO9ggUT2+64xIGhGIo0FTczajLxdOZNUR8IiyjChQVw5u2O2GurGEaDzn
	4Hf5nyCB2clt3Cy9SpJCI4Z/bp0rCxjbNkN11ZyWMJ9TmtgLK2Z33gZ0uNHn9BC0
	HN2zIsk1T8MJce4dM25HZWsNj9Z8yFVdNTl4NLMpRxtNeeAvIIJex8aw==
Received: (qmail 3537885 invoked from network); 22 May 2025 08:55:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 08:55:27 +0200
X-UD-Smtp-Session: l3s3148p1@LH5097M1MuYgAwDPXwj7ADHm2wGe7qss
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 0/2] media: usb: hdpvr: make use of quirk flags from I2C core
Date: Thu, 22 May 2025 08:55:19 +0200
Message-ID: <20250522065519.4138-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We found a pattern that could create USB protocol violations for devices
which embed an I2C bus and use I2C message lengths directly. Patch 1
fixes the bug for this driver by using a quirk flag. Patch 2 is a
cleanup to remove a pattern in the driver which can also be handled with
a quirk flag.

Wolfram Sang (2):
  media: usb: hdpvr: disable zero-length read messages
  media: usb: hdpvr: use I2C core to handle only supported messages

 drivers/media/usb/hdpvr/hdpvr-i2c.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

-- 
2.47.2


