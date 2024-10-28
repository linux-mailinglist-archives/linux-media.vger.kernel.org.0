Return-Path: <linux-media+bounces-20437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 306259B358E
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 16:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E842228301D
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 15:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD721DE89A;
	Mon, 28 Oct 2024 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="NMwJ3HrS";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="seWpQ1BR"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE421D9324;
	Mon, 28 Oct 2024 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730131181; cv=none; b=TX5p8BLt4PZifqJ4hhG6Jof7m49GmT38i+7JUz5YLZuH7iQPBkbOxWx2DxYMNmJReUkCdAsOCXPUEh/mVya/RJ5X4t57ivZUUXBI2WqIdS0UY6xqaYjWe11OGyZYGOqhe6sE0GfWRlf6Pl1/N+RbBtAkGn2uciFaoqJkQW3rl7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730131181; c=relaxed/simple;
	bh=Z9XIvNhKb8BTGDUotNuKp2+dof/J9UUkLQozerD0tEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kL09z08u11VeoG0ezwASLWoBKDhbFXAPlDkTGqgN3dIBDSURA0ijQK51wdpK+eQbRSA09SkevXvlvKzUkSmuDT/VYhentT2AhLeDsce5y5HpP7+bePBF/hsFP4fHWCypqKsFkwirGWu/7OoU3kLi/1iAZEuwecpXCPZOEhUplNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=NMwJ3HrS; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=seWpQ1BR; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1730131177; bh=Z9XIvNhKb8BTGDUotNuKp2+dof/J9UUkLQozerD0tEY=;
	h=From:To:Cc:Subject:Date:From;
	b=NMwJ3HrSt3OLVlyglfwaJuRhzbE82zIafCEaIOBWgOV5qLbwGXrQ3oEBN7HcqRL7o
	 Abw3U5NYfgFb8xTUowfJuLTtWzA07+vzGX68W+kpEvThK/3gJtoN0uQg0WnGnwgzc2
	 r5V9FTK19lWUp7RnDEwJ7yuZkVJoBgMB8ejV0cYQnSzTfTuH+DquSe9zVdKGqDWz9Z
	 h69hHiHkov/57dP98TQATc/qBikWc22fFxlr50teMIvzRKh/Geb2aTUq3Jw2qtTnIk
	 WggQRUkJTfjXQp8NppuIS+gJVMwOwMXZkdZIXX9te2sWG9kPQyB8TnVcP1z2ylUKhy
	 4aoXkQFRYdC0A==
Received: by gofer.mess.org (Postfix, from userid 501)
	id 6077E1003C0; Mon, 28 Oct 2024 15:59:37 +0000 (GMT)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1730131176; bh=Z9XIvNhKb8BTGDUotNuKp2+dof/J9UUkLQozerD0tEY=;
	h=From:To:Cc:Subject:Date:From;
	b=seWpQ1BRGZdFVSBSpBQQYEQwBrUuuxNgB8xsLn8j9O8mrUrSc87hVSEq1JTU0FzEx
	 k3gc+vBN+kwF5HC1HYrFiXzFZZ4wvO+SPw8MBFkIy4iSW+xBIKp56irLXFNC0EYb+G
	 19P5KOhxN4nfi/d+VnJta6qEUZIwZuv+BNz0gRswNdhr0Mw0KbbbzF0WX49eQky4B3
	 jwzPNic/ShYUbDQWz3HzOryAze0g/YgoCzUw7JDHzamljxRDaUSXUAVVDjUERfJGWd
	 +IXdkagW0cjE44s2CnoXdZyTmvR090Nu9aruSprvmZPZAFKl5chRC14c+hVhPyB8B2
	 jLO6gLjsWajag==
Received: from bigcore.mess.org (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id 3D2EF1000B2;
	Mon, 28 Oct 2024 15:59:36 +0000 (GMT)
From: Sean Young <sean@mess.org>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: mceusb: don't push static constants on stack for %*ph
Date: Mon, 28 Oct 2024 15:59:26 +0000
Message-ID: <20241028155927.72244-1-sean@mess.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to pass constants via stack. The width may be explicitly
specified in the format.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mceusb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index cd7af4d88b7f7..d5ea3868d5a3c 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -658,8 +658,8 @@ static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int buf_len,
 			if (len == 2)
 				dev_dbg(dev, "Get hw/sw rev?");
 			else
-				dev_dbg(dev, "hw/sw rev %*ph",
-					4, &buf[offset + 2]);
+				dev_dbg(dev, "hw/sw rev %4ph",
+					&buf[offset + 2]);
 			break;
 		case MCE_CMD_RESUME:
 			dev_dbg(dev, "Device resume requested");
-- 
2.47.0


