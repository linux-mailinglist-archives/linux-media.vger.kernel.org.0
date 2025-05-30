Return-Path: <linux-media+bounces-33667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8281CAC908D
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FD113B2304
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F106A21D3D3;
	Fri, 30 May 2025 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i1M12tVG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE48C749C;
	Fri, 30 May 2025 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613093; cv=none; b=r/Dx191InRGJbnQUpAKDByztjAv+EHS29MLlSLtvxlOYpY++PTZCePzouHu0f2pZFDQr+q7E9Il1hQpYMa6Do8O8Qhvm9CaAyF8pa5TLjPXqX+xiwEZzLa+kyMdagmp0gVfoh/A4Iz4090gFBjo8Khwj5XWdmmHFHxfDm2435Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613093; c=relaxed/simple;
	bh=3g+2Gt6ki2RAC1y5hKm8yLn0M1lJ0n9JI1E/PiZVHHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AJRU9SwfpvezdfAsUe9k11bpsIRz+n788u2TsIZdkPJgvmHIhtkHpY1vrvxct8Wjt6Jisb/zWrRLrazGouTsieKJhZqeurAI9e7FGvE75oxEAD08Xs1h6BEIVBFwgvPOuFv80JVzcCEeZwxURSaFL0oZrMRh3+jWHx5OB70Ptnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i1M12tVG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1751E89A;
	Fri, 30 May 2025 15:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613061;
	bh=3g+2Gt6ki2RAC1y5hKm8yLn0M1lJ0n9JI1E/PiZVHHU=;
	h=From:Subject:Date:To:Cc:From;
	b=i1M12tVGYn+8VKsu5Ynf0+EMtK1xNPbCFvcVpzJnaZyAF/KWnXM6QGBX28SRFyf33
	 2+c+jlP5uWjqIakiqY7pTYFcyorH7J10whgGT3vVul31gJVERbbjBff7BaiYWDJQ0J
	 t0WTa+dnWJzIBvYV6Y7aDqr9TswFYZUl4gouON68=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v3 00/15] media: rcar: Streams support
Date: Fri, 30 May 2025 16:50:29 +0300
Message-Id: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKe3OWgC/23Pz26DMAwG8FdBOc9T/gABTnuPaYeQOCUHSGtTt
 Kni3ZfSSZWmHj9L/n32TTBSQhZDdROEW+KUlxLMWyX85JYTQgolCy11I7Xqgbwj4JXQzQwqBnR
 d10psUJSVM2FM3wf3+fXIhJdrUdfH8IkO1R/ZQSQ3IwRkD2fHvE6Ur6cJ2raTDdbK9LYetvruj
 44RfJ7ntA5VgypGbVRteyvubVPiNdPP8cumjrrXZ28KJEQ19gaNlc6NH6n8wXkZs6PwXgoOb9N
 Pw+j2n6GLEWSwUmrf1iq+MPZ9/wXk0UXuYQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3422;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=3g+2Gt6ki2RAC1y5hKm8yLn0M1lJ0n9JI1E/PiZVHHU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObfXwcE6IVUVE1gp9AlBNelbeUah8nxwL6Np8
 mJ9QXH5376JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm31wAKCRD6PaqMvJYe
 9QIwD/9wd3vPznS65rKMksb0n7MwmVbwHpZdGoAWZTlf3iRw1doPJatGO1DikKJvBOOcivz1Csh
 TotwicEnhkhrQBJz3FQ/kdrSqdC0BK3srbHc9u3AcESRIORKlXLf2y+fGjsqq98cQzYqg/yK7VL
 mE5QbW22KGdDO4m23o52fXmr2/PQd48SDRxcdb0BnVa2pR9aZsG/K20rW2rpvPmfNY2JqUozIq2
 Pk1pvGwqfuwP7E3a+GbPdL0Kr8tS9ry800MWmu6HEMvuaYSuwp+K3TM8ExV6ssw9byGP3IQNtCq
 4TNeASOWTGenhxEyh/OFyQKbHAC672FVpPqv5vVW4TnZ5dofGe9WIYCXPRVio6sQT3IwP/sEact
 eiQr6gJTjqjFZwSgh98pEY49D6uyaGRnN0w7gZ5d9WwMRg9xKi9jGjEC48YU3w/ZV1JC7HCODBG
 ShF9CTGz8xhw0y1eso0bOEhvCPQHkx0dAMg8zBFlpLAT0Fgh/f9KD1DL7A1sHBvNbBHtB6k+63b
 Lghmp3Uxo8/Kbz4A16RG7jVZtG5Jhc2qtxgwnnhvfwYle0LecTB5f9sKtjeYVApzGcWRhLxR6VF
 F/O9NcFlfIqeqjoskflduB/3S+v+OBm5vSsHOVJPC+1X1WjXGwRS+68sV8lRagigzDQKMwMT2iD
 4HSfbZODaMp0uqQ==
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
Changes in v3:
- Rebased on top of latest linux-media
- Dropped dependencies which are already in linux-media (only remaining
  dependency is v4l2_subdev_get_frame_desc_passthrough)
- Tested on white-hawk board, using the staging deser TPG
- Also tested in a WIP branch for GMSL2 (two video streams)
- Link to v2: https://lore.kernel.org/r/20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com

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

 drivers/media/platform/renesas/rcar-csi2.c      | 426 +++++++++++++++++-------
 drivers/media/platform/renesas/rcar-isp/csisp.c | 228 ++++++++++---
 2 files changed, 479 insertions(+), 175 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250219-rcar-streams-1fdea8860e5e
prerequisite-change-id: 20250218-frame-desc-passthrough-66805e413974:v4
prerequisite-patch-id: bce4a915a29a64f88ed1bb600c08df37d2ba20c6
prerequisite-patch-id: 69b75e7dad9ced905cb39a72f18bebbf3e8f998a
prerequisite-patch-id: 58463f6944c76acd6cf203b14a2836cdb0db2461

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


