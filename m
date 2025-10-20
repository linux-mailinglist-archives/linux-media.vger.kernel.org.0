Return-Path: <linux-media+bounces-44997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE21BEFE89
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE6B9189DC60
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 08:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7FC2EBB88;
	Mon, 20 Oct 2025 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m9c4xVId"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F46178372;
	Mon, 20 Oct 2025 08:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948703; cv=none; b=j3YglIyTryvHpt4YXeUCTF6uU2Cp/4C1KPiodg9bw3ToGd8T4Xr5+zdbKrPLQMTNNs16/25+rghtOAIw8eXZfWzKrJeLfhH6i+TDYJKpKSFg6tnO4q56Z3iUgntrasuQv5Ue64eT0SKaZismjnqMym/7aRA+5UtMPjdCki+/GvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948703; c=relaxed/simple;
	bh=LMeEQNb1aiaCLIqc8fJMYr6L7JHO1QyiGOqjiFG05n0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t1DlXJU4C0Qj/935IZdw+f3Gk0aQjAM+pUgngMyMbX5cJ/mBL7gJQxFjuM2n9qSz46g+vpDGDj8q3vCrtS9QdFIY1dkSsOxHN8BPHRi/YrsZfDGI4JbGGVrtT2ZzRkijhn3uqUUeyZ//nokiXr154gGU+fiBQyP1rEW535dB+dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m9c4xVId; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9285843;
	Mon, 20 Oct 2025 10:23:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760948595;
	bh=LMeEQNb1aiaCLIqc8fJMYr6L7JHO1QyiGOqjiFG05n0=;
	h=From:Subject:Date:To:Cc:From;
	b=m9c4xVId9J2QbbGzzcTJe2/8k6aG7LBLQXXOfpvzLcpzjSvAway1Yb99oTgKutrbU
	 1cAopt5eAq5+To/kEp/zR1Qk5Y1Q4HGnn5oAMoWjomcTxlm2FWZ6UT+pLu9WKH3mJs
	 XM9SH+5U3I+OiLWIMFTaKTUK0tW94gnAg0BMMRxI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v8 0/8] media: Introduce V4L2 generic ISP support
Date: Mon, 20 Oct 2025 10:24:46 +0200
Message-Id: <20251020-extensible-parameters-validation-v8-0-afba4ba7b42d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM7x9WgC/43QTWrDMBAF4KsErauiX0vKqvcoXUijUSNI7CAZk
 xJ898qBNl7U1Ms3MN8b5k4qloyVHA93UnDKNQ99C/blQODk+0+kObZMBBOaGcYp3kbsaw5npFd
 f/AVHLJVO/pyjH9syBSt5MkkDsEAacy2Y8u1R8f7R8inXcShfj8aJL9Mf3P6PT5wy6hIIAw6Ms
 PCWI/o69GHwJb7CcCFLxyRWLmc7XNFcg2AdtwhKyQ1XPl3L3Q5XLvdGYMxKZYNkG65auWLPvaq
 5kiXU3jkIPG24+uk6rne4urnYxeCU6qxPW3/ofl3OmNnhds3VyXAXXZIO9YZrVi5XO1zT3K4TN
 mDU4J39w53n+RtwFxbW5wIAAA==
X-Change-ID: 20250701-extensible-parameters-validation-c831f7f5cc0b
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6221;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=LMeEQNb1aiaCLIqc8fJMYr6L7JHO1QyiGOqjiFG05n0=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo9fHXNbyKPullzJsOli3OapJL6zNyyMNKtcfmG
 W/E2BF++/CJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaPXx1wAKCRByNAaPFqFW
 PFAwEADHdyfhO+G7QdFivw7jaOuFiZH+NBhkpOO66yYgBDc/fvs6rHMzkTpLRy9KOdyu4L6Ky4X
 48/xDgAGvQj6T8WVlxinZZW7zQaGsGNsF716XASRJVC5HRaUj6EpW1N3e8NTStKUYepo9oyzfIP
 Nvd/ZIlgYR2fqBnawsasYegs07ALtw0pLtg4dmjqKqdY0WF6y1Gmx26W3gyO0UtETZWiCgDW5bm
 G2mpTqwGfGzEzgP9YqnTf+/Wa+BKJ7ci941sYqpO+51Vwun298kRJXSUoqS2SX26pSyn8F8WKdp
 f0wMoZGeLVCi3VBvKUvlf4GcgAtY/DdjQkhpAeD5gHVnGaXsKdN3fYzgrdDoM7pwFH0MUuDSngN
 MU8Rer/5GXkb2KnMZ30w6VmmEe6gF+umMRiGCGfmTH3JqE8PVEgXIto5qUo6B3EMQuUGQXcJFV0
 kqxn8xmcPmI6au7IP2+hoA6gpZMATzQAUYWgxWq6yihdnI0CWm11lRj3unU87Iqo+sjowLTrXTi
 GuhdOIVL4EtGNl/Wuizuhj78SBUyAhxwhpCbbVdMK6pigu5nICFCenoc4S+p+uoK0MarxAJRhPH
 pDJQ7u73n6d5ABY+6by9QsrUWJrb77dFGBfNIavUX2D7A0ZEBWJPwNNcha5ROCRwwhIoLME/BYV
 7W2RRajFxyUvqLg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Extensible parameters meta formats have been introduced in the Linux
kernel v6.12 initially to support different revision of the RkISP1 ISP
implemented in different SoC. In order to avoid breaking userspace
everytime an ISP configuration block is added or modified in the uAPI
these new formats, which are versionated and extensible by their
definition have been introduced.

See for reference:
e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
6c53a7b68c5d ("media: rkisp1: Implement extensible params support")

The Amlogic C3 ISP driver followed shortly, introducing an extensible
format for the ISP configuration:

6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")

with a very similar, if not identical, implementation of the routines to
validate and handle the ISP configuration in the ISP driver in the
c3-isp-params.c file.

fb2e135208f3 ("media: platform: Add C3 ISP driver")

With the recent upstreaming attempt of the Mali C55 ISP driver from Dan,
a third user of extensible parameters is going to be itroduced in the
kernel, duplicating again in the driver the procedure for validating and
handling the ISP configuration blocks

https://patchwork.linuxtv.org/project/linux-media/patch/20250624-c55-v10-15-54f3d4196990@ideasonboard.com/

To avoid duplicating again the validation routines and common types
definition, this series introduces v4l2-isp.c/.h for the kAPI
and v4l2-isp.h for the uAPI and re-organize the RkISP1
and Amlogic C3 drivers to use the common types and the helper validation
routines.

The v4l2-isp abstraction will be augmented to support statistcs as well.

If the here proposed approach is accepted, I propose to rebase the Mali
C55 driver on top of this series, to use the new common types and
helpers.

Tested on Mali C55 and RkISP1 with camshark

Thanks
  j

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v8:
- Address Michael comments and reword documentation
- Use the correct "metadata capture" for stats and "metadata output" for
  parameters. I mixed up the two in the previous revisions.
- Link to v7: https://lore.kernel.org/r/20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com

Changes in v7:
- Moved version to the v4l2-isp uAPI
- Moved version check to the v4l2-isp.c helpers
- Link to v6: https://lore.kernel.org/r/20251007-extensible-parameters-validation-v6-0-5f719d9f39e5@ideasonboard.com

Changes in v6:
- Rename all symbols to v4l2_isp
- Changed the interface of the two buffer validation functions
- Reworked the rkisp1 and c3 porting accordingly
- Updated documentation
- I have moved v4l2_params_buffer_size() from uAPI because it was
  convenient for linux but not required in userspace
- Link to v5: https://lore.kernel.org/r/20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com

Changes in v5:
- Move everything to v4l2-isp prefix except from format documentation
  which still is about 'extensible-parameters' (to be paired in future
  with extensbile-stats)
- Simplify documentation and move it part to the driver-api
  Documentation
- Remove 'group' and 'features' from the generic handlers definition and
  adjust rkisp1 accordingly
- Link to v4: https://lore.kernel.org/r/20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com

Changes in v4:
- Fix the definition of V4L2_PARAMS_FL_PLATFORM_FLAGS
- Add __counted_by() attribute to the data[] flexible-array member of
  v4l2_params_buffer
- Minor style change
- Link to v3: https://lore.kernel.org/r/20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com

Changes in v3:
- Rebased on latest media-committers/next
- Take in Dan's suggestion in block size validation
- Documentation minor spelling fixes
- Link to v2: https://lore.kernel.org/r/20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com

Changes in v2:
- Make v4l2_params_buffer directly usable
- Centralize ENABLE/DISABLE flags definition and validation
- Take in Dan's v4l2_params_buffer_size()
- Allow blocks to only contain the header if they're going to be
  disabled
- Documentation fixes as reported by Nicolas
- Link to v1: https://lore.kernel.org/r/20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com

---
Jacopo Mondi (8):
      media: uapi: Introduce V4L2 generic ISP types
      media: uapi: Convert RkISP1 to V4L2 extensible params
      media: uapi: Convert Amlogic C3 to V4L2 extensible params
      media: Documentation: uapi: Add V4L2 ISP documentation
      media: v4l2-core: Introduce v4l2-isp.c
      media: rkisp1: Use v4l2-isp for validation
      media: amlogic-c3: Use v4l2-isp for validation
      media: Documentation: kapi: Add v4l2 generic ISP support

 Documentation/driver-api/media/v4l2-core.rst       |   1 +
 Documentation/driver-api/media/v4l2-isp.rst        |  49 ++++++
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 Documentation/userspace-api/media/v4l/v4l2-isp.rst | 120 ++++++++++++++
 MAINTAINERS                                        |  10 ++
 drivers/media/platform/amlogic/c3/isp/Kconfig      |   1 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 124 +++-----------
 drivers/media/platform/rockchip/rkisp1/Kconfig     |   1 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 183 +++++++++------------
 drivers/media/v4l2-core/Kconfig                    |   4 +
 drivers/media/v4l2-core/Makefile                   |   1 +
 drivers/media/v4l2-core/v4l2-isp.c                 | 128 ++++++++++++++
 include/media/v4l2-isp.h                           |  91 ++++++++++
 include/uapi/linux/media/amlogic/c3-isp-config.h   |  92 +++--------
 include/uapi/linux/media/v4l2-isp.h                | 102 ++++++++++++
 include/uapi/linux/rkisp1-config.h                 | 107 +++---------
 16 files changed, 659 insertions(+), 356 deletions(-)
---
base-commit: 8652359fc004cbadbf0e95692c1472caac6260c2
change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


