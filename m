Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2491723A385
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 13:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgHCLkG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 07:40:06 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:60719 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726394AbgHCLj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 07:39:56 -0400
X-IronPort-AV: E=Sophos;i="5.75,429,1589209200"; 
   d="scan'208";a="53529268"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Aug 2020 20:39:28 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8115442389C1;
        Mon,  3 Aug 2020 20:39:25 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] media: i2c: ov772x: Enable BT656 mode and test pattern support
Date:   Mon,  3 Aug 2020 12:39:10 +0100
Message-Id: <1596454753-13612-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series adds support for BT656 mode in the ov772x sensor
and also enables color bar test pattern control.

Cheers,
Prabhakar

Changes for v2:
* Updated DT bindings
* Driver defaults to parallel mode
* Fixed return type when endpoint parsing fails

Lad Prabhakar (3):
  dt-bindings: media: ov772x: Document endpoint properties
  media: i2c: ov772x: Add support for BT656 mode
  media: i2c: ov772x: Add test pattern control

 .../devicetree/bindings/media/i2c/ov772x.txt  | 16 +++++
 drivers/media/i2c/ov772x.c                    | 65 ++++++++++++++++++-
 include/media/i2c/ov772x.h                    |  1 +
 3 files changed, 81 insertions(+), 1 deletion(-)

-- 
2.17.1

