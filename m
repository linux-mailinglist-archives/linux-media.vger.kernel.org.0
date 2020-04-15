Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653331A9B3E
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 12:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896575AbgDOKp2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 06:45:28 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:31291 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2896462AbgDOKUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 06:20:08 -0400
X-IronPort-AV: E=Sophos;i="5.72,386,1580742000"; 
   d="scan'208";a="44575661"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Apr 2020 19:19:18 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0F1AE4004BB4;
        Wed, 15 Apr 2020 19:19:16 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/3] media: rcar-vin: Enable MEDIA_BUS_FMT_SRGGB8_1X8 format
Date:   Wed, 15 Apr 2020 11:19:05 +0100
Message-Id: <1586945948-11026-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This patch series adds support for MEDIA_BUS_FMT_SRGGB8_1X8 format for vin

Cheers,
--Prabhakar

Changed for v4:
* patch 1/3 is new patch which adds a check for conversion from input to
  output.
* patch 2/3 added a comment while setting VNIS_REG for RAW format as
  suggested by Niklas

Changes for v3:
* Dropped patch 1/1 from v2 as this handled neatly by patches
  https://patchwork.linuxtv.org/project/linux-media/list/?series=1974
* Included Ack from Niklas for patch 2/2
* Updated commit message for patch 1/1.

Changes for v2:
* Added support for matching fwnode against endpoints/nodes.
* Separated patch for rcar-vin and rcar-csi2.c which added
  MEDIA_BUS_FMT_SRGGB8_1X8.

Lad Prabhakar (3):
  media: rcar-vin: Invalidate pipeline if conversion is not possible on
    input formats
  media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format
  media: rcar-csi2: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format

 drivers/media/platform/rcar-vin/rcar-csi2.c |  1 +
 drivers/media/platform/rcar-vin/rcar-dma.c  | 21 +++++++++++++++++++--
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
 3 files changed, 24 insertions(+), 2 deletions(-)

-- 
2.20.1

