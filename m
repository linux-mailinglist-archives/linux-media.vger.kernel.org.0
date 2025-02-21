Return-Path: <linux-media+bounces-26559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E3DA3F284
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 11:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B01517D2BA
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 10:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227D1207A2E;
	Fri, 21 Feb 2025 10:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iesoO2GC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D221F0E27;
	Fri, 21 Feb 2025 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740135150; cv=none; b=sUwK4VlzXhIRBn3MlPiafXwUcviiLdIhk1LP6k68yCFsLqJ05FKPo4k4RjnRfvi2F0zaeFtvoa3p/wceHDcvwrc/QSoAiOyk6oJEBOz28MZxksQriorKk1UOrLGPiqrH3aP7hf6Z/oOvHQJz936Gw5AwbQyAxTlqmQ3nXQMASUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740135150; c=relaxed/simple;
	bh=6R76t7iDWOkBm77/eyquD/bLxDA4gqteG02MF+iRuoo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hLfOm58gZQI9+Pewvog96L18oIPiriAXjAM+Lw5oV6VxE/Nzo8yOEZYHVjZmbzsCH53NajZMSpAKMuAxiMsWHGu0pumdVl/z9nlDaTpXk/b+dOETyy+Nt99Zfxm+7GoSddICFYyDmjanXmM+9fN6nidRMNoKhF23Bh8vggYh3e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iesoO2GC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4abb:6de5:9248:813e:8db3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32723E0D;
	Fri, 21 Feb 2025 11:51:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740135062;
	bh=6R76t7iDWOkBm77/eyquD/bLxDA4gqteG02MF+iRuoo=;
	h=From:Subject:Date:To:Cc:From;
	b=iesoO2GCeEipi/u9StVHLPXoc0DhIMVyWdiC+KkbmycZR7pp10Cckpj+wAg33/jxl
	 3TllBHU6WPUTkYCO+Og5gjJ1CPc7OsitmMEZjFKbAxgminQbUQKPFvr1o3LIGRey9I
	 6r72Tfl7oOPiA1Hmc3FwXMX1j+wBduHVvUUuNlBw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/3] media: i2c: imx219: Follow-up on binning fixes
Date: Fri, 21 Feb 2025 16:22:12 +0530
Message-Id: <20250221-imx219_fixes_v2-v2-0-a72154c7c267@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANxauGcC/3WNQQ6DIBREr2L+ujSAEqWr3qMxBuRb/0JooCE2h
 ruXuu9q8mYyMwckjIQJbs0BETMlCr6CvDQwr8Y/kZGrDJJLxaXQjLa9yrTQjmnKkql2wEG73uq
 +g9p6RTyzWnqMlVdK7xA/50EWP/f/VhaMM47topzTlsvuTg5NCt4GE911DhuMpZQvk+aQ7rUAA
 AA=
X-Change-ID: 20250219-imx219_fixes_v2-538e89d7b974
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=6R76t7iDWOkBm77/eyquD/bLxDA4gqteG02MF+iRuoo=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnuFrhaccsMzn7KMehGWxHtk+LIikL0ZNB6r68A
 9op1FieeeeJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7ha4QAKCRBD3pH5JJpx
 ReRaEADKBGfFgwuSrt/hReGe/JYrWBbil/YDjQ2mztczWPNsE0IURQb8IV+pzKSeq26RcyzCCfc
 CxJ7OUiRgvxmFyRJLswSrT6u+KqDjzKI1e+PseVheY/W/ita/Pu2lSNHuV/3BkDHdY1I7vvpS9F
 qpslCfJv+ZlOBitfNC0qN4yh9zTOBLGBGMMLTTZ9eXLhcNx0Pp8PsOvQbVmrvYnn+OG8Y7WQL/n
 KDeGTFpRfxO9es63lOcL9MI/JKO2bQxcC0LHJjktfmfGWzJAC0NzNrQ4c/f4PJOJoU4f+MnZGIm
 NPFkQmT5GZ4Iw2xPrd/lh3QmaDR7IU6xVG9MHXTDf1FnLbhURt1RJC3/vqxsoLelOyCsmIsQnrq
 wCAKveXMrJ4nq5kQKAjQ6QNey/KfQkJEYvYB/ty3vWgPQrafHbVbBrI9P1tSRhfBmUMsjTPtBwT
 NS7hDhvdkrm1FUA5H4YFnz8gESZ2pIn8f9ODYjgtKp+RTRDaIT/4DRiK1lySvNi4grcbwDyNGHc
 /VSDR1tRHrJDcdZxDQqCsXwxzZPAxKNDpuDP1vknSMLjpWLLOxv4HYonjAsrlhfC7YoOpnUvwsp
 F/fXI06YI+hlpGI9C4Q4CPb6nI2K4VrDUfIZihMaPtKmlncV4hKkkYBl+VEvfaU62gbGzWfA+8c
 E5F0nEzBA0Zm5cw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series is a follow-up for the already merged series fixing the
binning for IMX219:
https://lore.kernel.org/all/20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com/

There were a few pending review comments and suggestions on the v6 and
v7 of the previous series which are addressed here.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Move the minimum LLP change to the end of the series so it can use the
  updated imx219_get_binning() function
- PATCH 3/3:
    - Fix the binning check, and only update the LLP minimum if we are
      doing analog binning
    - Add a note in the commit message for the fll_def value reverts
- Add Jacopo's R-By tags
- Link to v1: https://lore.kernel.org/r/20250219-imx219_fixes_v2-v1-0-0e3f5dd9b024@ideasonboard.com

---
Jai Luthra (3):
      media: i2c: imx219: Simplify binning mode
      media: i2c: imx219: Use subdev state to calculate binning and pixelrate
      media: i2c: imx219: Only use higher LLP_MIN for binned resolutions

 drivers/media/i2c/imx219.c | 92 ++++++++++++++++++++++++----------------------
 1 file changed, 48 insertions(+), 44 deletions(-)
---
base-commit: 955a999ca2336869a01bbc2d346185c348929e78
change-id: 20250219-imx219_fixes_v2-538e89d7b974

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


