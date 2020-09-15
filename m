Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5996726B368
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 01:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbgIOXCg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 19:02:36 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:53149 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727563AbgIOXCL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 19:02:11 -0400
X-Halon-ID: 76773da2-f7a7-11ea-92dc-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 76773da2-f7a7-11ea-92dc-005056917a89;
        Wed, 16 Sep 2020 01:02:05 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] rcar-{csi2,vin}: Extend RAW8 support to all RGB layouts
Date:   Wed, 16 Sep 2020 01:01:38 +0200
Message-Id: <20200915230140.1201187-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

When adding support for V4L2_PIX_FMT_SRGGB8 it was overlooked that the 
same solution could be used to support all RAW8 RGB layouts (SBGGR8, 
SGBRG8, SGRBG8 and SRGGB8).

This series extends the R-Car VIN and CSI-2 drivers to support all RAW8
RGB layouts. The VIN driver changes are applicable to both Gen2 and Gen3 
while the changes to the CSI-2 driver only effects Gen3.

Niklas Söderlund (2):
  rcar-csi2: Extend RAW8 support to all RGB layouts
  rcar-vin: Extend RAW8 support to all RGB layouts

 drivers/media/platform/rcar-vin/rcar-csi2.c |  3 +++
 drivers/media/platform/rcar-vin/rcar-dma.c  | 28 ++++++++++++++++++++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 27 ++++++++++++++++++++
 3 files changed, 57 insertions(+), 1 deletion(-)

-- 
2.28.0

