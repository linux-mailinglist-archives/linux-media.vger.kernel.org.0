Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC17DABB2D
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 16:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391232AbfIFOkx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 10:40:53 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:43052 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729464AbfIFOkx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 10:40:53 -0400
X-Halon-ID: 413221c9-d0b4-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.84.18])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 413221c9-d0b4-11e9-837a-0050569116f7;
        Fri, 06 Sep 2019 16:40:25 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] rcar-vin: Add support for outputting NV12
Date:   Fri,  6 Sep 2019 16:40:27 +0200
Message-Id: <20190906144029.24080-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series adds support for storing captures in NV12 pixel format on 
most Gen3 SoCs. It is based on top of latest media-tree and tested on 
Gen2 and Gen3 with out any regressions.

Patch 1/2 prepares for the admonition of NV12 support by defining which 
Gen3 SoCs supports the output format. While patch 2/2 is the real change 
adding the format and register writes to deliver NV12.

Niklas Söderlund (2):
  rcar-vin: Define which hardware supports NV12
  rcar-vin: Add support for outputting NV12

 drivers/media/platform/rcar-vin/rcar-core.c |  6 ++++
 drivers/media/platform/rcar-vin/rcar-dma.c  |  5 ++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 39 +++++++++++++++++----
 drivers/media/platform/rcar-vin/rcar-vin.h  |  2 ++
 4 files changed, 45 insertions(+), 7 deletions(-)

-- 
2.23.0

