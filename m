Return-Path: <linux-media+bounces-35616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1621AE3DAE
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D24FC189558C
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 11:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C3C23D29A;
	Mon, 23 Jun 2025 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKf2TxMC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E2F1F2BAD
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676997; cv=none; b=ATFSoCZN5kIjQCyo9IUyGxpyHI6A7FrsJrP6UMXxcR9i181Wq/aB0556CyOtwOi7Q2VnYfenBbBkUmmbQV+KHc0J2f9GSQSfCHkkiXTdmdSxmeRR7F1w/nVBRVexEbzmvu9VYerv3L/H9cscChqZJCzrNpHlYAlRdp3Fu8fCM9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676997; c=relaxed/simple;
	bh=sj3F4/AJaUR7p/2NN8C/rawkPo54CtQ944d/O3hOjrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5ztmNy3G/ptFUkh8G6mzqtQh/pDcZ1St8N338hB5z+bGdCOPkCxLWu1EvHwNc5yA78lBTPK0NeQWLflJY2BMqO0FFbFxoLv4LfCJTa7wkF7pjXaebk/f1M8SRlX+OO7QM85yQT9E+RXpBq3TgExCWSxWLfaOhYjwqnBD5dbXj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKf2TxMC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A25C4CEF0;
	Mon, 23 Jun 2025 11:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750676997;
	bh=sj3F4/AJaUR7p/2NN8C/rawkPo54CtQ944d/O3hOjrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DKf2TxMCLbATxhrb/wPUXe4Go2pcod4m7Wq5KVrDc4SnmIa8t8cbBfDpkBX0yysoe
	 hHsXvz6/VbpYVvjzHGP1BxmVgULlmHgmoenFmQ1RKZrX4pOi6TomB8EN2aZL0geU3P
	 xU1JVdqDlczHUItMoY09EFzMz9FaeMUSrYXICbme1pKFuGWk3sdkn9pbex7uPiBbr/
	 AwKJxZYPjn2zPNOemOXTRPktGf4uN6+fImr1U8ElKCMSSi6WePFGQoLKSJfAokLnyL
	 v1rGlR6FXdK4wg1IXrBfA+JrGjhrh5nr2tUpj3ruvF8kOv0DKr/eAmXSi7eQya3WDV
	 mJv+D80vG0xTQ==
From: Hans de Goede <hansg@kernel.org>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] media: ipu-bridge: Add Toshiba T4KA3 HID to list of supported sensor
Date: Mon, 23 Jun 2025 13:09:50 +0200
Message-ID: <20250623110951.18649-2-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623110951.18649-1-hansg@kernel.org>
References: <20250623110951.18649-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

The Xiaomi Mi Pad 2 tablet uses a Toshiba T4KA3 sensor, using
a Xiaomi specific Hardware-ID of "XMMC0003" add this to the sensor-list
of the ipu-bridge code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index dbb847a104e0..b0f65aa220f9 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -88,6 +88,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+	/* Toshiba T4KA3 */
+	IPU_SENSOR_CONFIG("XMCC0003", 1, 321468000),
 };
 
 static const struct ipu_property_names prop_names = {
-- 
2.49.0


