Return-Path: <linux-media+bounces-46187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D81F2C2AD0E
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 10:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FA9A18926DE
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 09:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41AB82F3607;
	Mon,  3 Nov 2025 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5j6tmcE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF42F068E
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762162966; cv=none; b=sbjrFtIzTcspCaKnjD/f1N+RM/5TiRjAlrRAyY9mcDDMlPiABJBQ3QlJdwzXbbsI2XQIl3WEtObvzsgzjDjvchjVJhKaQQ8yfnHeUEUCxrmFGsPnocllITDbwuBp28A1CyECEo8uNWb83CnP12dPziKNh/5WmCNU+MzrwCy61Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762162966; c=relaxed/simple;
	bh=jo2XZ0QPAAkdqDK80FymNwhxK1CJB/ZpVW/Oh1pOWEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YQWZXfDb4IpfHxlgckM43jSK2CkPJbkS7q6RsN9v/dyYeJnbuWPQpiCZWqi56PGZdE4Lc9LyG8BZpp6teXCYrKcAazjFwfRbAB2tqN400SdDGJnNb9l5Qn6pKA/Lwdk1Z8oKLtZ6Qq7GBsfnk+acEB2b69PjuAU+H62wnffC+1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5j6tmcE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6341C4CEE7;
	Mon,  3 Nov 2025 09:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762162966;
	bh=jo2XZ0QPAAkdqDK80FymNwhxK1CJB/ZpVW/Oh1pOWEg=;
	h=From:To:Cc:Subject:Date:From;
	b=m5j6tmcEW6kYa5R62xyqL8rr5+HXfE8m0Iz0x0/gOyumkGqbQK8lbNuPpu0QfJpmI
	 kXXuh9XKqJH+cFMZ+wZt20vZ3Eoim43Nl9KUxZOc0e9JdO3LLV8APW9qur5ikCSJE4
	 Ch60TaR27ZyI69kPaUPBQRDO2av7oMErjwll+KHLHg4prHO7psqq9HGLOI2G1lSDKh
	 wiHkzBdXy76WqCTSRWuzs1U7CRaIb5H0GOi8DsX4u33P9XgTN+avpQSfeNlzmExEX/
	 wAWYgQXjIRNTWcACYdx28wI/MAms3NqbU3iKAO+fB8ej11YkUn3RXQay2huZ18biP1
	 H1fdineZCM6nA==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org,
	Jimmy Su <jimmy.su@intel.com>
Subject: [PATCH 1/2] media: ipu-bridge: Add IMX471 to the list of supported sensors
Date: Mon,  3 Nov 2025 10:42:41 +0100
Message-ID: <20251103094242.141001-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jimmy Su <jimmy.su@intel.com>

Add the IMX471 sensor, which is used with a SONY471A ACPI HID on
the Lenovo ThinkPad X9 15 laptop to the list of supported sensors.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2362064
Signed-off-by: Jimmy Su <jimmy.su@intel.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 30d1146aa171..62f55a70f42c 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -91,6 +91,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+	/* Sony IMX471 */
+	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 	/* Toshiba T4KA3 */
 	IPU_SENSOR_CONFIG("XMCC0003", 1, 321468000),
 };
-- 
2.51.1


