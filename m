Return-Path: <linux-media+bounces-44835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EECFFBE7122
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 10:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88D843AD051
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4E125393B;
	Fri, 17 Oct 2025 08:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zjx4b7dm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFB6334693;
	Fri, 17 Oct 2025 08:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760688865; cv=none; b=kzoD2xvPWYAZeuytFQDsLq4bzYnvUgvBS84WutcvwAHnGog/m4z1VO3SKFbes5TmHVZmSGVw7s2Br7bYERerlEmJeCivUPJAJckx91WDaV2CffE28w2uvUl3lp/IFQdWcLK4w+cg4m6sYrdvOa7yrfevxVtyIn6oAMzQAvQoUFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760688865; c=relaxed/simple;
	bh=Gt4jeIt6AGoWRlwnnmRrSWrMi+AlY5uLIOaH/q2c1qU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L1F0FBBfWKRlfRJ2D/IAwHk0mJfMLee1ulp3h0uvsSzn8iyvEM7AW7NDPoqUI8SchwSSQs8hmqV00XR/XPa06QoqoxPA2Zz1x6gFwX7fnUAeFhkdgbGfqSnVzMbMEfLVgrvJKeykGi6NGY2YJL64yoyuDFcVmwkaLWT3Rlr20mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zjx4b7dm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:2112:eb18:6ce9:5a39:76a2])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C96B11574;
	Fri, 17 Oct 2025 10:12:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760688754;
	bh=Gt4jeIt6AGoWRlwnnmRrSWrMi+AlY5uLIOaH/q2c1qU=;
	h=From:Subject:Date:To:Cc:From;
	b=Zjx4b7dmHxHDkx2/LRul6jl+1phJgj+mhRpasaVZMGrYxkNUPsT17oLRxZctFZpVr
	 qjj4SW71/KzKSpqHSBsTgnwRQSy5dHZz3+0f1/jb606Yd8US+go8at0PtSOf9G9+8i
	 EfJtJU9wxT2YKD65gGjAoFHN1Yi/EtWEvkTmiUEw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/2] media: i2c: imx219: Fix regressions introduced by
 1x2/2x1 binning
Date: Fri, 17 Oct 2025 13:43:48 +0530
Message-Id: <20251017-imx219-1080p-v1-0-9173d5a47a0c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALz68WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Mz3czcCiNDS11DAwuDAt3EFOO0pJTkVHODFEMloJaCotS0zAqwcdG
 xtbUAhd1nh14AAAA=
X-Change-ID: 20251016-imx219-1080p-ad3fbdce70d1
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Gt4jeIt6AGoWRlwnnmRrSWrMi+AlY5uLIOaH/q2c1qU=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBo8frNjYwEooEFXGUo/gUUj3qlrBTlxQBv1QQcx
 0ajtNIWXnqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaPH6zQAKCRBD3pH5JJpx
 RdZWEACn3KdJ1+Hu3P735mdJVCskbwSbIgC+jMt/IjL4wCOSJhciPqmez3L87KIgdv0g6G8XKGQ
 QPmEo7dwT/I3Baj71X2Kq5+GQZyyeUM37+hOQtTeO8IdR5jDPMhv8jz0f+fbefzcQp/z/ip763n
 TIY1BQ0FnswBQRCIipjX4+3M+OgfzTJgjT+LUh34jToAdW9IbrGmPY5okesYDxyCgh5ZiShrTlY
 r0Dql7TDn7ZcUGSxvgM9rH8MT25VcY4vra+t5KvFU/3CcJ2T4UPIrV9PJS4k3OgNss9kDyeYbq4
 u6LFaQ9O5/YNPi4Yopje4NE9+USculW+zre6Px+L1ujN+H9iL7CYR106+sjlsXFXKiwP2WmoPvU
 3MrUqYIUvD6TzZVNTK8i9cFmO/9SVX9qqgYk4qDV2lPtAcRVYXSRxFSSNCXK3EN8CsoE28HdAQG
 JepI5abwowma3KkaJ7lrZ3voWpvZJvuJsobdSMAz2Dx6WmmhjuAH+6A9FLsY+keYRKNhmLjtUoT
 4CgwEMitsOd7Cc+rwRJlVgVdWPLi0XpzSrsb+O2i6iKj3abiY7W11onWkyhOUsohOvhZm2fdO03
 ooj4sQ5kiDSx/5E0mwRZ77utBE12vEH/x4JrrbrMftPaTi2uwlihXXA5r/t8YM0QaVlh8Pf+bcu
 rcOlctoqAPI6p9Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series fixes a regression introduced in commit 0af46fbc333d
("media: i2c: imx219: Calculate crop rectangle dynamically") that
started using vertical binning for 1920x1080 without binning
horizontally, causing the captured images to be stretched in one
dimension.

In a subsequent patch, simplify the binning mode calculation logic as
well. This is done separately, without a fixes tag, as it is cleaning up
code that was introduced much later to the regression commit, and
doesn't strictly require backporting.

Once Sakari's metadata series with binning controls [1] is merged, this
and other existing sensor drivers may be extended to support free
configuration of resolution, and give the userspace freedom to bin
pixels in only one dimension if required, of course, as long as it
doesn't cause regressions with exsiting userspace applications.

[1]: https://lore.kernel.org/all/20250825095107.1332313-44-sakari.ailus@linux.intel.com/

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Dave Stevenson (1):
      media: i2c: imx219: Fix 1920x1080 mode to use 1:1 pixel aspect ratio

Jai Luthra (1):
      media: i2c: imx219: Simplify imx219_get_binning() function

 drivers/media/i2c/imx219.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251016-imx219-1080p-ad3fbdce70d1

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


