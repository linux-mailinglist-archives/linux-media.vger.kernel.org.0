Return-Path: <linux-media+bounces-12095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 388888D1DD8
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 16:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E68C1C2223B
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 14:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B55716F825;
	Tue, 28 May 2024 14:05:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC6116D4E5
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716905130; cv=none; b=gcgxu78IONfGz4MnYseTvsqTz3GJLjFERwxBWqaSg30/w4/o4ncy4M4WP5xvRmwjOIG1SWJWoMUoPZzxeV/8UwkNCR424ZioXHz2oarE0Vvs4hMIkRCqcrcejBUnHWXbKUMPoaYvjJBX6f97gO3DkZJkqAklrM3ztw/5F8LQm6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716905130; c=relaxed/simple;
	bh=17H2HqzkwyFVyWVjZkx69YeNHefga/HqGfhqEINEiDE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fHT8gKAmDtVE8WIyzh5whAWro6H47qgD26Ut2qXVSYVGe6D/HjbJTmHv5N+Tzw1jppwWJUPKF17B9UKXcLOcBHNKjI0Sozr43ShpZwb9XWPsbF4sAGwmKw5t83AEWFASwODENenQCByVt2XfLS/wljJdbwcrgUfQ77wzpYXVdoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1sBxS0-0005wE-N7; Tue, 28 May 2024 16:05:16 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 0/2] media: rockchip: rga: fix v4l2-compliance errors
Date: Tue, 28 May 2024 16:05:12 +0200
Message-Id: <20240528-rk3568-rga-v1-0-b946e55d9d37@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJjkVWYC/0WNQQqDMBBFryKzbjDGpkqvUlzEyUSHQpRJKIJ4d
 6Obrj4P/uPtkEiYEryrHYR+nHiJBZpHBTi7OJFiXxiMNk9tTa/k29pXmcmpEELjvUaDnYUijC6
 RGsVFnC8l0pbrvKyM9V+6fqtQ4O2OfobjOAF4IILphAAAAA==
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Michael Tretter <m.tretter@pengutronix.de>, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@pengutronix.de
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Fix the Streaming ioctl tests reported by v4l2-compliance for the
Rockchip RGA driver.

Patch 1 fixes the field of the returned buffers and Patch 2 the sequence
numbers.

---
Michael Tretter (2):
      media: rockchip: rga: fix field in OUTPUT buffers
      media: rockchip: rga: fix sequence number handling

 drivers/media/platform/rockchip/rga/rga-buf.c | 15 +++++++++++++++
 drivers/media/platform/rockchip/rga/rga.c     |  4 ++++
 drivers/media/platform/rockchip/rga/rga.h     |  3 +++
 3 files changed, 22 insertions(+)
---
base-commit: 8771b7f31b7fff91a998e6afdb60650d4bac59a5
change-id: 20240528-rk3568-rga-fff1dd0c2c75

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


