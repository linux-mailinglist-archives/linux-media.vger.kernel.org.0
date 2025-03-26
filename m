Return-Path: <linux-media+bounces-28767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D811A71556
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79F01188ACD1
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95C91D86F6;
	Wed, 26 Mar 2025 11:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J3FyAhXH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8472320311;
	Wed, 26 Mar 2025 11:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987423; cv=none; b=YJxJZj7zVnOQhuSh3PKCrDpY9YGP2nqDiPVeWf+EC5ruB0cRbZME4ceL34n9wvdlAHyCE+W73tm8hyuJoAktzALzUhU9nUm44bYX/o3zX01Vm8BZfhQpfwmBJoTzsnRKe6u37xJnx0DuUyGGoT6s2ynF1bpll0eLoaN1vNCkQKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987423; c=relaxed/simple;
	bh=4YD/16LtjFiupou4GxoQ1WtgqCE6rS/iXLVUYiMRDjA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oov0mzgAT+S91QuxjmgIVBiFbjUWvioooZcKkHxnqNrn0woX2eHA4ai7bvyVR0hp52VjKK+ReLLKZINl/1SCYjWD1GDuRuN5ZvclQT6PjwShxPaLNnmGsXm2zenFfKv17Yx+OYh9v2Om7Nujyep/J6PhmABsHxJCMvLq+cTXQUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J3FyAhXH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E639A3A4;
	Wed, 26 Mar 2025 12:08:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987306;
	bh=4YD/16LtjFiupou4GxoQ1WtgqCE6rS/iXLVUYiMRDjA=;
	h=From:Subject:Date:To:Cc:From;
	b=J3FyAhXHgriv9OMlX/EIH45LyuVmZrkz7rBgn1SyMGgNsefi+LmBG9bN+9P9Tejyj
	 wHqCpw7NxrIRgYf8SxX81LUvAQT8PLQcZCsXCfq88etK+bBjOjWST3bCXaOV+FhEEt
	 HmA0T6vKtBt0vOnMiNCJs3KPiULbf4N6/Ppsw/DY=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v2 00/15] media: rcar: Streams support
Date: Wed, 26 Mar 2025 13:09:22 +0200
Message-Id: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTg42cC/22QzW6DMBCEXwX52i6yDTY/qqq8R5XDAkuwEiDdJ
 bRVlHevSXroIcdZab6ZnasS4kCi6uSqmNYgYZ6isK+JagecDgShi1pZbZ22pgJukUEWJhwFTN8
 RlqXX5EhFy5mpD9933Mf+oZk+L5G6PI5qJBG8U+vk7Q+qTeG8canxpXe2AgNTOJ5QUpk74tNl6
 l6YJhKUHeNhwoXaIRV6V/9Lxs4bLbP5o2LsAYxf0BaVL/q+dF1G9WqeeawpoWccCTqSFs4osgw
 8Xw4DeF9qR7nJqiKv13xzNygE7TyOYamT3hpnvMlI51ptHw9Blpl/7nvGtO3l59OtBjT0pqkyy
 gqN2OxC3FLmqZmRuzQGqP3tdvsFWT5W76EBAAA=
X-Change-ID: 20250219-rcar-streams-1fdea8860e5e
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3687;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=4YD/16LtjFiupou4GxoQ1WtgqCE6rS/iXLVUYiMRDjA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CMk1K34BytShUzKWdpCYP7oWlf5EbooVkWV
 ohXCO8HZGeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PgjAAKCRD6PaqMvJYe
 9V2AEACaG+edWcxavzx5xTjd9GySnUhGZ01bBp2J3p0xPVymCoOds3t9347sgwgIeu8TjHZ5eAh
 b0gIHzPw3l/Fx04tEoS+5M6PsAWVEJhSJn8zoeYT3R1Lq8Z/oWIL3hDyrgvf3ignxZOTe1XGOqh
 ioZP7YXwLLBnaVquCQemDXladaxNkizHgP+J5K8U1D0vWdX3cXl/Y6b1RFaYx+LkJAI2D+Sql01
 T0ot+Z10TqyTBPHxsP7jG+lIpXP5Wxdw0cBGe2dAblIxG8OeribkZfArhGQ7/DCVUVE5m7/47Vy
 FSRnDb7K/fM9eDP6Bf9ON4W4DgxHgTUwzyizeDMHvp7ySg3wB/F4bpgXE00z4+zBEhg2xMEDcHu
 3zem71yZKMFLw3hE7PrbX9A92S1AOBHEYDIqMaKYyKEVrb5WSRDp8DYE5QtHERG8lOhqH5Sz9Gu
 ZIaIqBxU4qkzmzkoN1bfZGLhS+7Ph5Eba5MGSRVIkaEbnOdUkOc3UQ06QovkvIPldVACMj85RBp
 guIEXXGMMuy2dxqhBbT3OicDDyby458cWYVTd3/7lOKnLuqH0sGoG+FmwMBcvHzpvnrwXAowH3D
 9QnB2z7Fzx1QAI8vSoQVtCZpLHuzz/YnzXXwrtak2TeM1I6VdSr59YV6uA2IllmyH9lOjTLaHMt
 AvLuNnBWryrdChA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add streams support to Renesas rcar platform driver.

The series attempts to keep compatibility with the current upstream.
However, in upstream there's some kind of custom multi-stream support
implemented to the rcar driver, which breaks at patch "media: rcar-csi2:
Simplify rcsi2_calc_mbps()".

The behavior should not change when using a single stream.

Testing is problematic, as the only way currently for me to get multiple
streams is by using the GMSL2 deserializer add-on board with GMSL2
serializers. These are not supported in upstream. If someone has the
hardware and wants to test, I can share the very-WIP branch that
contains the missing pieces.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v2:
- Rebased on top of latest upstream, and updated the dependencies to
  match the latest serieses sent.
- Add new patch "media: rcar-csi2: Use the pad version of v4l2_get_link_freq()"
- Drop "media: rcar-csi2: Fix typo" (it was not a typo)
- Update the code in calc_mbps(). The previous method relied on
  V4L2_CID_LINK_FREQ, but that's not available if the link-freq is
  provided via get_mbus_config().
- Dropped dependencies to Niklas' old series which doesn't apply
  cleanly. It's needed for multi-stream, but not for the current
  upstream which only has a single stream use case.
- Link to v1: https://lore.kernel.org/r/20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com

---
Tomi Valkeinen (15):
      media: rcar-csi2: Use the pad version of v4l2_get_link_freq()
      media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC
      media: rcar-isp: Move {enable|disable}_streams() calls
      media: rcar-csi2: Move {enable|disable}_streams() calls
      media: rcar-csi2: Move rcar2_calc_mbps()
      media: rcar-csi2: Simplify rcsi2_calc_mbps()
      media: rcar-csi2: Optimize rcsi2_calc_mbps()
      media: rcar-csi2: Switch to Streams API
      media: rcar-isp: Switch to Streams API
      media: rcar-csi2: Add .get_frame_desc op
      media: rcar-isp: Call get_frame_desc to find out VC & DT
      media: rcar-csi2: Add more stream support to rcsi2_calc_mbps()
      media: rcar-csi2: Call get_frame_desc to find out VC & DT (Gen3)
      media: rcar-csi2: Add full streams support
      media: rcar-isp: Add full streams support

 drivers/media/platform/renesas/rcar-csi2.c | 426 ++++++++++++++++++++---------
 drivers/media/platform/renesas/rcar-isp.c  | 228 +++++++++++----
 2 files changed, 479 insertions(+), 175 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250219-rcar-streams-1fdea8860e5e
prerequisite-message-id: <20250210175615.1686529-1-niklas.soderlund+renesas@ragnatech.se>
prerequisite-patch-id: a4aa6a184c6a21fc4536c11e14d9b5cc61f13346
prerequisite-patch-id: 1b0091875529d392b142814005baa38b2ef77f98
prerequisite-patch-id: 4c960ae93b1e663b11194903ed1810e0ed1e4f59
prerequisite-patch-id: a5641e1dcad0f39baef8996b6731a471046f18f9
prerequisite-patch-id: 481317ba4b987cbb069c31f3372686a59c0fcb67
prerequisite-change-id: 20250324-rcar-fix-raw-c7967ff85d3e:v1
prerequisite-patch-id: b21819aa41855942f3474ff8135daccc9c7c652d
prerequisite-patch-id: af375b9da2a977ea10d1fee2d500de5a2dbe53dd
prerequisite-patch-id: 2278b5cd1de5008ef35f9c9f34e3a53bb98147da
prerequisite-change-id: 20250218-frame-desc-passthrough-66805e413974:v4
prerequisite-patch-id: bce4a915a29a64f88ed1bb600c08df37d2ba20c6
prerequisite-patch-id: 69b75e7dad9ced905cb39a72f18bebbf3e8f998a
prerequisite-patch-id: 58463f6944c76acd6cf203b14a2836cdb0db2461

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


