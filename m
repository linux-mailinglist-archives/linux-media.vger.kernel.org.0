Return-Path: <linux-media+bounces-19090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E30C9906B6
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED07FB26B1F
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7E42194A3;
	Fri,  4 Oct 2024 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YsM3ZrI1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AAE2194A1;
	Fri,  4 Oct 2024 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053237; cv=none; b=EATFKle5Fg3ABmVc9T+9qCWKJj7G7w2nw/LKOmwTaXqPUdD/4MqiPuR/xTG3Bf7II9C8DOt2xoSRJVc+4IAo2ro7IHTvrgXlE8/pR281bmngTUG0X0VZaZSfJrkilCwWe3e4npk8pAo721jpD2mnj5dF7zZGKuZzYWuQ8wvXkcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053237; c=relaxed/simple;
	bh=Nh1er13TAPWikjcnmarEBiuhi3VwyDuBy0fodlJPh88=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I/R5qLhG1NEqawEmDJtcMV9V7A4NYsbSX/GLmS+T6EEan4W2rMU6SSMhYuXwZdv0ommrVclUXDfRnoY9dkganiIiRiVTHpn4s7MJputdU3cvFv4Uvvp8mlYSVmDq2dE7GkAoR2ZIwmT6nCVu98EyDv/4dtQQLdExUnfsyHqXPKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YsM3ZrI1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A2564C9;
	Fri,  4 Oct 2024 16:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053139;
	bh=Nh1er13TAPWikjcnmarEBiuhi3VwyDuBy0fodlJPh88=;
	h=From:Subject:Date:To:Cc:From;
	b=YsM3ZrI1B3u1VQHTQ4vDePe4k+UzLhqQnzCqoOwUVj4fUTYOuzdqaa+ex+7SNrbFn
	 GI7RkxBh8Okhy4Z/E+fQoRP8sdItY0lj+eKjisRID2NtG+KZlV/9Vrgz4A/CoFwkmp
	 oHvoZ1bviEdlBnr2cVtOBNAj3DXt45OkkxYFavPw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 00/13] media: i2c: ds90ub9xx: Misc fixes and improvements
Date: Fri, 04 Oct 2024 17:46:31 +0300
Message-Id: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMj//2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwMT3dIky4oK3bTMitRi3aSkRAuDlGQTCzMjcyWgjoKiVLAEUEN0bG0
 tAE0QBohdAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1918;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Nh1er13TAPWikjcnmarEBiuhi3VwyDuBy0fodlJPh88=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///nEv88MMPdDU7tWBXP7s+G9Fj3063p8Tldh
 no2iVCKPtKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//5wAKCRD6PaqMvJYe
 9Ry/D/9IX969/b2x5AIrLc+EnzhEofDb3qwY0ldjurcbCPTWP7n3cSjDWTjvZLJJ5lqcLNHbLFP
 CHo9l2OiPpX56bS7oSFiDb/OgEP9MtcHLCS5hP7KiSmVVE2bDhRI7K0zqsNySDGN8u8HdAVSsGK
 BeT7cxZRJinS11lDUUt1ot0C5rm6W0c80xEdYMWFHKR/uKW+s4rsy/CUi/3rFzCM8/7ktBE9GcV
 OpNfNSaa3v1qlRw9dylTfueORawqmttCRpGM6MGWM4AP1xPL0Kej6t24odAxPtVIzhMX/NBjxDl
 YYiTFyMhSV1tft0Yl3ia1Yp7GUZ2CxXPRE5mYIslZijUPvC/lAY9S9hC0N3JVZ3sTVmat8b3WUx
 5FjPRIZqWwnJOf50gSqnDtWyKh/dPLFyN2Wue8sINReptNJfyh0heLb95yz/pHA2sItg++2ESzY
 jNDpxsj/bgpxzksY/RDmjq8UGwbZuH1aejDutqacR7A6i4feN6gXZVzQm75inF+tIv1Yz57FM76
 OXNBdYgVmiQtW8SVKAFIc5HOZ4UWmY2lMhCiVXteo5Crxq1/c/dKG22xEnzjTeqtFByamkOOjpZ
 c1z1JHlaopO8/+iYgRwJP/N45f8SSeiiuiLy81L4AP7CwUJlhIol7isGJq2t8RRvWkB/IV3vLqJ
 oB2aaH7Vmit/gcA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

This series fixes various small issues in the drivers, and adds a few
things (a couple of pixel formats and a debugging feature).

It also takes a few steps in adding more i2c read/write error handlings
to the drivers, but covers only the easy places.

Adding error handling to all reads/writes needs more thinking, perhaps
adding a "ret" parameter to the calls, similar to the cci_* functions,
or perhaps adding helpers for writing multiple registers from a given
table. Also, in some places rolling back from an error will require
work.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (13):
      media: i2c: ds90ub9x3: Fix extra fwnode_handle_put()
      media: i2c: ds90ub960: Fix UB9702 refclk register access
      media: i2c: ds90ub960: Fix use of non-existing registers on UB9702
      media: i2c: ds90ub960: Fix logging SP & EQ status only for UB9702
      media: i2c: ds90ub960: Fix UB9702 VC map
      media: i2c: ds90ub960: Add support for I2C_RX_ID
      media: i2c: ds90ub960: Add RGB24, RAW8 and RAW10 formats
      media: i2c: ds90ub953: Clear CRC errors in ub953_log_status()
      media: i2c: ds90ub960: Drop unused indirect block define
      media: i2c: ds90ub960: Reduce sleep in ub960_rxport_wait_locks()
      media: i2c: ds90ub960: Handle errors in ub960_log_status_ub960_sp_eq()
      media: i2c: ds90ub913: Add error handling to ub913_hw_init()
      media: i2c: ds90ub953: Add error handling for i2c reads/writes

 drivers/media/i2c/ds90ub913.c |  25 +++++--
 drivers/media/i2c/ds90ub953.c |  56 ++++++++++----
 drivers/media/i2c/ds90ub960.c | 168 +++++++++++++++++++++++++++++-------------
 3 files changed, 176 insertions(+), 73 deletions(-)
---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20241004-ub9xx-fixes-bba80dc48627

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


