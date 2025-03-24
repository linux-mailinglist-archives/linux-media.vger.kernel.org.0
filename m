Return-Path: <linux-media+bounces-28615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F062AA6D752
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 10:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA46C3AEBA0
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC18E25DAFF;
	Mon, 24 Mar 2025 09:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XC2q6RJm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70D525D909;
	Mon, 24 Mar 2025 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742808585; cv=none; b=lijw3N8VLcDvshmxJYtgNwzV9jTHuT+iCKwvXjV9gJqHfL3OZgtJmjb0EWcalX4Q8eGUaCoqkdZ0mpx8oEaEv5IjzCAnV/zhxzAp2EB0O1Hg0DScZEEfYqvrz1zpb+QO+mWM3gYJXVjVGI1x8yzLirIh0l7RJCKa80y0+b26cCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742808585; c=relaxed/simple;
	bh=Xo9nBCN6mL/Lwjg5NJIHhMumGF7/9tGqo46IKMyQtxg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YpJfRK1eNKNuB+1RUmXat0dnRJxbIWZiCcwk7d3HygG/57LBY2vSXHPLxd7s7MpROS9ohmkv/Btq/jRJE4wFE7B7g4MIE0SPrGQ01ib08DnN1a/0E0ppBE5xiVCfxVthm398MRp0hqj0hjoaqy0faY04dEizjopuVqct4161Me4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XC2q6RJm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4293455;
	Mon, 24 Mar 2025 10:27:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742808475;
	bh=Xo9nBCN6mL/Lwjg5NJIHhMumGF7/9tGqo46IKMyQtxg=;
	h=From:Subject:Date:To:Cc:From;
	b=XC2q6RJmMeV11n1voFHGyPiAUliCSrNcN8Id9FtWBQiOI0usr77wLjtpIPMavcizE
	 Mrsu8gcXtUvCp3O2A/oXJvMUbd1D2eHXb0rmyoNnN3luGQTwmcxn5V2awo5tZgahou
	 2HbUlBAoO8X2D5oegnKE/s+qxHHftqPMOCtMFvP0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 0/3] media: ti: cal: Add streams support
Date: Mon, 24 Mar 2025 11:29:16 +0200
Message-Id: <20250324-cal-streams-v6-0-28c93fb8f0c9@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO0l4WcC/23OTW7DIBCG4atErIM1Y34MWfUeVRfEHmKUGCqwU
 KvIdy/OJlKT5SfNPHrvrFAOVNjpcGeZaighxTb08cDG2cUL8TC1zXroBRgwfHQ3XtZMbin8bFE
 Y6EdtvWTt4zuTDz8P7fOrbZ/Twte5HT8NAT0CDEp1aBG15MjXtISuutuVQqT4ESZyJcVzcnnqx
 rTs8hzKmvLvI7PK3X9fVHcPvRg0AoGV+lXbw6p6Ehb/EYoDl0ahh0F4ZdwbYtu2P6zRnDA6AQA
 A
X-Change-ID: 20230808-cal-streams-b913802c69f4
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Xo9nBCN6mL/Lwjg5NJIHhMumGF7/9tGqo46IKMyQtxg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4SYAuBVMtjMleczSfGi06i+lOv88DzayuiEHD
 584OZ1M1RSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+EmAAAKCRD6PaqMvJYe
 9bpxEACHZuuL+B/fhe5f0a0nSf+ysgFYSgYav3979t3w65qe+NH3uhx0jSfD/jy/eCOLujKRwSz
 C4zapNkUXJvjXWK8GgMw4+Iv0Lc9KhSfPsS7pq/UuOF4I4TzZuyeSOAREnJL6jXJNsM1hYwSd1g
 vkyE+hrxRCgkg1nM2Ew4DnBHr9YuSI8ysnA1VMxxS4imNxZypHUUbFgwMJ0VC8lVynhxnhFvCA4
 2Ez4owR3fowPRvP6PDnXJa9lTPekKM2WJpYLNEgsieEf39GTllKinz/c9/lRV59k6HhBYKiACmR
 7jigZ4y/+y6oyrozWbcaGYEhH2WuMr9OzD/is4OSxidkx1AZIbTzJ+pQcGZ18vEmDm88DA0d4is
 QPM0nJV3eCDTKRmAqb+/iWhjzcaDxsChKX7Oc+LmTWYzJyht8JrqhbTqyF/FED2Mx0RWXci40dw
 74Uw8ejQrM8NQDvRgzhQeo2h/1hx3hfSFq/lmcKVTHEa5RClIuInlQGIG9VnBrpFsC2zr/w73p4
 x+uu0Fov8dnhaMGMxlIFhbFikerG95vmqOJZGHmVkkwGrFiQEnVfdCrgqzqlrVVtZfKHMOwD6xf
 Nh5LilU0zB/jWvrdYXhCID2OTkl49JWRDEuNjpVvg4yNYWT+78uTKCLq1L5xuhAG5QwgVtO2Ntv
 e9BFSsdg4HlkO6g==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

This adds streams support to TI CAL driver (and two minor improvements).

The previous version was sent in 2023, but there has been no changes
except from rebasing to upstream.

 Tomi

---
Changes in v6:
- Rebase on top of v4.16-rc7
- Add two small patches (not related to streams as such)
- Dropper the metadata patch for now, to make the series apply to plain
  upstream
- Link to v5: https://lore.kernel.org/r/20230918-cal-streams-v5-0-4851f073f58a@ideasonboard.com

Changes in v5:
- Some improvements in the patch description of the first patch
- Add "media: ti: cal: Add metadata streams support"
- Link to v4: https://lore.kernel.org/r/20230808-cal-streams-v4-1-1f37610e0946@ideasonboard.com

Changes in v4:
- A few minor formatting changes
- Small changes regarding how the code handles metadata formats.
  No metadata formats are supported yet, but we do have some code to
  ensure that metadata formats aren't allowed on video nodes in video
  capture mode. A future patch will enable metadata capture, allowing
  the runtime change of video nodes between video and meta capture.
- Link to v3: https://lore.kernel.org/all/20230302100755.191164-6-tomi.valkeinen@ideasonboard.com/

---
Tomi Valkeinen (3):
      media: ti: cal: Use printk's fourcc formatting
      media: ti: cal: Fix wrong goto on error path
      media: ti: cal: Add streams support

 drivers/media/platform/ti/cal/cal-camerarx.c | 271 +++++++++++++++++++++------
 drivers/media/platform/ti/cal/cal-video.c    | 157 ++++++++++------
 drivers/media/platform/ti/cal/cal.c          |  45 +++--
 drivers/media/platform/ti/cal/cal.h          |   3 +-
 4 files changed, 348 insertions(+), 128 deletions(-)
---
base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
change-id: 20230808-cal-streams-b913802c69f4

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


