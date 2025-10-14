Return-Path: <linux-media+bounces-44466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D5680BDAD18
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 82413355BE2
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9302930BB87;
	Tue, 14 Oct 2025 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzQ7rszr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19EE3019A6
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463672; cv=none; b=rk9MLSqCaInJpiowEtzFjB36yEY9yzucFrOSMoMoae29pq79CowmVaQhvMan6FK0/TeLN4AmoEtN6jj1TlPK3DM/Tl7XibC8pESacvqs7/vlzTzpekd6muteXrXUl2nJrZ+V4uBbW1+FxLDYqfi8bVgHs6AOVVNjIR2gXlBHZe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463672; c=relaxed/simple;
	bh=iFzAuatbLnzb8zr2TGs8yCzoX4LqtfuQru5ZJ1aHKus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/dsETyqJaMnU17hLwyjaRpMzjk0sTNG0nxnpCQ90+DRUVwbS6tHdOgepeKXziLcU7gAKASY3Uam65oKgHu4SaAPvG5sBpXzKpeawKwvidpGfPwr7eWLfYTS7davZFAXIO3ezmnk6jjxw/MzNnUsNQB/VmvW6BmdgGrNOnqBKlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzQ7rszr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4979C4AF09;
	Tue, 14 Oct 2025 17:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463671;
	bh=iFzAuatbLnzb8zr2TGs8yCzoX4LqtfuQru5ZJ1aHKus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WzQ7rszrxmR2EOzIhxtG27HvvdAKoToFLirIULoqUdXYH7Y39p7uDoIK3dwFv0ffi
	 XOYlkS0pe7JOMULC9whbtP/8nwPH5oqYrvwlk/5vPRs8Nc+OC2tG1XirmVbycNGWRD
	 WQhim+jGOJDbgE9pjcE7bs/qknBH3aea7sxxu+1Z6HCksFeK7OmeH4gIKfb8+a/buR
	 vyLV7lAaPESD+BsgrgICm6v0mkWovcd5h4VEmJTN73rI2UdvzanBwTTGTvBta5NnrF
	 KC/QARRL4axy0fjNsU1zxqlSZDoTdV5Gzk234/nPMtRZEmdEm2rXcQxAsh67FUYTHV
	 crJciPyhZ+XNA==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 19/25] media: i2c: ov01a10: Only set register 0x0305 once
Date: Tue, 14 Oct 2025 19:40:27 +0200
Message-ID: <20251014174033.20534-20-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop setting register 0x0305 to one value from mipi_data_rate_720mbps
only to override it with a different value from sensor_1280x800_setting.

Instead directly set it to 0xf4.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index c8b870cf6318..77c82201815b 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -108,7 +108,7 @@ static const struct reg_sequence mipi_data_rate_720mbps[] = {
 	{0x0302, 0x00},
 	{0x0303, 0x06},
 	{0x0304, 0x01},
-	{0x0305, 0xe0},
+	{0x0305, 0xf4},
 	{0x0306, 0x00},
 	{0x0308, 0x01},
 	{0x0309, 0x00},
@@ -216,7 +216,6 @@ static const struct reg_sequence ov01a10_global_setting[] = {
 	{0x5200, 0x18},
 	{0x5004, 0x00},
 	{0x5080, 0x40},
-	{0x0305, 0xf4},
 	{0x0325, 0xc2},
 };
 
-- 
2.51.0


