Return-Path: <linux-media+bounces-33087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D76AC06AD
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 10:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB7498C818F
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 08:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C0A261589;
	Thu, 22 May 2025 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hpt/gpJ1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93086261388
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901417; cv=none; b=OCugA5u3a8LUPijMneuBKVeMNSiYiQXCd1snzqa0zq7WvfoFm/tgL5EsbaPYab1bKO4Od/Gd53EqAn2YD/BbZnZM5lIxmyD/gQcRqwODkQkY8OGroSfOzTJ81LQbdz62/VQfgP+9s+QMzn2BxA1X4bXenYRSQIgmmnpUjnDohdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901417; c=relaxed/simple;
	bh=eGFhm/Jw3pAMKbmqE6JuGBCVDI9dUGBFrZk3NomwTo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PZqo+JU38GtrIlH5N0EwcmPkE2JT4LZdDrwhWAjMWgjBGGBafv3FTb2CjVi5kK0LX9joCWoMLK0mEpyGTQ7kgY3YrTsRfH32ejkl9APIAg1lUNYSTGj5xqN2ZIW6Wg7Hex6MyhZx466AppFmFS3DIaMe6qcTnOXyAPLYHNfPI34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hpt/gpJ1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=coQlwEuT9v0sos
	BSpyej7UYSYIaMjXYkHcmZpyJCmwM=; b=hpt/gpJ1fWRq8hY9q+MFxHUDIxxJT+
	1jn5rPW72MqJf481FKa3wd/6kxXbhIZdhadZL57kOEMh45cfM3HsmiGowrFrDWAo
	vstrGnrxPg7nlpV5Ww+0n7cb+bI0qUUX5/WfjljgPFGFWJEeBWPoRgpjlN8C57oJ
	ighL8/I0mfUcRpfVJmnhl7S9yLh0daS2aSDyk3BFEsSGr7t8J+7MDnaxQ7iEq1t8
	Xv2+znKhZcPAXMaqH5pbynQh5zJouJ9ssOQGbBElMxGWQOJuVGMo4LPU4FTR4BBe
	xpF6cLgtLxpuqWVPZ5mvWTyEh5O3PxdoaY53jngyxzpReVpyd4/krcNw==
Received: (qmail 3566324 invoked from network); 22 May 2025 10:10:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 10:10:12 +0200
X-UD-Smtp-Session: l3s3148p1@H6LIArU1WrYgAwDPXwj7ADHm2wGe7qss
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 0/2] media: usb: hdpvr: make use of quirk flags from I2C core
Date: Thu, 22 May 2025 10:09:53 +0200
Message-ID: <20250522080953.27323-4-wsa+renesas@sang-engineering.com>
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

Changes since v1:
- removed now superfluous label in patch 2

Wolfram Sang (2):
  media: usb: hdpvr: disable zero-length read messages
  media: usb: hdpvr: use I2C core to handle only supported messages

 drivers/media/usb/hdpvr/hdpvr-i2c.c | 30 ++++++++---------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

-- 
2.47.2


