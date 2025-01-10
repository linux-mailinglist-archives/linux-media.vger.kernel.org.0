Return-Path: <linux-media+bounces-24580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A27A08B10
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CA4B3A992B
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538F0209F4F;
	Fri, 10 Jan 2025 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="atEai1jX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBF2209F30;
	Fri, 10 Jan 2025 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500511; cv=none; b=E7FTn16ep3SWPI3IK9Cf07CogegOTIV4TpOdNfuzyz6lSD5QZb9FYzh1fS6fpUVN9ahl+BTAwqWQq/9X89zMWl+Z0eeHYTcQsvqOt/93w6vnTpa69utxPb1IP6haHWw/gceQfG+xsN2xszr3E14bE8NrYhxZNBeKyXifQLfgmy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500511; c=relaxed/simple;
	bh=vumpMH+3ZcMqaMA7FHswjjvzbgPFHUllLrCl6sZ3qEc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fhzzu8Au53XznEqEjvLT3JPbyCZY8/OrCjMxhPr57GlebcYVXoKqEy6Kytc2ktx0nKWUf5jnMbtJPXowLD5kuSi2YyJrn4EBy0ZOmDliQ03tvN0i4AJ/I74+X1sxCEIwEdI/JQ9/ZgO/JSMyuxySbKSRKPdk87TVdWp6+zcq06o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=atEai1jX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31087CE6;
	Fri, 10 Jan 2025 10:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500450;
	bh=vumpMH+3ZcMqaMA7FHswjjvzbgPFHUllLrCl6sZ3qEc=;
	h=From:Subject:Date:To:Cc:From;
	b=atEai1jX8SbWIa32/o8Tv3DhOYifnMj8P+i1w+8aHmYfDyRgSeBTe5OaTlv4yDn+X
	 AKTmfkV2sMBnAh9qAoKzjtU44N4JmXyRrTkA3Ngc1qRFFNYH6JJU7Eouw6mrj1A+3M
	 wFK4mntFaiJXH9xwiKvU+HuPuKi7a2j4q+sagKIY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 00/19] media: i2c: ds90ub9xx: Error handling, UB9702
 improvements
Date: Fri, 10 Jan 2025 11:14:00 +0200
Message-Id: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANnkgGcC/x3MQQqAIBBA0avErBNUjLCrRIu0qWahhpYI0t2Tl
 m/xf4WEkTDB1FWImClR8A2i78Ceqz+Q0dYMksuBC8HZY3QpjNwVQ0aH/k5Mi1EapdBwY6GFV8S
 dyj+dl/f9APskSMdkAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=vumpMH+3ZcMqaMA7FHswjjvzbgPFHUllLrCl6sZ3qEc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUMLSUSFwj5+JSZDa6hkAQSXMs0M+T32a9px
 Ns60XlOKs+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlDAAKCRD6PaqMvJYe
 9YoiD/4lMNb5qWz8gwxciRmKAWmoZJLL5zj+dTPLlfxPm5LJffMR+IDzydr+StZarmSlqRrwfoh
 uB0jexcMWYC0M1/GL9Juaju6ki4BvgdUpIm0AxsPayOkEpWaz3ROGICAugE75O2Vgd+27KZfLLR
 y/FVWNuLc2/YikcKmORg0UVPiDF2NipeL+ntt9TFLITOslbRrvXGgx37TF59wYsKrVCdwPLK8L6
 AoL87+8v6gWzyiTrhHU2OGRn7ugdLhGS7ZdvlipZGoVAG5CrrwdFmiVgT3UbQ4kviFPxNj3Y4I6
 MASsgyxSR5/sYlwFIlTTeONHYMPjF34R6TDE46/pR+bS51CGCOkfwTb3NObvWoUZk0Pzb+/BoEW
 FNeNFMlaoyxr9sybvJoDDfulsKQzZlyGoHsMtBiIk/oMVEUIvQyzwF2rNrB5X+fXzB+iJOtKJvj
 WOWuGb0XZD1kg/r16u9NtuoGRIWtj0gkb5MvZIHxybckbjACx7KDg5fbMcTcW7pyOzj2uJfMFPB
 6isJAbw+Mby+u0YdrqfbU1hKNcHGUR8Pgq3rrLkvRG4sGztmiBX52pWRh4B/haoGk8MCwyt4I9O
 knkFLupieKzCBbSSpU8bGGsghyID9eXg4hWzqnkTMF3XiPb32qRT5IqHX3WP74ToysnLEWL0kLZ
 j+rbD3gAAjtHJCQ==
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
Jai Luthra (5):
      media: i2c: ds90ub953: Speed-up I2C watchdog timer
      media: i2c: ds90ub960: Enable SSCG for UB9702
      media: dt-bindings: ti,ds90ub960: Add "i2c-addr" link property
      media: i2c: ds90ub960: Configure serializer using back-channel
      media: i2c: ds90ub9xx: Set serializer temperature ramp

Tomi Valkeinen (14):
      media: i2c: ds90ub953: Fix error prints
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

 .../bindings/media/i2c/ti,ds90ub960.yaml           |    7 +
 drivers/media/i2c/ds90ub913.c                      |   78 +-
 drivers/media/i2c/ds90ub953.c                      |  170 +-
 drivers/media/i2c/ds90ub960.c                      | 2266 +++++++++++++++-----
 include/media/i2c/ds90ub9xx.h                      |   15 +
 5 files changed, 1927 insertions(+), 609 deletions(-)
---
base-commit: 40ed9e9b2808beeb835bd0ed971fb364c285d39c
change-id: 20250110-ub9xx-improvements-9172b44eb0bc

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


