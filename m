Return-Path: <linux-media+bounces-55380-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IZJFH1dsWl/uQIAu9opvQ
	(envelope-from <linux-media+bounces-55380-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:18:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F5263802
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5DC963010682
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 12:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8263CAE8D;
	Wed, 11 Mar 2026 12:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vQHFo6/Z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E813DCDA9;
	Wed, 11 Mar 2026 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773231471; cv=none; b=t6UkhFUI0jB5D7GJ9VSXmnpvRDOnoZVkGgEWAoL7Yxk2oghsfboNCdCNGZsQz+aYy9dDADcJYAPfMMDaQ3I0haD+beEGR8dO5IpOaqWFTe+2o3IN3yrwM2wSI6XtpTwRVRp076SiaDWR2nYGVQ+I4ISBaZlx60Amy2gZ85m48HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773231471; c=relaxed/simple;
	bh=VEiO0Z4VOTcU9BYRSt6pMLnUTCS/gShWTscLbn8tnNU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P6zqPxKebxvzMcEMiCDGH8obcRSBpuv1eR/JmBJ8q1qLZCKRe+qIs0QVG9fFN84IW8HjZHUzPX2Tzup5a3jEXN+280o81J/SRL8vvHNmSK+Nhca4kPb8JLF2BmIt80bwcjR08cfaWkqq/SFJwnuQDw3ZQKyPbtsI4VS136CYKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vQHFo6/Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19AC72D9;
	Wed, 11 Mar 2026 13:16:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773231399;
	bh=VEiO0Z4VOTcU9BYRSt6pMLnUTCS/gShWTscLbn8tnNU=;
	h=From:Subject:Date:To:Cc:From;
	b=vQHFo6/ZUWhrBg2efWjFElSg9YFSvUPHaGM43aK4BWZF6HDR9P5L1/1oCwHKkAEyY
	 OO030BEH7DSBgkpoS6tRgyIvtGcoBuYeB7QyC8dtalXyoIBzCwZJL7XNtfRab8RLk6
	 O+1pkYFmJmxdEAo38P385ItZYb1Q+4B1h7ZjaV8U=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v5 0/3] media: subdev: Add
 v4l2_subdev_get_frame_desc_passthrough and use it
Date: Wed, 11 Mar 2026 14:17:18 +0200
Message-Id: <20260311-frame-desc-passthrough-v5-0-d59876bbb663@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE9dsWkC/43NsQ6CMBDG8Vcxna2hdy1QJ9/DOJT2kA5S0irRG
 N7dwqKDRMf/Jff7nixR9JTYfvNkkUaffOhzqO2G2c70Z+Le5WZQgCpA1LyN5kLcUbJ8MClduxh
 u546XZV0okgJ1JVl+HiK1/r7Ax1PuzqdriI9lZxTz9Sc5Cl5wgyBV3SqshDx4RyaFvgkmup0NF
 zbLI3xqelWDrCmByqmKrCvNioZvLU+vapg1rbFGbUSrG1zR5H+azJprCKQA0JW1X7Rpml6oK7t
 mrQEAAA==
X-Change-ID: 20250218-frame-desc-passthrough-66805e413974
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1890;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=VEiO0Z4VOTcU9BYRSt6pMLnUTCS/gShWTscLbn8tnNU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsV1kFRDNl4pjODksBicSHV3G0FFL6XDFkwkKz
 E9xwj8F8iyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFdZAAKCRD6PaqMvJYe
 9Y6KD/900AgkpmB57q/wB/4XRuF0ek7divTVI1SebDpMepPl+CBUPvMJ0sQod0dYTdvoDnTpfNp
 JbBxUZ5k3ZkyCFu4d1LcJQAtej12GWi9Jo4LXZVkMCDIBfe+ueePaRKRro3T9TPpgYfduIrhV5U
 4pj44irzEMtfHD+MUZ1hNKc4O6EdYpeMEhL20mPl2Lfw/PWKnIrj2x40nTzRp9piCGdT0hC3RiX
 Fno5TgynWEf/DtGmU+aYZmCCieHRcmhVJObrXtsNoTL6zar8gzEj2ps0wRB4vanbfcubr+270LX
 42ilahJPIZy/Xxkua8LURlbAz2rSgSGbftENRocaXBDaWqIPut9AwyqtoWRoT5LFd+EM46OfDhy
 gK7pv0S9epO8GANpBTZxcJ88i+S5Tnz2HrKk3DiIREFXZl678oA+l6Qe5/zcNFNa5LF+VD6oJSm
 7CuWtChEkLjdch1XMq4FgaAoUx7lbq5x/y/RhySLxnEDvvDzmPTh/OVvwO0+tSe/Y2ohBNTf51z
 b/Xr0gI7iW8QnvwyLWJMG6d+q6CJbJgndXAISjOA+hqIYCUQfpFN5fTbvSBkASOb6uyf1zgLpR/
 vkcr+wbJzdY3jIStHWVvFIAXt7hsOpHOWsqHXoyXyb7bJ2e4Y+R2heraeqzBa7ybxw8HkgiGTQH
 0ylF3tAxUx8+hpA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 876F5263802
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55380-lists,linux-media=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Action: no action

When writing the exact same code the third time for Renesas, I thought
we probably need a helper.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v5:
- Minor code cleanups which do not change functionality
- Rewrote the kernel doc
- Fix mentions of 'v4l2_get_frame_desc' op, as it's 'get_frame_desc'
- Rebase on v7.0-rc2
- Link to v4: https://lore.kernel.org/r/20250324-frame-desc-passthrough-v4-0-dbe2412297cc@ideasonboard.com

Changes in v4:
- Update the helper name in commit descriptions too
- Link to v3: https://lore.kernel.org/r/20250324-frame-desc-passthrough-v3-0-993839a1f9b3@ideasonboard.com

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
      media: subdev: Add v4l2_subdev_get_frame_desc_passthrough helper
      media: i2c: ds90ub953: Use v4l2_subdev_get_frame_desc_passthrough
      media: i2c: ds90ub913: Use v4l2_subdev_get_frame_desc_passthrough

 drivers/media/i2c/ds90ub913.c         |  59 +-----------------
 drivers/media/i2c/ds90ub953.c         |  61 +------------------
 drivers/media/v4l2-core/v4l2-subdev.c | 111 ++++++++++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           |  28 +++++++++
 4 files changed, 141 insertions(+), 118 deletions(-)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20250218-frame-desc-passthrough-66805e413974

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


