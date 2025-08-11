Return-Path: <linux-media+bounces-39462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BA6B216E2
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 23:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A810E1A23C4B
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 21:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9793F2E2DD0;
	Mon, 11 Aug 2025 21:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fv165CvC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E402147FB;
	Mon, 11 Aug 2025 21:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754946344; cv=none; b=VGZGbLx8/SkJ3GjAkUjzYp5xt+YfyoZfNoqYAS8ekUdhktEKoBwVdUj3gedm9aA2o7MMup10+ojB5ICjF0dM37BMjHBhGVrSVLCEq0nAlcCkWt+YLhoJe41pYrhUcl7+QA2PUfmglfitrnNJHkrgJ6cezOSn8VlTbinx1UP7i6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754946344; c=relaxed/simple;
	bh=rFOh1R9upFEZl0fLBLl4rh7tVbwpqz5lpmvNqlmnwS8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n2rScOd5KCsP8PMhi7xddvFUcgIiWgN8qRPIF7qGl8+FPNGgGVBTPDqL7OlQaC7Fo3OoRVZnNCAxgo0xVkLogWLTZYfRbSNKViQK3ImABh+57eoRYhh698+v4xwTnLNtZSEjVwXhk/DRaQVN7svEleCPfYxyLGcghNn0TfIFUHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fv165CvC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CA4C4CEED;
	Mon, 11 Aug 2025 21:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754946343;
	bh=rFOh1R9upFEZl0fLBLl4rh7tVbwpqz5lpmvNqlmnwS8=;
	h=From:Subject:Date:To:Cc:From;
	b=Fv165CvCKdjr3fJjNoHj9nKdqX5JUW5DGBa1Lt8HBuAUzHXhgei+9TQjTSmOolZ8Z
	 zEeQVhVwmzd7KgGaF+GGbBOs0Xfr5YVyrwoc3A3TV9mNaYKQFbU6W1FdP6ApBERR5J
	 m6FHJFErKVhXEr4XPEDQEGIqhXCkdjFq4UUBkLt7ILaF11v07YR4Tnm4Hipfd6AwVM
	 N+kmoNGxr2qjKVsHBNlZT0jZ6IAkM47Cre8iCIJUjx8AXYNE0yEc7bc0e25u+08/Lt
	 LdNvN/kbfmJ5AHBK127UlatXRREKhdJ4RgIYVmMdGhM13YePvjHP15VsX7iMvViG8R
	 TX9s5HGT7jecQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v2 0/2] accel: Add Arm Ethos-U NPU
Date: Mon, 11 Aug 2025 16:05:24 -0500
Message-Id: <20250811-ethos-v2-0-a219fc52a95b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABRbmmgC/y3MQQrDIBCF4auEWdeihrSkq96jZBF1jEOLljFIS
 /DutSHL//H4NsjIhBlu3QaMhTKl2EKfOrBhjgsKcq1BSz3IqxoEriFl0Xvn+hH9xasR2vfN6Om
 zO4+pdaC8Jv7ubFH/9RC0PoSihBTWKjvM0hrjzf2JHPF1TrzAVGv9AZwFxDybAAAA
X-Change-ID: 20250715-ethos-3fdd39ef6f19
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>
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

Testing so far has been on i.MX93 boards with Ethos-U65. Support for U85 
is still todo. Only minor changes on driver side will be needed for U85 
support.

A git tree is here[3].

Rob

[0] https://www.arm.com/products/silicon-ip-cpu?families=ethos%20npus
[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36699/
[2] https://gitlab.arm.com/artificial-intelligence/ethos-u/
[3] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v2

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
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
 drivers/accel/ethos/Kconfig                        |  10 +
 drivers/accel/ethos/Makefile                       |   4 +
 drivers/accel/ethos/ethos_device.h                 | 181 ++++++
 drivers/accel/ethos/ethos_drv.c                    | 418 ++++++++++++
 drivers/accel/ethos/ethos_drv.h                    |  15 +
 drivers/accel/ethos/ethos_gem.c                    | 707 +++++++++++++++++++++
 drivers/accel/ethos/ethos_gem.h                    |  46 ++
 drivers/accel/ethos/ethos_job.c                    | 514 +++++++++++++++
 drivers/accel/ethos/ethos_job.h                    |  41 ++
 include/uapi/drm/ethos_accel.h                     | 262 ++++++++
 14 files changed, 2288 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250715-ethos-3fdd39ef6f19

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>


