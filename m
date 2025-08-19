Return-Path: <linux-media+bounces-40290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E364CB2C7BB
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7897B1896B57
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6F427E7DD;
	Tue, 19 Aug 2025 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jsIg4ePx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14654279DBC;
	Tue, 19 Aug 2025 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615296; cv=none; b=rP0Mtp5Tm1MyBplOo54GLAaQoD+g47zKtxgKuWlkoafdrIAsmWn1b/Mnkym+xGTN+BfAimtTSp50m1tNh37ifdLwi3z9AGAFhoHSdUHjxPlLubPHXEgXmn1eaDWL0TqrDQd8oD5LFq5/NWyKdCHBy3kfDEsDhSJ0TlLlExfERRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615296; c=relaxed/simple;
	bh=Uu4/Kt51iG5RwW+QQycMfaL6T1BbngTCS7sEp6hsgVU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I/WiuSGT9Ma1kbNx07JkylqsmOAM5DkpRLy3K2Z4p7U/ZPsH7oPOAU5kdRjexqBEu2nz24mmxUJKjTZxDe8N8bSf2bjeETjKxu+6uat1qR8kRfpJdbWTQOXnonZ/9VVaQ5g5QbgSBLZxjNeIycFzbE1Tlw0TR87NOF53T9PidMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jsIg4ePx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.106] (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 921D52391;
	Tue, 19 Aug 2025 16:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755615235;
	bh=Uu4/Kt51iG5RwW+QQycMfaL6T1BbngTCS7sEp6hsgVU=;
	h=From:Subject:Date:To:Cc:From;
	b=jsIg4ePx7VLhm2dRbRPrNhNbpAEPXJxuthzfud/jByC6kR2594I7TRzRc90yeCIFJ
	 QGfHGsOm03lq3Q+j2tep+wvXGSeekCgRS4UQnHg+dYEifmP1hTZ9NghaxFqS9kQ7XE
	 Y90PHo9EeFMD2HNGJVZ99/G7eAH+qz1lqOS3vpf0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v3 0/8] media: Introduce V4L2 extensible parameters
Date: Tue, 19 Aug 2025 16:54:41 +0200
Message-Id: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGQpGgC/43NQQqDMBCF4atI1k1JopLYVe9RuojjWAfUSCLBI
 t69USh0UWiXb2C+f2UBPWFgl2xlHiMFcmMa+Slj0NnxgZyatJkSqhRaSI7LjGOgukc+WW8HnNE
 HHm1PjZ3TMweTy1a3JYCoWWImjy0tR+J2T7ujMDv/PIpR7tc3bn7jUXLBqxaUhgq0MnClBm1wY
 +2sb87gBrY3ovpwpfjDVcnVCKaSBqEo8i/utm0vp5xCAy8BAAA=
X-Change-ID: 20250701-extensible-parameters-validation-c831f7f5cc0b
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4202;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Uu4/Kt51iG5RwW+QQycMfaL6T1BbngTCS7sEp6hsgVU=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBopJA62cdLWLMlt6AGMbXTv6os4+LZjbFwR87k6
 UOq1JnEN5mJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKSQOgAKCRByNAaPFqFW
 PKwjD/44m7Qm+dP9cjMiQsenxysuX1jWvVJKqw8ecef/dYrwre9snlps09f/mRC9Q+3KXUTIa7r
 kcBui+JiXIukGBQMKbrEFdHBJTnkwyeAAyXoQTbtYzdg4FCXF7WkEHQ4fKw7/cRzVAEs2X3Fjmk
 XzmrzJANUwtUOQ7/JS8BwIk3oVomtIGmPgC+F2yt7tT53IJfrBOCWffc4TdZ7VKXjjv4uJa+0WJ
 faRYM/zjxzCf1IbXyFUg78B8yiFGYe4twy4je8ZfD3vaUObH8Q2wDH5FTEc5o+eRg23ulelD5wZ
 X1dSv1qtkDR2xSBuCDpXxjEb1g4gjjveqcYDVvZDNgN4aeQdjsiQX+0qd6c5gC4qyAXuoAfp75g
 /JfoUX0HyOUNTTymzWdtM9l69CMSlges1WJL5+zpWGcMsPr8+VPSLFLQdJycdioelmdXcJF5e5z
 bxgcO2UEPJnXPL9BKoP1TMrxeIykTGj7Ak16JTOFBcxWYDU7sxI3L3C6vPrleAF9VuPCgPRbweE
 4OK7uS6L09tXd50GLjMaIyQ+xJMkEzk2auupGUco/XinpymbZBLowERQaCv+5kJ3+BSe/MLUX/3
 rN7lT5bjJeZd33VMefW2sModxyJ5Tz6D/F/BMrIryhmLep2O9F1TEYP5+aMnlPngoGS/N8OHEu+
 xixlVsAj1k4FUyQ==
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
definition, this series introduces v4l2-params.c/.h for the kAPI
and v4l2-extensible-params.h for the uAPI and re-organize the RkISP1
and Amlogic C3 drivers to use the common types and the helper validation
routines.

If the here proposed approach is accepted, I propose to rebase the Mali
C55 driver on top of this series, to use the new common types and
helpers.

I have been able to test this on RkISP1 but not on C3.

Thanks
  j

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
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
      media: uapi: Introduce V4L2 extensible params
      media: uapi: Convert RkISP1 to V4L2 extensible params
      media: uapi: Convert Amlogic C3 to V4L2 extensible params
      media: Documentation: uapi: Add V4L2 extensible parameters
      media: v4l2-common: Introduce v4l2-params.c
      media: rkisp1: Use v4l2-params for validation
      media: amlogic-c3: Use v4l2-params for validation
      media: Documentation: kapi: Add v4l2 extensible parameters

 Documentation/driver-api/media/v4l2-core.rst       |   1 +
 Documentation/driver-api/media/v4l2-params.rst     |   5 +
 .../media/v4l/extensible-parameters.rst            |  89 ++++++
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 MAINTAINERS                                        |  10 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 263 ++++++----------
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 349 +++++++++------------
 drivers/media/v4l2-core/Makefile                   |   3 +-
 drivers/media/v4l2-core/v4l2-params.c              | 123 ++++++++
 include/media/v4l2-params.h                        | 165 ++++++++++
 include/uapi/linux/media/amlogic/c3-isp-config.h   |  48 +--
 include/uapi/linux/media/v4l2-extensible-params.h  | 144 +++++++++
 include/uapi/linux/rkisp1-config.h                 |  67 ++--
 13 files changed, 813 insertions(+), 455 deletions(-)
---
base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


