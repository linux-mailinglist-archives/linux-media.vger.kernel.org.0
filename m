Return-Path: <linux-media+bounces-28604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E137A6D5AB
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D59B7167CBA
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 08:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3650725C705;
	Mon, 24 Mar 2025 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kxl8tMhN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A4F7DA6A;
	Mon, 24 Mar 2025 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803251; cv=none; b=jnkl+WqTy8k+h+Z0AwWJRIuYDwRg3iIF+e4UGeBevieds4V4o32Iz+s2UQ55VUUhnPTaC1Ok6iqPN7xbgN378A9mEgrRzidb9hxcgNnlhXRvY96ItIzySWC8s0vJgnzoBLz+slPEWIXZEltPcE+6E8Unf8RW1qJL57wVgmby8eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803251; c=relaxed/simple;
	bh=Xzcw1BtlkR/+iN7LtWJ22AtU6+0dkY0+i3jRmU9vpKk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rh5HzlP+G6iPFYo7HQ0oBnhaiKHCRgSQBZi1CwjuQcopeJzp40rf3dZrYli1ZmD7DUJDlRXMFlkEqleAnG3n90mjRjtsQN3N9qO+aawGhyjK0Y/R6Mrk+HeL8UGiWrGIlyUjmkbj8PqhIpQblQ02+NmWJy1WCHbjrC8eGdEtfO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kxl8tMhN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAE7D455;
	Mon, 24 Mar 2025 08:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742803136;
	bh=Xzcw1BtlkR/+iN7LtWJ22AtU6+0dkY0+i3jRmU9vpKk=;
	h=From:Subject:Date:To:Cc:From;
	b=kxl8tMhNBpJ8PXqU8ApT/7/C/EROl3dzS8SpynnKJhMOVIge24FgiTUjY8AwDC3lN
	 rIu4lD26pTVLA3LQDTMvusi89feok9v/d0dbcUi/aVVNAsrFWUXM3lCIZW4oEAIEu7
	 kPFClxXM012HYdElKaCTdn552dp/gIziSGsR0WpE=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v3 0/3] media: subdev: Add v4l2_get_frame_desc_passthrough
 and use it
Date: Mon, 24 Mar 2025 10:00:10 +0200
Message-Id: <20250324-frame-desc-passthrough-v3-0-993839a1f9b3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAoR4WcC/4XNTQ6CMBCG4auQrq3pL6Ar72Fc1HagXUBJBxsN4
 e4WVi40Lt8vmWcWgpACIDlXC0mQA4Y4lpCHilhvxh5ocKWJYEIzwVvaJTMAdYCWTgZx9ik+ek/
 rumUaFJenRpFyPCXownOHr7fSPuAc02v/k/m2/iUzp4waKZRuOy0bri7BgcE43qNJ7mjjQDY5i
 0/t9FMTRdNcaqcbsK42X7R1Xd+KEONtEQEAAA==
X-Change-ID: 20250218-frame-desc-passthrough-66805e413974
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Xzcw1BtlkR/+iN7LtWJ22AtU6+0dkY0+i3jRmU9vpKk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4REltfkGugoeQqcue+21xj6jsuXTXjgBP9uZ3
 M4FZ8sJMnuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+ERJQAKCRD6PaqMvJYe
 9a56D/wNh0gyCQdF1JFL7k4EHwYn6ktPDs9Qd5BzGQBwGqf+We2MBbSoG2VUzJMN9MttALxmCPm
 9KepmXPUIMn13UtqnluKq2iyi9ZN3IMy1rcovntxzudt1pzw5o4p6A/NEyZHVuqC0RYKoY0Jg2h
 WCKDNOpxPUuV0sJrgcqJizzsB/nMhitMiZuNBaxVbcdvvoz5vg+uETyF/rUrAh8HDk8pbECyKUe
 d7oCAfiZMbXoGgjKsEeqEsApgna9JAuH84pBjCD2McMyuYxiA6wLFDwZViO+OZ90cNWbes0VeaA
 axwZdY5C0R7/8Jcro4FauOh3K/bAFPLbCWL/UX4XClrDdd12RadeTrN+pLGSe1JgcGbiMl2qjT8
 38XaCqHBgaba64RMx9xwfiX5jm4aItakZ3cQi1tXanNc9Mk/GnxsWFTjBbCbAgVV0RR5Qq5mhY/
 JpmhLbnooGzcGddTM26RIcVmMexxWT1uO5s50QSuiiTooNE8A0SZE5VX7R9M/QyHKk33EGWA0MY
 187fW0pBobuBESnBXCt/BnzOftpgQWOlP1f44auz1oilwBVFI+5pn1uwZfg12L/FRwFzZ1zHNdi
 u3zr87I5/WcZbkMJGUZW5+5w75rAxHHWQkzQI0VO1Lf9gEZpoEfysFLxX4R6efFKydl9LW4N9d3
 oGyHKo9BOCyZiWw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

When writing the exact same code the third time for Renesas, I thought
we probably need a helper.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v3:
- Rename the helper to v4l2_subdev_get_frame_desc_passthrough()
- Check for fd->entry[] array overflow
- Add error prints (with dev_dbg)
- Link to v2: https://lore.kernel.org/r/20250219-frame-desc-passthrough-v2-0-5135d57ecd6a@ideasonboard.com

Changes in v2:
- Fix "uninitialized symbol 'ret'"
- Reorder local variables
- Link to v1: https://lore.kernel.org/r/20250218-frame-desc-passthrough-v1-0-a32458f53714@ideasonboard.com

---
Tomi Valkeinen (3):
      media: subdev: Add v4l2_get_frame_desc_passthrough helper
      media: i2c: ds90ub953: Use v4l2_get_frame_desc_passthrough
      media: i2c: ds90ub913: Use v4l2_get_frame_desc_passthrough

 drivers/media/i2c/ds90ub913.c         |  59 +-----------------
 drivers/media/i2c/ds90ub953.c         |  61 +-----------------
 drivers/media/v4l2-core/v4l2-subdev.c | 113 ++++++++++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           |  22 +++++++
 4 files changed, 137 insertions(+), 118 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250218-frame-desc-passthrough-66805e413974

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


