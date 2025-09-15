Return-Path: <linux-media+bounces-42580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFF8B58344
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 19:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24DF6168913
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA05929B8EF;
	Mon, 15 Sep 2025 17:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DzFm2SUQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D5D296BA6;
	Mon, 15 Sep 2025 17:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956720; cv=none; b=Xyl4m0GWbQKQP9TfsE0jgZaU47xqG0uzfOIZEEWUWeFcV+fSkCxSrFByv77QajL2TVI4yyQp4mYq9+X7vHzZMC4e98KhdAXBCoIbplcvdXI0xV+fFNARU8u1w4/hZliUWL3BjJKLj+/lamv2gdbN21rHSHtC+OU2piNFYMW2Rw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956720; c=relaxed/simple;
	bh=TKUNoFfaG7mUu050VdbIYJIxqktZZZ2hBbKcgYdK2GI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JZjBgQRDe1v6+b8uc7nOeRy1MMsXMKNfTgMKbWS10coMl/SCmmQwTG7GnOu6CoCwdq1yN1pQE6rXdOAKE2kg334C18Oc8peZc2KE5rlG9kg45ISDYZgzy1ffVxBIsYz9mCZ1loo1B6aIRxnS71hRrH0aVcwT+jFKT22hYpMRYPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DzFm2SUQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-56-182.net.vodafone.it [5.90.56.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41DDB710;
	Mon, 15 Sep 2025 19:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757956638;
	bh=TKUNoFfaG7mUu050VdbIYJIxqktZZZ2hBbKcgYdK2GI=;
	h=From:Subject:Date:To:Cc:From;
	b=DzFm2SUQEqFHw196ty5KYeMEPz4ZMbRvfE/r7cGshGsqu7Jz8bHsrE1arlH4Sdb8Z
	 CQXwAcfiwZlG7NzEGUZIjY+SC0Z90pRVm5Wr9pNCb/tCqDLQ1fUY081B6zCfca3rT4
	 uR6pWuxob6+udUmK9dXAZGXt4EV3Lc0+CFLOD49k=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v5 0/8] media: Introduce V4L2 generic ISP support
Date: Mon, 15 Sep 2025 19:18:09 +0200
Message-Id: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJKyGgC/43OTWrDMBAF4KsErasy+jGSuso9ShfSaNQIEjtIR
 iQE3z1yoDSLhnr5BuZ778YqlUyVfexurFDLNU9jD8PbjuHBj9/Ec+yZSZADGBCcLjONNYcj8bM
 v/kQzlcqbP+bo5/7M0SqRTBoQIbDOnAulfHlUfH71fMh1nsr10djEev3B7f94Exy4SygNOjTS4
 j5H8nUaw+RLfMfpxNaOJp9cARtc2V1DaJ2whFqrF676da1wG1y17o0IYJW2QcELVz+5cste3V0
 FiQbvHAaR/nCXZbkDmPsnT98BAAA=
X-Change-ID: 20250701-extensible-parameters-validation-c831f7f5cc0b
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5208;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=TKUNoFfaG7mUu050VdbIYJIxqktZZZ2hBbKcgYdK2GI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoyEpp6lTZEj3KM8EMTSZiL/v1T7U+vwHuOifKT
 GmpXp02U7iJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaMhKaQAKCRByNAaPFqFW
 PKd3EADGfGXT5SOJKgthvh7rOhjWsh7Cck/r4ls+Pd3x/0QdkEXjLLQ2hFoZVkKuHGXBEuaqk6k
 H47OVMKIJ2utKlWHjptg9AIVSRLfo/oK1sQvuhYs8rbSJs5eR5BNG0gWDFORTg+GX0GFAuQRg2x
 dAvAOZz/9T87s3V4SV6NmgWEpJnmsWFebcc4fhoQFekuBainH1sk1erHUZZ7GyFbf4JpU5hp9vJ
 kKepyfeIHvjRKrOozb67BOclEjlhQlz6z0hv/nV6gTVKPsCingIcVnDKZK+d607v6RlGgWBDuSS
 hJgyOwwV4E6nAzdq90Wzb+/xPfafUmM/g2bjFfkUo1efF9czMDGozBjzfrqJ8qSnrTFS8p8Fdxm
 Xbmrl0Lp02zYn7q0X/L5g+Mksa1WCJjdym9+trUdWqA4ObfJ3koDGjPD+pqiEN6oCiPhKg9hJuI
 hXKDXrbrKOqzbXdyIX7BICCli8jNvzDde41FmlibzspabBTmf89S+nxtshxflJ6lU6oBhTEmxcJ
 cyec73JeU/m5v2PTmMBRSN8n9vJQLp2rqdsvdpmYuw+n2kHuPuqlfbgc0DL1wiOXDq+Qit+PLkV
 2rzxuibT7rPlbUQLi3iA/lE9xDxnCdV+SCssO5hyBcsBaoCbp85Wwyfe73oIm5WqCN/2CwKA6PP
 pW6F1jiBna3yQNQ==
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

I have been able to test this on RkISP1 but not on C3.

Thanks
  j

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
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
      media: Documentation: uapi: Add V4L2 extensible parameters
      media: v4l2-core: Introduce v4l2-isp.c
      media: rkisp1: Use v4l2-isp for validation
      media: amlogic-c3: Use v4l2-isp for validation
      media: Documentation: kapi: Add v4l2 generic ISP support

 Documentation/driver-api/media/v4l2-core.rst       |   1 +
 Documentation/driver-api/media/v4l2-isp.rst        |  37 ++
 .../media/v4l/extensible-parameters.rst            |  97 +++++
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 MAINTAINERS                                        |  10 +
 drivers/media/platform/amlogic/c3/isp/Kconfig      |   1 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 248 ++++--------
 drivers/media/platform/rockchip/rkisp1/Kconfig     |   1 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 441 ++++++++++-----------
 drivers/media/v4l2-core/Kconfig                    |   4 +
 drivers/media/v4l2-core/Makefile                   |   1 +
 drivers/media/v4l2-core/v4l2-isp.c                 | 108 +++++
 include/media/v4l2-isp.h                           | 100 +++++
 include/uapi/linux/media/amlogic/c3-isp-config.h   |  86 +---
 include/uapi/linux/media/v4l2-isp.h                | 100 +++++
 include/uapi/linux/rkisp1-config.h                 | 104 +----
 16 files changed, 793 insertions(+), 547 deletions(-)
---
base-commit: 0e2ee70291e64a30fe36960c85294726d34a103e
change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


