Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6D6CADD15
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 18:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389497AbfIIQZv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 12:25:51 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55388 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbfIIQZv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 12:25:51 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89GPnv3045109;
        Mon, 9 Sep 2019 11:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568046349;
        bh=qOaE43n59Xn9z85FENujisRAdEffat99mm+Z4EKhjCM=;
        h=From:To:CC:Subject:Date;
        b=HLl43lPrdDOu2pKKOE5dZryK1O88PrwirtOlAEXJ1u+ave5G/2/qkJzwnZp1mQUiA
         ev/dV7srXdN6dSX6ey2RDHyTh8BOqTjl35gVnwHEpiwtUDWw4ynyOysfOGgUib4QEr
         E9DwzVWHrgUD74ed8pSnMDe5rpX+RxxPbQy7ys1U=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89GPn62026721
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Sep 2019 11:25:49 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 11:25:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 11:25:49 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89GPnoO056522;
        Mon, 9 Sep 2019 11:25:49 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 00/13] media: am437x-vpfe: overdue maintenance
Date:   Mon, 9 Sep 2019 11:27:30 -0500
Message-ID: <20190909162743.30114-1-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series is a collection of patches we have been carrying for a
while.

A few patches do fix actual bug and v4l2-compliance errors/warnings.
Other are drivers re-work to simplify/clarify the code for easier
maintenance.

We also include the SPDX Licensing update which seemed to have been
missed by the global script thus far.

Benoit Parrot (12):
  media: am437x-vpfe: Fix missing first line
  media: am437x-vpfe: Rework ISR routine for clarity
  media: am437x-vpfe: Wait for end of frame before tear-down
  media: am437x-vpfe: Streamlined vb2 buffer cleanup
  media: am437x-vpfe: Setting STD to current value is not an error
  media: am437x-vpfe: Use a per instance format array instead of a
    static one
  media: am437x-vpfe: Maintain a reference to the current vpfe_fmt
  media: am437x-vpfe: fix function trace debug log
  media: am437x-vpfe: Remove print_fourcc helper
  media: am437x-vpfe: TRY_FMT ioctl is not really trying anything
  media: am437x-vpfe: Remove per bus width static data
  media: am437x-vpfe: Switch to SPDX Licensing

Dave Gerlach (1):
  media: am437x-vpfe: Fix suspend path to always handle pinctrl config

 drivers/media/platform/am437x/am437x-vpfe.c   | 906 ++++++++----------
 drivers/media/platform/am437x/am437x-vpfe.h   |  44 +-
 .../media/platform/am437x/am437x-vpfe_regs.h  |  10 +-
 3 files changed, 438 insertions(+), 522 deletions(-)

-- 
2.17.1

