Return-Path: <linux-media+bounces-43270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BF3BA5061
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 22:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B18263B9719
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 20:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB63284662;
	Fri, 26 Sep 2025 20:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjaLfnbx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAF87A13A;
	Fri, 26 Sep 2025 20:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758916861; cv=none; b=dRnnmLnCJczRKBA8asU5y5W8dEqPUwPY6hFLFQMgDZ/Ey+pN2HrLFEiWDQ9vNgnBwkYq/DvvZOheLmALnYk/PDedu4TZc014t/kcdQNqkUKVAJcZuUIQ+sojtalqfIU9wPRsaMeIzmusShUlsW7Uj6x1DJ+N7KHVo3pUtJqcb/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758916861; c=relaxed/simple;
	bh=LmM6ig4MOGV4lcn/w+S1PNw5phmfSGuH7K+di1MOKA4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nIEusxCUddRnp8WlB6czEz5/aJioz0vZpnK1fYP7oIUcKIocG80Rd+/ESxEd0XKRqYQjocCZS/nPku/miSqHdTumMK7BgW0M1xTHTqll77tSLbWDJsbcooeAR+dsc1ySgTrbfmrfFNTI7ax6C2me7ZpWew2K5Dt4uGiGouxuaRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjaLfnbx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7C1C4CEF4;
	Fri, 26 Sep 2025 20:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758916861;
	bh=LmM6ig4MOGV4lcn/w+S1PNw5phmfSGuH7K+di1MOKA4=;
	h=From:Subject:Date:To:Cc:From;
	b=NjaLfnbxgmQJvJztY7ncapArMYJ4hE3ilw/Tyb8w5GWm6Hc5YOHpUhta0+q1QNEtj
	 qcgpq3pyyGAYEEaW3wIjFTCK35m01Qfsrtm6wojA/RR11tSnL6kHuzeEiCqnEHWJfs
	 RKd/Ybcty7YZl4sZtkoImdQ6cvXNms+tKhILliQW6yaUL+oKuxuiqBohOPzom9voxQ
	 JLe5hqqDkqkGgzK/CzzDHUAxGREQHAgr9RmfSfdqetmiRYW9nrvBvLKEey0a0T0pAZ
	 6NHOAmlm+1TAHEZIwzaX/JYjjOpJrUM5uvpB6wTYhOQWSVa+l771jPeIzbCigdjvQ2
	 NYNFa7sq6+5tA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v3 0/2] accel: Add Arm Ethos-U NPU
Date: Fri, 26 Sep 2025 15:00:47 -0500
Message-Id: <20250926-ethos-v3-0-6bd24373e4f5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO/w1mgC/1WMQQrCMBBFr1JmbSQzJWpceQ9xkaaTNiiNJCUop
 Xc3LRVx+T7/vQkSR88JztUEkbNPPgwF6l0FtjdDx8K3hYEkKXlEJXjsQxK1a9taszs41FC+z8j
 Ov9bO9Va492kM8b1mMy7rViDaChmFFNaiVUbapnHN5c5x4Mc+xA6WRKafdkL8alQ0Q6idVWS0+
 tfmef4A8IKvg9IAAAA=
X-Change-ID: 20250715-ethos-3fdd39ef6f19
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.15-dev

The Arm Ethos-U65/85 NPUs are designed for edge AI inference 
applications[0].

The driver works with Mesa Teflon. A merge request for Ethos support is 
here[1]. The UAPI should also be compatible with the downstream (open 
source) driver stack[2] and Vela compiler though that has not been 
implemented.

Testing so far has been on i.MX93 boards with Ethos-U65 and a FVP model 
with Ethos-U85. More work is needed in mesa for handling U85 command 
stream differences, but that doesn't affect the UABI.

A git tree is here[3].

Rob

[0] https://www.arm.com/products/silicon-ip-cpu?families=ethos%20npus
[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36699/
[2] https://gitlab.arm.com/artificial-intelligence/ethos-u/
[3] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v3

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v3:
- Rework and improve job submit validation                                                            
- Rename ethos to ethosu. There was an Ethos-Nxx that's unrelated.
- Add missing init for sched_lock mutex
- Drop some prints to debug level          
- Fix i.MX93 SRAM accesses (AXI config)
- Add U85 AXI configuration and test on FVP with U85
- Print the current cmd value on timeout                                                              
- Link to v2: https://lore.kernel.org/r/20250811-ethos-v2-0-a219fc52a95b@kernel.org

Changes in v2:
- Rebase on v6.17-rc1 adapting to scheduler changes
- scheduler: Drop the reset workqueue. According to the scheduler docs,
  we don't need it since we have a single h/w queue.
- scheduler: Rework the timeout handling to continue running if we are
  making progress. Fixes timeouts on larger jobs.
- Reset the NPU on resume so it's in a known state
- Add error handling on clk_get() calls
- Fix drm_mm splat on module unload. We were missing a put on the
  cmdstream BO in the scheduler clean-up.
- Fix 0-day report needing explicit bitfield.h include
- Link to v1: https://lore.kernel.org/r/20250722-ethos-v1-0-cc1c5a0cbbfb@kernel.org

---
Rob Herring (Arm) (2):
      dt-bindings: npu: Add Arm Ethos-U65/U85
      accel: Add Arm Ethos-U NPU driver

 .../devicetree/bindings/npu/arm,ethos.yaml         |  79 +++
 MAINTAINERS                                        |   9 +
 drivers/accel/Kconfig                              |   1 +
 drivers/accel/Makefile                             |   1 +
 drivers/accel/ethosu/Kconfig                       |  10 +
 drivers/accel/ethosu/Makefile                      |   4 +
 drivers/accel/ethosu/ethosu_device.h               | 187 ++++++
 drivers/accel/ethosu/ethosu_drv.c                  | 430 +++++++++++++
 drivers/accel/ethosu/ethosu_drv.h                  |  15 +
 drivers/accel/ethosu/ethosu_gem.c                  | 709 +++++++++++++++++++++
 drivers/accel/ethosu/ethosu_gem.h                  |  46 ++
 drivers/accel/ethosu/ethosu_job.c                  | 543 ++++++++++++++++
 drivers/accel/ethosu/ethosu_job.h                  |  41 ++
 include/uapi/drm/ethosu_accel.h                    | 262 ++++++++
 14 files changed, 2337 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250715-ethos-3fdd39ef6f19

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>


