Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2981417F5A7
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 12:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgCJLGk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 07:06:40 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:25631 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726271AbgCJLGk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 07:06:40 -0400
X-IronPort-AV: E=Sophos;i="5.70,536,1574089200"; 
   d="scan'208";a="41493382"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Mar 2020 20:06:38 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 521AD420C2EE;
        Tue, 10 Mar 2020 20:06:36 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] media: rcar-vin: Enable MEDIA_BUS_FMT_SRGGB8_1X8 format and support for matching fwnode against endpoints/nodes
Date:   Tue, 10 Mar 2020 11:06:01 +0000
Message-Id: <1583838364-12932-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

First patch of the series adds support for matching fwnode against
endpoints/nodes which are registered in v4l2-async and the later adds
supports for MEDIA_BUS_FMT_SRGGB8_1X8 format.

Changes for v2:
1: Added support for matching fwnode against endpoints/nodes.
2: Seperated patch for rcar-vin and rcar-csi2.c which added
   MEDIA_BUS_FMT_SRGGB8_1X8.

Lad Prabhakar (3):
  media: rcar-csi2: Add support to match fwnode against remote or parent
    port
  media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format
  media: rcar-vin: rcar-csi2: Add support for MEDIA_BUS_FMT_SRGGB8_1X8
    format

 drivers/media/platform/rcar-vin/rcar-core.c |  1 +
 drivers/media/platform/rcar-vin/rcar-csi2.c | 42 ++++++++++++++++++++++++++---
 drivers/media/platform/rcar-vin/rcar-dma.c  |  9 ++++++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 13 ++++++++-
 4 files changed, 60 insertions(+), 5 deletions(-)

-- 
2.7.4

