Return-Path: <linux-media+bounces-41947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC815B4838F
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 07:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C6BE3B8B33
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 05:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B28C2222D8;
	Mon,  8 Sep 2025 05:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPEPU7Rl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B182F510
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 05:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757308561; cv=none; b=o6aBTRyZLYfpdY3+6k0kPScYuSMZ1sSHV/OAaKLXaLbDkqm/9JESRa2b9cPotBYWgnBx2ythDar3KR/FZK+Gbol+c7Hcm5p8vH7t+WrYuIC2A66Y1H+DUYZnjx2O8diNmGaJggCgO0YO4YitD8u6KPY74BA9/S6vTiMh0B7a+do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757308561; c=relaxed/simple;
	bh=dMzRG3cf7fPRJBRXovxhRiku7WAELsJWHaHyz3AXazg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qC9ZD1VeqKZP6LInS+26vU2gnhfTIWXNoXzGGta7V7wRmwco9lRLr3/8wz4WtL9Pz9iK+tHSAka0YVxJGZWvblEblxcGWH2HHu67325Z460C6e9d0Kv+YvgEMYfPyajUH9DOIzC5X8WaHCmTyn3xxUMM2KfNsj/qQzFQqhc2Nqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPEPU7Rl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF62C4CEF5;
	Mon,  8 Sep 2025 05:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757308561;
	bh=dMzRG3cf7fPRJBRXovxhRiku7WAELsJWHaHyz3AXazg=;
	h=From:To:Cc:Subject:Date:From;
	b=gPEPU7RlVVxSNp0eGKlUOmbrSkTiUAmacp0D7NNgKG8CGIbK85hwHJThGM2UVl7TQ
	 EK2tjkYBM9PNRi0xXq45Tf9B/iZfU21VMT6t9442P0bSG2JWGQ+XhszLCvvCfbi9v3
	 PjGHS2INE4UG/px7295AQCu0hH7iftlzRpPDLfOTRsZUorsn+89sMJEJ65Bb2htFJ0
	 bmH71IhuXpO2ENl7HuTb72YVdexxuJSGSkfRRRPRIv1sp7+0aEnf4sdWXDjQRDjZJM
	 2HBMgHDVvjfUN8tZREXnwzU/2FZs+idis6GW4bjqCIc0D5XqI87jFM7glBI1ZuPq5O
	 yDMGsxb0wfOXQ==
From: bod@kernel.org
To: linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org,
	Bryan O'Donoghue <bod@kernel.org>
Subject: [GIT PULL FOR 6.18] Please pull platform-qcom-venus-for-6.18
Date: Mon,  8 Sep 2025 06:15:41 +0100
Message-ID: <20250908051546.14563-1-bod@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 34837c444cd42236b2b43ce871f30d83776a3431:

  media: uapi: v4l2-controls: Cleanup codec definitions (2025-09-04 10:37:05 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-venus-for-6.18

for you to fetch changes up to 877bb5425240e1cb92ecaa9f26f73b40a416081f:

  media: venus: core: Add qcm2290 DT compatible and resource data (2025-09-05 12:52:07 +0100)

----------------------------------------------------------------
This tag includes a new SoC and some housekeeping

- qcm2290 Agatti
  Version checked to a specific version of firmware
  both encoder and decoder are supported on this platform.

- A bugfix from Stephan Gerhold.

----------------------------------------------------------------
Jorge Ramirez-Ortiz (6):
      media: dt-bindings: venus: Add qcm2290 dt schema
      media: venus: Define minimum valid firmware version
      media: venus: Add framework support for AR50_LITE video core
      media: venus: hfi_plat_v4: Add capabilities for the 4XX lite core
      media: venus: core: Sort dt_match alphabetically.
      media: venus: core: Add qcm2290 DT compatible and resource data

Stephan Gerhold (1):
      media: venus: firmware: Use correct reset sequence for IRIS2

 .../bindings/media/qcom,qcm2290-venus.yaml         | 130 ++++++++++++++
 drivers/media/platform/qcom/venus/core.c           | 109 +++++++++---
 drivers/media/platform/qcom/venus/core.h           |  18 +-
 drivers/media/platform/qcom/venus/firmware.c       |  38 ++++-
 drivers/media/platform/qcom/venus/firmware.h       |   2 +
 drivers/media/platform/qcom/venus/helpers.c        |  12 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c       |  11 +-
 drivers/media/platform/qcom/venus/hfi_parser.c     |   2 +-
 drivers/media/platform/qcom/venus/hfi_platform.c   |  23 ++-
 drivers/media/platform/qcom/venus/hfi_platform.h   |  34 ++--
 .../media/platform/qcom/venus/hfi_platform_v4.c    | 188 ++++++++++++++++++---
 .../media/platform/qcom/venus/hfi_platform_v6.c    |  33 +++-
 drivers/media/platform/qcom/venus/hfi_venus.c      |  25 ++-
 drivers/media/platform/qcom/venus/hfi_venus_io.h   |   4 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |   2 +-
 15 files changed, 537 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

