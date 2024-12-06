Return-Path: <linux-media+bounces-22774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8459E68BD
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0440A2841C7
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFCD1DF984;
	Fri,  6 Dec 2024 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vAuKP8CW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0850E3D6B;
	Fri,  6 Dec 2024 08:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473637; cv=none; b=Nhfrgjw4LLuZBFov6amJAO6SNaoGQY+nFRH45Y17rma9Pcbq0Azk1ozD8W2NpYcPaizeRv5C+gzCBH+0GQaVx/CFSonMs74X1czyxAMzMnX3CsMLKcNmWlKNOY7B4jrdvTPBGKNKuV84n2PQCwUpJRyG1VvwEa9T228rk4WgZLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473637; c=relaxed/simple;
	bh=TyzpL4ljWdchdMNgwjJAdkLJ2/8dVV+D+7yD7CPQVcY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IoFIizZOIJNHiKHPtzydA11HEffOtVX40AVyAGe4q7emgYyPISg309YDrTABsZE4TihIH7LZW1wjO1gWS3A9cwILaJsYQ4COMWDM2BlrJQO1DtKujypc4U03YKQjOZ4wUceH2Z/wXYoxYZTZ0wk2yXCTj1axcwNJLpYYyjktWPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vAuKP8CW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4980A74C;
	Fri,  6 Dec 2024 09:26:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473604;
	bh=TyzpL4ljWdchdMNgwjJAdkLJ2/8dVV+D+7yD7CPQVcY=;
	h=From:Subject:Date:To:Cc:From;
	b=vAuKP8CWX11JxKUyXRCroleP5aDhwMWt7B2CP1rVHdt0JF8O8GqZl3ZU8xX1YBzR2
	 PIgf/fJIJabSholXwJvHxOOQ/zQgvZSBeUFiYJh3PsfBrZsSsONOq+SWWF123kG2df
	 aM5BF+bLX1/SC4S9HwfZ51U+c3v4lY0InfzzUtfY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 00/15] media: i2c: ds90ub9xx: Misc fixes and
 improvements
Date: Fri, 06 Dec 2024 10:26:36 +0200
Message-Id: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD21UmcC/3XOTQ6CMBAF4KuQrq1ppw0UV97DuOgf0oXUtNpgC
 Hd3YEM0uHwzeV/eRLJPwWdyqiaSfAk5xAGDPFTE9nq4eRocZgIMJGdM0pdpx5F2YfSZGqMVc1a
 qGhqCjUfy6wMLlyvmPuRnTO8VL3y57juFU0a9YFrWQthG1efgvM5xMFEnd7TxThauwEZwpr4JQ
 MI2zggD2qm2+0OIjYDfFQIJ3eICzlojQOwQ8zx/ADWCmE0zAQAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2971;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=TyzpL4ljWdchdMNgwjJAdkLJ2/8dVV+D+7yD7CPQVcY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVYhU1VhKulDY5mEr+VkehJHcLyojacwTKm/
 DhBqQCq/6OJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1WAAKCRD6PaqMvJYe
 9QGuEACqpafdXkgqGoJrltgzZvYe1nfbqRWSYXjb9UBQ/D/KbIfCiFtThgrAsTWNP2gQm0RDn1y
 W0OMEOhcAfa2MUWE8Daq9LmbgpVHRhfA236EdiT7Q3C++UXLwIYhmu9zeaaTMjINtQFq6QKZyY2
 4rqolJdHOlE4fKOTlDTZ4BNBfEz526Dvuh7hzxFxaZPYQ6hDTMilirLSiSVlBQsrS7QWb3b36i0
 t7lJNn1rd5EdNlvEajxyE6vKFKpeCL1F7XMvydKCDGScmN68WbJgAAZXjlZ6OclgwwDeROXr3wE
 CnzP6eI2sjso0Xe7+/4LKZ+nwG1fuQ/MqejXKlLBEUhE8gnoo9U85pfVUSXzc1FxzC8/p76INRX
 49vdJDq3ZiqzsC8XWQO6yTKuX7x8fy+m1kMyP7e0Qs1UujlnHb+vYffhSe8dYQoFWYH1NjO5Adf
 lY+KRcXYQuYpKdksv5qKS0K516O8LTzsUZOMnMX20Nns98X/OcBVAKDHIXciaTgMkDvkMUlICr8
 uthqis/V46nUUnp8jbwy0oOwi+6M0GJh2Z/Kqvq1yZneDdv1KSZvraqKTHnTZZKxB+q4qa4FSRl
 f2Zex9YPUFQejKOTILwbX4Z2XBb8Vl4XnOHIAiOZS/fkDOkfzykJN2UikPX4LUi/t2x26xOUAop
 oW4rtNreTu4iVSQ==
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
Changes in v4:
- Add Jai's Rb
- Use HZ_PER_MHZ in MHZ() macro
- Use num_rxports when setting up the DEBUG_I2C_RX_ID
- Add Reported-by's to patches that add error handling. Note: The
  patches don't close the issue, so I use "Link:" instead of "Closes:"
  as directed in Documentation/process/5.Posting.rst. However, checkpatch
  seems to want "Closes", so it warns about these.
- Link to v3: https://lore.kernel.org/r/20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com

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
 drivers/media/i2c/ds90ub960.c | 188 ++++++++++++++++++++++++++++--------------
 3 files changed, 188 insertions(+), 82 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241004-ub9xx-fixes-bba80dc48627

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


