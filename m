Return-Path: <linux-media+bounces-25268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4921A1B8E5
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36DE13AFCA0
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AAE158536;
	Fri, 24 Jan 2025 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H+ah+wAr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09715575F;
	Fri, 24 Jan 2025 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731896; cv=none; b=fYf3Fm5PADgzPMumK0ZFezAI2kPpnEIh9mODyyNEv5M95MVONcQgQ2OuguIBVg0z6KkmvaxpsYBjqI3rlbRl7oO0FbEeNYPP0Itlc+3sPJbjnO8JRfXl8PM9TTObpkFcBEB22FRd0S2JYDXGabE8ED1c+ZtRjK5SELuNyDL5+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731896; c=relaxed/simple;
	bh=+/WWmn7thrQXvimTD8XRlyxpZTAZCzpDAVlWRCLuhEs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gJspg7tGjHEog8qiW5C9DZNT7vVgOTs81laQ0CePo0Dh+3YeWOdyT7gu+rYrjtDUbHr/ggOr32fSqA7HS+g1YLXXcHfCPoneuRmFZW92Qr+gtZSEjOrgxUNgqBYZAesYinf56u1fGSMJHCFg8bEZPy+ck+ROS0yKSRvL90RPGdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H+ah+wAr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 128994AD;
	Fri, 24 Jan 2025 16:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731828;
	bh=+/WWmn7thrQXvimTD8XRlyxpZTAZCzpDAVlWRCLuhEs=;
	h=From:Subject:Date:To:Cc:From;
	b=H+ah+wArctX93LHu9SUotVyrrTnSlYLEzIRTk4E/p52dc9t1zGf4dUtFyXCgLkL5S
	 yZL/vbU/HxfIPfSfZu88rU4yBTayUaF2uOa5BnvUlljufilr8RpJ8A8A29BeTrpySf
	 r+1viNweRH+/r1/ezFX9ObdLfdTCH7+onM1LD+IA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 00/22] media: i2c: ds90ub9xx: Error handling, UB9702
 improvements
Date: Fri, 24 Jan 2025 17:17:37 +0200
Message-Id: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABKvk2cC/32NSw7CIBRFt9K8sRggqKkj92E64PNq3wBooBJMw
 97FLsDhOck9d4eMiTDDfdghYaFMMXSQpwHsosMLGbnOILm8cCE4e5uxVkZ+TbGgx7BlNoqbNEq
 h4cZCH64JZ6pH9Dl1XihvMX2OjyJ+9m+uCMYZcjNqMV+VcvpBDnWOwUSd3NlGD1Nr7QuU0laBu
 wAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org, 
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3109;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+/WWmn7thrQXvimTD8XRlyxpZTAZCzpDAVlWRCLuhEs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68nt8hgLhfIbfjCaqeKLR1vL5T9mlQana3pH
 lIRmetdIOCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvJwAKCRD6PaqMvJYe
 9U89D/sGKwIt+ltk+wkRSCr2Ef5a+PqFlOLfB8C0SPHguxCDuI8qIP6WNv28ovd1gB5+HJl7dgv
 6Clw3qNepjxGhUm6VUFQt3JGkrs7i8oz5hZh1hdc4pRxgihcgtb79aj+MAZD6/2USzzifipANH6
 pg5WUIf1gz70nIxWDruv+oD9Wmo9yOlQScg98iGkH2uARmG7XYVpLvySHEVhladxJUUa1ZrZRQg
 W1iu92r49yS0g2GZd0gont4AY/u4oluv9l+PYi9wxBpzEHvHi8ZmKwUSNTScy2V9r1I2M71yyjq
 7m7J9YPw1VP0tLCm0EudHDZIkRyuBtX2Z2EM78Slh8cKoOCO1s2W0jNpCTjwoRFQ5vHJVNkf+rT
 /q6sjE+vT8Qy0GzWzCwuDKIv1Q9EEV34cCAK+qIMZ3y63LX60SZLsIIN2OJWrLuFlqIUbwgA4YU
 ftFsRT0LVZq/KKJJ15g71WYrbS05h6b16VfkDnGQ9A6jj1bsyBij0hWWzmI6yva75jtQeSw6nEg
 2i6kVLlX8IBtn4Jzg0EWSrOqWnSdOnSSKjegm6O8OZygvCAQemueFNbkxO/cU9v/fouikNKaMjL
 SuJ+z6ZCYqqSuK7F4tF57uiikZNG3tbsXS6m8y39qnFOj8U8/k6ezp0fRFrSCWkkn8a3FWG12Xx
 eDBfUeJAZFOUrkw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Hi,

This series has two main parts: 1) add error handling all around, and 2)
update the drivers according to latest (mostly non-public) information
from TI.

The "Update UB9702 init sequences" patch basically rewrites the init
sequence from scratch, and to make that patch easier to read, the
previous patch first removes the current init sequence. In the final
version these two patches need to be squashed together.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- Add new patch "media: i2c: ds90ub913: Fix returned fmt from .set_fmt()"
- Reformat the reg write in "Speed-up I2C watchdog timer"
- Add 'it' parameter to rxport for_each macros
- Move 'enable_sscg' module parameter to DT
- Change serializer 'i2c-addr' property to serializer 'reg' property
- Split ub953 registers to a header file
- Link to v1: https://lore.kernel.org/r/20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com

---
Jai Luthra (6):
      media: i2c: ds90ub953: Speed-up I2C watchdog timer
      media: dt-bindings: ti,ds90ub960: Add ti,enable-sscg property
      media: dt-bindings: ti,ds90ub960: Allow setting serializer address
      media: i2c: ds90ub960: Enable SSCG for UB9702
      media: i2c: ds90ub960: Configure serializer using back-channel
      media: i2c: ds90ub9xx: Set serializer temperature ramp

Tomi Valkeinen (16):
      media: i2c: ds90ub953: Fix error prints
      media: i2c: ds90ub913: Fix returned fmt from .set_fmt()
      media: i2c: ds90ub913: Align ub913_read() with other similar functions
      media: i2c: ds90ub9xx: Add err parameter to read/write funcs
      media: i2c: ds90ub960: Add error handling to multiple places
      media: i2c: ds90ub953: Add error handling to ub953_log_status()
      media: i2c: ds90ub913: Add error handling to ub913_log_status()
      media: i2c: ds90ub960: Move UB9702 registers to a separate section
      media: i2c: ds90ub960: Add UB9702 specific registers
      media: i2c: ds90ub960: Split ub960_init_tx_ports()
      media: i2c: ds90ub960: Refresh ub960_init_tx_ports_ub9702()
      media: i2c: ds90ub960: Add RX port iteration support
      media: i2c: ds90ub960: Move all RX port init code into ub960_init_rx_ports()
      media: i2c: ds90ub960: Remove old ub9702 RX port init code (SQUASH)
      media: i2c: ds90ub960: Update UB9702 init sequences
      media: i2c: ds90ub953: Move reg defines to a header file

 .../bindings/media/i2c/ti,ds90ub953.yaml           |   77 +-
 .../bindings/media/i2c/ti,ds90ub960.yaml           |   21 +-
 drivers/media/i2c/ds90ub913.c                      |   82 +-
 drivers/media/i2c/ds90ub953.c                      |  242 +--
 drivers/media/i2c/ds90ub953.h                      |  104 +
 drivers/media/i2c/ds90ub960.c                      | 2264 +++++++++++++++-----
 6 files changed, 2070 insertions(+), 720 deletions(-)
---
base-commit: c4b7779abc6633677e6edb79e2809f4f61fde157
change-id: 20250110-ub9xx-improvements-9172b44eb0bc

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


