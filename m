Return-Path: <linux-media+bounces-26954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3072A4404D
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 14:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F33B18970E7
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 13:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F70C26981C;
	Tue, 25 Feb 2025 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m2YYPlE/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C17E268FE0;
	Tue, 25 Feb 2025 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488959; cv=none; b=ekMaNSNnGtIXM1Q9q4ILbfEzXhP8FeSiVfkFBhLUu7cIsX9CkQxivU/wdJ+VS8peKqoEBE1T2NjAKpV2gaSBKT9MAEuKOxDqFyDxEMN7OOGb4zAteB5tBT73CfvKM7BDt2TPfEST0a4wRKkFEPblu1Wcz9ewYAWDgO522OS/QJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488959; c=relaxed/simple;
	bh=G7awnzToNUy7mW4PV6EH6k9+Z2pQLMHAQTl2CVo5Lvg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E5jQ/0Okl4Kv+kY9g4vgDj6RsDcje7Xie5MKIcoOUl3W47YkYusefsKjSz3ph2N8j4LNXArsMBtf+CWYsvZH5AOdZRXNRDbu1utgs6oK09R6L7krknbl2cQ4xQpicvkdklLuOb6dOrq0oEaHkGj/HryiTX5sgEwMjepfEt5G+IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m2YYPlE/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC3EBC4CEDD;
	Tue, 25 Feb 2025 13:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1740488959; bh=G7awnzToNUy7mW4PV6EH6k9+Z2pQLMHAQTl2CVo5Lvg=;
	h=From:Subject:Date:To:Cc:From;
	b=m2YYPlE/e5CNePICJiJ0EpOq7Ky2ct59IGy/utmh2ewkWlW6QsGnP0cky0S7bbbYE
	 sVJGklhKiVJUNhRJAZbBaDEIV/mnidZD25Zu0rJDDMMbweuwA2Ssdt/8JfYKPFIiaU
	 JR+lx6mrlIiFittH99CPgaSv6hUzzqjKDq2qQ+sY=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA6EC021BB;
	Tue, 25 Feb 2025 13:09:18 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Subject: [PATCH 0/3] Fix analogue gain maximum for ov9282
Date: Tue, 25 Feb 2025 14:08:39 +0100
Message-Id: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANjAvWcC/x3MTQqAIBBA4avIrBvIIaG6SrTwZ6zZWChIIN09a
 fkt3mtQOAsXWFWDzFWKXKlDDwr8adPBKKEbaCQzEhl0E151oZnwsJKQo/bBOmtcDNCjO3OU5x9
 u+/t+x6CGd2AAAAA=
X-Change-ID: 20250225-b4-ov9282-gain-ef1cdaba5bfd
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740488957; l=1042;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=G7awnzToNUy7mW4PV6EH6k9+Z2pQLMHAQTl2CVo5Lvg=;
 b=5p2rAjjPKVLFr0+2xXN3lP9htymOr7PjqvnUo/2PMystoPS7YDi/E8HdlJQjbENmaIXwF3dnv
 +GMqHGrpdvzArP69tqyfa30E+hfby/vN2UsJBSG5U7KxncBk+pySX0R
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

This series fixes/increases the analogue gain maximum value of the
ov9282 sensor driver to the limits specified in the datasheet.

It furthermore introduces a new register definition (including its
values) and uses available defined registers instead of addresses where
possible.

This is basically a first improvement/cleanup series for the ov9282
driver with likely more to follow.

All register addresses/values are based on the OV9281 datasheet v1.01
(09.18.2015).

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
Richard Leitner (3):
      media: i2c: ov9282: use register definitions
      media: i2c: ov9282: add AEC Manual register definition
      media: i2c: ov9282: fix analogue gain maximum

 drivers/media/i2c/ov9282.c | 40 ++++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)
---
base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
change-id: 20250225-b4-ov9282-gain-ef1cdaba5bfd

Best regards,
-- 
Richard Leitner <richard.leitner@linux.dev>



