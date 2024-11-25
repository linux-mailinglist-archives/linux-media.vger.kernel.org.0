Return-Path: <linux-media+bounces-22015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9074D9D89BD
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EF3CB61BD2
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238661B393E;
	Mon, 25 Nov 2024 15:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iuV/b5pS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2461B21BC;
	Mon, 25 Nov 2024 15:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732547236; cv=none; b=Eq1O1RIwVW2x6/PA7bAefnvcnfekU53gFyM69evs/ZoIp6nPO3WaN8Hcuw2nV6kbsAH6/TYSnyxM/1IQlqlANKud7PTJdDuN5RcW2e2XriYfJa+AeJxSoC4oVr5qjjb0YnkV/3Q9hLYWbN4Y9i6FAsMJX/EV2tb18LpTuIkSnvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732547236; c=relaxed/simple;
	bh=w3HF1fXkN5s5Xp596bClIM0GaJVbiWhD8AYO+V3ziTE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ohonz/xWuOSj0UkSa1N9Oc4XEHGgTFx48Gse14oWTThGq1UOzGol2VzI/1IvFm+hwHbg0W/Bp1VoF8NflgztNOX49o4jJqgR9/EAZrP0Kj975ZNQBzg111++6YMGPkxaGhDQK7YsFpjuIWeb/XBUlKBm2NLsOUIRM7whT7VFTCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iuV/b5pS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:fbdb:56c3:2e5a:271e:2a92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DB506B5;
	Mon, 25 Nov 2024 16:06:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732547205;
	bh=w3HF1fXkN5s5Xp596bClIM0GaJVbiWhD8AYO+V3ziTE=;
	h=From:Subject:Date:To:Cc:From;
	b=iuV/b5pS/iIMDv0kB38pWMOsvTh82snInPbpggWCxIREIALHWrrQZBRkLIRC/jgKG
	 hSl8slSMu2M0I6AXyrZ/S+jL8HTR1gSXz2AsbqQXPctARhXPY34LmwjXcf6C9dHb2x
	 /aJf1KawPKvssjb/H2f78R2W4RXb6jldhyrS82u8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 0/3] media: i2c: imx219: Fixes for blanking and pixel
 rate
Date: Mon, 25 Nov 2024 20:36:24 +0530
Message-Id: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCSRGcC/3XMQQ7CIBCF4as0rMXAlGJ15T2MMQNMLYsWA4bUN
 L27tBsTo8t/Ju+bWaLoKbFTNbNI2ScfxhL1rmK2x/FO3LvSDAQoKeDI/TCBPN46P1HipkO0Chs
 NQrAyeUTaHmVxuZbufXqG+Nr0LNfrHyhLLrhRjbO1blqj6OwdYQqjCRjd3oaBrV6GjyFBfhlQj
 IMRukUtCJX4YSzL8gbfJKwk8wAAAA==
X-Change-ID: 20241029-imx219_fixes-bfaac4a56200
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=w3HF1fXkN5s5Xp596bClIM0GaJVbiWhD8AYO+V3ziTE=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnRJKTgxR8NUu4OpbHekt+P/rtzBOezQbaxVUs4
 vvKWLSepZmJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ0SSkwAKCRBD3pH5JJpx
 RQ8TD/9YNO+BL3VG5binPw25EeYLgRQUMTs8jLKKQeJCZ2g/uojdp8/3n16/ivji7zG6tcvEw7k
 xoN703f1B6lDoXEu1p2SRSg+Z3sBtpnkDAg5jhbHvH+ajGdsqAhFV+ClQyme59rM6byQQKkkVuc
 nMfFRsQKMHJxjIOa/ogEIA2paH0uYyLfpNu6azb6oZf7AINqUB7SO1AxsWdY3Dz8urmvAMyH5rk
 kezu7lxQmo6U1qlA9HbPu0KIeoMamlnjZc9UsYkoHDU+V1UiXhPahqmo1BcU1oUiaDfPL0W7qno
 TR+0FBtgzPNHcoFT055zmF2B8yarcEFSgjVMy02E7klcHEV1mAhDKYHofhvMFUAfGOlB+3MvWyP
 TMPeKh6DGjMyxk12cguPNK3kcuPLWkyxaG4mcjFpp0a7Y2QqnacuHxiOVj64cws9+VvFjJkEI2K
 nH8zc1LRf6ZPgNhUr7zrjM0AoIw0TZSJ2FoBytTsYX/bu2HzddgNn8kj+v6zkIYHyXYd/tv5dMN
 YDMyGAc6KjA17pKqwVdUFUEpXrcyKSDtdbtAnDLhQm+zi8N3bb4GINh58JgNjBuPXvNawZJsXa/
 i+NNaR0JcnsNBjR5NOakb8ouQBtg2ZYACz+3TMEL2FuJNK3oJLcVzxDe1UljPQiaIJ21AplozYg
 mRCZs0Ax4HWVkyw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series has a few fixes for improving h/v blanking and pixel rate
reporting for the IMX219 sensor.

These patches are picked and modified (and squashed where applicable)
from the rpi-6.6.y vendor tree.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- PATCH 3/3: Calculate binning mode to use instead of hardcoding
  per-resolution
- Link to v2: https://lore.kernel.org/r/20241121-imx219_fixes-v2-0-7b068a60ea40@ideasonboard.com

Changes in v2:
- PATCH 1/3: Add R-By from Jacopo, Dave
- PATCH 2/3:
    - Keep IMX219_PPL_MIN macro value in hex, matching the datasheet
    - Fix prev_hts calculation, by moving it before updating pad format
- PATCH 3/3:
    - Store binning register values in enum binning_mode directly
    - Remove unnecessary pixel_rate variable in imx219_init_controls()
- Link to v1: https://lore.kernel.org/r/20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com

---
Dave Stevenson (1):
      media: i2c: imx219: make HBLANK r/w to allow longer exposures

David Plowman (1):
      media: i2c: imx219: Correct the minimum vblanking value

Jai Luthra (1):
      media: i2c: imx219: Scale the pixel rate for analog binning

 drivers/media/i2c/imx219.c | 159 ++++++++++++++++++++++++++++-----------------
 1 file changed, 101 insertions(+), 58 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241029-imx219_fixes-bfaac4a56200

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


