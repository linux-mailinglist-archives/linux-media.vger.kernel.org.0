Return-Path: <linux-media+bounces-21124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A5C9C1934
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9487283334
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D49A1E1C2B;
	Fri,  8 Nov 2024 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vyD12+Ni"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054B81E1A14;
	Fri,  8 Nov 2024 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058518; cv=none; b=nU3LV7e56xePojUrUQ0csr1OXSXDD92kfPnlBEJZChRgfLFZhgkdsQJcFuGxqU82ZOCKh08FjCSqPiBqQxPnbMQ05eHFgah0WLjUie+zcMSY6wlugLsRfxHpUF59nYfE7WFzYM7/MoZ4d8vQORWYMVvD3dNDs6DGJ9Ls/zgUCnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058518; c=relaxed/simple;
	bh=1rMRkL6GYqPt1KiHnsQ7qGPywVaTGen459WwEQOQZqI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hqtgmY8uaSvjIUO96MYf6zaQDkUZ9wiyKraX1xHykGcLmzTWBCrsMcibVYtyIEO/aoSg9TjdB/20OO/pX6xaYXGMya62PkCFOlpLJwDEm+oIcw2Ceb6Frvr8YzexhtOqusm8l3W/fHd+Tn0s0rwa+L+a5ssrcb6b6pJ4pRkSwrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vyD12+Ni; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DA7A3D5;
	Fri,  8 Nov 2024 10:35:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058506;
	bh=1rMRkL6GYqPt1KiHnsQ7qGPywVaTGen459WwEQOQZqI=;
	h=From:Subject:Date:To:Cc:From;
	b=vyD12+Ni5QNNxbWrDPMSJJlpGArygHJWI50EtUOpR6d+1HabTATBiI24MeVLtiq3l
	 uRi3wjRjAFBpAV8kmXzKLxUwycIt4XxA0s5eJrN15m1QSI0m+A2Ujfc9frcx+7CJhV
	 dXwGVT8Rh+YB40Uj52OB/lRzPnr5qM1PNTKIj88I=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 00/15] media: i2c: ds90ub9xx: Misc fixes and
 improvements
Date: Fri, 08 Nov 2024 11:34:44 +0200
Message-Id: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADXbLWcC/22Myw7CIBBFf6WZtRgKhKIr/8N0wWO0s7AYUIJp+
 Hexa5fn3pyzQcZEmOE8bJCwUKa4dhCHAfxi1zsyCp1BcKFGzhV7u1Ot7EYVM3POGh68MlpM0I1
 nwv3ownXuvFB+xfTZ42X8rf87ZWScoeRWaSn9ZPSFAtocVxdtCkcfHzC31r6T5nzErQAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=1rMRkL6GYqPt1KiHnsQ7qGPywVaTGen459WwEQOQZqI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtKcFwpoKyRFh9743ZkwFWsmQHNp0FgJW9yY
 oyWGnueVy+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bSgAKCRD6PaqMvJYe
 9XGxD/sGJ5ufj3l3zRsHGUafWsdLQ56W8cdVqc9mWOYXYFCf/aMA63TGIHaxUYiABP/BUZbglai
 RBIyFWfxenVfCsaSYdIOkNZSIhs6w/gZ/+eApaC9J+7mb0CtFzcl6D7Yh1jJ5V1j+E3ZTUNJqf2
 aj0EBzMv3S7RDYVxauu3KE2YnQCOEoil3yJ5wuxp/3aY3zp8LfVKBb81d4zUbI3WH18t+VBIaNm
 KhfrN/Rg74WBhoLqgg/Fk4rSHyI5lYDd793GVhqk6RW/8IaD3i5Il+94aQfVuv1xM9V3v9uajRM
 JlEXOqc1dDp3yqjiyBXlB4eSMDMLBKjrJduQ25Ej+M78wn5ggkSU+07mcalnX3KOYa35u0SodgR
 ZaRxP1QoJ+4g6u6k93zNmXegH5cAvEowJyrOlBuLQG0vHhZ/XcHwWUnzAbrv3VE4ucA1iJw2aZi
 bsC5k+YR8nYMT5yEHKVHJ2QBKQSq+wnfDsmG5rYLwpiiaWZOpQQKXhv6vqtG4o+WQAWa683nqNN
 x4sYmnNf8ov2Fe1Kw/jXs7x4fFWOKswCYJbjAqWzsnC5aaWzUMKff6nUxq7l0SFOSqoTL7yTCsV
 vMIZ2sRamT/InQ+/tb30nP7SnhMd0RfPOQtRXe7mzZSnXPwPcJbiiwBQerd4l9aVKcdtWZXnF7Z
 48toyvsUQZ8Z6mw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

This series fixes various small issues in the drivers, and adds a few
things (a couple of pixel formats and a debugging feature).

It also takes a few steps in adding more i2c read/write error handlings
to the drivers, but covers only the easy places.

Adding error handling to all reads/writes needs more thinking, perhaps
adding a "ret" parameter to the calls, similar to the cci_* functions,
or perhaps adding helpers for writing multiple registers from a given
table. Also, in some places rolling back from an error will require
work.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- Address comments from Andy
- Add two new patches:
	- media: i2c: ds90ub960: Fix shadowing of local variables
	- media: i2c: ds90ub960: Use HZ_PER_MHZ
- Link to v1: https://lore.kernel.org/r/20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com

---
Tomi Valkeinen (15):
      media: i2c: ds90ub9x3: Fix extra fwnode_handle_put()
      media: i2c: ds90ub960: Fix UB9702 refclk register access
      media: i2c: ds90ub960: Fix use of non-existing registers on UB9702
      media: i2c: ds90ub960: Use HZ_PER_MHZ
      media: i2c: ds90ub960: Fix logging SP & EQ status only for UB9702
      media: i2c: ds90ub960: Fix UB9702 VC map
      media: i2c: ds90ub960: Add support for I2C_RX_ID
      media: i2c: ds90ub960: Add RGB24, RAW8 and RAW10 formats
      media: i2c: ds90ub953: Clear CRC errors in ub953_log_status()
      media: i2c: ds90ub960: Drop unused indirect block define
      media: i2c: ds90ub960: Reduce sleep in ub960_rxport_wait_locks()
      media: i2c: ds90ub960: Handle errors in ub960_log_status_ub960_sp_eq()
      media: i2c: ds90ub913: Add error handling to ub913_hw_init()
      media: i2c: ds90ub953: Add error handling for i2c reads/writes
      media: i2c: ds90ub960: Fix shadowing of local variables

 drivers/media/i2c/ds90ub913.c |  25 ++++--
 drivers/media/i2c/ds90ub953.c |  56 +++++++++----
 drivers/media/i2c/ds90ub960.c | 186 ++++++++++++++++++++++++++++--------------
 3 files changed, 186 insertions(+), 81 deletions(-)
---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20241004-ub9xx-fixes-bba80dc48627

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


