Return-Path: <linux-media+bounces-12760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A16900990
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 17:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B93301C21C90
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206DE199255;
	Fri,  7 Jun 2024 15:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPht3ab5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF5D15B97E;
	Fri,  7 Jun 2024 15:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717775437; cv=none; b=G0SvWH319LwSOL7VebCYkfjtaEuVsjQJ+XltT6gLVeCYsS7OoitkfWTfSf3rvMr/xMMX6CyQKFCi1SR4ShSFbGfemyAG3kY3TSj3icEm9mPS4w0EMyNqIndac+KNhNWXxhe6ktPoRfuO8TkwQRcbil9s0LXwLxhLXEEAYGNFscM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717775437; c=relaxed/simple;
	bh=RHJJ3hHRw9MCGURxtRp+9Ljf9/vHiyGx16Yi9WA7n2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fgAwt8c3o4lUvkG2pefDfDhHNpcvvTbAwmhRr9gobDScQQrpzytxMvtuGpgEm041FMxag7LJu09Fy9OvU8cLyjHpSilU9soQm1Xaf0NRRhMXyYAjGfztCddbZFtB+vd8HGQlw9umH1D8KB6RjWI/XOCmM8MPJ3pP8331BfXYUkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPht3ab5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060D0C2BBFC;
	Fri,  7 Jun 2024 15:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717775437;
	bh=RHJJ3hHRw9MCGURxtRp+9Ljf9/vHiyGx16Yi9WA7n2k=;
	h=From:To:Cc:Subject:Date:From;
	b=oPht3ab56xI2iqkxY3Dvk+KGUvJTSi4VBE+EokZ8ceVBx5gBPQzG4PH2aZDN+LUkU
	 BFkjKHtutojnt6Rct5H1MvNax2hK+87YVKczIoafCG8dxcLJK5vgFjfNSQizvG55+J
	 K9OmDItxqvQMyYgbtbZbr2KYL5058/8JksQDvtJoZovM74aC5AagLH/dTue6by05+N
	 iAhIZvMhPJW0kKzSZZ2Gc4QN12utZmnrO/U6YXWpvb6A5AWMGhBLRRFSMlxqBZawsd
	 LpKjcBthFW4Qr3iejToBeSf5kj1pHhNIrBN/nDUokiLa7y7SGT/ijDVs9PWX1BqUAR
	 1Knd07eYvij9A==
From: Conor Dooley <conor@kernel.org>
To: linux-media@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Adam Ford <aford173@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: i2c: imx219: fix msr access command sequence
Date: Fri,  7 Jun 2024 16:50:23 +0100
Message-ID: <20240607-trimmer-pummel-b452ed15e103@spud>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=jDbtFqgud1z2Vv704WZGxMNivT/JS93Y91PLV/vhOm8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnJOvYVR6xdTTiu84pyLApduziC9cGOnJdKZyJXrPwqp nNQZ216RykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbyS43hn+bR+B1rtlqvZ61k O5TCuVd1ZaZylZbx4hSxgH6JLSuzbBgZzm8Jnv3TZ/eZ2k55nupv96tC2RK1ZrhpPPCrPmgyse8 KKwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

It was reported to me that the imx219 didn't work on one of our
development kits partly because the access sequence is incorrect.
The datasheet I could find [1] for this camera has the access sequence:
Seq. No. Address (Hex) data
1        30EB          05
2        30EB          0C
3        300A          FF
4        300B          FF
5        30EB          05
6        30EB          09

but the driver swaps the first two elements. Laurent pointed out on IRC
that the original code used the correct sequence for 1920x1080 but the
current sequence for 3280x2464 and 1640x1232. During refactoring of the
init sequence the current order was used for all formats.

Switch to using the documented sequence.

Link: https://www.opensourceinstruments.com/Electronics/Data/IMX219PQ.pdf [1]
Fixes: 8508455961d5 ("media: i2c: imx219: Split common registers from mode tables")
Fixes: 1283b3b8f82b ("media: i2c: Add driver for Sony IMX219 sensor")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I got the report of this third hand, I don't have a device and can't
test this. I do wonder why the RPis get away with the sequence that
seemingly doesn't work for the guy that reported this to me. My theory
is either that they noticed the sequence was wrong while adding some
other MSR access that is needed on this board while either cross
checking the values written or because the other MSR accesses didn't
take effect.

CC: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Adam Ford <aford173@gmail.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Andrey Konovalov <andrey.konovalov@linaro.org>
CC: linux-media@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/media/i2c/imx219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 51ebf5453fce..e78a80b2bb2e 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -162,8 +162,8 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
 	{ IMX219_REG_MODE_SELECT, 0x00 },	/* Mode Select */
 
 	/* To Access Addresses 3000-5fff, send the following commands */
-	{ CCI_REG8(0x30eb), 0x0c },
 	{ CCI_REG8(0x30eb), 0x05 },
+	{ CCI_REG8(0x30eb), 0x0c },
 	{ CCI_REG8(0x300a), 0xff },
 	{ CCI_REG8(0x300b), 0xff },
 	{ CCI_REG8(0x30eb), 0x05 },
-- 
2.43.0


