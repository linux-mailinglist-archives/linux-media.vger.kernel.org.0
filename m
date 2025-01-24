Return-Path: <linux-media+bounces-25276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2208A1B8FB
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E5C516B4B6
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2C71A8F61;
	Fri, 24 Jan 2025 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LCs6PBVE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B6D21D5A6;
	Fri, 24 Jan 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731911; cv=none; b=POTpZarddGI6XB1JrHb4wxLQPrsRWC3x4uxa5s8HeZ5iz9yjLG8cWEk1nc7MEJYlDMNxWJT+GFf9+f5lOgGP5QfORvA4JqyO/blNzYLNG7SDP2E8V2sQVVFwS0ed0OBcwsoaLiTKBFYBe5JHdSatnBSBz1Dya3K0kVKnaML8UYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731911; c=relaxed/simple;
	bh=9Yz4EgcjTkY63PSnOIzqhAyFJcVg2qzed4LdTYl/DjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MYbLem6G6qm+7urgXeQHZhldpKsZ4/nfX63fypLs/ndAdw6d6twLE+/TL5P0kWxbDlB1QXfH7NZOR0Tpq0VHoF5zgqIWgJa/tZoSV3I6P/az9gyzzvAItypqNKfTYWP15PyeGs5hNh+hwyOC837+fiGWCwEGI24BvVVyTaiiJmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LCs6PBVE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC6DA134C;
	Fri, 24 Jan 2025 16:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731833;
	bh=9Yz4EgcjTkY63PSnOIzqhAyFJcVg2qzed4LdTYl/DjA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LCs6PBVEbHudc0it4kgq3gduIQLZVSlphqiHApiQ6VqwLvaPXVQb16BeQayzDMrla
	 ObxaiG/9VjKYFmsjY55txKu+GcJWIw2676eYQld3eartKhuNRoPGofCY7SZObBhqb9
	 jdLrxKNJdtxHx0Mfbii3RpmZS1rRxsh8kBtzWw4c=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:45 +0200
Subject: [PATCH v2 08/22] media: i2c: ds90ub953: Speed-up I2C watchdog
 timer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-8-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=q/pKoMBitP7DcUzkHfyOF+oQXK1wzhPCpUCSa5D8wPM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68u8HfSCz9xMhndaHYuSdxifeiFh6p1vVghU
 M9eGECqV6mJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvLgAKCRD6PaqMvJYe
 9fhHD/sFlAxHhsB3mags0Vpm2FfJWYpADozlxi13J/bbLh1bysx6kWTu7RUSEc0s0hZvkSA7CqC
 im7OrujgkzntcpdEoDLehCEpY3SinlusW1oIZkxazPvE5eZ5yCUDhR+VPfy7BwlUfoHQ1l1AIUu
 Z+eA8zlZd7OmcKhl/a2nDIoZONRqZ8I3DsvOeqdIMNXhgalA5FYsMLZXN8FjyK+KkigZhTm7ysb
 LLH5WnoegnurRCtTGM+iEbq5hKf6pbCgqMDFLuv/n5TXNZ3+Kz1NxH3G3BdCqrIHkKvZfDaMC9w
 +qt0eKRchvjBpvQF0iWhZhh92fEBgYG7V+cVJpBYZnwGOMqn397dVzTjyA1kI+Jpw7lOtY/yKCp
 aYVva4FCOb7b1jSX5Z2cSxqScnSK/F6LZxLpY4AHA1IdjX3009Pk8m7bJMpVqEPatrnwJUB5q2y
 E/jiYRquOime9hKU6zMIOMLfFt6iYSNPoMl05MXSWzDuEibwJE0vuVrjKETUw4UIsW97aJs8GFD
 U05Kcflgtx2yIvDybEfhKyP5HceVXFSBuXUccKqgHdFlyxoSzSyd9pYBiQug7Zn0L3IUplW1H9S
 FY5czAXXeM4RYRzu+CVcyIPc3Bw/GyFcg97gjT6E8SppmLXuJN3W6prMBtciupw4mMc5KAFOhvA
 lLINgRRZXAvtThA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Jai Luthra <jai.luthra@ideasonboard.com>

On the I2C bus for remote clients (sensors), by default the watchdog
timer expires in 1s. To allow for a quicker system bring-up time, TI
recommends to speed it up to 50us [1].

[1]: Section 7.3.1.1 - https://www.ti.com/lit/gpn/ds90ub953-q1

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 99a4852b9381..4832128dc9c4 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -54,6 +54,10 @@
 #define UB953_REG_CLKOUT_CTRL0			0x06
 #define UB953_REG_CLKOUT_CTRL1			0x07
 
+#define UB953_REG_I2C_CONTROL2			0x0a
+#define UB953_REG_I2C_CONTROL2_SDA_OUTPUT_SETUP_SHIFT	4
+#define UB953_REG_I2C_CONTROL2_BUS_SPEEDUP	BIT(1)
+
 #define UB953_REG_SCL_HIGH_TIME			0x0b
 #define UB953_REG_SCL_LOW_TIME			0x0c
 
@@ -1320,6 +1324,13 @@ static int ub953_hw_init(struct ub953_data *priv)
 	if (ret)
 		return ret;
 
+	ret = ub953_write(priv, UB953_REG_I2C_CONTROL2,
+			  (1 << UB953_REG_I2C_CONTROL2_SDA_OUTPUT_SETUP_SHIFT) |
+			   UB953_REG_I2C_CONTROL2_BUS_SPEEDUP,
+			  NULL);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 

-- 
2.43.0


