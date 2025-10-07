Return-Path: <linux-media+bounces-43854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EB918BC2567
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 20:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A8F4A4EFAB7
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 18:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BE621D3E8;
	Tue,  7 Oct 2025 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vz2e1Knn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEA21DE3DB;
	Tue,  7 Oct 2025 18:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759860751; cv=none; b=UqBG8wxtEjaSKVmogud+XHK6WA1pn0grYrS5LMAQb9Z4UTl5Wo9K9aX3DUjwG3YEX7eOz4cPgohk2zDkyhcx2fVfDLfhFKSurAdTEGf6yiVdAx5HZymHEIhOIR5xIHg3f4EwSW76AadsJ5m/Q5PFOBIkSK0ePc9XUgw7ybVdS8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759860751; c=relaxed/simple;
	bh=gbwSb+M2JrSH33bodVuUqoPd/14uVBjBJyRlfa3sAWM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bPL/kalSerpTYZlou3iYPbNmKUld6zdJ2HgNq8ytyVu/x/323oca9UIkkrxZ+vNB6NbmEsbj/K6+mvB8cn3NMV9sfqzRdDaKFTLsttTDJAByLOuFdekOxQGHbw4hRBQUHQ6TJr+jVbVDJqYTi6LIqewcy9Rw7egSSgiq/nEkdvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vz2e1Knn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39C3E63F;
	Tue,  7 Oct 2025 20:10:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759860651;
	bh=gbwSb+M2JrSH33bodVuUqoPd/14uVBjBJyRlfa3sAWM=;
	h=From:Subject:Date:To:Cc:From;
	b=Vz2e1KnnhPzKThK190H1L9XLkD9Nyyc7150ZK6qm4ViXbKEQCAdZvChdwnnBXvkfj
	 RnQchW/o37ocbjUcFnMc7fzwZcPxTSkoxlAnmLWk3riIJbKELuookY/if1Uii40WiY
	 Dbeh8TaTQbX5egfNI6iBUTqlvBJNQfZy4DgA+Xek=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v6 0/8] media: Introduce V4L2 generic ISP support
Date: Tue, 07 Oct 2025 20:12:09 +0200
Message-Id: <20251007-extensible-parameters-validation-v6-0-5f719d9f39e5@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPlX5WgC/43QTWrDMBAF4KsErauiX0vqqvcoXUijUSNIrCAZk
 xJ898qBkixq6uUbmO8NcyMNa8ZG3g43UnHOLZexh+HlQODoxy+kOfZMBBOaGcYpXiccWw4npBd
 f/RknrI3O/pSjn/oyBSt5MkkDsEA6c6mY8vVe8fHZ8zG3qdTve+PM1+kvbv/HZ04ZdQmEAQdGW
 HjPEX0rYyi+xlcoZ7J2zOLJ5WyHK7prEKzjFkEpueHKh2u52+HK9d4IjFmpbJBsw1VPrthzr+q
 uZAm1dw4CTxuufriO6x2u7i4OMTilBuvTX39YluUHAMk8izcCAAA=
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5669;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=gbwSb+M2JrSH33bodVuUqoPd/14uVBjBJyRlfa3sAWM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo5VgG2/Rg0CgygNPuVnfe3pSoCuNHIvk0GhXGO
 3RqM93ISrKJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaOVYBgAKCRByNAaPFqFW
 PGJhD/9PkwTHYEqu4Gq1T94O0inBw5pVtdpTzV2oTbhhdeT5Btsym15AoQybysewHXnB3m8r9ak
 rwkGZsfIWaDQXJVNHyhhkuB2DBsfnBd9Ft3+Z2lG0poDLqnLltEGcW5qy6HoUsa6x/QWGDyQ8z3
 RBsVDdnlkKHYTuJbRN1TJ521ZVzjiK1Ps9b1sGnZp4Oyklo85YiX/2W8bLfWWNCncxiFtM+NnrF
 LL476INu/O+p1e6ZP2OPK+Da5si3Qs6lKv4h62ou2jZExGEHGr7VyoJ+LJUeTM101x+cx8A5oB3
 bNhBnkp68UFQ7d5PTgmuozu1iRymLTG/z8q6TLrqHsgOVvc0fIYA1wSkMpdLZ3qaUMAjsmNJpVR
 TZ5XxKXELuS9u/WznZ6xAFgENKQmetVNIbb7vrUhbx8BCLn/+425VRv60U6y69CFATN/JauarZk
 KbuatMUkk3lh3MHQbglIE07KflTKlkcMxl5Qrua6uB1IhPHKr+vWGXQmVs2LhMz9s2ot055Et2k
 EzzsZobc7UjUltsTnMCzX1aRKr0cYKpzkMsZONnCZJMzqdvK8AaaRsYwxIEFsiOtkjIBNlLtzTG
 dnkWR25h9y5ApqnFmb76HD/chk91A5S5S1sFN30RENajiM9jh9qHjznPQY4/+7FrRYK+kgQROxK
 ZSB9aQ9XDK3f/zg==
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
 Documentation/userspace-api/media/v4l/v4l2-isp.rst | 121 ++++++++++++++
 MAINTAINERS                                        |  10 ++
 drivers/media/platform/amlogic/c3/isp/Kconfig      |   1 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 125 ++++----------
 drivers/media/platform/rockchip/rkisp1/Kconfig     |   1 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 183 +++++++++------------
 drivers/media/v4l2-core/Kconfig                    |   4 +
 drivers/media/v4l2-core/Makefile                   |   1 +
 drivers/media/v4l2-core/v4l2-isp.c                 | 114 +++++++++++++
 include/media/v4l2-isp.h                           |  91 ++++++++++
 include/uapi/linux/media/amlogic/c3-isp-config.h   |  90 +++-------
 include/uapi/linux/media/v4l2-isp.h                |  82 +++++++++
 include/uapi/linux/rkisp1-config.h                 | 105 +++---------
 16 files changed, 632 insertions(+), 347 deletions(-)
---
base-commit: afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


