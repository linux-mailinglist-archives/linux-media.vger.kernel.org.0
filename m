Return-Path: <linux-media+bounces-44357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDBFBD80C9
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C70B3BBF5C
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6222B30EF9E;
	Tue, 14 Oct 2025 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uJV6aLvv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7992C26E704;
	Tue, 14 Oct 2025 08:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428879; cv=none; b=W6E5kSUReV8JRezour2aV/BMO/ggF/dCJktnxy7tdh8Wo0Lr325Z75cNthJ6OUek+S5+fVT9aX8fvXW0D2SdD+Ccmh639KVj4pU5eiDd81ZmuZwyNY2cbrtJZaiTONZ6Pivz4ULv86V3IvCQXvthw2iqCt1RL1vDxtIFxIAsyCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428879; c=relaxed/simple;
	bh=yBFgeA9u02Yi9+0VS/oBb8STABvotvLYI8KT4LZTPQk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WI0D24koRwhqVmE/hLskzPM2k9Ic2/EH4GXuI1bb9owwNnmmcn68UKDtqeOmYbVpi+cm9zBh8M6XNZcenXs4/VkWqLoFa2WOSrmZqAujsJdkaG125AXb3QmoI0FtXFGAbzlpnn1ph+Rf6wHrcmbpdap1pwzPby5HJygnkdrtqQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uJV6aLvv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82760741;
	Tue, 14 Oct 2025 09:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760428774;
	bh=yBFgeA9u02Yi9+0VS/oBb8STABvotvLYI8KT4LZTPQk=;
	h=From:Subject:Date:To:Cc:From;
	b=uJV6aLvvKs5sNImKeND8JRNHZguXhGEzynvij1YpMtoEeIdH5S9lWG0+IG6xMGW+Q
	 z4WelrHtVPZs8Y/3ZXLtIAXEM7xrvq/iJNyze6qKdyRpp+ZKrMJlc+QGYBERNX+NOC
	 FoLGRq8lnyXX4B9bXywCxhC13jD3sAaTU6gBK4mY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v7 0/8] media: Introduce V4L2 generic ISP support
Date: Tue, 14 Oct 2025 10:00:52 +0200
Message-Id: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQD7mgC/43QTWrDMBAF4KsErasy+rOkrHqP0oU8GjWCxA6SM
 SnBd68SaJNFTb18A/O9Ya6sUslU2X53ZYXmXPM4tGBfdgwPYfgknmPLTII0YEFwukw01NwfiZ9
 DCSeaqFQ+h2OOYWrLHJ0SySaDCD1rzLlQypd7xftHy4dcp7F83RtncZv+4O5/fBYcuE8oLXq00
 uFbjhTqOPRjKPEVxxO7dczyyRWwwZXNtYTOC0eotVpx1cN1wm9w1e3eiABOadcrWHH1kyu33Ku
 bqyCRCd5jL9KKax6uF2aDa5pLXey91p0Lae0P3a8rAOwGt2uuSVb46JPyZP5wl2X5Bn6YOGePA
 gAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5897;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=yBFgeA9u02Yi9+0VS/oBb8STABvotvLYI8KT4LZTPQk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo7gNFW2i/Ij79z6GLHAlCu1SQNniCRvS+A0w/h
 XiN2fpYguWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaO4DRQAKCRByNAaPFqFW
 PI5cEAC+LvUeJCDvL7UgZ3+iURdVzRot9hKbZAD679moLW7iRtCJMGjkTD3pWBaSu2y69loogrN
 d2OaXKk0Or/02HajmsLBf/lZIqHrEcV2944Hn9bQOjtroM+PUbOEGISX/5Pwbb14twfkPo5UcpU
 w3vYn1MkkZpKL9KRgcmOZ4MmDvjzCIZWA+gNbEy3fqeaD+SUtK8ASpzkioMLjgANhOC2S0nH+vQ
 HWYMckh8ldm345WNV2qTzYYSW5nIjqOkEgoPzVbYC93ZqfmGysJmlJaHe40kEx4RQ7jxSHgwj+x
 PZjIVgxctLOhrhEepHHSKlWIGwrsOd1bBW5aw7jP1mxcAc/0q2kXfH8kFuWjV6jxKwQKeynCdfJ
 34Zk1bqK0npC3Bt+mxUkoobzRoLhxOgTUbiQF2XhUiGUWCXt5SqKoLuz7tEQTkT2kWbzcBwe/6L
 SeWtQyRclZ/LkCvvUK4opEaUlLcb6z4ujTBCgBnqusi9n8DYV/qMYCSSLhiYU4rC/XfYXCtynSH
 kmrVlpiWqXts6r1uSoPTE8SqvASdWn7xKckEt/vMuNf42/OBQuIv/fiQ/hSTzJlv3yJ95D+ysL8
 GRDB6RirecYuk5G+SYFJz1DnW/sTqkz3KvppcRLW6/4LIfFk88PbtahUU/eub9OVtEE5JOzRgLV
 pnhOXaxzmLZL65g==
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
 Documentation/userspace-api/media/v4l/v4l2-isp.rst | 121 ++++++++++++++
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
 16 files changed, 660 insertions(+), 356 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


