Return-Path: <linux-media+bounces-38931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 825E8B1B434
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 15:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31862622AD2
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03712750E3;
	Tue,  5 Aug 2025 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elMe3RGs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99C8272E7E;
	Tue,  5 Aug 2025 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399420; cv=none; b=TtoCuNuhOlbywtBFlMFE9MfNqpUhMW9x+5nBT96dF/NewoRC0jdEL/K+GCt1k1YGMZNqZp/Jz+uCE5nI44BoOhmMUbHbnCyq8O8rStB1m6BCEpJg4oztVJOR+hgtNKMO0Nx93FXab3V51iF3PYm7aCtuAlbApFm+ysuIgAvRrPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399420; c=relaxed/simple;
	bh=aFM77PO7HHy7VDzh5vwun+TX8SVe/5/ToPZlsE7RqyY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kbwu7OB/CmiHpxqvkMeYWul9/gXQ8MxzP16NZSAqa7BFkiefISTezgZSnqJYc3bt+2446mmyHrDQqrJWSyQ+nUfU0XaFGc7Th5z3cJgOkGO22F4GuAWl5ZZYqG1+qXNkucNeSAUWnhOvD/yVsIr3TXSbWEe+Va/TGT9DjtYabHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elMe3RGs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552F0C4CEF4;
	Tue,  5 Aug 2025 13:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399419;
	bh=aFM77PO7HHy7VDzh5vwun+TX8SVe/5/ToPZlsE7RqyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=elMe3RGsiHHsxpfy3yVmwV2/0KEE98x5uV5qRiWZtOgrpx38w4wTYrONubNZaxEkQ
	 n+GybAPzJ+mmpZsu+7iNbsthdcPsUxcHnNHnzflx282PJ0P56HO63A7MT0Fy/8TXH8
	 etvZ/ql4nmUNojRlx5okr1yakmf2mq5FP/mi72vcc+GLULqxRN7gPX7ragyakVCfPD
	 M/QegimD3sB/Fyd4hqV9zfNeiMds7t59d17niP1r8QP6f7zbmhySXOnHMdv72LXrj6
	 BaQt3igyhP3YOZa57BjEA5Shz5XJ17Uwhov34SRf0UqCUGavQWLFfJwHojbhfk3303
	 wd1uaZSHy8IrQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.4] media: usb: hdpvr: disable zero-length read messages
Date: Tue,  5 Aug 2025 09:08:50 -0400
Message-Id: <20250805130945.471732-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

[ Upstream commit b5ae5a79825ba8037b0be3ef677a24de8c063abf ]

This driver passes the length of an i2c_msg directly to
usb_control_msg(). If the message is now a read and of length 0, it
violates the USB protocol and a warning will be printed. Enable the
I2C_AQ_NO_ZERO_LEN_READ quirk for this adapter thus forbidding 0-length
read messages altogether.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have enough information to provide a comprehensive analysis:

## Backport Status: YES

This commit should be backported to stable kernel trees. Here's my
extensive analysis:

### 1. Bug Fix Nature
The commit fixes a **protocol violation bug** where the hdpvr driver
passes zero-length read messages directly to `usb_control_msg()`.
Looking at line 122-123 in `hdpvr_transfer()`:
```c
retval = hdpvr_i2c_read(dev, 1, addr, NULL, 0,
                        msgs[0].buf, msgs[0].len);
```
When `msgs[0].len` is 0, this results in a zero-length USB control
message being sent at line 71 in `hdpvr_i2c_read()`:
```c
ret = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
                      REQTYPE_I2C_READ, CTRL_READ_REQUEST,
                      (bus << 8) | addr, 0, dev->i2c_buf, len, 1000);
```

### 2. USB Protocol Violation
Zero-length read control messages violate the USB protocol
specification. This isn't just a theoretical issue - the kernel now
warns about these violations, and they can cause actual communication
problems with USB devices.

### 3. Similar Stable Backports
The pattern of this fix is identical to other drivers that have already
been backported to stable:
- `i2c: robotfuzz-osif: disable zero-length read messages` (commit
  8bc5879c038f)
- `i2c: tiny-usb: disable zero-length read messages` (commit
  4e093e67e5a9)

Both of these commits explicitly included `Cc: <stable@vger.kernel.org>`
tags and have been backported to stable trees.

### 4. Small and Contained Fix
The fix is minimal and safe:
- Adds a simple quirks structure with `I2C_AQ_NO_ZERO_LEN_READ` flag
- Only adds 6 lines of code (quirks structure definition and reference)
- Doesn't change any logic flow or introduce new features
- The I2C subsystem respects this quirk and prevents zero-length reads
  from reaching the driver

### 5. Real User Impact
This bug can cause:
- Warning messages in kernel logs that alarm users
- Potential USB communication errors
- Incorrect behavior when I2C devices attempt zero-length reads

### 6. No Architectural Changes
The commit:
- Doesn't introduce new features
- Doesn't change existing APIs
- Doesn't modify core kernel infrastructure
- Only adds a defensive measure using existing I2C quirk infrastructure

### 7. Clear Backport Criteria Match
The commit meets stable kernel rules:
- **Fixes a real bug**: USB protocol violation
- **Already causing problems**: Warnings are being printed
- **Obviously correct**: Uses standard I2C quirk mechanism
- **Small change**: Only 6 lines added
- **Tested solution**: Same fix pattern already in stable for other
  drivers

The commit should be backported to all stable kernels that include the
hdpvr driver, particularly those where USB core started warning about
zero-length control messages.

 drivers/media/usb/hdpvr/hdpvr-i2c.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/hdpvr/hdpvr-i2c.c b/drivers/media/usb/hdpvr/hdpvr-i2c.c
index 070559b01b01..54956a8ff15e 100644
--- a/drivers/media/usb/hdpvr/hdpvr-i2c.c
+++ b/drivers/media/usb/hdpvr/hdpvr-i2c.c
@@ -165,10 +165,16 @@ static const struct i2c_algorithm hdpvr_algo = {
 	.functionality = hdpvr_functionality,
 };
 
+/* prevent invalid 0-length usb_control_msg */
+static const struct i2c_adapter_quirks hdpvr_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN_READ,
+};
+
 static const struct i2c_adapter hdpvr_i2c_adapter_template = {
 	.name   = "Hauppauge HD PVR I2C",
 	.owner  = THIS_MODULE,
 	.algo   = &hdpvr_algo,
+	.quirks = &hdpvr_quirks,
 };
 
 static int hdpvr_activate_ir(struct hdpvr_device *dev)
-- 
2.39.5


