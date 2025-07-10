Return-Path: <linux-media+bounces-37307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62205B00461
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1256D565A1D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35633271479;
	Thu, 10 Jul 2025 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cd2Pu3xP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC2122FE08;
	Thu, 10 Jul 2025 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752155568; cv=none; b=XgqVCurbRYRzL0ZbWu8EUCxBSrTf76YbQBkx+sSeUeRw09MehET8y/8EK1SC0lIZGju9+UHJCQvyRo+Qi6vvmtWDEqOtiDriiyJX3tDpqqd0TrffiV2p9IbEQl5GWCjF7M+sSp8+OQ6Gl+A9/ai7NweB/GZGnALYiAI1WmFcuQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752155568; c=relaxed/simple;
	bh=ltV2NmqZnLdjI6S4icFVfh0nEI7TIGS2rMawXHll0Jc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PWGgTcBd7bzH3gLv4KChLMM9wXiWqJX20rthYjXV9/XcIrpqHP2PCpqxsK/YYDizeAaU47XLjZVSu5IKsvRYdrfksv4Hg1claKrZ+yeC/eQr5eMhYcUvpFnvOk2rMwU2d5H3NNmO0c28q8XM2Y91B0mk3HsV5m7h2/E/HlPtNbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cd2Pu3xP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-137-205.net.vodafone.it [5.90.137.205])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 397BA7E4;
	Thu, 10 Jul 2025 15:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752155536;
	bh=ltV2NmqZnLdjI6S4icFVfh0nEI7TIGS2rMawXHll0Jc=;
	h=From:Subject:Date:To:Cc:From;
	b=Cd2Pu3xPh8ah76hWeGoUu08VktgOpBI4d2BZNQir7DqW9sy2uDPBNDm+8E/KeZM/8
	 thKIS6W8KcLJ+oofUfHLrZH7et935KAoRPFl01M+Iqz1Xiyjnd0yYHnzdgaDtmdEIu
	 mo5krwz4SkOLhBUEHW0dgekgw0gXQ3hjNK6JFiXo=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 0/8] media: Introduce V4L2 extensible parameters
Date: Thu, 10 Jul 2025 15:52:09 +0200
Message-Id: <20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIrFb2gC/4WNwQrDIBAFfyV4rkUtwaSn/kfJwaxrs5BoUJGUk
 H+vDfTc4zx4MztLGAkTuzc7i1goUfAV1KVhMBn/Qk62MlNCtUILyXHL6BONM/LVRLNgxph4MTN
 Zk+uZQ3eTTrsWQIysataIjrYz8RwqT5RyiO+zWOR3/cm7//IiueC9A6WhB606eJBFk4Ifg4n2C
 mFhw3EcH5mNBhrXAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4105;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=ltV2NmqZnLdjI6S4icFVfh0nEI7TIGS2rMawXHll0Jc=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBob8WqnZIqf8JtgptvtcnMMjv154NliSMyaGlv4
 XM1EvwR2d6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaG/FqgAKCRByNAaPFqFW
 POnCD/9tYh7mULnbOKKtqeQFSJCz6mEgIJ9h+X3cAxe8IVNHleaYLwr1UPKIubHBA1tjkXW/U4S
 HeCjSSrwGmfmwfvWeJQkfxU4IyFgpXjN+RL5tYqNbrx57Bn6UZ6gwoBq/P6ZWdFgO2kqP0aCjY9
 fD5DARRpkC2WqC+8u+y/QYEqEfXQ8gzYzkUT7HHbSbqj6p3rxFmmT5R1S8IHbTgLTgfEWOqz9yh
 Tg7AiZ5M6HVchAxwHPYlE6mC5/84iZ7CpuoffI81XyG3Tng4U8a2OmitsUtNgxUqNgwiJGvP1HH
 cJ4TjgOwjBHi1pPvgiur081KeUIQgqeO7AWn1SXLgcVJSQhcvYjsbfTvdHfsmmQgDP6M5VcKpqX
 RHHYp0d7DfjyQaXq/HixePTRd/wgaQxXYsLDZt5tCDadGaph/Qs6DO7qxpxih9dhwbDSfbZKe72
 RHU4ZV05zO3BiwYlqp+f7x5+BkJ0ZNgqthY9Aw0prXT4S0c2VEmkb/Q/qxuIDjn9dVKogqmabxq
 SKHoKuheItgbvci6WkfVoM+kLn/oYlF7dDRFkoHtVwM9fXmgHteHTnyrYX8QKMHVL7SJHbnJzcy
 yHBZ4LSnpZB8gBRa2XBp54gi8wRWxESYJhkmfkJAG5NOfvnf677XfMBB9ITdDQRFIXt6m6cy00X
 llsIf/ioPrJJahg==
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
Keke: would you be able to give this series a try and see what happens ?

Media CI pipeline:
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1467814

Thanks
  j

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
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
 drivers/media/v4l2-core/v4l2-params.c              | 128 ++++++++
 include/media/v4l2-params.h                        | 165 ++++++++++
 include/uapi/linux/media/amlogic/c3-isp-config.h   |  48 +--
 include/uapi/linux/media/v4l2-extensible-params.h  | 144 +++++++++
 include/uapi/linux/rkisp1-config.h                 |  67 ++--
 13 files changed, 818 insertions(+), 455 deletions(-)
---
base-commit: a8598c7de1bcd94461ca54c972efa9b4ea501fb9
change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


