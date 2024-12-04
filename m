Return-Path: <linux-media+bounces-22591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C8F9E3844
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5DA9286F36
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F25E1B413E;
	Wed,  4 Dec 2024 11:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LGaxZ0Eu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266811B21A6;
	Wed,  4 Dec 2024 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310347; cv=none; b=pYcgMr0B1osprTlS1FnmOVdXdv+u33v6EUxLMORg7BJ5nnfEeExSnRBx8CxFCXzeDYnhvFQv8hSUixNlsHHbN1sg2Md6hzqkBCi688WQCz7SvzEHiAsPEAUHrPZKQk+bcKdW09vblyhjTMYA4RVnVE88Jfbr8rglpeOmYnraqjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310347; c=relaxed/simple;
	bh=c503PyijQRCSJhJm7VYaVdgRzKNLwzVVuquZMgWfAKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mcDsdRzy/trgdgF5230A/WgdPaQR30cHTManAjnPUwMjSss2q8qTfunXPMg3FbiU7k0iR5RpnCOE3NO9JRsbikVbu2+LRnkjvdfX0lSZaJOgPERtJgoI2Yu4LP/K2vefPo4+H7umXkB2oaO5XHldT28gwyNypNXkOC5/tiZvC2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LGaxZ0Eu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D18724D4;
	Wed,  4 Dec 2024 12:05:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310316;
	bh=c503PyijQRCSJhJm7VYaVdgRzKNLwzVVuquZMgWfAKo=;
	h=From:Subject:Date:To:Cc:From;
	b=LGaxZ0Eu8rF5O2xPE0yBjK0C3bb8ADOQ+PFi0bBFeJMNTiAMHVYGjqoWvGOxoSzYW
	 7jBjxGh68/cmhtCy2ehSuX23Z8UFt+Tr1K2HYtlp7j0a4XPQKUF4G84Q4GNMcjDL2w
	 gT0zUZapT3NoUgyj/vOJF+cXDL9xH5UMxqzOt8UE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 00/15] media: i2c: ds90ub9xx: Misc fixes and
 improvements
Date: Wed, 04 Dec 2024 13:05:14 +0200
Message-Id: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGs3UGcC/23Myw6CMBCF4Vcxs7amt0Bx5XsYF70MMgupabXBE
 N7dwsaYsPxncr4ZMibCDOfDDAkLZYpjDXU8gB/seEdGoTZILrXgXLO366aJ9TRhZs5Zw4PXppE
 t1MUz4faog+ut9kD5FdNnw4tYr/tOEYwzVNzqRinfmuZCAW2Oo4s2hZOPD1i5In+E4OafkJXwb
 XDKSRtM1+8Qy7J8AYGXr1LwAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2486;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=c503PyijQRCSJhJm7VYaVdgRzKNLwzVVuquZMgWfAKo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDd+PTg/XW+FjZxSGEwZcb4g2llLRlYz4L2C2
 Jb1MQhIHjWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3fgAKCRD6PaqMvJYe
 9byfD/4/dPEGLTolgTM6UMLUGR1HOUMIJovKCxc+zLG08Gaw4l6ZxS5AXXpT7WvZZlOwUA3C/we
 nCcBmshrfgNhqWIIsnNOfzjJ3m50XG574E1D007pgRqJqvYfZrPp2IQ0mnnKnxWfdmhSQVj0Lop
 sk8ZtAZ47YBnY+gER0hPR46GDF7eG8yNgLbR4WhKnvFrz5tg4Xv6APSMOLqFKI1y3uHKrGdTQ8s
 MuJepSeCeIkIAkd4rwSRvusP4ooNAAbO1G2nxJXbxDpIjgIceVGeay+Ji/DEgxysSiZWxnqyYAm
 UPLHwAeUa916AtqgYLZINKHBwsB8aCSD6F7ZNcTwwqo1I5IG7FJg5RiJqiQQsGaxxuX2QpbllU2
 vJOtPip7N5cctG3FXIyLnnhBJJQJBaiwVfnFTp0OSE1ZzRPvCm8jHdCQWPQYz/wv3OEQswJLJN8
 /cW2mwWrbmQp141rFL3KvLpUflyFJZ1lWh/xC3/Ce6Q+FkqMWLqiYDn3Xnel/DN6hwKY4V1LP47
 QP9Bw093S1Xv4bKKLWU2bGdSH9vNAREoVsJRu2Sr4RkSEJmfUkLlqbJfTzjAGPC4GX1A8QsEB6o
 T2VFtObrjNv62xR5fWmwP4Q8zV24c5xMBTI2RB/W5AE5PYbYErjWiGJW9kTb2g3EDxDTHlyfrMi
 Hv9TuHFS2aAcHRA==
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
Changes in v3:
- Include bitfield.h for FIELD_PREP()
- Cc stable for relevant fixes
- Link to v2: https://lore.kernel.org/r/20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com

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
      media: i2c: ds90ub960: Fix logging SP & EQ status only for UB9702
      media: i2c: ds90ub960: Fix UB9702 VC map
      media: i2c: ds90ub960: Use HZ_PER_MHZ
      media: i2c: ds90ub960: Add support for I2C_RX_ID
      media: i2c: ds90ub960: Add RGB24, RAW8 and RAW10 formats
      media: i2c: ds90ub953: Clear CRC errors in ub953_log_status()
      media: i2c: ds90ub960: Drop unused indirect block define
      media: i2c: ds90ub960: Reduce sleep in ub960_rxport_wait_locks()
      media: i2c: ds90ub960: Handle errors in ub960_log_status_ub960_sp_eq()
      media: i2c: ds90ub913: Add error handling to ub913_hw_init()
      media: i2c: ds90ub953: Add error handling for i2c reads/writes
      media: i2c: ds90ub960: Fix shadowing of local variables

 drivers/media/i2c/ds90ub913.c |  26 ++++--
 drivers/media/i2c/ds90ub953.c |  56 +++++++++----
 drivers/media/i2c/ds90ub960.c | 186 ++++++++++++++++++++++++++++--------------
 3 files changed, 187 insertions(+), 81 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241004-ub9xx-fixes-bba80dc48627

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


